#ifndef ROUND_H
#define ROUND_H

#include <stdint.h>

#define ROUND_INT8(f) ((int8_t)(f >= 0.0 ? (f + 0.5) : (f - 0.5)))
#define ROUND_INT16(f) ((int16_t)(f >= 0.0 ? (f + 0.5) : (f - 0.5)))
#define ROUND_UINT8(f) ((uint8_t)(f >= 0.0 ? (f + 0.5) : (f - 0.5)))
#define ROUND_UINT16(f) ((uint16_t)(f >= 0.0 ? (f + 0.5) : (f - 0.5)))

#endif // ROUND_H
