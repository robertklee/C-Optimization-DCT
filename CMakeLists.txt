cmake_minimum_required(VERSION 3.11 FATAL_ERROR)

project(seng440 LANGUAGES C)

add_compile_options(-Wall -Werror -Wno-parentheses)

option(ENABLE_OPT               "Enable optimization targets"           false)
option(ENABLE_MACRO_EXPANSION   "Enable macro expansion target"         false)
option(ENABLE_ASM_COMPILATION   "Enable ASM compilation"                false)
option(ENABLE_OUTPUT            "Enable printing to console"            true)
option(ENABLE_SAVE_ASM          "Enable saving of intermediate asm"     false)
option(ENABLE_OPT_MAX           "Enable maximum optimization target"    false)
option(ENABLE_BTRFLY_OPERATOR   "Enable theoretical BTRFLY operator"    true)

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

# Conditionally compile asm optimzed implementation
if (ENABLE_ASM_COMPILATION)
    set(SOURCE_FILES_DCT 
        ${SOURCE_FILES_DCT}
        ${PROJECT_SOURCE_DIR}/src/dct/loeffler_2d_fixed_asm.c)

    add_definitions(-DENABLE_ASM_COMPILATION=1)
else()
    add_definitions(-DENABLE_ASM_COMPILATION=0)
endif()

# add printing
if (ENABLE_OUTPUT)
    add_definitions(-DPRINT_DCT_OUTPUT=1)
else()
    add_definitions(-DPRINT_DCT_OUTPUT=0)
endif()

# add BTRFLY operator
if (ENABLE_BTRFLY_OPERATOR)
    add_definitions(-DBTRFLY_ASM_TYPE=1)
else()
    add_definitions(-DBTRFLY_ASM_TYPE=2)
endif()


# Base compilation flags
set(BASE_COMPILE_FLAGS "${COMPILE_FLAGS} -std=c99 -g")

# If intermediate asm output is enabled
if (ENABLE_SAVE_ASM)
    set(BASE_COMPILE_FLAGS "${BASE_COMPILE_FLAGS} -save-temps -fverbose-asm ")
endif()

# If compiler is ARM
if (CMAKE_C_COMPILER STREQUAL "arm-linux-gcc")
    set(BASE_COMPILE_FLAGS "{BASE_COMPILE_FLAGS} -static -S")
endif()

# Debugging target
add_executable(dct ${SOURCE_FILES_DCT})
target_include_directories(dct PUBLIC ${PROJECT_SOURCE_DIR}/include)
set_target_properties(dct       PROPERTIES COMPILE_FLAGS "${COMPILE_FLAGS} ${BASE_COMPILE_FLAGS}")

# Set compiler optimization levels for corresponding targets
# https://caiorss.github.io/C-Cpp-Notes/compiler-flags-options.html
if (ENABLE_OPT)
    add_executable(dct_O0                                   ${SOURCE_FILES_DCT})
    add_executable(dct_O1                                   ${SOURCE_FILES_DCT})
    add_executable(dct_O2                                   ${SOURCE_FILES_DCT})
    add_executable(dct_O3                                   ${SOURCE_FILES_DCT})
    add_executable(dct_OFast                                ${SOURCE_FILES_DCT})
    add_executable(dct_finline_functions                    ${SOURCE_FILES_DCT})
    add_executable(dct_funroll_loops                        ${SOURCE_FILES_DCT})
    
    target_include_directories(dct_O0                       PUBLIC ${PROJECT_SOURCE_DIR}/include)
    target_include_directories(dct_O1                       PUBLIC ${PROJECT_SOURCE_DIR}/include)
    target_include_directories(dct_O2                       PUBLIC ${PROJECT_SOURCE_DIR}/include)
    target_include_directories(dct_O3                       PUBLIC ${PROJECT_SOURCE_DIR}/include)
    target_include_directories(dct_OFast                    PUBLIC ${PROJECT_SOURCE_DIR}/include)
    target_include_directories(dct_finline_functions        PUBLIC ${PROJECT_SOURCE_DIR}/include)
    target_include_directories(dct_funroll_loops            PUBLIC ${PROJECT_SOURCE_DIR}/include)

    # Set compiler version to C99
    set_target_properties(  dct_O0
                            dct_O1
                            dct_O2
                            dct_O3
                            dct_OFast
                            dct_finline_functions
                            dct_funroll_loops
                            PROPERTIES COMPILE_FLAGS "${COMPILE_FLAGS} ${BASE_COMPILE_FLAGS}")

    # Add additional flags for various optimization levels targets
    set_target_properties(dct_O0                    PROPERTIES COMPILE_FLAGS "${COMPILE_FLAGS} -O0")
    set_target_properties(dct_O1                    PROPERTIES COMPILE_FLAGS "${COMPILE_FLAGS} -O1")
    set_target_properties(dct_O2                    PROPERTIES COMPILE_FLAGS "${COMPILE_FLAGS} -O2")
    set_target_properties(dct_O3                    PROPERTIES COMPILE_FLAGS "${COMPILE_FLAGS} -O3")
    set_target_properties(dct_OFast                 PROPERTIES COMPILE_FLAGS "${COMPILE_FLAGS} -Ofast")
    set_target_properties(dct_finline_functions     PROPERTIES COMPILE_FLAGS "${COMPILE_FLAGS} -finline-functions")
    set_target_properties(dct_funroll_loops         PROPERTIES COMPILE_FLAGS "${COMPILE_FLAGS} -funroll-loops")
    

endif()

# Maximum optimization target
if (ENABLE_OPT_MAX)
    add_executable(dct_max                          ${SOURCE_FILES_DCT})
    target_include_directories(dct_max              PUBLIC ${PROJECT_SOURCE_DIR}/include)
    set_target_properties(dct_max                   PROPERTIES COMPILE_FLAGS "${COMPILE_FLAGS} ${BASE_COMPILE_FLAGS} -std=c99 -save-temps -fverbose-asm -O3 -finline-functions -funroll-loops -frename-registers -march=native")
endif()

# Compiler target to only generate pre-processor expansions
if (ENABLE_MACRO_EXPANSION)

    add_library(dct_macro_expanded                          ${SOURCE_FILES_DCT})
    target_include_directories(dct_macro_expanded PUBLIC    ${PROJECT_SOURCE_DIR}/include)
    set_target_properties(dct_macro_expanded        PROPERTIES COMPILE_FLAGS "${COMPILE_FLAGS} -std=c99 -save-temps -fverbose-asm -E")

endif()

# List cmake properties (for debugging)
if (DEBUG_CMAKE)
    get_cmake_property(_variableNames VARIABLES)
    list (SORT _variableNames)
    foreach (_variableName ${_variableNames})
        message(STATUS "${_variableName}=${${_variableName}}")
    endforeach()
endif()
