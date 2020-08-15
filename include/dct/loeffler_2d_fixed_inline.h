#ifndef SENG440_LOEFFLER_2D_FIXED_INLINE_H
#define SENG440_LOEFFLER_2D_FIXED_INLINE_H

#include <stdint.h>
#include "util/constants.h"

void dct_loeffler_2d_fixed_inline(DataType data_in[8][8], int16_t data_out[8][8]);

// requires 1 extra bit. requires DCT_PRECISION extra bits to be available.
// therefore, for compute_t = int16_t and DCT_PRECISION = 7, the inputs must be 7 bits.
#define COS_COEFF_1 (C1_1)
#define COS_COEFF_2 (C1_2)
#define COS_COEFF_3 (C1_3)
static inline void butterfly_2d_fixed_1(compute_t top, compute_t bot, compute_t *top_out, compute_t *bot_out)
{
    int32_t tmp_sum;
    tmp_sum = COS_COEFF_1 * ((int32_t) top + (int32_t)  bot);
    *top_out = ((COS_COEFF_2 * (int32_t) bot) + tmp_sum + DCT_ROUND_VAL) >> DCT_PRECISION;
    *bot_out = ((COS_COEFF_3 * (int32_t) top) + tmp_sum + DCT_ROUND_VAL) >> DCT_PRECISION;
}

#undef COS_COEFF_1
#undef COS_COEFF_2
#undef COS_COEFF_3

#define COS_COEFF_1 (C3_1)
#define COS_COEFF_2 (C3_2)
#define COS_COEFF_3 (C3_3)
static inline void butterfly_2d_fixed_3(compute_t top, compute_t bot, compute_t *top_out, compute_t *bot_out)
{
    int32_t tmp_sum;
    tmp_sum = COS_COEFF_1 * ((int32_t) top + (int32_t) bot);
    *top_out = ((COS_COEFF_2 * (int32_t) bot) + tmp_sum + DCT_ROUND_VAL) >> DCT_PRECISION;
    *bot_out = ((COS_COEFF_3 * (int32_t) top) + tmp_sum + DCT_ROUND_VAL) >> DCT_PRECISION;
}

#undef COS_COEFF_1
#undef COS_COEFF_2
#undef COS_COEFF_3

#define COS_COEFF_1 (C6_1)
#define COS_COEFF_2 (C6_2)
#define COS_COEFF_3 (C6_3)
static inline void butterfly_2d_fixed_6(compute_t top, compute_t bot, compute_t *top_out, compute_t *bot_out)
{
    int32_t tmp_sum;
    tmp_sum = COS_COEFF_1 * ((int32_t) top + (int32_t) bot);
    *top_out = ((COS_COEFF_2 * (int32_t) bot) + tmp_sum + DCT_ROUND_VAL) >> DCT_PRECISION;
    *bot_out = ((COS_COEFF_3 * (int32_t) top) + tmp_sum + DCT_ROUND_VAL) >> DCT_PRECISION;
}

#undef COS_COEFF_1
#undef COS_COEFF_2
#undef COS_COEFF_3

#endif // SENG440_LOEFFLER_2D_FIXED_INLINE_H