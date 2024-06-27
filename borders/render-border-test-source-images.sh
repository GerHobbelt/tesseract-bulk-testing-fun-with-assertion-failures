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
	
	#  x = 155; while (x > 5) {  console.log(x);  x *= 0.9; x = Math.floor(x); }
	# remixed with a 5% series around the scale=50%..30% mark as we know we rendered our text at fontsize 100
	for s in 	\
		155		\
		139		\
		125		\
		112		\
				\
		90		\
		81		\
		72		\
		68		\
		64		\
		60		\
		57		\
		54		\
		51		\
		48		\
		45		\
		42		\
		39		\
		37		\
		35		\
		33		\
		31		\
		29		\
		27		\
		25		\
		23		\
		21		\
		19		\
		18		\
		17		\
		16		\
		14		\
		13		\
		12		\
		11		\
		10		\
		9		\
		8		\
		7		\
		6		\
	; do
		magick ${bfn}.png   -resize "${s}%"      ${bfn}-scale-${s}.png
	done
}

# function
render_border_variants() {
	src=$1
	echo "SRC:$src"
	echo "SEQ:$seq"

	# x = 100; while (x > 0) {  console.log(x);  x *= 0.94; x = Math.floor(x); }
	for b in 	\
		100		\
		94		\
		88		\
		82		\
		77		\
		72		\
		67		\
		62		\
		58		\
		54		\
		50		\
		47		\
		44		\
		41		\
		38		\
		35		\
		32		\
		30		\
		28		\
		26		\
		24		\
		22		\
		20		\
		18		\
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
		3		\
		2		\
		1		\
	; do
		magick  ${src}.png  -background white -bordercolor white           -border $b      ${src}-border-$b.png
		
		render_scaled_variants   ${src}-border-$b
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

		base=SRCIMG-F-${ffnm}/${fn}-${seq}-F-${ffnm}
		((seq=seq+1))


		render_scaled_variants   ${base}
		
		render_border_variants   ${base}
		


		# x = 10; while (x > 0) {  console.log(x);  x *= 0.75; x = Math.floor(x); }
		for n in 	\
			10		\
			7		\
			5		\
			3		\
			2		\
			1		\
		; do
			name=SRCIMG-F-${ffnm}/${fn}-${seq}-F-${ffnm}-shaved-$n
			magick  ${base}.png  -background white -gravity center        -shave $n   +repage   ${name}.png
			
			((seq=seq+1))
		
			render_scaled_variants   	${name}
		
			render_border_variants      ${name}

			((n=n-1))
		done
	done
done

	