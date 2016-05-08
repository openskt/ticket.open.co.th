<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller {

	public function __construct(){
		parent::__construct();
	}

	public function index()
	{
		$this->load->view('welcome_message');
	}

	public function forgotpasswd(){
		$this->load->helper(array('url','form'));

		$this->load->view('forgotpasswd');

	}

	/*
		Send reset password link to user
	*/
	public function sendlink()
	{
		$this->load->helper(array('url', 'form', 'string'));
		// $this->load->model('Password_model');
		
		// Validate email by helper
		$this->load->library('form_validation');

		// Change delimiters config
		$this->form_validation->set_error_delimiters('<div class="alert alert-danger" role="alert">','</div>');
		
		// Set validation rules
		$this->form_validation->set_rules('email', 'Email address', 'trim|required|valid_email|callback_email_exist');
	
		// Validation run
		if($this->form_validation->run() == FALSE)
		{
			$this->load->view('forgotpasswd');
		}
		else
		{
			$data['email'] = $this->input->post('email');
			$data['random_key'] = random_string('alnum', 8);

			// looking for old record of this email
			// if found set active=0 or delet it
			$this->db->set('active', 0, FALSE);
			$this->db->where('email', $data['email']);
			$this->db->update('authen_key');

			// Insert New Data
			$this->db->insert("authen_key", $data);
			// Sending email
			// =====================
			// 1. generate random key => insert into authen_keys table. //email//key//expiredate//active
			// 1.1 mysql> SELECT DATE_ADD(NOW(), INTERVAL 1 HOUR);
			// $this->Password_model->save_auth_key($email);

			// 2. send link

			// send email
			$this->load->library('email');
			$this->email->from('noreply@open.co.th', 'OPEN Ticket System - Do not reply');
			$this->email->to($data['email']);
			$this->email->subject('Reset password - OPEN Ticket System');
			$this->email->message('To reset your password please click this link bewlow: \n{unwrap}'.base_url().'/user/rstpassword/'.$data['random_key'].'{/unwrap}. \nThe link will be expired in 60 minutes. \n\n-- OPEN Ticket System');
			$this->email->send();

			// load view
			$this->load->view('sendlink', $data);
		}

	}
	
	// Callback function from validation rules
	public function email_exist($email)
	{
		//$this->load->model('Email_model');
		$this->load->database();
		
		$this->db->select('fname, email');
		$this->db->where('email', $email);
		$this->db->from('staff');

		$query = $this->db->get();
		
		if($query->num_rows() > 0 )
		{
			return TRUE;
		}
		else
		{
			$this->form_validation->set_message('email_exist', 'The {field} do not exist in our system.');
			return FALSE;
		}
		
	}
}
