<?php
class User extends CI_Model {
    public function __construct()
    {
        parrent::__construct();
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