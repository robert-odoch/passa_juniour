<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of NewsModel
 *
 * @author abert
 */
class NewsModel extends CI_Model {

    public function fetch_news($university_id) {
        $this->db->select('*,users.name,news._when_added as time_stamp');
        $this->db->from('news');
        $this->db->join('news_categories', 'news.category_id=news_categories.category_id', 'left');
        $this->db->join('users', 'news._who_added=users.user_id', 'left');
        $this->db->where('news.university_university_id', $university_id);
        $query = $this->db->get()->result();
        return $query;
    }

    public function fetch_news_categories($university_id) {
        $query = $this->db->query("select * from news_categories where university_id='" . $university_id . "'");
        return $query->result();
    }

    //add news category
    public function submitCat($data) {
        $this->db->insert('news_categories', $data);
    }

    public function submitNews($data) {
        $this->db->insert('news', $data);
    }

    function edit_news($new_id) {
        $this->db->select('news.*,news_categories.*');
        $this->db->from('news');
        $this->db->join('news_categories', 'news.category_id=news_categories.category_id', 'left');
        $this->db->where('news_id', $new_id);
        $query = $this->db->get()->row();
        return $query;
    }

    function UpdateNews($data, $news_id) {
        $this->db->where('news_id', $news_id);
        $this->db->update('news', $data);
    }

    //campus evenets
    function fetch_events($university_id) {
        $this->db->from('campus_events');
        $this->db->where('campus_events.university_university_id', $university_id);
        $this->db->order_by('event_id', 'desc');
        $query = $this->db->get()->result();
        return $query;
    }

    function save_event($data) {
        return $this->db->insert('campus_events', $data);
    }

    function fetch_eventDetails($event_id) {
        $this->db->from('campus_events');
        $this->db->where('event_id', $event_id);
        $query = $this->db->get()->row();
        return $query;
    }

    function update_event($data, $event_id) {
        $this->db->where('event_id', $event_id);
        return $this->db->update('campus_events', $data);
    }

    public function delete_News($news_id) {
        $this->db->where(array('news_id' => $news_id));
        return $this->db->delete('news');
    }

    function deleteEvent($event_id) {
        $this->db->where(array('event_id' => $event_id));
        $this->db->delete('campus_events');
    }

}
