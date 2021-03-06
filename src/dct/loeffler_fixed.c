#include "dct/loeffler_fixed.h"

static const int32_t c1_1 = 1004,  // cos(pi/16) << 10
                     c1_2 = -805,  // sin(pi/16) - cos(pi/16) << 10
                     c1_3 = -1204, // -sin(pi/16) - cos(pi/16) << 10
                     c3_1 = 851,   // cos(3pi/16) << 10
                     c3_2 = -283,  // sin(3pi/16) - cos(3pi/16) << 10 
                     c3_3 = -1420, // -sin(3pi/16) - cos(3pi/16) << 10
                     c6_1 = 554,   // sqrt(2) * cos(6pi/16) << 10
                     c6_2 = 784,   // sqrt(2) * sin(6pi/16) - sqrt(2) * cos(6pi/16) << 10
                     c6_3 = -1892, // -sqrt(2) * sin(6pi/16) - sqrt(2) * cos(6pi/16) << 10
                     sqrt2 = 1448; // sqrt(2) << 10

void transpose_int(int32_t data[8][8])
{
    int i, j;
    for (i = 0; i < 8; ++i) {
        for (j = i + 1; j < 8; ++j) {
            int32_t tmp = data[i][j];
            data[i][j] = data[j][i];
            data[j][i] = tmp;
        }
    }
}

void butterfly_fixed(int32_t *top, int32_t *bot, uint8_t type)
{
    int32_t tmp_sum, tmp_top;
    switch (type)
    {
    case 1:
        tmp_sum = c1_1 * ((*top) + (*bot));
        tmp_top = (c1_2 * (*bot) + tmp_sum) >> 10;
        *bot = (c1_3 * (*top) + tmp_sum) >> 10;
        *top = tmp_top;
        break;
    case 3:
        tmp_sum = c3_1 * ((*top) + (*bot));
        tmp_top = (c3_2 * (*bot) + tmp_sum) >> 10;
        *bot = (c3_3 * (*top) + tmp_sum) >> 10;
        *top = tmp_top;
        break;
    case 6:
        tmp_sum = c6_1 * ((*top) + (*bot));
        tmp_top = (c6_2 * (*bot) + tmp_sum) >> 10;
        *bot = (c6_3 * (*top) + tmp_sum) >> 10;
        *top = tmp_top;
        break;
    }
}

void dct_1d_fixed(int32_t data[8])
{
    int32_t tmp_val; // extra temporary value
    // STAGE 1
    tmp_val = data[0] + data[7]; // actually out[0]
    data[7] = data[0] - data[7]; // actually out[7]
    data[0] = data[1] + data[6]; // actually out[1]
    data[6] = data[1] - data[6]; // actually out[6]
    data[1] = data[2] + data[5]; // actually out[2]
    data[5] = data[2] - data[5]; // actually out[5]
    data[2] = data[3] + data[4]; // actually out[3]
    data[4] = data[3] - data[4]; // actually out[4]

    // STAGE 2
    // top four:
    data[3] = tmp_val + data[2]; // actually out[0]
    tmp_val = tmp_val - data[2]; // actually out[3]
    data[2] = data[0] + data[1]; // actually out[1]
    data[0] = data[0] - data[1]; // actually out[2]
    // bottom four:
    butterfly_fixed(&(data[5]), &(data[6]), 1); // C1 rotator: actually results in out[5] and out[6]
    butterfly_fixed(&(data[4]), &(data[7]), 3); // C3 rotator: actually results in out[4] and out[7]

    // STAGE 3
    // top four:
    data[1] = data[3] + data[2]; // actually out[0]
    data[3] = data[3] - data[2]; // actually out[1]
    butterfly_fixed(&(data[0]), &tmp_val, 6); // R2C6 rotator: actually results in out[2] and out[3]
    // bottom four:
    data[2] = data[7] - data[5]; // actually out[5]
    data[7] = data[7] + data[5]; // actually out[7]
    data[5] = data[4] - data[6]; // actually out[6]
    data[4] = data[4] + data[6]; // actually out[4]

    // STAGE 4
    data[5] = sqrt2 * data[5] >> 10; // x[6] -> X[5]
    data[6] = tmp_val; // x[3] -> X[6]
    tmp_val = (data[7] + data[4]); // x[7] -> X[1] (store as temp due to dependencies)
    data[7] = (data[7] - data[4]); // x[4] -> X[7]
    data[4] = data[3]; // x[1] -> X[4]
    data[3] = sqrt2 * data[2] >> 10; // x[5] -> X[3]
    data[2] = data[0]; // x[2] -> X[2]
    data[0] = data[1]; // x[0] -> X[0]
    data[1] = tmp_val; // restore from temp
}

void dct_loeffler_fixed(DataType data_in[8][8], int16_t data_out[8][8])
{
    int i, j, k;
    // [X] = [C] * [x] * [C]^T
    int32_t tmp[8][8];
    for (i = 0; i < 8; ++i) {
        for (j = 0; j < 8; ++j) {
            tmp[i][j] = data_in[i][j];
        }
    }

    // Do 1D for each row, put outputs into the row.
    for (k = 0; k < 8; ++k) {
        dct_1d_fixed(tmp[k]);
    }
    // Then, do 1D for each column, put outputs into the column.
    // transpose so that indexing by row actually indexes by column
    transpose_int(tmp);
    for (k = 0; k < 8; ++k) {
        dct_1d_fixed(tmp[k]);
    }
    // transpose back out so that columns are now actually columns
    transpose_int(tmp);

    for (i = 0; i < 8; ++i) {
        for (j = 0; j < 8; ++j) {
            data_out[i][j] = (int16_t) ((tmp[i][j] + (1<<2)) >> 3);
        }
    }
}
