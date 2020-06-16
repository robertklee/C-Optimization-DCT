cmake_minimum_required(VERSION 3.1 FATAL_ERROR)

project(seng440 LANGUAGES C)

add_compile_options(-Wall -Werror)

add_executable(dct
               ${PROJECT_SOURCE_DIR}/src/main.c
               ${PROJECT_SOURCE_DIR}/src/dct.c
               ${PROJECT_SOURCE_DIR}/src/dct/naive.c
               ${PROJECT_SOURCE_DIR}/src/dct/twostep_slow.c
               ${PROJECT_SOURCE_DIR}/src/dct/loeffler.c)
target_include_directories(dct PUBLIC ${PROJECT_SOURCE_DIR}/include)


# List cmake properties (for debugging)
if (DEBUG_CMAKE)
    get_cmake_property(_variableNames VARIABLES)
    list (SORT _variableNames)
    foreach (_variableName ${_variableNames})
        message(STATUS "${_variableName}=${${_variableName}}")
    endforeach()
endif()
