<?php
if(isset($_GET['id'])){
    $qry = $conn->query("SELECT l.*,s.name as `source` FROM `lead_list` l inner join source_list s on l.source_id = s.id where l.id = '{$_GET['id']}'");
    if($qry->num_rows > 0){
        $res = $qry->fetch_array();
        foreach($res as $k => $v){
            if(!is_numeric($k))
            $$k = $v;
        }
    }

		$qry = $conn->query("SELECT l.*,s.program as `program` FROM `lead_list` l inner join program_list s on l.program_id = s.id where l.id = '{$_GET['id']}'");
	if($qry->num_rows > 0){
        $res = $qry->fetch_array();
        foreach($res as $k => $v){
            if(!is_numeric($k))
            $$k = $v;
        }
    }

	$qry = $conn->query("SELECT l.*,s.course as `course` FROM `lead_list` l inner join course_list s on l.course_id = s.id where l.id = '{$_GET['id']}'");
	if($qry->num_rows > 0){
        $res = $qry->fetch_array();
        foreach($res as $k => $v){
            if(!is_numeric($k))
            $$k = $v;
        }
    }


	
    if(isset($id)){
    $client_qry = $conn->query("SELECT *,CONCAT(lastname,', ', firstname,' ', COALESCE(middlename,'')) as fullname FROM `client_list` where lead_id = '{$id}' ");
    if($client_qry->num_rows > 0){
        $res = $client_qry->fetch_array();
        unset($res['id']);
        unset($res['date_created']);
        unset($res['date_updated']);
        foreach($res as $k => $v){
            if(!is_numeric($k))
            $$k = $v;
        }
    }
    }
	$assigned_to = isset($assigned_to) ? $assigned_to : null;
	$user_id = isset($user_id) ? $user_id : null;
	$users = $conn->query("SELECT id,CONCAT(lastname,', ', firstname,' ', COALESCE(middlename,'')) as fullname FROM `users` where id in ('$assigned_to','$user_id')");
	$user_arr = array_column($users->fetch_all(MYSQLI_ASSOC),'fullname','id');
}
$view = isset($_GET['view']) ? $_GET['view'] : 'info';
?>
<style>
	.list-group-item-action.active{
		color:#fff !important
	}
</style>
<div class="content py-3">
	<div class="card card-outline card-navy">
		<div class="card-header">
			<h4 class="card-title">Lead Ref. Code - <?= isset($code) ? $code : '' ?></h4>
		</div>
		<div class="card-body">
			<div class="container-fluid">
				<div class="row">
					<div class="col-3">
						<div class="list-group">
							<a href="./?page=view_lead&id=<?= isset($id) ? $id : '' ?>" class="text-decoration-none text-reset list-group-item list-group-item-action <?= $view == 'info' ? 'active' : '' ?>">
								<i class="nav-icon fa fa-info-circle"></i> Information
							</a>
						</div>
					</div>
					<div class="col-9">
						<?php include $view.'.php' ?>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	function update_status(){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=update_lead_status",
			method:"POST",
			data:{id: '<?= isset($id) ? $id : '' ?>',in_opportunity: '<?= isset($in_opportunity) ? $in_opportunity : '' ?>', status: 6},
			dataType:"json",
			error:err=>{
				console.note(err)
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