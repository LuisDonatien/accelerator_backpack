/*
 * Copyright 2020 ETH Zurich
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Author: Robert Balas <balasr@iis.ee.ethz.ch>
 */

#include <stdio.h>
#include <stdlib.h>
#include "CB_Safety.h"

float __attribute__((noinline)) floatMul(float A, float B) { 
    return A + B; 
}
volatile uint32_t *p1 = 0xF0028000;
int main(int argc, char *argv[])
{
//    TMR_Safe_Activate(DMR_MODE);
//    float *P=0x90000;
//    (*P) * 2.0;
//    *(P+2) = 0x1;  
//    printf("[IP_CEI]: hello world...!\n");
//    *(P+2) = 0x3; 
for (int i=0;i<10000;i++){
    *p1=0xdeadbee1;
    *p1=0xdeadbee1;
    *p1=0xdeadbee1;
    *p1=0xdeadbee1;
    *p1=0xdeadbee1;
    *p1=0xdeadbee1;
}
///    printf("[IP_CEI]: Hello F-HEEP! %x\n",floatMul(0.1f, 0.4f));
//    printf("[IP_CEI]: Hello world\n");
//    TMR_Safe_Stop(MASTER_CORE0);
    return 0;
    //return EXIT_SUCCESS;
}

