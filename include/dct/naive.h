#ifndef SENG440_NAIVE_H
#define SENG440_NAIVE_H

#include <stdint.h>
#include "util/constants.h"

void dct_naive(const DataType data_in[8][8], int16_t data_out[8][8]);

#endif // SENG440_NAIVE_H
