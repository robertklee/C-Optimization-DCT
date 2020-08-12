#include "dct/loeffler_2d_fixed.h"

#include "util/constants.h"

// compute_t: Type used for computation.
typedef int16_t compute_t;

// requires extra bits: DCT_PRECISION + 2. should the DCT_PRECISION bits be rounded away before returning?
// TODO: handle overflow
static void butterfly(compute_t *top, compute_t *bot, uint8_t type)
{
    compute_t tmp_sum, tmp_top;
    switch (type)
    {
    case 1:
        tmp_sum = C1_1 * ((*top) + (*bot)); // caps at 127 * 255 (7-bit * 8-bit) = 15 bit
        tmp_top = C1_2 * (*bot) + tmp_sum;
        *bot = C1_3 * (*top) + tmp_sum; // caps at (255 * 127) + (127 * 255) = 15-bit + 15-bit = 16-bit --> adding DCT_PRECISION + 2
        *top = tmp_top;
        break;
    case 3:
        tmp_sum = C3_1 * ((*top) + (*bot));
        tmp_top = C3_2 * (*bot) + tmp_sum;
        *bot = C3_3 * (*top) + tmp_sum;
        *top = tmp_top;
        break;
    case 6:
        tmp_sum = C6_1 * ((*top) + (*bot));
        tmp_top = C6_2 * (*bot) + tmp_sum;
        *bot = C6_3 * (*top) + tmp_sum;
        *top = tmp_top;
        break;
    }
}

void dct_2d_fixed(compute_t data[8][8])
{
    compute_t temp_value; // extra temporary value
    uint8_t i;
    // Perform on rows
    for (i = 0; i < 8; ++i)
    {
        // values are 7-bit + 1 sign bit

        // STAGE 1
        temp_value = data[i][0] + data[i][7]; // actually out[0]
        data[i][7] = data[i][0] - data[i][7]; // actually out[7]
        data[i][0] = data[i][1] + data[i][6]; // actually out[1]
        data[i][6] = data[i][1] - data[i][6]; // actually out[6]
        data[i][1] = data[i][2] + data[i][5]; // actually out[2]
        data[i][5] = data[i][2] - data[i][5]; // actually out[5]
        data[i][2] = data[i][3] + data[i][4]; // actually out[3]
        data[i][4] = data[i][3] - data[i][4]; // actually out[4]
        // values are 8-bit + 1 sign bit

        // STAGE 2
        // top four:
        data[i][3] = temp_value + data[i][2]; // actually out[0]
        temp_value = temp_value - data[i][2]; // actually out[3]
        data[i][2] = data[i][0] + data[i][1]; // actually out[1]
        data[i][0] = data[i][0] - data[i][1]; // actually out[2]
        // these values are 9-bit + 1 sign bit
        // bottom four:
        butterfly(&(data[i][5]), &(data[i][6]), 1); // C1 rotator: actually results in out[5] and out[6]
        butterfly(&(data[i][4]), &(data[i][7]), 3); // C3 rotator: actually results in out[4] and out[7]
        // these values are 10-bit + DCT_PRECISION + 1 sign bit

        // STAGE 3
        // top four:
        data[i][1] = data[i][3] + data[i][2]; // actually out[0]
        data[i][3] = data[i][3] - data[i][2]; // actually out[1]
        // these values are 10-bit + 1 sign bit
        butterfly(&(data[i][0]), &temp_value, 6); // R2C6 rotator: actually results in out[2] and out[3]
        // these values are 11-bit + DCT_PRECISION + 1 sign bit
        // bottom four:
        data[i][2] = data[i][7] - data[i][5]; // actually out[5]
        data[i][7] = data[i][7] + data[i][5]; // actually out[7]
        data[i][5] = data[i][4] - data[i][6]; // actually out[6]
        data[i][4] = data[i][4] + data[i][6]; // actually out[4]
        // these values are 11-bit + DCT_PRECISION + 1 sign bit --> overflow with DCT_PRECISION above 4!

        // STAGE 4
        data[i][5] = FIXEDRT2 * (data[i][5] + DCT_ROUND_VAL >> DCT_PRECISION) + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[6] -> X[5]
        data[i][6] = temp_value + DCT_ROUND_VAL >> DCT_PRECISION; // x[3] -> X[6]
        temp_value = (data[i][7] + data[i][4]) + DCT_ROUND_VAL >> DCT_PRECISION; // x[7] -> X[1] (store as temp due to dependencies)
        data[i][7] = (data[i][7] - data[i][4]) + DCT_ROUND_VAL >> DCT_PRECISION; // x[4] -> X[7]
        data[i][4] = data[i][3]; // x[1] -> X[4]
        data[i][3] = FIXEDRT2 * (data[i][2] + DCT_ROUND_VAL >> DCT_PRECISION) + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[5] -> X[3]
        data[i][2] = data[i][0] + DCT_ROUND_VAL >> DCT_PRECISION; // x[2] -> X[2]
        data[i][0] = data[i][1]; // x[0] -> X[0]
        data[i][1] = temp_value; // restore from temp
        // these values are at most 12-bit (or 13? with addition of DCT_ROUND_VAL) + 1 sign bit
    }

    // Perform on cols
    for (i = 0; i < 8; ++i)
    {
        // assume input values are at most 12-bit + 1 sign bit

        // STAGE 1
        temp_value = data[0][i] + data[7][i]; // actually out[0]
        data[7][i] = data[0][i] - data[7][i]; // actually out[7]
        data[0][i] = data[1][i] + data[6][i]; // actually out[1]
        data[6][i] = data[1][i] - data[6][i]; // actually out[6]
        data[1][i] = data[2][i] + data[5][i]; // actually out[2]
        data[5][i] = data[2][i] - data[5][i]; // actually out[5]
        data[2][i] = data[3][i] + data[4][i]; // actually out[3]
        data[4][i] = data[3][i] - data[4][i]; // actually out[4]
        // values are 13 bit + 1 sign bit

        // STAGE 2
        // top four:
        data[3][i] = temp_value + data[2][i]; // actually out[0]
        temp_value = temp_value - data[2][i]; // actually out[3]
        data[2][i] = data[0][i] + data[1][i]; // actually out[1]
        data[0][i] = data[0][i] - data[1][i]; // actually out[2]
        // these values are 14 bit + 1 sign bit
        // bottom four:
        butterfly(&(data[5][i]), &(data[6][i]), 1); // C1 rotator: actually results in out[5] and out[6]
        butterfly(&(data[4][i]), &(data[7][i]), 3); // C3 rotator: actually results in out[4] and out[7]
        // these values are 15 bit + DCT_PRECISION + 1 sign bit

        // STAGE 3
        // top four:
        data[1][i] = data[3][i] + data[2][i]; // actually out[0]
        data[3][i] = data[3][i] - data[2][i]; // actually out[1]
        // these values are 15 bit + 1 sign bit
        butterfly(&(data[0][i]), &temp_value, 6); // R2C6 rotator: actually results in out[2] and out[3]
        // these values are 16 bit + DCT_PRECISION + 1 sign bit
        // bottom four:
        data[2][i] = data[7][i] - data[5][i]; // actually out[5]
        data[7][i] = data[7][i] + data[5][i]; // actually out[7]
        data[5][i] = data[4][i] - data[6][i]; // actually out[6]
        data[4][i] = data[4][i] + data[6][i]; // actually out[4]
        // these values are 16 bit + DCT_PRECISION + 1 sign bit

        // STAGE 4
        data[5][i] = FIXEDRT2 * (data[5][i] + DCT_ROUND_VAL >> DCT_PRECISION) + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[6] -> X[5]
        data[6][i] = temp_value + DCT_ROUND_VAL >> DCT_PRECISION; // x[3] -> X[6]
        temp_value = (data[7][i] + data[4][i]) + DCT_ROUND_VAL >> DCT_PRECISION; // x[7] -> X[1] (store as temp due to dependencies)
        data[7][i] = (data[7][i] - data[4][i]) + DCT_ROUND_VAL >> DCT_PRECISION; // x[4] -> X[7]
        data[4][i] = data[3][i]; // x[1] -> X[4]
        data[3][i] = FIXEDRT2 * (data[2][i] + DCT_ROUND_VAL >> DCT_PRECISION) + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[5] -> X[3]
        data[2][i] = data[0][i] + DCT_ROUND_VAL >> DCT_PRECISION; // x[2] -> X[2]
        data[0][i] = data[1][i]; // x[0] -> X[0]
        data[1][i] = temp_value; // restore from temp
        // these values are at most 18 bit + 1 sign bit (or 17 for all except [7] and [4]).
        // dividing by 8 results in 15 bit + 1 sign bit. So our results clearly fit into 16 bits, but the interim values need to
        // be massaged into such a small representation.
    }
}

