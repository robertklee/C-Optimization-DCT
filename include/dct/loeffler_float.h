#ifndef SENG440_LOEFFLER_FLOAT_H
#define SENG440_LOEFFLER_FLOAT_H

#include <stdint.h>
#include "util/constants.h"

void dct_loeffler_float(const DataType data_in[8][8], int16_t data_out[8][8]);

#endif // SENG440_LOEFFLER_FLOAT_H
