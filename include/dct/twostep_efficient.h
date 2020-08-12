#ifndef SENG440_TWOSTEP_EFFICIENT_H
#define SENG440_TWOSTEP_EFFICIENT_H

#include <stdint.h>
#include "util/constants.h"

void dct_twostep_efficient(DataType data_in[8][8], int16_t data_out[8][8]);

#endif // SENG440_TWOSTEP_EFFICIENT_H
