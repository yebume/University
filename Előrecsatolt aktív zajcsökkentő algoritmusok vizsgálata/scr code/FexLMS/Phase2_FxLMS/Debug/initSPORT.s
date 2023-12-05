	.file "initSPORT.c";

//  Compilation time: Mon Nov 20 18:30:35 2023


//  Compiler options: -c -file-attr ProjectName=FexLMS_with_A3 -O -Ov100 -g -save-temps -path-output Debug -ED -no-multiline -double-size-32 -flags-compiler --diag_warning,implicit_func_decl -warn-protos -force-circbuf -proc ADSP-21364 -o Debug\initSPORT.doj -MM

//  Architecture: ADSP-21364

//  Silicon revision: 0.2

	.section/pm/DOUBLE32 seg_pmco;

.epctext:
_InitSPORT:
.LN_InitSPORT:
//-------------------------------------------------------------------
//   Procedure statistics:
//
//   Frame size            = 12 words
//
//   Scratch registers used:{r0-r2,r4,r8,r12,i4,i12,acc}
//
//   Call preserved registers used:{r3,r5-r7,r9-r11,r13-r15}
//-------------------------------------------------------------------
// line "initSPORT.c":55
	modify(i7,-12); 
	dm(-13,i6)=r3; 
	dm(-12,i6)=r5; 
	dm(-11,i6)=r6; 
	dm(-10,i6)=r7; 
	dm(-9,i6)=r9; 
	dm(-8,i6)=r10; 
	dm(-7,i6)=r11; 
	dm(-6,i6)=r13; 
	dm(-5,i6)=r14; 
	dm(-4,i6)=r15; 
// Diagnostic: Optimizer now disabled
.LN1:
// line 56
	r2=_TCB_Block_A+3; 
	r1=dm(_OFFSET); 
	r0=r2-r1; 
	r12=dm(_PCI); 
	r8=r0+r12; 
	dm(_TCB_Block_A)=r8; 
.LN2:
// line 57
	r4=_Block_A; 
	r0=r4-r1; 
	dm(_TCB_Block_A+3)=r0; 
.LN3:
// line 72
	r15=3076; 
	r14=0; 
	i4=r15; 
	dm(m5,i4)=r14; 
.LN4:
// line 73
	r0=1028; 
	r12=0; 
	i4=r0; 
	dm(m5,i4)=r12; 
.LN5:
// line 75
	r8=3072; 
	r14=0; 
	i4=r8; 
	dm(m5,i4)=r14; 
.LN6:
// line 76
	r12=3073; 
	r1=0; 
	i4=r12; 
	dm(m5,i4)=r1; 
.LN7:
// line 77
	r14=1024; 
	r1=0; 
	i4=r14; 
	dm(m5,i4)=r1; 
.LN8:
// line 90
	r1=41945459; 
	i4=r12; 
	dm(m5,i4)=r1; 
.LN9:
// line 91
	r1=3172; 
	r13=10; 
	i4=r1; 
	dm(m5,i4)=r13; 
.LN10:
// line 92
	r13=10; 
	i4=r1; 
	dm(m5,i4)=r13; 
.LN11:
// line 98
	i4=r12; 
	r13=dm(m5,i4); 
	r10=58722674; 
	r11=r13 or r10; 
	i4=r12; 
	dm(m5,i4)=r11; 
.LN12:
// line 99
	r13=3174; 
	r11=0; 
	i4=r13; 
	dm(m5,i4)=r11; 
.LN13:
// line 100
	r11=0; 
	i4=r13; 
	dm(m5,i4)=r11; 
.LN14:
// line 107
	r11=41945459; 
	i4=r14; 
	dm(m5,i4)=r11; 
.LN15:
// line 108
	r11=1120; 
	r9=0; 
	i4=r11; 
	dm(m5,i4)=r9; 
.LN16:
// line 109
	r9=0; 
	i4=r11; 
	dm(m5,i4)=r9; 
