#include <stdio.h>
#include <stdlib.h>

#include "dct.h"
#include "util/helpers.h"
#include "util/constants.h"

int main(int argc, char** argv)
{
    long width = 0, height = 0;
    const char * filepath_arg;
    ExecutionMode executionMode = ALL;

    // Process command line arguments
    read_arguments(argc, argv, &filepath_arg, &width, &height, &executionMode);

    uint8_t* image_dataptr = read_file(filepath_arg, width, height);
    
#ifdef LEVEL_OFF_ACTIVE
    DataType* input_dataptr = JPG_level_off(image_dataptr, width, height);
#else
    DataType* input_dataptr = (DataType*) image_dataptr;
#endif

    // Perform DCT on loaded data
    dct(input_dataptr, width, height, executionMode);

    // Free memory
    free(image_dataptr);

    // Return success
    return 0;
}
