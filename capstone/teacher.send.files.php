<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Dashoard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="style/system.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">
    <script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.2/xlsx.full.min.js" integrity="sha512-qilAGdDSZ5c0sTjizcSCffmIb8D2rHttMYGUxtI3OFn8lB29BlU2tEUcPesHHLQ2t0Y5TInglWKY6V3GoSK0IA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


</head>

<body>





    <div class="container-fluid row" id="whole-container">

        <div class="col-2" id="sidebar">

            <?php include '/xampp/htdocs/capstone/config/teacher.sidebar.php'    ?>


        </div>

        <div class="col-10 " id="content">

            <div class="container-fluid" id="samp-header">
                <p class="h4">Files </p>
                <hr>
                <button class="btns btn btn-secondary" id="btnbox1" onclick="switchDiv(this.id)">Attach Grades</button>
                <button class="btns btn btn-secondary" id="btnbox2" onclick="switchDiv(this.id)">Second</button>
                <button class="btns btn btn-secondary" id="btnbox3" onclick="switchDiv(this.id)">Third</button>
            </div>



            <div class="container bg-light" id="boxes">

                <div class="box bg-light shadow" id="box1" data-show="active">
                    <div class="h4 m-2">Attach Grades</div>
                    <div class="row p-4">
                        <div class="col-4">
                            <label for="deptSelect">Department</label>
                            <select id="deptSelect" class="form-select ">

                            </select>
                        </div>
                        <div class="col-4">
                            <label for="courseSelect">Course</label>
                            <select id="courseSelect" class="form-select ">

                            </select>
                        </div>
                        <div class="col-4">
                            <label for="yearSelect">Year Level</label>
                            <select id="yearSelect" class="form-select ">
                                <option value="1st">1st Year</option>
                                <option value="2nd">2nd Year</option>
                                <option value="3rd">3rd Year</option>
                                <option value="4th">4th Year</option>
                            </select>
                        </div>
                    </div>

                    <div class="row p-4">

                        <div class="col-4">

                            <label for="semSelect">Semester</label>
                            <select id="semSelect" class="form-select ">
                                <option value="0">Choose Semester </option>
                                <option value="1st">1st </option>
                                <option value="2nd">2nd </option>
                                <option value="Summer">Summer</option>
                            </select>



                        </div>
                        <div class="col-4">
                            <label for="subjectSelect">Subject</label>
                            <select id="subjectSelect" class="form-select">
                            </select>
                        </div>

                        <div class="col-4">
                            <label for="fileExcel">Excel File</label>
                            <input type="file" name="fileExcel" id="fileExcel" accept=".xls, .xlsx" />
                            <p class="h6 text-danger" id="errorText"></p>

                        </div>
                        <div class="col-4">
                            <button type="button" class="btn btn-primary mt-4" id="addGrades">Submit Grades</button>

                        </div>


                    </div>
                    <hr>

                    <div class="row mt-4 p-4">
                        <p class="h5">Grade Files List</p>

                        <table id="gradesFileTable" class="display text-center mt-4" width="100%">
                            <thead>
                                <tr>
                                    <th>Filename</th>
                                    <th>Subject</th>
                                    <th>Course</th>
                                    <th>Year Level</th>
                                    <th>Department status</th>
                                    <th>VP Status</th>
                                </tr>
                            </thead>

                            <tbody>

                            </tbody>


                        </table>
                    </div>



                </div>
                <div class="box bg-light shadow" id="box2" data-show="hidden">
                    <div class="h4 m-2">Attach Grades</div>
                    <div class="row p-4">
                        <div class="col-4">
                            <label for="deptSelect2">Department</label>
                            <select id="deptSelect2" class="form-select ">

                            </select>
                        </div>
                        <div class="col-4">
                            <label for="courseSelect2">Course</label>
                            <select id="courseSelect2" class="form-select ">

                            </select>
                        </div>
                        <div class="col-4">
                            <label for="yearSelect2">Year Level</label>
                            <select id="yearSelect2" class="form-select ">
                                <option value="1st">1st Year</option>
                                <option value="2nd">2nd Year</option>
                                <option value="3rd">3rd Year</option>
                                <option value="4th">4th Year</option>
                            </select>
                        </div>

                        <div class="row mt-3 p-4">

                            <div class="col-4">

                                <label for="semSelect2">Semester</label>

                                <select id="semSelect2" class="form-select ">
                                    <option value="0">Choose Semester </option>
                                    <option value="1st">1st </option>
                                    <option value="2nd">2nd </option>
                                    <option value="Summer">Summer</option>
                                </select>



                            </div>
                            <div class="col-4">
                                <label for="subjectSelect2">Subject</label>
                                <select id="subjectSelect2" class="form-select">
                                </select>
                            </div>

                            <div class="col-4">
                                <label for="">Student Code </label>
                                <br>
                                <i>(type name of student. autosuggest)</i>
                                <input class="form-control" type="text" list="studentList" onfocus="setStudentSearchBar()" name="" id="stname">
                                
                                <datalist id="studentList">

                                </datalist>

                            </div>
                            <div class="col-4">
                                <label for="finalgrade">Final Grade</label>
                                    <input type="number" class="form-control"  id="finalgrade"  min="1" max="5">
                            </div>
                            <div class="col-4">
                                <button type="button" class="btn btn-primary mt-4" id="submitSpecGrade">Submit Grade</button>

                            </div>


                        </div>


                    </div>
                </div>
                <div class="box" id="box3" data-show="hidden"></div>

            </div>



        </div>


    </div>

    </div>

    <script src="./js/send.file.js"></script>
    <script src="./js/send.completion.js"></script>
    <script src="./js/export.table.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>



</html>