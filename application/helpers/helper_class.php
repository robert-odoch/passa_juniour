
<?php

class DbHelper {

    function getComplaintComments($complaint_id) {
        $CI = & get_instance();
        $mod = $CI->load->model('CRUD_model');
        $result = $CI->CRUD_model->getRecords('complaint_response a left join users b on(a._who_added=b.user_id) left join user_position c on(b.user_id=c.user) left join positions d on(c.pos_name=d.id)',
                array('a.message','d.pos_name','b.name'), "where complaint='" . $complaint_id . "' ");
        return $result;
    }

}

?>
