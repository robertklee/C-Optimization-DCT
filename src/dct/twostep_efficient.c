#include "dct/twostep_efficient.h"


// cn = cos(n*pi/16)
#define c1 (0.980785280403230449126182236134239036973933730893336095002)
#define c2 (0.923879532511286756128183189396788286822416625863642486115)
#define c3 (0.831469612302545237078788377617905756738560811987249963446)
#define c4 (0.707106781186547524400844362104849039284835937688474036588)
#define c5 (0.555570233019602224742830813948532874374937190754804045924)
#define c6 (0.382683432365089771728459984030398866761344562485627041433)
#define c7 (0.195090322016128267848284868477022240927691617751954807754)

// TODO: figure out if these matrix multiplications are correct
// matrix-multiply this on the left to get X[0, 2, 4, 6, 1, 3, 5, 7] for each row
// on the right: [x0+x7, x1+x6, x2+x5, x3+x4, x0-x7, x1-x6, x2-x5, x3-x4]
const double twostep_efficient_C[8][8] =
{
    {c4,  c4,  c4,  c4,  0,   0,   0,   0},
    {c2,  c6, -c6, -c2,  0,   0,   0,   0},
    {c4, -c4, -c4,  c4,  0,   0,   0,   0},
    {c6, -c2,  c2, -c6,  0,   0,   0,   0},
    { 0,   0,   0,   0, c1,  c3,  c5,  c7},
    { 0,   0,   0,   0, c3, -c7, -c1, -c5},
    { 0,   0,   0,   0, c5, -c1,  c7,  c3},
    { 0,   0,   0,   0, c7, -c5,  c3, -c1}
};
// matrix-multiply this on the right to get X[0, 2, 4, 6, 1, 3, 5, 7] for each column
// on the left: [x0+x7, x1+x6, x2+x5, x3+x4, x0-x7, x1-x6, x2-x5, x3-x4]
const double twostep_efficient_CT[8][8] =
{
    {c4,  c2,  c4,  c6,  0,   0,   0,   0},
    {c4,  c6, -c4, -c2,  0,   0,   0,   0},
    {c4, -c6, -c4,  c2,  0,   0,   0,   0},
    {c4, -c2,  c4, -c6,  0,   0,   0,   0},
    { 0,   0,   0,   0, c1,  c3,  c5,  c7},
    { 0,   0,   0,   0, c3, -c7, -c1, -c5},
    { 0,   0,   0,   0, c5, -c1,  c7,  c3},
    { 0,   0,   0,   0, c7, -c5,  c3, -c1}
};

void twostep_efficient_secondstep_2d(double x_in[8], double x_out[8], double coeffs[8][8])
{
    // TODO: finish this
    for (int i = 0; i < 4; ++i) {
        int ind_hi = i << 1;
        int ind_lo = ind_hi + 1;
        x_out[ind_hi] = 0;
        x_out[ind_lo] = 0;
        for (int j = 0; j < 4; ++j) {
            //x_out[ind_hi] += what?
        }
    }
}

// see slide 10.
// x_in = [x0+x7, x1+x6, x2+x5, x3+x4, x0-x7, x1-x6, x2-x5, x3-x4]
void twostep_efficient_firststep_1d(double x_in[8], double x_out[8], double coeffs[8][8])
{
    // TODO: finish this
    for (int i = 0; i < 4; ++i) {
        int ind_hi = i << 1;
        int ind_lo = ind_hi + 1;
        x_out[ind_hi] = 0;
        x_out[ind_lo] = 0;
        for (int j = 0; j < 4; ++j) {
            x_out[ind_hi] += coeffs[i][j] * x_in[j];
            x_out[ind_lo] += coeffs[i+4][j+4] * x_in[j+4];
        }
    }

}

void dct_twostep_efficient(const int8_t data_in[8][8], int8_t data_out[8][8])
{
    // [X] = [C] * [x] * [C]^T
    double tmp_io[8][8];
    for (int i = 0; i < 8; ++i) {
        for (int j = 0; j < 8; ++j) {
            tmp_io[i][j] = data_in[i][j];
        }
    }
    double tmp[8][8];

    // TODO: figure out what happened to the 1/4 factor at the front - is it necessary (seems to be, but unclear)?
    for (int i = 0; i < 8; ++i) {
        //twostep_efficient_firststep_1d(tmp_io[i], tmp[i], twostep_efficient_C);
        double tmp_x[8] = { tmp_io[0][i] + tmp_io[7][i],
                            tmp_io[1][i] + tmp_io[6][i],
                            tmp_io[2][i] + tmp_io[5][i],
                            tmp_io[3][i] + tmp_io[4][i],
                            tmp_io[0][i] - tmp_io[7][i],
                            tmp_io[1][i] - tmp_io[6][i],
                            tmp_io[2][i] - tmp_io[5][i],
                            tmp_io[3][i] - tmp_io[4][i] };
        // TODO: finish this
    }
    for (int j = 0; j < 8; ++j) {
        // TODO: finish this
        //twostep_efficient_secondstep_1d()
    }

    for (int i = 0; i < 8; ++i) {
        for (int j = 0; j < 8; ++j) {
            // TODO: fix values outside [-128, 127]
            data_out[i][j] = (int8_t) tmp_io[i][j];
        }
    }
}