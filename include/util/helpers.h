#ifndef HELPERS_H
#define HELPERS_H

#include <stdint.h>
#include "util/constants.h"

void print_line(const void* x, ElementType elementType);

uint8_t* read_file(const char * const filepath_arg, unsigned long width, unsigned long height);

int8_t* JPG_level_off(uint8_t* in, unsigned long width, unsigned long height);

void read_arguments(int argc, char** argv, const char ** const path, long* width, long* height, ExecutionMode* executionMode);



#endif // HELPERS_H
