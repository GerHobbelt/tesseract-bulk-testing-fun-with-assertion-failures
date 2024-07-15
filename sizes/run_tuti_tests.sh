#! /bin/bash

set -v

./renumber-new-images.sh

( ./run_all_HTML_debug_diag_demo_output.sh )

( ./run_all_tess_A_rounds.sh ) &
( ./run_all_tess_B_rounds.sh ) &
( ./run_all_tess_C_rounds.sh ) &
( ./run_all_tess_D_rounds.sh ) &

# ./weird-segfault-hunter.sh

./discover-failed-tesseract-runs.sh
./discover-tesseract-run-timings.sh
./discover-timed-out-tesseract-runs.sh
