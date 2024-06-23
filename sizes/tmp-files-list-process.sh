#! /bin/bash

set -v

cat > movie/ffmpeg-input-list.txt   <<EOT
ffconcat version 1.0

EOT




# produce background image for all:

magick -size 30x54 pattern:hexagons           -fill tomato     -opaque white           -fill dodgerblue -draw 'color 10,10 floodfill'           -fill limegreen  -draw 'color 10,25 floodfill'           -roll +15+27           -fill dodgerblue -draw 'color 10,10 floodfill'           -fill limegreen  -draw 'color 10,25 floodfill'   miff:- |    magick -size 1000x1000 tile:-  miff:- |  magick -     -background lightgrey   -resize '3840x2160^'  -gravity center -extent 3840x2160   movie/solid-background.png

# composite the pattern over a lightgrey base paint to form the desired final background image
magick movie/solid-background.png    -channel A +level 0,15%   -background lightgrey   -alpha background    \( +clone -background lightgrey  -alpha remove \)  -compose Over -composite   movie/background.png




        
# new image header: B_RUN_data-1001-000-0003-b-leveled

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120  -fill black -stroke '#FFFFFF80' -strokewidth 10  -gravity center      label:'Source image:\n\nB_RUN_data-1001-000-0003-b-leveled'   \( +clone -channel RGB -opaque black -fill white   -channel RGBA  -blur 0x20 \)   -compose dst-over -composite    -extent 3840x2160  miff:-  |  magick composite -gravity center -  movie/background.png   movie/image.png
cp movie/image.png  movie/1000000.png

cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000000.png
duration  1.5

EOT



# find original image: 1001-000-0003-b-leveled
for f in $( find ./ -maxdepth 1 -type f -name '1001-000-0003-b-leveled*' ) ; do
    echo "--> $f"

    (
    magick $f  -background transparent -gravity center   -resize 3840x2160           -extent 3840x2160   miff:-  |  magick composite -gravity center -  movie/background.png  movie/1000001.png
    ) &

    magick   $f  -background transparent  -gravity NorthWest -resize 500x500  -bordercolor black -border 5  -extent 3840x2160   png32:movie/pip.png

    cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000001.png
duration  1.5

EOT

done


        
# new tessdata BASE header: tessdata

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120  -fill black -stroke '#FFFFFF80' -strokewidth 10  -gravity center      label:'Tesseract model set:\n\ntessdata'   \( +clone -channel RGB -opaque black -fill white   -channel RGBA  -blur 0x20 \)   -compose dst-over -composite    -extent 3840x2160  miff:-  |  magick composite -gravity center -  movie/background.png   movie/base.png
cp movie/base.png  movie/1000002.png

cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000002.png
duration  1.5

EOT
        
# new OEM header: OEM3

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120  -fill black -stroke '#FFFFFF80' -strokewidth 10  -gravity center      label:'OCR Engine mode:\n\nOEM3'   \( +clone -channel RGB -opaque black -fill white   -channel RGBA  -blur 0x20 \)   -compose dst-over -composite    -extent 3840x2160  miff:-  |  magick composite -gravity center -  movie/background.png   movie/oem.png
cp movie/oem.png  movie/1000003.png

cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000003.png
duration  1.5

EOT
        
# new STYLE header: PSM1, threshold mode 0

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120  -fill black -stroke '#FFFFFF80' -strokewidth 10  -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM1, threshold mode 0'   \( +clone -channel RGB -opaque black -fill white   -channel RGBA  -blur 0x20 \)   -compose dst-over -composite    -extent 3840x2160  miff:-  |  magick composite -gravity center -  movie/background.png   movie/style.png
cp movie/style.png  movie/1000004.png

cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000004.png
duration  2

EOT
        
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000005.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000005.png
duration  0.66

EOT

        
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000006.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000006.png
duration  0.66

EOT

        
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000007.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000007.png
duration  0.66

EOT

        
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000008.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000008.png
duration  0.66

EOT

        
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000009.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000009.png
duration  0.66

EOT

        
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000010.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000010.png
duration  0.66

EOT

        
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000011.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000011.png
duration  0.66

EOT

        
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000012.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000012.png
duration  0.66

EOT

        
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000013.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000013.png
duration  0.66

EOT

        
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000014.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000014.png
duration  0.66

EOT

        
# new SIZE overlay: 798

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 798px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x798.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x798.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000015.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000015.png
duration  0.66

EOT

        
# new SIZE overlay: 841

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 841px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x841.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x841.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000016.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000016.png
duration  0.66

EOT

        
# new SIZE overlay: 886

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 886px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x886.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x886.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000017.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000017.png
duration  0.66

EOT

        
# new SIZE overlay: 933

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 933px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x933.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x933.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000018.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000018.png
duration  0.66

EOT

        
# new SIZE overlay: 983

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 983px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x983.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x983.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000019.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000019.png
duration  0.66

EOT

        
# new SIZE overlay: 1035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 1035px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000020.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000020.png
duration  0.66

EOT

        
# new SIZE overlay: 1090

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 1090px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1090.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1090.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000021.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000021.png
duration  0.66

EOT

        
# new SIZE overlay: 1148

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 1148px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1148.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1148.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000022.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000022.png
duration  0.66

