#include "dct/loeffler_2d_fixed.h"

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

static void butterfly(int32_t *top, int32_t *bot, uint8_t type)
{
    int32_t tmp_sum, tmp_top;
    switch (type)
    {
    case 1:
        tmp_sum = c1_1 * ((*top) + (*bot));
        tmp_top = c1_2 * (*bot) + tmp_sum;
        *bot = c1_3 * (*top) + tmp_sum;
        *top = tmp_top;
        break;
    case 3:
        tmp_sum = c3_1 * ((*top) + (*bot));
        tmp_top = c3_2 * (*bot) + tmp_sum;
        *bot = c3_3 * (*top) + tmp_sum;
        *top = tmp_top;
        break;
    case 6:
        tmp_sum = c6_1 * ((*top) + (*bot));
        tmp_top = c6_2 * (*bot) + tmp_sum;
        *bot = c6_3 * (*top) + tmp_sum;
        *top = tmp_top;
        break;
    }
}

void dct_2d_fixed(int32_t data[8][8])
{
    int32_t temp_value; // extra temporary value
    uint8_t i = 0;
    // Perform on rows
    for (; i < 8; ++i)
    {
        // STAGE 1
        temp_value = data[i][0] + data[i][7]; // actually out[0]
        data[i][7] = data[i][0] - data[i][7]; // actually out[7]
        data[i][0] = data[i][1] + data[i][6]; // actually out[1]
        data[i][6] = data[i][1] - data[i][6]; // actually out[6]
        data[i][1] = data[i][2] + data[i][5]; // actually out[2]
        data[i][5] = data[i][2] - data[i][5]; // actually out[5]
        data[i][2] = data[i][3] + data[i][4]; // actually out[3]
        data[i][4] = data[i][3] - data[i][4]; // actually out[4]

        // STAGE 2
        // top four:
        data[i][3] = temp_value + data[i][2]; // actually out[0]
        temp_value = temp_value - data[i][2]; // actually out[3]
        data[i][2] = data[i][0] + data[i][1]; // actually out[1]
        data[i][0] = data[i][0] - data[i][1]; // actually out[2]
        // bottom four:
        butterfly(&(data[i][5]), &(data[i][6]), 1); // C1 rotator: actually results in out[5] and out[6]
        butterfly(&(data[i][4]), &(data[i][7]), 3); // C3 rotator: actually results in out[4] and out[7]

        // STAGE 3
        // top four:
        data[i][1] = data[i][3] + data[i][2]; // actually out[0]
        data[i][3] = data[i][3] - data[i][2]; // actually out[1]
        butterfly(&(data[i][0]), &temp_value, 6); // R2C6 rotator: actually results in out[2] and out[3]
        // bottom four:
        data[i][2] = data[i][7] - data[i][5]; // actually out[5]
        data[i][7] = data[i][7] + data[i][5]; // actually out[7]
        data[i][5] = data[i][4] - data[i][6]; // actually out[6]
        data[i][4] = data[i][4] + data[i][6]; // actually out[4]

        // STAGE 4
        data[i][5] = sqrt2 * data[i][5] >> 20; // x[6] -> X[5]
        data[i][6] = temp_value >> 10; // x[3] -> X[6]
        temp_value = (data[i][7] + data[i][4]) >> 10; // x[7] -> X[1] (store as temp due to dependencies)
        data[i][7] = (data[i][7] - data[i][4]) >> 10; // x[4] -> X[7]
        data[i][4] = data[i][3]; // x[1] -> X[4]
        data[i][3] = sqrt2 * data[i][2] >> 20; // x[5] -> X[3]
        data[i][2] = data[i][0] >> 10; // x[2] -> X[2]
        data[i][0] = data[i][1]; // x[0] -> X[0]
        data[i][1] = temp_value; // restore from temp
    }

    // Perform on cols
    for (i = 0; i < 8; ++i)
    {
        // STAGE 1
        temp_value = data[0][i] + data[7][i]; // actually out[0]
        data[7][i] = data[0][i] - data[7][i]; // actually out[7]
        data[0][i] = data[1][i] + data[6][i]; // actually out[1]
        data[6][i] = data[1][i] - data[6][i]; // actually out[6]
        data[1][i] = data[2][i] + data[5][i]; // actually out[2]
        data[5][i] = data[2][i] - data[5][i]; // actually out[5]
        data[2][i] = data[3][i] + data[4][i]; // actually out[3]
        data[4][i] = data[3][i] - data[4][i]; // actually out[4]

        // STAGE 2
        // top four:
        data[3][i] = temp_value + data[2][i]; // actually out[0]
        temp_value = temp_value - data[2][i]; // actually out[3]
        data[2][i] = data[0][i] + data[1][i]; // actually out[1]
        data[0][i] = data[0][i] - data[1][i]; // actually out[2]
        // bottom four:
        butterfly(&(data[5][i]), &(data[6][i]), 1); // C1 rotator: actually results in out[5] and out[6]
        butterfly(&(data[4][i]), &(data[7][i]), 3); // C3 rotator: actually results in out[4] and out[7]

        // STAGE 3
        // top four:
        data[1][i] = data[3][i] + data[2][i]; // actually out[0]
        data[3][i] = data[3][i] - data[2][i]; // actually out[1]
        butterfly(&(data[0][i]), &temp_value, 6); // R2C6 rotator: actually results in out[2] and out[3]
        // bottom four:
        data[2][i] = data[7][i] - data[5][i]; // actually out[5]
        data[7][i] = data[7][i] + data[5][i]; // actually out[7]
        data[5][i] = data[4][i] - data[6][i]; // actually out[6]
        data[4][i] = data[4][i] + data[6][i]; // actually out[4]

        // STAGE 4
        data[5][i] = sqrt2 * data[5][i] >> 20; // x[6] -> X[5]
        data[6][i] = temp_value >> 10; // x[3] -> X[6]
        temp_value = (data[7][i] + data[4][i]) >> 10; // x[7] -> X[1] (store as temp due to dependencies)
        data[7][i] = (data[7][i] - data[4][i]) >> 10; // x[4] -> X[7]
        data[4][i] = data[3][i]; // x[1] -> X[4]
        data[3][i] = sqrt2 * data[2][i] >> 20; // x[5] -> X[3]
        data[2][i] = data[0][i] >> 10; // x[2] -> X[2]
        data[0][i] = data[1][i]; // x[0] -> X[0]
        data[1][i] = temp_value; // restore from temp
    }
}

void dct_loeffler_2d_fixed(const DataType data_in[8][8], int16_t data_out[8][8])
{
    // [X] = [C] * [x] * [C]^T
    int32_t tmp[8][8];
    for (int i = 0; i < 8; ++i) {
        for (int j = 0; j < 8; ++j) {
            tmp[i][j] = data_in[i][j];
        }
    }

    dct_2d_fixed(tmp);

    for (int i = 0; i < 8; ++i) {
        for (int j = 0; j < 8; ++j) {
            data_out[i][j] = (int16_t) ((tmp[i][j] + (1<<2)) >> 3);
        }
    }
}
