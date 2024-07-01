#! /bin/bash
#
#
#

for f in                                                                                                        \
        1203* 1127*                                                                                             \
        1141* 1145* 1146* 1158* 1162* 1169* 1174* 1206* 1205* 1165*                                             \
        1183* 1188* 1192*                                                                                       \
        1021* 1022* 1030* 1038* 1178* 1174* 1158* 1141* 1145* 1127* 1075* 1183* 1199* 1198* 1185* 1188* 1159*   \
; do
    ./run_tess_round.sh $f   $@
	exit 1
	
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
