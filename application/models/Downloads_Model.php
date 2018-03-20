<?php

ob_start();
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Downloads_Model
 *
 * @author hp
 */
class Downloads_Model extends CI_Model {

    function __construct() {
        parent::__construct();
        $this->load->library('pdf');
    }

    //put your code here
    public function printPdf($view, $viewData, $name, $paper_size) {
        $this->load->library('pdf');
        $dompdf = new Dompdf\Dompdf();
        $dompdf->set_option('defaultFont', 'Courier');
        $html = $this->load->view($view, $viewData, true);
        $dompdf->loadHtml($html);
        $dompdf->setPaper('A4', $paper_size);
        $dompdf->render();
        $pdf = $dompdf->output();
        $dompdf->stream($name, array("Attachment" => false));
        header('Content-Disposition: inline; filename="' . $name . '"');
        exit(0);
    }

}

?>
