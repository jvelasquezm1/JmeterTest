let fs = require('fs');
let csvInFile = process.argv.slice(2)[0];
let csvOutFile = process.argv.slice(2)[1];
let arrOutResultId = [];

fs.readFile(csvOutFile, 'utf8', function (err, data) {
    let rows = data.split('\n');
    let rowsOut = rows.map(line => line.split(';'));
    rowsOut.filter(line => line[3] !== undefined ? arrOutResultId.push(line[3]) : '');
});

fs.readFile(csvInFile, 'utf8', function (err, data) {
    let linesExceptFirst = data.split('\n');
    let linesArr = linesExceptFirst.map(line => line.split(';'));
    for (let i = 0; i < arrOutResultId.length; i++) {
        let output = linesArr.filter(line => !arrOutResultId.includes(line[3])).join("\n");
        let semicolonOutput = output.replace(/,/g, ';');
        fs.writeFileSync(csvInFile, semicolonOutput);
    }
});
