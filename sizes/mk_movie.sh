#! /bin/bash
#
# turn an image sequence into a movie-type file for posting/reporting/visualization of gradual(?) changes.
#
# This script also makes sure all images are the same size.
#
#
#
# Example run:
#
#   find B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/ -name 'PSM[1,3]-*.tif' | ./mk_movie.sh
#

# quick hack: latest full-featured ffmpeg is here on my box:
FFMPEG='/d/ffmpeg-master-latest-win64-gpl/bin/ffmpeg.exe'

# imagemagick is on the PATH, so that's OK.

echo "$@"

rm -f tmp-files-list
while IFS= read -r line; do
  printf '%s\n' "$line"       >> tmp-files-list
done

echo ">>> Processing $( wc -l tmp-files-list ) images into an animated movie for inspection."

mkdir movie
rm -f movie/*.png
#node ./sort-files-list.js tmp-files-list 
node ./sort-files-list.js tmp-files-list > tmp-files-list-process.sh 
./tmp-files-list-process.sh

# "${FFMPEG}" -h full   > ffmpeg.help.txt

# https://superuser.com/questions/1337972/ffmpeg-becomes-super-slow-when-using-duration-instead-of-r/1337998#1337998
# concat is fixed at 25 fps it seems...
# https://trac.ffmpeg.org/wiki/Encode/H.265
rm -f movie.mp4
# "${FFMPEG}"  -i movie/ffmpeg-input-list.txt  -vf fps=24,showinfo   -c:v libx265 -shortest -r 24 -an -x265-params crf=24 -pix_fmt yuv420p movie.mp4
"${FFMPEG}"  -i movie/ffmpeg-input-list.txt  -vf fps=12   -c:v libx265 -shortest -r 12 -an -x265-params crf=28  -tag:v hvc1  movie.mp4

if test -f movie/image-name.txt ; then
	mv movie.mp4  $( cat movie/image-name.txt | tr -d '\r\n' )_movie.mp4
fi

# mkdir -p black
# mogrify -path black -thumbnail 640x480 -background black -gravity center -extent 640x480 png/*.png
# "${FFMPEG}" -framerate 1 -pattern_type glob -i 'black/*.png' -c:v libx264 -c:a copy -shortest -r 30 -pix_fmt yuv420p black.mp4


# magick \
#	example.png -set option:wxh "%wx%h" \
#	( -size "%[wxh]" tile:pattern:checkerboard -brightness-contrast 40,10 ) \
#	+swap -compose over -composite \
#	-thumbnail 340x -quality 80 -filter Lanczos example_tn.jpg

# ffmpeg -y -i input -c:v libx265 -b:v 2600k -x265-params pass=1 -an -f null /dev/null 
# ffmpeg -i input -c:v libx265 -b:v 2600k -x265-params pass=2 -c:a aac -b:a 128k output.mp4
