#! /bin/bash
	  
set -v 
	  


# produce background image for all:
	  
magick -size 30x54 pattern:hexagons           -fill tomato     -opaque white           -fill dodgerblue -draw 'color 10,10 floodfill'           -fill limegreen  -draw 'color 10,25 floodfill'           -roll +15+27           -fill dodgerblue -draw 'color 10,10 floodfill'           -fill limegreen  -draw 'color 10,25 floodfill'   miff:- |    magick -size 1000x1000 tile:-  miff:- |  magick -     -background lightgrey   -resize '3840x2160^'  -gravity center -extent 3840x2160   movie/solid-background.png
	
magick movie/solid-background.png  -alpha set -background lightgrey  -channel A +level 0,20%       movie/background.png



	 
		
# new image header: B_RUN_data-1001-000-0003-b-leveled

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120   -gravity center      label:'Source image:\n\nB_RUN_data-1001-000-0003-b-leveled'     -extent 3840x2160  miff:-  |  magick composite -gravity center -  movie/background.png   movie/image.png
cp movie/image.png  movie/1000000.png



# find original image: 1001-000-0003-b-leveled
for f in $( find ./ -maxdepth 1 -type f -name '1001-000-0003-b-leveled*' ) ; do
	echo "--> $f"
	magick $f  -background transparent -gravity center   -resize 3840x2160           -extent 3840x2160   miff:-  |  magick composite -gravity center -  movie/background.png  movie/1000001.png

	magick   $f  -background transparent  -gravity NorthWest -resize 500x500  -bordercolor black -border 5  -extent 3840x2160   png32:movie/pip.png
done
	
	 
		
# new tessdata BASE header: tessdata

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120   -gravity center      label:'Tesseract model set:\n\ntessdata'     -extent 3840x2160   miff:-  |  magick composite -gravity center -  movie/background.png  movie/base.png
cp movie/base.png  movie/1000002.png
		
# new OEM header: OEM3

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120   -gravity center      label:'OCR Engine mode:\n\nOEM3'     -extent 3840x2160   miff:-  |  magick composite -gravity center -  movie/background.png  movie/oem.png
cp movie/oem.png  movie/1000003.png
		
# new STYLE header: PSM1, threshold mode 0

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120   -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM1, threshold mode 0'     -extent 3840x2160   miff:-  |  magick composite -gravity center -  movie/background.png  movie/style.png
cp movie/style.png  movie/1000004.png
		
# new SIZE overlay: 7438

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 7438px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-USIZE-2700x7438.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-USIZE-2700x7438.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000005.png

		
# new SIZE overlay: 6117

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 6117px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-USIZE-2700x6117.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-USIZE-2700x6117.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000006.png

		
# new SIZE overlay: 14737

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 14737px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-USIZE-2700x14737.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-USIZE-2700x14737.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000007.png

		
# new SIZE overlay: 14035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 14035px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-USIZE-2700x14035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-USIZE-2700x14035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000008.png

		
# new SIZE overlay: 983

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 983px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x983.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x983.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000009.png

		
# new SIZE overlay: 933

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 933px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x933.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x933.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000010.png

		
# new SIZE overlay: 886

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 886px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x886.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x886.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000011.png

		
# new SIZE overlay: 841

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 841px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x841.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x841.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000012.png

		
# new SIZE overlay: 798

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 798px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x798.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x798.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000013.png

		
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000014.png

		
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000015.png

		
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000016.png

		
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000017.png

		
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000018.png

		
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000019.png

		
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000020.png

		
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000021.png

		
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000022.png

		
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000023.png

		
# new SIZE overlay: 2907

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 2907px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x2907.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x2907.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000024.png

		
# new SIZE overlay: 2761

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 2761px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x2761.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x2761.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000025.png

		
# new SIZE overlay: 1648

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 1648px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1648.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1648.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000026.png

		
# new SIZE overlay: 1411

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 1411px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1411.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1411.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000027.png

		
# new SIZE overlay: 1273

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 1273px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1273.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1273.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000028.png

		
# new SIZE overlay: 1148

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 1148px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1148.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1148.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000029.png

		
# new SIZE overlay: 1090

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 1090px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1090.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1090.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000030.png

		
# new SIZE overlay: 1035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 0 | height: 1035px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH0-DSIZE-2700x1035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000031.png

		
# new STYLE header: PSM1, threshold mode 1

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120   -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM1, threshold mode 1'     -extent 3840x2160   miff:-  |  magick composite -gravity center -  movie/background.png  movie/style.png
cp movie/style.png  movie/1000032.png
		
