<?php
class Email_model extends CI_Model {
    public function __construct()
    {
        parent::__construct();
    }
    
    public function index()
    {

    }
    
    public function rst_password()
    {
        $this->email = $_POST['email'];
        echo "<html><h1>";
        echo $this->email;
    }
}
?>