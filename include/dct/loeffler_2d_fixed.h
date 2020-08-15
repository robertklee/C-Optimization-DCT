#ifndef SENG440_LOEFFLER_2D_FIXED_H
#define SENG440_LOEFFLER_2D_FIXED_H

#include <stdint.h>
#include "util/constants.h"

typedef int16_t compute_t; // compute_t: type used for 2d loeffler computation interim values.
void butterfly_2d_fixed(compute_t top, compute_t bot, compute_t *top_out, compute_t *bot_out, uint8_t type);
void dct_loeffler_2d_fixed(DataType data_in[8][8], int16_t data_out[8][8]);

#endif // SENG440_LOEFFLER_2D_FIXED_H