# new SIZE overlay: 886

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 886px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x886.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x886.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000033.png

		
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000034.png

		
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000035.png

		
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000036.png

		
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000037.png

		
# new SIZE overlay: 616

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 616px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x616.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x616.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000038.png

		
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000039.png

		
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000040.png

		
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000041.png

		
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000042.png

		
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000043.png

		
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000044.png

		
# new SIZE overlay: 1209

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 1209px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x1209.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x1209.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000045.png

		
# new SIZE overlay: 1035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 1 | height: 1035px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x1035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH1-DSIZE-2700x1035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000046.png

		
# new STYLE header: PSM1, threshold mode 2

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120   -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM1, threshold mode 2'     -extent 3840x2160   miff:-  |  magick composite -gravity center -  movie/background.png  movie/style.png
cp movie/style.png  movie/1000047.png
		
# new SIZE overlay: 8612

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 8612px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x8612.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x8612.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000048.png

		
# new SIZE overlay: 7438

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 7438px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x7438.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x7438.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000049.png

		
# new SIZE overlay: 3939

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 3939px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x3939.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x3939.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000050.png

		
# new SIZE overlay: 15474

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 15474px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x15474.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x15474.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000051.png

		
# new SIZE overlay: 14737

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 14737px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x14737.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x14737.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000052.png

		
# new SIZE overlay: 14035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 14035px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x14035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x14035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000053.png

		
# new SIZE overlay: 13366

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 13366px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x13366.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x13366.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000054.png

		
# new SIZE overlay: 12729

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 12729px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x12729.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x12729.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000055.png

		
# new SIZE overlay: 12122

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 12122px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x12122.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x12122.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000056.png

		
# new SIZE overlay: 11544

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 11544px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x11544.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x11544.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000057.png

		
# new SIZE overlay: 10994

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 10994px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x10994.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x10994.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000058.png

		
# new SIZE overlay: 10470

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 10470px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x10470.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-USIZE-2700x10470.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000059.png

		
# new SIZE overlay: 983

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 983px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x983.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x983.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000060.png

		
# new SIZE overlay: 933

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 933px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x933.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x933.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000061.png

		
# new SIZE overlay: 886

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 886px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x886.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x886.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000062.png

		
# new SIZE overlay: 841

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 841px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x841.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x841.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000063.png

		
# new SIZE overlay: 798

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 798px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x798.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x798.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000064.png

		
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000065.png

		
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000066.png

		
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000067.png

		
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000068.png

		
# new SIZE overlay: 616

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 616px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x616.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x616.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000069.png

		
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000070.png

		
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000071.png

		
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000072.png

		
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000073.png

		
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000074.png

		
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000075.png

		
# new SIZE overlay: 3061

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 3061px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x3061.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x3061.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000076.png

		
# new SIZE overlay: 2622

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 2622px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x2622.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x2622.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000077.png

		
# new SIZE overlay: 2490

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 2490px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x2490.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x2490.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000078.png

		
# new SIZE overlay: 2246

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 2246px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x2246.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x2246.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000079.png

		
# new SIZE overlay: 2026

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 2026px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x2026.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x2026.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000080.png

		
# new SIZE overlay: 1827

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 1827px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1827.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1827.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000081.png

		
# new SIZE overlay: 1648

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 1648px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1648.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1648.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000082.png

		
# new SIZE overlay: 1565

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 1565px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1565.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1565.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000083.png

		
# new SIZE overlay: 1486

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 1486px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1486.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1486.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000084.png

		
# new SIZE overlay: 1411

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 1411px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1411.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1411.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000085.png

		
# new SIZE overlay: 1340

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 1340px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1340.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1340.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000086.png

		
# new SIZE overlay: 1273

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 1273px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1273.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1273.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000087.png

		
# new SIZE overlay: 1148

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 1148px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1148.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1148.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000088.png

		
# new SIZE overlay: 1090

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 1090px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1090.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1090.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000089.png

		
# new SIZE overlay: 1035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM1, threshold mode 2 | height: 1035px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM1-TH2-DSIZE-2700x1035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000090.png

		
# new STYLE header: PSM11, threshold mode 0

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120   -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM11, threshold mode 0'     -extent 3840x2160   miff:-  |  magick composite -gravity center -  movie/background.png  movie/style.png
cp movie/style.png  movie/1000091.png
		
