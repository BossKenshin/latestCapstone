<?php
include '/xampp/htdocs/capstone/dbconnect.php';

$id = str_replace( "'" ,"''",htmlspecialchars($_GET['dept']));


$filessql = "SELECT gfid, CONCAT(teacher.teacher_firstname,' ', teacher.teacher_middlename,' ', teacher.teacher_lastname) as teacher_fullname,  filename, subject.subject_code, course.course_abbreviation, subject.year_level FROM `gradefiles` 
INNER JOIN subject ON gradefiles.subject_id = subject.subject_id
INNER JOIN course ON gradefiles.course_id = course.course_id
INNER JOIN teacher ON gradefiles.teacher_id = teacher.teacher_id
INNER JOIN department ON course.dept_id = department.dept_id
where department.dept_id = '$id'  AND dept_status = 'pending'";


$res = mysqli_query($conn,$filessql);

$files_array = array();

while ($row = mysqli_fetch_assoc($res)) {
    $files_array[] = $row;
}


 echo json_encode($files_array);

?>