EOT

        
# new SIZE overlay: 1273

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 1273px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1273.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1273.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000023.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000023.png
duration  0.66

EOT

        
# new SIZE overlay: 1411

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 1411px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1411.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1411.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000024.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000024.png
duration  0.66

EOT

        
# new SIZE overlay: 1648

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 1648px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1648.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1648.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000025.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000025.png
duration  0.66

EOT

        
# new SIZE overlay: 2761

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 2761px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x2761.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x2761.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000026.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000026.png
duration  0.66

EOT

        
# new SIZE overlay: 2907

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 2907px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x2907.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x2907.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000027.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000027.png
duration  0.66

EOT

        
# new SIZE overlay: 6117

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 6117px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-USIZE-2700x6117.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-USIZE-2700x6117.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000028.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000028.png
duration  0.66

EOT

        
# new SIZE overlay: 7438

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 7438px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-USIZE-2700x7438.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-USIZE-2700x7438.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000029.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000029.png
duration  0.66

EOT

        
# new SIZE overlay: 14035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 14035px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-USIZE-2700x14035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-USIZE-2700x14035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000030.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000030.png
duration  0.66

EOT

        
# new SIZE overlay: 14737

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 14737px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-USIZE-2700x14737.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-USIZE-2700x14737.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000031.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000031.png
duration  0.66

EOT

        
# new STYLE header: PSM1, threshold mode 1

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120  -fill black -stroke '#FFFFFF80' -strokewidth 10  -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM1, threshold mode 1'   \( +clone -channel RGB -opaque black -fill white   -channel RGBA  -blur 0x20 \)   -compose dst-over -composite    -extent 3840x2160  miff:-  |  magick composite -gravity center -  movie/background.png   movie/style.png
cp movie/style.png  movie/1000032.png

cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000032.png
duration  2

EOT
        
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000033.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000033.png
duration  0.66

EOT

        
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000034.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000034.png
duration  0.66

EOT

        
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000035.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000035.png
duration  0.66

EOT

        
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000036.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000036.png
duration  0.66

EOT

        
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000037.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000037.png
duration  0.66

EOT

        
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000038.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000038.png
duration  0.66

EOT

        
# new SIZE overlay: 616

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 616px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x616.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x616.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000039.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000039.png
duration  0.66

EOT

        
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000040.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000040.png
duration  0.66

EOT

        
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000041.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000041.png
duration  0.66

EOT

        
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000042.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000042.png
duration  0.66

EOT

        
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000043.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000043.png
duration  0.66

EOT

        
# new SIZE overlay: 886

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 886px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x886.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x886.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000044.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000044.png
duration  0.66

EOT

        
# new SIZE overlay: 1035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 1035px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x1035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x1035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000045.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000045.png
duration  0.66

EOT

        
# new SIZE overlay: 1209

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 1209px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x1209.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x1209.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000046.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000046.png
duration  0.66

EOT

        
# new STYLE header: PSM1, threshold mode 2

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120  -fill black -stroke '#FFFFFF80' -strokewidth 10  -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM1, threshold mode 2'   \( +clone -channel RGB -opaque black -fill white   -channel RGBA  -blur 0x20 \)   -compose dst-over -composite    -extent 3840x2160  miff:-  |  magick composite -gravity center -  movie/background.png   movie/style.png
cp movie/style.png  movie/1000047.png

cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000047.png
duration  2

EOT
        
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000048.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000048.png
duration  0.66

EOT

        
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000049.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000049.png
duration  0.66

EOT

        
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000050.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000050.png
duration  0.66

EOT

        
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000051.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000051.png
duration  0.66

EOT

        
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000052.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000052.png
duration  0.66

EOT

        
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000053.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000053.png
duration  0.66

EOT

        
# new SIZE overlay: 616

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 616px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x616.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x616.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000054.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000054.png
duration  0.66

EOT

        
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000055.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000055.png
duration  0.66

EOT

        
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000056.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000056.png
duration  0.66

EOT

        
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000057.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000057.png
duration  0.66

EOT

        
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000058.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000058.png
duration  0.66

EOT

        
# new SIZE overlay: 798

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 798px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x798.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x798.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000059.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000059.png
duration  0.66

EOT

        
# new SIZE overlay: 841

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 841px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x841.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x841.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000060.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000060.png
duration  0.66

EOT

        
# new SIZE overlay: 886

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 886px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x886.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x886.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000061.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000061.png
duration  0.66

EOT

        
# new SIZE overlay: 933

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 933px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x933.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x933.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000062.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000062.png
duration  0.66

EOT

        
# new SIZE overlay: 983

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 983px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x983.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x983.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000063.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000063.png
duration  0.66

EOT

        
# new SIZE overlay: 1035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 1035px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000064.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000064.png
duration  0.66

EOT

        
# new SIZE overlay: 1090

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 1090px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1090.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1090.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000065.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000065.png
duration  0.66

EOT

        
# new SIZE overlay: 1148

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 1148px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1148.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1148.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000066.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000066.png
duration  0.66

EOT

        
# new SIZE overlay: 1273

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 1273px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1273.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1273.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000067.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000067.png
duration  0.66

EOT

        
# new SIZE overlay: 1340

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 1340px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1340.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1340.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000068.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000068.png
duration  0.66

