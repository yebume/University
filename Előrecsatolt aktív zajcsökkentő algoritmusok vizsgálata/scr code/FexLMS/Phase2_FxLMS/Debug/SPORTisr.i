# 1 "SPORTisr.c"

















 










 



# 1 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\stdio.h"






 

#pragma once

#pragma system_header /* stdio.h */





# 24 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\stdio.h"





# 35 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\stdio.h"

 











typedef unsigned long fpos_t;




typedef long unsigned int size_t;






 



# 1 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\stdio_21xxx.h"






 








 

#pragma once

#pragma system_header /* stdio_21xxx.h */









# 37 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\stdio_21xxx.h"

int _snprintf32(char *_s, size_t _n, const char *_format, ...);
int _vsnprintf32(char *_s, size_t _n, const char *_format, char *_va_list);





# 65 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\stdio.h"



  

typedef struct {
    unsigned int    _Mode;
    int             fileID;
    unsigned long   _Next;    
    unsigned long   _Rend;    
    unsigned long   _Wend;    
 
    unsigned char*  bufadr;
    unsigned long   _Buf;
    unsigned char*  _Bend;
    unsigned long   rsave;
    unsigned char   _Back[2];
    unsigned char   onechar;
    int             nback;
}
	FILE;







extern FILE*    _Files[10];




# 120 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\stdio.h"

void clearerr(FILE*);
int fclose(FILE*);
int feof(FILE*);
int ferror(FILE*);
int fflush(FILE*);
int fgetc(FILE*);
int fgetpos(FILE*, fpos_t*);
char* fgets(char*, int, FILE*);
FILE* fopen(const char*, const char* _mods);
int _fprintf32(FILE* _stream, const char* _format, ...);
int fputc(int, FILE*);
int fputs(const char*, FILE*);
size_t fread(void* _buf, size_t _sz, size_t _nElem, FILE*);
FILE* freopen(const char*, const char* _mods, FILE*);
int _fscan32(FILE*, const char* _fmt, ...);
int fseek(FILE*, long _off, int _smode);
int fsetpos(FILE*, const fpos_t*);
long ftell(FILE*);
size_t fwrite(const void* _buf, size_t _sz, size_t _nElem, FILE*);
int getc(FILE*);
int getchar(void);
char* gets(char*);
void perror(const char*);
int _printf32(const char* _fmt, ...);
int putc(int, FILE*);
int putchar(int);
int puts(const char*);
int remove(const char*);
int rename(const char* _oldname, const char* _newname);
void rewind(FILE*);
int _scanf32(const char* _fmt, ...);
void setbuf(FILE*, char*);
int setvbuf(FILE*, char*, int, size_t);
int _sprintf32(char* _buf, const char* _fmt, ...);
int _sscanf32(const char* _buf, const char* _fmt, ...);
int ungetc(int, FILE*);
int _vfprintf32(FILE*, const char*, char*);
int _vprintf32(const char*, char*);
int _vsprintf32(char*, const char*, char*);










# 34 "SPORTisr.c"
# 1 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\cycle_count.h"






 



 

#pragma once

#pragma system_header /* cycle_count.h */






 
# 1 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\xcycle_count.h"






 



 






#pragma once

#pragma system_header /* xcycle_count.h */


# 1 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\limits.h"






 

 


























# 24 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\xcycle_count.h"


 


typedef  volatile unsigned long       _cycle_t;



# 44 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\xcycle_count.h"












 


 

# 1 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\cycle_count_21xxx.h"






 



 

#pragma once

#pragma system_header /* cycle_count_21xxx.h */






 


# 73 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\cycle_count_21xxx.h"
 

# 103 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\cycle_count_21xxx.h"




 
 

 



# 130 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\cycle_count_21xxx.h"

   



# 63 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\xcycle_count.h"
# 70 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\xcycle_count.h"

 

extern volatile int _Processor_cycles_per_sec;


# 24 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\cycle_count.h"


typedef  _cycle_t    cycle_t;













 


# 50 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\cycle_count.h"
 





# 35 "SPORTisr.c"
# 1 "tt.h"









# 1 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\cdef21364.h"






 

 





 





# 1 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\Cdef21363.h"






 













 








