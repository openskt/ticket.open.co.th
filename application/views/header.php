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
    <script src="<?=base_url()?>assets/js/jquery.validate.min.js"></script>
    <script>
  // When the browser is ready...
  $(function() {
  
    // Setup form validation on the #register-form element
    $("#form_login").validate({
    
        // Specify the validation rules
        rules: {
            //password: "required",
            //lastname: "required",
            email: {
                required: true,
                email: true
            },
            password: {
                required: true,
                minlength: 5
            },
            //agree: "required"
        },
        
        // Specify the validation error messages
        messages: {
            //firstname: "Please enter your first name",
            //lastname: "Please enter your last name",
            password: {
                required: "Please provide a password",
                minlength: "Your password must be at least 5 characters long"
            },
            email: "Please enter a valid email address",
            //agree: "Please accept our policy"
        },
        
        submitHandler: function(form) {
            form.submit();
        }
    });

  });
  
  </script>
	
  </head>
  <body>