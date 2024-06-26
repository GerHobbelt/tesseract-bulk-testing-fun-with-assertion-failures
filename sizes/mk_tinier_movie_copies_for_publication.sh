#! /bin/bash
#
# Take each MP4 in the directory and produce a (H265) 1080p and 720p version of it in the H265-1080p/ and H265-720p/ directories, which should be relatively small files, ready for distribution.
#


# quick hack: latest full-featured ffmpeg is here on my box:
FFMPEG='/d/ffmpeg-master-latest-win64-gpl/bin/ffmpeg.exe'


mkdir H265-1080p
mkdir H265-720p


# before we go and produce every 'missing' == 'not yet produced' movie, we first go and NUKE every tiny movie file 
# as those can only have been produced previously when a fault occurred or we were simply running this command
# in parallel with the actual tests and the movie-maker overran the batch test, thus looking at test result directories
# which don't carry a sensible, possibly complete set of tesseract diagnostic images already: we SHOULD redo 
# those botched movies.

find ./H265-1080p -maxdepth 1 -type f -name '*.mp4' -size -10k -delete -print
find ./H265-720p  -maxdepth 1 -type f -name '*.mp4' -size -10k -delete -print



for f in $( find ./ -maxdepth 1 -type f -name '*.mp4' ) ; do
	g=$( echo "$f" | sed -E -e 's#^./##' )
	echo "INPUT: $f --> H265-720p/$g"
	
	if ! test -f "H265-720p/$g" ; then
		${FFMPEG}  -i "$f"   -vf "scale=-2:720:flags=lanczos+accurate_rnd" -c:v libx265   -x265-params "aq-mode=3" -crf 29   -preset slower   -tag:v hvc1  -sws_flags lanczos    "H265-720p/$g"
		# If it's too sharp or is causing ringing, replace lanczos+accurate_rnd with bicubic+accurate_rnd:param0=1/3:param1=1/3.
		# For AMD GPUs, use -c:v hevc_amf if you want hardware acceleration.
	fi
	exit 1
	
done
