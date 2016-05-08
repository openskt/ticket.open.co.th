<div class="container" style="max-width:400px;margin: 0 auto;border: 0px solid red">
	<div class="page-header">
		<h1>Reset Password </h1><p>Please enter your 
		email address and we will send you a link to enter new password.</p>
	</div>
	<?php echo form_open('user/sendlink'); ?>
	  <div class="form-group">
	    <label for="exampleInputEmail1">Email address</label>
	    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
	  </div>
	  <button type="submit" class="btn btn-default">Send Link</button>
	<?=form_close()?>
</div>