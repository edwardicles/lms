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
	



		
		<div class="card-tools">
			<a href="./?page=leads/manage_lead" class="btn btn-flat btn-sm btn-primary"><span class="fas fa-plus"></span>  Add New Leads</a>
		</div>
		
	</div>
	<div class="card-body">
		<div class="container-fluid">
	

			<div class="table-responsive">
			<table class="table text-nowrap">
			<thead>
                                        <tr>
                                            <th class="border-top-0">Reference Code</th>
                                            <th class="border-top-0">Client Name</th>
                                            <th class="border-top-0">Address</th>
                                            <th class="border-top-0">Contact Number</th>
                                            <th class="border-top-0">Email</th>
                                            <th class="border-top-0">Status</th>
                                            <th class="border-top-0">Created By</th>
                                            <th class="border-top-0">Actions to be Taken</th>
                                        </tr>
                                    </thead>
                                    <tbody>

			<div class="list/-group" id="lead-list/">
				<?php 
				$uwhere = "";
				if($_settings->userdata('type') <= 0 ) 
				$uwhere = " and assigned_to = '{$_settings->userdata('id')}' ";
				$users = $conn->query("SELECT id,CONCAT(lastname,', ', firstname, '', COALESCE(middlename,'')) as fullname FROM `users` where id in (SELECT `user_id` FROM `lead_list` where in_opportunity >= 0 {$uwhere}) OR id in (SELECT assigned_to FROM `lead_list` where in_opportunity >= 0 {$uwhere})");
				$user_arr = array_column($users->fetch_all(MYSQLI_ASSOC),'fullname','id');
				$leads = $conn->query("SELECT l.*,CONCAT(c.lastname,', ', c.firstname, '', COALESCE(c.middlename,'')) as client, c.email, c.address, c.contact  FROM `lead_list` l inner join client_list c on c.lead_id = l.id where l.in_opportunity >= 0 {$uwhere} order by l.`status` asc, unix_timestamp(l.date_created) asc ");
				while($row = $leads->fetch_assoc()){

					echo "<tr>";
					echo "<td>"; echo $row['code']; echo "</td>";
					echo "<td>"; echo ucwords($row['client']); echo "</td>";
					echo "<td>"; echo $row['address']; echo "</td>";
					echo "<td>"; echo $row['contact']; echo "</td>";
					echo "<td>"; echo $row['email']; echo "</td>";
					echo "<td>"; switch($row['status']){
						case 0:
							echo '<span class="badge badge-primary bg-gradient-primary px-3 rounded-pill">Open</span>';
							break;
						case 1:
							echo '<span class="badge badge-light bg-gradient-light border px-3 rounded-pill">New Prospect</span>';
							break;
						case 2:
							echo '<span class="badge badge-primary bg-gradient-primary px-3 rounded-pill">Qualified</span>';
							break;
						case 3:
							echo '<span class="badge badge-danger bg-gradient-danger px-3 rounded-pill">Interviewed</span>';
							break;
						case 4:
							echo '<span class="badge badge-danger bg-gradient-danger px-3 rounded-pill">Target</span>';
							break;
						case 5:
							echo '<span class="badge badge-info bg-gradient-info px-3 rounded-pill">Follow Up</span>';
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

<!-- ============================ IMPORT CSV ============================== -->

<?php
// Load the database configuration file
/* include_once '../classes/DBConnection.php'; */

// Get status message
if(!empty($_GET['status'])){
    switch($_GET['status']){
        case 'succ':
            $statusType = 'alert-success';
            $statusMsg = 'Members data has been imported successfully.';
            break;
        case 'err':
            $statusType = 'alert-danger';
            $statusMsg = 'Some problem occurred, please try again.';
            break;
        case 'invalid_file':
            $statusType = 'alert-danger';
            $statusMsg = 'Please upload a valid CSV file.';
            break;
        default:
            $statusType = '';
            $statusMsg = '';
    }
}
?>

<!-- Display status message -->
<?php if(!empty($statusMsg)){ ?>
<div class="col-xs-12">
    <div class="alert <?php echo $statusType; ?>"><?php echo $statusMsg; ?></div>
</div>
<?php } ?>
<div style="padding:2em;">
<div class="row">


    <!-- Import link -->
    <div class="col-md-12 head">
        <div class="float-left">
            <a href="javascript:void(0);" class="btn btn-success" onclick="formToggle('importFrm');"><i class="plus"></i> Import</a>
        </div>
    </div>
    <!-- CSV file upload form -->
    <div class="col-md-12" id="importFrm" style="display: none;">
        <form action="" method="post" enctype="multipart/form-data">
            <input type="file" name="file" />
            <input type="submit" class="btn btn-primary" name="importSubmit" value="IMPORT">
        </form>
    </div>
  

    <!-- Data list table --> 
    <table class="table table-striped table-bordered">
        <thead class="thead-dark">
            <tr>
                <th>#ID</th>    
                <th>Lead ID</th>
                <th>First Name</th>
                <th>Middle Name</th>
                <th>Last Name</th>
                <th>Gender</th>
                <th>Date of Birth</th>
                <th>Contact</th>
                <th>Email</th>
                <th>Address</th>
                <th>Enrolled</th>
                <th>Other Info</th>
                <th>Date Created</th>
            </tr>
        </thead>
        <tbody>
        <?php
        // Get member rows
        $result = $conn->query("SELECT * FROM client_list ORDER BY id DESC");
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
        ?>
            <tr>
                <td><?php echo $row['id']; ?></td>
                <td><?php echo $row['lead_id']; ?></td>
                <td><?php echo $row['firstname']; ?></td>
                <td><?php echo $row['middlename']; ?></td>
                <td><?php echo $row['lastname']; ?></td>
                <td><?php echo $row['gender']; ?></td>
                <td><?php echo $row['dob']; ?></td>
                <td><?php echo $row['contact']; ?></td>
                <td><?php echo $row['email']; ?></td>
                <td><?php echo $row['address']; ?></td>
                <td><?php echo $row['enrolled']; ?></td>
                <td><?php echo $row['other_info']; ?></td>
                <td><?php echo $row['date_created']; ?></td>
            </tr>
        <?php } }else{ ?>
            <tr><td colspan="5">No member(s) found...</td></tr>
        <?php } ?>
        </tbody>
    </table>
