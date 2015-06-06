#!/usr/bin/env bash

set -o errexit
set -o verbose

ROOTDIR=$(git rev-parse --show-toplevel)

UNIT_TESTS="tests/core/unit-tests"

make -C ${ROOTDIR}/${UNIT_TESTS}
LD_LIBRARY_PATH=${ROOTDIR}:$LD_LIBRARY_PATH ${ROOTDIR}/${UNIT_TESTS}/unit-tests
BEURK_ATTACKER=true LD_LIBRARY_PATH=${ROOTDIR}:$LD_LIBRARY_PATH \
    ${ROOTDIR}/${UNIT_TESTS}/unit-tests
make distclean -C ${ROOTDIR}/${UNIT_TESTS}