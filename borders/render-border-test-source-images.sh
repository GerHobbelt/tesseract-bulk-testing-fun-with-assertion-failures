#! /bin/bash
#
#
#

# magick -size 5000x1000 xc:none  -fill blue  -draw 'line 150,0 150,990' \
#          -undercolor white -fill black \
#          \( -clone 0   -font Malgun-Gothic    -pointsize 72 \
#             -annotate +50+600 'Malgun-Gothic ' \) \
#          \( -clone 0   -font Liberation-Serif     -pointsize 48 \
#             -annotate +50+600 'Liberation-Serif ' \) \
#          \( -clone 0   -font Frank-Ruehl-CLM-Medium     -pointsize 48 \
#             -annotate +50+600 'Frank-Ruehl-CLM ' \) \
#          \( -clone 0   -font Franklin-Gothic-Medium-Italic -pointsize 96 \
#             -annotate +50+600 'Franklin-Gothic' \) \
#          -delete 0 -trim +repage  +append \
#          -transparent blue  -trim +repage \
#          -background white -flatten   wp_draw_baseline.png

# magick  -background lightgrey -fill black -font Liberation-Sans -pointsize 32   -gravity west      label:'B_RUN_data-1099'     -extent 3740x50 -splice 100x0   movie/size.png

set -x


rm 1*.png
rm -rf SRCIMG-F-*


seq=1000


# function
render_scaled_variants() {
	bfn=$1
	
	#  x = 155; while (x >= 5) {  console.log(x);  x *= 0.9; x = Math.floor(x); }
	for s in 	\
		155		\
		139		\
		125		\
		112		\
		100		\
		90		\
		81		\
		72		\
		64		\
		57		\
		51		\
		45		\
		40		\
		36		\
		32		\
		28		\
		25		\
		22		\
		19		\
		17		\
		15		\
		13		\
		11		\
		9		\
		8		\
		7		\
		6		\
		5		\
	; do
		magick SRCIMG-F-${ffnm}/${bfn}.png   -resize "${s}%"      SRCIMG-F-${ffnm}/${bfn}-scale-${s}.png
	done
}

# function
render_border_variants() {
	src=$1
	echo "BASE:$base"
	echo "N:$n"
	echo "SRC:$src"
	echo "SEQ:$seq"

	# x = 100; while (x >= 5) {  console.log(x);  x *= 0.982; x = Math.floor(x); }
	for b in 	\
		100		\
		98		\
		96		\
		94		\
		92		\
		90		\
		88		\
		86		\
		84		\
		82		\
		80		\
		78		\
		76		\
		74		\
		72		\
		70		\
		68		\
		66		\
		64		\
		62		\
		60		\
		58		\
		56		\
		54		\
		53		\
		52		\
		51		\
		50		\
		49		\
		48		\
		47		\
		46		\
		45		\
		44		\
		43		\
		42		\
		41		\
		40		\
		39		\
		38		\
		37		\
		36		\
		35		\
		34		\
		33		\
		32		\
		31		\
		30		\
		29		\
		28		\
		27		\
		26		\
		25		\
		24		\
		23		\
		22		\
		21		\
		20		\
		19		\
		18		\
		17		\
		16		\
		15		\
		14		\
		13		\
		12		\
		11		\
		10		\
		9		\
		8		\
		7		\
		6		\
		5		\
		4		\
	; do
		magick  SRCIMG-F-${ffnm}/${src}.png  -background white -undercolor white -fill white -bordercolor white   -gravity center        -border $n   +repage   SRCIMG-F-${ffnm}/${fn}-${seq}-F-${ffnm}-shaved-$n-border-$b.png
		
		render_scaled_variants   ${fn}-${seq}-F-${ffnm}-shaved-$n-border-$b
		
		((seq=seq+1))
	done
}


for f in 1*.txt ; do
	fn=$( basename "$f" .txt )
	echo "$fn"
	
	for fnt in Malgun-Gothic    Liberation-Serif     Frank-Ruehl-CLM-Medium     Franklin-Gothic-Medium-Italic ; do
		ffnm=$( echo $fnt | sed -E -e 's/-.*$//' )
		
		mkdir SRCIMG-F-${ffnm}

		# https://stackoverflow.com/questions/1250079/how-to-escape-single-quotes-within-single-quoted-strings
		cat > tmp-render.sh  <<EOF
	
magick      -size 5000x500  -background white -undercolor white -fill black  -gravity center        -font ${fnt}    -pointsize 100   label:'$( cat "$f" | sed -E -e "s/[']/'\"'\"'/g" )'              -trim  +repage   ${fn}-${seq}-F-${ffnm}.png
cp    ${fn}-${seq}-F-${ffnm}.png    SRCIMG-F-${ffnm}/

EOF
		
		./tmp-render.sh
		
		render_scaled_variants   ${fn}-${seq}-F-${ffnm}
		


		n=10
		base=SRCIMG-F-${ffnm}/${fn}-${seq}-F-${ffnm}
		((seq=seq+1))
		while [ $n -ge 0 ] ; do
			magick  ${base}.png  -background white -gravity center        -shave $n   +repage   SRCIMG-F-${ffnm}/${fn}-${seq}-F-${ffnm}-shaved-$n.png
		
			render_scaled_variants   	${fn}-${seq}-F-${ffnm}-shaved-$n
		
			render_border_variants      ${fn}-${seq}-F-${ffnm}-shaved-$n

			((seq=seq+1))
			((n=n-1))
		done
	done
done

	