EOT

        
# new SIZE overlay: 1411

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 1411px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1411.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1411.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000069.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000069.png
duration  0.66

EOT

        
# new SIZE overlay: 1486

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 1486px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1486.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1486.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000070.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000070.png
duration  0.66

EOT

        
# new SIZE overlay: 1565

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 1565px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1565.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1565.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000071.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000071.png
duration  0.66

EOT

        
# new SIZE overlay: 1648

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 1648px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1648.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1648.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000072.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000072.png
duration  0.66

EOT

        
# new SIZE overlay: 1827

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 1827px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1827.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1827.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000073.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000073.png
duration  0.66

EOT

        
# new SIZE overlay: 2026

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 2026px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x2026.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x2026.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000074.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000074.png
duration  0.66

EOT

        
# new SIZE overlay: 2246

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 2246px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x2246.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x2246.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000075.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000075.png
duration  0.66

EOT

        
# new SIZE overlay: 2490

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 2490px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x2490.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x2490.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000076.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000076.png
duration  0.66

EOT

        
# new SIZE overlay: 2622

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 2622px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x2622.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x2622.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000077.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000077.png
duration  0.66

EOT

        
# new SIZE overlay: 3061

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 3061px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x3061.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x3061.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000078.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000078.png
duration  0.66

EOT

        
# new SIZE overlay: 3939

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 3939px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x3939.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x3939.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000079.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000079.png
duration  0.66

EOT

        
# new SIZE overlay: 7438

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 7438px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x7438.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x7438.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000080.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000080.png
duration  0.66

EOT

        
# new SIZE overlay: 8612

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 8612px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x8612.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x8612.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000081.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000081.png
duration  0.66

EOT

        
# new SIZE overlay: 10470

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 10470px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x10470.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x10470.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000082.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000082.png
duration  0.66

EOT

        
# new SIZE overlay: 10994

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 10994px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x10994.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x10994.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000083.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000083.png
duration  0.66

EOT

        
# new SIZE overlay: 11544

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 11544px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x11544.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x11544.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000084.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000084.png
duration  0.66

EOT

        
# new SIZE overlay: 12122

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 12122px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x12122.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x12122.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000085.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000085.png
duration  0.66

EOT

        
# new SIZE overlay: 12729

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 12729px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x12729.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x12729.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000086.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000086.png
duration  0.66

EOT

        
# new SIZE overlay: 13366

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 13366px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x13366.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x13366.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000087.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000087.png
duration  0.66

EOT

        
# new SIZE overlay: 14035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 14035px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x14035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x14035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000088.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000088.png
duration  0.66

EOT

        
# new SIZE overlay: 14737

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 14737px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x14737.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x14737.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000089.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000089.png
duration  0.66

EOT

        
# new SIZE overlay: 15474

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 15474px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x15474.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x15474.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000090.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000090.png
duration  0.66

EOT

        
# new STYLE header: PSM11, threshold mode 0

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120  -fill black -stroke '#FFFFFF80' -strokewidth 10  -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM11, threshold mode 0'   \( +clone -channel RGB -opaque black -fill white   -channel RGBA  -blur 0x20 \)   -compose dst-over -composite    -extent 3840x2160  miff:-  |  magick composite -gravity center -  movie/background.png   movie/style.png
cp movie/style.png  movie/1000091.png

cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000091.png
duration  2

EOT
        
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000092.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000092.png
duration  0.66

EOT

        
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000093.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000093.png
duration  0.66

EOT

        
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000094.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000094.png
duration  0.66

EOT

        
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000095.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000095.png
duration  0.66

EOT

        
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000096.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000096.png
duration  0.66

EOT

        
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000097.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000097.png
duration  0.66

EOT

        
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000098.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000098.png
duration  0.66

EOT

        
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000099.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000099.png
duration  0.66

EOT

        
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000100.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000100.png
duration  0.66

EOT

        
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000101.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000101.png
duration  0.66

EOT

        
# new SIZE overlay: 798

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 798px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x798.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x798.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000102.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000102.png
duration  0.66

EOT

        
# new SIZE overlay: 841

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 841px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x841.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x841.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000103.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000103.png
duration  0.66

EOT

        
# new SIZE overlay: 886

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 886px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x886.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x886.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000104.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000104.png
duration  0.66

EOT

        
# new SIZE overlay: 933

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 933px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x933.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x933.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000105.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000105.png
duration  0.66

EOT

        
# new SIZE overlay: 983

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 983px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x983.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x983.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000106.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000106.png
duration  0.66

EOT

        
# new SIZE overlay: 1035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1035px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000107.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000107.png
duration  0.66

EOT

        
# new SIZE overlay: 1090

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1090px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1090.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1090.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000108.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000108.png
duration  0.66

EOT

        
# new SIZE overlay: 1148

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1148px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1148.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1148.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000109.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000109.png
duration  0.66

EOT

        
# new SIZE overlay: 1209

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1209px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1209.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1209.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000110.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000110.png
duration  0.66

EOT

        
# new SIZE overlay: 1273

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1273px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1273.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1273.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000111.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000111.png
duration  0.66

EOT

        
# new SIZE overlay: 1340

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1340px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1340.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1340.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000112.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000112.png
duration  0.66

