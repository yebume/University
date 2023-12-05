// ********************************************************	//
// ASSEMBLY FUNCTION                          			    //
// Készítette: Orosz György                                 //
//												   			//
//                                                 			// 
//                                                 			// 
// Declaration:												//
// extern float conv( float * coef, float * inCur, float * inBase, unsigned int bufSize);	//
// 						r4				r8			r12				stack									//
// Usage:													//	
// out = conv(coefs,&input[i],input,bufSize);			    //
//                                                          //
//Vigyázat!!! Az átadott puffer méretének a hasznos         //
//méretnél(bufSzize) eggyel nagyobbnak kell lennie, és az   //
//utolsó ("haszontalan") elemének meg kell egyeznie         //
//az elsõ elemmel.                                          //
//********************************************************	//

#include <asm_sprt.h>
#include <def21364.h>

.SECTION/PM seg_pmda;

.var mode1Ment;


.SECTION/PM seg_pmco;
.global _conv_asm;


_conv_asm:

leaf_entry;


r0 = mode1;
pm(mode1Ment) = r0;



	bit set MODE1 CBUFEN;				// Circular Buffer Enable, one cycle effect latency 
	bit set MODE1 PEYEN;				// SIMD Mode Enable, one cycle effect latency 

m4  = 2;  //mert SIMD módban 2-t kell lépni, a másik automatikus
m12 = 2;  //mert SIMD módban 2-t kell lépni, a másik automatikus

r2 = reads(1); //bufSize paraméter elõvétele
//i4 : bemenet, i12: coef
b12 = r4;
l12 = r2;

b4 = r12;
l4 = r2;
i4 = r8;
  
 
 
 		f8 = 0.0;	
		f12 = 0.0;
		f0 = dm(i4,m4) , f4 = pm(i12,m12); //f0=x(n), f4=w0
		
		r2 = ashift r2 by -1;
		r2 = r2 - 1; //hossz-1, mivel egyszer kinn kell
		lcntr = r2, do convLoop until lce;
convLoop:	f12 = f0 * f4,	f8 = f8 + f12, f0 = dm(i4,m4), f4 = pm(i12,m12);
	   	f12 = f0 * f4,	f8 = f8 + f12;
		f8 = f8 + f12;
		
		f0 = s8;
		f0 = f0 + f8;




//bit clr mode1 0x0200000; nop; // exit SIMD mode
r2 = pm(mode1Ment);
mode1 = r2;
l12 = 0;
l4  = 0;

leaf_exit;

_conv_asm.end: nop;


