#include "dct/loeffler_2d_fixed_macro.h"

#include "util/constants.h"

void dct_2d_fixed_macro(DataType data_in[8][8], compute_t data[8][8])
{
    compute_t temp_value; // extra temporary value
    uint8_t i;
    // Perform on rows
    for (i = 0; i < 8; ++i)
    {
        // values are 7-bit + 1 sign bit

        // STAGE 1
        temp_value = data_in[i][0] + data_in[i][7]; // actually out[0]
        data[i][7] = data_in[i][0] - data_in[i][7]; // actually out[7]
        data[i][0] = data_in[i][1] + data_in[i][6]; // actually out[1]
        data[i][6] = data_in[i][1] - data_in[i][6]; // actually out[6]
        data[i][1] = data_in[i][2] + data_in[i][5]; // actually out[2]
        data[i][5] = data_in[i][2] - data_in[i][5]; // actually out[5]
        data[i][2] = data_in[i][3] + data_in[i][4]; // actually out[3]
        data[i][4] = data_in[i][3] - data_in[i][4]; // actually out[4]
        // values are 8-bit + 1 sign bit

        // STAGE 2
        // top four:
        data[i][3] = temp_value + data[i][2]; // actually out[0]
        temp_value = temp_value - data[i][2]; // actually out[3]
        data[i][2] = data[i][0] + data[i][1]; // actually out[1]
        data[i][0] = data[i][0] - data[i][1]; // actually out[2]
        // bottom four:
        BUTTERFLY_2D_FIXED(data[i][5], data[i][6], data[i][5], data[i][6], C1_1, C1_2, C1_3); // C1 rotator: actually results in out[5] and out[6]
        BUTTERFLY_2D_FIXED(data[i][4], data[i][7], data[i][4], data[i][7], C3_1, C3_2, C3_3); // C3 rotator: actually results in out[4] and out[7]
        // these values are 9-bit + 1 sign bit

        // STAGE 3
        // top four:
        data[i][1] = data[i][3] + data[i][2]; // actually out[0]
        data[i][3] = data[i][3] - data[i][2]; // actually out[1]
        BUTTERFLY_2D_FIXED(data[i][0], temp_value, data[i][0], temp_value, C6_1, C6_2, C6_3); // R2C6 rotator: actually results in out[2] and out[3]
        // bottom four:
        data[i][2] = data[i][7] - data[i][5]; // actually out[5]
        data[i][7] = data[i][7] + data[i][5]; // actually out[7]
        data[i][5] = data[i][4] - data[i][6]; // actually out[6]
        data[i][4] = data[i][4] + data[i][6]; // actually out[4]
        // these values are 10-bit + 1 sign bit

        // STAGE 4
        data[i][5] = DCT_RT2 * data[i][5] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[6] -> X[5]
        data[i][6] = temp_value; // x[3] -> X[6]
        temp_value = data[i][7] + data[i][4]; // x[7] -> X[1] (store as temp due to dependencies)
        data[i][7] = data[i][7] - data[i][4]; // x[4] -> X[7]
        data[i][4] = data[i][3]; // x[1] -> X[4]
        data[i][3] = DCT_RT2 * data[i][2] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[5] -> X[3]
        data[i][2] = data[i][0]; // x[2] -> X[2]
        data[i][0] = data[i][1]; // x[0] -> X[0]
        data[i][1] = temp_value; // restore from temp
        // these values are at most 10-bit + 1 sign bit
    }

    // Perform on cols
    for (i = 0; i < 8; ++i)
    {
        // assume input values are at most 10-bit + 1 sign bit

        // STAGE 1
        temp_value = data[0][i] + data[7][i]; // actually out[0]
        data[7][i] = data[0][i] - data[7][i]; // actually out[7]
        data[0][i] = data[1][i] + data[6][i]; // actually out[1]
        data[6][i] = data[1][i] - data[6][i]; // actually out[6]
        data[1][i] = data[2][i] + data[5][i]; // actually out[2]
        data[5][i] = data[2][i] - data[5][i]; // actually out[5]
        data[2][i] = data[3][i] + data[4][i]; // actually out[3]
        data[4][i] = data[3][i] - data[4][i]; // actually out[4]
        // values are 11 bit + 1 sign bit

        // STAGE 2
        // top four:
        data[3][i] = temp_value + data[2][i]; // actually out[0]
        temp_value = temp_value - data[2][i]; // actually out[3]
        data[2][i] = data[0][i] + data[1][i]; // actually out[1]
        data[0][i] = data[0][i] - data[1][i]; // actually out[2]
        // bottom four:
        BUTTERFLY_2D_FIXED(data[5][i], data[6][i], data[5][i], data[6][i], C1_1, C1_2, C1_3); // C1 rotator: actually results in out[5] and out[6]
        BUTTERFLY_2D_FIXED(data[4][i], data[7][i], data[4][i], data[7][i], C3_1, C3_2, C3_3); // C3 rotator: actually results in out[4] and out[7]
        // these values are 12 bit + 1 sign bit

        // STAGE 3
        // top four:
        data[1][i] = data[3][i] + data[2][i]; // actually out[0]
        data[3][i] = data[3][i] - data[2][i]; // actually out[1]
        BUTTERFLY_2D_FIXED(data[0][i], temp_value, data[0][i], temp_value, C6_1, C6_2, C6_3); // R2C6 rotator: actually results in out[2] and out[3]
        // bottom four:
        data[2][i] = data[7][i] - data[5][i]; // actually out[5]
        data[7][i] = data[7][i] + data[5][i]; // actually out[7]
        data[5][i] = data[4][i] - data[6][i]; // actually out[6]
        data[4][i] = data[4][i] + data[6][i]; // actually out[4]
        // these values are 13 bit + 1 sign bit

        // STAGE 4
        data[5][i] = (DCT_RT2 * (data[5][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[6] -> X[5]
        data[6][i] = (temp_value + (1<<2)) >> 3; // x[3] -> X[6]
        temp_value = (data[7][i] + data[4][i] + (1<<2)) >> 3; // x[7] -> X[1] (store as temp due to dependencies)
        data[7][i] = (data[7][i] - data[4][i] + (1<<2)) >> 3; // x[4] -> X[7]
        data[4][i] = (data[3][i] + (1<<2)) >> 3; // x[1] -> X[4]
        data[3][i] = (DCT_RT2 * (data[2][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[5] -> X[3]
        data[2][i] = (data[0][i] + (1<<2)) >> 3; // x[2] -> X[2]
        data[0][i] = (data[1][i] + (1<<2)) >> 3; // x[0] -> X[0]
        data[1][i] = temp_value; // restore from temp
        // these values are at most 13 bit + 1 sign bit before dividing.
        // dividing by 8 results in 10 bit + 1 sign bit.
    }
}

void dct_loeffler_2d_fixed_macro(DataType data_in[8][8], int16_t data_out[8][8])
{
    dct_2d_fixed_macro(data_in, data_out);
}

// DONE level-off
// DONE 16 bit interim values (shift before multiply by sqrt_2 - possibly use only 7 bits for sqrt 2, 9 bits for others?)
// DONE 7 bit scale factors - otherwise we run out of bits within 16. this is done, but needs some fixing.
// DONE correct rounding before shifting (add to smallest shifted-out bit before shifting)
// DONE finish fixing 16 bit interim values - now cast to 32 bit before multiplying, and cast back afterwards
// DONE remove temporary array copy
// DONE fix right-shift issue: whether right-shift is arithmetic (keeping negative values negative) or logical (filling with zeroes)
// is implementation-defined for signed inputs. consequently, our shift operations produce undefined behaviour. we'll need to check
// with the arm-linux-gcc compiler to determine which is used. -> asr (arithmetic shift right) is correctly used.
//
// DONE merge various branches into master to combine these things
// DONE (install recent git & cmake on seng440.ece.uvic.ca)
// DONE compile assembly with arm-gcc compiler: arm-linux-gcc -static -o file.exe file.c (or -s for assembly, I think)
// look at generated assembly with different optimization levels with -O0 -O1 -O2 -O3
// investigate number of clock cycles it would take with butterfly routine vs inlined routine vs (using direct assembly
// modification) an optimized firmware instruction
// start on report and figure out from there
