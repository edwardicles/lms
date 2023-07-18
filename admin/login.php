<?php require_once('../config.php') ?>
<!DOCTYPE html>
<html lang="en" class="" style="height: auto;">
 <?php require_once('inc/header.php') ?>
<body class="hold-transition ">

  <style>
   #template-bg-3 {
	background-image: url('../../images/template-bg-3.jpg');
}

/* Welcome page style */
.bg-image {
	background-image: url('../../images/welcome-page-bg.jpg');
}

@media screen and (min-width:768px) and (max-width: 980px) {
	.card {
		width: 50% !important;
		display: initial;
	}
}

  </style>
      

    <div class="d-flex flex-column min-vh-100 justify-content-center align-items-center"
    id="template-bg-3">
    <div class="card mb-5 p-5  bg-dark bg-gradient text-white col-md-4">
        <div class="card-header text-center">

          <div class="card-body mt-3">
            <form id="login-frm" action="" method="post">
              <div  class="input-group form-group mt-3">
                <input type="text" class="form-control text-center p-3"  name="username" placeholder="Username">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <span class="fas fa-user"></span>
                  </div>
                </div>
              </div>
              <div class="input-group form-group mt-3">
                <input type="password" class="form-control" name="password" placeholder="Password">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <span class="fas fa-lock"></span>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-8">
                </div>
                <!-- /.col -->
                <div class="text-center">
                    <input type="submit" value="Login"
                        class="btn btn-primary mt-3 w-100 p-2"
                        name="login-btn">
                </div>
                <!-- /.col -->
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>

<script>
  $(document).ready(function(){
    end_loader();
  })
</script>
</body>
</html>