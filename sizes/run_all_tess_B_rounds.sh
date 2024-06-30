#! /bin/bash
#
#
#

for f in 1* ; do 
	./run_tess_B-round.sh $f   $@
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
