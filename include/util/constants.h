#ifndef CONSTANTS_H
#define CONSTANTS_H

#define PI                  3.141592653589793
#define SQRT_2              1.414213562373095048801688724209698078569671875376948073176
#define SQRT_2_INV          0.707106781186547524400844362104849039284835937688474036588
#define ROUND_NEAREST       0.5

// DCT_PRECISION: How many bits for each scaling factor. This must be at most 10.
#ifndef DCT_PRECISION
#define DCT_PRECISION (10)
#endif

// TODO: determine whether or not the FIXEDRT2 value should have fewer bits of precision. It's used a bit less than the others.

#if DCT_PRECISION == 10
#define DCT_PRECISION_DBLD (20)
#define C1_1 (1004)     // cos(pi/16)
#define C1_2 (-805)     // sin(pi/16) - cos(pi/16)
#define C1_3 (-1204)    // -sin(pi/16) - cos(pi/16)
#define C3_1 (851)      // cos(3pi/16)
#define C3_2 (-283)     // sin(3pi/16) - cos(3pi/16)
#define C3_3 (-1420)    // -sin(3pi/16) - cos(3pi/16)
#define C6_1 (554)      // sqrt(2) * (cos(6pi/16))
#define C6_2 (784)      // sqrt(2) * (sin(6pi/16) - cos(6pi/16))
#define C6_3 (-1892)    // sqrt(2) * (-sin(6pi/16) - cos(6pi/16))
#define FIXEDRT2 (1448) // sqrt(2)
#elif DCT_PRECISION == 8
#define DCT_PRECISION_DBLD (16)
#define C1_1 (251)      // cos(pi/16)
#define C1_2 (-201)     // sin(pi/16) - cos(pi/16)
#define C1_3 (-301)     // -sin(pi/16) - cos(pi/16)
#define C3_1 (213)      // cos(3pi/16)
#define C3_2 (-71)      // sin(3pi/16) - cos(3pi/16)
#define C3_3 (-355)     // -sin(3pi/16) - cos(3pi/16)
#define C6_1 (139)      // sqrt(2) * (cos(6pi/16))
#define C6_2 (196)      // sqrt(2) * (sin(6pi/16) - cos(6pi/16))
#define C6_3 (-473)     // sqrt(2) * (-sin(6pi/16) - cos(6pi/16))
#define FIXEDRT2 (362)  // sqrt(2)
#elif DCT_PRECISION == 4
#define DCT_PRECISION_DBLD (8)
#define C1_1 (16)       // cos(pi/16)
#define C1_2 (-13)      // sin(pi/16) - cos(pi/16)
#define C1_3 (-19)      // -sin(pi/16) - cos(pi/16)
#define C3_1 (13)       // cos(3pi/16)
#define C3_2 (-4)       // sin(3pi/16) - cos(3pi/16)
#define C3_3 (-22)      // -sin(3pi/16) - cos(3pi/16)
#define C6_1 (9)        // sqrt(2) * (cos(6pi/16))
#define C6_2 (12)       // sqrt(2) * (sin(6pi/16)- cos(6pi/16))
#define C6_3 (-30)      // sqrt(2) * (-sin(6pi/16) - cos(6pi/16))
#define FIXEDRT2 (23)   // sqrt(2)
#endif


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

#endif // CONSTANTS_H
