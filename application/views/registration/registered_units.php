<br>
<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>No</th>
            <th>CODE</th>
            <th>COURSE UNIT</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        if ($registeredUnits) {
            foreach ($registeredUnits as $units):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td> <?php echo ucwords($units->code); ?></td>
                    <td> <?php echo ucwords($units->course_unit); ?></td>
                </tr>
                <?php
                $count++;
            endforeach;
        }
        ?>
    </tbody>
</table>