# 58 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\Cdef21363.h"


# 107 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\Cdef21363.h"


# 155 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\Cdef21363.h"


# 203 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\Cdef21363.h"


# 217 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\Cdef21363.h"


# 229 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\Cdef21363.h"




# 248 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\Cdef21363.h"







# 303 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\Cdef21363.h"








# 317 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\Cdef21363.h"






















# 346 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\Cdef21363.h"









# 361 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\Cdef21363.h"




 
# 378 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\Cdef21363.h"
































# 421 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\Cdef21363.h"

# 433 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\Cdef21363.h"

# 445 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\Cdef21363.h"

# 22 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\cdef21364.h"

# 11 "tt.h"
# 1 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21364.h"






 










# 1 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"



















 


























































































 





# 149 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"








# 185 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 234 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 282 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 330 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 344 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 356 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"




# 375 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"







# 430 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"








# 444 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"






















# 473 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"









# 488 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"





# 505 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"













# 529 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"

# 541 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"

# 553 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"

# 565 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 574 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"





# 600 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 611 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"



# 645 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"

# 669 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"



# 680 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"

# 691 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 721 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 751 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 780 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 806 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"



# 825 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"

# 842 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"








# 867 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"



# 892 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 915 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"






# 941 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"






# 954 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"







# 970 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 986 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 1289 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 1366 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"







# 1417 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 1431 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 1440 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 1521 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"




























# 1555 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"








# 1583 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 1605 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 1636 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 1651 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 1678 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"




# 1708 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"



# 1735 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"




# 1755 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"































# 1794 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"










# 1834 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 1861 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 1883 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"






















# 1933 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"

 
# 1942 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"







# 1981 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 2015 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 2026 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 2052 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 2086 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 2120 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"



# 2131 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"



# 2158 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


            









# 2202 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 2236 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"



 
# 2247 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"

 
# 2256 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"

 
# 2265 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"

 
# 2274 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"

 










 










 










 










 





 





 





 








# 2378 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"


# 2412 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21363.h"











# 19 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\def21364.h"



# 12 "tt.h"
# 1 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\signal.h"






 




# 40 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\signal.h"

 

# 86 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\signal.h"

 
 
# 160 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\signal.h"

 

# 212 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\signal.h"

 








# 246 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\signal.h"
                                

                                
# 264 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\signal.h"

# 294 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\signal.h"






 


# 310 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\signal.h"








 

typedef int sig_atomic_t;





void (*signal(int _sig, void (*func)(int))) (int);
void (*signalf(int _sig, void (*func)(int))) (int);
void (*signals(int _sig, void (*func)(int))) (int);
void (*signalcb(int _sig, void (*func)(int))) (int);
void (*signalss(int _sig, void (*func)(int))) (int);

void (*signalnsm(int _sig, void (*func)(int))) (int);
void (*signalfnsm(int _sig, void (*func)(int))) (int);
void (*signalsnsm(int _sig, void (*func)(int))) (int);
void (*signalcbnsm(int _sig, void (*func)(int))) (int);
void (*signalssnsm(int _sig, void (*func)(int))) (int);

void (*interrupt(int _sig, void (*func)(int))) (int);
void (*interruptf(int _sig, void (*func)(int))) (int);
void (*interrupts(int _sig, void (*func)(int))) (int);
void (*interruptcb(int _sig, void (*func)(int))) (int);
void (*interruptss(int _sig, void (*func)(int))) (int);

void (*interruptnsm(int _sig, void (*func)(int))) (int);
void (*interruptfnsm(int _sig, void (*func)(int))) (int);
void (*interruptsnsm(int _sig, void (*func)(int))) (int);
void (*interruptcbnsm(int _sig, void (*func)(int))) (int);
void (*interruptssnsm(int _sig, void (*func)(int))) (int);

int raise(int);
int raisensm(int);

int clear_interrupt(int _sig);







# 13 "tt.h"











#pragma optimize_off
extern void InitPLL(void);
extern void process(void);

extern void InitDAI(void);
extern void DAIsigInit(void);
extern void setDAIproc(void);
extern void clrDAIproc(void);

extern float conv_asm( float * coef, float * inCur, float * inBase, unsigned int bufSize);	