.LN17:
// line 116
	i4=r14; 
	r9=dm(m5,i4); 
	r7=r9 or r10; 
	i4=r14; 
	dm(m5,i4)=r7; 
.LN18:
// line 117
	r9=1122; 
	r7=0; 
	i4=r9; 
	dm(m5,i4)=r7; 
.LN19:
// line 118
	r7=0; 
	i4=r9; 
	dm(m5,i4)=r7; 
.LN20:
// line 132
	r7=9177459; 
	i4=r8; 
	dm(m5,i4)=r7; 
.LN21:
// line 136
	r7=_TCB_Block_A; 
	r6=dm(_OFFSET); 
	r5=r7-r6; 
	r0=3; 
	r3=r5+r0; 
	r5=dm(_PCI); 
	r15=r3+r5; 
	r3=3139; 
	i4=r3; 
	dm(m5,i4)=r15; 
.LN22:
// line 139
	jump(pc,.P1L2147483647); 

.P1L2147483647:
	r3=dm(-13,i6); 
	r5=dm(-12,i6); 
	r6=dm(-11,i6); 
	r7=dm(-10,i6); 
	r9=dm(-9,i6); 
	r10=dm(-8,i6); 
	r11=dm(-7,i6); 
	r13=dm(-6,i6); 
	r14=dm(-5,i6); 
	r15=dm(-4,i6); 
	i12=dm(m7,i6); 
	jump(m14,i12)(DB); rframe; nop; 

.LN._InitSPORT.end:
._InitSPORT.end:
	.global _InitSPORT;
	.type _InitSPORT,STT_FUNC;

	.file_attr ProjectName="FexLMS_with_A3";
	.file_attr FuncName="_InitSPORT";
	.file_attr Content="CodeData";
