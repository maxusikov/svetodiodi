<?php
class ControllerInformationAbout extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}

                $this->load->language('information/about');
                
                $data['heading_title'] = $this->language->get('heading_title');
                
                $data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/about')
		);
                
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
                
		$this->response->setOutput($this->load->view('information/about', $data));
	}
        
        public function validate(){
            if (isset($this->request->post['name'])) {
                if (utf8_strlen($this->request->post['name']) < 2 || utf8_strlen($this->request->post['name']) < 64) {
                    $this->error['name'] = $this->language->get('error_name');
                }
            }
            
            if (isset($this->request->post['email'])) {
                if (utf8_strlen($this->request->post['email']) < 2 || utf8_strlen($this->request->post['email']) < 96) {
                    $this->error['email'] = $this->language->get('error_email');
                }
            }
            
            if (isset($this->request->post['phone'])) {
                if (utf8_strlen($this->request->post['phone']) > 20) {
                    $this->error['phone'] = $this->language->get('error_phone');
                }
            }
        }
}
