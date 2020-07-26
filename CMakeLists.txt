cmake_minimum_required(VERSION 3.1 FATAL_ERROR)

project(seng440 LANGUAGES C)

add_compile_options(-Wall -Werror)

# make Visual studio and Xcode output the binaries in the same build directory
SET( CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG "${CMAKE_BINARY_DIR}")
SET( CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE "${CMAKE_BINARY_DIR}")

set(binary dct)

add_executable(${binary}
               ${PROJECT_SOURCE_DIR}/src/main.c
               ${PROJECT_SOURCE_DIR}/src/dct.c
               ${PROJECT_SOURCE_DIR}/src/dct/naive.c
               ${PROJECT_SOURCE_DIR}/src/dct/twostep_slow.c
               ${PROJECT_SOURCE_DIR}/src/dct/loeffler_float.c
               ${PROJECT_SOURCE_DIR}/src/util/helpers.c
               )
target_include_directories(dct PUBLIC ${PROJECT_SOURCE_DIR}/include)


# List cmake properties (for debugging)
if (DEBUG_CMAKE)
    get_cmake_property(_variableNames VARIABLES)
    list (SORT _variableNames)
    foreach (_variableName ${_variableNames})
        message(STATUS "${_variableName}=${${_variableName}}")
    endforeach()
endif()

enable_testing()

# set the binary to be tested in each of the tests below. 
set(test_cmd ${CMAKE_BINARY_DIR}/${binary}${CMAKE_EXECUTABLE_SUFFIX} )

set(tester   ${CMAKE_CURRENT_SOURCE_DIR}/tester.cmake)
set(tests_loc ${CMAKE_CURRENT_SOURCE_DIR}/tests)

# set command line arguments
set(test_arg_00 "${PROJECT_SOURCE_DIR}/test/64_byte_input 8 8")
set(test_arg_01 "${PROJECT_SOURCE_DIR}/test/64_byte_input 8 8 1")
set(test_arg_02 "${PROJECT_SOURCE_DIR}/test/64_byte_input 8 8 2")
set(test_arg_03 "${PROJECT_SOURCE_DIR}/test/64_byte_input 8 8 3")
set(test_arg_04 "${PROJECT_SOURCE_DIR}/test/64_byte_input 8 8 4")
set(test_arg_05 "${PROJECT_SOURCE_DIR}/test/64_byte_input 8 8 5")
set(test_arg_06 )

add_test(
    NAME test00 
    COMMAND ${CMAKE_COMMAND} -DEXE=${test_cmd} -DARGS=${test_arg_00} -D ID=00 -DLOC=${tests_loc} -P ${tester}
)

add_test(
    NAME test01 
    COMMAND ${CMAKE_COMMAND} -DEXE=${test_cmd} -DARGS=${test_arg_01} -D ID=01 -DLOC=${tests_loc} -P ${tester}
)

add_test(
    NAME test02
    COMMAND ${CMAKE_COMMAND} -DEXE=${test_cmd} -DARGS=${test_arg_02} -D ID=02 -DLOC=${tests_loc} -P ${tester}
)
add_test(
    NAME test03
    COMMAND ${CMAKE_COMMAND} -DEXE=${test_cmd} -DARGS=${test_arg_03} -D ID=03 -DLOC=${tests_loc} -P ${tester}
)
add_test(
    NAME test04
    COMMAND ${CMAKE_COMMAND} -DEXE=${test_cmd} -DARGS=${test_arg_04} -D ID=04 -DLOC=${tests_loc} -P ${tester}
)
add_test(
    NAME test05
    COMMAND ${CMAKE_COMMAND} -DEXE=${test_cmd} -DARGS=${test_arg_05} -D ID=05 -DLOC=${tests_loc} -P ${tester}
)
add_test(
    NAME test06
    COMMAND ${CMAKE_COMMAND} -DEXE=${test_cmd} -DARGS=${test_arg_06} -D ID=06 -DLOC=${tests_loc} -P ${tester}
)