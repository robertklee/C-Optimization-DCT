#ifndef SENG440_LOEFFLER_FIXED_H
#define SENG440_LOEFFLER_FIXED_H

#include <stdint.h>
#include "util/constants.h"

void butterfly_fixed(int32_t *top, int32_t *bot, uint8_t type);
void dct_loeffler_fixed(DataType data_in[8][8], int16_t data_out[8][8]);

#endif // SENG440_LOEFFLER_FIXED_H