	.file "IRQprocess.c";

//  Compilation time: Mon Nov 20 17:28:54 2023


//  Compiler options: -c -file-attr ProjectName=FxLMS_with_A3_interpol -O -Ov100 -g -save-temps -path-output Debug -ED -no-multiline -double-size-32 -flags-compiler --diag_warning,implicit_func_decl -warn-protos -force-circbuf -proc ADSP-21364 -o Debug\IRQprocess.doj -MM

//  Architecture: ADSP-21364

//  Silicon revision: 0.2

	.section/pm/DOUBLE32 seg_pmco;

.epctext:
_SetupIRQ12:
.LN_SetupIRQ12:
//-------------------------------------------------------------------
//   Procedure statistics:
//
//   Frame size            = 2 words
//
//   Scratch registers used:{r0-r2,r12,i4,i12,acc}
//
//   No call preserved registers used.
//-------------------------------------------------------------------
// line "IRQprocess.c":23
	modify(i7,-2); 
// Diagnostic: Optimizer now disabled
.LN1:
// line 25
	r2=196644; 
	i4=r2; 
	r1=dm(m5,i4); 
	r12=393216; 
	r0=r1 or r12; 
	i4=r2; 
	dm(m5,i4)=r0; 
.LN2:
// line 26
		#include <def21364.h>
.LN3:
// line 28
		bit set mode2 IRQ1E;
.LN4:
// line 29
		bit set mode2 IRQ2E;
.LN5:
// line 30
	jump(pc,.P1L2147483647); 

.P1L2147483647:
	i12=dm(m7,i6); 
	jump(m14,i12)(DB); rframe; nop; 

.LN._SetupIRQ12.end:
._SetupIRQ12.end:
	.global _SetupIRQ12;
	.type _SetupIRQ12,STT_FUNC;

_Irq1ISR:
.LN_Irq1ISR:
//-------------------------------------------------------------------
//   Procedure statistics:
//
//   Frame size            = 4 words
//
//   Scratch registers used:{r0-r2,r4,r8,r12,i12,acc}
//
//   No call preserved registers used.
//
//   Registers clobbered by function calls:{r0-r2,r4,r8,r12,i4,i12-i13,b4,b12-b13,m4,m12,s0-s15,ustat1-ustat4,acc,mcc,scc,btf,lcntr,smrf,smrb,sacc,smcc,sscc,sbtf}
//-------------------------------------------------------------------
// line "IRQprocess.c":33
	modify(i7,-4); 
	dm(-2,i6)=r4; 
// Diagnostic: Optimizer now disabled
.LN6:
// line 37
	cjump _SetupSPI1835 (DB); dm(i7,m7)=r2; dm(i7,m7)=pc; 
.LN7:
// line 38
	r4=34816; 
	cjump _Get1835Register (DB); dm(i7,m7)=r2; dm(i7,m7)=pc; 
.LN8:
	dm(-4,i6)=r0; 
.LN9:
// line 39
	r4=38912; 
	cjump _Get1835Register (DB); dm(i7,m7)=r2; dm(i7,m7)=pc; 
.LN10:
	dm(-3,i6)=r0; 
.LN11:
// line 42
	r2=dm(-4,i6); 
	r12=-63; 
	r1=r2+r12; 
	dm(-4,i6)=r1; 
.LN12:
// line 43
	r8=r0+r12; 
	dm(-3,i6)=r8; 
.LN13:
// line 45
	r1=pass r1; 
	if le jump(pc,.P2L3); 
.LN14:
// line 46
	r2=32768; 
	r4=r1 or r2; 
.LN15:
	cjump _Configure1835Register (DB); dm(i7,m7)=r2; dm(i7,m7)=pc; 

.P2L3:
.LN16:
// line 48
	r2=dm(-3,i6); 
	r2=pass r2; 
	if le jump(pc,.P2L6); 
.LN17:
// line 49
	r0=36864; 
	r4=r2 or r0; 
.LN18:
	cjump _Configure1835Register (DB); dm(i7,m7)=r2; dm(i7,m7)=pc; 

.P2L6:
.LN19:
// line 51
	cjump _DisableSPI1835 (DB); dm(i7,m7)=r2; dm(i7,m7)=pc; 
.LN20:
// line 52
	jump(pc,.P2L2147483646); 

.P2L2147483646:
	i12=dm(m7,i6); 
	jump(m14,i12)(DB); rframe; nop; 

.LN._Irq1ISR.end:
._Irq1ISR.end:
	.global _Irq1ISR;
	.type _Irq1ISR,STT_FUNC;