EOT

        
# new SIZE overlay: 1411

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1411px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1411.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1411.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000113.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000113.png
duration  0.66

EOT

        
# new SIZE overlay: 1486

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1486px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1486.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1486.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000114.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000114.png
duration  0.66

EOT

        
# new SIZE overlay: 1565

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1565px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1565.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1565.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000115.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000115.png
duration  0.66

EOT

        
# new SIZE overlay: 1648

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1648px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1648.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1648.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000116.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000116.png
duration  0.66

EOT

        
# new SIZE overlay: 1735

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1735px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1735.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1735.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000117.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000117.png
duration  0.66

EOT

        
# new SIZE overlay: 1827

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1827px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1827.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1827.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000118.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000118.png
duration  0.66

EOT

        
# new SIZE overlay: 1924

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1924px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1924.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1924.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000119.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000119.png
duration  0.66

EOT

        
# new SIZE overlay: 2026

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 2026px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2026.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2026.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000120.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000120.png
duration  0.66

EOT

        
# new SIZE overlay: 2133

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 2133px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2133.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2133.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000121.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000121.png
duration  0.66

EOT

        
# new SIZE overlay: 2246

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 2246px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2246.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2246.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000122.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000122.png
duration  0.66

EOT

        
# new SIZE overlay: 2365

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 2365px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2365.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2365.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000123.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000123.png
duration  0.66

EOT

        
# new SIZE overlay: 2490

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 2490px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2490.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2490.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000124.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000124.png
duration  0.66

EOT

        
# new SIZE overlay: 2761

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 2761px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2761.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2761.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000125.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000125.png
duration  0.66

EOT

        
# new SIZE overlay: 2907

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 2907px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2907.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2907.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000126.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000126.png
duration  0.66

EOT

        
# new SIZE overlay: 3061

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 3061px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x3061.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x3061.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000127.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000127.png
duration  0.66

EOT

        
# new SIZE overlay: 3223

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 3223px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x3223.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x3223.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000128.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000128.png
duration  0.66

EOT

        
# new SIZE overlay: 3393

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 3393px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x3393.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x3393.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000129.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000129.png
duration  0.66

EOT

        
# new SIZE overlay: 3751

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 3751px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-USIZE-2700x3751.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-USIZE-2700x3751.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000130.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000130.png
duration  0.66

EOT

        
# new SIZE overlay: 4343

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 4343px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-USIZE-2700x4343.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-USIZE-2700x4343.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000131.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000131.png
duration  0.66

EOT

        
# new SIZE overlay: 7438

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 7438px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-USIZE-2700x7438.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-USIZE-2700x7438.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000132.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000132.png
duration  0.66

EOT

        
# new STYLE header: PSM11, threshold mode 1

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120  -fill black -stroke '#FFFFFF80' -strokewidth 10  -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM11, threshold mode 1'   \( +clone -channel RGB -opaque black -fill white   -channel RGBA  -blur 0x20 \)   -compose dst-over -composite    -extent 3840x2160  miff:-  |  magick composite -gravity center -  movie/background.png   movie/style.png
cp movie/style.png  movie/1000133.png

cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000133.png
duration  2

EOT
        
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 1 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000134.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000134.png
duration  0.66

EOT

        
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 1 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000135.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000135.png
duration  0.66

EOT

        
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 1 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000136.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000136.png
duration  0.66

EOT

        
# new SIZE overlay: 616

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 1 | height: 616px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x616.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x616.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000137.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000137.png
duration  0.66

EOT

        
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 1 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000138.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000138.png
duration  0.66

EOT

        
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 1 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000139.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000139.png
duration  0.66

EOT

        
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 1 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000140.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000140.png
duration  0.66

EOT

        
# new STYLE header: PSM11, threshold mode 2

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120  -fill black -stroke '#FFFFFF80' -strokewidth 10  -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM11, threshold mode 2'   \( +clone -channel RGB -opaque black -fill white   -channel RGBA  -blur 0x20 \)   -compose dst-over -composite    -extent 3840x2160  miff:-  |  magick composite -gravity center -  movie/background.png   movie/style.png
cp movie/style.png  movie/1000141.png

cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000141.png
duration  2

EOT
        
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000142.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000142.png
duration  0.66

EOT

        
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000143.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000143.png
duration  0.66

EOT

        
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000144.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000144.png
duration  0.66

EOT

        
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000145.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000145.png
duration  0.66

EOT

        
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000146.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000146.png
duration  0.66

EOT

        
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000147.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000147.png
duration  0.66

EOT

        
# new SIZE overlay: 616

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 616px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x616.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x616.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000148.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000148.png
duration  0.66

EOT

        
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000149.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000149.png
duration  0.66

EOT

        
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000150.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000150.png
duration  0.66

EOT

        
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000151.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000151.png
duration  0.66

EOT

        
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000152.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000152.png
duration  0.66

EOT

        
# new SIZE overlay: 798

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 798px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x798.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x798.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000153.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000153.png
duration  0.66

EOT

        
# new SIZE overlay: 841

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 841px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x841.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x841.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000154.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000154.png
duration  0.66

EOT

        
# new SIZE overlay: 886

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 886px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x886.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x886.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000155.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000155.png
duration  0.66

