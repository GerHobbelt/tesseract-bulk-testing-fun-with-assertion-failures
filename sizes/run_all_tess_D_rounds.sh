#! /bin/bash
#
#
#

for f in 1* ; do 
	./run_tess_D-round.sh $f   $@
done


# wait for the last dregs to completely finish, before we call it The End...

echo "Waiting for the last tesseract runs to finish..."

# wait a little while as otherwise `ps ax` won't see the last tesseract command that was pushed into the background above.
# while this observation delay doesn't really matter all that much in the loop above, it does now!
sleep 0.25

while true ; do
    if test $( ps ax | grep -e tesseract | wc -l ) -eq 0 ; then
        break
    fi
    echo "sleep..."
    sleep 1
done
