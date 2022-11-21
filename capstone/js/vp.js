
setPendingTable();

function setPendingTable() {

    $(document).ready(function () {

        //var year = document.getElementById("StudentYear").value;
        var deptid = 5;


        $.ajax({
            url: "./sql_functions/vp.fetch.pending.grades.list.php",
            success: function (data) {


                var pendingData = JSON.parse(data);


                $('#pendingTable').DataTable({
                    data: pendingData,
                    columns: [
                        { data: 'gfid' },
                        { data: 'teacher_fullname' },
                        { data: 'subject_code' },
                        { data: 'course_abbreviation' },
                        { data: 'year_level' },
                        { data: 'filename' },
                        {
                            data: 'null',
                            className: "view btn-outline-dark",
                            defaultContent: '<i class="bi bi-file-earmark-arrow-down"></i>',
                            orderable: false
                        },
                        {
                            data: 'null',
                            className: "approve ",
                            defaultContent: '<i class="bi bi-check-circle-fill"></i>',
                            orderable: false
                        },
                        {
                            data: 'null',
                            className: "reject",
                            defaultContent: '<i class="bi bi-x-circle-fill"></i>',
                            orderable: false
                        }


                    ],

                });


            }
        })


    });
}

$("#pendingTable").on("click", "td.view", function (e) {

    var currentRow = $(this).closest("tr");
    var col1 = currentRow.find("td:eq(0)").text(); // get current row 1st TD value
    var col2 = currentRow.find("td:eq(1)").text(); // get current row 2nd TD
    var col3 = currentRow.find("td:eq(2)").text(); // get current row 3rd TD
    var col4 = currentRow.find("td:eq(3)").text(); // get current row 4th TD
    var col5 = currentRow.find("td:eq(4)").text(); // get current row 5th TD
    var col6 = currentRow.find("td:eq(5)").text(); // get current row 6th TD

    document.getElementById("viewExcelLabel").innerHTML = col2;
    

    //alert(col1 + " " + col2 + " " + col3 + " " + col4 + " " + col5 + " " + col6);

                        var filename = col6;
                        download(filename);


})

       function download(filename){

        var element = document.createElement('a');
        element.setAttribute('href','./superFiles/'+filename);
       element.setAttribute('download', filename);
        document.body.appendChild(element);
        element.click();
        document.body.removeChild(element);

       }




  $("#pendingTable").on("click", "td.approve", function (e) {
    var currentRow = $(this).closest("tr");
    var col1 = currentRow.find("td:eq(0)").text(); // get current row 1st TD value


    $.ajax({
            url: "./sql_functions/vp.update.pending.grade.php",
            dataType: "script",
            data:
            {
                id: col1,
                val: 'approved'

            },
            success: function (data) {

                if(data == 0){
                    Swal.fire({
                        icon: "success",
                        title: "Grades Approved",
                      });  

                      $('#pendingTable').DataTable().clear().destroy();
                      setPendingTable();

                }
                else{
                    Swal.fire({
                        icon: "error",
                        title: "Unable to Approve",
                      });  
                }


            }
        })
  })



  
  $("#pendingTable").on("click", "td.reject", function (e) {
    var currentRow = $(this).closest("tr");
    var col1 = currentRow.find("td:eq(0)").text(); // get current row 1st TD value


    $.ajax({
            url: "./sql_functions/vp.update.pending.grade.php",
            dataType: "script",
            data:
            {
                id: col1,
                val: 'rejected'

            },
            success: function (data) {

                if(data == 0){
                    Swal.fire({
                        icon: "warning",
                        title: "Grades Rejected",
                      });  

                      $('#pendingTable').DataTable().clear().destroy();
                      setPendingTable();

                }
                else{
                    Swal.fire({
                        icon: "error",
                        title: "Unable to Reject",
                      });  
                }


            }
        })
  })
