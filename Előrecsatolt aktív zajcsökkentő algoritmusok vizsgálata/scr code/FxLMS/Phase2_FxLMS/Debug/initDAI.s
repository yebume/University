	.file "initDAI.c";

//  Compilation time: Mon Nov 20 17:28:54 2023


//  Compiler options: -c -file-attr ProjectName=FxLMS_with_A3_interpol -O -Ov100 -g -save-temps -path-output Debug -ED -no-multiline -double-size-32 -flags-compiler --diag_warning,implicit_func_decl -warn-protos -force-circbuf -proc ADSP-21364 -o Debug\initDAI.doj -MM

//  Architecture: ADSP-21364

//  Silicon revision: 0.2

	.section/pm/DOUBLE32 seg_pmco;

.epctext:
_InitDAI:
.LN_InitDAI:
//-------------------------------------------------------------------
//   Procedure statistics:
//
//   Frame size            = 12 words
//
//   Scratch registers used:{r0-r2,r4,r8,r12,i4,i12,acc}
//
//   Call preserved registers used:{r3,r5-r7,r9-r11,r13-r15}
//-------------------------------------------------------------------
// line "initDAI.c":14
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
// line 25
	r2=9316; 
	i4=r2; 
	r1=dm(m5,i4); 
	r12=-128; 
	r0=r1 and r12; 
	r4=80; 
	r8=r0 or r4; 
	i4=r2; 
	dm(m5,i4)=r8; 
.LN2:
// line 28
	r1=9339; 
	i4=r1; 
	r0=dm(m5,i4); 
	r15=-4033; 
	r8=r0 and r15; 
	i4=r1; 
	dm(m5,i4)=r8; 
.LN3:
// line 47
	r0=9264; 
	i4=r0; 
	r8=dm(m5,i4); 
	r13=-32; 
	r14=r8 and r13; 
	r11=6; 
	r8=r14 or r11; 
	i4=r0; 
	dm(m5,i4)=r8; 
.LN4:
// line 50
	r8=9296; 
	i4=r8; 
	r14=dm(m5,i4); 
	r10=r14 and r13; 
	r9=7; 
	r14=r10 or r9; 
	i4=r8; 
	dm(m5,i4)=r14; 
.LN5:
// line 53
	r14=9280; 
	i4=r14; 
	r10=dm(m5,i4); 
	r6=-64; 
	r7=r10 and r6; 
	r5=4; 
	r10=r7 or r5; 
	i4=r14; 
	dm(m5,i4)=r10; 
.LN6:
// line 65
	r10=9313; 
	i4=r10; 
	r7=dm(m5,i4); 
	r3=r7 and r12; 
	r7=r3 or r4; 
	i4=r10; 
	dm(m5,i4)=r7; 
.LN7:
// line 66
	i4=r10; 
	r7=dm(m5,i4); 
	r15=-2080769; 
	r3=r7 and r15; 
	r11=1310720; 
	r7=r3 or r11; 
	i4=r10; 
	dm(m5,i4)=r7; 
.LN8:
// line 67
	i4=r10; 
	r7=dm(m5,i4); 
	r9=-266338305; 
	r3=r7 and r9; 
	r6=167772160; 
	r7=r3 or r6; 
	i4=r10; 
	dm(m5,i4)=r7; 
.LN9:
// line 73
	r7=9336; 
	i4=r7; 
	r3=dm(m5,i4); 
	r15=-1056964609; 
	r5=r3 and r15; 
	i4=r7; 
	dm(m5,i4)=r5; 
.LN10:
// line 74
	r5=9337; 
	i4=r5; 
	r3=dm(m5,i4); 
	r2=-4033; 
	r11=r3 and r2; 
	i4=r5; 
	dm(m5,i4)=r11; 
.LN11:
// line 75
	i4=r5; 
	r11=dm(m5,i4); 
	r1=-258049; 
	r3=r11 and r1; 
	i4=r5; 
	dm(m5,i4)=r3; 
.LN12:
// line 101
	r11=9314; 
	i4=r11; 
	r3=dm(m5,i4); 
	r0=r3 and r12; 
	r8=25; 
	r3=r0 or r8; 
	i4=r11; 
	dm(m5,i4)=r3; 
