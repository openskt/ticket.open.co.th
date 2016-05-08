<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index1()
	{
		$this->load->view('welcome_message');
	}

	public function index()
	{
		$this->load->helper(array('url','form'));
		
		/*
		$data = array(
			'title' => 'Restricted area - Staff only please login',
			'message' => 'Hello world!',
			'footer' => '&copy; 2016 Open System Consulting Co., Ltd.'
			);
		*/
		//$this->load->view('header', $data);
		$this->load->view('login');
		//$this->load->view('footer', $data);
	}
	
	public function testdb()
	{
		$this->load->database();
		
		
		$this->db->select('fname, email');
		$this->db->where('email', 'kittisak@open.co.th');
		$this->db->from('staff');
		
		//$query = $this->db->query('SELECT * FROM staff WHERE email = "kittisak@open.co.th"');
		$query = $this->db->get();
		
		if($query->num_rows()>0)
		{
			echo "<html><h1>Yes.<br>";
			foreach ($query->result() as $row)
			{
				echo $row->fname;
				echo "<br>";
				echo $row->email;
			}
		}
		
		/*
		foreach ($query->result() as $row)
		{
			echo $row->fname;
			echo $row->email;
		}
		*/
		$this->db->close();
	}
}
