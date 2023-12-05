///////////////////////////////////////////////////////////////////////////////////////
//NAME:     SPORTisr.c (Block-based Talkthrough)
//DATE:     7/15/04
//PURPOSE:  Talkthrough framework for sending and receiving samples to the AD1835.
//
//USAGE:    This file contains SPORT0 Interrupt Service Routine. Three buffers are used
//          for this example. One is filled by the ADC, another is sent to the DAC, and
//          the final buffer is processed. Each buffer rotates between these functions
//          upon each SP0 interrupt received.
///////////////////////////////////////////////////////////////////////////////////////
/*
   Here is the mapping between the SPORTS and the DACS
   ADC -> DSP  : SPORT0A : IIS
   DSP -> DAC1 : SPORT1A : IIS
   DSP -> DAC2 : SPORT1B : IIS
   DSP -> DAC3 : SPORT2A : IIS
   DSP -> DAC4 : SPORT2B : IIS
*/

//a fehér az a jobb oldali; a piros a bal oldali

/*
#define CYCLE_COUNT_START( cntr ) asm("r0 = emuclk; %0 = r0;": \
									"=k" (cntr):"d" (cntr): \
									"r0")
#define CYCLE_COUNT_STOP( cntr ) asm("r0 = emuclk; r1 = %1; r2 = 4; r0 = r0 - r2; r0 = r0 - r1; %0 = r0;" : \
						"=k" (cntr) : \
						"d" (cntr) : "r0", "r1")
*/

//ISR routine for audio codec without decimation

#include <stdio.h>
#include <cycle_count.h>
#include "tt.h"

//custom
#include <stdlib.h>
#include "filt_num.h"	//szûrõ együtthatók méretének definíciója

#define RIGHT  0
#define LEFT   1


//#define TOMB_X_MERET_ISR  100




float rightIn  , leftIn;
float rightOut1, leftOut1;
float rightOut2, leftOut2;
float rightOut3, leftOut3;
float rightOut4, leftOut4;




float rightInD  , leftInD;
float rightOut1D, leftOut1D;
float rightOut2D, leftOut2D;
float rightOut3D, leftOut3D;
float rightOut4D, leftOut4D;


int rightIn_i  , leftIn_i;
int rightOut1_i, leftOut1_i;
int rightOut2_i, leftOut2_i;
int rightOut3_i, leftOut3_i;
int rightOut4_i, leftOut4_i;


int mode1RegSPisr, mode1RegSPisr2;

//custom
float pm coefs_int[Nint] = {
	#include "coef_int.dat"
	};
float outArr[Nint] = {};
float interpol = 0;
	
	
#pragma align 4
float dm inputR[Ndec+1];
#pragma align 4
float dm inputL[Ndec+1];
#pragma align 4
float dm noiseN[Ndec+1];
float out_1;
float out_test1;

int l = 0;
int i_dec = 0;
int i_int = 0;


extern float noise_n;
extern float noise1[N1+1];
extern float RightInPrev;
extern float alpha;
extern float err1;
extern float err1_i;
extern float err3;
extern float inRdata;
extern float out_2;

extern int fxlmsFlag;
extern int identFlag;
extern int ident3Flag;
extern int resetFlag;




// Semaphore to indicate to the isr that the processing has not completed before the
// buffer will be overwritten.
int isProcessing=0;

int dataReady=0;


//LED haqndling 
//extern int LEDval;
//If the processing takes too long, the program will be stuck in this infinite loop.
void ProcessingTooLong(void)
{
    while(1);
}

#pragma optimize_for_speed

//channel check
bool channelCheck;