.epctext.end:

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
		0x00,0x06,0x34,0x00,0x03,0x08,0x32,0x0B,0x49,0x13,0x02,0x09,
		0x2C,0x06,0x3F,0x0C,0x00,0x00,0x07,0x01,0x01,0x01,0x13,0x49,
		0x13,0x00,0x00,0x08,0x21,0x00,0x37,0x0F,0x22,0x0F,0x2F,0x0F,
		0x00,0x00,0x00;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.var =
		0x7E,0x03,0x00,0x00,0x02,0x00;
	.var = .epcabbrev;
	.var =
		0x04,0x01,0x69,0x6E,0x69,0x74,0x53,0x50,0x4F,0x52,0x54,0x2E,
		0x63,0x00,0x01;
	.var = .epcline;
	.var =
		0x00,0x00,0x00,0x00,0x45,0x3A,0x5C,0x4A,0x61,0x6B,0x61,0x62,
		0x5F,0x54,0x61,0x6D,0x61,0x73,0x5C,0x53,0x7A,0x61,0x6B,0x64,
		0x6F,0x6C,0x67,0x6F,0x7A,0x61,0x74,0x5C,0x32,0x33,0x2E,0x31,
		0x31,0x2E,0x31,0x33,0x20,0x65,0x78,0x4C,0x4D,0x53,0x20,0x2D,
		0x20,0x63,0x68,0x65,0x72,0x72,0x79,0x5C,0x50,0x68,0x61,0x73,
		0x65,0x32,0x5F,0x46,0x78,0x4C,0x4D,0x53,0x00,0x43,0x2F,0x43,
		0x2B,0x2B,0x20,0x43,0x6F,0x6D,0x70,0x69,0x6C,0x65,0x72,0x20,
		0x3A,0x20,0x53,0x48,0x41,0x52,0x43,0x20,0x76,0x65,0x72,0x73,
		0x69,0x6F,0x6E,0x20,0x37,0x2E,0x32,0x2E,0x30,0x2E,0x30,0x20,
		0x28,0x4D,0x61,0x79,0x20,0x20,0x31,0x20,0x32,0x30,0x30,0x36,
		0x20,0x32,0x33,0x3A,0x31,0x36,0x3A,0x34,0x31,0x29,0x0A,0x20,
		0x20,0x43,0x6F,0x70,0x79,0x72,0x69,0x67,0x68,0x74,0x20,0x28,
		0x63,0x29,0x20,0x31,0x39,0x39,0x37,0x2D,0x32,0x30,0x30,0x36,
		0x20,0x41,0x6E,0x61,0x6C,0x6F,0x67,0x20,0x44,0x65,0x76,0x69,
		0x63,0x65,0x73,0x2C,0x20,0x49,0x6E,0x63,0x2E,0x0A,0x20,0x20,
		0x43,0x6F,0x70,0x79,0x72,0x69,0x67,0x68,0x74,0x20,0x28,0x63,
		0x29,0x20,0x31,0x39,0x39,0x38,0x2D,0x32,0x30,0x30,0x33,0x20,
		0x45,0x64,0x69,0x73,0x6F,0x6E,0x20,0x44,0x65,0x73,0x69,0x67,
		0x6E,0x20,0x47,0x72,0x6F,0x75,0x70,0x2C,0x20,0x49,0x6E,0x63,
		0x2E,0x0A,0x20,0x20,0x43,0x6F,0x70,0x79,0x72,0x69,0x67,0x68,
		0x74,0x20,0x28,0x63,0x29,0x20,0x31,0x39,0x39,0x37,0x2D,0x31,
		0x39,0x39,0x39,0x20,0x45,0x64,0x69,0x6E,0x62,0x75,0x72,0x67,
		0x68,0x20,0x50,0x6F,0x72,0x74,0x61,0x62,0x6C,0x65,0x20,0x43,
		0x6F,0x6D,0x70,0x69,0x6C,0x65,0x72,0x73,0x2C,0x20,0x4C,0x74,
		0x64,0x2E,0x0A,0x00,0x00,0x02,0x62,0x6F,0x6F,0x6C,0x00,0x02,
		0x01,0x02,0x77,0x63,0x68,0x61,0x72,0x5F,0x74,0x00,0x06,0x01,
		0x02,0x63,0x68,0x61,0x72,0x00,0x06,0x01,0x02,0x73,0x69,0x67,
		0x6E,0x65,0x64,0x20,0x63,0x68,0x61,0x72,0x00,0x06,0x01,0x02,
		0x75,0x6E,0x73,0x69,0x67,0x6E,0x65,0x64,0x20,0x63,0x68,0x61,
		0x72,0x00,0x08,0x01,0x02,0x73,0x68,0x6F,0x72,0x74,0x00,0x05,
		0x01,0x02,0x73,0x69,0x67,0x6E,0x65,0x64,0x20,0x73,0x68,0x6F,
		0x72,0x74,0x00,0x05,0x01,0x02,0x75,0x6E,0x73,0x69,0x67,0x6E,
		0x65,0x64,0x20,0x73,0x68,0x6F,0x72,0x74,0x00,0x07,0x01,0x02,
		0x69,0x6E,0x74,0x00,0x05,0x01,0x02,0x73,0x69,0x67,0x6E,0x65,
		0x64,0x20,0x69,0x6E,0x74,0x00,0x05,0x01,0x02,0x75,0x6E,0x73,
		0x69,0x67,0x6E,0x65,0x64,0x20,0x69,0x6E,0x74,0x00,0x07,0x01,
		0x02,0x6C,0x6F,0x6E,0x67,0x00,0x05,0x01,0x02,0x73,0x69,0x67,
		0x6E,0x65,0x64,0x20,0x6C,0x6F,0x6E,0x67,0x00,0x05,0x01,0x02,
		0x75,0x6E,0x73,0x69,0x67,0x6E,0x65,0x64,0x20,0x6C,0x6F,0x6E,
		0x67,0x00,0x07,0x01,0x02,0x66,0x6C,0x6F,0x61,0x74,0x00,0x04,
		0x01,0x02,0x64,0x6F,0x75,0x62,0x6C,0x65,0x00,0x04,0x01,0x02,
		0x6C,0x6F,0x6E,0x67,0x20,0x64,0x6F,0x75,0x62,0x6C,0x65,0x00,
		0x04,0x02,0x02,0x76,0x6F,0x69,0x64,0x20,0x2A,0x00,0x01,0x01,
		0x03,0x73,0x69,0x67,0x5F,0x61,0x74,0x6F,0x6D,0x69,0x63,0x5F,
		0x74,0x00,0x01,0xA8,0x01,0x00,0x00,0x04,0x5E,0x02,0x00,0x00,
		0x49,0x6E,0x69,0x74,0x53,0x50,0x4F,0x52,0x54,0x00,0x01;
	.var = .LN_InitSPORT;
	.var = .LN._InitSPORT.end;
	.var =
		0x01,0x01,0x00,0x05,0x00,0x00,0x00,0x00;
	.var = .LN1;
	.var = .LN._InitSPORT.end;
	.var =
		0x00,0x00,0x06,0x50,0x43,0x49,0x00,0x01,0xBD,0x01,0x00,0x00,
		0x05,0x0C;
	.var = _PCI;
	.var =
		0x00,0x00,0x00,0x00,0x00,0x06,0x4F,0x46,0x46,0x53,0x45,0x54,
		0x00,0x01,0xBD,0x01,0x00,0x00,0x05,0x0C;
	.var = _OFFSET;
	.var =
		0x00,0x00,0x00,0x00,0x00,0x06,0x42,0x6C,0x6F,0x63,0x6B,0x5F,
		0x41,0x00,0x01,0x73,0x03,0x00,0x00,0x05,0x0C;
	.var = _Block_A;
	.var =
		0x00,0x00,0x00,0x00,0x00,0x06,0x42,0x6C,0x6F,0x63,0x6B,0x5F,
		0x42,0x00,0x01,0x65,0x03,0x00,0x00,0x05,0x0C;
	.var = _Block_B;
	.var =
		0x00,0x00,0x00,0x00,0x00,0x06,0x42,0x6C,0x6F,0x63,0x6B,0x5F,
		0x43,0x00,0x01,0x57,0x03,0x00,0x00,0x05,0x0C;
	.var = _Block_C;
	.var =
		0x00,0x00,0x00,0x00,0x00,0x06,0x54,0x43,0x42,0x5F,0x42,0x6C,
		0x6F,0x63,0x6B,0x5F,0x41,0x00,0x01,0x49,0x03,0x00,0x00,0x05,
		0x0C;
	.var = _TCB_Block_A;
	.var =
		0x00,0x00,0x00,0x00,0x00,0x06,0x54,0x43,0x42,0x5F,0x42,0x6C,
		0x6F,0x63,0x6B,0x5F,0x42,0x00,0x01,0x3B,0x03,0x00,0x00,0x05,
		0x0C;
	.var = _TCB_Block_B;
	.var =
		0x00,0x00,0x00,0x00,0x00,0x06,0x54,0x43,0x42,0x5F,0x42,0x6C,
		0x6F,0x63,0x6B,0x5F,0x43,0x00,0x01,0x2D,0x03,0x00,0x00,0x05,
		0x0C;
	.var = _TCB_Block_C;
	.var =
		0x00,0x00,0x00,0x00,0x00,0x07,0x3B,0x03,0x00,0x00,0xA8,0x01,
		0x00,0x00,0x08,0x04,0x00,0x03,0x00,0x07,0x49,0x03,0x00,0x00,
		0xA8,0x01,0x00,0x00,0x08,0x04,0x00,0x03,0x00,0x07,0x57,0x03,
		0x00,0x00,0xA8,0x01,0x00,0x00,0x08,0x04,0x00,0x03,0x00,0x07,
		0x65,0x03,0x00,0x00,0xBD,0x01,0x00,0x00,0x08,0x02,0x00,0x01,
		0x00,0x07,0x73,0x03,0x00,0x00,0xBD,0x01,0x00,0x00,0x08,0x02,
		0x00,0x01,0x00,0x07,0x00,0x00,0x00,0x00,0xBD,0x01,0x00,0x00,
		0x08,0x02,0x00,0x01,0x00,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.var =
		0xCA,0x02,0x00,0x00,0x02,0x00,0xFA,0x01,0x00,0x00,0x01,0x01,
		0x01,0xF6,0x0A,0x00,0x01,0x01,0x01,0x01,0x00,0x00,0x00,0x01,
		0x43,0x3A,0x5C,0x50,0x72,0x6F,0x67,0x72,0x61,0x6D,0x20,0x46,
		0x69,0x6C,0x65,0x73,0x5C,0x41,0x6E,0x61,0x6C,0x6F,0x67,0x20,
		0x44,0x65,0x76,0x69,0x63,0x65,0x73,0x5C,0x56,0x69,0x73,0x75,
		0x61,0x6C,0x44,0x53,0x50,0x20,0x34,0x2E,0x35,0x5C,0x32,0x31,
		0x33,0x78,0x78,0x5C,0x69,0x6E,0x63,0x6C,0x75,0x64,0x65,0x00,
		0x00,0x69,0x6E,0x69,0x74,0x53,0x50,0x4F,0x52,0x54,0x2E,0x63,
		0x00,0x00,0xF8,0xFE,0xA9,0xA8,0x04,0xE8,0x20,0x74,0x74,0x2E,
		0x68,0x00,0x00,0xA0,0xD9,0x84,0x93,0x06,0xAC,0x0F,0x43,0x3A,
		0x5C,0x50,0x72,0x6F,0x67,0x72,0x61,0x6D,0x20,0x46,0x69,0x6C,
		0x65,0x73,0x5C,0x41,0x6E,0x61,0x6C,0x6F,0x67,0x20,0x44,0x65,
		0x76,0x69,0x63,0x65,0x73,0x5C,0x56,0x69,0x73,0x75,0x61,0x6C,
		0x44,0x53,0x50,0x20,0x34,0x2E,0x35,0x5C,0x32,0x31,0x33,0x78,
		0x78,0x5C,0x69,0x6E,0x63,0x6C,0x75,0x64,0x65,0x5C,0x63,0x64,
		0x65,0x66,0x32,0x31,0x33,0x36,0x34,0x2E,0x68,0x00,0x01,0xC2,
		0xC4,0xD8,0xA3,0x04,0xAF,0x04,0x43,0x3A,0x5C,0x50,0x72,0x6F,
		0x67,0x72,0x61,0x6D,0x20,0x46,0x69,0x6C,0x65,0x73,0x5C,0x41,
		0x6E,0x61,0x6C,0x6F,0x67,0x20,0x44,0x65,0x76,0x69,0x63,0x65,
		0x73,0x5C,0x56,0x69,0x73,0x75,0x61,0x6C,0x44,0x53,0x50,0x20,
		0x34,0x2E,0x35,0x5C,0x32,0x31,0x33,0x78,0x78,0x5C,0x69,0x6E,
		0x63,0x6C,0x75,0x64,0x65,0x5C,0x43,0x64,0x65,0x66,0x32,0x31,
		0x33,0x36,0x33,0x2E,0x68,0x00,0x01,0xC2,0xC4,0xD8,0xA3,0x04,
		0x84,0xA9,0x02,0x43,0x3A,0x5C,0x50,0x72,0x6F,0x67,0x72,0x61,
		0x6D,0x20,0x46,0x69,0x6C,0x65,0x73,0x5C,0x41,0x6E,0x61,0x6C,
		0x6F,0x67,0x20,0x44,0x65,0x76,0x69,0x63,0x65,0x73,0x5C,0x56,
		0x69,0x73,0x75,0x61,0x6C,0x44,0x53,0x50,0x20,0x34,0x2E,0x35,
		0x5C,0x32,0x31,0x33,0x78,0x78,0x5C,0x69,0x6E,0x63,0x6C,0x75,
		0x64,0x65,0x5C,0x64,0x65,0x66,0x32,0x31,0x33,0x36,0x34,0x2E,
		0x68,0x00,0x01,0xC2,0xC4,0xD8,0xA3,0x04,0xD6,0x04,0x43,0x3A,
		0x5C,0x50,0x72,0x6F,0x67,0x72,0x61,0x6D,0x20,0x46,0x69,0x6C,
		0x65,0x73,0x5C,0x41,0x6E,0x61,0x6C,0x6F,0x67,0x20,0x44,0x65,
		0x76,0x69,0x63,0x65,0x73,0x5C,0x56,0x69,0x73,0x75,0x61,0x6C,
		0x44,0x53,0x50,0x20,0x34,0x2E,0x35,0x5C,0x32,0x31,0x33,0x78,
		0x78,0x5C,0x69,0x6E,0x63,0x6C,0x75,0x64,0x65,0x5C,0x64,0x65,
		0x66,0x32,0x31,0x33,0x36,0x33,0x2E,0x68,0x00,0x01,0xC2,0xC4,
		0xD8,0xA3,0x04,0x83,0x8B,0x08,0x43,0x3A,0x5C,0x50,0x72,0x6F,
		0x67,0x72,0x61,0x6D,0x20,0x46,0x69,0x6C,0x65,0x73,0x5C,0x41,
		0x6E,0x61,0x6C,0x6F,0x67,0x20,0x44,0x65,0x76,0x69,0x63,0x65,
		0x73,0x5C,0x56,0x69,0x73,0x75,0x61,0x6C,0x44,0x53,0x50,0x20,
		0x34,0x2E,0x35,0x5C,0x32,0x31,0x33,0x78,0x78,0x5C,0x69,0x6E,
		0x63,0x6C,0x75,0x64,0x65,0x5C,0x73,0x69,0x67,0x6E,0x61,0x6C,
		0x2E,0x68,0x00,0x01,0xC2,0xC4,0xD8,0xA3,0x04,0x91,0x55,0x00,
		0x00,0x05,0x02;
	.var = .LN_InitSPORT;
	.var =
		0x04,0x01,0x05,0x01,0x3F,0x00,0x05,0x02;
	.var = .LN1;
	.var =
		0x05,0x05,0x0A,0x00,0x05,0x02;
	.var = .LN2;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN3;
	.var =
		0x18,0x00,0x05,0x02;
	.var = .LN4;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN5;
	.var =
		0x0B,0x00,0x05,0x02;
	.var = .LN6;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN7;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN8;
	.var =
		0x16,0x00,0x05,0x02;
	.var = .LN9;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN10;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN11;
	.var =
		0x0F,0x00,0x05,0x02;
	.var = .LN12;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN13;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN14;
	.var =
		0x10,0x00,0x05,0x02;
	.var = .LN15;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN16;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN17;
	.var =
		0x10,0x00,0x05,0x02;
	.var = .LN18;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN19;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN20;
	.var =
		0x17,0x00,0x05,0x02;
	.var = .LN21;
	.var =
		0x0D,0x00,0x05,0x02;
	.var = .LN22;
	.var =
		0x05,0x01,0x0C,0x00,0x05,0x02;
	.var = .LN._InitSPORT.end;
	.var =
		0x00,0x01,0x01;
