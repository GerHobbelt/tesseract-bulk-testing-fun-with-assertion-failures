//
// process a series of image file paths and produce a imagemagick command processing sequence so we end up with an image set ready for movie-making...
//

const fs = require("fs");
const path = require("path");

console.log(`#! /bin/bash

set -v

cat > movie/ffmpeg-input-list.txt   <<EOT
ffconcat version 1.0

EOT


`);

//console.log({argv: process.argv });

let src = fs.readFileSync(process.argv[2], "utf8");

let a = src.split('\n')
.filter(function (line) {
    return line.length > 0;
});

let re = /^(.*)\/tess([^/]*)\/OEM([^/]*)\/PSM(.*?)-([A-Z]*)SIZE-([^x]+)x([^.-]+)[.-]/;

function strcmp(nameA, nameB) {
  if (nameA < nameB) {
    return -1;
  }
  if (nameA > nameB) {
    return 1;
  }

  // names must be equal
  return 0;
}

a.sort(function (a, b) {
  let am = re.exec(a);
  let bm = re.exec(b);

  //console.log({ am, bm });

  let rv = strcmp(am[1], bm[1]);
  //console.log({ rv });
  if (rv === 0)
    rv = strcmp(am[2], bm[2]);
  //console.log({ rv });
  if (rv === 0)
    rv = Math.sign(0 + am[3] - bm[3]);
  //console.log({ rv });
  if (rv === 0)
    rv = Math.sign(0 + am[4] - bm[4]);
  //console.log({ rv });
  if (rv === 0)
    rv = strcmp(am[5], bm[5]);
  //console.log({ rv });
  if (rv === 0)
    rv = Math.sign(0 + am[6] - bm[6]);
  //console.log({ rv });
  if (rv === 0)
    rv = Math.sign(0 + am[7] - bm[7]);
  //console.log({ rv });
  return rv;
});

//console.log({a});



      console.log(`
# produce background image for all:

magick -size 30x54 pattern:hexagons           -fill tomato     -opaque white           -fill dodgerblue -draw 'color 10,10 floodfill'           -fill limegreen  -draw 'color 10,25 floodfill'           -roll +15+27           -fill dodgerblue -draw 'color 10,10 floodfill'           -fill limegreen  -draw 'color 10,25 floodfill'   miff:- |    magick -size 1000x1000 tile:-  miff:- |  magick -     -background lightgrey   -resize '3840x2160^'  -gravity center -extent 3840x2160   movie/solid-background.png

# composite the pattern over a lightgrey base paint to form the desired final background image
magick movie/solid-background.png    -channel A +level 0,15%   -background lightgrey   -alpha background    \\( +clone -background lightgrey  -alpha remove \\)  -compose Over -composite   movie/background.png




        `);


let old_m = {};
let n = 1000000;
let task_n = n;
let image = null;
let base = null;
let oem = null;
let style = null;
let size = null;


