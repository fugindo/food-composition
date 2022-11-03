#!/bin/bash

# This script can be used to run flutter test for a given directory (defaults to the current directory)
# It will exclude generated code and translations (mimicking the ci) and open the coverage report in a
# new window once it has run successfully.
#
# To run in current directory:
# ./run_test_with_coverage
#
# To run in other directory:
# ./run_test_with_coverage ./path/to/other/project

set -e

PROJECT_PATH="${1:-.}"
PROJECT_COVERAGE=./coverage/lcov.info
FILTERED_COVERAGE=./coverage/filtered.info
INITIAL_PATH="$(pwd)"

cd "${PROJECT_PATH}"

rm -rf ./coverage

flutter test --no-pub --test-randomize-ordering-seed random --coverage -x presubmit-only
lcov --remove "${PROJECT_COVERAGE}" -o "${FILTERED_COVERAGE}" \
    '**/*.g.dart' \
    '**/l10n/*.dart' \
    '**/app/bootstrap.dart' \
    '**/*.gen.dart'
genhtml "${FILTERED_COVERAGE}" -o coverage
open ./coverage/index.html
cd "${INITIAL_PATH}"