EOT

        
# new SIZE overlay: 933

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 933px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x933.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x933.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000156.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000156.png
duration  0.66

EOT

        
# new SIZE overlay: 983

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 983px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x983.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x983.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000157.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000157.png
duration  0.66

EOT

        
# new SIZE overlay: 1035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1035px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000158.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000158.png
duration  0.66

EOT

        
# new SIZE overlay: 1090

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1090px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1090.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1090.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000159.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000159.png
duration  0.66

EOT

        
# new SIZE overlay: 1148

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1148px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1148.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1148.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000160.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000160.png
duration  0.66

EOT

        
# new SIZE overlay: 1209

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1209px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1209.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1209.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000161.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000161.png
duration  0.66

EOT

        
# new SIZE overlay: 1273

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1273px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1273.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1273.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000162.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000162.png
duration  0.66

EOT

        
# new SIZE overlay: 1340

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1340px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1340.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1340.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000163.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000163.png
duration  0.66

EOT

        
# new SIZE overlay: 1411

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1411px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1411.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1411.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000164.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000164.png
duration  0.66

EOT

        
# new SIZE overlay: 1486

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1486px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1486.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1486.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000165.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000165.png
duration  0.66

EOT

        
# new SIZE overlay: 1565

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1565px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1565.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1565.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000166.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000166.png
duration  0.66

EOT

        
# new SIZE overlay: 1648

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1648px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1648.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1648.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000167.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000167.png
duration  0.66

EOT

        
# new SIZE overlay: 1735

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1735px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1735.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1735.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000168.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000168.png
duration  0.66

EOT

        
# new SIZE overlay: 1827

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1827px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1827.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1827.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000169.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000169.png
duration  0.66

EOT

        
# new SIZE overlay: 1924

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1924px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1924.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1924.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000170.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000170.png
duration  0.66

EOT

        
# new SIZE overlay: 2365

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 2365px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x2365.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x2365.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000171.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000171.png
duration  0.66

EOT

        
# new SIZE overlay: 10470

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 10470px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x10470.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x10470.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000172.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000172.png
duration  0.66

EOT

        
# new SIZE overlay: 11544

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 11544px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x11544.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x11544.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000173.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000173.png
duration  0.66

EOT

        
# new SIZE overlay: 12122

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 12122px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x12122.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x12122.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000174.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000174.png
duration  0.66

EOT

        
# new SIZE overlay: 12729

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 12729px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x12729.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x12729.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000175.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000175.png
duration  0.66

EOT

        
# new SIZE overlay: 13366

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 13366px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x13366.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x13366.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000176.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000176.png
duration  0.66

EOT

        
# new SIZE overlay: 14035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 14035px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x14035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x14035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000177.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000177.png
duration  0.66

EOT

        
# new SIZE overlay: 14737

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 14737px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x14737.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x14737.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000178.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000178.png
duration  0.66

EOT

        
# new SIZE overlay: 15474

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 15474px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x15474.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x15474.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000179.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000179.png
duration  0.66

EOT

        
# new STYLE header: PSM13, threshold mode 2

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120  -fill black -stroke '#FFFFFF80' -strokewidth 10  -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM13, threshold mode 2'   \( +clone -channel RGB -opaque black -fill white   -channel RGBA  -blur 0x20 \)   -compose dst-over -composite    -extent 3840x2160  miff:-  |  magick composite -gravity center -  movie/background.png   movie/style.png
cp movie/style.png  movie/1000180.png

cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000180.png
duration  2

EOT
        
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM13, threshold mode 2 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM13-TH2-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM13-TH2-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000181.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000181.png
duration  0.66

EOT

        
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM13, threshold mode 2 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM13-TH2-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM13-TH2-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000182.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000182.png
duration  0.66

EOT

        
# new STYLE header: PSM3, threshold mode 0

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120  -fill black -stroke '#FFFFFF80' -strokewidth 10  -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM3, threshold mode 0'   \( +clone -channel RGB -opaque black -fill white   -channel RGBA  -blur 0x20 \)   -compose dst-over -composite    -extent 3840x2160  miff:-  |  magick composite -gravity center -  movie/background.png   movie/style.png
cp movie/style.png  movie/1000183.png

cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000183.png
duration  2

EOT
        
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000184.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000184.png
duration  0.66

EOT

        
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000185.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000185.png
duration  0.66

EOT

        
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000186.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000186.png
duration  0.66

EOT

        
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000187.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000187.png
duration  0.66

EOT

        
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000188.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000188.png
duration  0.66

EOT

        
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000189.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000189.png
duration  0.66

EOT

        
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000190.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000190.png
duration  0.66

EOT

        
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000191.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000191.png
duration  0.66

EOT

        
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000192.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000192.png
duration  0.66

EOT

        
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000193.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000193.png
duration  0.66

EOT

        
# new SIZE overlay: 798

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 798px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x798.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x798.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000194.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000194.png
duration  0.66

EOT

        
# new SIZE overlay: 841

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 841px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x841.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x841.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000195.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000195.png
duration  0.66

EOT

        
# new SIZE overlay: 886

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 886px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x886.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x886.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000196.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000196.png
duration  0.66

EOT

        
# new SIZE overlay: 933

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 933px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x933.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x933.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000197.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000197.png
duration  0.66

