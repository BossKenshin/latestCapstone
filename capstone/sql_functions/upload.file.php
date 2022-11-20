<?php
include '/xampp/htdocs/capstone/dbconnect.php';


$file_size = $_FILES['file']['size'];
$file_tmp = $_FILES['file']['tmp_name'];
$file_type = $_FILES['file']['type'];

$chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_";
$password = substr( str_shuffle( $chars ), 0, 8 );


$file_name =  $_FILES['file']['name'];
$new_file_name = str_replace(" ", "", $file_name);

$newstr = substr_replace($new_file_name, $password, 10, 0);

$dept = str_replace( "'" ,"''",htmlspecialchars($_POST['dept']));
$course = str_replace( "'" ,"''",htmlspecialchars($_POST['course']));
$subject = str_replace( "'" ,"''",htmlspecialchars($_POST['subject']));
// $teacherid = str_replace( "'" ,"''",htmlspecialchars($_GET['sem']));



$insertFile = "INSERT INTO `gradefiles`( `teacher_id`, `department_id`, `course_id`, `subject_id`, `dept_status`, `vp_status`, `filename`) 
VALUES (5,'$dept','$course','$subject','pending','pending','$newstr')";

$res = mysqli_query($conn, $insertFile);

if($res){
move_uploaded_file($file_tmp,"C:/xampp/htdocs/capstone/superFiles/".$newstr);
echo 1;
}
else{
echo 0;
}



?>
