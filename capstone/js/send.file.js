var boxes= document.getElementsByClassName("box");
for (var i=0; i<boxes.length; i++) {
 let status =  boxes[i].dataset.show;
    if(status == "hidden"){
        boxes[i].style.display = "none";
    }
}



$("#btnbox1").click(function () {

  _deptDropdown();
  $("#semSelect").val("0").change();
  $("#subjectSelect").empty();
  $("#courseSelect").empty();
  $("#yearSelect").val("1st").change();
  $("#fileExcel").val("");

})

function switchDiv(id){

  if(id == "btnbox1"){
    document.getElementById("box2").dataset.show = "hidden";
    document.getElementById("box2").style.display = "none";
    document.getElementById("box3").dataset.show = "hidden";
    document.getElementById("box3").style.display = "none";


    document.getElementById("box1").dataset.show = "active";
    document.getElementById("box1").style.display = "unset";


  }
  else if(id == "btnbox2"){
    document.getElementById("box1").dataset.show = "hidden";
    document.getElementById("box1").style.display = "none";
    document.getElementById("box3").dataset.show = "hidden";
    document.getElementById("box3").style.display = "none";



    document.getElementById("box2").dataset.show = "active";
    document.getElementById("box2").style.display = "unset";
  }

  else{
    document.getElementById("box1").dataset.show = "hidden";
    document.getElementById("box1").style.display = "none";
    document.getElementById("box2").dataset.show = "hidden";
    document.getElementById("box2").style.display = "none";


    document.getElementById("box3").dataset.show = "active";
    document.getElementById("box3").style.display = "unset";

  }
}



_deptDropdown();


function _deptDropdown() {
  $(document).ready(function () {
    $.ajax({
      url: "./sql_functions/fetch.department.php",
      success: function (data) {
        var result = JSON.parse(data);
        // alert("done saving data");
        var element = document.getElementById("deptSelect");
        $("#deptSelect").empty();

        let ops = document.createElement("option");
        ops.value = "0";
        ops.hidden = true;
        ops.innerHTML = "Select Department";
        element.appendChild(ops);

        for (var i = 0; i < result.length; i++) {
          let op = document.createElement("option");

          if (
            result[i].dept_name != "Unassigned" &&
            result[i].dept_name != "Resigned"
          ) {
            op.value = result[i].dept_id;
            op.textContent = result[i].dept_name;

            element.append(op);
          }
        }
      },
    });
  });
}



$("#deptSelect")
.change(function () {
$("#deptSelect option:selected").each(function () {
  // state here what happens if the selected option is selected
  var dept_id = $(this).val();
  var dept_name = $(this).text();

  //var elementDropdown = document.getElementById("chooseDept");

  _courseDropdown(dept_name);
    $("#yearSelect").val("1st").change();

  $("#semSelect").val("0").change();
  $("#subjectSelect").empty();


});
})
.change();



function _courseDropdown(department) {
  $(document).ready(function () {
  $.ajax({
    url: "./sql_functions/fetch.course.php",
    success: function (data) {
      var result = JSON.parse(data);
      // alert("done saving data");
  
      var element = document.getElementById("courseSelect");
  
      $("#courseSelect").empty();
  
      let ops = document.createElement("option");
      ops.value = "0";
      ops.innerHTML = "Choose Course";
      element.appendChild(ops);
  
      for (var i = 0; i < result.length; i++) {
        let op = document.createElement("option");
  
        if (result[i].dept == department) {
          op.value = result[i].course_id;
          op.textContent = result[i].course_abbreviation;
  
          element.append(op);
        }
      }
    },
  });
  });
  }


  

$("#courseSelect")
.change(function () {
$("#courseSelect option:selected").each(function () {
  // state here what happens if the selected option is selected


  //var elementDropdown = document.getElementById("chooseDept");

    $("#yearSelect").val("1st").change();
 // $("#semSelect").val("0").change();
  $("#subjectSelect").empty();


});
})
.change();



