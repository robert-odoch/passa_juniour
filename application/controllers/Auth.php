<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Login
 *
 * @author abert
 */
require(APPPATH . 'third_party/PHPWord/bootstrap.php');
//require(APPPATH . 'third_party/PHPWord/src/PhpWord/Style/Cell.php');
class Auth extends MY_Controller {

    //put your code here
    public function __construct() {
        parent::__construct();
        $this->load->model('loginModel');
        $this->load->model('global/Global_model');
    }

    public function generateToken() {
        parent::generateToken();
    }

    public function index() {
        $this->load->view('login');
    }

    public function login() {
        $this->form_validation->set_rules('username', 'username', 'required');
        $this->form_validation->set_rules('password', 'Password', 'required');
        $email = $this->input->post('username');
        $password = $this->input->post('password');
        if ($this->form_validation->run() == TRUE) {
            $res = $this->loginModel->login($email, $password);
            if ($res != false) {
                //check if the universit is not blocked
                $s = $this->generateToken();
                redirect($res);
            } else {
                $this->session->set_userdata("login_error", "Wrong username or password try again");
                redirect('auth', 'refresh');
            }
        } {
            $message = "Please fill empty fields";
            $this->session->set_userdata("login_error", $message);
            redirect('auth', 'refresh');
        }
    }

    public function logout() {
        $this->session->sess_destroy();
        redirect('auth');
    }

    // is user logged in
    public function loggedin() {
        return (bool) $this->session->userdata('loggedin');
    }

    function assign_menus() {
        $data['pageName'] = 'Menu Management';
        $data['main_link'] = "Assign User Menu";
        $data['menudata'] = $this->loginModel->view_user_menus();
        $data['usergroups'] = $this->loginModel->fetch_user_groups();
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('developer/assign_menus', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    function load_user_unassigned($usergroup) {
        $result = $this->loginModel->view_unassigned_menus($usergroup);
        $html = '<option value="">--Select Menu--</option>';
        foreach ($result as $row) {
            $html .= '<option value ="' . $row->menu_id . '">' . $row->menu_name . '</option>';
        }
        echo json_encode($html);
    }

    function load_all_menu_data() {
        $result = $this->loginModel->view_user_menus();
        $output = '';
        $count = 1;
        foreach ($result as $menu) {
            $output .= '
      <tr>
      <td>' . ucwords($count) . '</td>
      <td>' . ucwords($menu->group_name) . '</td>
      <td>' . ucwords($menu->menu_name) . '</td>
      <td><a href="#" onclick="unassign_menu(' . $menu->assignmet_id . ')"><i class="fa fa-trash-o fa-fw"></i></a> </td>
      </tr>
      ';
            $count++;
        }
        echo json_encode($output);
    }

    function assign_menu_to_user() {
        $data = array(
            'menu_id' => $this->input->post('menu'),
            'user_group_id' => $this->input->post('user_group')
        );
        if ($this->loginModel->assign_menus($data)) {
            $this->load_all_menu_data();
        }
    }

    function unassign_menu_from_users($id) {
        if ($this->loginModel->un_assing_menu($id)) {
            $this->load_all_menu_data();
        }
    }



function create_pdf(){
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
    base_url("upload/banners/utamu.png"),
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

for ($i = 1; $i <= 1; $i++) {
    $table->addRow();
    $table->addCell(2000)->addText(htmlspecialchars("Advanced Programming"));
    $table->addCell(2000)->addText(htmlspecialchars("89"));
    $table->addCell(2000)->addText(htmlspecialchars("4.5"));
    $table->addCell(2000)->addText(htmlspecialchars("N"));

}



$section->addText(
    '"Learn from yesterday, live for today, hope for tomorrow. '
        . 'The important thing is not to stop questioning." '
        . '(Albert Einstein)'
);
$section->addText(
    '"Great achievement is usually born of great sacrifice, '
        . 'and is never the result of selfishness." '
        . '(Napoleon Hill)',
    array('name' => 'Tahoma', 'size' => 10)
);

// Adding Text element with font customized using named font style...
$fontStyleName = 'oneUserDefinedStyle';
$phpWord->addFontStyle(
    $fontStyleName,
    array('name' => 'Tahoma', 'size' => 10, 'color' => '1B2232', 'bold' => true)
);
$section->addText(
    '"The greatest accomplishment is not in never falling, '
        . 'but in rising again after you fall." '
        . '(Vince Lombardi)',
    $fontStyleName
);
$fontStyle = new \PhpOffice\PhpWord\Style\Font();
$fontStyle->setBold(true);
$fontStyle->setName('Tahoma');
$fontStyle->setSize(13);
$myTextElement = $section->addText('"Believe you can and you\'re halfway there." (Theodor Roosevelt)');
$myTextElement->setFontStyle($fontStyle);

        $objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord, 'Word2007');
        $objWriter->save($filename);
        // send results to browser to download
        header('Content-Description: File Transfer');
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename='.$filename);
        header('Content-Transfer-Encoding: binary');
        header('Expires: 0');
        header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
        header('Pragma: public');
        header('Content-Length: ' . filesize($filename));
        flush();
        readfile($filename);
        unlink($filename); // deletes the temporary file
        exit;
}
}
