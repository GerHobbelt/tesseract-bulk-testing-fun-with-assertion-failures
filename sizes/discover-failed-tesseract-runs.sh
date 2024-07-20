#! /bin/bash
#
# As we use a timeout of 3 minutes, anything that takes more than about 2.5 minutes wall-clock time is suspect.
#

# find -type f -name '*debug-2.log' | xargs -n 100 grep -i -e 'assert failed' -l | xargs -n 10 rm

find -type f -name '*-debug-2.log' | xargs -n 10 grep -i -e 'assert failed' -l | sed -E -e 's/^.*RUN_data-//' -e 's/-debug-2.log//' > failed-tesseract-runs.list.tmp
find -type f -name '*-debug-2.log' | xargs -n 10 grep -e 'Error during processing' -l  | sed -E -e 's/^.*RUN_data-//' -e 's/-debug-2.log//' >> failed-tesseract-runs.list.tmp
# 'Leptonica Error in'...

cat failed-tesseract-runs.list.tmp | sort | uniq > failed-tesseract-runs.list

# these reported errors, not necessarily fatal failures:
find -type f -name '*-debug-2.log' | xargs -n 10 grep -i -e 'ERROR' -l  | sed -E -e 's/^.*RUN_data-//' -e 's/-debug-2.log//' >> errored-tesseract-runs.list

# it is a pretty sure indication that something went horribly wrong when the intermediate images have not been produced:
#
# for vanilla, that is the XYZ-processed.tif, for ourselves that's the HTML file plus a multitude of webp files.

rm misc-fatalities-tesseract-runs.list
for d in vanilla-output A_RUN_data-* A_RUN_data-* ; do
	for f in $( find $d   -type f -name '*-debug-2.log' | sed -E -e 's/-debug-2.log//' ) ; do
		if ! test -f $f*.processed.tif || ! test -f $f*.processed.tif ; then
			echo $f >>  misc-fatalities-tesseract-runs.list
		fi
	done
done
