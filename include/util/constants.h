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

// A flag to specify whether we are working with a level-off input. 
// Comment out if we want to use unsigned
#define LEVEL_OFF_ACTIVE

// Conditionally set the type as int8_t or uint8_t depending on if we are performing
// level off [-128,127] or not [0,255]
#ifdef LEVEL_OFF_ACTIVE
typedef int8_t DataType;
#else
typedef uint8_t DataType;
#endif // LEVEL_OFF_ACTIVE

#endif // CONSTANTS_H