# new SIZE overlay: 7438

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 7438px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-USIZE-2700x7438.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-USIZE-2700x7438.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000092.png

		
# new SIZE overlay: 4343

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 4343px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-USIZE-2700x4343.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-USIZE-2700x4343.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000093.png

		
# new SIZE overlay: 3751

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 3751px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-USIZE-2700x3751.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-USIZE-2700x3751.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000094.png

		
# new SIZE overlay: 983

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 983px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x983.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x983.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000095.png

		
# new SIZE overlay: 933

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 933px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x933.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x933.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000096.png

		
# new SIZE overlay: 886

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 886px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x886.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x886.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000097.png

		
# new SIZE overlay: 841

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 841px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x841.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x841.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000098.png

		
# new SIZE overlay: 798

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 798px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x798.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x798.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000099.png

		
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000100.png

		
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000101.png

		
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000102.png

		
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000103.png

		
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000104.png

		
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000105.png

		
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000106.png

		
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000107.png

		
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000108.png

		
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000109.png

		
# new SIZE overlay: 3393

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 3393px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x3393.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x3393.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000110.png

		
# new SIZE overlay: 3223

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 3223px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x3223.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x3223.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000111.png

		
# new SIZE overlay: 3061

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 3061px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x3061.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x3061.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000112.png

		
# new SIZE overlay: 2907

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 2907px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2907.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2907.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000113.png

		
# new SIZE overlay: 2761

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 2761px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2761.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2761.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000114.png

		
# new SIZE overlay: 2490

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 2490px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2490.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2490.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000115.png

		
# new SIZE overlay: 2365

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 2365px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2365.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2365.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000116.png

		
# new SIZE overlay: 2246

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 2246px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2246.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2246.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000117.png

		
# new SIZE overlay: 2133

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 2133px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2133.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2133.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000118.png

		
# new SIZE overlay: 2026

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 2026px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2026.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x2026.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000119.png

		
# new SIZE overlay: 1924

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1924px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1924.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1924.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000120.png

		
# new SIZE overlay: 1827

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1827px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1827.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1827.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000121.png

		
# new SIZE overlay: 1735

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1735px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1735.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1735.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000122.png

		
# new SIZE overlay: 1648

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1648px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1648.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1648.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000123.png

		
# new SIZE overlay: 1565

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1565px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1565.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1565.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000124.png

		
# new SIZE overlay: 1486

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1486px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1486.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1486.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000125.png

		
# new SIZE overlay: 1411

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1411px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1411.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1411.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000126.png

		
# new SIZE overlay: 1340

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1340px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1340.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1340.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000127.png

		
# new SIZE overlay: 1273

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1273px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1273.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1273.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000128.png

		
# new SIZE overlay: 1209

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1209px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1209.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1209.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000129.png

		
# new SIZE overlay: 1148

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1148px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1148.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1148.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000130.png

		
# new SIZE overlay: 1090

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1090px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1090.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1090.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000131.png

		
# new SIZE overlay: 1035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 0 | height: 1035px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH0-DSIZE-2700x1035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000132.png

		
# new STYLE header: PSM11, threshold mode 1

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120   -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM11, threshold mode 1'     -extent 3840x2160   miff:-  |  magick composite -gravity center -  movie/background.png  movie/style.png
cp movie/style.png  movie/1000133.png
		
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 1 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000134.png

		
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 1 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000135.png

		
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 1 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000136.png

		
# new SIZE overlay: 616

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 1 | height: 616px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x616.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x616.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000137.png

		
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 1 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000138.png

		
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 1 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000139.png

		
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 1 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH1-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000140.png

		
# new STYLE header: PSM11, threshold mode 2

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120   -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM11, threshold mode 2'     -extent 3840x2160   miff:-  |  magick composite -gravity center -  movie/background.png  movie/style.png
cp movie/style.png  movie/1000141.png
		
