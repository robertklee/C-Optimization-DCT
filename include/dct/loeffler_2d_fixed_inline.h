#ifndef SENG440_LOEFFLER_2D_FIXED_INLINE_H
#define SENG440_LOEFFLER_2D_FIXED_INLINE_H

#include <stdint.h>
#include "util/constants.h"

void dct_loeffler_2d_fixed_inline(DataType data_in[8][8], int16_t data_out[8][8]);

// requires 1 extra bit. requires DCT_PRECISION extra bits to be available.
// therefore, for compute_t = int16_t and DCT_PRECISION = 7, the inputs must be 7 bits.
static inline void butterfly_2d_fixed_1(compute_t top, compute_t bot, compute_t *top_out, compute_t *bot_out, uint8_t type)
{
    int32_t tmp_sum;
    tmp_sum = C1_1 * ((int32_t) top + (int32_t)  bot);
    *top_out = ((C1_2 * (int32_t) bot) + tmp_sum + DCT_ROUND_VAL) >> DCT_PRECISION;
    *bot_out = ((C1_3 * (int32_t) top) + tmp_sum + DCT_ROUND_VAL) >> DCT_PRECISION;
}

static inline void butterfly_2d_fixed_3(compute_t top, compute_t bot, compute_t *top_out, compute_t *bot_out, uint8_t type)
{
    int32_t tmp_sum;
    tmp_sum = C3_1 * ((int32_t) top + (int32_t) bot);
    *top_out = ((C3_2 * (int32_t) bot) + tmp_sum + DCT_ROUND_VAL) >> DCT_PRECISION;
    *bot_out = ((C3_3 * (int32_t) top) + tmp_sum + DCT_ROUND_VAL) >> DCT_PRECISION;
}

static inline void butterfly_2d_fixed_6(compute_t top, compute_t bot, compute_t *top_out, compute_t *bot_out, uint8_t type)
{
    int32_t tmp_sum;
    tmp_sum = C6_1 * ((int32_t) top + (int32_t) bot);
    *top_out = ((C6_2 * (int32_t) bot) + tmp_sum + DCT_ROUND_VAL) >> DCT_PRECISION;
    *bot_out = ((C6_3 * (int32_t) top) + tmp_sum + DCT_ROUND_VAL) >> DCT_PRECISION;
}

#endif // SENG440_LOEFFLER_2D_FIXED_INLINE_H