</div>
</div>

<!-- Show/hide CSV upload form -->
<script>
function formToggle(ID){
    var element = document.getElementById(ID);
    if(element.style.display === "none"){
        element.style.display = "block";
    }else{
        element.style.display = "none";
    }
}
</script>

<!-- ============================== import data ====================== -->

<?php 

    //For Reference Code
/*         $prefix = date("Ym-");
        $code = sprintf("%'.05d",1);
        while(true){
            $check = $conn->query("SELECT * FROM `lead_list` where code = '{$prefix}{$code}'")->num_rows;
            if($check > 0){
                $code = sprintf("%'.05d",ceil($code) + 1);
            }else{
                break;
            }
        } */
/*         $_POST['code'] = $prefix.$code;
        $_POST['user_id'] = $this->settings->userdata('id'); */

    


    // Allowed mime types
    $csvMimes = array('text/x-comma-separated-values', 'text/comma-separated-values', 'application/octet-stream', 'application/vnd.ms-excel', 'application/x-csv', 'text/x-csv', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel', 'text/plain');
    
    // Validate whether selected file is a CSV file
    if(!empty($_FILES['file']['name']) && in_array($_FILES['file']['type'], $csvMimes)){
        
        // If the file is uploaded
        if(is_uploaded_file($_FILES['file']['tmp_name'])){
            
            // Open uploaded CSV file with read-only mode
            $csvFile = fopen($_FILES['file']['tmp_name'], 'r');
            
            // Skip the first line
            fgetcsv($csvFile);
            
            // Parse data from CSV file line by line
            while(($line = fgetcsv($csvFile)) !== FALSE){
                // Get row data
                $lead_id   = $line[0]; 
                $firstname  = $line[1];
                $middlename  = $line[2];
                $lastname = $line[3];
                $gender = $line[4];
                $dob = $line[5];
                $contact = $line[6];
                $email = $line[7];
                $address = $line[8];
                $enrolled = $line[9];
                $other_info = $line[10];
                $code = $line[11];
                
                //Covert String to row in getting ID 
                $queryID="SELECT `id` FROM `lead_list` WHERE code = '".$line[11]."'";
                $selectID=$conn->query($queryID);
                while ($row = $selectID->fetch_assoc()) {
      

                // Check whether member already exists in the database with the same email
                $prevQuery = "SELECT id FROM client_list WHERE email = '".$line[7]."'";
                $prevResult = $conn->query($prevQuery);

                // Check whether member already exists in the database with the same email
                $prevQueryClient = "SELECT id FROM lead_list WHERE code = '".$line[11]."'";
                $prevResultClient = $conn->query($prevQueryClient);
                
                if($prevResult->num_rows > 0 && $prevResultClient->num_rows > 0){
                    // Update member data in the database
                    $conn->query("UPDATE client_list SET lead_id = '".$row['id']."', firstname = '".$firstname."', middlename = '".$middlename."',  lastname = '".$lastname."',
                    gender = '".$gender."', dob = '".$dob."', contact = '".$contact."', email = '".$email."', address = '".$address."',
                    enrolled = '".$enrolled."', other_info = '".$other_info."', modified = NOW() WHERE email = '".$email."'");

                    // Update member data in the database
                    $conn->query("UPDATE lead_list SET  code = '".$code."' WHERE code = '".$code."'");

                }else{

                    //Insert data into lead_list
                    $conn->query("INSERT INTO lead_list (code, source_id, program_id, course_id, status_id, updated_id, interested_in, remarks, assigned_to, user_id, status, delete_flag, date_created, date_updated, in_opportunity)   
                    VALUES('".$code."', '8', '1', '1', '0', '0', 'abc', 'abc', '1', '1', '0', '0', NOW(), NOW(), '0')");

                    // Insert member data in the database
                    $conn->query("INSERT INTO client_list (lead_id, firstname, middlename, lastname, gender, dob, contact, email, address, enrolled, other_info, date_created) 
                    VALUES ('".$row['id']."', '".$firstname."', '".$middlename."', '".$lastname."', '".$gender."', '".$dob."', '".$contact."', '".$email."',
                     '".$address."', '".$enrolled."', '".$other_info."', NOW())");


                }
            }
        }
            
            // Close opened CSV file
            fclose($csvFile);
            
            $qstring = '?status=succ';
        }else{
            $qstring = '?status=err';
        }
    }else{
        $qstring = '?status=invalid_file';
    }

?>