<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller {

	public function index()
	{
		$this->load->view('welcome_message');
	}

	public function forgotpasswd()
	{
		$this->load->helper(array('url','form'));

		$data = array(
			'title' => 'Restricted area - Staff only please login',
			'message' => 'Hello world!',
			'footer' => '&copy; 2016 Open System Consulting Co., Ltd.'
			);

		$this->load->view('header', $data);
		$this->load->view('forgotpasswd', $data);
		$this->load->view('footer', $data);
	}

	/*
		Send reset password link to user
	*/
	public function sendlink()
	{
		$this->load->helper(array('url', 'form'));

		$data = array(
			'title' => 'Reset password',
			'footer' => '&copy; 2016 Open System Consulting Co., Ltd.'
			);

		$this->load->view('header', $data);
		$this->load->view('sendlink');
		$this->load->view('footer', $data);

	}
}
