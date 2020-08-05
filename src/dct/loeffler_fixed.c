#include "dct/loeffler_fixed.h"

static const int16_t c1_1 = 1004,  // cos(pi/16) << 10
                     c1_2 = -805,  // sin(pi/16) - cos(pi/16) << 10
                     c1_3 = -1204, // -sin(pi/16) - cos(pi/16) << 10
                     c3_1 = 851,   // cos(3pi/16) << 10
                     c3_2 = -283,  // sin(3pi/16) - cos(3pi/16) << 10 
                     c3_3 = -1420, // -sin(3pi/16) - cos(3pi/16) << 10
                     c6_1 = 554,   // sqrt(2) * cos(6pi/16) << 10
                     c6_2 = 784,   // sqrt(2) * sin(6pi/16) - sqrt(2) * cos(6pi/16) << 10
                     c6_3 = -1892, // -sqrt(2) * sin(6pi/16) - sqrt(2) * cos(6pi/16) << 10
                     sqrt2 = 1448;    // sqrt(2) << 10

void transpose(uint8_t data[8][8])
{
    for (int i = 0; i < 8; ++i) {
        for (int j = i + 1; j < 8; ++j) {
            uint8_t tmp = data[i][j];
            data[i][j] = data[j][i];
            data[j][i] = tmp;
        }
    }
}

void butterfly(uint16_t *top, uint16_t *bot, uint8_t type)
{
    uint16_t tmp_val, tmp_top;
    switch (type)
    {
    case 1:
        /* code */
        tmp_val = c1_1 * (*top + *bot);
        tmp_top = c1_2 * *bot + tmp_val;
        *bot = c1_3 * *top + tmp_val;
        *top = tmp_top;
        break;
    case 3:
        /* code */
        tmp_val = c3_1 * (*top + *bot);
        tmp_top = c3_2 * *bot + tmp_val;
        *bot = c3_3 * *top + tmp_val;
        *top = tmp_top;
        break;
    case 6:
        /* code */
        tmp_val = c6_1 * (*top + *bot);
        tmp_top = c6_2 * *bot + tmp_val;
        *bot = c6_3 * *top + tmp_val;
        *top = tmp_top;
        break;
    }
}

void dct_1d(uint16_t data[8])
{
    uint16_t tmp_val; // extra temporary value
    // STAGE 1
    // data[4] unused in this stage
    tmp_val = data[0] + data[7]; // actually out[0]
    data[0] = data[0] - data[7]; // actually out[7]
    data[7] = data[1] + data[6]; // actually out[1]
    data[1] = data[1] - data[6]; // actually out[6]
    data[6] = data[2] + data[5]; // actually out[2]
    data[2] = data[2] - data[5]; // actually out[5]
    data[5] = data[3] + data[4]; // actually out[3]
    data[3] = data[3] - data[4]; // actually out[4]

    // STAGE 2
    // data[6] unused in this stage
    data[4] = tmp_val + data[5]; // actually out[0]
    tmp_val = tmp_val - data[5]; // actually out[3]
    data[5] = data[7] + data[6]; // actually out[1]
    data[7] = data[7] - data[6]; // actually out[2]
    butterfly(&(data[2]), &(data[1]), 1); // C1 rotator: actually results in out[5] and out[6]
    butterfly(&(data[3]), &(data[0]), 3); // C3 rotator: actually results in out[4] and out[7]

    // STAGE 3
    // data[1] unused in this stage
    data[6] = data[4] + data[5]; // actually out[0]
    data[4] = data[4] - data[5]; // actually out[1]
    butterfly(&(data[7]), &tmp_val, 6); // R2C6 rotator: actually results in out[2] and out[3]
    data[5] = data[0] + data[2]; // actually out[7]
    data[0] = data[0] - data[2]; // actually out[5]
    data[2] = data[3] + data[1]; // actually out[4]
    data[3] = data[3] - data[1]; // actually out[6]

    // STAGE 4
    // outputs
    data[4] = data[4]; // x[1] -> X[4]
    uint16_t tmp_2 = data[7]; // x[2] -> X[2] // TODO: add some sort of temporary thing s.t. output isn't overwritten.
    data[1] = data[5] + data[2]; // x[7] -> X[1]
    data[7] = data[5] - data[2]; // x[4] -> X[7]
    data[5] = sqrt2 * data[3]; // x[6] -> X[5]
    data[3] = sqrt2 * data[0]; // x[5] -> X[3]
    data[0] = data[6]; // x[0] -> X[0]
    data[6] = tmp_val; // x[3] -> X[6]

    data[2] = tmp_2;
}

void dct_loeffler_fixed(const uint8_t data_in[8][8], uint8_t data_out[8][8])
{
    // [X] = [C] * [x] * [C]^T
    uint16_t tmp[8][8];
    for (int i = 0; i < 8; ++i) {
        for (int j = 0; j < 8; ++j) {
            tmp[i][j] = data_in[i][j];
        }
    }

    // Do 1D for each row, put outputs into the row.
    for (int k = 0; k < 8; ++k) {
        dct_1d(tmp[k]);
    }
    // Then, do 1D for each column, put outputs into the column.
    // transpose so that indexing by row actually indexes by column
    transpose(tmp);
    for (int k = 0; k < 8; ++k) {
        dct_1d(tmp[k]);
    }
    // transpose back out so that columns are now actually columns
    transpose(tmp);

    for (int i = 0; i < 8; ++i) {
        for (int j = 0; j < 8; ++j) {
            // TODO: fix values outside [-128, 127]
            data_out[i][j] = tmp[i][j];
        }
    }
}
