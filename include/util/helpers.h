#ifndef HELPERS_H
#define HELPERS_H

#include <stdint.h>

typedef enum {
    kUint8 = 0,
    kUint16,
    kInt8,
    kInt16,
    kInt,
    kDouble
} ElementType;

void print_line(const void* x, ElementType elementType);

#endif // HELPERS_H
