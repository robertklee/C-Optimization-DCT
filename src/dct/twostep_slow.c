#include "dct/twostep_slow.h"
#include "util/round.h"

// cn = cos(n*pi/16)
#define c1 (0.980785280403230449126182236134239036973933730893336095002)
#define c2 (0.923879532511286756128183189396788286822416625863642486115)
#define c3 (0.831469612302545237078788377617905756738560811987249963446)
#define c4 (0.707106781186547524400844362104849039284835937688474036588)
#define c5 (0.555570233019602224742830813948532874374937190754804045924)
#define c6 (0.382683432365089771728459984030398866761344562485627041433)
#define c7 (0.195090322016128267848284868477022240927691617751954807754)

// matrix-multiply this on the left to get X[0, 1, 2, 3, 4, 5, 6, 7] for each row
// on the right: x[0, 1, 2, 3, 4, 5, 6, 7]
static double twostep_slow_C[8][8] =
{
    {c4,  c4,  c4,  c4,  c4,  c4,  c4,  c4},
    {c1,  c3,  c5,  c7, -c7, -c5, -c3, -c1},
    {c2,  c6, -c6, -c2, -c2, -c6,  c6,  c2},
    {c3, -c7, -c1, -c5,  c5,  c1,  c7, -c3},
    {c4, -c4, -c4,  c4,  c4, -c4, -c4,  c4},
    {c5, -c1,  c7,  c3, -c3, -c7,  c1, -c5},
    {c6, -c2,  c2, -c6, -c6,  c2, -c2,  c6},
    {c7, -c5,  c3, -c1,  c1, -c3,  c5, -c7}
};
// matrix-multiply this on the right to get X[0, 1, 2, 3, 4, 5, 6, 7] for each column
// on the left: x[0, 1, 2, 3, 4, 5, 6, 7]
static double twostep_slow_CT[8][8] =
{
    {c4,  c1,  c2,  c3,  c4,  c5,  c6,  c7},
    {c4,  c3,  c6, -c7, -c4, -c1, -c2, -c5},
    {c4,  c5, -c6, -c1, -c4,  c7,  c2,  c3},
    {c4,  c7, -c2, -c5,  c4,  c3, -c6, -c1},
    {c4, -c7, -c2,  c5,  c4, -c3, -c6,  c1},
    {c4, -c5, -c6,  c1, -c4, -c7,  c2, -c3},
    {c4, -c3,  c6,  c7, -c4,  c1, -c2,  c5},
    {c4, -c1,  c2, -c3,  c4, -c5,  c6, -c7}
};

// TODO: This could be made more efficient by having one function for each step,
//       allowing us to optimize array access to always be row-first indexing.
// preconditions: lhs != out and rhs != out (lhs == rhs OK)
void square_matrix_multiply(double lhs[8][8], double rhs[8][8], double out[8][8])
{
    int i, j, k;
    for (i = 0; i < 8; ++i) {
        for (j = 0; j < 8; ++j) {
            // for each element in output
            out[i][j] = 0;
            for (k = 0; k < 8; ++k) {
                // lhs row * rhs column
                out[i][j] += lhs[i][k] * rhs[k][j];
            }
        }
    }
}

// input: 8x8 array, output: 8x8 array.
// uses the row-column separation approach from slides 8-10.
void dct_twostep_slow(DataType data_in[8][8], int16_t data_out[8][8])
{
    int i, j;
    // [X] = [C] * [x] * [C]^T
    double tmp_io[8][8];
    for (i = 0; i < 8; ++i) {
        for (j = 0; j < 8; ++j) {
            tmp_io[i][j] = data_in[i][j];
        }
    }
    double tmp[8][8];

    square_matrix_multiply(twostep_slow_C, tmp_io, tmp);
    square_matrix_multiply(tmp, twostep_slow_CT, tmp_io);

    for (i = 0; i < 8; ++i) {
        for (j = 0; j < 8; ++j) {
            // TODO: fix values outside [-128, 127]
            // additional 1/4 coefficient that is not in lecture notes
            double temp_result = tmp_io[i][j] / 4;
            data_out[i][j] = ROUND_INT16(temp_result);
        }
    }
}
