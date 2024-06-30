#! /bin/bash
#
# As we use a timeout of 3 minutes, anything that takes more than about 2.5 minutes wall-clock time is suspect.
#

APPDIR=$( dirname $0 )

# find -type f -name '*debug-2.log' | xargs -n 100 grep -i -e 'assert failed' -l | xargs -n 10 rm

# find -name '*.log' | xargs -n 10 grep -E '^real\s[2-9]'  >> wicked-timeouts-happening.md

find -type f -name '*-debug-2.log' | xargs -n 100 grep -E -w -e 'sending signal TERM' -l > tesseract-runs-forcibly-terminated.jsonl.list
