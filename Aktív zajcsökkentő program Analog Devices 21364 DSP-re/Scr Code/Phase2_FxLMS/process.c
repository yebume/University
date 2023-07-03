#include "tt.h"
#include <stdlib.h>

// Place the audio processing algorith here. The input and output are given
// as unsigned integer pointers.

#define N1 (100) // number of filter coefficients	//1300
#define N2 (100)
#define N3 (100)							//1300
// 04.20
#define Ndec (51)
//B = fir1(500-1,1000/24000);
//FID=fopen('coef_1.dat','w');fprintf(FID,'%f,\n',B);fclose(FID);
//B = firls(N-1, [0 5000 6e3 10e3 11e3 24e3]/(fs/2), [0 0 1 1 0 0]);
//FID=fopen('coef_2.dat','w');fprintf(FID,'%f,\n',B);fclose(FID);

#pragma align 4
float dm input1R[N1+1];
#pragma align 4
float dm input1L[N1+1];

#pragma align 4
float dm input2R[N2+1];
#pragma align 4
float dm input2L[N2+1];

#pragma align 4
float dm input3R[N3+1];
#pragma align 4
float dm input3L[N3+1];

#pragma align 4
float dm input1R2[N1+1];

#pragma align 4
float dm input2R2[N2+1];


//05.08
#pragma align 4
float dm inputR[Ndec+1];
#pragma align 4
float dm inputL[Ndec+1];
#pragma align 4
float dm noiseN[Ndec+1];



#pragma optimize_for_speed
int i1 = 0;
int i2 = 0;
int i3 = 0;
int j;
int k;
int k_input;
int ix;
float out_1;
float out_2;
// 04.20.
int l;
//04.26.
int m1 = 0;
int m2 = 0;
int m3 = 0;
int i_dec = 0;
float out_test1;
float out_test2;


int fxlmsFlag = 0;
int identFlag = 0;
int ident3Flag = 0;
int resetFlag = 1;

int delayCtnrLimit = 2500;
int delayCtnr=0;
int delayCtnr2=0;
int delayCtnr3=0;
int delayCtnr4=0;
int delayCtnr5=0;
int delayCtnrIdnet=0;
int delayCtnrIdnetLimit=500000;	//300000

int flagTest(int mask);
int readDAIpin(int mask);
void handle_LED(int led_value);
int led_value=0;

// 04.20
#pragma align 4
float pm coefs_dec[Ndec] = {
	#include "coef_dec.dat"
	};  
float dm inRdata;
float dm inLdata;
float dm inNoise;
float inNoiseArray1[N1];
float inNoiseArray3[N3];

float coefs_filter_1 [N1] /*= {
	#include "A2.dat"
	}*/;   // phase 1
float un1 [N1];
float mu1 = 0.0001;		// 0.0005 a good mu, fast and exact
float yn1 =0;
float err1 = 0;

float coefs_filter_2 [N2]; // phase 2
float un2 [N2];
float mu2 = 0.2;		//0.0001	//0.1 mûködik sin esetén de lassan
float mu2def = 0.2;				//0.25 mûködik sin esetén és nem kell rá soak várni
									//0.5 már pici eredmény gauss-on is c:
									//0.68
									//0.7
									//0.72
float yn2 =0;
float err2 = 0;
float inputRfil_n = 0;
float inputRfil[N2+1];

float coefs_filter_3 [N3]/* = {
	#include "A3.dat"
	}*/;
float mu3 = 0.0001;		// 0.0005 a good mu, fast and exact
float yn3 =0;
float err3 = 0;
float yfila3=0;
float yn2array [N3+1];
	
float noise1[N1+1];
float noise2[N2+1];
float noise3[N3+1];
float noise_n;
float noise[2000];
int noiseFlag = 0;

float RightInPrev=0;
float alpha=0.00001;

