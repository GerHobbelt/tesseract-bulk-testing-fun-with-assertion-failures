#! /bin/bash
#
# produce the thresholds analysis movies (as made by mk_movie.sh) for each of the B-RUN tests / source images.
#


# before we go and produce every 'missing' == 'not yet produced' movie, we first go and NUKE every tiny movie file 
# as those can only have been produced previously when a fault occurred or we were simply running this command
# in parallel with the actual tests and the movie-maker overran the batch test, thus looking at test result directories
# which don't carry a sensible, possibly complete set of tesseract diagnostic images already: we SHOULD redo 
# those botched movies.

find ./ -maxdepth 1 -type f -name 'B_RUN_data-*.mp4' -size -1M -delete -print

for f in B_RUN_data-*/ ; do 
	echo "$f"  
	( find "$f/tessdata/OEM3/" -name 'PSM1-*.tif' | ./mk_movie.sh ) 
done