void dct_loeffler_2d_fixed(DataType data_in[8][8], int16_t data_out[8][8])
{
    int i, j;
    // [X] = [C] * [x] * [C]^T
    compute_t tmp[8][8];
    for (i = 0; i < 8; ++i) {
        for (j = 0; j < 8; ++j) {
            tmp[i][j] = data_in[i][j];
        }
    }

    dct_2d_fixed(tmp);

    for (i = 0; i < 8; ++i) {
        for (j = 0; j < 8; ++j) {
            data_out[i][j] = (int16_t) ((tmp[i][j] + (1<<2)) >> 3); // round to nearest and divide by 8 to account for C(u) factors
        }
    }
}

// DONE level-off
// DONE 16 bit interim values (shift before multiply by sqrt_2 - possibly use only 7 bits for sqrt 2, 9 bits for others?)
// 7 bit scale factors - otherwise we run out of bits within 16. this is done, but needs some fixing.
// DONE correct rounding before shifting (add to smallest shifted-out bit before shifting)
// remove temporary array copy
// fix right-shift issue: whether right-shift is arithmetic (keeping negative values negative) or logical (filling with zeroes)
// is implementation-defined for signed inputs. consequently, our shift operations produce undefined behaviour. we'll need to check
// with the arm-linux-gcc compiler to determine which is used.
//
// merge various branches into master to combine these things
// (install recent git & cmake on seng440.ece.uvic.ca)
// compile assembly with arm-gcc compiler: arm-linux-gcc -static -o file.exe file.c (or -s for assembly, I think)
// look at generated assembly with different optimization levels with -O0 -O1 -O2 -O3
// investigate number of clock cycles it would take with butterfly routine vs inlined routine vs (using direct assembly
// modification) an optimized firmware instruction
// start on report and figure out from there