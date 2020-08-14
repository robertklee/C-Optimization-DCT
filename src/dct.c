#include "dct.h"
#include "util/helpers.h"
#include "util/constants.h"

#include <stdio.h>

#include "dct/naive.h"
#include "dct/twostep_slow.h"
#include "dct/loeffler_float.h"
#include "dct/loeffler_fixed.h"
#include "dct/loeffler_2d_fixed.h"

void run_dct(const DataType *data, long width, long height, void (*dct_func)(DataType[8][8], int16_t[8][8]) )
{
    long width_strides = width / 8;
    long height_strides = height / 8;
    int i, j, k, l;
    for (i = 0; i < height_strides; ++i) {
        for (j = 0; j < width_strides; ++j) {
            DataType image_region[8][8];
            int16_t dct_output_region[8][8];
            // copy image into tmp
            for (k = 0; k < 8; ++k) {
                for (l = 0; l < 8; ++l) {
                    int index = ((i * 8) + k) * width + ((j * 8) + l);
                    image_region[k][l] = data[index];
                }
            }
            // Call dct function
            (*dct_func)(image_region, dct_output_region);
            // print it out
//            printf("Region %d, %d:\n", i, j);
            for (k = 0; k < 8; ++k) {
//                print_line(dct_output_region[k], kUint16);
            }
        }
    }
}

// Do-nothing function that just copies input to output. This is only useful as a way
// of using run_dct to print out the input in the same way it prints out the output.
void copy_data(DataType data_in[8][8], int16_t data_out[8][8])
{
    int i, j;
    for (i = 0; i < 8; ++i) {
        for (j = 0; j < 8; ++j) {
            data_out[i][j] = data_in[i][j];
        }
    }
}

void dct(DataType *data, long width, long height, ExecutionMode executionMode)
{
    if (width % 8 != 0 || height % 8 != 0)
    {
        printf("Invalid block size.\n");
        return;
    } 

    // Print input (by using copy_data as the dct function parameter to run_dct)
//    printf("Input:\n");
    run_dct(data, width, height, copy_data);

    if (executionMode == NAIVE || executionMode == ALL) {
        // First: naive implementation
//        printf("\nNaive implementation:\n");
        run_dct(data, width, height, dct_naive);
    }

    if (executionMode == TWO_STEP || executionMode == ALL) {
        // Second: twostep implementation
//        printf("\nTwo-step implementation:\n");
        run_dct(data, width, height, dct_twostep_slow);
    }
    
    if (executionMode == LOEFFLER_FLOAT || executionMode == ALL) {
        // Third: loeffler floating-point implementation
//        printf("\nLoeffler floating-point implementation:\n");
        run_dct(data, width, height, dct_loeffler_float);
    }
    
    if (executionMode == LOEFFLER_FIXED || executionMode == ALL) {
        // Fourth: loeffler fixed-point implementation
//        printf("\nLoeffler fixed-point implementation:\n");
        run_dct(data, width, height, dct_loeffler_fixed);
    }

    if (executionMode == LOEFFLER_2D_FIXED || executionMode == ALL) {
        // Fifth: loeffler fixed-point implementation with direct 2d transform
//        printf("\nLoeffler fixed-point implementation in direct 2d:\n");
        run_dct(data, width, height, dct_loeffler_2d_fixed);
    }
}
