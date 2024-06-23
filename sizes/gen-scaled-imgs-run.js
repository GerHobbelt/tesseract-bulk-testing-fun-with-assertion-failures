
let path = require("path");
const debug = false;

if (debug) console.log("", {argv: process.argv });

const width = 1 * process.argv[2];
const height0 = 1 * process.argv[3];

let src = process.argv[5];
let dstname = process.argv[6];
let dstext = path.extname(src);

if (debug) console.log("source:", { width, height0, src, dstname, dstext });

const f_step = 0.05;
const px_step = 5;

let height = height0;

console.log(`cp ${src}   DERIVSRC-${dstname}-RSIZE-${width}x${height}${dstext}`);

let nh = height;
let n = 0;
let count = 0;


while (nh > 10 && nh >= height0 / 8) {
	if (n > 0) {
		console.log("# target:", { width, nh, bottom: height0 / 8 });
		console.log(`if ! test -f DERIVSRC-${dstname}-DSIZE-${width}x${nh}${dstext} ; then
			magick ${src}   -resize 'x${nh}' -quality 95   DERIVSRC-${dstname}-DSIZE-${width}x${nh}${dstext}   &
		fi`);
	}

	let h2 = height - px_step;
	let h3 = Math.floor(height * (1 - f_step));
	let h4 = height - 1;
	let hh = h3;
	if (h2 < hh)
		hh = h2;
	if (h4 < hh)
		hh = h4;
	console.log("# ", { n, h2, h3, h4, hh });
	n++;
	nh = hh;
	height = nh;
}

count = n - 1;

height = height0;
nh = height;
n = 0;

while (nh <= 16000 && nh <= 5 * height0) {
	if (n > 0) {
		console.log("# target:", { width, nh, top: 5 * height0 });
		console.log(`if ! test -f DERIVSRC-${dstname}-USIZE-${width}x${nh}${dstext} ; then
			magick ${src}   -resize 'x${nh}' -quality 95   DERIVSRC-${dstname}-USIZE-${width}x${nh}${dstext}   &
		fi`);
	}
	
	let h2 = height + px_step;
	let h3 = Math.ceil(height * (1 + f_step));
	let h4 = height + 1;
	let hh = h3;
	if (h2 > hh)
		hh = h2;
	if (h4 > hh)
		hh = h4;
	console.log("# ", { n, h2, h3, h4, hh });
	n++;
	nh = hh;
	height = nh;
}

count += n - 1;
console.log("# ", { count })
