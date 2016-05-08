<div class="container" style="max-width:400px;margin: 0 auto;border: 0px solid red">
	<div class="page-header">
		<h1>Please login <small>Enter your email and password</small></h1>
	</div>
	<?php echo form_open('ticket/dashboard'); ?>
	  <div class="form-group">
	    <label for="exampleInputEmail1">Email address</label>
	    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">Password</label>
	    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
	  </div>
	  <div class="checkbox">
	    <label><a href="<?=base_url()?>user/forgotpasswd">Forgot or reset password</a></label>
	  </div>
	  <button type="submit" class="btn btn-default">Login</button>
	<?=form_close()?>
</div>