EOT

        
# new SIZE overlay: 983

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 983px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x983.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x983.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000198.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000198.png
duration  0.66

EOT

        
# new SIZE overlay: 1035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 1035px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000199.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000199.png
duration  0.66

EOT

        
# new SIZE overlay: 1090

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 1090px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1090.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1090.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000200.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000200.png
duration  0.66

EOT

        
# new SIZE overlay: 1148

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 1148px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1148.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1148.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000201.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000201.png
duration  0.66

EOT

        
# new SIZE overlay: 1273

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 1273px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1273.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1273.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000202.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000202.png
duration  0.66

EOT

        
# new SIZE overlay: 1411

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 1411px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1411.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1411.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000203.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000203.png
duration  0.66

EOT

        
# new SIZE overlay: 1648

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 1648px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1648.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1648.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000204.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000204.png
duration  0.66

EOT

        
# new SIZE overlay: 2761

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 2761px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x2761.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x2761.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000205.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000205.png
duration  0.66

EOT

        
# new SIZE overlay: 2907

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 2907px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x2907.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x2907.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000206.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000206.png
duration  0.66

EOT

        
# new SIZE overlay: 6117

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 6117px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-USIZE-2700x6117.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-USIZE-2700x6117.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000207.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000207.png
duration  0.66

EOT

        
# new SIZE overlay: 7438

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 7438px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-USIZE-2700x7438.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-USIZE-2700x7438.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000208.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000208.png
duration  0.66

EOT

        
# new SIZE overlay: 14035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 14035px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-USIZE-2700x14035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-USIZE-2700x14035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000209.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000209.png
duration  0.66

EOT

        
# new SIZE overlay: 14737

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 14737px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-USIZE-2700x14737.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-USIZE-2700x14737.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000210.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000210.png
duration  0.66

EOT

        
# new STYLE header: PSM3, threshold mode 1

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120  -fill black -stroke '#FFFFFF80' -strokewidth 10  -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM3, threshold mode 1'   \( +clone -channel RGB -opaque black -fill white   -channel RGBA  -blur 0x20 \)   -compose dst-over -composite    -extent 3840x2160  miff:-  |  magick composite -gravity center -  movie/background.png   movie/style.png
cp movie/style.png  movie/1000211.png

cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000211.png
duration  2

EOT
        
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000212.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000212.png
duration  0.66

EOT

        
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000213.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000213.png
duration  0.66

EOT

        
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000214.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000214.png
duration  0.66

EOT

        
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000215.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000215.png
duration  0.66

EOT

        
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000216.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000216.png
duration  0.66

EOT

        
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000217.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000217.png
duration  0.66

EOT

        
# new SIZE overlay: 616

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 616px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x616.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x616.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000218.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000218.png
duration  0.66

EOT

        
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000219.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000219.png
duration  0.66

EOT

        
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000220.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000220.png
duration  0.66

EOT

        
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000221.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000221.png
duration  0.66

EOT

        
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000222.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000222.png
duration  0.66

EOT

        
# new SIZE overlay: 886

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 886px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x886.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x886.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000223.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000223.png
duration  0.66

EOT

        
# new SIZE overlay: 1035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 1035px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x1035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x1035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000224.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000224.png
duration  0.66

EOT

        
# new SIZE overlay: 1209

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 1209px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x1209.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x1209.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000225.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000225.png
duration  0.66

EOT

        
# new STYLE header: PSM3, threshold mode 2

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120  -fill black -stroke '#FFFFFF80' -strokewidth 10  -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM3, threshold mode 2'   \( +clone -channel RGB -opaque black -fill white   -channel RGBA  -blur 0x20 \)   -compose dst-over -composite    -extent 3840x2160  miff:-  |  magick composite -gravity center -  movie/background.png   movie/style.png
cp movie/style.png  movie/1000226.png

cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000226.png
duration  2

EOT
        
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000227.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000227.png
duration  0.66

EOT

        
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000228.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000228.png
duration  0.66

EOT

        
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000229.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000229.png
duration  0.66

EOT

        
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000230.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000230.png
duration  0.66

EOT

        
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000231.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000231.png
duration  0.66

EOT

        
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000232.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000232.png
duration  0.66

EOT

        
# new SIZE overlay: 616

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 616px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x616.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x616.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000233.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000233.png
duration  0.66

EOT

        
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000234.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000234.png
duration  0.66

EOT

        
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000235.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000235.png
duration  0.66

EOT

        
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000236.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000236.png
duration  0.66

EOT

        
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000237.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000237.png
duration  0.66

EOT

        
# new SIZE overlay: 798

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 798px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x798.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x798.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000238.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000238.png
duration  0.66

EOT

        
# new SIZE overlay: 841

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 841px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x841.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x841.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000239.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000239.png
duration  0.66

EOT

        
# new SIZE overlay: 886

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 886px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x886.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x886.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000240.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000240.png
duration  0.66

EOT

        
# new SIZE overlay: 933

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 933px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x933.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x933.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000241.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000241.png
duration  0.66

EOT

        
# new SIZE overlay: 983

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 983px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x983.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x983.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000242.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000242.png
duration  0.66

EOT

        
# new SIZE overlay: 1035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 1035px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000243.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000243.png
duration  0.66