extern void Init1835viaSPI(void);

extern void InitSPORT(void);
extern void receive(int);
extern void ClearSPORT(void);

extern void SetupSPI1835 () ;
extern void DisableSPI1835 () ;
extern void Configure1835Register (int i) ;
extern unsigned int Get1835Register (int i) ;
extern void Init1835viaSPI_PowerDwn();

extern void SetupIRQ12 () ;
extern void Irq1ISR (int i) ;
extern void Irq2ISR (int i) ;

extern void Delay (int i) ;


extern int isProcessing;
extern int dataReady;



extern unsigned int Block_A[2] ;
extern unsigned int Block_B[2] ;
extern unsigned int Block_C[2] ;


extern float rightIn  , leftIn;
extern float rightOut1, leftOut1;
extern float rightOut2, leftOut2;
extern float rightOut3, leftOut3;
extern float rightOut4, leftOut4;

extern int rightIn_i  , leftIn_i;
extern int rightOut1_i, leftOut1_i;
extern int rightOut2_i, leftOut2_i;
extern int rightOut3_i, leftOut3_i;
extern int rightOut4_i, leftOut4_i;






# 36 "SPORTisr.c"


# 1 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\stdlib.h"






 

#pragma once

#pragma system_header /* stdlib.h */





# 24 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\stdlib.h"

















  typedef int wchar_t;



typedef struct {int quot; int rem;} div_t;
typedef struct {long int quot; long int rem;} ldiv_t;





  div_t  div(int _numer, int _denom);
  ldiv_t ldiv(long _numer, long _denom);





# 67 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\stdlib.h"









 




  int __atoiD(const char __dm *_a);
  int __atoiP(const char __pm *_a);

  long __atolD(const char __dm *_a);
  long __atolP(const char __pm *_a);

  long __strtolDD(const char __dm *_a, char __dm **_b, int _base);
  long __strtolDP(const char __dm *_a, char __pm **_b, int _base);
  long __strtolPD(const char __pm *_a, char __dm **_b, int _base);
  long __strtolPP(const char __pm *_a, char __pm **_b, int _base);

  unsigned long __strtoulDD(const char __dm *a, char __dm **b, int _base);
  unsigned long __strtoulDP(const char __dm *a, char __pm **b, int _base);
  unsigned long __strtoulPD(const char __pm *a, char __dm **b, int _base);
  unsigned long __strtoulPP(const char __pm *a, char __pm **b, int _base);

# 172 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\stdlib.h"

  int atoi(const char *a);


  long atol(const char *a);


  long strtol(const char *a, char **b, int _base);


  unsigned long strtoul(const char *a, char **b, int _base);














 




  float __atoffD(const char __dm *_bptr);
  float __atoffP(const char __pm *_bptr);

  long double __atofD(const char __dm *_bptr);
  long double __atofP(const char __pm *_bptr);