.LN13:
// line 102
	i4=r11; 
	r0=dm(m5,i4); 
	r4=-16257; 
	r3=r0 and r4; 
	r14=3072; 
	r0=r3 or r14; 
	i4=r11; 
	dm(m5,i4)=r0; 
.LN14:
// line 103
	i4=r11; 
	r0=dm(m5,i4); 
	r13=-2080769; 
	r3=r0 and r13; 
	r9=376832; 
	r0=r3 or r9; 
	i4=r11; 
	dm(m5,i4)=r0; 
.LN15:
// line 104
	i4=r11; 
	r0=dm(m5,i4); 
	r6=-266338305; 
	r3=r0 and r6; 
	r12=46137344; 
	r0=r3 or r12; 
	i4=r11; 
	dm(m5,i4)=r0; 
.LN16:
// line 117
	r0=9315; 
	i4=r0; 
	r3=dm(m5,i4); 
	r7=-128; 
	r15=r3 and r7; 
	r2=6; 
	r3=r15 or r2; 
	i4=r0; 
	dm(m5,i4)=r3; 
.LN17:
// line 118
	i4=r0; 
	r15=dm(m5,i4); 
	r3=r15 and r4; 
	r1=896; 
	r15=r3 or r1; 
	i4=r0; 
	dm(m5,i4)=r15; 
.LN18:
// line 119
	i4=r10; 
	r15=dm(m5,i4); 
	r3=r15 and r4; 
	r8=2048; 
	r15=r3 or r8; 
	i4=r10; 
	dm(m5,i4)=r15; 
.LN19:
// line 125
	r15=9264; 
	i4=r15; 
	r3=dm(m5,i4); 
	r13=-993; 
	r14=r3 and r13; 
	r9=192; 
	r3=r14 or r9; 
	i4=r15; 
	dm(m5,i4)=r3; 
.LN20:
// line 126
	i4=r15; 
	r14=dm(m5,i4); 
	r5=-31745; 
	r3=r14 and r5; 
	r6=6144; 
	r14=r3 or r6; 
	i4=r15; 
	dm(m5,i4)=r14; 
.LN21:
// line 127
	r14=9296; 
	i4=r14; 
	r3=dm(m5,i4); 
	r12=r3 and r13; 
	r4=224; 
	r3=r12 or r4; 
	i4=r14; 
	dm(m5,i4)=r3; 
.LN22:
// line 128
	i4=r14; 
	r12=dm(m5,i4); 
	r3=r12 and r5; 
	r7=7168; 
	r12=r3 or r7; 
	i4=r14; 
	dm(m5,i4)=r12; 
.LN23:
// line 132
	r12=9337; 
	i4=r12; 
	r3=dm(m5,i4); 
	r1=-64; 
	r2=r3 and r1; 
	r10=1; 
	r3=r2 or r10; 
	i4=r12; 
	dm(m5,i4)=r3; 
.LN24:
// line 133
	i4=r12; 
	r2=dm(m5,i4); 
	r8=-16515073; 
	r3=r2 and r8; 
	r9=262144; 
	r2=r3 or r9; 
	i4=r12; 
	dm(m5,i4)=r2; 
.LN25:
// line 134
	i4=r12; 
	r2=dm(m5,i4); 
	r0=-1056964609; 
	r3=r2 and r0; 
	r13=16777216; 
	r2=r3 or r13; 
	i4=r12; 
	dm(m5,i4)=r2; 
.LN26:
// line 135
	r2=9338; 
	i4=r2; 
	r3=dm(m5,i4); 
	r6=r3 and r1; 
	r3=r6 or r10; 
	i4=r2; 
	dm(m5,i4)=r3; 
.LN27:
// line 136
	i4=r2; 
	r6=dm(m5,i4); 
	r4=-4033; 
	r3=r6 and r4; 
	r5=64; 
	r6=r3 or r5; 
	i4=r2; 
	dm(m5,i4)=r6; 
.LN28:
// line 137
	i4=r2; 
	r6=dm(m5,i4); 
	r11=-258049; 
	r3=r6 and r11; 
	r7=4096; 
	r6=r3 or r7; 
	i4=r2; 
	dm(m5,i4)=r6; 
