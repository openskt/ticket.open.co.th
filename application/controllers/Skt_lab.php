<?php
defined('BASEPATH') OR exit('No direct script access allowed.');

class Skt_lab extends CI_Controller {
    public function __construct(){
        parent::__construct();
        $this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');
    }
    
    public function index(){
        $this->load->view('lab_validate');
    }
    
    public function lab_validate(){
        
        $this->form_validation->set_error_delimiters('<div class="alert alert-danger" role="alert">', '</div>');
        
        $this->form_validation->set_rules('username', 'Username', 'trim|min_length[5]|max_length[16]|required|callback_username_check');
        $this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[8]');
        $this->form_validation->set_rules('passconf', 'Password Confirmation', 'trim|required|matches[password]');
        $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email|is_unique[users.email]');
        
        if($this->form_validation->run() == FALSE) {
            $this->load->view('lab_validate');
        } else {
            $this->load->view('lab_validate_success');
        }
    }
    
    public function username_check($str){
        if($str == 'test'){
            $this->form_validation->set_message('username_check', 'The {field} field can not be the word "test"');
            return FALSE;
        }else{
            return TRUE;
        }
    }
}
?>