# new SIZE overlay: 15474

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 15474px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x15474.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x15474.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000142.png

		
# new SIZE overlay: 14737

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 14737px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x14737.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x14737.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000143.png

		
# new SIZE overlay: 14035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 14035px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x14035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x14035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000144.png

		
# new SIZE overlay: 13366

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 13366px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x13366.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x13366.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000145.png

		
# new SIZE overlay: 12729

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 12729px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x12729.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x12729.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000146.png

		
# new SIZE overlay: 12122

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 12122px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x12122.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x12122.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000147.png

		
# new SIZE overlay: 11544

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 11544px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x11544.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x11544.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000148.png

		
# new SIZE overlay: 10470

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 10470px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x10470.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-USIZE-2700x10470.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000149.png

		
# new SIZE overlay: 983

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 983px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x983.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x983.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000150.png

		
# new SIZE overlay: 933

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 933px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x933.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x933.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000151.png

		
# new SIZE overlay: 886

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 886px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x886.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x886.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000152.png

		
# new SIZE overlay: 841

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 841px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x841.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x841.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000153.png

		
# new SIZE overlay: 798

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 798px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x798.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x798.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000154.png

		
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000155.png

		
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000156.png

		
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000157.png

		
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000158.png

		
# new SIZE overlay: 616

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 616px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x616.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x616.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000159.png

		
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000160.png

		
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000161.png

		
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000162.png

		
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000163.png

		
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000164.png

		
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000165.png

		
# new SIZE overlay: 2365

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 2365px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x2365.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x2365.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000166.png

		
# new SIZE overlay: 1924

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1924px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1924.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1924.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000167.png

		
# new SIZE overlay: 1827

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1827px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1827.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1827.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000168.png

		
# new SIZE overlay: 1735

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1735px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1735.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1735.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000169.png

		
# new SIZE overlay: 1648

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1648px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1648.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1648.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000170.png

		
# new SIZE overlay: 1565

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1565px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1565.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1565.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000171.png

		
# new SIZE overlay: 1486

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1486px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1486.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1486.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000172.png

		
# new SIZE overlay: 1411

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1411px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1411.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1411.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000173.png

		
# new SIZE overlay: 1340

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1340px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1340.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1340.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000174.png

		
# new SIZE overlay: 1273

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1273px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1273.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1273.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000175.png

		
# new SIZE overlay: 1209

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1209px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1209.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1209.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000176.png

		
# new SIZE overlay: 1148

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1148px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1148.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1148.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000177.png

		
# new SIZE overlay: 1090

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1090px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1090.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1090.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000178.png

		
# new SIZE overlay: 1035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM11, threshold mode 2 | height: 1035px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM11-TH2-DSIZE-2700x1035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000179.png

		
# new STYLE header: PSM13, threshold mode 2

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120   -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM13, threshold mode 2'     -extent 3840x2160   miff:-  |  magick composite -gravity center -  movie/background.png  movie/style.png
cp movie/style.png  movie/1000180.png
		
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM13, threshold mode 2 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM13-TH2-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM13-TH2-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000181.png

		
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM13, threshold mode 2 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM13-TH2-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM13-TH2-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000182.png

		
# new STYLE header: PSM3, threshold mode 0

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120   -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM3, threshold mode 0'     -extent 3840x2160   miff:-  |  magick composite -gravity center -  movie/background.png  movie/style.png
cp movie/style.png  movie/1000183.png
		
