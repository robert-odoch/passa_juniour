<br>
<table id="table-example" class="table table-hover">
    <thead>
        <tr>
            <th>No</th>
            <th>Course Code</th>
            <th>Course Name</th>
            <th>Un replied</th>
            <th>replied</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        if ($courses) {
            foreach ($courses as $course):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td><?php echo ucwords($course->course_code); ?></td>
                    <td> <?php echo ucwords($course->course); ?></td>
                    <?php
                    // query unreplied complaints
                    $this->db->from('complaints');
                    $this->db->join('student', 'complaints.student_student_id=student.student_id', 'LEFT');
                    $this->db->where('courses_course_id', $course->course_id);
                    $this->db->where('_status', 0);
                    $query_unread = $this->db->get();
                    ?>
                    <td><span class="text-danger"><?php echo $query_unread->num_rows(); ?></span><a href="<?php echo base_url(); ?>university/dashboard/UnRepliedComplaints/<?php echo $course->course_id; ?>"> unread</a></td>
                    <!--query replied complaints-->
                    <?php
                    $this->db->from('complaints');
                    $this->db->join('student', 'complaints.student_student_id=student.student_id', 'LEFT');
                    $this->db->where('courses_course_id', $course->course_id);
                    $this->db->where('_status', 1);
                    $query_read = $this->db->get();
                    ?>
                    <td><span class="text-success"><?php echo $query_read->num_rows();?></span><a href="<?php echo base_url(); ?>university/dashboard/RepliedComplaints/<?php echo $course->course_id; ?>">  read</a></td>

                </tr>
                <?php
                $count++;
            endforeach;
        }
        ?>
    </tbody>
</table>