.LN29:
// line 138
	i4=r2; 
	r6=dm(m5,i4); 
	r3=r6 and r8; 
	r6=r3 or r9; 
	i4=r2; 
	dm(m5,i4)=r6; 
.LN30:
// line 142
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

.LN._InitDAI.end:
._InitDAI.end:
	.global _InitDAI;
	.type _InitDAI,STT_FUNC;

	.file_attr ProjectName="FxLMS_with_A3_interpol";
	.file_attr FuncName="_InitDAI";
	.file_attr Content="Code";
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
		0x00,0x00;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.var =
		0x48,0x02,0x00,0x00,0x02,0x00;
	.var = .epcabbrev;
	.var =
		0x04,0x01,0x69,0x6E,0x69,0x74,0x44,0x41,0x49,0x2E,0x63,0x00,
		0x01;
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
		0x97,0x01,0x00,0x00,0x04,0x00,0x00,0x00,0x00,0x49,0x6E,0x69,
		0x74,0x44,0x41,0x49,0x00,0x01;
	.var = .LN_InitDAI;
	.var = .LN._InitDAI.end;
	.var =
		0x01,0x01,0x00,0x05,0x00,0x00,0x00,0x00;
	.var = .LN1;
	.var = .LN._InitDAI.end;
	.var =
		0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.var =
		0xA7,0x03,0x00,0x00,0x02,0x00,0x97,0x02,0x00,0x00,0x01,0x01,
		0x01,0xF6,0x0A,0x00,0x01,0x01,0x01,0x01,0x00,0x00,0x00,0x01,
		0x43,0x3A,0x5C,0x50,0x72,0x6F,0x67,0x72,0x61,0x6D,0x20,0x46,
		0x69,0x6C,0x65,0x73,0x5C,0x41,0x6E,0x61,0x6C,0x6F,0x67,0x20,
		0x44,0x65,0x76,0x69,0x63,0x65,0x73,0x5C,0x56,0x69,0x73,0x75,
		0x61,0x6C,0x44,0x53,0x50,0x20,0x34,0x2E,0x35,0x5C,0x32,0x31,
		0x33,0x78,0x78,0x5C,0x69,0x6E,0x63,0x6C,0x75,0x64,0x65,0x00,
		0x00,0x69,0x6E,0x69,0x74,0x44,0x41,0x49,0x2E,0x63,0x00,0x00,
		0xA6,0xB3,0xA4,0xA8,0x04,0x87,0x28,0x74,0x74,0x2E,0x68,0x00,
		0x00,0xA0,0xD9,0x84,0x93,0x06,0xAC,0x0F,0x43,0x3A,0x5C,0x50,
		0x72,0x6F,0x67,0x72,0x61,0x6D,0x20,0x46,0x69,0x6C,0x65,0x73,
		0x5C,0x41,0x6E,0x61,0x6C,0x6F,0x67,0x20,0x44,0x65,0x76,0x69,
		0x63,0x65,0x73,0x5C,0x56,0x69,0x73,0x75,0x61,0x6C,0x44,0x53,
		0x50,0x20,0x34,0x2E,0x35,0x5C,0x32,0x31,0x33,0x78,0x78,0x5C,
		0x69,0x6E,0x63,0x6C,0x75,0x64,0x65,0x5C,0x63,0x64,0x65,0x66,
		0x32,0x31,0x33,0x36,0x34,0x2E,0x68,0x00,0x01,0xC2,0xC4,0xD8,
		0xA3,0x04,0xAF,0x04,0x43,0x3A,0x5C,0x50,0x72,0x6F,0x67,0x72,
		0x61,0x6D,0x20,0x46,0x69,0x6C,0x65,0x73,0x5C,0x41,0x6E,0x61,
		0x6C,0x6F,0x67,0x20,0x44,0x65,0x76,0x69,0x63,0x65,0x73,0x5C,
		0x56,0x69,0x73,0x75,0x61,0x6C,0x44,0x53,0x50,0x20,0x34,0x2E,
		0x35,0x5C,0x32,0x31,0x33,0x78,0x78,0x5C,0x69,0x6E,0x63,0x6C,
		0x75,0x64,0x65,0x5C,0x43,0x64,0x65,0x66,0x32,0x31,0x33,0x36,
		0x33,0x2E,0x68,0x00,0x01,0xC2,0xC4,0xD8,0xA3,0x04,0x84,0xA9,
		0x02,0x43,0x3A,0x5C,0x50,0x72,0x6F,0x67,0x72,0x61,0x6D,0x20,
		0x46,0x69,0x6C,0x65,0x73,0x5C,0x41,0x6E,0x61,0x6C,0x6F,0x67,
		0x20,0x44,0x65,0x76,0x69,0x63,0x65,0x73,0x5C,0x56,0x69,0x73,
		0x75,0x61,0x6C,0x44,0x53,0x50,0x20,0x34,0x2E,0x35,0x5C,0x32,
		0x31,0x33,0x78,0x78,0x5C,0x69,0x6E,0x63,0x6C,0x75,0x64,0x65,
		0x5C,0x64,0x65,0x66,0x32,0x31,0x33,0x36,0x34,0x2E,0x68,0x00,
		0x01,0xC2,0xC4,0xD8,0xA3,0x04,0xD6,0x04,0x43,0x3A,0x5C,0x50,
		0x72,0x6F,0x67,0x72,0x61,0x6D,0x20,0x46,0x69,0x6C,0x65,0x73,
		0x5C,0x41,0x6E,0x61,0x6C,0x6F,0x67,0x20,0x44,0x65,0x76,0x69,
		0x63,0x65,0x73,0x5C,0x56,0x69,0x73,0x75,0x61,0x6C,0x44,0x53,
		0x50,0x20,0x34,0x2E,0x35,0x5C,0x32,0x31,0x33,0x78,0x78,0x5C,
		0x69,0x6E,0x63,0x6C,0x75,0x64,0x65,0x5C,0x64,0x65,0x66,0x32,
		0x31,0x33,0x36,0x33,0x2E,0x68,0x00,0x01,0xC2,0xC4,0xD8,0xA3,
		0x04,0x83,0x8B,0x08,0x43,0x3A,0x5C,0x50,0x72,0x6F,0x67,0x72,
		0x61,0x6D,0x20,0x46,0x69,0x6C,0x65,0x73,0x5C,0x41,0x6E,0x61,
		0x6C,0x6F,0x67,0x20,0x44,0x65,0x76,0x69,0x63,0x65,0x73,0x5C,
		0x56,0x69,0x73,0x75,0x61,0x6C,0x44,0x53,0x50,0x20,0x34,0x2E,
		0x35,0x5C,0x32,0x31,0x33,0x78,0x78,0x5C,0x69,0x6E,0x63,0x6C,
		0x75,0x64,0x65,0x5C,0x73,0x69,0x67,0x6E,0x61,0x6C,0x2E,0x68,
		0x00,0x01,0xC2,0xC4,0xD8,0xA3,0x04,0x91,0x55,0x43,0x3A,0x5C,
		0x50,0x72,0x6F,0x67,0x72,0x61,0x6D,0x20,0x46,0x69,0x6C,0x65,
		0x73,0x5C,0x41,0x6E,0x61,0x6C,0x6F,0x67,0x20,0x44,0x65,0x76,
		0x69,0x63,0x65,0x73,0x5C,0x56,0x69,0x73,0x75,0x61,0x6C,0x44,
		0x53,0x50,0x20,0x34,0x2E,0x35,0x5C,0x32,0x31,0x33,0x78,0x78,
		0x5C,0x69,0x6E,0x63,0x6C,0x75,0x64,0x65,0x5C,0x53,0x52,0x55,
		0x32,0x31,0x33,0x36,0x34,0x2E,0x68,0x00,0x01,0xC2,0xC4,0xD8,
		0xA3,0x04,0xD4,0x04,0x43,0x3A,0x5C,0x50,0x72,0x6F,0x67,0x72,
		0x61,0x6D,0x20,0x46,0x69,0x6C,0x65,0x73,0x5C,0x41,0x6E,0x61,
		0x6C,0x6F,0x67,0x20,0x44,0x65,0x76,0x69,0x63,0x65,0x73,0x5C,
		0x56,0x69,0x73,0x75,0x61,0x6C,0x44,0x53,0x50,0x20,0x34,0x2E,
		0x35,0x5C,0x32,0x31,0x33,0x78,0x78,0x5C,0x69,0x6E,0x63,0x6C,
		0x75,0x64,0x65,0x5C,0x73,0x72,0x75,0x32,0x31,0x33,0x36,0x33,
		0x2E,0x68,0x00,0x01,0xC2,0xC4,0xD8,0xA3,0x04,0x9A,0x9A,0x04,
		0x00,0x00,0x05,0x02;
	.var = .LN_InitDAI;
	.var =
		0x04,0x01,0x05,0x0F,0x16,0x00,0x05,0x02;
	.var = .LN1;
	.var =
		0x05,0x05,0x14,0x00,0x05,0x02;
	.var = .LN2;
	.var =
		0x0C,0x00,0x05,0x02;
	.var = .LN3;
	.var =
		0x1C,0x00,0x05,0x02;
	.var = .LN4;
	.var =
		0x0C,0x00,0x05,0x02;
	.var = .LN5;
	.var =
		0x0C,0x00,0x05,0x02;
	.var = .LN6;
	.var =
		0x15,0x00,0x05,0x02;
	.var = .LN7;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN8;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN9;
	.var =
		0x0F,0x00,0x05,0x02;
	.var = .LN10;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN11;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN12;
	.var =
		0x23,0x00,0x05,0x02;
	.var = .LN13;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN14;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN15;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN16;
	.var =
		0x16,0x00,0x05,0x02;
	.var = .LN17;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN18;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN19;
	.var =
		0x0F,0x00,0x05,0x02;
	.var = .LN20;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN21;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN22;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN23;
	.var =
		0x0D,0x00,0x05,0x02;
	.var = .LN24;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN25;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN26;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN27;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN28;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN29;
	.var =
		0x0A,0x00,0x05,0x02;
	.var = .LN30;
	.var =
		0x05,0x01,0x0D,0x00,0x05,0x02;
	.var = .LN._InitDAI.end;
	.var =
		0x00,0x01,0x01;
