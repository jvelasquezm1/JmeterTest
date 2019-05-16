let XLSX = require('xlsx');
let fs = require('fs');
let workbook = XLSX.readFile('../Params.xlsx');
let sheet_name_list = workbook.SheetNames;
params = [];
sheet_name_list.forEach(function(y) {
    let worksheet = workbook.Sheets[y];
    let headers = {};
    let data = [];
    for(sheets in worksheet) {
        if(sheets[0] === '!') continue;
        let col = sheets.substring(0,1);
        let row = parseInt(sheets.substring(1));
        let value = worksheet[sheets].v;
        if(row == 1) {
            headers[col] = value;
            continue;
        }

        if(!data[row]) data[row]={};
        data[row][headers[col]] = value;
    }
    data.map(row => {
        let rowParams = {};
        if(row['Concurrence Users']){
            row['Concurrence Users'] ? rowParams.concurrency = row['Concurrence Users'].toString() : rowParams.concurrency = 0;
            row['Total Duration/Loops'] ? rowParams.duration_loops = row['Total Duration/Loops'].toString() : rowParams.duration_loops = 0;
            row['Type'] ? rowParams.d_type = row['Type'].toString() : [];
            row['Ramp-Up'] ? rowParams.rampup = row['Ramp-Up'].toString() : rowParams.rampup = 0;
            row['Jmeter Script'] ? rowParams.script = row['Jmeter Script'].toString() : [];
            params.push(rowParams)
        }
    })
    const jsonParams = {params}
    fs.writeFile('Params.json', JSON.stringify(jsonParams), function(err) {
        if (err) {
            console.log(err);
        }
    });
});