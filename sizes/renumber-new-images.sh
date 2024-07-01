#! /bin/bash

# find current highest used 1000-series number:
n=$( find ./ -maxdepth 1 -type f -name '1*' | sed -E -e 's#[.]/##' | grep -E -e '^1[0-9]{3}-' | sort | tail -n 1 | cut -d- -f 1 )
((n=n+1))
if test $n -lt 1001 ; then
	n=1001
fi
echo "Start at number: $n..."




# simplify all filenames: no obnoxious spaces, etc.etc.
find ./   -maxdepth 1 -type f > tmp_simplify.lst
node $( dirname "$0" )/simplify_filenames_gen.js tmp_simplify.lst > tmp_simplify.sh
#./tmp_simplify.sh






# renumber all incoming files which don't match our 1000-series numbering pattern yet. Clean up those filenames alongside...
for f in $( find ./ -maxdepth 1 -type f  | sed -E -e 's#./##' | grep -E -v -e '^1[0-9]{3}-' | grep -E -e '[.](png|jpg|jpeg|jp2|gif|tif|tiff|jfif|avif|jxl|bmp|webp|jxr)$' ) ; do 
	echo "$f"
	g=$( echo "$f" | sed -E -e 's/[^a-z0-9._-]/_/gi'  -e 's/[_-]{2,}/_/g' -e 's/^[_-]+//g' -e 's/[_-]+$//g' ) 
	echo "--> $n-$g"
	mv -n -- "$f"      "$n-$g" 
	((n=n+1)) 
done


#rm   tmp_simplify.lst   tmp_simplify.sh