.epcline.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.var =
		0x83,0x00,0x00,0x00,0x02,0x00;
	.var = .epcdebug;
	.var =
		0x82,0x03,0x00,0x00,0x34,0x02,0x00,0x00,0x49,0x6E,0x69,0x74,
		0x53,0x50,0x4F,0x52,0x54,0x00,0x5E,0x02,0x00,0x00,0x50,0x43,
		0x49,0x00,0x73,0x02,0x00,0x00,0x4F,0x46,0x46,0x53,0x45,0x54,
		0x00,0x8B,0x02,0x00,0x00,0x42,0x6C,0x6F,0x63,0x6B,0x5F,0x41,
		0x00,0xA4,0x02,0x00,0x00,0x42,0x6C,0x6F,0x63,0x6B,0x5F,0x42,
		0x00,0xBD,0x02,0x00,0x00,0x42,0x6C,0x6F,0x63,0x6B,0x5F,0x43,
		0x00,0xD6,0x02,0x00,0x00,0x54,0x43,0x42,0x5F,0x42,0x6C,0x6F,
		0x63,0x6B,0x5F,0x41,0x00,0xF3,0x02,0x00,0x00,0x54,0x43,0x42,
		0x5F,0x42,0x6C,0x6F,0x63,0x6B,0x5F,0x42,0x00,0x10,0x03,0x00,
		0x00,0x54,0x43,0x42,0x5F,0x42,0x6C,0x6F,0x63,0x6B,0x5F,0x43,
		0x00,0x00,0x00,0x00,0x00;