void receive(int sig_int)
{
//    if(isProcessing){  ProcessingTooLong();}


channelCheck = !!((*pDAI_PIN_STAT)&DAI_PB14);
//adó reg.-be írás

//if ( !channelCheck	){	
if ( channelCheck	){  //így kompatibilis a 4.0-s VisualDSP-vel
    #ifdef DAC2
        *pTXSP1B = rightOut2_i;
        *pTXSP1B = leftOut2_i;
    #endif
        
    #ifdef DAC3
        *pTXSP2A = rightOut3_i;
        *pTXSP2A = leftOut3_i;
    #endif
        
    #ifdef DAC4
        *pTXSP2B = rightOut4_i;
        *pTXSP2B = leftOut4_i;
    #endif    

    #ifdef DAC1
        *pTXSP1A = rightOut1_i;
        *pTXSP1A = leftOut1_i;
	#endif
	
} else {
    
    #ifdef DAC2
        *pTXSP1B = leftOut2_i;
        *pTXSP1B = rightOut2_i;
    #endif
        
    #ifdef DAC3
        *pTXSP2A = leftOut3_i;
        *pTXSP2A = rightOut3_i;
    #endif
        
    #ifdef DAC4
        *pTXSP2B = leftOut4_i;
        *pTXSP2B = rightOut4_i;
    #endif    

    #ifdef DAC1
        *pTXSP1A = leftOut1_i;
        *pTXSP1A = rightOut1_i;
	#endif
    
    
}


if (1==isProcessing	){
		asm volatile(
	     		"%0 = mode1;\n\t"
	     		: "=d" (mode1RegSPisr): :);//PEYEN
					}

if (0==isProcessing	){
		asm volatile(
	     		"%0 = mode1;\n\t"
	     		: "=d" (mode1RegSPisr2): :);//PEYEN
					}
        


					
					
if ( channelCheck	){   //így kompatibilis a 4.0-s VisualDSP-vel
//    		LEDval = LEDval&(~32);
	        rightIn_i = (int) Block_A[RIGHT];  
        	leftIn_i  = (int) Block_A[LEFT];  
} else{
//    		LEDval = LEDval|(32);
        	leftIn_i  = (int) Block_A[RIGHT];
 	        rightIn_i = (int) Block_A[LEFT];   
    
}       	
	
        	rightIn = (float)rightIn_i / (float)SCALE;        
        	leftIn  = (float)leftIn_i  / (float)SCALE; 					
			 

                     

	rightOut1D = rightOut1;                        
	 leftOut1D =  leftOut1;                        
	rightOut2D = rightOut2;                        
	 leftOut2D =  leftOut2;                        
	rightOut3D = rightOut3;                        
	 leftOut3D =  leftOut3;                        
	rightOut4D = rightOut4;                        
	 leftOut4D =  leftOut4;                        



//típuskonverzió és skálázás
        rightOut1_i = (unsigned int)(rightOut1D * SCALE);
        leftOut1_i  = (unsigned int)( leftOut1D * SCALE);
//        leftOut1_i = (unsigned int)  (leftOut1D * SCALE);
//        rightOut1_i  = (unsigned int)( rightOut1D * SCALE);

        rightOut2_i = (unsigned int)(rightOut2D * SCALE);
        leftOut2_i  = (unsigned int)( leftOut2D * SCALE);

        rightOut3_i = (unsigned int)(rightOut3D * SCALE);
        leftOut3_i  = (unsigned int)( leftOut3D * SCALE);

        rightOut4_i = (unsigned int)(rightOut4D * SCALE);
        leftOut4_i  = (unsigned int)( leftOut4D * SCALE);

        #define SATURATE(in,sat) if ((in)>(sat)) in = sat; if ((in)<(-sat)) in = -sat;	     		

	     SATURATE(rightOut1_i,0x007FFFFF);
	     SATURATE( leftOut1_i,0x007FFFFF);

//custom
	i_dec--;
	if (0>i_dec)
	{
		i_dec = Ndec-1;
	}

	i_int--;
	if (0>i_int)
	{
		i_int = Nint-1;
	}
	
	
	//DC to AC coupling
	rightIn = rightIn - RightInPrev;
	RightInPrev = alpha * rightIn + RightInPrev;
	
	inputL[i_dec] = leftIn;		// Hiba jel
   	inputR[i_dec] = rightIn;	// Referencia jel
   	
   	//noise1[i_dec] = noise_n;
	if (0==i_dec){
		inputR[Ndec] = rightIn;  //vege=eleje
		inputL[Ndec] =  leftIn;  //vege=eleje
		//noiseN[Ndec] = noise_n;
    }
    
    l--;
	if (l<0)
	{
		l = 5;
	}
	if (l == 0)
	{
		dataReady   = 1;	// mehet a feldolgozás
	}

	
	// Interpoláló szûrõ
	outArr[i_int] = out_1;
	interpol = conv_asm( coefs_int, &(outArr[i_int]), outArr, Nint);
		
	//rightOut1 = out_1;  	// beavatkozó hangszóró
	rightOut1 = interpol;	// Kimenet
	 leftOut1 = rightIn;	// Bemenet
	 
	rightOut2 = out_2; 		// minden 6
	 leftOut2 = inRdata;	// dec szûrõ kimenete
	 
	rightOut3 = err1;		// err 1
	leftOut3 = 	err3;		// err 2
	
	rightOut4 = err1_i;		// err 1_i
	leftOut4 = 	err1_i;		// err 1_i
  	
    	
//	handle_LED(LEDval);
                
    //process();

}
