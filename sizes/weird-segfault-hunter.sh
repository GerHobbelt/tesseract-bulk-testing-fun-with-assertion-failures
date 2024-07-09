#! /bin/bash
#
#

ROUND=0

rm ./weird-segfault-hunted/segfaults-found.grep.lst

for f in * ; do 
	((ROUND=ROUND+1))
	echo "Hunt #${ROUND}..."
	for s in ./weird-segfault-hunted/*.sh ; do
		$s   $@
	done
	
	echo "Waiting for the last tesseract runs to finish..."
	while true ; do
		if test $( ps ax | grep -e tesseract | wc -l ) -eq 0 ; then
			break
		fi
		echo "sleep..."
		sleep 1
	done
done
echo "Total rounds of hunting: #${ROUND}"
