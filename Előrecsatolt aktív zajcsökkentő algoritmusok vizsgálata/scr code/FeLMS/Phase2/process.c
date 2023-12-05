#include "tt.h"
#include <stdlib.h>
#include "filt_num.h"	//szûrõ együtthatók méretének definíciója

// Place the audio processing algorith here. The input and output are given
// as unsigned integer pointers.
//100-as értékeken  voltak
//B = fir1(500-1,1000/24000);
//FID=fopen('coef_1.dat','w');fprintf(FID,'%f,\n',B);fclose(FID);
//B = firls(N-1, [0 5000 6e3 10e3 11e3 24e3]/(fs/2), [0 0 1 1 0 0]);
//FID=fopen('coef_2.dat','w');fprintf(FID,'%f,\n',B);fclose(FID);

#define ADC_TELJ (1162.154)

float memory[1] = {};
float state[N1_i] = {};

float buff_tmp[N_tmp] = {};
int i_tmp = 0;

#pragma align 4
float dm delayed[N2+1] = {};

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

//externals
//05.08
//#pragma align 4
extern float dm inputR[Ndec+1];
//#pragma align 4
extern float dm inputL[Ndec+1];
//#pragma align 4
extern float dm noiseN[Ndec+1];



#pragma optimize_for_speed
int i1 = 0;
int i2 = 0;
int i3 = 0;
int j;
int k;
int k_input;
int k_input_i;
int ix;


//04.26.
int m1 = 0;
int m1_i = 0;
int m1_id = N1_i-1 - delay;
int m2 = 0;
int m3 = 0;

int err2_ind = 0;
float err2_arr[N1_i+1] = {};

float out_2;
extern float out_1;
extern int i_dec;
extern float out_test1;



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
float inNoiseArray1[N1+1];
float inNoiseArray3[N3+1];

float inNoiseArray1_i[N1_i+1];

float inLdataArray_i[N1_i+1];

//minden mérési elrendezésnél újra kell tölteni A2.dat -ba az adatokat
float coefs_filter_1 [N1] = {
	#include "A2.dat"	// <------------------------------------------------------(FILE)
	};   // phase 1
float un1 [N1];
float mu1 = 0.05/N1;//0.0001;		// 0.0005 a good mu, fast and exact	//0.0001;	//0.00001/N1
float yn1 =0;
float err1 = 0;

float coefs_filter_1_i [N1_i] = {
	#include "A2_i.dat"	// <------------------------------------------------------(FILE)
	};
float mu1_i  = 0.5/N1_i;//0.0001;
float yn1_i  = 0;
float err1_i = 0;


float coefs_filter_2 [N2]; // phase 2
float un2 [N2];
float performance = 0;
int AD_bit = 24;
int FS = 1677715;
//(2^AD_bit) - 1
float lambda = 0.01;			//---------------------------------------------------------------------------------------------lambda
float beta = 1;
//float mu2 		= 0.00005;		//---------------------------------------------------------------------------------------------mu2
//float mu2def	= 0.00005;		//---------------------------------------------------------------------------------------------mu2
								//41-es szûrõ, 100 as mélység
									//sin: 0.00000001;	//elnyomás: -21.03 dB
									//zaj: 0.005;		//elnyomás: -13.21 dB
								//101-es szûrõ, 100-as mélység
									//sin: 0.00005;		
									//zaj: 0.01;
//float mu2_0 = 0.00001/2;			//---------------------------------------------------------------------------------------------mu2_0

// 0.0000001/N2;
float eLMS_mu_sin = 0.0001;
float eLMS_mu_whiteNoise = 0.006;

float mu2 		  = 0.006;
float mu2def	  = 0.006;
float mu2_0       = 0.00003;
//					0.00003
//impulses			0.000008
//float mu2_0 = 1;
float yn2 =0;
float err2 = 0;
float inputRfil_n = 0;
float inputRfil[N2+1];


