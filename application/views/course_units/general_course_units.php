 <div class="row">
                <div class="col-md-12">
            <div id="course_units">
                <table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Class</th>
                            <th>Subjects</th>
                            <th>When Added</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <?php

                        $count = 1;
                        if (isset($classes)) {
                            foreach ($classes as $row):
                                ?>
                                <tr id="table_show">
                                    <td><?php echo ucwords($count); ?></td>
                                    <td><?php echo ucwords($row['name']); ?></td>
                                    <td><a href="<?php echo base_url();?>course_units/Units_controller/class_subjects/<?php echo $row['id']?>"><?php echo $row['count_subjects']." subjects"?></a></td>
                                    <td><?php echo ucwords($row['_when_added']); ?></td>
                             
                                </tr>
                                <?php
                                $count++;
                            endforeach;
                        }
                        ?>
                    </tbody>
                </table>
            </div>
                
                </div>
            </div>

            <script type="text/javascript">
                function deleteCourseUnit(id){
                   if(confirm("Are you sure want to delete?")){
                      $.ajax({
                            url: "<?php echo base_url("course_units/Units_controller/deleteUnit/"); ?>"+id,
                                    type: 'POST',
                                    dataType: 'json',
                                    success: function (data, textStatus, jqXHR) {
                                      alert('course Unit deleted successfully');
                                      location.reload();
                                    }, error: function (jqXHR, textStatus, errorThrown) {
                                        alert(errorThrown);
                                    }
                                });
                   }
                }
            </script>
