<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);
                
		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

                // Svetodiodi data
                $data['text_catalog'] = $this->language->get('text_catalog');
                
                $this->load->model('catalog/category');
                $categories = $this->model_catalog_category->getCategories(0);
                
                $data['categories'] = [];
                
                foreach ($categories as $category) {
                    $data['categories'][$category['category_id']] = [
                        'category_id' => $category['category_id'],
                        'name' => $category['name'],
                        'href' => $this->url->link('product/category', 'path=' . $category['category_id'])
                    ];
                }
                
                $data['text_useful_informations'] = $this->language->get('text_useful_informations');
                $data['useful_informations'] = [
                    'about_company' => [
                        'name' => $this->language->get('text_about_company'),
                        'href' => $this->url->link('information/information', 'information_id=4')
                    ],
                    'actions' => [
                        'name' => $this->language->get('text_actions'),
                        'href' => $this->url->link('information/action')
                    ],
                    'tearms_of_cooperation' => [
                        'name' => $this->language->get('text_terms_of_cooperations'),
                        'href' => $this->url->link('information/information', 'information_id=9')
                    ],
                    'price_list' => [
                        'name' => $this->language->get('text_price_list'),
                        'href' => $this->url->link('information/information', 'information_id=6')
                    ],
                    'contacts' => [
                        'name' => $this->language->get('text_contacts'),
                        'href' => $this->url->link('information/contact')
                    ]
                ];
                
                $data['text_contacts'] = $this->language->get('text_contacts');
                $data['text_office_address'] = $this->language->get('text_office_address');
                $data['text_stock_address'] = $this->language->get('text_stock_address');
                
                $data['contacts'] = [];
                $data['contacts']['telephone_1'] = [
                    'number' => $this->config->get('config_telephone')
                ];
                $data['contacts']['telephone_2'] = [
                    'number' => $this->config->get('config_telephone_2')
                ];
                $data['contacts']['email'] = [
                    'address' => $this->config->get('config_email')
                ];
                $data['contacts']['address'] = [
                    'office' => [
                        'address' => html_entity_decode($this->config->get('config_address'))
                    ],
                    'stock'  => [
                        'address' => html_entity_decode($this->config->get('config_address_stock'))
                    ]
                ];
                
		return $this->load->view('common/footer', $data);
	}
}
