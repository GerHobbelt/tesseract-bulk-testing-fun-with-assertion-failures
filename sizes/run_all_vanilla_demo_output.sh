#! /bin/bash
#
# --loglevel ALL -l eng --psm 1 --oem 3 --tessdata-dir E:\ocr/tessdata_best -c debug_file=debug.log -c thresholding_method=0 -c document_title=tessdata_best    E:\ocr\sizes/1016-000-0006-a2-raw-webp-92pct.webp               MSVC-debugging    hocr     txt tsv  debug-all    E:\ocr\borders/tess_run_01.conf
#

TESS=/c/Program\ Files/Tesseract-OCR/tesseract.exe

DATADIR=tessdata 

#rm -rf vanilla-output
mkdir vanilla-output

REDUCE=0
for f in 1* ; do 

	# get the basename sans extension:
	SRCNAME=$( echo "$f" | sed -E -e 's/[.][^.]+$//' )
	SRC=$f

	echo "SRCNAME: ${SRCNAME}"
	echo "SRC: ${SRC}"

	if ! test -f ./vanilla-output/${SRC}-vanilla-debug-2.log || test "$2" = "-f" ; then
		((REDUCE=REDUCE+1))
        cat > ./vanilla-output/${SRC}-cmdline.sh  <<EOT
#! /bin/bash
pushd \$( dirname \$0 )                                                       > /dev/null
if ! test -f ./${SRC}-vanilla-debug-2.log || test "\$1" = "-f" ; then
(
    shift
    # sometimes a tesseract run hangs; haven't found a decent clue why, so we apply a fixed timeout/abort to keep the run going, no matter what happens.
    ( set -x ; echo "PWD: \$( pwd )" ;  time timeout -v -k 1s 3m   "${TESS}"  --loglevel ALL -l eng --psm 1 --oem 3 --tessdata-dir ../../${DATADIR} -c debug_file=${SRC}-vanilla-log.log -c thresholding_method=0 -c document_title=${DATADIR}-${SRCNAME}  ../${SRC}  ${SRC}-vanilla-log  hocr     \$@     txt tsv  ../tess_run_01.conf )    > ./${SRC}-vanilla-debug-1.log   2> ./${SRC}-vanilla-debug-2.log
) &
fi
popd                                                                         > /dev/null
EOT
		#cat ./vanilla-output/${SRC}-cmdline.sh
		./vanilla-output/${SRC}-cmdline.sh
	fi
	
	if test ${REDUCE} -eq 8 ; then
		REDUCE=0
		echo "Waiting for the tesseract runs to finish..."
		while true ; do
			if test $( ps ax | grep -e tesseract | wc -l ) -le 8 ; then
				break
			fi
			CPU=$( wmic cpu get loadpercentage | grep -E '[0-9]' )
			if test -n $CPU && test $CPU -lt 80 ; then
				break
			fi
			echo "sleep... (CPU load: $CPU)"
			sleep 1
		done
	fi
done


# wait for the last dregs to completely finish, before we call it The End...

# wait a little while as otherwise `ps ax` won't see the last tesseract command that was pushed into the background above.
# while this observation delay doesn't really matter all that much in the loop above, it does now!
sleep 0.25

echo "Waiting for the last tesseract runs to finish..."
while true ; do
    if test $( ps ax | grep -e tesseract | wc -l ) -eq 0 ; then
        break
    fi
    echo "sleep..."
    sleep 1
done
