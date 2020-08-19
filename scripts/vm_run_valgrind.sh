#! /bin/bash

BASE="/root/C-Optimization-DCT"

BUILD="${BASE}/build"
TEST="${BASE}/test"
OUTPUT="${BASE}/valgrind"

PARAMS="${TEST}/240x360_random 240 360"

EXECUTABLES=( dct dct_O0 dct_O1 dct_O2 dct_O3 dct_OFast dct_finline_functions dct_funroll_loops dct_max )

mkdir -p ${OUTPUT}

for executable in "${EXECUTABLES[@]}"
do
    /usr/bin/valgrind --tool=callgrind --callgrind-out-file=${OUTPUT}/${executable}.output ${BUILD}/${executable} ${PARAMS}
done

echo "Done running valgrind on all executables\n"