# new SIZE overlay: 7438

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 7438px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-USIZE-2700x7438.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-USIZE-2700x7438.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000184.png

		
# new SIZE overlay: 6117

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 6117px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-USIZE-2700x6117.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-USIZE-2700x6117.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000185.png

		
# new SIZE overlay: 14737

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 14737px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-USIZE-2700x14737.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-USIZE-2700x14737.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000186.png

		
# new SIZE overlay: 14035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 14035px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-USIZE-2700x14035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-USIZE-2700x14035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000187.png

		
# new SIZE overlay: 983

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 983px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x983.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x983.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000188.png

		
# new SIZE overlay: 933

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 933px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x933.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x933.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000189.png

		
# new SIZE overlay: 886

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 886px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x886.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x886.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000190.png

		
# new SIZE overlay: 841

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 841px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x841.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x841.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000191.png

		
# new SIZE overlay: 798

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 798px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x798.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x798.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000192.png

		
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000193.png

		
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000194.png

		
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000195.png

		
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000196.png

		
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000197.png

		
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000198.png

		
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000199.png

		
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000200.png

		
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000201.png

		
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000202.png

		
# new SIZE overlay: 2907

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 2907px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x2907.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x2907.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000203.png

		
# new SIZE overlay: 2761

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 2761px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x2761.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x2761.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000204.png

		
# new SIZE overlay: 1648

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 1648px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1648.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1648.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000205.png

		
# new SIZE overlay: 1411

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 1411px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1411.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1411.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000206.png

		
# new SIZE overlay: 1273

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 1273px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1273.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1273.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000207.png

		
# new SIZE overlay: 1148

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 1148px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1148.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1148.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000208.png

		
# new SIZE overlay: 1090

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 1090px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1090.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1090.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000209.png

		
# new SIZE overlay: 1035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 0 | height: 1035px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH0-DSIZE-2700x1035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000210.png

		
# new STYLE header: PSM3, threshold mode 1

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120   -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM3, threshold mode 1'     -extent 3840x2160   miff:-  |  magick composite -gravity center -  movie/background.png  movie/style.png
cp movie/style.png  movie/1000211.png
		
# new SIZE overlay: 886

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 886px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x886.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x886.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000212.png

		
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000213.png

		
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000214.png

		
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000215.png

		
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000216.png

		
# new SIZE overlay: 616

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 616px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x616.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x616.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000217.png

		
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000218.png

		
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000219.png

		
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000220.png

		
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000221.png

		
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000222.png

		
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000223.png

		
# new SIZE overlay: 1209

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 1209px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x1209.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x1209.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000224.png

		
# new SIZE overlay: 1035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 1 | height: 1035px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x1035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH1-DSIZE-2700x1035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000225.png

		
# new STYLE header: PSM3, threshold mode 2

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120   -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM3, threshold mode 2'     -extent 3840x2160   miff:-  |  magick composite -gravity center -  movie/background.png  movie/style.png
cp movie/style.png  movie/1000226.png
		
