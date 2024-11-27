
#include <stdio.h>
#include <stdlib.h>
#include "CB_Safety.h"

#define SIZE    128
#define BASEADDRESS 0xF002C000

int main(int argc, char *argv[])
{

    volatile unsigned int *A = BASEADDRESS;
    volatile unsigned int *B = BASEADDRESS + 128*4;
    volatile unsigned int *C = BASEADDRESS + 256*4;    


// Mult_Vector
    for(int i = 0; i < 128 ; i++)
        C[i] = A[i] * B[i];


    printf("[IP_CB]: hello world...!\n");   
    return 0;
    //return EXIT_SUCCESS;
/************************************************/

}