EOT

        
# new SIZE overlay: 1090

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 1090px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1090.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1090.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000244.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000244.png
duration  0.66

EOT

        
# new SIZE overlay: 1148

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 1148px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1148.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1148.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000245.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000245.png
duration  0.66

EOT

        
# new SIZE overlay: 1273

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 1273px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1273.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1273.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000246.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000246.png
duration  0.66

EOT

        
# new SIZE overlay: 1340

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 1340px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1340.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1340.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000247.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000247.png
duration  0.66

EOT

        
# new SIZE overlay: 1486

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 1486px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1486.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1486.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000248.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000248.png
duration  0.66

EOT

        
# new SIZE overlay: 1565

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 1565px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1565.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1565.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000249.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000249.png
duration  0.66

EOT

        
# new SIZE overlay: 1648

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 1648px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1648.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1648.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000250.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000250.png
duration  0.66

EOT

        
# new SIZE overlay: 1827

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 1827px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1827.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1827.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000251.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000251.png
duration  0.66

EOT

        
# new SIZE overlay: 2026

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 2026px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x2026.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x2026.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000252.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000252.png
duration  0.66

EOT

        
# new SIZE overlay: 2246

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 2246px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x2246.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x2246.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000253.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000253.png
duration  0.66

EOT

        
# new SIZE overlay: 2490

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 2490px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x2490.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x2490.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000254.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000254.png
duration  0.66

EOT

        
# new SIZE overlay: 2622

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 2622px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x2622.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x2622.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000255.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000255.png
duration  0.66

EOT

        
# new SIZE overlay: 3061

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 3061px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x3061.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x3061.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000256.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000256.png
duration  0.66

EOT

        
# new SIZE overlay: 3939

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 3939px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x3939.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x3939.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000257.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000257.png
duration  0.66

EOT

        
# new SIZE overlay: 7438

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 7438px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x7438.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x7438.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000258.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000258.png
duration  0.66

EOT

        
# new SIZE overlay: 9043

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 9043px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x9043.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x9043.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000259.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000259.png
duration  0.66

EOT

        
# new SIZE overlay: 10470

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 10470px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x10470.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x10470.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000260.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000260.png
duration  0.66

EOT

        
# new SIZE overlay: 10994

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 10994px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x10994.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x10994.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000261.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000261.png
duration  0.66

EOT

        
# new SIZE overlay: 11544

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 11544px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x11544.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x11544.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000262.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000262.png
duration  0.66

EOT

        
# new SIZE overlay: 12122

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 12122px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x12122.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x12122.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000263.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000263.png
duration  0.66

EOT

        
# new SIZE overlay: 12729

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 12729px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x12729.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x12729.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000264.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000264.png
duration  0.66

EOT

        
# new SIZE overlay: 13366

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 13366px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x13366.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x13366.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000265.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000265.png
duration  0.66

EOT

        
# new SIZE overlay: 14035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 14035px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x14035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x14035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000266.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000266.png
duration  0.66

EOT

        
# new SIZE overlay: 14737

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 14737px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x14737.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x14737.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000267.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000267.png
duration  0.66

EOT

        
# new SIZE overlay: 15474

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 15474px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x15474.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x15474.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000268.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000268.png
duration  0.66

EOT

        
# new STYLE header: PSM6, threshold mode 0

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120  -fill black -stroke '#FFFFFF80' -strokewidth 10  -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM6, threshold mode 0'   \( +clone -channel RGB -opaque black -fill white   -channel RGBA  -blur 0x20 \)   -compose dst-over -composite    -extent 3840x2160  miff:-  |  magick composite -gravity center -  movie/background.png   movie/style.png
cp movie/style.png  movie/1000269.png

cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000269.png
duration  2

EOT
        
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000270.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000270.png
duration  0.66

EOT

        
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000271.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000271.png
duration  0.66

EOT

        
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000272.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000272.png
duration  0.66

EOT

        
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000273.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000273.png
duration  0.66

EOT

        
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000274.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000274.png
duration  0.66

EOT

        
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000275.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000275.png
duration  0.66

EOT

        
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000276.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000276.png
duration  0.66

EOT

        
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000277.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000277.png
duration  0.66

EOT

        
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000278.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000278.png
duration  0.66

EOT

        
# new SIZE overlay: 798

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 798px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x798.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x798.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000279.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000279.png
duration  0.66

EOT

        
# new SIZE overlay: 841

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 841px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x841.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x841.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000280.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000280.png
duration  0.66

EOT

        
# new SIZE overlay: 886

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 886px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x886.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x886.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000281.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000281.png
duration  0.66

EOT

        
# new SIZE overlay: 933

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 933px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x933.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x933.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000282.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000282.png
duration  0.66

EOT

        
# new SIZE overlay: 983

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 983px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x983.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x983.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000283.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000283.png
duration  0.66

EOT

        
# new SIZE overlay: 1035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 1035px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x1035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x1035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000284.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000284.png
duration  0.66

EOT

        
# new SIZE overlay: 1648

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 1648px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x1648.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x1648.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000285.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000285.png
duration  0.66

EOT

        
# new SIZE overlay: 1735

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 1735px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x1735.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x1735.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000286.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000286.png
duration  0.66

