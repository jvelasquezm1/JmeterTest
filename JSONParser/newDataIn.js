let fs = require('fs');
let csvInFile = process.argv.slice(2)[0];
let csvOutFile = process.argv.slice(2)[1];

function readContent(callback) {
    fs.readFile(csvOutFile, 'utf8', function (err, data) {
        let rows = data.split('\n');
        let rowsOut = rows.map(line => line.split(';'));
        callback(null, rowsOut.length)
    });
}

function updateFile(rowsOut) {
    console.log('-----------------READ IN FILE-----------------')
    fs.readFile(csvInFile, 'utf8', async function (err, data) {
        let linesExceptFirst = data.split('\n');
        let linesArr = linesExceptFirst.map(line => line.split(';'));
        const output = linesArr.splice(rowsOut, linesExceptFirst.length - 1).join("\n");
        const header = 'patientId;assessmentId;resultId\n';
        const outputHeader = header.concat(output);
        fs.writeFileSync(csvInFile, outputHeader);
        fs.writeFileSync(csvOutFile, []);
    });
}

console.log('-----------------START DATA IN UPDATE-----------------')
readContent(function (err, content) {
    updateFile(content);
})