$("#yearSelect")
.change(function () {
$("#yearSelect option:selected").each(function () {

  var sem = document.getElementById("semSelect").value;
  var dept = document.getElementById("deptSelect").value;
  var course = document.getElementById("courseSelect").value;
  var year =  $(this).val();

  if(sem != 0 && dept != 0 && dept != "" && course != 0 && course != ""){
    $("#subjectSelect").empty();

    _subjectDropdown(dept, course, year, sem);

  }
  else{

  $("#semSelect").val("0").change();
  $("#subjectSelect").empty();

  }



});
})
.change();



  
$("#semSelect")
.change(function () {
$("#semSelect option:selected").each(function () {
  // state here what happens if the selected option is selected
  var sem = $(this).val();
  var dept = document.getElementById("deptSelect").value;
  var course = document.getElementById("courseSelect").value;
  var year = document.getElementById("yearSelect").value;

  


  //var elementDropdown = document.getElementById("chooseDept");
  if(sem != 0){
  _subjectDropdown(dept, course, year, sem);
  }
  else{

    $("#subjectSelect").empty();

  }


});
})
.change();




function _subjectDropdown(department, course, year, semester) {
  $(document).ready(function () {
  $.ajax({
    url: "./sql_functions/teacher.fetch.subject.php",
    data:
    {
      "dept": department,
      "course": course,
      "year": year,
      "sem": semester
    },
    success: function (data) {
      var result = JSON.parse(data);
      // alert("done saving data");
  
      var element = document.getElementById("subjectSelect");
  
      $("#subjectSelect").empty();
  
      let ops = document.createElement("option");
      ops.value = "0";
      ops.innerHTML = "Choose Subject";
      element.appendChild(ops);
  
      for (var i = 0; i < result.length; i++) {
        let op = document.createElement("option");
  
          op.value = result[i].id;
          op.textContent = result[i].subject;
  
          element.append(op);
        
      }
    }
  });
  });
  }

  var selectedFile;
document.getElementById("fileExcel").addEventListener("change", (event) => {
  document.getElementById("errorText").innerHTML = "";

  selectedFile = event.target.files[0];
  fileChecker();
});



var rowGradesList;

  function fileChecker(){
    let fileReader = new FileReader();
    fileReader.readAsBinaryString(selectedFile);
    fileReader.onload = (event) => {
      let data = event.target.result;
      let workbook = XLSX.read(data, { type: "binary" });
      workbook.SheetNames.forEach((sheet) => {
        rowGradesList = XLSX.utils.sheet_to_row_object_array(
          workbook.Sheets[sheet]
        );
      });

      var regExp = /[a-zA-Z]/;
      var len = rowGradesList.length;
      var _hasrun = false;

      for (var i = 0; i < rowGradesList.length; i++) {
        if (rowGradesList[i].hasOwnProperty("SchoolID") && rowGradesList[i].hasOwnProperty("Fullname") && rowGradesList[i].hasOwnProperty("Grade") ) {
          
          document.getElementById("errorText").innerHTML = "Correct File";

        } else {
          Swal.fire({
            icon: "error",
            title: "Seems like wrong excel file!",
            text: "Please select a correct file",
          });       
          document.querySelector("#fileExcel").value = "";

        }
      }

    };
  }



  $("#addGrades").click(function () {
    var dept = document.getElementById("deptSelect").value;
    var course = document.getElementById("courseSelect").value;
    var year = document.getElementById("yearSelect").value;
    var sem = document.getElementById("semSelect").value;
    var subject = document.getElementById("subjectSelect").value;
    
    if(selectedFile && dept != "" && dept != 0 && course != 0 && course != "" && year != "" &&  sem != "" && subject != "" && subject != 0){

      

        //var filename = $('#filename').val();                    //To save file with this name
        var file_data = $('#fileExcel').prop('files')[0];    //Fetch the file
        var form_data = new FormData();



        form_data.append("file",file_data);  
        form_data.append('dept', dept);
        form_data.append('course', course);
        form_data.append('year', year);
        form_data.append('sem', sem);
        form_data.append('subject', subject);
       // form_data.append("filename",filename);
        //Ajax to send file to upload
        $.ajax({
            url: "./sql_functions/upload.file.php",                      //Server api to receive the file
                   type: "POST",
                   dataType: 'script',
                   cache: false,
                   contentType: false,
                   processData: false,
                   data: form_data,
                success:function(dat2){
                  if(dat2==1) 
                  {
                    Swal.fire({
                      icon: "success",
                      title: "File submitted ",
                    });       
                    _deptDropdown();
                    $("#semSelect").val("0").change();
                    $("#subjectSelect").empty();
                    $("#courseSelect").empty();
                    $("#yearSelect").val("1st").change();


                    $('#gradesFileTable').DataTable().clear().destroy();

                    setGradesList();
                    $('#fileExcel').val('');
                  }
                  else alert("Unable to Upload");
                }
          });


    }
    else{
  
      if(!selectedFile){
          document.getElementById("errorText").innerHTML = "Select a File";
      }
      Swal.fire({
        icon: "error",
        title: "Oops...",
        text: "Please fill out the missing details!!",
      });
    }
  
    })

    setGradesList();
    
