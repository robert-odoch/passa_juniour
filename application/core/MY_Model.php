<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of My_Model
 *
 * @author hp
 */
class My_Model extends CI_Model {

    protected $_table = NULL;
    protected $_primary_key = null;
    protected $_timestamps = FALSE;
    protected $_created_on_field = 't_created_on';
    protected $_updated_on_field = 't_updated_on';
    protected $_timestamps_format = 'Y-m-d H:i:s';

    public function __construct() {
        parent::__construct();
        if (is_null($this->_table)) {
            die('You must set the $_table variable first');
        }
    }

    public function get($id) {
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

    public function insert($data) {
        if ($this->_timestamps) {
            $data[$this->_created_on_field] = $this->freshTimestamp();
        }

        $this->db->insert($this->_table, $data);
        return $this->db->last_insert_id();
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
        }

        return $this->update($data, $id);
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

    public function freshTimestamp() {
        $timestamp = new DateTime();
        return $timestamp->format($this->_timestamps_format);
    }

}
