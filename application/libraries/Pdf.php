<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once __DIR__ . '/dompdf/autoload.inc.php';

use Dompdf\Dompdf;

class Pdf extends DOMPDF {

    protected function ci() {
        return get_instance();
    }

    /**
     * Load a CodeIgniter view into domPDF
     *
     * @access	public
     * @param	string	$view The view to load
     * @param	array	$data The view data
     * @return	void
     */
    public function load_view($view, $data = array()) {
        $html = $this->ci()->load->view($view, $data, TRUE);

        $this->load_html($html);
    }

}
