separate_arguments( ARGS )

# make sure the binary exists
if(NOT EXISTS "${EXE}")
   message(FATAL_ERROR "Executable not found: ${EXE}")
endif()

# where do we find the expected output?
# this deals with CR/LF differences
if(${UNIX})
   SET(LOCEXP "${LOC}/unix")
else(${UNIX})
   SET(LOCEXP "${LOC}/windows")
endif(${UNIX})

# Run the test
execute_process(
        COMMAND ${EXE} ${ARGS}
		INPUT_FILE ${LOC}/test-${ID}.in
        TIMEOUT 3
        OUTPUT_FILE test-${ID}.out
        RESULT_VARIABLE run_not_successful
)
#if program runs with exit code 0 or 1
if( (run_not_successful EQUAL 0 ) OR  (run_not_successful EQUAL 1 ))
    execute_process(
        COMMAND ${CMAKE_COMMAND} -E compare_files ${LOCEXP}/test-${ID}.expected test-${ID}.out
        RESULT_VARIABLE test_not_successful
    )
else( (run_not_successful EQUAL 0 ) OR  (run_not_successful EQUAL 1 ))
    message( SEND_ERROR "Test ${ID} could not be executed: [${LOC}/test-${ID}.in] binary [${EXE}]")
endif( (run_not_successful EQUAL 1 ) OR  (run_not_successful EQUAL 1 ))

if( test_not_successful)
   message( SEND_ERROR "${LOC}/test-${ID}.expected does not match test-${ID}.out")
endif( test_not_successful )