//minden mérési elrendezésnél újra kell tölteni A3.dat -ba az adatokat
float coefs_filter_3 [N3] = {
	#include "A3.dat"	// <------------------------------------------------------(FILE)
	};
float mu3 = 0.05/N3;		// 0.0005 a good mu, fast and exact  mu3 = 0.0001;
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
	    	delayed[k] = 0;
	    }
	    
	    for(k=0; k<(N3+1);k++){
	    	yn2array[k] = 0;
	    	inNoiseArray3[k] = 0;
	    }
	    for(k=0; k<(N1_i+1);k++){
			inNoiseArray1_i[k] = 0;	 
			inLdataArray_i[k] = 0;       
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

   //05.08.
   
    
    
//	****************    ****************
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

		m1_i--;
		if (m1_i<0)
		{
			m1_i = N1_i-1;
		}
		
		m1_id--;
		if (m1_id<0)
		{
			m1_id = N1_i-1;
		}
		
		
	    //if((identFlag == 1) || (fxlmsFlag == 1) || (ident3Flag == 1))
	    //{
	    	inRdata	= conv_asm( coefs_dec, &(inputR[i_dec]), inputR, Ndec);
			inLdata	= conv_asm( coefs_dec, &(inputL[i_dec]), inputL, Ndec);
			inNoise = noise_n;
			inNoiseArray1[m1]     = inNoise;
			if (m1==0)
			{
			    inNoiseArray1[N1]     = inNoise;
			}
			inNoiseArray3[m3]     = inNoise;
			if (m3==0)
			{
			    inNoiseArray3[N3]     = inNoise;
			}
			
			inNoiseArray1_i[m1_i] = inNoise;
			if (m1_i==0)
			{
			    inNoiseArray1_i[N1_i] = inNoise;
			}
			inLdataArray_i [m1_i] = inLdata;
			if (m1_i==0)
			{
			    inLdataArray_i [N1_i] = inLdata;
			}
			out_2 = rightIn;
		//}


		i_tmp--;
		if (0>i_tmp)
		{
	 		i_tmp = N_tmp-1;  
		}
		
		int i_minus1 = i_tmp - 1;
	
		if (i_tmp == 0)			//Ha a tömb végén vagyunk, túlcímzés valósulna meg, és ezt gátoljuk meg
		{
			i_minus1 = N_tmp-1;
		}
	
		buff_tmp[i_tmp] = inLdata * inLdata; 
		performance = performance - (buff_tmp[i_minus1]/N_tmp) + (buff_tmp[i_tmp]/N_tmp);
		
//	****************    ^***************
   
    
    
//	   *******************************************  
//	   ****************   FxLMS   ****************
//	   *******************************************  
	

//	****************   Identification of A2 ****************

	if(identFlag == 1)				//sw1
	{
	    
		// A2
		/*
		yn1 = conv_asm( coefs_filter_1, &(inNoiseArray1[m1]), inNoiseArray1, N1);		//Na itt kell a szûrt noise
		err1 = inLdata - yn1;
		
		k = 0; 
		k_input = m1;
		for(k; k<(N1); k++)
		{  
		    coefs_filter_1[k] = coefs_filter_1[k] + mu1*err1*inNoiseArray1[k_input%N1];		    
		    k_input++;
		}*/	
		
		//---------------------------------------------------------------------------------------------------------------
		// A2_i
		yn1_i = conv_asm( coefs_filter_1_i, &(inLdataArray_i[m1_i]), inLdataArray_i, N1_i);
		err1_i = inNoiseArray1_i[(N1_i+m1_i+delay) % N1_i] - yn1_i;

		int k_i = 0; 
		k_input_i = m1_i;
		for(k_i; k_i<(N1_i); k_i++)
		{  
		    coefs_filter_1_i[k_i] = coefs_filter_1_i[k_i] + mu1_i*err1_i*inLdataArray_i[k_input_i%N1_i];		    
		    k_input_i++;
		}
		//---------------------------------------------------------------------------------------------------------------
		
		delayCtnrIdnet++;
		// ha nem szólunk bele, akkor 6-szor annyi ideig fut...
		if(delayCtnrIdnet == delayCtnrIdnetLimit/3)
		{
		    identFlag=0; 
		    delayCtnrIdnet=0;
			ident3Flag = 1;
			    
		}
	}
		
//	****************   Identification of A2^ ****************





//	****************   Identification of A3 ****************

	if(ident3Flag == 1){			//maybe it is automated,but I'll test it

	//LMS(coefs_filter_1_i,  N1_i, mu1_i, inNoiseArray1_i, m1_i, inNoiseArray1_i, (m1_i+delay)%N1_i, &yn1_i, &err1_i);
	
		yn3 = 0;
		yn3 = conv_asm( coefs_filter_3, &(inNoiseArray3[m3]), inNoiseArray3, N3);		//FIR
		err3 = inRdata - yn3;
		
		k = 0;
		k_input = m3;
		for(k; k<(N3); k++){  
		    coefs_filter_3[k] = coefs_filter_3[k] + mu3*err3*inNoiseArray3[k_input%N3];	    	
		    k_input++;
		}
		
		delayCtnrIdnet++;
		// ha nem szólunk bele, akkor 6-szor annyi ideig fut...
		if(delayCtnrIdnet == delayCtnrIdnetLimit/6){ident3Flag=0; delayCtnrIdnet=0;}
	}

//	****************   Identification of A3^ ****************	
	





//	****************   phase 2  ****************
	
	if(fxlmsFlag == 1){			//sw2
	
		yn2 = 0;

		input1R2[m1] = inRdata-yfila3;
		if(m1==0){
			input1R2[N1] = inRdata-yfila3;
		}
		
		input2R2[m2] = inRdata-yfila3;
		if(m2==0){
			input2R2[N2] = inRdata-yfila3;
		}
		
		//inputRfil_n = conv_asm( coefs_filter_1, &(input1R2[m1]), input1R2, N1);
		//inputRfil[m2] = inputRfil_n;
		inputRfil[m2] = input2R2[m2];
		if(m2==0){
			inputRfil[N2] = input2R2[m2];
		}
		yn2 = -(conv_asm( coefs_filter_2, &(input2R2[m2]), input2R2, N2));	//FxLMS		
		yn2array[m3] = yn2;
		if(m3==0){
			yn2array[N3] = yn2;
		}

		yfila3 = conv_asm( coefs_filter_3, &(yn2array[m3]), yn2array, N3);							
		err2 = inLdata;	// FxLMS
		
		err2_ind--;
		if (err2_ind < 0)
		{
			err2_ind = N1_i-1;
		}
		err2_arr[err2_ind] = err2;
		if (err2_ind == 0)
		{
		    err2_arr[N1_i] = err2;
		}
		float err2_new = conv_asm( coefs_filter_1_i, &(err2_arr[err2_ind]), err2_arr, N1_i);
		
		delayed[m2] = inputRfil[(m2+delay)%N2];
		
		k = 0;
		k_input = m2;
		
		//insert mu2_0
		mu2 = mu2_0 / (lambda + performance);
		
		//k = Nh-1;
		//for(k; 0<k; k--){
		for(k; k<N2; k++){
																		//Azért kell +N2 hogy ne legyen mínusz, a moduló értékén amúgy sem változtat
		    coefs_filter_2[k] = coefs_filter_2[k] + mu2*err2_new*delayed[(k_input)%N2];		//done
			k_input++;
		}	

	}
//	****************   phase 2^  ****************



//	****************   Switch  ****************

	if(identFlag == 1){			//sw1
		out_1 = inNoiseArray1[m1];
	}

	if(fxlmsFlag == 1){			// sw2
	    out_1 = yn2;
	}	
	if(ident3Flag == 1){			// automata
	    out_1 = inNoiseArray3[m3];
	}

	
//	   *******************************************  
//	   ****************   FxLMS^  ****************
//	   ******************************************* 
//	
	
//	   ****************   setup of outputs   **************** 


	 
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


