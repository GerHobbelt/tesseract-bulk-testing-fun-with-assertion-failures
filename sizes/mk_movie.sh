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
#   find B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/ -name '*.tif' | ./mk_movie.sh
#

# quick hack: latest full-featured ffmpeg is here on my box:
FFMPEG='/c/Program Files/ShareX/ffmpeg.exe'

# imagemagick is on the PATH, so that's OK.

echo "$@"

rm -f tmp-files-list
while IFS= read -r line; do
  printf '%s\n' "$line"       >> tmp-files-list
done

mkdir movie
node ./sort-files-list.js tmp-files-list > tmp-files-list-process.sh 

# ./tmp-files-list-process.sh 

# "${FFMPEG}" -h full   > ffmpeg.help.txt

rm movie.mp4
"${FFMPEG}"  -i movie/ffmpeg-input-list.txt   -c:v libx265 -c:a copy -shortest -r 24 -pix_fmt yuv420p movie.mp4


# mkdir -p black
# mogrify -path black -thumbnail 640x480 -background black -gravity center -extent 640x480 png/*.png
# "${FFMPEG}" -framerate 1 -pattern_type glob -i 'black/*.png' -c:v libx264 -c:a copy -shortest -r 30 -pix_fmt yuv420p black.mp4


# magick \
#	example.png -set option:wxh "%wx%h" \
#	( -size "%[wxh]" tile:pattern:checkerboard -brightness-contrast 40,10 ) \
#	+swap -compose over -composite \
#	-thumbnail 340x -quality 80 -filter Lanczos example_tn.jpg


