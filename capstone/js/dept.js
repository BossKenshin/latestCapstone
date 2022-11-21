
setPendingTable();

function setPendingTable() {

    $(document).ready(function () {

        //var year = document.getElementById("StudentYear").value;
        var deptid = 5;


        $.ajax({
            url: "./sql_functions/fetch.pending.grades.list.php",
            data:
            {
                dept: deptid

            },
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
                            defaultContent: '<i class="bi bi-search"></i>',
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
    alert(col1 + " " + col2 + " " + col3 + " " + col4 + " " + col5 + " " + col6);
    $("#viewExcel").modal("show");


})