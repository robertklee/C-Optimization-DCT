#ifndef SENG440_DCT_H
#define SENG440_DCT_H

#include <stdint.h>

// Takes a pointer to an array of size width*height, performing an
// 2D DCT on the input, using 8x8 chunks. width and height must both
// be divisible by 8. 
// TODO: determine output format
void dct(uint8_t *data, long width, long height);

#endif // SENG440_DCT_H
