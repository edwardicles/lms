<style>
    .img-thumb-path{
        height:100px;
        width:80px;
        object-fit:scale-down;
        object-position:center center;
    }
</style>
<div class="card card-outline card-primary rounded-0 shadow">
	<div class="card-header">
		<h3 class="card-title">List of Leads</h3>
		<?php  ?>
		<div class="card-tools">
			<a href="./?page=leads/manage_lead" class="btn btn-flat btn-sm btn-primary"><span class="fas fa-plus"></span>  Add New Leads</a>
		</div>
		<?php  ?>
	</div>
	<div class="card-body">
		<div class="container-fluid">
	

			<div class="table-responsive">
			<table class="table text-nowrap">
			<thead>
                                        <tr>
											<th class="border-top-0">Remarks</th>
                                            <th class="border-top-0">Reference Code</th>
                                            <th class="border-top-0">Client</th>
                                            <th class="border-top-0">Email</th>
                                            <th class="border-top-0">Interesed In</th>
                                            <th class="border-top-0">Assigned To</th>
                                            <th class="border-top-0">Status</th>
                                            <th class="border-top-0">Created By</th>
                                            <th class="border-top-0">Actions to be Taken</th>
                                        </tr>
                                    </thead>
                                    <tbody>

			<div class="list/-group" id="lead-list/">
				<?php 
				$uwhere = "";
				if($_settings->userdata('type') != 1)
				$uwhere = " and assigned_to = '{$_settings->userdata('id')}' ";
				$users = $conn->query("SELECT id,CONCAT(lastname,', ', firstname, '', COALESCE(middlename,'')) as fullname FROM `users` where id in (SELECT `user_id` FROM `lead_list` where in_opportunity = 0 {$uwhere}) OR id in (SELECT assigned_to FROM `lead_list` where in_opportunity = 0 {$uwhere})");
				$user_arr = array_column($users->fetch_all(MYSQLI_ASSOC),'fullname','id');
				$leads = $conn->query("SELECT l.*,CONCAT(c.lastname,', ', c.firstname, '', COALESCE(c.middlename,'')) as client, c.email FROM `lead_list` l inner join client_list c on c.lead_id = l.id where l.in_opportunity = 0 {$uwhere} order by l.`status` asc, unix_timestamp(l.date_created) asc ");
				while($row = $leads->fetch_assoc()){

					echo "<tr>";
					echo "<td>"; echo $row['remarks']; echo "</td>";//to echo out, use the columns from the db table
					echo "<td>"; echo $row['code']; echo "</td>";
					echo "<td>"; echo ucwords($row['client']); echo "</td>";
					echo "<td>"; echo $row['email']; echo "</td>";
					echo "<td>"; echo $row['interested_in']; echo "</td>";
					echo "<td>"; echo (isset($user_arr[$row['assigned_to']])) ? ucwords($user_arr[$row['assigned_to']]) : "Not Assigned Yet."; echo "</td>";
					echo "<td>"; switch($row['status']){
						case 0:
							echo '<span class="badge badge-primary bg-gradient-primary px-3 rounded-pill">New/Prospect</span>';
							break;
						case 1:
							echo '<span class="badge badge-light bg-gradient-light border px-3 rounded-pill">Open</span>';
							break;
						case 2:
							echo '<span class="badge badge-primary bg-gradient-primary px-3 rounded-pill">Working</span>';
							break;
						case 3:
							echo '<span class="badge badge-danger bg-gradient-danger px-3 rounded-pill">Not a Target</span>';
							break;
						case 4:
							echo '<span class="badge badge-danger bg-gradient-danger px-3 rounded-pill">Disqualified</span>';
							break;
						case 5:
							echo '<span class="badge badge-info bg-gradient-info px-3 rounded-pill">Nurture</span>';
							break;
						case 6:
							echo '<span class="badge badge-success bg-gradient-success px-3 rounded-pill">Opportunity Created</span>';
							break;
						case 7:
							echo '<span class="badge badge-danger bg-gradient-danger px-3 rounded-pill">Opportunity Lost</span>';
							break;
						case 8:
							echo '<span class="badge badge-danger bg-gradient-danger px-3 rounded-pill">Inactive</span>';
							break;
						default:
							echo '<span class="badge badge-light bg-gradient-light border px-3 rounded-pill">N/A</span>';
								break;
					}; echo "</td>";
					echo "<td>"; echo isset($user_arr[$row['user_id']]) ? ucwords($user_arr[$row['user_id']]) : "N/A" ?> <?= date("D M d, Y h:i A",strtotime($row['date_created'])); echo "</td>";
					echo "<td>"; ?><a class="btn btn-sm btn-flat btn-light border" href="./?page=view_lead&id=<?= $row['id'] ?>"><i class="fa fa-eye"></i> View Lead</a>
					<?php if($_settings->userdata('type') == 1): ?>
					<a class="btn btn-sm btn-flat btn-primary" href="./?page=leads/manage_lead&id=<?= $row['id'] ?>"><i class="fa fa-edit"></i> Edit Lead</a>
					<a class="btn btn-sm btn-flat btn-danger delete_data" data-id="<?= $row['id'] ?>"><i class="fa fa-trash"></i> Delete Lead</a>
					<?php endif; ?></td>
					

<?php } ?>

</tbody></div></div></div></div>
                                </table>
							
		
<script>
	$(document).ready(function(){
		$('.delete_data').click(function(){
			_conf("Are you sure to delete this Lead Information permanently?","delete_lead",[$(this).attr('data-id')])
		})

	})
	function delete_lead($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=delete_lead",
			method:"POST",
			data:{id: $id},
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("An error occured.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
					location.reload();
				}else{
					alert_toast("An error occured.",'error');
					end_loader();
				}
			}
		})
	}
</script>

<script>
  $(document).ready( function () {
		$('.table').DataTable();
  });
  </script>