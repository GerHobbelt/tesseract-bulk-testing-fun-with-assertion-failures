#! /bin/bash
#
# turn each image's test run (and the threshold image sequence produced by tesseract) into a movie-type file for posting/reporting/visualization of gradual(?) changes.
#

for f in B_RUN_data-1*/ ; do 
	echo "$f" 
	( find $f/tessdata/OEM3/ -name 'PSM1-*.tif' | $( dirname $0 )/mk_movie.sh )
done
