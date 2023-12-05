#include "tt.h"
#include <stdlib.h>
#include "filt_num.h"	//szûrõ együtthatók méretének definíciója

float filter4one(float b[], int N_b, float a[], int N_a, float state[], float memory[], float input)	// N_state=N_a & N_memory=N_b
{
	float output = 0;
	int k = 0;
	// Memory
	for (k = N_b-1; 0 < k; k--)
		memory[k] = memory[k-1];
	memory[0] = input;
	
	// Filtering
	for (k = 0; k < N_b; k++)
		output += b[k]*memory[k];
	for (k = 1; k < N_a; k++)
		output -= a[k]*state[k];
	
	// State
	for (k = N_a-1; 0 < k; k--)
		state[k] = state[k-1];
	state[0] = output;
	
	return output;
}
 
void LMS(float *coefs_filter, int N, float mu, float* input, int iInd, float* output, int oInd, float *y_est, float *err)
{
    (*y_est) = 0;
	(*y_est) = conv_asm( coefs_filter, &(input[iInd]), input, N);
	(*err)   = output[oInd] - *y_est;
		
		
	int k = 0; 
	int k_input = iInd;
	for(k; k<N1; k++)
	{  
		coefs_filter[k] = coefs_filter[k] + mu * (*err) * input[k_input%N];		    
		k_input++;
	}
	
}
