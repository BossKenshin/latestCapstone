<?php
include '/xampp/htdocs/capstone/dbconnect.php';

$id = str_replace( "'" ,"''",htmlspecialchars($_GET['id']));
$val = str_replace( "'" ,"''",htmlspecialchars($_GET['val']));


$app_sql = "UPDATE gradefiles SET dept_status = '$val'  WHERE gfid = '$id'";


$res = mysqli_query($conn,$app_sql);

if($res){
echo 0;
}
else{
    echo 1;
}

?>