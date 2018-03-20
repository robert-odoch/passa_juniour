<br>
<table id="table-example" class="table table-hover">
    <thead>
        <tr>
            <th>No</th>
            <th>Registration Number</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Registered</th>
            <th>View Course Units</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        if ($registered) {
            foreach ($registered as $registered):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td> <?php echo ucwords($registered->registration_number); ?></td>
                    <td> <?php echo ucwords($registered->firstName); ?></td>
                    <td> <?php echo ucwords($registered->lastName); ?></td>
                    <td> <?php echo ucwords($registered->time_stamp); ?></td>
                    <td><a href="<?php echo base_url(); ?>registration/RegistrationController/registeredUnits/<?php echo $registered->	registered_academic_years_id?>">Registered Course units</a></td>
                </tr>
                <?php
                $count++;
            endforeach;
        }
        ?>
    </tbody>
</table>
