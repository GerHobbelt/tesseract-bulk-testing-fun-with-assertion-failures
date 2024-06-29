//
//
//

function cvt_to_data(line) {
	line = line.trim();
	if (line.length === 0)
		return null;
	
	let a = line.split('-debug-2');
	let b = a[1].split(':real');
	let t = b[1].split('m');
	let s = t[1].split('s');
	
	let duration = 1.0 * t[0].trim();
	duration *= 60;
	duration += 1.0 * s[0];
	
	let suspect = (duration > 2.5 * 60 || isNaN(duration));
	
	let name = a[0].replace(/^.*RUN_data-/, '');
	
	//console.log({a,b,t,s,name, duration});
	return { name, duration, suspect };
}
	


process.stdin.resume();
process.stdin.setEncoding('utf8');

let records = [];

let surplus = "";

process.stdin.on('data', function(chunk) {
	surplus += chunk;
    let lines = surplus.split("\n");

    surplus = lines.pop();

	try {
		lines = lines
		.map(cvt_to_data)
		.map(function (line) { return JSON.stringify(line); });
	} catch (ex) {
		console.log({ex, lines});
	}

	records = records.concat(lines);
	
    console.log('\n' + lines.join('\n') + '\n');
    console.log({count: records.length});
});

process.stdin.on('end', function() {
    let lines = surplus.split("\n");

	try {
		lines = lines
		.map(cvt_to_data)
		.map(function (line) { return JSON.stringify(line); });
	} catch (ex) {
		console.log({ex, lines});
	}

	records = records.concat(lines);
	records = records
	.filter(function (line) { return line.length > 0; });
	
    console.log('\n' + lines.join('\n') + '\n');
    console.log({count: records.length});
});
