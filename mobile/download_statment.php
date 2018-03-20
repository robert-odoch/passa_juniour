<?php
include 'connection.php';
require('../mobile/PHPWord/bootstrap.php');



 $data = array();
    $con = db_connect();
    $student_reg = 'sep17/comp/035u';
    $year_id = '1';
    $semester_id ='1';
    $university_id ='2';
    $student_id = '1972';
 $data = array();

    $sql_string = "SELECT marks.fn,course_units.course_unit,cw,ex FROM marks left join course_units on(marks.course_unit=course_units.id)  WHERE marks.reg_no='" . $student_reg . "'";
    $query = mysqli_query($con, $sql_string) or die(mysqli_error($con));

    //fetch student graduate level

    $result1 = mysqli_query($con, "select courses_course_id from student where registration_number='$student_reg'");

    $row1 = mysqli_fetch_assoc($result1);
    $result2 = mysqli_query($con, "select level from courses where course_id='" . $row1['courses_course_id'] . "'");
    $row2 = mysqli_fetch_assoc($result2);


    $grading = mysqli_query($con, "select * from grading where grading.university_id='" . $university_id . "' && level='" . $row2['level'] . "'");


    if (!$query)
        echo mysqli_error($con);

    if (mysqli_num_rows($query) > 0) {
        $array_grades = array();
        while ($grade = mysqli_fetch_assoc($grading)) {
            $array_grades[] = array("from" => $grade['value_frm'], "to" => $grade['value_to'], "grade" => $grade['grade'], "value" => $grade['grade_value'], "progress" => $grade['progress']);
        }

        $array_data = array();
        $data_row = array();
        while ($row = mysqli_fetch_assoc($query)) {
            $found = false;
            foreach ($array_grades as $grade) {
                if ($row['fn'] >= $grade["from"] && $row['fn'] <= $grade["to"]) {
                    $found = true;
                    if ($grade["progress"] == 1) {
                        $data_row[] = array(
                            "course_unit" => $row['course_unit'],
                            'mark' => $row['fn'],
                            'cw'=>$row['cw'],
                            'ex'=>$row['ex'],
                            "grade_value" => $grade["grade"],
                            "value" => $grade["value"],
                            "progress" => "Retake"
                        );
                    } else {
                        $data_row[] = array(
                            "course_unit" => $row['course_unit'],
                            'mark' => $row['fn'],
                            'cw'=>$row['cw'],
                            'ex'=>$row['ex'],
                            "grade_value" => $grade["grade"],
                            "value" => $grade["value"],
                            "progress" => "Normal Progress"
                        );
                    }
                }
            }
            if ($found == false) {
                $data_row[] = array(
                    "course_unit" => $row['course_unit'],
                    'mark' => "-",
                    'cw'=>'-',
                    'ex'=>'-',
                    "grade_value" => "-",
                    "value" => '0',
                    "progress" => "Missing Marks"
                );
            }
        }
    }



























$phpWord = new \PhpOffice\PhpWord\PhpWord();

$phpWord->getCompatibility()->setOoxmlVersion(14);
        $phpWord->getCompatibility()->setOoxmlVersion(15);

$filename = 'test.docx';
$section = $phpWord->addSection();



// Add header
$header = $section->createHeader();
// $table = $header->addTable();
// $table->addRow();
$head_style = array('size' => 16, 'bold' => true);
$header->addText('UGANDA TECHNOLOGY AND MANAGEMENT UNIVERSITY',$head_style);
// $table->addCell(1)->addImage(base_url("upload/banners/utamu.png"), array('width'=>600, 'height'=>100, 'align'=>'center'));
// Add footer
$footer = $section->createFooter();
$footer->addPreserveText('Page {PAGE} of {NUMPAGES}.', array('align'=>'center'));

$section->addImage(
    "../upload/banners/utamu.png",
    array(
        'width'         => 500,
        'height'        => 100,
    )
);



$section->addTextBreak(1);
$header = array('size' => 16, 'bold' => true);
$section->addText(htmlspecialchars('Student Results Statement'), $header);
$styleTable = array('borderSize' => 6, 'borderColor' => '006699', 'cellMargin' => 80);

$section->addTextBreak(1);
$section->addText("Student Name: Namanya Abert SEP17/COMP/035U");

$section->addText("Year: One, Semester: One");


$styleFirstRow = array('borderBottomSize' => 18, 'borderBottomColor' => '0000FF', 'bgColor' => '66BBFF');
$styleCell = array('valign' => 'center');
$styleCellBTLR = array('valign' => 'center', 'textDirection' => \PhpOffice\PhpWord\Style\Cell::TEXT_DIR_BTLR);
$fontStyle = array('bold' => true, 'align' => 'center');
$phpWord->addTableStyle('Fancy Table', $styleTable, $styleFirstRow);
$table = $section->addTable('Fancy Table');
$table->addRow(900);
$table->addCell(2000, $styleCell)->addText(htmlspecialchars('Course Unit'), $fontStyle);
$table->addCell(2000, $styleCell)->addText(htmlspecialchars('Mark'), $fontStyle);
$table->addCell(2000, $styleCell)->addText(htmlspecialchars('GP'), $fontStyle);
$table->addCell(2000, $styleCell)->addText(htmlspecialchars('Progress'), $fontStyle);

foreach ($data_row as $keys) {
    $table->addRow();
    $table->addCell(2000)->addText(htmlspecialchars($keys['course_unit']));
    $table->addCell(2000)->addText(htmlspecialchars($keys['ex']));
    $table->addCell(2000)->addText(htmlspecialchars($keys['grade_value']));
    $table->addCell(2000)->addText(htmlspecialchars($keys['progress']));

}

$section->addTextBreak(1);


// $section->addText(
//     '"Great achievement is usually born of great sacrifice, '
//         . 'and is never the result of selfishness." '
//         . '(Napoleon Hill)',
//     array('name' => 'Tahoma', 'size' => 10)
// );

// // Adding Text element with font customized using named font style...
// $fontStyleName = 'oneUserDefinedStyle';
// $phpWord->addFontStyle(
//     $fontStyleName,
//     array('name' => 'Tahoma', 'size' => 10, 'color' => '1B2232', 'bold' => true)
// );
// $section->addText(
//     '"The greatest accomplishment is not in never falling, '
//         . 'but in rising again after you fall." '
//         . '(Vince Lombardi)',
//     $fontStyleName
// );
$fontStyle = new \PhpOffice\PhpWord\Style\Font();
$fontStyle->setBold(true);
$fontStyle->setName('Tahoma');
$fontStyle->setSize(13);
$myTextElement = $section->addText('This results statement is not certified. Requires certification from the University');
$myTextElement->setFontStyle($fontStyle);

        $objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord, 'Word2007');
      $downloadn=  $objWriter->save($filename);
    // echo $filename;
      $source_file = $_FILES[$filename]['tmp_name'];
     move_uploaded_file($source_file, 'upload');
        // send results to browser to download
        // header('Content-Description: File Transfer');
        // header('Content-Type: application/octet-stream');
        // header('Content-Disposition: attachment; filename='.$filename);
        // header('Content-Transfer-Encoding: binary');
        // header('Expires: 0');
        // header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
        // header('Pragma: public');
        // header('Content-Length: ' . filesize($filename));
        // flush();
        // readfile($filename);
        // unlink($filename); // deletes the temporary file
        // exit;
function get_gpa($grades_array, $units_count) {
    $total_gpa = 0;
    foreach ($grades_array as $grade):
        $total_gpa += $grade;
    endforeach;
    return $total_gpa / $units_count;
}
    
?>