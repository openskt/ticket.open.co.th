<html>
<head>
    <title>Validation LAB1</title>
</head>
<body>
<?php

    echo validation_errors();
    echo form_open('skt_lab/lab_validate');
?>
<h5>Username</h5>
<input type="text" name="username" value="<?php echo set_value('username'); ?>" size="50" />

<h5>Password</h5>
<input type="text" name="password" value="<?php echo set_value('password'); ?>" size="50" />

<h5>Password confirm</h5>
<input type="text" name="passconf" value="<?php echo set_value('passconf'); ?>" />

<h5>Email Address</h5>
<input type="text" name="email" value="<?php echo set_value('email'); ?>" />

<div><input type="submit" value="Submit"></div>
</form>
</body>
</html>