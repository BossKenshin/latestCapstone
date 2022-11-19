<?php
include '/xampp/htdocs/capstone/dbconnect.php';

 

$name = str_replace( "'" ,"''",htmlspecialchars($_GET['subject']));
$code = str_replace( "'" ,"''",htmlspecialchars($_GET['code']));
$course =  str_replace( "'" ,"''",htmlspecialchars($_GET['course']));
$year =  str_replace( "'" ,"''",htmlspecialchars($_GET['year']));
$sem =  str_replace( "'" ,"''",htmlspecialchars($_GET['sem']));






$inset_sub = "INSERT INTO `subject` (subject_name, subject_code, course_id, year_level, semester) 
VALUES ('$name', '$code','$course','$year', '$sem')";

$res = mysqli_query($conn,$inset_sub);


if($res){
    echo "{\"res\" : \"success\"}";
}else{
   echo "{\"res\" : \"error\"}";
}

?>