# new SIZE overlay: 9043

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 9043px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x9043.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x9043.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000227.png

		
# new SIZE overlay: 7438

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 7438px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x7438.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x7438.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000228.png

		
# new SIZE overlay: 3939

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 3939px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x3939.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x3939.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000229.png

		
# new SIZE overlay: 15474

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 15474px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x15474.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x15474.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000230.png

		
# new SIZE overlay: 14737

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 14737px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x14737.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x14737.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000231.png

		
# new SIZE overlay: 14035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 14035px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x14035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x14035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000232.png

		
# new SIZE overlay: 13366

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 13366px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x13366.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x13366.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000233.png

		
# new SIZE overlay: 12729

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 12729px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x12729.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x12729.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000234.png

		
# new SIZE overlay: 12122

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 12122px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x12122.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x12122.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000235.png

		
# new SIZE overlay: 11544

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 11544px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x11544.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x11544.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000236.png

		
# new SIZE overlay: 10994

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 10994px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x10994.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x10994.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000237.png

		
# new SIZE overlay: 10470

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 10470px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x10470.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-USIZE-2700x10470.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000238.png

		
# new SIZE overlay: 983

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 983px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x983.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x983.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000239.png

		
# new SIZE overlay: 933

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 933px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x933.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x933.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000240.png

		
# new SIZE overlay: 886

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 886px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x886.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x886.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000241.png

		
# new SIZE overlay: 841

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 841px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x841.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x841.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000242.png

		
# new SIZE overlay: 798

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 798px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x798.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x798.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000243.png

		
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000244.png

		
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000245.png

		
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000246.png

		
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000247.png

		
# new SIZE overlay: 616

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 616px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x616.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x616.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000248.png

		
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000249.png

		
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000250.png

		
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000251.png

		
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000252.png

		
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000253.png

		
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000254.png

		
# new SIZE overlay: 3061

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 3061px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x3061.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x3061.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000255.png

		
# new SIZE overlay: 2622

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 2622px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x2622.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x2622.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000256.png

		
# new SIZE overlay: 2490

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 2490px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x2490.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x2490.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000257.png

		
# new SIZE overlay: 2246

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 2246px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x2246.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x2246.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000258.png

		
# new SIZE overlay: 2026

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 2026px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x2026.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x2026.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000259.png

		
# new SIZE overlay: 1827

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 1827px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1827.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1827.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000260.png

		
# new SIZE overlay: 1648

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 1648px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1648.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1648.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000261.png

		
# new SIZE overlay: 1565

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 1565px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1565.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1565.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000262.png

		
# new SIZE overlay: 1486

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 1486px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1486.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1486.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000263.png

		
# new SIZE overlay: 1340

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 1340px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1340.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1340.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000264.png

		
# new SIZE overlay: 1273

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 1273px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1273.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1273.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000265.png

		
# new SIZE overlay: 1148

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 1148px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1148.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1148.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000266.png

		
# new SIZE overlay: 1090

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 1090px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1090.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1090.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000267.png

		
# new SIZE overlay: 1035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM3, threshold mode 2 | height: 1035px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM3-TH2-DSIZE-2700x1035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000268.png

		
# new STYLE header: PSM6, threshold mode 0

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120   -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM6, threshold mode 0'     -extent 3840x2160   miff:-  |  magick composite -gravity center -  movie/background.png  movie/style.png
cp movie/style.png  movie/1000269.png
		
# new SIZE overlay: 14035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 14035px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-USIZE-2700x14035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-USIZE-2700x14035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000270.png

		
# new SIZE overlay: 983

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 983px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x983.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x983.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000271.png

		
# new SIZE overlay: 933

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 933px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x933.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x933.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000272.png

		
# new SIZE overlay: 886

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 886px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x886.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x886.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000273.png

		
# new SIZE overlay: 841

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 841px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x841.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x841.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000274.png

		
# new SIZE overlay: 798

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 798px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x798.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x798.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000275.png

		
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000276.png

		
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000277.png

		
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000278.png

		
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000279.png

		
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000280.png

		
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000281.png

		
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000282.png

		
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000283.png

		
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000284.png

		
# new SIZE overlay: 1735

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 1735px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x1735.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x1735.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000285.png

		
# new SIZE overlay: 1648

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 1648px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x1648.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x1648.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000286.png

		
# new SIZE overlay: 1035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 0 | height: 1035px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x1035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH0-DSIZE-2700x1035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000287.png

		
# new STYLE header: PSM6, threshold mode 1

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120   -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM6, threshold mode 1'     -extent 3840x2160   miff:-  |  magick composite -gravity center -  movie/background.png  movie/style.png
cp movie/style.png  movie/1000288.png
		
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 1 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000289.png

		
# new SIZE overlay: 616

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 1 | height: 616px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x616.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x616.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000290.png

		
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 1 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000291.png

		
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 1 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000292.png

		
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 1 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000293.png

		
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 1 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000294.png

		
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 1 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH1-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000295.png

		
# new STYLE header: PSM6, threshold mode 2

