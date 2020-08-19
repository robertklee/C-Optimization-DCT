#ifndef CONSTANTS_H
#define CONSTANTS_H

#include <stdint.h>

#define PI                  3.141592653589793
#define SQRT_2              1.414213562373095048801688724209698078569671875376948073176
#define SQRT_2_INV          0.707106781186547524400844362104849039284835937688474036588
#define ROUND_NEAREST       0.5

// BTRFLY_ASM_TYPE defines the way that the butterfly operation is implemented in asm.
// 1 uses a "BTRFLY" assembly instruction.
// 2 uses a sequence of assembly instructions intended to approximate the cost of the butterfly operation.
// any other value uses nothing, i.e. a NOP.
#ifndef BTRFLY_ASM_TYPE
#define BTRFLY_ASM_TYPE 1
#endif // BTRFLY_ASM_TYPE

// Set to 1 for running correctness tests, where output is printed.
#ifndef PRINT_DCT_OUTPUT
#define PRINT_DCT_OUTPUT 1
#endif // PRINT_DCT_OUTPUT

// DCT_PRECISION: How many bits for each scaling factor.
#if DCT_PRECISION != 10 && DCT_PRECISION != 8 && DCT_PRECISION != 7 && DCT_PRECISION != 6 && DCT_PRECISION != 4
#ifdef DCT_PRECISION
#undef DCT_PRECISION
#endif
#define DCT_PRECISION (7)
#endif

#if DCT_PRECISION == 10
// Butterfly constants
#define C1_1 (1004)     // cos(pi/16)
#define C1_2 (-805)     // sin(pi/16) - cos(pi/16)
#define C1_3 (-1204)    // -sin(pi/16) - cos(pi/16)
#define C3_1 (851)      // cos(3pi/16)
#define C3_2 (-283)     // sin(3pi/16) - cos(3pi/16)
#define C3_3 (-1420)    // -sin(3pi/16) - cos(3pi/16)
#define C6_1 (554)      // sqrt(2) * (cos(6pi/16))
#define C6_2 (784)      // sqrt(2) * (sin(6pi/16) - cos(6pi/16))
#define C6_3 (-1892)    // sqrt(2) * (-sin(6pi/16) - cos(6pi/16))
// Related DCT constants
#define DCT_RT2_PRECISION (10)
#define DCT_RT2 (1448) // sqrt(2)
#define DCT_ROUND_VAL (512)     // 1 << (DCT_PRECISION - 1)
#define DCT_RT2_ROUND_VAL (512) // 1 << (DCT_RT2_PRECISION - 1)

#elif DCT_PRECISION == 8
// Butterfly constants
#define C1_1 (251)      // cos(pi/16)
#define C1_2 (-201)     // sin(pi/16) - cos(pi/16)
#define C1_3 (-301)     // -sin(pi/16) - cos(pi/16)
#define C3_1 (213)      // cos(3pi/16)
#define C3_2 (-71)      // sin(3pi/16) - cos(3pi/16)
#define C3_3 (-355)     // -sin(3pi/16) - cos(3pi/16)
#define C6_1 (139)      // sqrt(2) * (cos(6pi/16))
#define C6_2 (196)      // sqrt(2) * (sin(6pi/16) - cos(6pi/16))
#define C6_3 (-473)     // sqrt(2) * (-sin(6pi/16) - cos(6pi/16))
// Related DCT constants
#define DCT_RT2_PRECISION (7)
#define DCT_RT2 (181)  // sqrt(2)
#define DCT_ROUND_VAL (128)     // 1 << (DCT_PRECISION - 1)
#define DCT_RT2_ROUND_VAL (64)  // 1 << (DCT_RT2_PRECISION - 1)

