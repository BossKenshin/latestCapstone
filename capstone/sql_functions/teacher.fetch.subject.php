<?php
include '/xampp/htdocs/capstone/dbconnect.php';

$dept = str_replace( "'" ,"''",htmlspecialchars($_GET['dept']));
$course = str_replace( "'" ,"''",htmlspecialchars($_GET['course']));
$year = str_replace( "'" ,"''",htmlspecialchars($_GET['year']));
$sem = str_replace( "'" ,"''",htmlspecialchars($_GET['sem']));

$fetch_sub = "SELECT subject.subject_id as id, subject.subject_name as subject FROM `subject` 
INNER JOIN course ON subject.course_id = course.course_id
INNER JOIN department ON course.dept_id = department.dept_id 
WHERE department.dept_id = '$dept' AND course.course_id = '$course' AND subject.year_level = '$year' AND subject.semester = '$sem';";
$res = mysqli_query($conn,$fetch_sub);

$subject_array = array();

while ($row = mysqli_fetch_assoc($res)) {
    $subject_array[] = $row;
}


 echo json_encode($subject_array);

?>