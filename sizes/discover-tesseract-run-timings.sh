#! /bin/bash
#
# Process the reported wall clock times and produce a file that's easier to process, where timings are in SECONDS in JSONL format - one JSON per line == per tesseract run.
#

APPDIR=$( dirname $0 )

find -type f -name '*-debug-2.log' | xargs -n 100 grep -E '^real\s' | node ${APPDIR}/calc_real_time_secs.js > tesseract-run-timings.jsonl.list
