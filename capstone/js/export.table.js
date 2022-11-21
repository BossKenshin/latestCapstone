// function exportTableToExcel(tableID, filename = ''){
//     var downloadLink;
//     var dataType = 'application/vnd.ms-excel';
//     var tableSelect = document.getElementById(tableID);
//     var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
    
//     // Specify file name
//     filename = filename?filename+'.xlsx':'excel_data.xlsx';
    
//     // Create download link element
//     downloadLink = document.createElement("a");
    
//     document.body.appendChild(downloadLink);
    
//     if(navigator.msSaveOrOpenBlob){
//         var blob = new Blob(['\ufeff', tableHTML], {
//             type: dataType
//         });
//         navigator.msSaveOrOpenBlob( blob, filename);
//     }else{
//         // Create a link to the file
//         downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
    
//         // Setting the file name
//         downloadLink.download = filename;
        
//         //triggering the function
//         downloadLink.click();
//     }
// }

function html_table_to_excel(type, id)
{
    var data = document.getElementById(id);

    var file = XLSX.utils.table_to_book(data, {sheet: "sheet1"});

    XLSX.write(file, { bookType: type, bookSST: true, type: 'base64' });

    XLSX.writeFile(file, 'file.' + type);
}


