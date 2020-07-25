#include "dct.h"
#include "util/helpers.h"
#include "util/constants.h"

#include <stdio.h>

#include "dct/naive.h"
#include "dct/twostep_slow.h"
#include "dct/loeffler_float.h"

void run_dct(const uint8_t *data, long width, long height, void (*dct_func)(const uint8_t[8][8], int16_t[8][8]) )
{
    long width_strides = width / 8;
    long height_strides = height / 8;
    for (int i = 0; i < height_strides; ++i) {
        for (int j = 0; j < width_strides; ++j) {
            uint8_t image_region[8][8];
            int16_t dct_output_region[8][8];
            // copy image into tmp
            for (int k = 0; k < 8; ++k) {
                for (int l = 0; l < 8; ++l) {
                    int index = ((i * 8) + k) * width + ((j * 8) + l);
                    image_region[k][l] = data[index];
                }
            }
            // Call dct function
            (*dct_func)(image_region, dct_output_region);
            // print it out
            printf("Region %d:\n", i * j);
            for (int l = 0; l < 8; ++l) {
                print_line(dct_output_region[l], kUint16);
            }
        }
    }
}

// Do-nothing function that just copies input to output. This is only useful as a way
// of using run_dct to print out the input in the same way it prints out the output.
void copy_data(const uint8_t data_in[8][8], int16_t data_out[8][8])
{
    for (int i = 0; i < 8; ++i) {
        for (int j = 0; j < 8; ++j) {
            data_out[i][j] = data_in[i][j];
        }
    }
}

void dct(uint8_t *data, long width, long height, ExecutionMode executionMode)
{
    if (width % 8 != 0 || height % 8 != 0)
    {
        printf("Invalid block size.\n");
        return;
    } 

    // Print input (by using copy_data as the dct function parameter to run_dct)
    printf("Input:\n");
    run_dct(data, width, height, copy_data);

    if (executionMode == NAIVE || executionMode == ALL) {
        // First: naive implementation
        printf("\nNaive implementation:\n");
        run_dct(data, width, height, dct_naive);
    }

    if (executionMode == TWO_STEP || executionMode == ALL) {
        // Second: twostep implementation
        printf("\nTwo-step implementation:\n");
        run_dct(data, width, height, dct_twostep_slow);
    }
    
    if (executionMode == LOUFFLER_FLOAT || executionMode == ALL) {
        // Third: loeffler floating-point implementation
        printf("\nLoeffler floating-point implementation:\n");
        run_dct(data, width, height, dct_loeffler_float);
    }
}