EOT

        
# new SIZE overlay: 14035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 14035px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-USIZE-2700x14035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-USIZE-2700x14035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000287.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000287.png
duration  0.66

EOT

        
# new STYLE header: PSM6, threshold mode 1

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120  -fill black -stroke '#FFFFFF80' -strokewidth 10  -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM6, threshold mode 1'   \( +clone -channel RGB -opaque black -fill white   -channel RGBA  -blur 0x20 \)   -compose dst-over -composite    -extent 3840x2160  miff:-  |  magick composite -gravity center -  movie/background.png   movie/style.png
cp movie/style.png  movie/1000288.png

cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000288.png
duration  2

EOT
        
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 1 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000289.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000289.png
duration  0.66

EOT

        
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 1 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000290.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000290.png
duration  0.66

EOT

        
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 1 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000291.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000291.png
duration  0.66

EOT

        
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 1 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000292.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000292.png
duration  0.66

EOT

        
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 1 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000293.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000293.png
duration  0.66

EOT

        
# new SIZE overlay: 616

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 1 | height: 616px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x616.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x616.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000294.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000294.png
duration  0.66

EOT

        
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 1 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000295.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000295.png
duration  0.66

EOT

        
# new STYLE header: PSM6, threshold mode 2

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120  -fill black -stroke '#FFFFFF80' -strokewidth 10  -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM6, threshold mode 2'   \( +clone -channel RGB -opaque black -fill white   -channel RGBA  -blur 0x20 \)   -compose dst-over -composite    -extent 3840x2160  miff:-  |  magick composite -gravity center -  movie/background.png   movie/style.png
cp movie/style.png  movie/1000296.png

cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000296.png
duration  2

EOT
        
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000297.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000297.png
duration  0.66

EOT

        
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000298.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000298.png
duration  0.66

EOT

        
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000299.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000299.png
duration  0.66

EOT

        
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000300.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000300.png
duration  0.66

EOT

        
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000301.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000301.png
duration  0.66

EOT

        
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000302.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000302.png
duration  0.66

EOT

        
# new SIZE overlay: 616

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 616px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x616.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x616.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000303.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000303.png
duration  0.66

EOT

        
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000304.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000304.png
duration  0.66

EOT

        
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000305.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000305.png
duration  0.66

EOT

        
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000306.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000306.png
duration  0.66

EOT

        
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000307.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000307.png
duration  0.66

EOT

        
# new SIZE overlay: 798

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 798px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x798.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x798.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000308.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000308.png
duration  0.66

EOT

        
# new SIZE overlay: 841

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 841px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x841.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x841.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000309.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000309.png
duration  0.66

EOT

        
# new SIZE overlay: 886

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 886px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x886.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x886.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000310.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000310.png
duration  0.66

EOT

        
# new SIZE overlay: 933

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 933px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x933.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x933.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000311.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000311.png
duration  0.66

EOT

        
# new SIZE overlay: 983

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 983px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x983.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x983.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000312.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000312.png
duration  0.66

EOT

        
# new SIZE overlay: 1035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 1035px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000313.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000313.png
duration  0.66

EOT

        
# new SIZE overlay: 1090

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 1090px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1090.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1090.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000314.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000314.png
duration  0.66

EOT

        
# new SIZE overlay: 1209

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 1209px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1209.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1209.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000315.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000315.png
duration  0.66

EOT

        
# new SIZE overlay: 1273

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 1273px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1273.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1273.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000316.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000316.png
duration  0.66

EOT

        
# new SIZE overlay: 1340

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 1340px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1340.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1340.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000317.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000317.png
duration  0.66

EOT

        
# new SIZE overlay: 1411

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 1411px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1411.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1411.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000318.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000318.png
duration  0.66

EOT

        
# new SIZE overlay: 1486

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 1486px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1486.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1486.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000319.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000319.png
duration  0.66

EOT

        
# new SIZE overlay: 1565

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 1565px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1565.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1565.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000320.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000320.png
duration  0.66

EOT

        
# new SIZE overlay: 1827

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 1827px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1827.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1827.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000321.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000321.png
duration  0.66

EOT

        
# new SIZE overlay: 2246

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 2246px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x2246.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x2246.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000322.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000322.png
duration  0.66

EOT

        
# new SIZE overlay: 12122

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 12122px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-USIZE-2700x12122.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-USIZE-2700x12122.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000323.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000323.png
duration  0.66

EOT

        
# new SIZE overlay: 12729

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 12729px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-USIZE-2700x12729.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-USIZE-2700x12729.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000324.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000324.png
duration  0.66

EOT

        
# new SIZE overlay: 13366

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 13366px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-USIZE-2700x13366.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-USIZE-2700x13366.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000325.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000325.png
duration  0.66

EOT

        
# new SIZE overlay: 14035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 14035px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-USIZE-2700x14035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-USIZE-2700x14035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000326.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000326.png
duration  0.66

EOT

        
# new SIZE overlay: 14737

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 14737px'     -extent 3740x50 -splice 100x0   movie/size.png
        
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-USIZE-2700x14737.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-USIZE-2700x14737.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000327.png


cat >> movie/ffmpeg-input-list.txt   <<EOT
file   1000327.png
duration  0.66

EOT

        