#elif DCT_PRECISION == 7
// Butterfly constants
#define C1_1 (126)      // cos(pi/16)
#define C1_2 (-101)     // sin(pi/16) - cos(pi/16)
#define C1_3 (-151)     // -sin(pi/16) - cos(pi/16)
#define C3_1 (106)      // cos(3pi/16)
#define C3_2 (-35)      // sin(3pi/16) - cos(3pi/16)
#define C3_3 (-178)     // -sin(3pi/16) - cos(3pi/16)
#define C6_1 (69)       // sqrt(2) * (cos(6pi/16))
#define C6_2 (98)       // sqrt(2) * (sin(6pi/16) - cos(6pi/16))
#define C6_3 (-237)     // sqrt(2) * (-sin(6pi/16) - cos(6pi/16))
// Related DCT constants
#define DCT_RT2_PRECISION (5)
#define DCT_RT2 (45)   // sqrt(2)
#define DCT_ROUND_VAL (64)      // 1 << (DCT_PRECISION - 1)
#define DCT_RT2_ROUND_VAL (16)  // 1 << (DCT_RT2_PRECISION - 1)

#elif DCT_PRECISION == 6
// Butterfly constants
#define C1_1 (63)       // cos(pi/16)
#define C1_2 (-50)      // sin(pi/16) - cos(pi/16)
#define C1_3 (-75)      // -sin(pi/16) - cos(pi/16)
#define C3_1 (53)       // cos(3pi/16)
#define C3_2 (-18)      // sin(3pi/16) - cos(3pi/16)
#define C3_3 (-89)      // -sin(3pi/16) - cos(3pi/16)
#define C6_1 (35)       // sqrt(2) * (cos(6pi/16))
#define C6_2 (49)       // sqrt(2) * (sin(6pi/16) - cos(6pi/16))
#define C6_3 (-118)     // sqrt(2) * (-sin(6pi/16) - cos(6pi/16))
// Related DCT constants
#define DCT_RT2_PRECISION (5)
#define DCT_RT2 (45)   // sqrt(2)
#define DCT_ROUND_VAL (32)      // 1 << (DCT_PRECISION - 1)
#define DCT_RT2_ROUND_VAL (16)  // 1 << (DCT_RT2_PRECISION - 1)

#elif DCT_PRECISION == 4
// Butterfly constants
#define C1_1 (16)       // cos(pi/16)
#define C1_2 (-13)      // sin(pi/16) - cos(pi/16)
#define C1_3 (-19)      // -sin(pi/16) - cos(pi/16)
#define C3_1 (13)       // cos(3pi/16)
#define C3_2 (-4)       // sin(3pi/16) - cos(3pi/16)
#define C3_3 (-22)      // -sin(3pi/16) - cos(3pi/16)
#define C6_1 (9)        // sqrt(2) * (cos(6pi/16))
#define C6_2 (12)       // sqrt(2) * (sin(6pi/16)- cos(6pi/16))
#define C6_3 (-30)      // sqrt(2) * (-sin(6pi/16) - cos(6pi/16))
// Related DCT constants
#define DCT_RT2_PRECISION (4)
#define DCT_RT2 (23)   // sqrt(2)
#define DCT_ROUND_VAL (64)      // 1 << (DCT_PRECISION - 1)
#define DCT_RT2_ROUND_VAL (32)  // 1 << (DCT_RT2_PRECISION - 1)

#endif // DCT_PRECISION


typedef enum {
    ALL = 0,
    NONE,
    NAIVE,
    TWO_STEP,
    LOEFFLER_FLOAT,
    LOEFFLER_FIXED,
    LOEFFLER_2D_FIXED,
    LOEFFLER_2D_FIXED_INLINE,
    LOEFFLER_2D_FIXED_MACRO,
    LOEFFLER_2D_FIXED_ASM
} ExecutionMode;

typedef enum {
    kUint8 = 0,
    kUint16,
    kInt8,
    kInt16,
    kInt,
    kDouble
} ElementType;

// compute_t: Type used for computation in loeffler implementation(s).
typedef int16_t compute_t;

// A flag to specify whether we are working with a level-off input. 
// Set to 0 (FALSE) to turn off
#define LEVEL_OFF_ACTIVE (1)

// Conditionally set the type as int8_t or uint8_t depending on if we are performing
// level off [-128,127] or not [0,255]
#if (LEVEL_OFF_ACTIVE)
typedef int8_t DataType;
#else
typedef uint8_t DataType;
#endif // LEVEL_OFF_ACTIVE

#endif // CONSTANTS_H