void process(void)
{
    
    //Set the Processing Active Semaphore before starting processing
    isProcessing = 1;

    
    setDAIproc();    
//   ****************   START of program   ****************  
	

	

//	   *******************************************  
//	   **************   Switches   ***************
//	   *******************************************     



	if(readDAIpin(1<<19)>0){		// sw4
	    led_value |= 1 << 3;
	} else{
	    led_value &= ~(1 << 3);
	}
	

	if(readDAIpin(1<<18)>0){		// sw3
	    led_value |= 1 << 2 ;
	} else{
	    led_value &= ~(1 << 2);
	}


	if(flagTest(FLG2)!=0){			// sw2
	    led_value |= 1 << 1;
	} else{
	    led_value &= ~(1 << 1);
	}


	if(flagTest(FLG1)!=0){			// sw1
	    led_value |= 1 << 0;
	} else{
	    led_value &= ~(1 << 0);
	}
	
	//pergesmentesetes
	if(flagTest(FLG2)!=0)	{delayCtnr++;}		//sw2
	if(flagTest(FLG1)!=0)	{delayCtnr2++;}		//sw1
	if(readDAIpin(1<<19)>0 && readDAIpin(1<<18)>0)	{delayCtnr3++;}		//sw1 + sw2
	if(readDAIpin(1<<19)>0)	{delayCtnr4++;}		//sw4
	if(readDAIpin(1<<18)>0)	{delayCtnr5++;}		//sw3
	
	//fxlms loop
	
	if(!(flagTest(FLG2)!=0) && delayCtnr >= delayCtnrLimit){			// sw2
	   	delayCtnr =0;
		if(fxlmsFlag == 0){fxlmsFlag = 1;}
	   	else {fxlmsFlag = 0;}
	}
	
	//identification loop 1
	if(!(flagTest(FLG1)!=0) && delayCtnr2 >= delayCtnrLimit){			// sw2
	   	delayCtnr2 =0;
		if(identFlag == 0){identFlag = 1;}
	   	else {identFlag = 0;}
	}
	
	
	//reset coefs_filter_2
	if(readDAIpin(1<<18)>0 && resetFlag == 1){		// sw3
	    fxlmsFlag = 0;
	    mu2 = mu2def;
	    inputRfil_n = 0;
	    yfila3 = 0;
	    err2 = 0;
	    for(k=0; k<N2;k++){
	    	coefs_filter_2[k] = 0;
	    }
	   	for(k=0; k<(N1+1);k++){
	    	input1R2[k] = 0;
	    	inNoiseArray1[k] = 0;
	    }
	    
	    for(k=0; k<(N2+1);k++){
	    	input2R2[k] = 0;
	    	inputRfil[k] = 0;
	    }
	    
	    for(k=0; k<(N3+1);k++){
	    	yn2array[k] = 0;
	    	inNoiseArray3[k] = 0;
	    }
	}
	
	//from reset to mu_set mode
	if(!(readDAIpin(1<<19)>0) && !(readDAIpin(1<<18)>0) && delayCtnr3 >= delayCtnrLimit){			// sw2 and sw1
	   	delayCtnr3 =0;
		if(resetFlag == 1){resetFlag = 0;}
	   	else {resetFlag = 1;}
	}
	
	//set mu up 2x
	if(resetFlag == 0 && !(readDAIpin(1<<19)>0) && delayCtnr4 >= delayCtnrLimit){			// sw4
	   	delayCtnr4 =0;
		mu2 = mu2*2;
	}
	
	//set mu down /2
	if(resetFlag == 0 && !(readDAIpin(1<<18)>0) && delayCtnr5 >= delayCtnrLimit){			// sw3
	   	delayCtnr5 =0;
		mu2 = mu2/2;
	}
	
	
	//reset mode: ligthes up, mu_set mode: lightes down (led:5,6,7,8)
	if(resetFlag == 1){			
	    led_value |= 1 << 4;
	    led_value |= 1 << 5;
	    led_value |= 1 << 6;
	    led_value |= 1 << 7;
	} 
	else{
	    led_value &= ~(1 << 4);
	    led_value &= ~(1 << 5);
	    led_value &= ~(1 << 6);
	    led_value &= ~(1 << 7);
	}
	
	// identification on: led on / identification off: led off (led: 1)
	if(identFlag == 1){			
	    led_value |= 1 << 0;
	} 
	else{
	    led_value &= ~(1 << 0);
	}
	
	// fxlms on: led on / fxlms off: led off (led: 2)
	if(fxlmsFlag == 1){			
	    led_value |= 1 << 1;
	} 
	else{
	    led_value &= ~(1 << 1);
	}
	
	// identificaton A3 on: led on / fxlms off: led off (led: 2)
	if(ident3Flag == 1){			
	    led_value |= 1 << 2;
	} 
	else{
	    led_value &= ~(1 << 2);
	}
	
	
	//04.20
	l--;
	if (l<0)
	{
		l = 5;
	}
	//if (l==0){
//	****************   noise generation  ****************
//	if(noiseFlag == 0){
		if((identFlag==1) || (ident3Flag==1)){
		    //for(k=0; k<2000;k++){
				noise_n = (float)(rand()<<1);
				noise_n = noise_n / (1<<31);
				//noise[k] = noise_n;
		    //}
			//noiseFlag = 1;
		}
//	}
//	****************   noise generation^ ****************
	//}
/*	 
    i1--;
	if (0>i1)
	{
		i1 = N1-1;
	}
	
	i2--;
	if (0>i2)
	{
		i2 = N2-1;
	}
	
	i3--;
	if (0>i3)
	{
		i3 = N3-1;
	}
*/	
	//05.08.
		i_dec--;
		if (0>i_dec)
		{
		i_dec = Ndec-1;
		}
		
	
	
	
	
	
	//DC to AC coupling
	rightIn = rightIn - RightInPrev;
	RightInPrev = alpha * rightIn + RightInPrev;
/*	 
	input1R[i1] = rightIn;
    input1L[i1] = leftIn;
    noise1[i1] = noise_n;
	
    if (0==i1){
   	    input1R[N1] = rightIn;  //vege=eleje
	    input1L[N1] =  leftIn;  //vege=eleje
	    noise1[N1] = noise_n;
    }
    //-----
   	input2R[i2] = rightIn;
    input2L[i2] = leftIn;
    noise2[i2] = noise_n;
	
    if (0==i2){
   	    input2R[N2] = rightIn;  //vege=eleje
	    input2L[N2] =  leftIn;  //vege=eleje
	    noise2[N2] = noise_n;
    }
    //-----
    input3R[i3] = rightIn;
    input3L[i3] = leftIn;
    noise3[i3] = noise_n;
	
    if (0==i3){
   	    input3R[N3] = rightIn;  //vege=eleje
	    input3L[N3] =  leftIn;  //vege=eleje
	    noise3[N3] = noise_n;
    }
   */
   
   
   //05.08.
   
   	inputR[i_dec] = rightIn;
   	inputL[i_dec] = leftIn;
   	noise1[i_dec] = noise_n;
	if (0==i1){
		inputR[Ndec] = rightIn;  //vege=eleje
		inputL[Ndec] =  leftIn;  //vege=eleje
		noiseN[Ndec] = noise_n;
    }
    
    
//	****************    ****************
	if (l==0)
	{
	    m1--;
		if (m1<0)
		{
			m1 = N1-1;
		}
		
		m2--;
		if (m2<0)
		{
			m2 = N2-1;
		}
		
		m3--;
		if (m3<0)
		{
			m3 = N3-1;
		}

		
		
					
	    //if((identFlag == 1) || (fxlmsFlag == 1) || (ident3Flag == 1))
	    //{
	    	inRdata	= conv_asm( coefs_dec, &(inputR[i_dec]), inputR, Ndec);
			inLdata	= conv_asm( coefs_dec, &(inputL[i_dec]), inputL, Ndec);
			inNoise	= conv_asm( coefs_dec, &(noiseN[i_dec]), noise1, Ndec);
			inNoiseArray1[m1] = inNoise;
			inNoiseArray3[m3] = inNoise;
		//}
	}
	out_test1 = conv_asm( coefs_dec, &(inputR[i_dec]), inputR, Ndec);
	

//	****************    ^***************
   
    
    
//	   *******************************************  
//	   ****************   FxLMS   ****************
//	   *******************************************  
	

//	****************   Identification of A2 ****************

	if((identFlag == 1) && (l==0)){			//sw1
	
		yn1 = 0;
		
		//yn1 = conv_asm( coefs_filter_1, &(noise1[i1]), noise1, N1);		//FIR
		//err1 = input1L[i1] - yn1; 
		
		yn1 = conv_asm( coefs_filter_1, &(inNoiseArray1[m1]), inNoiseArray1, N1);		//Na itt kell a szûrt noise
		err1 = inLdata - yn1;
		
		k = 0; 
		k_input = m1;
		for(k; k<(N1); k++){  
		    		    
		    //coefs_filter_1[k] = coefs_filter_1[k] + mu1*err1*noise1[k_input%N1];
		    coefs_filter_1[k] = coefs_filter_1[k] + mu1*err1*inNoiseArray1[k_input%N1];		    
		    k_input++;
		    
		}
		delayCtnrIdnet++;
		// ha nem szólunk bele, akkor 6-szor annyi ideig fut...
		if(delayCtnrIdnet == delayCtnrIdnetLimit/6){
		    identFlag=0; 
		    delayCtnrIdnet=0;
			ident3Flag = 1;    
		}
	}
		
//	****************   Identification of A2^ ****************





//	****************   Identification of A3 ****************

	if((ident3Flag == 1) && (l==0)){			//maybe it is automated,but I'll test it

		
		yn3 = 0;
		
		//yn3 = conv_asm( coefs_filter_3, &(noise3[i3]), noise3, N3);		//Na itt kellene a szûrt noise
		//err3 = input3R[i3] - yn3; 
		
		yn3 = conv_asm( coefs_filter_3, &(inNoiseArray3[m3]), inNoiseArray3, N3);		//FIR
		err3 = inRdata - yn3;
		
		k = 0;
		k_input = m3;
		for(k; k<(N3); k++){  
		    		    
		    //coefs_filter_3[k] = coefs_filter_3[k] + mu3*err3*noise3[k_input%N3];	
		    coefs_filter_3[k] = coefs_filter_3[k] + mu3*err3*inNoiseArray3[k_input%N3];	    	
		    k_input++;
		}
		
		delayCtnrIdnet++;
		// ha nem szólunk bele, akkor 6-szor annyi ideig fut...
		if(delayCtnrIdnet == delayCtnrIdnetLimit/6){ident3Flag=0; delayCtnrIdnet=0;}
	}

//	****************   Identification of A3^ ****************	
	





//	****************   phase 2  ****************
	
	if((fxlmsFlag == 1) && (l==0)){			//sw2
	
		yn2 = 0;

		input1R2[m1] = inRdata-yfila3;
		if(m1==0){
			input1R2[N1] = inRdata-yfila3;
		}
		
		input2R2[m2] = inRdata-yfila3;
		
		if(m2==0){
			input2R2[N2] = inRdata-yfila3;
		}
		
		inputRfil_n = conv_asm( coefs_filter_1, &(input1R2[m1]), input1R2, N1);		// done -> to filter the input with coefs_filter_1
		inputRfil[m2] = inputRfil_n;		//done
		if(m2==0){
			inputRfil[N2] = inputRfil_n;
		}
					
		yn2 = -(conv_asm( coefs_filter_2, &(input2R2[m2]), input2R2, N2));		//maybe i should fill the inputR with the A3 filtered values	
		
		yn2array[m3] = yn2;
		if(m3==0){
			yn2array[N3] = yn2;
		}

		yfila3 = conv_asm( coefs_filter_3, &(yn2array[m3]), yn2array, N3);				
				
		//err2 = input2L[i2];							
		err2 = inLdata;
		k = 0;
		k_input = m2;
		for(k; k<N2; k++){
		
		    coefs_filter_2[k] = coefs_filter_2[k] + mu2*err2*inputRfil[k_input%N2];		//done
			k_input++;
		}	

	}
//	****************   phase 2^  ****************



//	****************   Switch  ****************

if(l==0)
{	
	if(identFlag == 1){			//sw1
		//out_1 = noise1[i1];
		out_1 = inNoiseArray1[m1];
	}
}

	if(fxlmsFlag == 1){			// sw2
	    out_1 = yn2;
	}
if(l==0)	
	if(ident3Flag == 1){			// automata
	    //out_1 = noise3[i3];
	    out_1 = inNoiseArray3[m3];
	}

	
//	   *******************************************  
//	   ****************   FxLMS^  ****************
//	   ******************************************* 
//	
	
//	   ****************   setup of outputs   **************** 

	rightOut1 = out_1;  
	 leftOut1 = inRdata;	//out_1
	 
	rightOut2 = err1; 		
	 leftOut2 = out_test1;	//err1
	 
	rightOut3 = err3;
	 leftOut3 = err3;
	 
/*	rightOut4 = out_1*0.5;
	 leftOut4 = out_1*0.5;
*/      

	//   ****************   END of program   **************** 
    clrDAIproc();    
	handle_LED(led_value);
	
      //Clear the Processing Active Semaphore after processing is complete
    isProcessing = 0;
}

int flagTest(int mask){
        int tmpANC0;

        asm volatile(
                " %0 = flags;\n\t"
                : "=&d" (tmpANC0)
                :
                :
                );
return (   (tmpANC0&mask)    );

}



int readDAIpin(int mask){
int tmpR;

 	asm volatile(
 	     		"%0 = flags;\n\t"
 	     		: "=&F" (tmpR)
 	     		:
 	     		:
 	     		);

 	tmpR &= FLG14;
 	//return tmpR;
     return ((*pDAI_PIN_STAT)&mask);

}




void handle_LED(int led_value){
    *pPPCTL=0;

    *pIIPP=(int)&led_value;  //
    *pIMPP=1;
    *pICPP=1;
    *pEMPP=1;
    *pECPP=1;
    *pEIPP=0x400000;   //    *pEIPP=0x1400000;   is jó

    *pPPCTL=PPTRAN|PPBHC|PPDUR20|PPDEN|PPEN;
}


