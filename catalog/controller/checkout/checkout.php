<?php
class ControllerCheckoutCheckout extends Controller {
	public function index() {
		// Validate cart has products and has stock.
		if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$this->response->redirect($this->url->link('checkout/cart'));
		}

		// Validate minimum quantity requirements.
		$products = $this->cart->getProducts();

		foreach ($products as $product) {
			$product_total = 0;

			foreach ($products as $product_2) {
				if ($product_2['product_id'] == $product['product_id']) {
					$product_total += $product_2['quantity'];
				}
			}

			if ($product['minimum'] > $product_total) {
				$this->response->redirect($this->url->link('checkout/cart'));
			}
		}

		$this->load->language('checkout/checkout');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/locale/'.$this->session->data['language'].'.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

		// Required by klarna
		if ($this->config->get('klarna_account') || $this->config->get('klarna_invoice')) {
			$this->document->addScript('http://cdn.klarna.com/public/kitt/toc/v1.0/js/klarna.terms.min.js');
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_cart'),
			'href' => $this->url->link('checkout/cart')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('checkout/checkout', '', true)
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_checkout_option'] = sprintf($this->language->get('text_checkout_option'), 1);
		$data['text_checkout_account'] = sprintf($this->language->get('text_checkout_account'), 2);
		$data['text_checkout_payment_address'] = sprintf($this->language->get('text_checkout_payment_address'), 2);
		$data['text_checkout_shipping_address'] = sprintf($this->language->get('text_checkout_shipping_address'), 3);
		$data['text_checkout_shipping_method'] = sprintf($this->language->get('text_checkout_shipping_method'), 4);
		
		if ($this->cart->hasShipping()) {
			$data['text_checkout_payment_method'] = sprintf($this->language->get('text_checkout_payment_method'), 5);
			$data['text_checkout_confirm'] = sprintf($this->language->get('text_checkout_confirm'), 6);
		} else {
			$data['text_checkout_payment_method'] = sprintf($this->language->get('text_checkout_payment_method'), 3);
			$data['text_checkout_confirm'] = sprintf($this->language->get('text_checkout_confirm'), 4);	
		}

		if (isset($this->session->data['error'])) {
			$data['error_warning'] = $this->session->data['error'];
			unset($this->session->data['error']);
		} else {
			$data['error_warning'] = '';
		}

		$data['logged'] = $this->customer->isLogged();

		if (isset($this->session->data['account'])) {
			$data['account'] = $this->session->data['account'];
		} else {
			$data['account'] = '';
		}

		$data['shipping_required'] = $this->cart->hasShipping();

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('checkout/checkout', $data));
	}

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function customfield() {
		$json = array();

		$this->load->model('account/custom_field');

		// Customer Group
		if (isset($this->request->get['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->get['customer_group_id'], $this->config->get('config_customer_group_display'))) {
			$customer_group_id = $this->request->get['customer_group_id'];
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		$custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);

		foreach ($custom_fields as $custom_field) {
			$json[] = array(
				'custom_field_id' => $custom_field['custom_field_id'],
				'required'        => $custom_field['required']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
        
        public function addOrder(){
            $response_data = [
                'status' => 'info',
                'info'   => 'Запрос не обработан'
            ];
            
            if($this->customer->isLogged()){
                if($this->cart->getProducts()){
                    $order_data = [];
                    
                    $order_data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
                    $order_data['store_id'] = $this->config->get('config_store_id');
                    $order_data['store_name'] = $this->config->get('config_name');
                    
                    if ($order_data['store_id']) {
                        $order_data['store_url'] = $this->config->get('config_url');
                    } else {
                        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
                            $order_data['store_url'] = HTTPS_SERVER;
                        } else {
                            $order_data['store_url'] = HTTP_SERVER;
                        }
                    }
                    
                    $this->load->model('account/customer');

                    $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
                    
                    $order_data['customer_id']       = $this->customer->getId();
                    $order_data['customer_group_id'] = $customer_info['customer_group_id'];
                    $order_data['firstname']         = $customer_info['firstname'];
                    $order_data['lastname']          = $customer_info['lastname'];
                    $order_data['email']             = $customer_info['email'];
                    $order_data['telephone']         = $customer_info['telephone'];
                    $order_data['fax']               = $customer_info['fax'];
                    
                    $order_data['payment_firstname'] = isset($this->session->data['payment_address']['firstname']) ? $this->session->data['payment_address']['firstname'] : '';
                    $order_data['payment_lastname']  = isset($this->session->data['payment_address']['lastname']) ? $this->session->data['payment_address']['lastname'] : '';
                    $order_data['payment_company']   = isset($this->session->data['payment_address']['company']) ? $this->session->data['payment_address']['company'] : '';
                    $order_data['payment_address_1'] = isset($this->session->data['payment_address']['address_1']) ? $this->session->data['payment_address']['address_1'] : '';
                    $order_data['payment_address_2'] = isset($this->session->data['payment_address']['address_2']) ? $this->session->data['payment_address']['address_2'] : '';
                    $order_data['payment_city']      = isset($this->session->data['payment_address']['city']) ? $this->session->data['payment_address']['city'] : '';
                    $order_data['payment_postcode']  = isset($this->session->data['payment_address']['postcode']) ? $this->session->data['payment_address']['postcode'] : '';
                    $order_data['payment_zone']      = isset($this->session->data['payment_address']['zone']) ? $this->session->data['payment_address']['zone'] : '';
                    $order_data['payment_zone_id']   = isset($this->session->data['payment_address']['zone_id']) ? $this->session->data['payment_address']['zone_id'] : '';
                    $order_data['payment_country']   = isset($this->session->data['payment_address']['country']) ? $this->session->data['payment_address']['country'] : '';
                    $order_data['payment_country_id']     = isset($this->session->data['payment_address']['country_id']) ? $this->session->data['payment_address']['country_id'] : '';
                    $order_data['payment_address_format'] = isset($this->session->data['payment_address']['address_format']) ? $this->session->data['payment_address']['address_format'] : '';
                    
                    if (isset($this->session->data['payment_method']['title'])) {
                        $order_data['payment_method'] = $this->session->data['payment_method']['title'];
                    } else {
                        $order_data['payment_method'] = '';
                    }
                    
                    if (isset($this->session->data['payment_method']['code'])) {
                        $order_data['payment_code'] = $this->session->data['payment_method']['code'];
                    } else {
                        $order_data['payment_code'] = '';
                    }
                    
                    $order_data['shipping_firstname'] = isset($this->session->data['shipping_address']['firstname']) ? $this->session->data['shipping_address']['firstname'] : '';
                    $order_data['shipping_lastname']  = isset($this->session->data['shipping_address']['lastname']) ? $this->session->data['shipping_address']['lastname'] : '';
                    $order_data['shipping_company']   = isset($this->session->data['shipping_address']['company']) ? $this->session->data['shipping_address']['company'] : '';
                    $order_data['shipping_address_1'] = isset($this->session->data['shipping_address']['address_1']) ? $this->session->data['shipping_address']['address_1'] : '';
                    $order_data['shipping_address_2'] = isset($this->session->data['shipping_address']['address_2']) ? $this->session->data['shipping_address']['address_2'] : '';
                    $order_data['shipping_city']      = isset($this->session->data['shipping_address']['city']) ? $this->session->data['shipping_address']['city'] : '';
                    $order_data['shipping_postcode']  = isset($this->session->data['shipping_address']['postcode']) ? $this->session->data['shipping_address']['postcode'] : '';
                    $order_data['shipping_zone']      = isset($this->session->data['shipping_address']['zone']) ? $this->session->data['shipping_address']['zone'] : '';
                    $order_data['shipping_zone_id']   = isset($this->session->data['shipping_address']['zone_id']) ? $this->session->data['shipping_address']['zone_id'] : '';
                    $order_data['shipping_country']   = isset($this->session->data['shipping_address']['country']) ? $this->session->data['shipping_address']['country'] : '';
                    $order_data['shipping_country_id']     = isset($this->session->data['shipping_address']['country_id']) ? $this->session->data['shipping_address']['country_id'] : '';
                    $order_data['shipping_address_format'] = isset($this->session->data['shipping_address']['address_format']) ? $this->session->data['shipping_address']['address_format'] : '';
                    
                    if (isset($this->session->data['shipping_method']['title'])) {
                        $order_data['shipping_method'] = $this->session->data['shipping_method']['title'];
                    } else {
                        $order_data['shipping_method'] = '';
                    }

                    if (isset($this->session->data['shipping_method']['code'])) {
                        $order_data['shipping_code'] = $this->session->data['shipping_method']['code'];
                    } else {
                        $order_data['shipping_code'] = '';
                    }

                    $order_data['comment'] = isset($this->session->data['comment']) ? $this->session->data['comment'] : '';
                    
                    // Because __call can not keep var references so we put them into an array.
                    $total_data = array(
                            'totals' => &$totals,
                            'taxes'  => &$taxes,
                            'total'  => &$total
                    );

                    $this->load->model('extension/extension');

                    $sort_order = array();

                    $results = $this->model_extension_extension->getExtensions('total');

                    foreach ($results as $key => $value) {
                            $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
                    }

                    array_multisort($sort_order, SORT_ASC, $results);

                    foreach ($results as $result) {
                            if ($this->config->get($result['code'] . '_status')) {
                                    $this->load->model('extension/total/' . $result['code']);

                                    // We have to put the totals in an array so that they pass by reference.
                                    $this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
                            }
                    }
                    
                    $order_data['total'] = $total_data['total'];
                    
                    if (isset($this->request->cookie['tracking'])) {
                        $order_data['tracking'] = $this->request->cookie['tracking'];

                        $subtotal = $this->cart->getSubTotal();

                        // Affiliate
                        $this->load->model('affiliate/affiliate');

                        $affiliate_info = $this->model_affiliate_affiliate->getAffiliateByCode($this->request->cookie['tracking']);

                        if ($affiliate_info) {
                                $order_data['affiliate_id'] = $affiliate_info['affiliate_id'];
                                $order_data['commission'] = ($subtotal / 100) * $affiliate_info['commission'];
                        } else {
                                $order_data['affiliate_id'] = 0;
                                $order_data['commission'] = 0;
                        }

                        // Marketing
                        $this->load->model('checkout/marketing');

                        $marketing_info = $this->model_checkout_marketing->getMarketingByCode($this->request->cookie['tracking']);

                        if ($marketing_info) {
                                $order_data['marketing_id'] = $marketing_info['marketing_id'];
                        } else {
                                $order_data['marketing_id'] = 0;
                        }
                    } else {
                        $order_data['affiliate_id'] = 0;
                        $order_data['commission'] = 0;
                        $order_data['marketing_id'] = 0;
                        $order_data['tracking'] = '';
                    }

                    $order_data['language_id'] = $this->config->get('config_language_id');
                    $order_data['currency_id'] = $this->currency->getId($this->session->data['currency']);
                    $order_data['currency_code'] = $this->session->data['currency'];
                    $order_data['currency_value'] = $this->currency->getValue($this->session->data['currency']);
                    $order_data['ip'] = $this->request->server['REMOTE_ADDR'];

                    $order_data['user_agent']       = isset($this->request->server['HTTP_USER_AGENT']) ? $this->request->server['HTTP_USER_AGENT'] : '';
                    $order_data['accept_language']  = isset($this->request->server['HTTP_ACCEPT_LANGUAGE']) ? $this->request->server['HTTP_ACCEPT_LANGUAGE'] : '';
                    
                    if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
                        $order_data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
                    } elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
                        $order_data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
                    } else {
                        $order_data['forwarded_ip'] = '';
                    }
                    
                    $order_data['order_status_id'] = 1;
                    
                    $order_data['products'] = array();

                    foreach ($this->cart->getProducts() as $product) {
                            $option_data = array();

                            foreach ($product['option'] as $option) {
                                    $option_data[] = array(
                                            'product_option_id'       => $option['product_option_id'],
                                            'product_option_value_id' => $option['product_option_value_id'],
                                            'option_id'               => $option['option_id'],
                                            'option_value_id'         => $option['option_value_id'],
                                            'name'                    => $option['name'],
                                            'value'                   => $option['value'],
                                            'type'                    => $option['type']
                                    );
                            }

                            $order_data['products'][] = array(
                                    'product_id' => $product['product_id'],
                                    'name'       => $product['name'],
                                    'model'      => $product['model'],
                                    'option'     => $option_data,
                                    'download'   => $product['download'],
                                    'quantity'   => $product['quantity'],
                                    'subtract'   => $product['subtract'],
                                    'price'      => $product['price'],
                                    'total'      => $product['total'],
                                    'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
                                    'reward'     => $product['reward']
                            );
                    }
                    
                } else {
                    $response_data = [
                        'status' => 'info',
                        'info'   => 'Cart is empty'
                    ];
                    
                    echo json_encode($response_data);
                }

                $order_data['store_id'] = $this->config->get('config_store_id');

                if ($order_data['store_id']) {
                    $order_data['store_url'] = $this->config->get('config_url');
                } else {
                    if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
                        $order_data['store_url'] = HTTPS_SERVER;
                    } else {
                        $order_data['store_url'] = HTTP_SERVER;
                    }
                }
                
                $this->load->model('checkout/order');

                $this->session->data['order_id'] = $this->model_checkout_order->addOrder($order_data);
                
                if (isset($this->session->data['order_id'])) {
                    $this->cart->clear();
                    
                    // Mail sending
                    $subject = "Новый заказ";

                    $message = "Поступил новый заказ";

                    $mail = new Mail();
                    $mail->protocol = $this->config->get('config_mail_protocol');
                    $mail->parameter = $this->config->get('config_mail_parameter');
                    $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
                    $mail->smtp_username = $this->config->get('config_mail_smtp_username');
                    $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
                    $mail->smtp_port = $this->config->get('config_mail_smtp_port');
                    $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

                    $mail->setTo($this->config->get('config_email'));
                    $mail->setFrom($this->config->get('config_email'));
                    $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
                    $mail->setSubject($subject);
                    $mail->setText($message);
                    $mail->send();
                    
                    // 
                    
                    $response_data = [
                        'status' => 'success',
                        'info'   => 'Order added successfully. Order ID: ' . $this->session->data['order_id']
                    ];
                } else {
                    $response_data = [
                        'status' => 'fail',
                        'info'   => 'Order was not added'
                    ];
                }
            } else {
                $response_data = [
                    'status' => 'fail',
                    'info'   => 'There are no logged customer'
                ];
            }
            
            echo json_encode($response_data);
        }
}