.epcpubnames.end:

	.section .debug_aranges SHT_DEBUGINFO;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.var =
		0x18,0x00,0x00,0x00,0x02,0x00;
	.var = .epcdebug;
	.var =
		0x01,0x00;
	.var = .LN_InitSPORT;
	.var = .LN._InitSPORT.end-.LN_InitSPORT;
	.var =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.var =
		0x01,0x00,0x00,0x00,0x18,0x02,0x00,0x00,0x2C,0x00,0x00,0x00,
		0x69,0x6E,0x69,0x74,0x53,0x50,0x4F,0x52,0x54,0x2E,0x63,0x00,
		0x0C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x56,0x00,0x00,0x00,
		0x18,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x4D,0x6F,0x6E,0x20,
		0x4E,0x6F,0x76,0x20,0x32,0x30,0x20,0x31,0x38,0x3A,0x33,0x30,
		0x3A,0x33,0x35,0x20,0x32,0x30,0x32,0x33,0x0A,0x00,0x38,0x00,
		0x00,0x00,0x57,0x01,0x00,0x00,0x18,0x00,0x00,0x00,0x01,0x00,
		0x00,0x00,0x2D,0x63,0x20,0x2D,0x66,0x69,0x6C,0x65,0x2D,0x61,
		0x74,0x74,0x72,0x20,0x50,0x72,0x6F,0x6A,0x65,0x63,0x74,0x4E,
		0x61,0x6D,0x65,0x3D,0x46,0x65,0x78,0x4C,0x4D,0x53,0x5F,0x77,
		0x69,0x74,0x68,0x5F,0x41,0x33,0x20,0x2D,0x4F,0x20,0x2D,0x4F,
		0x76,0x31,0x30,0x30,0x20,0x2D,0x67,0x20,0x2D,0x73,0x61,0x76,
		0x65,0x2D,0x74,0x65,0x6D,0x70,0x73,0x20,0x2D,0x70,0x61,0x74,
		0x68,0x2D,0x6F,0x75,0x74,0x70,0x75,0x74,0x20,0x44,0x65,0x62,
		0x75,0x67,0x20,0x2D,0x45,0x44,0x20,0x2D,0x6E,0x6F,0x2D,0x6D,
		0x75,0x6C,0x74,0x69,0x6C,0x69,0x6E,0x65,0x20,0x2D,0x64,0x6F,
		0x75,0x62,0x6C,0x65,0x2D,0x73,0x69,0x7A,0x65,0x2D,0x33,0x32,
		0x20,0x2D,0x66,0x6C,0x61,0x67,0x73,0x2D,0x63,0x6F,0x6D,0x70,
		0x69,0x6C,0x65,0x72,0x20,0x2D,0x2D,0x64,0x69,0x61,0x67,0x5F,
		0x77,0x61,0x72,0x6E,0x69,0x6E,0x67,0x2C,0x69,0x6D,0x70,0x6C,
		0x69,0x63,0x69,0x74,0x5F,0x66,0x75,0x6E,0x63,0x5F,0x64,0x65,
		0x63,0x6C,0x20,0x2D,0x77,0x61,0x72,0x6E,0x2D,0x70,0x72,0x6F,
		0x74,0x6F,0x73,0x20,0x2D,0x66,0x6F,0x72,0x63,0x65,0x2D,0x63,
		0x69,0x72,0x63,0x62,0x75,0x66,0x20,0x2D,0x70,0x72,0x6F,0x63,
		0x20,0x41,0x44,0x53,0x50,0x2D,0x32,0x31,0x33,0x36,0x34,0x20,
		0x2D,0x6F,0x20,0x44,0x65,0x62,0x75,0x67,0x5C,0x69,0x6E,0x69,
		0x74,0x53,0x50,0x4F,0x52,0x54,0x2E,0x64,0x6F,0x6A,0x20,0x2D,
		0x4D,0x4D,0x00,0x62,0x00,0x00,0x00,0x72,0x01,0x00,0x00,0x18,
		0x00,0x00,0x00,0x2E,0x00,0x00,0x00,0x41,0x44,0x53,0x50,0x2D,
		0x32,0x31,0x33,0x36,0x34,0x00,0x63,0x01,0x00,0x00,0xA6,0x01,
		0x00,0x00,0x18,0x00,0x00,0x00,0x2D,0x00,0x00,0x00,0x30,0x2E,
		0x32,0x00,0x7E,0x01,0x00,0x00,0x69,0x6E,0x69,0x74,0x53,0x50,
		0x4F,0x52,0x54,0x2E,0x63,0x00,0x86,0x01,0x00,0x00,0x36,0x00,
		0x00,0x00,0x06,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
		0x00,0x00,0xC0,0x01,0x00,0x00,0x92,0x01,0x00,0x00,0x30,0x00,
		0x00,0x00,0x0C,0x00,0x00,0x00,0x77,0x6F,0x72,0x64,0x73,0x00,
		0xB6,0x01,0x00,0x00,0xED,0x01,0x00,0x00,0x92,0x01,0x00,0x00,
		0x34,0x00,0x00,0x00,0x7B,0x72,0x30,0x2D,0x72,0x32,0x2C,0x72,
		0x34,0x2C,0x72,0x38,0x2C,0x72,0x31,0x32,0x2C,0x69,0x34,0x2C,
		0x69,0x31,0x32,0x2C,0x61,0x63,0x63,0x7D,0x00,0xCC,0x01,0x00,
		0x00,0x00,0x00,0x00,0x00,0x92,0x01,0x00,0x00,0x35,0x00,0x00,
		0x00,0x7B,0x72,0x33,0x2C,0x72,0x35,0x2D,0x72,0x37,0x2C,0x72,
		0x39,0x2D,0x72,0x31,0x31,0x2C,0x72,0x31,0x33,0x2D,0x72,0x31,
		0x35,0x7D,0x00,0xF9,0x01,0x00,0x00,0x00;