a.map(function (line) {
  let m = re.exec(line);

  if (m[1] != old_m[1]) {
      image = m[1];
      let srcimg = image.replace(/B_RUN_data-/, '').replace(/^data-/, '');
      console.log("# new image header:", image);
      console.log(`
magick  -background transparent -fill black -font Liberation-Sans -pointsize 120  -fill black -stroke '#FFFFFF80' -strokewidth 10  -gravity center      label:'Source image:\\n\\n${image}'   \\( +clone -channel RGB -opaque black -fill white   -channel RGBA  -blur 0x20 \\)   -compose dst-over -composite    -extent 3840x2160  miff:-  |  magick composite -gravity center -  movie/background.png   movie/image.png
cp movie/image.png  movie/${n++}.png

cat >> movie/ffmpeg-input-list.txt   <<EOT
file   ${n - 1}.png
duration  1.5

EOT



# find original image: ${srcimg}
for f in $( find ./ -maxdepth 1 -type f -name '${srcimg}*' ) ; do
    echo "--> $f"

    (
    magick $f  -background transparent -gravity center   -resize 3840x2160           -extent 3840x2160   miff:-  |  magick composite -gravity center -  movie/background.png  movie/${n++}.png
    ) &

    magick   $f  -background transparent  -gravity NorthWest -resize 500x500  -bordercolor black -border 5  -extent 3840x2160   png32:movie/pip.png

    cat >> movie/ffmpeg-input-list.txt   <<EOT
file   ${n - 1}.png
duration  1.5

EOT

done


        `);
  }
  if (m[2] != old_m[2]) {
      base = "tess" + m[2];
      console.log("# new tessdata BASE header:", base);
      console.log(`
magick  -background transparent -fill black -font Liberation-Sans -pointsize 120  -fill black -stroke '#FFFFFF80' -strokewidth 10  -gravity center      label:'Tesseract model set:\\n\\n${base}'   \\( +clone -channel RGB -opaque black -fill white   -channel RGBA  -blur 0x20 \\)   -compose dst-over -composite    -extent 3840x2160  miff:-  |  magick composite -gravity center -  movie/background.png   movie/base.png
cp movie/base.png  movie/${n++}.png

cat >> movie/ffmpeg-input-list.txt   <<EOT
file   ${n - 1}.png
duration  1.5

EOT
        `);
  }
  if (m[3] != old_m[3]) {
      oem = "OEM" + m[3];
      console.log("# new OEM header:", oem);
      console.log(`
magick  -background transparent -fill black -font Liberation-Sans -pointsize 120  -fill black -stroke '#FFFFFF80' -strokewidth 10  -gravity center      label:'OCR Engine mode:\\n\\n${oem}'   \\( +clone -channel RGB -opaque black -fill white   -channel RGBA  -blur 0x20 \\)   -compose dst-over -composite    -extent 3840x2160  miff:-  |  magick composite -gravity center -  movie/background.png   movie/oem.png
cp movie/oem.png  movie/${n++}.png

cat >> movie/ffmpeg-input-list.txt   <<EOT
file   ${n - 1}.png
duration  1.5

EOT
        `);
  }
  if (m[4] != old_m[4]) {
      style = ("PSM" + m[4]).replace(/-TH/, ", threshold mode ");
      console.log("# new STYLE header:", style);
      console.log(`
magick  -background transparent -fill black -font Liberation-Sans -pointsize 120  -fill black -stroke '#FFFFFF80' -strokewidth 10  -gravity center      label:'Style:\\n(Page Segmentation Mode + ...)\\n\\n${style}'   \\( +clone -channel RGB -opaque black -fill white   -channel RGBA  -blur 0x20 \\)   -compose dst-over -composite    -extent 3840x2160  miff:-  |  magick composite -gravity center -  movie/background.png   movie/style.png
cp movie/style.png  movie/${n++}.png

cat >> movie/ffmpeg-input-list.txt   <<EOT
file   ${n - 1}.png
duration  2

EOT
        `);
  }
  if (m[7] != old_m[7]) {
      size = m[7];
      console.log("# new SIZE overlay:", size);
  console.log(`
magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'${image} | ${base} | ${oem} | ${style} | height: ${size}px'     -extent 3740x50 -splice 100x0   movie/size.png
        `);
  }
  console.log("# ", line);
  console.log(`
magick ${line}  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/${n++}.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   ${n - 1}.png
duration  0.66

EOT

        `);

  if (task_n + 16 <= n) {
//    console.log(`
//
//
// echo "Waiting for the ImageMagick runs to finish..."
// while true ; do
//  if test $( ps ax | grep -e magick | wc -l ) -eq 0 ; then
//      break
//  fi
//  echo "sleep..."
//  sleep 1
// done
//
//
//    `);
    task_n = n;
  }

  old_m = m;
  return line;
});


// ... and make sure ALL magick runs have completed before we declare this endeavour finished:
//console.log(`
//
//
//echo "Waiting for the ImageMagick runs to finish..."
//while true ; do
//    if test $( ps ax | grep -e magick | wc -l ) -eq 0 ; then
//        break
//    fi
//    echo "sleep..."
//    sleep 1
//done
//
//
//`);



// magick -background lightgrey -fill black -font LiberationMono -pointsize 48 \
//          -gravity center    label:'ImageMagick\nExamples\nby Anthony' \
//          label_centered.gif

// 3840 × 2160
