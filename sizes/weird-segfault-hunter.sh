#! /bin/bash
#
#

ROUND=0

rm ./weird-segfault-hunted/segfaults-found.grep.lst
rm ./weird-segfault-hunted/*.log
rm ./weird-segfault-hunted/*.webp
rm ./weird-segfault-hunted/*.html
rm ./weird-segfault-hunted/*.hocr
rm ./weird-segfault-hunted/*.tsv
rm ./weird-segfault-hunted/*.txt
rm ./weird-segfault-hunted/*.unlv


for f in * ; do 
	((ROUND=ROUND+1))
	echo "Hunt #${ROUND}..."
	for s in ./weird-segfault-hunted/*.sh ; do
		$s   $@
	done
	
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
	# exit 1
done
echo "Total rounds of hunting: #${ROUND}"