function setGradesList() {

  $(document).ready(function () {

      
let tid = 5;

      $.ajax({
          url: "./sql_functions/teacher.grades.files.php",
          data: 
          {
             teacher: tid
          },
          success: function (data) {
              var filesData = JSON.parse(data);

          if(filesData.length != 0){

                    document.getElementById("gradesFileTable").style.visibility = 'unset';


                $('#gradesFileTable').DataTable({
                  "sScrollY": "500",
                  "bScrollCollapse": true,
                  
                    data: filesData,
                    columns: [
                        { data: 'filename', },
                        { data: 'subject_code' },
                        { data: 'course_abbreviation', },
                        { data: 'year_level' },
                        { data: 'dept_status' },
                        { data: 'vp_status' }
          
                    ],
                    
        
                });

                changeColor();

          }
          else{

              document.getElementById("gradesFileTable").style.visibility = 'hidden';
          }

          }
      })


  });
}


function changeColor(){
  var _row = document.querySelectorAll("#gradesFileTable tbody tr");
  var val = [];
  var val2=[];
  // alert(_row.length);

  for (let i = 0; i < _row.length; i++) {
    val.push(
      $("#gradesFileTable")
        .find("tbody tr:eq(" + i + ")")
        .find("td:eq(5)")
        .text()
    );
    val2.push(
      $("#gradesFileTable")
        .find("tbody tr:eq(" + i + ")")
        .find("td:eq(4)")
        .text()
    );
  }

  for (let j = 0; j < val.length; j++) {
      if (val[j] == "pending") {
        $("#gradesFileTable")
          .find("tbody tr:eq(" + j + ")")
          .find("td:eq(5)")
          .addClass("bi bi-clock text-warning")
        .text("");
      }
      else{
        $("#gradesFileTable")
        .find("tbody tr:eq(" + j + ")")
        .find("td:eq(5)")
        .addClass("bi bi-check-circle-fill text-success")
        .text("");
      }
  }


  for (let j = 0; j < val.length; j++) {
    if (val2[j] == "pending") {
      $("#gradesFileTable")
        .find("tbody tr:eq(" + j + ")")
        .find("td:eq(4)")
        .addClass("bi bi-clock text-warning")
        .text("");
    }
    else{
      $("#gradesFileTable")
      .find("tbody tr:eq(" + j + ")")
      .find("td:eq(4)")
      .addClass("bi bi-check-circle-fill text-success")
      .text("");
    }
}
}
