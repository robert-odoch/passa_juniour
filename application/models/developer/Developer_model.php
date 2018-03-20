<?php



if (!defined('BASEPATH')) {

  exit('No direct script access allowed');

}

class Developer_model extends CI_Model
{

  public function __construct()

  {
    parent::__construct();
    $this->load->database();
  }

  function register_menu($data){
    return ($this->db->insert('menu',$data)) ? true : false;
  }

  function register_submenu($data){
    return ($this->db->insert('sub_menu',$data)) ? true : false;
  }

  function get_menus(){
    $this->db->select('menu.*');
    $this->db->from('menu');
    $query_result = $this->db->get();
    return $query_result->result();
  }

  function get_menu_byID($id){
    $this->db->select('menu.*');
    $this->db->from('menu');
    $this->db->where('menu.menu_id', $id);
    $query_result = $this->db->get();
    return $query_result->result();
  }

}
