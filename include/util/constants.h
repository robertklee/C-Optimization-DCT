#ifndef CONSTANTS_H
#define CONSTANTS_H

#include <stdint.h>

#define PI                  3.141592653589793
#define SQRT_2              1.414213562373095048801688724209698078569671875376948073176
#define SQRT_2_INV          0.707106781186547524400844362104849039284835937688474036588
#define ROUND_NEAREST       0.5

typedef enum {
    ALL = 0,
    NONE,
    NAIVE,
    TWO_STEP,
    LOEFFLER_FLOAT,
    LOEFFLER_FIXED,
    LOEFFLER_2D_FIXED
} ExecutionMode;

typedef enum {
    kUint8 = 0,
    kUint16,
    kInt8,
    kInt16,
    kInt,
    kDouble
} ElementType;

typedef uint8_t DataType;

#endif // CONSTANTS_H
