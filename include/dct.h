#ifndef SENG440_DCT_H
#define SENG440_DCT_H

#include <stdint.h>
#include "util/constants.h"

// Takes a pointer to an array of size width*height, performing an
// 2D DCT on the input, using 8x8 chunks. width and height must both
// be divisible by 8.
void dct(DataType *data, long width, long height, ExecutionMode executionMode);

#endif // SENG440_DCT_H
