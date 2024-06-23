#! /bin/bash
#
# Run as (example):
#
#     for f in 1* ; do ./run_tess_B-round.sh $f ; done ;    for f in 1021* 1022* 1030* 1038* ; do ./run_tess_round.sh $f ; done
#
# to process all image files with names '1*.webp/jpg/etc.' in the current directory.
#

TESS=/c/Program\ Files/Tesseract-OCR/tesseract.exe


# get the basename sans extension:
SRCNAME=$( echo "$1" | sed -E -e 's/[.][^.]+$//' )
SRC=$1

echo "SRCNAME: ${SRCNAME}"
echo "SRC: ${SRC}"

if ! test -f ./${SRC} ; then
    echo "Script does not see file './${SRC}' -- it doesn't seem to exist.  :-S"
    echo "!!!Skipping!!!"
    exit 1
fi

#rm -rf B_RUN_data-$SRCNAME
mkdir  B_RUN_data-$SRCNAME
pushd  B_RUN_data-$SRCNAME

magick identify -ping -format '%w %h DPI:%x/%y\n\n' ../${SRC} | tee srcimg-${SRCNAME}.dims.txt
magick identify -verbose -moments ../${SRC}                  | tee srcimg-${SRCNAME}.dim-details.txt
node ../gen-scaled-imgs-run.js $( cat srcimg-${SRCNAME}.dims.txt ) ../${SRC} ${SRCNAME} | tee ./gen-scaled-imgs-run.sh

./gen-scaled-imgs-run.sh

echo "Waiting for the imagemagick conversions to finish..."
while true ; do
    if test $( ps ax | grep -w magick | wc -l ) -eq 0 ; then
        break
    fi
    echo "sleep..."
    sleep 1
done

#for DATADIR in tessdata tessdata_fast tessdata_best ; do
#   for PSM in 0 1 3 4 5 6 7 8 9 10 11 12 13 ; do
#       for OEM in 0 1 2 3 ; do
#           for THRESH in 0 1 2 ; do
for IMG in DERIVSRC-* ; do
    SIZE=$( echo "${IMG}" | sed -E -e 's/^.*([RDU]SIZE-)/\1/' -e 's/[.][^.]+$//' )
    echo "SIZE=${SIZE}"
    for DATADIR in tessdata tessdata_fast tessdata_best ; do
        mkdir ${DATADIR}
        pushd ${DATADIR}
        for OEM in       3 ; do
            mkdir OEM${OEM}
            pushd OEM${OEM}
            for PSM in  6     1 3 11 13 ; do
                for THRESH in 1 0 2 ; do
                    cat > PSM${PSM}-TH${THRESH}-${SIZE}-cmdline.sh  <<EOT
if ! test -f PSM${PSM}-TH${THRESH}-${SIZE}-debug-2.log ; then
(
	# sometimes a tesseract run hangs; haven't found a decent clue why, so we apply a fixed timeout/abort to keep the run going, no matter what happens.
	(  time timeout -v -k 1s 3m   "${TESS}"  --loglevel ALL -l eng --psm ${PSM} --oem ${OEM} --tessdata-dir ../../../../${DATADIR} -c debug_file=PSM${PSM}-TH${THRESH}-${SIZE}-debug.log -c thresholding_method=${THRESH} -c document_title=${DATADIR}-PSM${PSM}-OEM${OEM}-TH${THRESH}-${SRCNAME}  ../../${IMG} PSM${PSM}-TH${THRESH}-${SIZE}  hocr     txt tsv  ../../../tess_run_01.conf )    > PSM${PSM}-TH${THRESH}-${SIZE}-debug-1.log   2> PSM${PSM}-TH${THRESH}-${SIZE}-debug-2.log
) &
fi
EOT
                    cat ./PSM${PSM}-TH${THRESH}-${SIZE}-cmdline.sh
                    ./PSM${PSM}-TH${THRESH}-${SIZE}-cmdline.sh
                done
            done

            cat <<EOT


######################################################################################
#
# WARNING NOTICE:
#
# On MS Windows DO DISABLE / TURN OFF "Real Time Protection" in Defender to
# /significantly/ speed up these tesseract test runs on your machine!
#
# (MsMpEngCP.exe -- which is Defender at work) burned over 25% of total CPU power
# (all cores!) during long periods of time for every batch of tesseract invocations
# executed below, so the performance hit, compared to Defender TURNED OFF, was
# /immediately noticable and remarkable/ on our test hardware (AMD Ryzen, 16 core, 128GB)
#
# Tip: it might help to install DefenderUI (available at github) to assist with this
# and monitor the Defender operational status while you run tests like these.
#
######################################################################################


EOT

            echo "Waiting for the tesseract runs to finish..."
            while true ; do
                if test $( ps ax | grep -e tesseract | wc -l ) -eq 0 ; then
                    break
                fi
                echo "sleep..."
                sleep 1
            done

            echo "Reducing log files to reasonable size; only keeping their tails..."
            for f in $( find . -name '*.log' -type f -size +1M -print ) ; do
                if test -f $f ; then
                    tail -n  8000 $f > $f.8Klines-reduced
                    rm $f
                fi
            done

            rm *.pdf

            popd
        done
        popd
    done
done

# rm DERIVSRC-*

popd
