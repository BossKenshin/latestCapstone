<?php
include '/xampp/htdocs/capstone/dbconnect.php';



$st = str_replace( "'" ,"''",htmlspecialchars($_GET['stname']));
$subject = str_replace( "'" ,"''",htmlspecialchars($_GET['subject']));
$grade = str_replace( "'" ,"''",htmlspecialchars($_GET['grade']));
$teacherid = str_replace( "'" ,"''",htmlspecialchars($_GET['tid']));



$insertCompletion = "INSERT INTO `completion` (`teacherid`,`subjectid`, `student_schoolid`, `grade`) 
VALUES ('$teacherid','$subject','$st','$grade')";

$res = mysqli_query($conn, $insertCompletion);

if($res){
echo 1;
}
else{
echo 0;
}



?>
