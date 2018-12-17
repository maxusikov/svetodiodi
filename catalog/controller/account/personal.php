<?php
class ControllerAccountPersonal extends Controller {
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/account', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->load->language('account/personal');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', true)
		);
                
                $data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_personal_data'),
			'href' => $this->url->link('account/personal', '', true)
		);

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		} 
                
		$data['heading_title'] = $this->language->get('heading_title');
                
                //
                $customer_id = $this->customer->isLogged();
                
                $this->load->model('account/customer');
                
                $customer_personal_data = $this->model_account_customer->getCustomerPersonalData($customer_id);
                
                // Check for updating data
                $personal_data = [];
                
                if (isset($this->request->post['personal'])) {
                    $personal = $this->request->post['personal'];
                    
                    if (isset($personal['naming'])){
                        $personal_data['naming'] = $personal['naming'];
                    } else {
                        $personal_data['naming'] = '';
                    }
                    
                    if (isset($personal['telephone'])){
                        $personal_data['telephone'] = $personal['telephone'];
                    } else {
                        $personal_data['telephone'] = '';
                    }
                    
                    if (isset($personal['fax'])){
                        $personal_data['fax'] = $personal['fax'];
                    } else {
                        $personal_data['fax'] = '';
                    }
                    
                    if (isset($personal['email'])){
                        $personal_data['email'] = $personal['email'];
                    } else {
                        $personal_data['email'] = '';
                    }
                    
                    if (isset($personal['kontragent_type'])){
                        $personal_data['kontragent_type'] = $personal['kontragent_type'];
                    } else {
                        $personal_data['kontragent_type'] = 0;
                    }
                    
                    if (isset($personal['full_naming'])){
                        $personal_data['full_naming'] = $personal['full_naming'];
                    } else {
                        $personal_data['full_naming'] = '';
                    }
                    
                    if (isset($personal['legal_address'])){
                        $personal_data['legal_address'] = $personal['legal_address'];
                    } else {
                        $personal_data['legal_address'] = '';
                    }
                    
                    if (isset($personal['INN'])){
                        $personal_data['INN'] = $personal['INN'];
                    } else {
                        $personal_data['INN'] = '';
                    }
                    
                    if (isset($personal['KPP'])){
                        $personal_data['KPP'] = $personal['KPP'];
                    } else {
                        $personal_data['KPP'] = '';
                    }
                    
                    if (isset($personal['OGRN'])){
                        $personal_data['OGRN'] = $personal['OGRN'];
                    } else {
                        $personal_data['OGRN'] = '';
                    }
                    
                    if (isset($personal['OKPO'])){
                        $personal_data['OKPO'] = $personal['OKPO'];
                    } else {
                        $personal_data['OKPO'] = '';
                    }
                    
                    if (isset($personal['BIK'])){
                        $personal_data['BIK'] = $personal['BIK'];
                    } else {
                        $personal_data['BIK'] = '';
                    }
                    
                    if (isset($personal['bank'])){
                        $personal_data['bank'] = $personal['bank'];
                    } else {
                        $personal_data['bank'] = '';
                    }
                    
                    if (isset($personal['address'])){
                        $personal_data['address'] = $personal['address'];
                    } else {
                        $personal_data['address'] = '';
                    }
                    
                    if (isset($personal['correspondent_account'])){
                        $personal_data['correspondent_account'] = $personal['correspondent_account'];
                    } else {
                        $personal_data['correspondent_account'] = '';
                    }
                    
                    if (isset($personal['checking_account'])){
                        $personal_data['checking_account'] = $personal['checking_account'];
                    } else {
                        $personal_data['checking_account'] = '';
                    }
                    
                    $personal_data['customer_id'] = $customer_id;
                    
                    if ($customer_personal_data) {
                        $this->model_account_customer->updateCustomerPersonalData($personal_data);
                    } else {
                        $this->model_account_customer->addCustomerPersonalData($personal_data);
                    }
                    
                    $data['personal'] = $personal_data;
                } else {
                    $data['personal'] = $customer_personal_data;
                }
                
                // Text
                $data['text_home'] = $this->language->get('text_home');
                $data['text_account'] = $this->language->get('text_account');
                $data['text_personal_data'] = $this->language->get('text_personal_data');
                $data['text_common_requisites'] = $this->language->get('text_common_requisites');
                $data['text_legal_requisites'] = $this->language->get('text_legal_requisites');
                $data['text_checking_account'] = $this->language->get('text_checking_account');
                $data['text_save_changes'] = $this->language->get('text_save_changes');

                // Label
                $data['label_name'] = $this->language->get('label_name');
                $data['label_phone'] = $this->language->get('label_phone');
                $data['label_fax'] = $this->language->get('label_fax');
                $data['label_email'] = $this->language->get('label_email');
                $data['label_kontragent_type'] = $this->language->get('label_kontragent_type');
                $data['label_full_name'] = $this->language->get('label_full_name');
                $data['label_legal_address'] = $this->language->get('label_legal_address');
                $data['label_INN'] = $this->language->get('label_INN');
                $data['label_KPP'] = $this->language->get('label_KPP');
                $data['label_OGRN'] = $this->language->get('label_OGRN');
                $data['label_OKPO'] = $this->language->get('label_OKPO');
                $data['label_BIK'] = $this->language->get('label_BIK');
                $data['label_bank'] = $this->language->get('label_bank');
                $data['label_address'] = $this->language->get('label_address');
                $data['label_correspondent_account'] = $this->language->get('label_correspondent_account');
                $data['label_checking_account'] = $this->language->get('label_checking_account');
                
                //
                $data['personal_data'] = $this->url->link('account/personal', true);
                //
                
		$data['edit'] = $this->url->link('account/edit', '', true);
		$data['password'] = $this->url->link('account/password', '', true);
		$data['address'] = $this->url->link('account/address', '', true);
		
		$data['credit_cards'] = array();
		
		$files = glob(DIR_APPLICATION . 'controller/extension/credit_card/*.php');
		
		foreach ($files as $file) {
			$code = basename($file, '.php');
			
			if ($this->config->get($code . '_status') && $this->config->get($code . '_card')) {
				$this->load->language('extension/credit_card/' . $code);

				$data['credit_cards'][] = array(
					'name' => $this->language->get('heading_title'),
					'href' => $this->url->link('extension/credit_card/' . $code, '', true)
				);
			}
		}
		
		$data['wishlist'] = $this->url->link('account/wishlist');
		$data['order'] = $this->url->link('account/order', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		
		if ($this->config->get('reward_status')) {
			$data['reward'] = $this->url->link('account/reward', '', true);
		} else {
			$data['reward'] = '';
		}		
		
		$data['return'] = $this->url->link('account/return', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);
		$data['recurring'] = $this->url->link('account/recurring', '', true);
                
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
		$this->response->setOutput($this->load->view('account/personal', $data));
	}        
}