.epcannot.end:

	.section/dm/DOUBLE32 seg_dmda;

	.align 1;
_PCI:
	.global _PCI;
	.type _PCI,STT_OBJECT;
	.var ..TW0[1] =
		 0x00080000;
._PCI.end:
	.align 1;
_OFFSET:
	.global _OFFSET;
	.type _OFFSET,STT_OBJECT;
	.var ..TW1[1] =
		 0x00080000;
._OFFSET.end:
	.align 2;
_TCB_Block_A:
	.global _TCB_Block_A;
	.type _TCB_Block_A,STT_OBJECT;
	.var ..TW2[4] =
		 0x00000000, 0x00000002, 0x00000001, 0x00000000;
._TCB_Block_A.end:
	.align 2;
_TCB_Block_B:
	.global _TCB_Block_B;
	.type _TCB_Block_B,STT_OBJECT;
	.var ..TW3[4] =
		 0x00000000, 0x00000002, 0x00000001, 0x00000000;
._TCB_Block_B.end:
	.align 2;
_TCB_Block_C:
	.global _TCB_Block_C;
	.type _TCB_Block_C,STT_OBJECT;
	.var ..TW4[4] =
		 0x00000000, 0x00000002, 0x00000001, 0x00000000;
._TCB_Block_C.end:

	.align 2;
	.var _Block_A[2];
	.weak _Block_A;
	.align 2;
	.var _Block_B[2];
	.weak _Block_B;
	.align 2;
	.var _Block_C[2];
	.weak _Block_C;
