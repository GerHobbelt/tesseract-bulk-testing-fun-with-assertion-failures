#! /bin/bash
pushd $( dirname $0 )                                                       > /dev/null
if ! test -f ./PSM1-TH0-USIZE-2700x7438-debug-2.log || test "$1" = "-f" ; then
(
    shift
    # sometimes a tesseract run hangs; haven't found a decent clue why, so we apply a fixed timeout/abort to keep the run going, no matter what happens.
    ( set -x ; echo "PWD: $( pwd )" ;  time timeout -v -k 1s 3m   "/c/Program Files/Tesseract-OCR/tesseract.exe"  --loglevel ALL -l eng --psm 1 --oem 3 --tessdata-dir ../../../../tessdata -c debug_file=PSM1-TH0-USIZE-2700x7438-debug.log -c thresholding_method=0 -c document_title=tessdata-PSM1-OEM3-TH0-1001-000-0003-b-leveled  ../../DERIVSRC-1001-000-0003-b-leveled-USIZE-2700x7438.webp PSM1-TH0-USIZE-2700x7438  hocr     $@     txt tsv  ../../../tess_run_01.conf )    > ./PSM1-TH0-USIZE-2700x7438-debug-1.log   2> ./PSM1-TH0-USIZE-2700x7438-debug-2.log
) &
fi
popd                                                                         > /dev/null
