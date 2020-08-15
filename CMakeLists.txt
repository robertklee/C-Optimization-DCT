cmake_minimum_required(VERSION 3.11 FATAL_ERROR)

project(seng440 LANGUAGES C)

if (CMAKE_C_COMPILER STREQUAL "arm-linux-gcc")
    set_target_properties(dct PROPERTIES COMPILE_FLAGS "${COMPILE_FLAGS} -static -S")
endif()

add_compile_options(-Wall -Werror -Wno-parentheses)

set(SOURCE_FILES_DCT
        ${PROJECT_SOURCE_DIR}/src/main.c
        ${PROJECT_SOURCE_DIR}/src/dct.c
        ${PROJECT_SOURCE_DIR}/src/dct/naive.c
        ${PROJECT_SOURCE_DIR}/src/dct/twostep_slow.c
        ${PROJECT_SOURCE_DIR}/src/dct/loeffler_float.c
        ${PROJECT_SOURCE_DIR}/src/dct/loeffler_fixed.c
        ${PROJECT_SOURCE_DIR}/src/dct/loeffler_2d_fixed.c
        ${PROJECT_SOURCE_DIR}/src/dct/loeffler_2d_fixed_inline.c
        ${PROJECT_SOURCE_DIR}/src/dct/loeffler_2d_fixed_macro.c
        ${PROJECT_SOURCE_DIR}/src/util/helpers.c
)

add_executable(dct ${SOURCE_FILES_DCT})
target_include_directories(dct PUBLIC ${PROJECT_SOURCE_DIR}/include)

add_library(dct_macro_expanded ${SOURCE_FILES_DCT})
target_include_directories(dct_macro_expanded PUBLIC ${PROJECT_SOURCE_DIR}/include)

set_target_properties(dct PROPERTIES COMPILE_FLAGS "${COMPILE_FLAGS} -std=c99 -save-temps -O0 -fverbose-asm -g")
set_target_properties(dct_macro_expanded PROPERTIES COMPILE_FLAGS "${COMPILE_FLAGS} -E")

# List cmake properties (for debugging)
if (DEBUG_CMAKE)
    get_cmake_property(_variableNames VARIABLES)
    list (SORT _variableNames)
    foreach (_variableName ${_variableNames})
        message(STATUS "${_variableName}=${${_variableName}}")
    endforeach()
endif()
