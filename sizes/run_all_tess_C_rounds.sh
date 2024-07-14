#! /bin/bash
#
#
#

for f in                                                                                                        \
        1207* 1203* 1127*                                                                                       \
        1141* 1145* 1146* 1158* 1162* 1169* 1174* 1206* 1205* 1165*                                             \
        1183* 1188* 1192*                                                                                       \
        1021* 1022* 1030* 1038* 1178* 1174* 1158* 1141* 1145* 1127* 1075* 1183* 1199* 1198* 1185* 1188* 1159*   \
; do
    ./run_tess_C-round.sh $f   $@
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
