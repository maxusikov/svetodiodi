<?php
class ControllerInformationPricelist extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}

                $this->load->language('information/pricelist');
                
                $data['heading_title'] = $this->language->get('heading_title');
                
                $data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/pricelist')
		);
                
                $data['logged'] = $this->customer->isLogged();
                
                $data['register'] = $this->url->link('account/register');
                $data['send_contact_data'] = $this->url->link('');
                $data['download_pricelist'] = DIR_IMAGE . 'cache/test_download_file.txt';
                
                $data['text_send'] = $this->language->get('text_send');
                $data['text_to_download_you_need'] = $this->language->get('text_to_download_you_need');
                $data['text_register'] = $this->language->get('text_register');
                $data['text_send_contacts'] = $this->language->get('text_send_contacts');
                $data['text_download_pricelist'] = $this->language->get('text_download_pricelist');
                
                $data['entry_name'] = $this->language->get('entry_name');
                $data['entry_email'] = $this->language->get('entry_email');
                $data['entry_telephone'] = $this->language->get('entry_telephone');
                
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
                
		$this->response->setOutput($this->load->view('information/pricelist', $data));
	}
}
