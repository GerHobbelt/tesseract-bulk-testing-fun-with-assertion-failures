#! /bin/bash
#
# Run as (example):
#
#     ./run_tess_rounds.sh 
#
# to process all image files with names '1*.png' in the current directory.
#

TESS=/c/Program\ Files/Tesseract-OCR/tesseract.exe



rm -rf  RUN_data
mkdir   RUN_data
pushd   RUN_data


#for DATADIR in tessdata tessdata_fast tessdata_best ; do
#   for PSM in 0 1 3 4 5 6 7 8 9 10 11 12 13 ; do
#       for OEM in 0 1 2 3 ; do
#           for THRESH in 0 1 2 ; do
for IMG in ../1*.png ../SRCIMG-F-*/*.png ; do
	# get the basename sans extension:
	SRCNAME=$( basename "$IMG" .png )
	echo "IMG:     ${IMG}"
	echo "SRCNAME: ${SRCNAME}"
    for DATADIR in tessdata tessdata_fast tessdata_best ; do
        mkdir ${DATADIR}
        pushd ${DATADIR}
        for OEM in       3 ; do
            mkdir OEM${OEM}
            pushd OEM${OEM}
            REDUCE=0
            for PSM in  6     1 3 11 13 ; do
                for THRESH in   0   ; do
                    if ! ( test -f ./PSM${PSM}-TH${THRESH}-${SRCNAME}-cmdline.sh  &&  test -f ./PSM${PSM}-TH${THRESH}-${SRCNAME}-debug-2.log ) ; then
                        REDUCE=1
                        cat > ./PSM${PSM}-TH${THRESH}-${SRCNAME}-cmdline.sh  <<EOT
if ! test -f ./PSM${PSM}-TH${THRESH}-${SRCNAME}-debug-2.log ; then
(
    # sometimes a tesseract run hangs; haven't found a decent clue why, so we apply a fixed timeout/abort to keep the run going, no matter what happens.
    (  time timeout -v -k 1s 3m   "${TESS}"  --loglevel ALL -l eng --psm ${PSM} --oem ${OEM} --tessdata-dir ../../../../${DATADIR} -c debug_file=PSM${PSM}-TH${THRESH}-${SRCNAME}-debug.log -c thresholding_method=${THRESH} -c document_title=${DATADIR}-PSM${PSM}-OEM${OEM}-TH${THRESH}-${SRCNAME}  ../../${IMG} PSM${PSM}-TH${THRESH}-${SRCNAME}  hocr     txt tsv  ../../../tess_run_01.conf )    > ./PSM${PSM}-TH${THRESH}-${SRCNAME}-debug-1.log   2> ./PSM${PSM}-TH${THRESH}-${SRCNAME}-debug-2.log
) &
fi
EOT
                        cat ./PSM${PSM}-TH${THRESH}-${SRCNAME}-cmdline.sh
                        ./PSM${PSM}-TH${THRESH}-${SRCNAME}-cmdline.sh
                    fi
                done
            done

            if test ${REDUCE} != 0 ; then
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
                    if test $( ps ax | grep -e tesseract | wc -l ) -le 12 ; then
                        break
                    fi
                    echo "sleep..."
                    sleep 1
                done

                echo "Reducing log files to reasonable size; only keeping their tails..."
                for f in $( find . -name '*.log' -type f -mmin +15 -size +1M -print ) ; do
                    if test -f $f ; then
                        tail -n  8000 $f > $f.8Klines-reduced
                        rm $f
                    fi
                done
            fi

            popd
        done
        popd
    done
done

# wait for the last dregs to completely finish, before we call it The End...

echo "Waiting for the tesseract runs to finish..."
while true ; do
    if test $( ps ax | grep -e tesseract | wc -l ) -eq 0 ; then
        break
    fi
    echo "sleep..."
    sleep 1
done

# rm DERIVSRC-*

popd
