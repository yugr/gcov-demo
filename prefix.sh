#!/bin/sh

set -eu
set -x

cd $(dirname $0)

find -name merged_profile -name 'coverage.*' -o -name '*.gcov' -o -name '*.gcda' -o -name '*.gcno' | xargs rm -rf

gcc --coverage src/repro.c

GCOV_PREFIX=coverage.1 ./a.out 1
GCOV_PREFIX=coverage.2 ./a.out 2

sh -x `which gcov-tool-many` merge coverage.*

cp `find coverage.1/ -name \*.gcda` .
#gcov --stdout repro.c
gcov --stdout repro.gcno

cp `find coverage.2/ -name \*.gcda` .
#gcov --stdout repro.c
gcov --stdout repro.gcno

cp `find merged_profile/ -name \*.gcda` .
#gcov --stdout repro.c
gcov --stdout repro.gcno
