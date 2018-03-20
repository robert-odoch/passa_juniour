<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Email
 *
 * @author abert
 */
class Email {

//put your code here

    function send($receiver, $body) {

        $config = Array(
            'protocol' => 'smtp',
            'smtp_host' => 'ssl://smtp.googlemail.com',
            'smtp_port' => 465,
            'smtp_user' => 'abertnamanya@gmail.com', // change it to yours
            'smtp_pass' => 'xxx', // change it to yours
            'mailtype' => 'html',
            'charset' => 'iso-8859-1',
            'wordwrap' => TRUE
        );
        $message = '';
        $this->load->library('email', $config);
        $this->email->set_newline("\r\n");
        $this->email->from('abertnamanya@gmail.com'); // change it to yours
        $this->email->to($receiver); // change it to yours
        $this->email->subject('RESULTS SYSTEM NOTIFICATION');
        $this->email->message($body);
        if ($this->email->send()) {
            return true;
        } else {
            return show_error($this->email->print_debugger());
        }
    }

}
