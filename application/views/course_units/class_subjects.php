 <div class="row">
                <div class="col-md-12">
            <div id="course_units">
                <table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Subject</th>
                            <th>When Added</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <?php

                        $count = 1;
                        if (isset($subjects)) {
                            foreach ($subjects as $row):
                                ?>
                                <tr id="table_show">
                                    <td><?php echo ucwords($count); ?></td>
                                    <td><?php echo ucwords($row['name']); ?></td>
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

          
