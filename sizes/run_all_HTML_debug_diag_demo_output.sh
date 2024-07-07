#! /bin/bash
#
# --loglevel ALL -l eng --psm 1 --oem 3 --tessdata-dir E:\ocr/tessdata_best -c debug_file=debug.log -c thresholding_method=0 -c document_title=tessdata_best    E:\ocr\sizes/1016-000-0006-a2-raw-webp-92pct.webp               MSVC-debugging    hocr     txt tsv  debug-all    E:\ocr\borders/tess_run_01.conf
#

# our local build:
TESS=/z/lib/tooling/qiqqa/MuPDF/platform/win32/bin/Release-Unicode-64bit-x64/tesseract.exe

DATADIR=tessdata 

rm -rf diagnostics-output
mkdir diagnostics-output

REDUCE=0
for f in 1* ; do 

	# get the basename sans extension:
	SRCNAME=$( echo "$f" | sed -E -e 's/[.][^.]+$//' )
	SRC=$f

	echo "SRCNAME: ${SRCNAME}"
	echo "SRC: ${SRC}"

	if ! test -f ./diagnostics-output/${SRC}-diagnostics-log.html || test "$2" = "-f" ; then
		((REDUCE=REDUCE+1))
        cat > ./diagnostics-output/${SRC}-cmdline.sh  <<EOT
#! /bin/bash
pushd \$( dirname \$0 )                                                       > /dev/null
if ! test -f ./${SRC}-diagnostics-log.html || test "\$1" = "-f" ; then
(
    shift
    # sometimes a tesseract run hangs; haven't found a decent clue why, so we apply a fixed timeout/abort to keep the run going, no matter what happens.
    ( set -x ; echo "PWD: \$( pwd )" ;  time timeout -v -k 1s 3m   "${TESS}"  --loglevel ALL -l eng --psm 1 --oem 3 --tessdata-dir ../../${DATADIR} -c debug_file=${SRC}-diagnostics-log.log -c thresholding_method=0 -c document_title=${DATADIR}-${SRCNAME}  ../${SRC}  ${SRC}-diagnostics-log  hocr     \$@     txt tsv  ../tess_run_htmldiag.conf )    > ./${SRC}-diagnostics-debug-1.log   2> ./${SRC}-diagnostics-debug-2.log
) &
fi
popd                                                                         > /dev/null
EOT
		#cat ./diagnostics-output/${SRC}-cmdline.sh
		./diagnostics-output/${SRC}-cmdline.sh
	fi
	
	if test ${REDUCE} -eq 8 ; then
		REDUCE=0
		echo "Waiting for the tesseract runs to finish..."
		while true ; do
			if test $( ps ax | grep -e tesseract | wc -l ) -le 8 ; then
				break
			fi
			echo "sleep..."
			sleep 1
		done
	fi
done


# wait for the last dregs to completely finish, before we call it The End...

echo "Waiting for the last tesseract runs to finish..."
while true ; do
    if test $( ps ax | grep -e tesseract | wc -l ) -eq 0 ; then
        break
    fi
    echo "sleep..."
    sleep 1
done
