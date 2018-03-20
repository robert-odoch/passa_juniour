<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>



</div>
<div class="clearfix"></div>
<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

    <thead>
        <tr>
            <th>No</th>
            <th>Title</th>
             <th>Category</th>
            <th>Author</th>
            <th>Date</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        if ($news) {
            foreach ($news as $news):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td><?php echo ucwords($news->title); ?></td>
                     <td><?php echo ucwords($news->category); ?></td>
                    <td><?php echo ucwords($news->name); ?></td>
                    <td><?php echo ucwords($news->time_stamp); ?></td>
                    <td> <a class="text-success" href="<?php echo base_url(); ?>news/news_controller/editNews/<?php echo $news->news_id; ?>"><i class="fa fa-pencil-square-o">Edit</i></a> || <a class="text-danger" href="#" onclick="deleteNews(<?php echo$news->news_id; ?>)"><i class="fa fa-trash">Delete</i></a></td>
                </tr>
                <?php
                $count++;
            endforeach;
        }
        ?>
    </tbody>
</table>
<script>
    function deleteNews(news_id) {
        if (confirm("Are you sure want to delete?")) {
            $.ajax({
                url: "<?php echo base_url("news/news_controller/deleteNews/"); ?>/" + news_id,
                type: 'POST',
                dataType: 'text',
                success: function (data, textStatus, jqXHR) {
                    location.reload();
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }


</script>