.epcline.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.var =
		0x1A,0x00,0x00,0x00,0x02,0x00;
	.var = .epcdebug;
	.var =
		0x4C,0x02,0x00,0x00,0x23,0x02,0x00,0x00,0x49,0x6E,0x69,0x74,
		0x44,0x41,0x49,0x00,0x00,0x00,0x00,0x00;
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
	.var = .LN_InitDAI;
	.var = .LN._InitDAI.end-.LN_InitDAI;
	.var =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.var =
		0x01,0x00,0x00,0x00,0x1C,0x02,0x00,0x00,0x2A,0x00,0x00,0x00,
		0x69,0x6E,0x69,0x74,0x44,0x41,0x49,0x2E,0x63,0x00,0x0C,0x00,
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
		0x00,0x00,0x00,0x00,0x00,0x00,0x54,0x00,0x00,0x00,0x16,0x00,
		0x00,0x00,0x00,0x00,0x00,0x00,0x4D,0x6F,0x6E,0x20,0x4E,0x6F,
		0x76,0x20,0x32,0x30,0x20,0x31,0x37,0x3A,0x32,0x38,0x3A,0x35,
		0x34,0x20,0x32,0x30,0x32,0x33,0x0A,0x00,0x36,0x00,0x00,0x00,
		0x5B,0x01,0x00,0x00,0x16,0x00,0x00,0x00,0x01,0x00,0x00,0x00,
		0x2D,0x63,0x20,0x2D,0x66,0x69,0x6C,0x65,0x2D,0x61,0x74,0x74,
		0x72,0x20,0x50,0x72,0x6F,0x6A,0x65,0x63,0x74,0x4E,0x61,0x6D,
		0x65,0x3D,0x46,0x78,0x4C,0x4D,0x53,0x5F,0x77,0x69,0x74,0x68,
		0x5F,0x41,0x33,0x5F,0x69,0x6E,0x74,0x65,0x72,0x70,0x6F,0x6C,
		0x20,0x2D,0x4F,0x20,0x2D,0x4F,0x76,0x31,0x30,0x30,0x20,0x2D,
		0x67,0x20,0x2D,0x73,0x61,0x76,0x65,0x2D,0x74,0x65,0x6D,0x70,
		0x73,0x20,0x2D,0x70,0x61,0x74,0x68,0x2D,0x6F,0x75,0x74,0x70,
		0x75,0x74,0x20,0x44,0x65,0x62,0x75,0x67,0x20,0x2D,0x45,0x44,
		0x20,0x2D,0x6E,0x6F,0x2D,0x6D,0x75,0x6C,0x74,0x69,0x6C,0x69,
		0x6E,0x65,0x20,0x2D,0x64,0x6F,0x75,0x62,0x6C,0x65,0x2D,0x73,
		0x69,0x7A,0x65,0x2D,0x33,0x32,0x20,0x2D,0x66,0x6C,0x61,0x67,
		0x73,0x2D,0x63,0x6F,0x6D,0x70,0x69,0x6C,0x65,0x72,0x20,0x2D,
		0x2D,0x64,0x69,0x61,0x67,0x5F,0x77,0x61,0x72,0x6E,0x69,0x6E,
		0x67,0x2C,0x69,0x6D,0x70,0x6C,0x69,0x63,0x69,0x74,0x5F,0x66,
		0x75,0x6E,0x63,0x5F,0x64,0x65,0x63,0x6C,0x20,0x2D,0x77,0x61,
		0x72,0x6E,0x2D,0x70,0x72,0x6F,0x74,0x6F,0x73,0x20,0x2D,0x66,
		0x6F,0x72,0x63,0x65,0x2D,0x63,0x69,0x72,0x63,0x62,0x75,0x66,
		0x20,0x2D,0x70,0x72,0x6F,0x63,0x20,0x41,0x44,0x53,0x50,0x2D,
		0x32,0x31,0x33,0x36,0x34,0x20,0x2D,0x6F,0x20,0x44,0x65,0x62,
		0x75,0x67,0x5C,0x69,0x6E,0x69,0x74,0x44,0x41,0x49,0x2E,0x64,
		0x6F,0x6A,0x20,0x2D,0x4D,0x4D,0x00,0x60,0x00,0x00,0x00,0x76,
		0x01,0x00,0x00,0x16,0x00,0x00,0x00,0x2E,0x00,0x00,0x00,0x41,
		0x44,0x53,0x50,0x2D,0x32,0x31,0x33,0x36,0x34,0x00,0x67,0x01,
		0x00,0x00,0xA8,0x01,0x00,0x00,0x16,0x00,0x00,0x00,0x2D,0x00,
		0x00,0x00,0x30,0x2E,0x32,0x00,0x82,0x01,0x00,0x00,0x69,0x6E,
		0x69,0x74,0x44,0x41,0x49,0x2E,0x63,0x00,0x8A,0x01,0x00,0x00,
		0x0E,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
		0x00,0x00,0x00,0x00,0xC2,0x01,0x00,0x00,0x94,0x01,0x00,0x00,
		0x30,0x00,0x00,0x00,0x0C,0x00,0x00,0x00,0x77,0x6F,0x72,0x64,
		0x73,0x00,0xB8,0x01,0x00,0x00,0xEF,0x01,0x00,0x00,0x94,0x01,
		0x00,0x00,0x34,0x00,0x00,0x00,0x7B,0x72,0x30,0x2D,0x72,0x32,
		0x2C,0x72,0x34,0x2C,0x72,0x38,0x2C,0x72,0x31,0x32,0x2C,0x69,
		0x34,0x2C,0x69,0x31,0x32,0x2C,0x61,0x63,0x63,0x7D,0x00,0xCE,
		0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x94,0x01,0x00,0x00,0x35,
		0x00,0x00,0x00,0x7B,0x72,0x33,0x2C,0x72,0x35,0x2D,0x72,0x37,
		0x2C,0x72,0x39,0x2D,0x72,0x31,0x31,0x2C,0x72,0x31,0x33,0x2D,
		0x72,0x31,0x35,0x7D,0x00,0xFB,0x01,0x00,0x00,0x00,0x00,0x00;
.epcannot.end:
