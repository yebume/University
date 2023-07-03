///////////////////////////////////////////////////////////////////////////////////////
//NAME:     init1835viaSPI.c (Block-based Talkthrough)
//DATE:     9/03/04
//PURPOSE:  Talkthrough framework for sending and receiving samples to the AD1835.
//
//USAGE:    This file contains the subroutines for accessing the AD1835 control
//          registers via SPI.
//
////////////////////////////////////////////////////////////////////////////////////////
#include "tt.h"
#include "ad1835.h"

void SetupSPI1835 (void);
void DisableSPI1835 (void);
void Configure1835Register (int val);
unsigned int Get1835Register (int val);
void Init1835viaSPI(void);
void Init1835viaSPI_PowerDwn(void);


/* Setup the SPI pramaters here in a buffer first */
unsigned int Config1835Param [] = {
            WR | DACCTRL1 | DACI2S | DAC24BIT | DACFS48,
            WR | DACCTRL2 ,//| DACMUTE_R4 | DACMUTE_L4,
            WR | DACVOL_L1 | DACVOL_MAX,
            WR | DACVOL_R1 | DACVOL_MAX,
            WR | DACVOL_L2 | DACVOL_MAX,
            WR | DACVOL_R2 | DACVOL_MAX,
            WR | DACVOL_L3 | DACVOL_MAX,
            WR | DACVOL_R3 | DACVOL_MAX,
            WR | DACVOL_L4 | DACVOL_MAX,
            WR | DACVOL_R4 | DACVOL_MAX,
            WR | ADCCTRL1 | ADCFS48,
            WR | ADCCTRL2 | ADCI2S | ADC24BIT,
            WR | ADCCTRL3 | IMCLKx2
        } ;

unsigned int Config1835ParamPowerDwn [] = {
            WR | DACCTRL1 | DACPOWERDN,
            WR | ADCCTRL1 | ADCPOWERDN,
        } ;
        
volatile int spiFlag ;

//Set up the SPI port to access the AD1835
void SetupSPI1835 (void)
{
    /* First configure the SPI Control registers */
    /* First clear a few registers     */
    *pSPICTL = (TXFLSH | RXFLSH) ;
    *pSPIFLG = 0;

    /* Setup the baud rate to 1MHz */
    *pSPIBAUD = 100;

    /* Setup the SPI Flag register to FLAG3 : 0xF708*/
    *pSPIFLG = 0xF708;

    /* Now setup the SPI Control register : 0x5281*/
    *pSPICTL = (SPIEN | SPIMS | MSBF | WL16 | TIMOD1) ;

}

//Disable the SPI Port
void DisableSPI1835 (void)
{
    *pSPICTL = (TXFLSH | RXFLSH);
}

//Send a word to the AD1835 via SPI
void Configure1835Register (int val)
{
    *pTXSPI = val ;
    Delay(100);

    //Wait for the SPI to indicate that it has finished.
    while (1)
    {
        if (*pSPISTAT & SPIF)
            break ;
    }
    Delay (100) ;
}

//Receive a register setting from the AD1835
unsigned int Get1835Register (int val)
{
    *pTXSPI = val ;
    Delay(100);

    //Wait for the SPI port to indicate that it has finished
    while (1)
    {
        if (SPIF & *pSPISTAT)
            break ;
    }
    Delay (100) ;
    return *pRXSPI ;
//  return i ;
}

//Set up all AD1835 registers via SPI
void Init1835viaSPI(void)
{
    int configSize = sizeof (Config1835Param) / sizeof (int) ;
    int i ;

    SetupSPI1835 () ;

    for (i = 0; i < configSize; ++i)
    {
        Configure1835Register (Config1835Param[i]) ;
    }

    DisableSPI1835 () ;

}

//Set up all AD1835 registers via SPI
void Init1835viaSPI_PowerDwn(void)
{
    int configSize = sizeof (Config1835Param) / sizeof (int) ;
    int i ;

    SetupSPI1835 () ;

    for (i = 0; i < configSize; ++i)
    {
        Configure1835Register (Config1835ParamPowerDwn[i]) ;
    }

    DisableSPI1835 () ;

}


//Delay loop
void Delay (int i)
{
    for (;i>0;--i)
        asm ("nop;") ;
}
