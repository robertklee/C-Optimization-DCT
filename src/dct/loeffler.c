#include "dct/loeffler.h"

void transpose(double data[8][8])
{
    for (int i = 0; i < 8; ++i) {
        for (int j = i + 1; j < 8; ++j) {
            double tmp = data[i][j];
            data[i][j] = data[j][i];
            data[j][i] = tmp;
        }
    }
}

#define c1_a (-0.78569495838710218127789736765721679604624211314138128724) // sin(pi/16) - cos(pi/16)
#define c1_b (-1.17587560241935871697446710461126127790162534864529090275) // -(sin(pi/16) + cos(pi/16))
#define c1_c (0.980785280403230449126182236134239036973933730893336095002) // cos(pi/16)

#define c3_a (-0.27589937928294301233595756366937288236362362123244591752) // sin(3pi/16) - cos(3pi/16)
#define c3_b (-1.38703984532214746182161919156643863111349800274205400937) // -(sin(3pi/16) + cos(3pi/16))
#define c3_c (0.831469612302545237078788377617905756738560811987249963446) // cos(3pi/16)

#define c6_a (0.765366864730179543456919968060797733522689124971254082867) // sqrt(2) * (sin(6pi/16) - cos(6pi/16))
#define c6_b (-1.84775906502257351225636637879357657364483325172728497223) // sqrt(2) * -(sin(6pi/16) + cos(6pi/16))
#define c6_c (0.541196100146196984399723205366389420061072063378015444681) // sqrt(2) * cos(6pi/16)

#define sqrt_2 (1.414213562373095048801688724209698078569671875376948073176)

void dct_1d(const double data_in[8], double data_out[8])
{
    // STAGE 1
    double stage1out[8];
    // reflectors
    stage1out[0] = data_in[0] + data_in[7];
    stage1out[1] = data_in[1] + data_in[6];
    stage1out[2] = data_in[2] + data_in[5];
    stage1out[3] = data_in[3] + data_in[4];
    stage1out[4] = data_in[3] - data_in[4];
    stage1out[5] = data_in[2] - data_in[5];
    stage1out[6] = data_in[1] - data_in[6];
    stage1out[7] = data_in[0] - data_in[7];

    // STAGE 2
    double stage2out[8];
    // reflectors
    stage2out[0] = stage1out[0] + stage1out[3];
    stage2out[1] = stage1out[1] + stage1out[2];
    stage2out[2] = stage1out[1] - stage1out[2];
    stage2out[3] = stage1out[0] - stage1out[3];
    // rotators
    double c3_rotator_tmp = c3_c * (stage1out[4] + stage1out[7]); // I' = [4], I'' = [7]
    double c1_rotator_tmp = c1_c * (stage1out[5] + stage1out[6]); // I' = [5], I'' = [6]
    stage2out[4] = c3_a * stage1out[7] + c3_rotator_tmp;
    stage2out[5] = c1_a * stage1out[6] + c1_rotator_tmp;
    stage2out[6] = c1_b * stage1out[5] + c1_rotator_tmp;
    stage2out[7] = c3_b * stage1out[4] + c3_rotator_tmp;

    // STAGE 3
    double stage3out[8];
    // reflectors
    stage3out[0] = stage2out[0] + stage2out[1];
    stage3out[1] = stage2out[0] - stage2out[1];
    // rotators
    double c6_rotator_tmp = c6_c * (stage2out[2] + stage2out[3]); // I' = [2], I'' = [3]
    stage3out[2] = c6_a * stage2out[3] + c6_rotator_tmp;
    stage3out[3] = c6_b * stage2out[2] + c6_rotator_tmp;
    // reflectors
    stage3out[4] = stage2out[4] + stage2out[6];
    stage3out[5] = stage2out[7] - stage2out[5];
    stage3out[6] = stage2out[4] - stage2out[6];
    stage3out[7] = stage2out[7] + stage2out[5];

    // STAGE 4

    // outputs
    data_out[0] = stage3out[0];
    data_out[4] = stage3out[1];
    data_out[2] = stage3out[2];
    data_out[6] = stage3out[3];
    // reflector
    data_out[7] = stage3out[7] - stage3out[4];
    // scale-up units
    data_out[3] = sqrt_2 * stage3out[5];
    data_out[5] = sqrt_2 * stage3out[6];
    // reflector
    data_out[1] = stage3out[7] + stage3out[4];
}

void dct_loeffler(const int8_t data_in[8][8], int8_t data_out[8][8])
{
    // [X] = [C] * [x] * [C]^T
    double tmp_io[8][8];
    for (int i = 0; i < 8; ++i) {
        for (int j = 0; j < 8; ++j) {
            tmp_io[i][j] = data_in[i][j];
        }
    }
    double tmp[8][8];

    // Do 1D for each row, put outputs into the row.
    for (int k = 0; k < 8; ++k) {
        dct_1d(tmp_io[k], tmp[k]);
    }
    // Then, do 1D for each column, put outputs into the column.
    // transpose so that indexing by row actually indexes by column
    transpose(tmp);
    for (int k = 0; k < 8; ++k) {
        dct_1d(tmp[k], tmp_io[k]);
    }
    // transpose back out so that columns are now actually columns
    transpose(tmp_io);

    for (int i = 0; i < 8; ++i) {
        for (int j = 0; j < 8; ++j) {
            // TODO: fix values outside [-128, 127]
            data_out[i][j] = (int8_t) tmp_io[i][j];
        }
    }
}