#ifndef SENG440_TWOSTEP_EFFICIENT_H
#define SENG440_TWOSTEP_EFFICIENT_H

#include <stdint.h>

void dct_twostep_efficient(const int8_t data_in[8][8], int8_t data_out[8][8]);

#endif // SENG440_TWOSTEP_EFFICIENT_H