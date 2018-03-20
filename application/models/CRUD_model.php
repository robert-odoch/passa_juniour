<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class CRUD_model extends CI_Model {
// 
    public $_table = null;
    protected $_primary_key = 'id';
    protected $_timestamps = FALSE;
    protected $_created_on_field = '_when_added';
    protected $_updated_on_field = 't_updated_on';
    protected $_timestamps_format = 'Y-m-d H:i:s';
    protected $_who_added='_who_added';

    public function __construct() {
        parent::__construct();
    }


    function get_table() {
        return $this->_table;
    }
    public function get($id=null,$order_by=null) {
        if (is_numeric($id)) {
            $this->db->where($this->_primary_key, $id);
        } elseif (is_array($id)) {
            foreach ($id as $key => $value) {
                $this->db->where($key, $value);
            }
        }
        $query = $this->db->get($this->_table);
        return (is_numeric($id)) ? $query->row() : $query->result();
    }
    public function getRecords($table,$col,$conditions){
        if (is_array($col)) {
            $query = $this->db->query("select " . implode(",", $col) . " from " . $table . " " . $conditions);
        } else {
            $query = $this->db->query("select " . $col . " from `" . $table . "` " . $conditions);
        }
      return $query->result_array();
    }

    public function getRecord($table,$col,$conditions){
         if (is_array($col)) {
            $query = $this->db->query("select " . implode(",", $col) . " from " . $table . " " . $conditions);
        } else {
            $query = $this->db->query("select " . $col . " from `" . $table . "` " . $conditions);
        }
     return $query->row();
    }

    public function insert($table=null,$data) {
        $this->_table=$table;
        if ($this->_timestamps) {
            $data[$this->_created_on_field] = $this->freshTimestamp();
        }
        
        $data[$this->_who_added]=$this->session->userdata('MM_USERID');
        $this->db->insert($this->_table, $data);
        return $this->db->insert_id();
    }

    public function update($data, $id) {
        if ($this->_timestamps) {
            $data[$this->_updated_on_field] = $this->freshTimestamp();
        }
        if (is_numeric($id)) {
            $this->db->where($this->_primary_key, $id);
        } elseif (is_array($id)) {
            foreach ($id as $key => $value) {
                $this->db->where($key, $value);
            }
        }
        $this->db->update($this->_table, $data);
        return $this->db->affected_rows();
    }

    public function checkDuplicate($data, $id) {
        foreach ($data as $key => $value) {
            $this->db->where($key, $value);
        }
        $this->db->where($this->_primary_key . ' !=', $id);
        $query = $this->db->get($this->_table);
        return ($query->num_rows() > 0) ? TRUE : FALSE;
    }




    public function insertUpdate($data, $id) {
        $count = $this->count($id);
        if ($count == 0) {
            return $this->insert($data);
        }else{
            return $this->update($data, $id);
        }
    } 
    public function IsExists($table=null,$column,$id){
        $this->_table=$table;
       $this->db->where($column . ' !=', $id);
        $query = $this->db->get($this->_table);
        return ($query->num_rows() > 0) ? TRUE : FALSE;
    }

     public function isExisting($table,$data) {
        $this->_table=$table;
        foreach ($data as $key => $value) {
            $this->db->where($key, $value);
        }
        $query = $this->db->get($this->_table);
        return ($query->num_rows() > 0) ? TRUE : FALSE;
    }

    public function count($id) {
        if (is_numeric($id)) {
            $this->db->where($this->_primary_key, $id);
        } elseif (is_array($id)) {
            foreach ($id as $key => $value) {
                $this->db->where($key, $value);
            }
        }
        $query = $this->db->get($this->_table);
        return $query->num_rows();
    }

    public function delete($id = false) {
        if (!$id) {
            die('You must supply parameter 1 for delete() method');
        }
        if (is_numeric($id)) {
            $this->db->where($this->_primary_key, $id);
        } elseif (is_array($id)) {
            foreach ($id as $key => $value) {
                $this->db->where($key, $value);
            }
        }
        $this->db->delete($this->_table);
        return $this->db->affected_rows();
    }

    public function deleteData($table,$id){
         foreach ($id as $key => $value) {
             $this->db->where($key, $value);
            }
        $this->db->delete($table);
        return $this->db->affected_rows();

    }
     public function getCount($table, $col, $conditions) {
        if (is_array($col)) {
            $query = $this->db->query("select " . implode(",", $col) . " from " . $table . " " . $conditions);
        } else {
            $query = $this->db->query("select " . $col . " from `" . $table . "` " . $conditions);
        }
        return $query->num_rows();
    }


    public function freshTimestamp() {
        $timestamp = new DateTime();
        return $timestamp->format($this->_timestamps_format);
    }
     public function updateRecord($table, $data, $id) {
        $this->_table = $table;
        if (is_numeric($id)) {
            $this->db->where($this->_primary_key, $id);
        } elseif (is_array($id)) {
            foreach ($id as $key => $value) {
                $this->db->where($key, $value);
            }
        }
         $data[$this->_who_added] = $this->session->userdata('user_id');
         $data[$this->_updated_on_field]=$this->freshTimestamp();
        $this->db->update($this->_table, $data);
        return $this->db->affected_rows();
    }

}
