#ifndef SENG440_LOEFFLER_FIXED_H
#define SENG440_LOEFFLER_FIXED_H

#include <stdint.h>

void dct_loeffler_fixed(const uint8_t data_in[8][8], int16_t data_out[8][8]);

#endif // SENG440_LOEFFLER_FIXED_H