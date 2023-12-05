///////////////////////////////////////////////////////////////////////////////////////
//NAME:     main.c (Block-based Talkthrough)
//DATE:     7/15/04
//PURPOSE:  Talkthrough framework for sending and receiving samples to the AD1835.
//
//USAGE:    This file contains the main routine calls functions to set up the talkthrough
//          routine.
//
////////////////////////////////////////////////////////////////////////////////////////
#include "tt.h"
#include <stdlib.h>
extern void process(void);

void SetupSPI1835 (void);
void DisableSPI1835 (void);
void Configure1835Register (int val);
unsigned int Get1835Register (int val);
void Init1835viaSPI(void);
void Init1835viaSPI_PowerDwn(void);

void main(void)
{
    



    	InitPLL ();
	//SetupIRQ12 () ;
	
	
    // Need to initialize DAI because the sport signals
     Init1835viaSPI_PowerDwn();
   // need to be routed
    InitSPORT();
    
    DAIsigInit();
    InitDAI();

    // This function will configure the codec on the kit
    Init1835viaSPI();

    // Finally setup the sport to receive / transmit the data

    interrupt (SIG_SP0,receive);
//    interrupt (SIG_IRQ1, Irq1ISR) ;
//    interrupt (SIG_IRQ2, Irq2ISR) ;

    // Be in infinite loop and do nothing until done.
    srand(0);
    while(1)
    {
         if(dataReady){
	     	dataReady = 0;	        
			process();
		}
    }
    
}


