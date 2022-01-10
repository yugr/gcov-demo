#!/bin/sh

set -eu
set -x

cd $(dirname $0)

find -name merged_profile -o -name 'coverage.*' -o -name '*.gcov' -o -name '*.gcda' -o -name '*.gcno' | xargs rm -rf

gcc --coverage -fprofile-dir=coverage.%p src/repro.c

./a.out 1
./a.out 2

gcov-tool-many merge coverage.*
#gcov-tool merge coverage.*

mv merged_profile/*.gcda .

gcov --stdout *.gcno
