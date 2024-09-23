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


int main(int argc, char *argv[])
{
    volatile unsigned int *END_SW_P = SAFE_WRAPPER_CTRL_END_SW_ROUTINE_OFFSET;
    *END_SW_P = 0x0;

    printf("[IP_CB]: hello world...!\n");
    *END_SW_P = 0x1;
    while(1){asm volatile("wfi");}
    return 0;
    //return EXIT_SUCCESS;

}