_Irq2ISR:
.LN_Irq2ISR:
//-------------------------------------------------------------------
//   Procedure statistics:
//
//   Frame size            = 4 words
//
//   Scratch registers used:{r0-r2,r4,r8,r12,i12,acc}
//
//   No call preserved registers used.
//
//   Registers clobbered by function calls:{r0-r2,r4,r8,r12,i4,i12-i13,b4,b12-b13,m4,m12,s0-s15,ustat1-ustat4,acc,mcc,scc,btf,lcntr,smrf,smrb,sacc,smcc,sscc,sbtf}
//-------------------------------------------------------------------
// line "IRQprocess.c":55
	modify(i7,-4); 
	dm(-2,i6)=r4; 
// Diagnostic: Optimizer now disabled
.LN21:
// line 60
	cjump _SetupSPI1835 (DB); dm(i7,m7)=r2; dm(i7,m7)=pc; 
.LN22:
// line 61
	r4=34816; 
	cjump _Get1835Register (DB); dm(i7,m7)=r2; dm(i7,m7)=pc; 
.LN23:
	dm(-4,i6)=r0; 
.LN24:
// line 62
	r4=38912; 
	cjump _Get1835Register (DB); dm(i7,m7)=r2; dm(i7,m7)=pc; 
.LN25:
	dm(-3,i6)=r0; 
.LN26:
// line 65
	r2=dm(-4,i6); 
	r12=63; 
	r1=r2+r12; 
	dm(-4,i6)=r1; 
.LN27:
// line 66
	r8=r0+r12; 
	dm(-3,i6)=r8; 
.LN28:
// line 68
	r4=1023; 
	comp(r1, r4); 
	if ge jump(pc,.P3L3); 
.LN29:
// line 69
	r0=32768; 
	r4=r1 or r0; 
.LN30:
	cjump _Configure1835Register (DB); dm(i7,m7)=r2; dm(i7,m7)=pc; 

.P3L3:
.LN31:
// line 71
	r2=dm(-3,i6); 
	r1=1023; 
	comp(r2, r1); 
	if ge jump(pc,.P3L6); 
.LN32:
// line 72
	r12=36864; 
	r4=r2 or r12; 
.LN33:
	cjump _Configure1835Register (DB); dm(i7,m7)=r2; dm(i7,m7)=pc; 

.P3L6:
.LN34:
// line 74
	cjump _DisableSPI1835 (DB); dm(i7,m7)=r2; dm(i7,m7)=pc; 
.LN35:
// line 75
	jump(pc,.P3L2147483645); 

.P3L2147483645:
	i12=dm(m7,i6); 
	jump(m14,i12)(DB); rframe; nop; 

.LN._Irq2ISR.end:
._Irq2ISR.end:
	.global _Irq2ISR;
	.type _Irq2ISR,STT_FUNC;

	.file_attr ProjectName="FxLMS_with_A3_interpol";
	.file_attr FuncName="_SetupIRQ12";
	.file_attr FuncName="_Irq1ISR";
	.file_attr FuncName="_Irq2ISR";
	.file_attr Content="Code";
