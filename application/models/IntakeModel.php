<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of IntakeModel
 *
 * @author abert
 */
class IntakeModel extends CI_Model {

    //academic years
    public function fetch_academic_years() {
        $this->db->from('academic_years');
        $this->db->where('university_university_id', $this->session->userdata('university'));
        $this->db->where('status', 0);
        $this->db->order_by('academic_year_id', 'DESC');
        return $this->db->get()->result();
    }

    public function add_academic_year($array) {
        return $this->db->insert('academic_years', $array);
    }

    public function fetch_academic_year($academic_year) {
        $this->db->from('academic_years');
        $this->db->where('academic_year_id', $academic_year);
        $query = $this->db->get();
        return $query->row();
    }

    public function updateAcademicYear($data, $academic_year) {
        $this->db->where('academic_year_id', $academic_year);
        return $this->db->update('academic_years', $data);
    }

    public function deleteAcademicYear($data) {
        $this->db->where($data);
        $this->db->update('academic_years', array('status' => 1));
    }

    public function fetch_intakes() {
        $this->db->from('intakes');
        $this->db->where('university_university_id', $this->session->userdata('university'));
        $this->db->where('status', 0);
        $this->db->order_by('intake_id', 'desc');
        $query = $this->db->get()->result();
        return $query;
    }

    function saveIntake($data) {
        return $this->db->insert('intakes', $data);
    }

    function fetch_IntakeDetails($intake_id) {
        $this->db->from('intakes');
        $this->db->where('intake_id', $intake_id);
        $res = $this->db->get()->row();
        return $res;
    }

    function updateIntake($data, $intake_id) {
        $this->db->where(array('intake_id' => $intake_id));
        return $this->db->update('intakes', $data);
    }

    function deleteIntake($intake_id) {
        $this->db->where(array('intake_id' => $intake_id));
        return $this->db->update('intakes', array('status' => 1));
    }

    public function fetch_semester($semester_id) {
        $this->db->from('semesters');
        $this->db->where('semester_id', $semester_id);
        $query = $this->db->get();
        return $query->row();
    }

    public function fetch_study_years() {
        $this->db->from('study_year');
        $query = $this->db->get();
        return $query->result();
    }

}
