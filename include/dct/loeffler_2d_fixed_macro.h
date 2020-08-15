#ifndef SENG440_LOEFFLER_2D_FIXED_MACRO_H
#define SENG440_LOEFFLER_2D_FIXED_MACRO_H

#include <stdint.h>
#include "util/constants.h"

void dct_loeffler_2d_fixed_macro(DataType data_in[8][8], int16_t data_out[8][8]);

// requires 1 extra bit. requires DCT_PRECISION extra bits to be available.
// therefore, for compute_t = int16_t and DCT_PRECISION = 7, the inputs must be 7 bits.

#define BUTTERFLY_2D_FIXED(top, bot, top_out, bot_out, COS_COEFF_1, COS_COEFF_2, COS_COEFF_3)   \
do {                                                                                            \
    int32_t tmp_sum;                                                                            \
    int32_t top_ = (top);                                                                       \
    int32_t bot_ = (bot);                                                                       \
    tmp_sum = COS_COEFF_1 * ((int32_t) top_ + (int32_t)  bot_);                                 \
    top_out = ((COS_COEFF_2 * (int32_t) bot_) + tmp_sum + DCT_ROUND_VAL) >> DCT_PRECISION;      \
    bot_out = ((COS_COEFF_3 * (int32_t) top_) + tmp_sum + DCT_ROUND_VAL) >> DCT_PRECISION;      \
} while (0)

#endif // SENG440_LOEFFLER_2D_FIXED_MACRO_H