.epctext.end:

	.extern _SetupSPI1835;
	.type _SetupSPI1835,STT_FUNC;
	.extern _Get1835Register;
	.type _Get1835Register,STT_FUNC;
	.extern _Configure1835Register;
	.type _Configure1835Register,STT_FUNC;
	.extern _DisableSPI1835;
	.type _DisableSPI1835,STT_FUNC;

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.var =
		0x01,0x11,0x01,0x03,0x08,0x13,0x0B,0x10,0x06,0x43,0x06,0x1B,
		0x08,0x25,0x08,0x42,0x0B,0x00,0x00,0x02,0x24,0x00,0x03,0x08,
		0x3E,0x0B,0x0B,0x0F,0x00,0x00,0x03,0x16,0x00,0x03,0x08,0x32,
		0x0B,0x49,0x13,0x00,0x00,0x04,0x2E,0x01,0x01,0x13,0x03,0x08,
		0x32,0x0B,0x11,0x01,0x12,0x01,0x27,0x0C,0x3F,0x0C,0x20,0x0B,
		0x00,0x00,0x05,0x0B,0x01,0x01,0x13,0x11,0x01,0x12,0x01,0x00,
		0x00,0x06,0x05,0x00,0x03,0x08,0x49,0x13,0x02,0x09,0x34,0x0C,
		0x00,0x00,0x07,0x34,0x00,0x03,0x08,0x32,0x0B,0x49,0x13,0x02,
		0x09,0x2C,0x06,0x3F,0x0C,0x00,0x00,0x00;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.var =
		0x1E,0x03,0x00,0x00,0x02,0x00;
	.var = .epcabbrev;
	.var =
		0x04,0x01,0x49,0x52,0x51,0x70,0x72,0x6F,0x63,0x65,0x73,0x73,
		0x2E,0x63,0x00,0x01;
	.var = .epcline;
	.var =
		0x00,0x00,0x00,0x00,0x45,0x3A,0x5C,0x4A,0x61,0x6B,0x61,0x62,
		0x5F,0x54,0x61,0x6D,0x61,0x73,0x5C,0x53,0x7A,0x61,0x6B,0x64,
		0x6F,0x6C,0x67,0x6F,0x7A,0x61,0x74,0x5C,0x32,0x33,0x2E,0x30,
		0x35,0x2E,0x33,0x31,0x5C,0x50,0x68,0x61,0x73,0x65,0x32,0x5F,
		0x46,0x78,0x4C,0x4D,0x53,0x00,0x43,0x2F,0x43,0x2B,0x2B,0x20,
		0x43,0x6F,0x6D,0x70,0x69,0x6C,0x65,0x72,0x20,0x3A,0x20,0x53,
		0x48,0x41,0x52,0x43,0x20,0x76,0x65,0x72,0x73,0x69,0x6F,0x6E,
		0x20,0x37,0x2E,0x32,0x2E,0x30,0x2E,0x30,0x20,0x28,0x4D,0x61,
		0x79,0x20,0x20,0x31,0x20,0x32,0x30,0x30,0x36,0x20,0x32,0x33,
		0x3A,0x31,0x36,0x3A,0x34,0x31,0x29,0x0A,0x20,0x20,0x43,0x6F,
		0x70,0x79,0x72,0x69,0x67,0x68,0x74,0x20,0x28,0x63,0x29,0x20,
		0x31,0x39,0x39,0x37,0x2D,0x32,0x30,0x30,0x36,0x20,0x41,0x6E,
		0x61,0x6C,0x6F,0x67,0x20,0x44,0x65,0x76,0x69,0x63,0x65,0x73,
		0x2C,0x20,0x49,0x6E,0x63,0x2E,0x0A,0x20,0x20,0x43,0x6F,0x70,
		0x79,0x72,0x69,0x67,0x68,0x74,0x20,0x28,0x63,0x29,0x20,0x31,
		0x39,0x39,0x38,0x2D,0x32,0x30,0x30,0x33,0x20,0x45,0x64,0x69,
		0x73,0x6F,0x6E,0x20,0x44,0x65,0x73,0x69,0x67,0x6E,0x20,0x47,
		0x72,0x6F,0x75,0x70,0x2C,0x20,0x49,0x6E,0x63,0x2E,0x0A,0x20,
		0x20,0x43,0x6F,0x70,0x79,0x72,0x69,0x67,0x68,0x74,0x20,0x28,
		0x63,0x29,0x20,0x31,0x39,0x39,0x37,0x2D,0x31,0x39,0x39,0x39,
		0x20,0x45,0x64,0x69,0x6E,0x62,0x75,0x72,0x67,0x68,0x20,0x50,
		0x6F,0x72,0x74,0x61,0x62,0x6C,0x65,0x20,0x43,0x6F,0x6D,0x70,
		0x69,0x6C,0x65,0x72,0x73,0x2C,0x20,0x4C,0x74,0x64,0x2E,0x0A,
		0x00,0x00,0x02,0x62,0x6F,0x6F,0x6C,0x00,0x02,0x01,0x02,0x77,
		0x63,0x68,0x61,0x72,0x5F,0x74,0x00,0x06,0x01,0x02,0x63,0x68,
		0x61,0x72,0x00,0x06,0x01,0x02,0x73,0x69,0x67,0x6E,0x65,0x64,
		0x20,0x63,0x68,0x61,0x72,0x00,0x06,0x01,0x02,0x75,0x6E,0x73,
		0x69,0x67,0x6E,0x65,0x64,0x20,0x63,0x68,0x61,0x72,0x00,0x08,
		0x01,0x02,0x73,0x68,0x6F,0x72,0x74,0x00,0x05,0x01,0x02,0x73,
		0x69,0x67,0x6E,0x65,0x64,0x20,0x73,0x68,0x6F,0x72,0x74,0x00,
		0x05,0x01,0x02,0x75,0x6E,0x73,0x69,0x67,0x6E,0x65,0x64,0x20,
		0x73,0x68,0x6F,0x72,0x74,0x00,0x07,0x01,0x02,0x69,0x6E,0x74,
		0x00,0x05,0x01,0x02,0x73,0x69,0x67,0x6E,0x65,0x64,0x20,0x69,
		0x6E,0x74,0x00,0x05,0x01,0x02,0x75,0x6E,0x73,0x69,0x67,0x6E,
		0x65,0x64,0x20,0x69,0x6E,0x74,0x00,0x07,0x01,0x02,0x6C,0x6F,
		0x6E,0x67,0x00,0x05,0x01,0x02,0x73,0x69,0x67,0x6E,0x65,0x64,
		0x20,0x6C,0x6F,0x6E,0x67,0x00,0x05,0x01,0x02,0x75,0x6E,0x73,
		0x69,0x67,0x6E,0x65,0x64,0x20,0x6C,0x6F,0x6E,0x67,0x00,0x07,
		0x01,0x02,0x66,0x6C,0x6F,0x61,0x74,0x00,0x04,0x01,0x02,0x64,
		0x6F,0x75,0x62,0x6C,0x65,0x00,0x04,0x01,0x02,0x6C,0x6F,0x6E,
		0x67,0x20,0x64,0x6F,0x75,0x62,0x6C,0x65,0x00,0x04,0x02,0x02,
		0x76,0x6F,0x69,0x64,0x20,0x2A,0x00,0x01,0x01,0x03,0x73,0x69,
		0x67,0x5F,0x61,0x74,0x6F,0x6D,0x69,0x63,0x5F,0x74,0x00,0x01,
		0x9A,0x01,0x00,0x00,0x04,0x51,0x02,0x00,0x00,0x53,0x65,0x74,
		0x75,0x70,0x49,0x52,0x51,0x31,0x32,0x00,0x01;
	.var = .LN_SetupIRQ12;
	.var = .LN._SetupIRQ12.end;
	.var =
		0x00,0x01,0x00,0x05,0x00,0x00,0x00,0x00;
	.var = .LN1;
	.var = .LN._SetupIRQ12.end;
	.var =
		0x00,0x00,0x04,0xB9,0x02,0x00,0x00,0x49,0x72,0x71,0x31,0x49,
		0x53,0x52,0x00,0x01;
	.var = .LN_Irq1ISR;
	.var = .LN._Irq1ISR.end;
	.var =
		0x01,0x01,0x00,0x06,0x69,0x00,0x9A,0x01,0x00,0x00,0x02,0x86,
		0x7E,0x00,0x05,0x00,0x00,0x00,0x00;
	.var = .LN6;
	.var = .LN._Irq1ISR.end;
	.var =
		0x07,0x6C,0x65,0x66,0x74,0x44,0x41,0x43,0x34,0x56,0x6F,0x6C,
		0x00,0x01,0x9A,0x01,0x00,0x00,0x02,0x86,0x7C,0x00,0x00,0x00,
		0x00,0x00,0x07,0x72,0x69,0x67,0x68,0x74,0x44,0x41,0x43,0x34,
		0x56,0x6F,0x6C,0x00,0x01,0x9A,0x01,0x00,0x00,0x02,0x86,0x7D,
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x00,
		0x49,0x72,0x71,0x32,0x49,0x53,0x52,0x00,0x01;
	.var = .LN_Irq2ISR;
	.var = .LN._Irq2ISR.end;
	.var =
		0x01,0x01,0x00,0x06,0x69,0x00,0x9A,0x01,0x00,0x00,0x02,0x86,
		0x7E,0x00,0x05,0x00,0x00,0x00,0x00;
	.var = .LN21;
	.var = .LN._Irq2ISR.end;
	.var =
		0x07,0x6C,0x65,0x66,0x74,0x44,0x41,0x43,0x34,0x56,0x6F,0x6C,
		0x00,0x01,0x9A,0x01,0x00,0x00,0x02,0x86,0x7C,0x00,0x00,0x00,
		0x00,0x00,0x07,0x72,0x69,0x67,0x68,0x74,0x44,0x41,0x43,0x34,
		0x56,0x6F,0x6C,0x00,0x01,0x9A,0x01,0x00,0x00,0x02,0x86,0x7D,
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.var =
		0xA0,0x03,0x00,0x00,0x02,0x00,0x0C,0x02,0x00,0x00,0x01,0x01,
		0x01,0xF6,0x0A,0x00,0x01,0x01,0x01,0x01,0x00,0x00,0x00,0x01,
		0x43,0x3A,0x5C,0x50,0x72,0x6F,0x67,0x72,0x61,0x6D,0x20,0x46,
		0x69,0x6C,0x65,0x73,0x5C,0x41,0x6E,0x61,0x6C,0x6F,0x67,0x20,
		0x44,0x65,0x76,0x69,0x63,0x65,0x73,0x5C,0x56,0x69,0x73,0x75,
		0x61,0x6C,0x44,0x53,0x50,0x20,0x34,0x2E,0x35,0x5C,0x32,0x31,
		0x33,0x78,0x78,0x5C,0x69,0x6E,0x63,0x6C,0x75,0x64,0x65,0x00,
		0x00,0x49,0x52,0x51,0x70,0x72,0x6F,0x63,0x65,0x73,0x73,0x2E,
		0x63,0x00,0x00,0x86,0xFD,0xBE,0xD1,0x04,0xCA,0x11,0x74,0x74,
		0x2E,0x68,0x00,0x00,0xA0,0xD9,0x84,0x93,0x06,0xAC,0x0F,0x43,
		0x3A,0x5C,0x50,0x72,0x6F,0x67,0x72,0x61,0x6D,0x20,0x46,0x69,
		0x6C,0x65,0x73,0x5C,0x41,0x6E,0x61,0x6C,0x6F,0x67,0x20,0x44,
		0x65,0x76,0x69,0x63,0x65,0x73,0x5C,0x56,0x69,0x73,0x75,0x61,
		0x6C,0x44,0x53,0x50,0x20,0x34,0x2E,0x35,0x5C,0x32,0x31,0x33,
		0x78,0x78,0x5C,0x69,0x6E,0x63,0x6C,0x75,0x64,0x65,0x5C,0x63,
		0x64,0x65,0x66,0x32,0x31,0x33,0x36,0x34,0x2E,0x68,0x00,0x01,
		0xC2,0xC4,0xD8,0xA3,0x04,0xAF,0x04,0x43,0x3A,0x5C,0x50,0x72,
		0x6F,0x67,0x72,0x61,0x6D,0x20,0x46,0x69,0x6C,0x65,0x73,0x5C,
		0x41,0x6E,0x61,0x6C,0x6F,0x67,0x20,0x44,0x65,0x76,0x69,0x63,
		0x65,0x73,0x5C,0x56,0x69,0x73,0x75,0x61,0x6C,0x44,0x53,0x50,
		0x20,0x34,0x2E,0x35,0x5C,0x32,0x31,0x33,0x78,0x78,0x5C,0x69,
		0x6E,0x63,0x6C,0x75,0x64,0x65,0x5C,0x43,0x64,0x65,0x66,0x32,
		0x31,0x33,0x36,0x33,0x2E,0x68,0x00,0x01,0xC2,0xC4,0xD8,0xA3,
		0x04,0x84,0xA9,0x02,0x43,0x3A,0x5C,0x50,0x72,0x6F,0x67,0x72,
		0x61,0x6D,0x20,0x46,0x69,0x6C,0x65,0x73,0x5C,0x41,0x6E,0x61,
		0x6C,0x6F,0x67,0x20,0x44,0x65,0x76,0x69,0x63,0x65,0x73,0x5C,
		0x56,0x69,0x73,0x75,0x61,0x6C,0x44,0x53,0x50,0x20,0x34,0x2E,
		0x35,0x5C,0x32,0x31,0x33,0x78,0x78,0x5C,0x69,0x6E,0x63,0x6C,
		0x75,0x64,0x65,0x5C,0x64,0x65,0x66,0x32,0x31,0x33,0x36,0x34,
		0x2E,0x68,0x00,0x01,0xC2,0xC4,0xD8,0xA3,0x04,0xD6,0x04,0x43,
		0x3A,0x5C,0x50,0x72,0x6F,0x67,0x72,0x61,0x6D,0x20,0x46,0x69,
		0x6C,0x65,0x73,0x5C,0x41,0x6E,0x61,0x6C,0x6F,0x67,0x20,0x44,
		0x65,0x76,0x69,0x63,0x65,0x73,0x5C,0x56,0x69,0x73,0x75,0x61,
		0x6C,0x44,0x53,0x50,0x20,0x34,0x2E,0x35,0x5C,0x32,0x31,0x33,
		0x78,0x78,0x5C,0x69,0x6E,0x63,0x6C,0x75,0x64,0x65,0x5C,0x64,
		0x65,0x66,0x32,0x31,0x33,0x36,0x33,0x2E,0x68,0x00,0x01,0xC2,
		0xC4,0xD8,0xA3,0x04,0x83,0x8B,0x08,0x43,0x3A,0x5C,0x50,0x72,
		0x6F,0x67,0x72,0x61,0x6D,0x20,0x46,0x69,0x6C,0x65,0x73,0x5C,
		0x41,0x6E,0x61,0x6C,0x6F,0x67,0x20,0x44,0x65,0x76,0x69,0x63,
		0x65,0x73,0x5C,0x56,0x69,0x73,0x75,0x61,0x6C,0x44,0x53,0x50,
		0x20,0x34,0x2E,0x35,0x5C,0x32,0x31,0x33,0x78,0x78,0x5C,0x69,
		0x6E,0x63,0x6C,0x75,0x64,0x65,0x5C,0x73,0x69,0x67,0x6E,0x61,
		0x6C,0x2E,0x68,0x00,0x01,0xC2,0xC4,0xD8,0xA3,0x04,0x91,0x55,
		0x61,0x64,0x31,0x38,0x33,0x35,0x2E,0x68,0x00,0x00,0x8C,0x9C,
		0xC7,0x90,0x04,0x85,0x2B,0x00,0x00,0x05,0x02;
	.var = .LN_SetupIRQ12;
	.var =
		0x04,0x01,0x05,0x01,0x1F,0x00,0x05,0x02;
	.var = .LN1;
	.var =
		0x05,0x05,0x0B,0x00,0x05,0x02;
	.var = .LN2;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN3;
	.var =
		0x0B,0x00,0x05,0x02;
	.var = .LN4;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN5;
	.var =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.var = .LN._SetupIRQ12.end;
	.var =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.var = .LN_Irq1ISR;
	.var =
		0x04,0x01,0x05,0x01,0x29,0x00,0x05,0x02;
	.var = .LN6;
	.var =
		0x05,0x12,0x0D,0x00,0x05,0x02;
	.var = .LN7;
	.var =
		0x05,0x23,0x0A,0x00,0x05,0x02;
	.var = .LN8;
	.var =
		0x05,0x05,0x01,0x00,0x05,0x02;
	.var = .LN9;
	.var =
		0x05,0x24,0x0A,0x00,0x05,0x02;
	.var = .LN10;
	.var =
		0x05,0x05,0x01,0x00,0x05,0x02;
	.var = .LN11;
	.var =
		0x0C,0x00,0x05,0x02;
	.var = .LN12;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN13;
	.var =
		0x0B,0x00,0x05,0x02;
	.var = .LN14;
	.var =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.var = .LN15;
	.var =
		0x05,0x1F,0x01,0x00,0x05,0x02;
	.var = .LN16;
	.var =
		0x05,0x05,0x0B,0x00,0x05,0x02;
	.var = .LN17;
	.var =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.var = .LN18;
	.var =
		0x05,0x1F,0x01,0x00,0x05,0x02;
	.var = .LN19;
	.var =
		0x05,0x14,0x0B,0x00,0x05,0x02;
	.var = .LN20;
	.var =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.var = .LN._Irq1ISR.end;
	.var =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.var = .LN_Irq2ISR;
	.var =
		0x04,0x01,0x05,0x01,0x3F,0x00,0x05,0x02;
	.var = .LN21;
	.var =
		0x05,0x12,0x0E,0x00,0x05,0x02;
	.var = .LN22;
	.var =
		0x05,0x23,0x0A,0x00,0x05,0x02;
	.var = .LN23;
	.var =
		0x05,0x05,0x01,0x00,0x05,0x02;
	.var = .LN24;
	.var =
		0x05,0x24,0x0A,0x00,0x05,0x02;
	.var = .LN25;
	.var =
		0x05,0x05,0x01,0x00,0x05,0x02;
	.var = .LN26;
	.var =
		0x0C,0x00,0x05,0x02;
	.var = .LN27;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN28;
	.var =
		0x0B,0x00,0x05,0x02;
	.var = .LN29;
	.var =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.var = .LN30;
	.var =
		0x05,0x1F,0x01,0x00,0x05,0x02;
	.var = .LN31;
	.var =
		0x05,0x05,0x0B,0x00,0x05,0x02;
	.var = .LN32;
	.var =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.var = .LN33;
	.var =
		0x05,0x1F,0x01,0x00,0x05,0x02;
	.var = .LN34;
	.var =
		0x05,0x14,0x0B,0x00,0x05,0x02;
	.var = .LN35;
	.var =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.var = .LN._Irq2ISR.end;
	.var =
		0x00,0x01,0x01;
