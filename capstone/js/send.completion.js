

_deptDropdown2();

$("#btnbox2").click(function () {

    _deptDropdown2();
    $("#semSelect2").val("0").change();
    $("#subjectSelect2").empty();
    $("#courseSelect2").empty();
    $("#yearSelect2").val("1st").change();
})

function _deptDropdown2() {
  $(document).ready(function () {
    $.ajax({
      url: "./sql_functions/fetch.department.php",
      success: function (data) {
        var result = JSON.parse(data);
        // alert("done saving data");
        var element = document.getElementById("deptSelect2");
        $("#deptSelect2").empty();

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



$("#deptSelect2")
.change(function () {
$("#deptSelect2 option:selected").each(function () {
  // state here what happens if the selected option is selected
  var dept_id = $(this).val();
  var dept_name = $(this).text();

  //var elementDropdown = document.getElementById("chooseDept");

  _courseDropdown2(dept_name);
    $("#yearSelect2").val("1st").change();

  $("#semSelect2").val("0").change();
  $("#subjectSelect2").empty();


});
})
.change();



function _courseDropdown2(department) {
  $(document).ready(function () {
  $.ajax({
    url: "./sql_functions/fetch.course.php",
    success: function (data) {
      var result = JSON.parse(data);
      // alert("done saving data");
  
      var element = document.getElementById("courseSelect2");
  
      $("#courseSelect2").empty();
  
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


  

$("#courseSelect2")
.change(function () {
$("#courseSelect2 option:selected").each(function () {
  // state here what happens if the selected option is selected


  //var elementDropdown = document.getElementById("chooseDept");

    $("#yearSelect2").val("1st").change();
 // $("#semSelect").val("0").change();
  $("#subjectSelect2").empty();


});
})
.change();



$("#yearSelect2")
.change(function () {
$("#yearSelect2 option:selected").each(function () {

  var sem = document.getElementById("semSelect2").value;
  var dept = document.getElementById("deptSelect2").value;
  var course = document.getElementById("courseSelect2").value;
  var year =  $(this).val();

  if(sem != 0 && dept != 0 && dept != "" && course != 0 && course != ""){
    $("#subjectSelect2").empty();

    _subjectDropdown2(dept, course, year, sem);

  }
  else{

  $("#semSelect2").val("0").change();
  $("#subjectSelect2").empty();

  }



});
})
.change();



  
$("#semSelect2")
.change(function () {
$("#semSelect2 option:selected").each(function () {
  // state here what happens if the selected option is selected
  var sem = $(this).val();
  var dept = document.getElementById("deptSelect2").value;
  var course = document.getElementById("courseSelect2").value;
  var year = document.getElementById("yearSelect2").value;

  


  //var elementDropdown = document.getElementById("chooseDept");
  if(sem != 0){
  _subjectDropdown2(dept, course, year, sem);
  }
  else{

    $("#subjectSelect2").empty();

  }


});
})
.change();




function _subjectDropdown2(department, course, year, semester) {
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
  
      var element = document.getElementById("subjectSelect2");
  
      $("#subjectSelect2").empty();
  
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


  function setStudentSearchBar() {

    var course = document.getElementById("courseSelect2").value;
    var year = document.getElementById("yearSelect2").value;

    console.log(course + " " + year);

    $.ajax({
      url: "./sql_functions/fetch.list.student.pros.php",
      data:{
            course: course,
            year: year
      },
      success: function (data) {
        var result = JSON.parse(data);

         console.log(result);

        var element = document.getElementById("studentList");

        $("#studentList").empty();


        for (var i = 0; i < result.length; i++) {
          let op = document.createElement("option");

            op.value = result[i].school_id;
            op.textContent = result[i].fullname;
            element.append(op);
          
        }




      }
    });
}


$("#submitSpecGrade").click(function() {

  var subject = document.getElementById("subjectSelect2").value;
  var stname = document.getElementById("stname").value;
  var grade  = document.getElementById("finalgrade").value
  var tid = 5;


  if(subject != "" && subject != 0 && stname != "" && stname != 0 && grade != "" && grade != 0 && tid != "") {

  $.ajax({
    url: "./sql_functions/upload.completion.php",                      //Server api to receive the file
           type: "GET",
           dataType: 'script',
           data: {
            "subject": subject,
            "stname": stname,
            "grade": grade,
           "tid": tid
           },
        success:function(dat2){
          if(dat2==1) 
          {
            Swal.fire({
              icon: "success",
              title: "Grade submitted ",
            });       

            _deptDropdown2();
            $("#semSelect2").val("0").change();
            $("#subjectSelect2").empty();
            $("#courseSelect2").empty();
            $("#yearSelect2").val("1st").change();
            $("#stname").val("");
            $("#finalgrade").val("");




            // $('#gradesFileTable').DataTable().clear().destroy();

            // setGradesList();
            
          }
          else alert("Unable to Upload");
        }
  });

}
else{
  Swal.fire({
    icon: "error",
    title: "Oops...",
    text: "Please fill out the missing details!!",
  });
}



});