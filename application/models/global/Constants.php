<?php



if (!defined('BASEPATH')) {

    exit('No direct script access allowed');

}

class Constants extends CI_Model

{



	public function __construct()

	{
      parent::__construct();
	}

	function declare_menu($menu){

         $valmenu = "";
      if ($menu=="") {
      	# code...
      	 $valmenu = "";
      }elseif ($menu == "") {
      	# code...
      	$valmenu = "";
      }elseif ($menu == "") {
      	# code...
      	$valmenu = "";
      }elseif ($menu == "") {
      	# code...
      	$valmenu = "";
      }
      
      return $valmenu;

	}

	function sub_menus($mainmenu){
       
	}
}