.epcline.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.var =
		0x35,0x00,0x00,0x00,0x02,0x00;
	.var = .epcdebug;
	.var =
		0x22,0x03,0x00,0x00,0x26,0x02,0x00,0x00,0x53,0x65,0x74,0x75,
		0x70,0x49,0x52,0x51,0x31,0x32,0x00,0x51,0x02,0x00,0x00,0x49,
		0x72,0x71,0x31,0x49,0x53,0x52,0x00,0xB9,0x02,0x00,0x00,0x49,
		0x72,0x71,0x32,0x49,0x53,0x52,0x00,0x00,0x00,0x00,0x00;
.epcpubnames.end:

	.section .debug_aranges SHT_DEBUGINFO;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.var =
		0x28,0x00,0x00,0x00,0x02,0x00;
	.var = .epcdebug;
	.var =
		0x01,0x00;
	.var = .LN_SetupIRQ12;
	.var = .LN._SetupIRQ12.end-.LN_SetupIRQ12;
	.var = .LN_Irq1ISR;
	.var = .LN._Irq1ISR.end-.LN_Irq1ISR;
	.var = .LN_Irq2ISR;
	.var = .LN._Irq2ISR.end-.LN_Irq2ISR;
	.var =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.var =
		0x01,0x00,0x00,0x00,0xF4,0x03,0x00,0x00,0x2D,0x00,0x00,0x00,
		0x49,0x52,0x51,0x70,0x72,0x6F,0x63,0x65,0x73,0x73,0x2E,0x63,
		0x00,0x0C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x57,0x00,0x00,
		0x00,0x19,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x4D,0x6F,0x6E,
		0x20,0x4E,0x6F,0x76,0x20,0x32,0x30,0x20,0x31,0x37,0x3A,0x32,
		0x38,0x3A,0x35,0x34,0x20,0x32,0x30,0x32,0x33,0x0A,0x00,0x39,
		0x00,0x00,0x00,0x61,0x01,0x00,0x00,0x19,0x00,0x00,0x00,0x01,
		0x00,0x00,0x00,0x2D,0x63,0x20,0x2D,0x66,0x69,0x6C,0x65,0x2D,
		0x61,0x74,0x74,0x72,0x20,0x50,0x72,0x6F,0x6A,0x65,0x63,0x74,
		0x4E,0x61,0x6D,0x65,0x3D,0x46,0x78,0x4C,0x4D,0x53,0x5F,0x77,
		0x69,0x74,0x68,0x5F,0x41,0x33,0x5F,0x69,0x6E,0x74,0x65,0x72,
		0x70,0x6F,0x6C,0x20,0x2D,0x4F,0x20,0x2D,0x4F,0x76,0x31,0x30,
		0x30,0x20,0x2D,0x67,0x20,0x2D,0x73,0x61,0x76,0x65,0x2D,0x74,
		0x65,0x6D,0x70,0x73,0x20,0x2D,0x70,0x61,0x74,0x68,0x2D,0x6F,
		0x75,0x74,0x70,0x75,0x74,0x20,0x44,0x65,0x62,0x75,0x67,0x20,
		0x2D,0x45,0x44,0x20,0x2D,0x6E,0x6F,0x2D,0x6D,0x75,0x6C,0x74,
		0x69,0x6C,0x69,0x6E,0x65,0x20,0x2D,0x64,0x6F,0x75,0x62,0x6C,
		0x65,0x2D,0x73,0x69,0x7A,0x65,0x2D,0x33,0x32,0x20,0x2D,0x66,
		0x6C,0x61,0x67,0x73,0x2D,0x63,0x6F,0x6D,0x70,0x69,0x6C,0x65,
		0x72,0x20,0x2D,0x2D,0x64,0x69,0x61,0x67,0x5F,0x77,0x61,0x72,
		0x6E,0x69,0x6E,0x67,0x2C,0x69,0x6D,0x70,0x6C,0x69,0x63,0x69,
		0x74,0x5F,0x66,0x75,0x6E,0x63,0x5F,0x64,0x65,0x63,0x6C,0x20,
		0x2D,0x77,0x61,0x72,0x6E,0x2D,0x70,0x72,0x6F,0x74,0x6F,0x73,
		0x20,0x2D,0x66,0x6F,0x72,0x63,0x65,0x2D,0x63,0x69,0x72,0x63,
		0x62,0x75,0x66,0x20,0x2D,0x70,0x72,0x6F,0x63,0x20,0x41,0x44,
		0x53,0x50,0x2D,0x32,0x31,0x33,0x36,0x34,0x20,0x2D,0x6F,0x20,
		0x44,0x65,0x62,0x75,0x67,0x5C,0x49,0x52,0x51,0x70,0x72,0x6F,
		0x63,0x65,0x73,0x73,0x2E,0x64,0x6F,0x6A,0x20,0x2D,0x4D,0x4D,
		0x00,0x63,0x00,0x00,0x00,0x7C,0x01,0x00,0x00,0x19,0x00,0x00,
		0x00,0x2E,0x00,0x00,0x00,0x41,0x44,0x53,0x50,0x2D,0x32,0x31,
		0x33,0x36,0x34,0x00,0x6D,0x01,0x00,0x00,0xB1,0x01,0x00,0x00,
		0x19,0x00,0x00,0x00,0x2D,0x00,0x00,0x00,0x30,0x2E,0x32,0x00,
		0x88,0x01,0x00,0x00,0x49,0x52,0x51,0x70,0x72,0x6F,0x63,0x65,
		0x73,0x73,0x2E,0x63,0x00,0x90,0x01,0x00,0x00,0x16,0x00,0x00,
		0x00,0x06,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
		0x00,0xCB,0x01,0x00,0x00,0x9D,0x01,0x00,0x00,0x30,0x00,0x00,
		0x00,0x02,0x00,0x00,0x00,0x77,0x6F,0x72,0x64,0x73,0x00,0xC1,
		0x01,0x00,0x00,0xF2,0x01,0x00,0x00,0x9D,0x01,0x00,0x00,0x34,
		0x00,0x00,0x00,0x7B,0x72,0x30,0x2D,0x72,0x32,0x2C,0x72,0x31,
		0x32,0x2C,0x69,0x34,0x2C,0x69,0x31,0x32,0x2C,0x61,0x63,0x63,
		0x7D,0x00,0xD7,0x01,0x00,0x00,0x1F,0x02,0x00,0x00,0x9D,0x01,
		0x00,0x00,0x33,0x00,0x00,0x00,0x49,0x52,0x51,0x70,0x72,0x6F,
		0x63,0x65,0x73,0x73,0x2E,0x63,0x00,0xFE,0x01,0x00,0x00,0x20,
		0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
		0x00,0x00,0x00,0x39,0x02,0x00,0x00,0x0B,0x02,0x00,0x00,0x30,
		0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x77,0x6F,0x72,0x64,0x73,
		0x00,0x2F,0x02,0x00,0x00,0x63,0x02,0x00,0x00,0x0B,0x02,0x00,
		0x00,0x34,0x00,0x00,0x00,0x7B,0x72,0x30,0x2D,0x72,0x32,0x2C,
		0x72,0x34,0x2C,0x72,0x38,0x2C,0x72,0x31,0x32,0x2C,0x69,0x31,
		0x32,0x2C,0x61,0x63,0x63,0x7D,0x00,0x45,0x02,0x00,0x00,0x6F,
		0x02,0x00,0x00,0x0B,0x02,0x00,0x00,0x33,0x00,0x00,0x00,0x18,
		0x03,0x00,0x00,0x0B,0x02,0x00,0x00,0x36,0x00,0x00,0x00,0x7B,
		0x72,0x30,0x2D,0x72,0x32,0x2C,0x72,0x34,0x2C,0x72,0x38,0x2C,
		0x72,0x31,0x32,0x2C,0x69,0x34,0x2C,0x69,0x31,0x32,0x2D,0x69,
		0x31,0x33,0x2C,0x62,0x34,0x2C,0x62,0x31,0x32,0x2D,0x62,0x31,
		0x33,0x2C,0x6D,0x34,0x2C,0x6D,0x31,0x32,0x2C,0x73,0x30,0x2D,
		0x73,0x31,0x35,0x2C,0x75,0x73,0x74,0x61,0x74,0x31,0x2D,0x75,
		0x73,0x74,0x61,0x74,0x34,0x2C,0x61,0x63,0x63,0x2C,0x6D,0x63,
		0x63,0x2C,0x73,0x63,0x63,0x2C,0x62,0x74,0x66,0x2C,0x6C,0x63,
		0x6E,0x74,0x72,0x2C,0x73,0x6D,0x72,0x66,0x2C,0x73,0x6D,0x72,
		0x62,0x2C,0x73,0x61,0x63,0x63,0x2C,0x73,0x6D,0x63,0x63,0x2C,
		0x73,0x73,0x63,0x63,0x2C,0x73,0x62,0x74,0x66,0x7D,0x00,0x7B,
		0x02,0x00,0x00,0x49,0x52,0x51,0x70,0x72,0x6F,0x63,0x65,0x73,
		0x73,0x2E,0x63,0x00,0xF7,0x02,0x00,0x00,0x36,0x00,0x00,0x00,
		0x06,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
		0x32,0x03,0x00,0x00,0x04,0x03,0x00,0x00,0x30,0x00,0x00,0x00,
		0x04,0x00,0x00,0x00,0x77,0x6F,0x72,0x64,0x73,0x00,0x28,0x03,
		0x00,0x00,0x5C,0x03,0x00,0x00,0x04,0x03,0x00,0x00,0x34,0x00,
		0x00,0x00,0x7B,0x72,0x30,0x2D,0x72,0x32,0x2C,0x72,0x34,0x2C,
		0x72,0x38,0x2C,0x72,0x31,0x32,0x2C,0x69,0x31,0x32,0x2C,0x61,
		0x63,0x63,0x7D,0x00,0x3E,0x03,0x00,0x00,0x68,0x03,0x00,0x00,
		0x04,0x03,0x00,0x00,0x33,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
		0x04,0x03,0x00,0x00,0x36,0x00,0x00,0x00,0x7B,0x72,0x30,0x2D,
		0x72,0x32,0x2C,0x72,0x34,0x2C,0x72,0x38,0x2C,0x72,0x31,0x32,
		0x2C,0x69,0x34,0x2C,0x69,0x31,0x32,0x2D,0x69,0x31,0x33,0x2C,
		0x62,0x34,0x2C,0x62,0x31,0x32,0x2D,0x62,0x31,0x33,0x2C,0x6D,
		0x34,0x2C,0x6D,0x31,0x32,0x2C,0x73,0x30,0x2D,0x73,0x31,0x35,
		0x2C,0x75,0x73,0x74,0x61,0x74,0x31,0x2D,0x75,0x73,0x74,0x61,
		0x74,0x34,0x2C,0x61,0x63,0x63,0x2C,0x6D,0x63,0x63,0x2C,0x73,
		0x63,0x63,0x2C,0x62,0x74,0x66,0x2C,0x6C,0x63,0x6E,0x74,0x72,
		0x2C,0x73,0x6D,0x72,0x66,0x2C,0x73,0x6D,0x72,0x62,0x2C,0x73,
		0x61,0x63,0x63,0x2C,0x73,0x6D,0x63,0x63,0x2C,0x73,0x73,0x63,
		0x63,0x2C,0x73,0x62,0x74,0x66,0x7D,0x00,0x74,0x03,0x00,0x00,
		0x00,0x00,0x00,0x00;
.epcannot.end:
