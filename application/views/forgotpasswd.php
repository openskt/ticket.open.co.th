<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>OPEN System</title>

    <!-- Bootstrap -->
    <link href="<?=base_url()?>assets/css/bootstrap.min.css" rel="stylesheet">

    <link href="<?=base_url()?>assets/css/starter-template.css" rel="stylesheet">

    <link href="<?=base_url('assets/css/dashboard.css')?>" rel="stylesheet">
    <link href="<?=base_url('assets/font-awesome-4.5.0/css/font-awesome.min.css')?>" rel="stylesheet">
    

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
        <script src="<?=base_url()?>assets/js/jquery-1.12.2.min.js"></script>	
  </head>
  <body>
	
<div class="container" style="max-width:400px;margin: 0 auto;border: 0px solid red">
	<div class="page-header">
		<h1>Reset Password </h1><p>Please enter your 
		email address and we will send you a link to enter new password.</p>
	</div>
	<?php echo form_open('user/sendlink','id="form_forgotpasswd" class="form_horizontal"'); ?>
	
	<div class="form-group">
		<?=validation_errors()?>
	</div>
	  <div class="form-group">
	    <label for="email">Email address</label>
	    <input type="email" name="email" class="form-control" id="email" placeholder="Email" required>
	  </div>
	  <button type="submit" class="btn btn-default">Send Link</button>
	<?=form_close()?>
</div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>-->

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<?=base_url()?>assets/js/bootstrap.min.js"></script>
  </body>
</html>