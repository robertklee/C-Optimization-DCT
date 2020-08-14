#include "util/helpers.h"
#include "util/constants.h"

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

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
            printf("%04d %04d %04d %04d %04d %04d %04d %04d\n",
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

uint8_t* read_file(const char * const filepath_arg, unsigned long width, unsigned long height)
{
    // Open input file
    FILE *image_fptr = fopen(filepath_arg, "r");
    if (image_fptr == NULL)
    {
        printf("Cannot open specified file for reading.\n");
        exit(-1);
    }

    // Allocate memory for loading file data
    size_t count = width * height;
    void *image_dataptr = malloc(sizeof(uint8_t) * count);
    if (image_dataptr == NULL)
    {
        printf("Not enough memory to load image.\n");
        exit(-1);
    }

    // Load file data
    size_t bytes_read = fread(image_dataptr, sizeof(uint8_t), count, image_fptr);
    if (bytes_read != sizeof(uint8_t) * count)
    {
        printf("File size not as specified.\n");
        exit(-1);
    }

    // Close input file
    fclose(image_fptr);

    return (uint8_t*) image_dataptr;
}

int8_t* JPG_level_off(uint8_t* in, unsigned long width, unsigned long height)
{
    const uint8_t level_off = 128;
    
    // Allocate memory for loading file data
    size_t count = width * height;
    
    void *ptr = malloc(sizeof(int8_t) * count);
    
    int8_t* out = (int8_t*) ptr;

    size_t i;
    for (i = 0; i < count; i++) {
        out[i] = in[i] - level_off;
    }
    
    return out;
}

void read_arguments(int argc, char** argv, const char ** const path, long* width, long* height, ExecutionMode* executionMode)
{
    // Handle command-line arguments
    // TODO It is not ideal to have the mode be hard coded. They should dynamically be generated from the enum. Low priority for the project.
    const char *const invalid_argument = "Requires 3 or 4 arguments: filepath, width, height, <optional: algorithm>. "
                                         "Filepath must point to an 8-bit grayscale image. Algorithm parameter is defined as:\n"
                                         "0 (default): ALL\n"
                                         "1: NONE\n"
                                         "2: NAIVE\n"
                                         "3: TWO_STEP\n"
                                         "4: LOUFFLER_FLOAT\n";

    if (argc != 4 && argc != 5)
    {
        printf(invalid_argument);
        exit(-1);
    }

    const char * const filepath_arg = argv[1];
    const char * const width_arg = argv[2];
    const char * const height_arg = argv[3];

    // set error indicator variable to 0 first
    // https://stackoverflow.com/questions/36074422/why-cant-you-just-check-if-errno-is-equal-to-erange
    errno = 0;
    long width_ = strtol(width_arg, NULL, 10);
    if (errno == ERANGE || width_ <= 0)
    {
        printf(invalid_argument);
        exit(-1);
    }
    long height_ = strtol(height_arg, NULL, 10);
    if (errno == ERANGE || height_ <= 0)
    {
        printf(invalid_argument);
        exit(-1);
    }
    
    ExecutionMode executionMode_ = ALL;
    if (argc == 5) {
        const char * const execution_arg = argv[4];
        
        executionMode_ = strtol(execution_arg, NULL, 10);
        if (errno == ERANGE)
        {
            printf(invalid_argument);
            exit(-1);
        }
    }

    if (width_ % 8 != 0 || height_ % 8 != 0 || width_ < 0 || height_ < 0)
    {
        printf("Width and height of image must both be integer multiples of 8.\n");
        exit(-1);
    }

    *path = filepath_arg;
    *width = (long) width_;
    *height = (long) height_;
    *executionMode = (ExecutionMode) executionMode_;
}