magick  -background transparent -fill black -font Liberation-Sans -pointsize 120   -gravity center      label:'Style:\n(Page Segmentation Mode + ...)\n\nPSM6, threshold mode 2'     -extent 3840x2160   miff:-  |  magick composite -gravity center -  movie/background.png  movie/style.png
cp movie/style.png  movie/1000296.png
		
# new SIZE overlay: 14737

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 14737px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-USIZE-2700x14737.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-USIZE-2700x14737.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000297.png

		
# new SIZE overlay: 14035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 14035px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-USIZE-2700x14035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-USIZE-2700x14035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000298.png

		
# new SIZE overlay: 13366

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 13366px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-USIZE-2700x13366.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-USIZE-2700x13366.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000299.png

		
# new SIZE overlay: 12729

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 12729px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-USIZE-2700x12729.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-USIZE-2700x12729.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000300.png

		
# new SIZE overlay: 12122

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 12122px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-USIZE-2700x12122.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-USIZE-2700x12122.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000301.png

		
# new SIZE overlay: 983

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 983px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x983.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x983.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000302.png

		
# new SIZE overlay: 933

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 933px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x933.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x933.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000303.png

		
# new SIZE overlay: 886

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 886px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x886.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x886.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000304.png

		
# new SIZE overlay: 841

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 841px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x841.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x841.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000305.png

		
# new SIZE overlay: 798

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 798px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x798.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x798.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000306.png

		
# new SIZE overlay: 758

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 758px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x758.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x758.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000307.png

		
# new SIZE overlay: 720

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 720px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x720.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x720.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000308.png

		
# new SIZE overlay: 684

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 684px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x684.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x684.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000309.png

		
# new SIZE overlay: 649

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 649px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x649.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x649.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000310.png

		
# new SIZE overlay: 616

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 616px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x616.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x616.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000311.png

		
# new SIZE overlay: 585

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 585px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x585.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x585.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000312.png

		
# new SIZE overlay: 555

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 555px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x555.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x555.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000313.png

		
# new SIZE overlay: 527

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 527px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x527.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x527.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000314.png

		
# new SIZE overlay: 500

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 500px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x500.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x500.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000315.png

		
# new SIZE overlay: 475

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 475px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x475.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x475.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000316.png

		
# new SIZE overlay: 451

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 451px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x451.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x451.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000317.png

		
# new SIZE overlay: 2246

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 2246px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x2246.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x2246.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000318.png

		
# new SIZE overlay: 1827

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 1827px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1827.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1827.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000319.png

		
# new SIZE overlay: 1565

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 1565px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1565.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1565.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000320.png

		
# new SIZE overlay: 1486

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 1486px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1486.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1486.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000321.png

		
# new SIZE overlay: 1411

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 1411px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1411.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1411.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000322.png

		
# new SIZE overlay: 1340

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 1340px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1340.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1340.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000323.png

		
# new SIZE overlay: 1273

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 1273px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1273.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1273.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000324.png

		
# new SIZE overlay: 1209

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 1209px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1209.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1209.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000325.png

		
# new SIZE overlay: 1090

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 1090px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1090.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1090.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000326.png

		
# new SIZE overlay: 1035

magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1001-000-0003-b-leveled | tessdata | OEM3 | PSM6, threshold mode 2 | height: 1035px'     -extent 3740x50 -splice 100x0   movie/size.png
		
#  B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1035.processed.tif

magick B_RUN_data-1001-000-0003-b-leveled/tessdata/OEM3/PSM6-TH2-DSIZE-2700x1035.processed.tif  -background transparent -gravity center   -resize 3840x2110       movie/size.png -append    miff:-  |  magick composite -gravity center -  movie/pip.png miff:-  |  magick composite -gravity center -  movie/background.png   movie/1000327.png

		