_Pragma(""linkage_name ___atofD")            _Pragma("linkage_name ___atofD")
  long double atold(const char *_bptr);

  float __strtodfDD(const char __dm *_nptr, char __dm **_endptr);
  float __strtodfDP(const char __dm *_nptr, char __pm **_endptr);
  float __strtodfPD(const char __pm *_nptr, char __dm **_endptr);
  float __strtodfPP(const char __pm *_nptr, char __pm **_endptr);

  long double __strtodDD(const char __dm *_nptr, char __dm **_endptr);
  long double __strtodDP(const char __dm *_nptr, char __pm **_endptr);
  long double __strtodPD(const char __pm *_nptr, char __dm **_endptr);
  long double __strtodPP(const char __pm *_nptr, char __pm **_endptr);

_Pragma(""linkage_name ___strtodDD")            _Pragma("linkage_name ___strtodDD")
  long double strtold(const char *_nptr, char **_endptr);


# 297 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\stdlib.h"


  double atof(const char *_bptr);

  double strtod(const char *_nptr, char **_endptr);







# 316 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\stdlib.h"







 




  int  abs(int _j);
  int  avg(int _a, int _b);
  int  max(int _a, int _b);
  int  min(int _a, int _b);
  int  clip(int _a, int _b);

  long labs(long _j);
  long lavg(long _a, long _b);
  long lmax(long _a, long _b);
  long lmin(long _a, long _b);
  long lclip(long _a, long _b);

# 349 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\stdlib.h"

# 364 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\stdlib.h"

# 408 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\stdlib.h"








 




  int    rand(void);
  void   srand(unsigned int _seed);

  void  *calloc(size_t _nmemb, size_t _size);
  void  *malloc(size_t _size);
  void  *realloc(void *_prt, size_t _size);
  void   free(void *_ptr);

#pragma noreturn
  void   abort(void);
#pragma noreturn
_Pragma(""linkage_name __exit")
_Pragma("linkage_name __exit")

  void   exit(int _status);

  char  *getenv(const char *_name);
  int    system(const char *_string);


  typedef void _t_atexit_fp(void);
  typedef int _t_compare_fp(const void *, const void *);

  int   atexit(_t_atexit_fp);

  void *bsearch(const void*, const void*, size_t, size_t, _t_compare_fp);
  void  qsort(void*, size_t, size_t, _t_compare_fp);

# 474 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\stdlib.h"







 




  int    _heap_lookup_name(char * _heap_name);
  void  *_heap_calloc(int _heap_index, size_t _nmemb, size_t _size);
  void   _heap_free(int _heap_index, void *_ptr);
  void  *_heap_malloc(int _heap_index, size_t _size);
  void  *_heap_realloc(int _heap_index, void *_prt, size_t _size);
  int    _heap_install(void *base, size_t length, int userid, int pmdm  );


  int    _heap_switch(int _heap_index);
  int    set_alloc_type(char * _heap_name);






# 508 "C:\\Program Files\\Analog Devices\\VisualDSP 4.5\\213xx\\include\\stdlib.h"











 




  int count_ones(int x);
  
_Pragma(""linkage_name _count_ones")                   _Pragma("linkage_name _count_ones")
  int lcount_ones(long x);








# 39 "SPORTisr.c"
# 1 "filt_num.h"

# 40 "SPORTisr.c"










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


float __pm coefs_int[(41)] = {
# 1 "coef_int.dat"
-0.001274,
-0.007595,
-0.010702,
-0.017447,
-0.024815,
-0.032741,
-0.040185,
-0.046046,
-0.049109,
-0.048231,
-0.042517,
-0.031473,
-0.015152,
0.005806,
0.030144,
0.056110,
0.081607,
0.104415,
0.122456,
0.134026,
0.138010,
0.134026,
0.122456,
0.104415,
0.081607,
0.056110,
0.030144,
0.005806,
-0.015152,
-0.031473,
-0.042517,
-0.048231,
-0.049109,
-0.046046,
-0.040185,
-0.032741,
-0.024815,
-0.017447,
-0.010702,
-0.007595,
-0.001274,
# 78 "SPORTisr.c"
	};
float outArr[(41)] = {};
float interpol = 0;
	
	
#pragma align 4
float __dm inputR[(41)+1];
#pragma align 4
float __dm inputL[(41)+1];
#pragma align 4
float __dm noiseN[(41)+1];
float out_1;
float out_test1;

int l = 0;
int i_dec = 0;
int i_int = 0;


extern float noise_n;
extern float noise1[(500)+1];
extern float RightInPrev;
extern float alpha;
extern float err1;
extern float err3;
extern float inRdata;
extern float out_2;

extern int fxlmsFlag;
extern int identFlag;
extern int ident3Flag;
extern int resetFlag;






int isProcessing=0;

int dataReady=0;





void ProcessingTooLong(void)
{
    while(1);
}

#pragma optimize_for_speed


_Bool channelCheck;

void receive(int sig_int)
{



channelCheck = !!((*((volatile unsigned int *) 0x24B9))&(0x00002000));



if ( channelCheck	){  

        *((volatile unsigned int *) 0xc66) = rightOut2_i;
        *((volatile unsigned int *) 0xc66) = leftOut2_i;

        

        *((volatile unsigned int *) 0x460) = rightOut3_i;
        *((volatile unsigned int *) 0x460) = leftOut3_i;

        

        *((volatile unsigned int *) 0x462) = rightOut4_i;
        *((volatile unsigned int *) 0x462) = leftOut4_i;



        *((volatile unsigned int *) 0xc64) = rightOut1_i;
        *((volatile unsigned int *) 0xc64) = leftOut1_i;

	
} else {
    

        *((volatile unsigned int *) 0xc66) = leftOut2_i;
        *((volatile unsigned int *) 0xc66) = rightOut2_i;

        

        *((volatile unsigned int *) 0x460) = leftOut3_i;
        *((volatile unsigned int *) 0x460) = rightOut3_i;

        

        *((volatile unsigned int *) 0x462) = leftOut4_i;
        *((volatile unsigned int *) 0x462) = rightOut4_i;



        *((volatile unsigned int *) 0xc64) = leftOut1_i;
        *((volatile unsigned int *) 0xc64) = rightOut1_i;

    
    
}


if (1==isProcessing	){
		asm volatile(
	     		"%0 = mode1;\n\t"
	     		: "=d" (mode1RegSPisr): :);
					}

if (0==isProcessing	){
		asm volatile(
	     		"%0 = mode1;\n\t"
	     		: "=d" (mode1RegSPisr2): :);
					}
        


					
					
if ( channelCheck	){   

	        rightIn_i = (int) Block_A[0];  
        	leftIn_i  = (int) Block_A[1];  
} else{

        	leftIn_i  = (int) Block_A[0];
 	        rightIn_i = (int) Block_A[1];   
    
}       	
	
        	rightIn = (float)rightIn_i / (float)(16777216/2);        
        	leftIn  = (float)leftIn_i  / (float)(16777216/2); 					
			 

                     

	rightOut1D = rightOut1;                        
	 leftOut1D =  leftOut1;                        
	rightOut2D = rightOut2;                        
	 leftOut2D =  leftOut2;                        
	rightOut3D = rightOut3;                        
	 leftOut3D =  leftOut3;                        
	rightOut4D = rightOut4;                        
	 leftOut4D =  leftOut4;                        




        rightOut1_i = (unsigned int)(rightOut1D * (16777216/2));
        leftOut1_i  = (unsigned int)( leftOut1D * (16777216/2));



        rightOut2_i = (unsigned int)(rightOut2D * (16777216/2));
        leftOut2_i  = (unsigned int)( leftOut2D * (16777216/2));

        rightOut3_i = (unsigned int)(rightOut3D * (16777216/2));
        leftOut3_i  = (unsigned int)( leftOut3D * (16777216/2));

        rightOut4_i = (unsigned int)(rightOut4D * (16777216/2));
        leftOut4_i  = (unsigned int)( leftOut4D * (16777216/2));



	     if ((rightOut1_i)>(0x007FFFFF)) rightOut1_i = 0x007FFFFF; if ((rightOut1_i)<(-0x007FFFFF)) rightOut1_i = -0x007FFFFF;;
	     if ((leftOut1_i)>(0x007FFFFF)) leftOut1_i = 0x007FFFFF; if ((leftOut1_i)<(-0x007FFFFF)) leftOut1_i = -0x007FFFFF;;


	i_dec--;
	if (0>i_dec)
	{
		i_dec = (41)-1;
	}

	i_int--;
	if (0>i_int)
	{
		i_int = (41)-1;
	}
	
	
	
	rightIn = rightIn - RightInPrev;
	RightInPrev = alpha * rightIn + RightInPrev;
	
   	inputR[i_dec] = rightIn;	
   	inputL[i_dec] = leftIn;		
   	
	if (0==i_dec){
		inputR[(41)] = rightIn;  
		inputL[(41)] =  leftIn;  
		
    }
    
    l--;
	if (l<0)
	{
		l = 5;
	}
	if (l == 0)
	{
		dataReady   = 1;	
	}

	
	
	outArr[i_int] = out_1;
	interpol = conv_asm( coefs_int, &(outArr[i_int]), outArr, (41));
		
	
	rightOut1 = interpol;
	 leftOut1 = rightIn;	
	 
	rightOut2 = out_2; 		
	 leftOut2 = inRdata;	
	 
	rightOut3 = err1;		
	leftOut3 = 	err3;		
  	
    	

                
    

}
