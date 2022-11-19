<?php
include '/xampp/htdocs/capstone/dbconnect.php';


$file_size = $_FILES['file']['size'];
$file_tmp = $_FILES['file']['tmp_name'];
$file_type = $_FILES['file']['type'];

$chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%&*_";
$password = substr( str_shuffle( $chars ), 0, 8 );


$file_name =  $_FILES['file']['name'];
$new_file_name = str_replace(" ", "", $file_name);

$newstr = substr_replace($new_file_name, $password, 10, 0);

$insertFile = "INSERT INTO `gradefiles`( `teacher_id`, `department_id`, `course_id`, `subject_id`, `dept_status`, `vp_status`, `filename`) 
VALUES (3','[value-3]','[value-4]','[value-5]','[value-6]','[value-7]','[value-8]')";


if(move_uploaded_file($file_tmp,"C:/xampp/htdocs/capstone/superFiles/".$newstr)){
    echo 1;
}
else{
    echo 0;
}


?>
