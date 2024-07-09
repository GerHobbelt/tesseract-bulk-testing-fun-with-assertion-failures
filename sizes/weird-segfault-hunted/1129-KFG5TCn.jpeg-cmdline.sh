#! /bin/bash
pushd $( dirname $0 )                                                       > /dev/null
if ! test -f ./1129-KFG5TCn.jpeg-diagnostics-log.html || test "$1" = "-f" ; then
(
    shift
    # sometimes a tesseract run hangs; haven't found a decent clue why, so we apply a fixed timeout/abort to keep the run going, no matter what happens.
    ( set -x ; echo "PWD: $( pwd )" ;  time timeout -v -k 1s 3m   "/z/lib/tooling/qiqqa/MuPDF/platform/win32/bin/Release-Unicode-64bit-x64/tesseract.exe"  --loglevel ALL -l eng --psm 1 --oem 3 --tessdata-dir ../../tessdata -c debug_file=1129-KFG5TCn.jpeg-diagnostics-log.log -c thresholding_method=0 -c document_title=tessdata-1129-KFG5TCn  ../1129-KFG5TCn.jpeg  1129-KFG5TCn.jpeg-diagnostics-log  hocr     $@     txt tsv  ../tess_run_segfault_hunt.conf )    > ./1129-KFG5TCn.jpeg-diagnostics-debug-1.log   2> ./1129-KFG5TCn.jpeg-diagnostics-debug-2.log

	grep 'Segmentation fault' -B 20 -A 1000 ./1129-KFG5TCn.jpeg-diagnostics-debug-2.log | tee -a ./segfaults-found.grep.lst
) &
fi
popd                                                                         > /dev/null
