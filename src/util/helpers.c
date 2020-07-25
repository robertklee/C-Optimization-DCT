#include "util/helpers.h"

#include <stdint.h>
#include <stdio.h>

void print_line(const void* x, ElementType elementType)
{
    // https://stackoverflow.com/questions/92396/why-cant-variables-be-declared-in-a-switch-statement
    switch(elementType) {
        case kUint8:
        {
            const uint8_t* m = (uint8_t*) x;
            printf("%02hhx %02hhx %02hhx %02hhx %02hhx %02hhx %02hhx %02hhx\n",
                   m[0], m[1], m[2], m[3], m[4], m[5], m[6], m[7]);
            break;
        }
        case kUint16:
        {
            const uint16_t* m = (uint16_t*) x;
            printf("%04hx %04hx %04hx %04hx %04hx %04hx %04hx %04hx\n",
                   m[0], m[1], m[2], m[3], m[4], m[5], m[6], m[7]);
            break;
        }
        case kInt8:
        {
            const int8_t* m = (int8_t*) x;
            printf("%04hhx %04hhx %04hhx %04hhx %04hhx %04hhx %04hhx %04hhx\n",
                   m[0], m[1], m[2], m[3], m[4], m[5], m[6], m[7]);
            break;
        }
        case kInt16:
        {
            const int16_t* m = (int16_t*) x;
            printf("%04hx %04hx %04hx %04hx %04hx %04hx %04hx %04hx\n",
                   m[0], m[1], m[2], m[3], m[4], m[5], m[6], m[7]);
            break;
        }
        case kInt:
        {
            const int* m = (int*) x;
            printf("%04d %04d %04d %04d %04d %04d %04d %04d\n",
                   m[0], m[1], m[2], m[3], m[4], m[5], m[6], m[7]);
            break;
        }
        case kDouble:
        {
            const double* m = (double*) x;
            printf("%07.2lf %07.2lf %07.2lf %07.2lf %07.2lf %07.2lf %07.2lf %07.2lf\n",
                   m[0], m[1], m[2], m[3], m[4], m[5], m[6], m[7]);
            break;
        }
        default:
            break;
    }
    
}
