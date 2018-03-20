<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of statisticsModel
 *
 * @author hp
 */
class StatisticsModel extends CI_Model {

    //per university statitisc

    public function students() {
        $query = $this->db->query("select * from student where universities_university_id='" . $this->session->userdata('university') . "' ");
        $result = $query->num_rows();
        return $result;
    }

    public function courses() {
        $query = $this->db->query("select * from courses where universities_university_id='" . $this->session->userdata('university') . "' ");
        $result = $query->num_rows();
        return $result;
    }

    public function unreadSuggestion() {
        $query = $this->db->query("select * from suggestion_box where university_university_id='" . $this->session->userdata('university') . "' && _status='0' ");
        $result = $query->num_rows();
        return $result;
    }

    public function chat_groups() {
        $query = $this->db->query("select * from chatgroups where university_id='" . $this->session->userdata('university') . "' && status='0' ");
        $result = $query->num_rows();
        return $result;
    }

    public function monthly_active_students() {
        $query = $this->db->query("select * from student where MONTH(logged_in) = MONTH(CURRENT_DATE()) && universities_university_id='" . $this->session->userdata('university') . "' ");
        $result = $query->num_rows();
        return $result;
    }

}
