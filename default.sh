#!/bin/sh

set -eu
set -x

find -name merged_profile -name 'coverage.*' -o -name '*.gcov' -o -name '*.gcda' -o -name '*.gcno' | xargs rm -rf

gcc --coverage src/repro.c

./a.out 1

#gcov --stdout src/repro.c
gcov --stdout repro.gcno
