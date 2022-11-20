<?php
include '/xampp/htdocs/capstone/dbconnect.php';

$filessql = "SELECT filename, subject.subject_code, course.course_abbreviation, subject.year_level, dept_status, vp_status FROM `gradefiles` 
INNER JOIN subject ON gradefiles.subject_id = subject.subject_id
INNER JOIN course ON gradefiles.course_id = course.course_id
INNER JOIN teacher ON gradefiles.teacher_id = teacher.teacher_id
where teacher.teacher_id = 5 ORDER BY gfid ASC";


$res = mysqli_query($conn,$filessql);

$files_array = array();

while ($row = mysqli_fetch_assoc($res)) {
    $files_array[] = $row;
}


 echo json_encode($files_array);

?>