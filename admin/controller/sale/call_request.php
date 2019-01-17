<?php
class ControllerSaleCallRequest extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('sale/call_request');

		$this->document->setTitle($this->language->get('heading_title'));		

		$this->getList();
	}
	
	protected function getList() {
                $this->load->language('sale/call_request');
                
                $this->load->model('sale/call_request');
            
		if (isset($this->request->get['filter_call_request_id'])) {
			$filter_call_request_id = $this->request->get['filter_call_request_id'];
		} else {
			$filter_call_request_id = null;
		}

		if (isset($this->request->get['filter_customer'])) {
			$filter_customer = $this->request->get['filter_customer'];
		} else {
			$filter_customer = null;
		}

		if (isset($this->request->get['filter_call_request_status'])) {
			$filter_call_request_status = $this->request->get['filter_call_request_status'];
		} else {
			$filter_call_request_status = null;
		}

		if (isset($this->request->get['filter_date_added'])) {
			$filter_date_added = $this->request->get['filter_date_added'];
		} else {
			$filter_date_added = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'o.order_id';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_call_request_id'])) {
			$url .= '&filter_call_request_id=' . $this->request->get['filter_call_request_id'];
		}

		if (isset($this->request->get['filter_customer'])) {
			$url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_call_request_status'])) {
			$url .= '&filter_call_request_status=' . $this->request->get['filter_call_request_status'];
		}

		if (isset($this->request->get['filter_total'])) {
			$url .= '&filter_total=' . $this->request->get['filter_total'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('sale/call_request', 'token=' . $this->session->data['token'] . $url, true)
		);
	
		$data['call_requests'] = array();

		$filter_data = array(
			'filter_call_request_id'      => $filter_call_request_id,
			'filter_customer'	   => $filter_customer,
			'filter_call_request_status'  => $filter_call_request_status,
			'filter_date_added'    => $filter_date_added,
			'sort'                 => $sort,
			'start'                => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                => $this->config->get('config_limit_admin')
		);

		$results = $this->model_sale_call_request->getCallRequestList($filter_data);

		foreach ($results as $result) {
			$data['call_requests'][] = array(
				'call_request_id'      => $result['call_request_id'],
                                'customer_name'        => $result['customer_name'],
                                'email'                => $result['customer_email'],
                                'telephone'            => $result['customer_telephone'],
				'call_request_status'  => $result['call_request_status'] ? $result['call_request_status'] : $this->language->get('text_undefined'),
				'date_added'           => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                                'date_modified'        => date($this->language->get('date_format_short'), strtotime($result['date_modified'])),
                                'view'                 => $this->url->link('sale/call_request/viewCallRequest', 'call_request_id=' . $result['call_request_id'] . '&token=' . $this->session->data['token'], true)
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
                $data['text_confirm'] = $this->language->get('text_confirm');
		
                $date['entry_call_request_status'] = $this->language->get('entry_status');
                
		$data['column_call_request_id'] = $this->language->get('column_call_request_id');
                $data['column_call_request_name'] = $this->language->get('column_call_request_name');
                $data['column_call_request_email'] = $this->language->get('column_call_request_email');
                $data['column_call_request_telephone'] = $this->language->get('column_call_request_telephone');
		$data['column_call_request_status'] = $this->language->get('column_call_request_status');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_date_modified'] = $this->language->get('column_date_modified');
		$data['column_action'] = $this->language->get('column_action');

		$data['entry_call_request_id'] = $this->language->get('entry_call_request_id');
		$data['entry_customer'] = $this->language->get('entry_customer');
		$data['entry_call_request_status'] = $this->language->get('entry_call_request_status');
		$data['entry_date_added'] = $this->language->get('entry_date_added');
		$data['entry_date_modified'] = $this->language->get('entry_date_modified');

		$data['button_add']    = $this->language->get('button_add');
		$data['button_edit']   = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');
		$data['button_view']   = $this->language->get('button_view');

		$data['token']  = $this->session->data['token'];
                $data['delete'] = $this->url->link('sale/call_request/delete', 'token=' . $this->session->data['token'], true);
                
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if (isset($this->request->get['filter_call_request_id'])) {
			$url .= '&filter_call_request_id=' . $this->request->get['filter_call_request_id'];
		}

		if (isset($this->request->get['filter_customer'])) {
			$url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_call_request_status'])) {
			$url .= '&filter_call_request_status=' . $this->request->get['filter_call_request'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		/*
                 * if (isset($this->request->get['filter_date_modified'])) {
			$url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
		}
                 */

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_order'] = $this->url->link('sale/call_request', 'token=' . $this->session->data['token'] . '&sort=o.order_id' . $url, true);
		$data['sort_customer'] = $this->url->link('sale/call_request', 'token=' . $this->session->data['token'] . '&sort=customer' . $url, true);
		$data['sort_status'] = $this->url->link('sale/call_request', 'token=' . $this->session->data['token'] . '&sort=order_status' . $url, true);
		$data['sort_total'] = $this->url->link('sale/call_request', 'token=' . $this->session->data['token'] . '&sort=o.total' . $url, true);
		$data['sort_date_added'] = $this->url->link('sale/call_request', 'token=' . $this->session->data['token'] . '&sort=o.date_added' . $url, true);
		$data['sort_date_modified'] = $this->url->link('sale/call_request', 'token=' . $this->session->data['token'] . '&sort=o.date_modified' . $url, true);

		$url = '';

		if (isset($this->request->get['filter_call_request_id'])) {
			$url .= '&filter_call_request_id=' . $this->request->get['filter_call_request_id'];
		}

		if (isset($this->request->get['filter_customer'])) {
			$url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_call_request_status'])) {
			$url .= '&filter_call_request_status=' . $this->request->get['filter_call_request_status'];
		}

                if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		/*
                if (isset($this->request->get['filter_date_modified'])) {
			$url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
		}
                */

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('sale/call_request', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['filter_call_request_id'] = $filter_call_request_id;
		$data['filter_customer'] = $filter_customer;
		$data['filter_call_request_status'] = $filter_call_request_status;
		$data['filter_date_added'] = $filter_date_added;

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('sale/call_request_list', $data));
	}

        public function viewCallRequest(){
            $this->load->language('sale/call_request');
            
            $this->load->model('sale/call_request');
            
            if (isset($this->error['warning'])) {
                $data['error_warning'] = $this->error['warning'];
            } else {
                $data['error_warning'] = '';
            }

            if (isset($this->session->data['success'])) {
                $data['success'] = $this->session->data['success'];

                unset($this->session->data['success']);
            } else {
                $data['success'] = '';
            }
            
            $call_request_id = $this->request->get['call_request_id'];
            
            $saved_call_request_data = $this->model_sale_call_request->getCallRequestById($call_request_id);
            
            $call_request_data = [];
            
            $call_request_data['call_request_id'] = $call_request_id;
            
            if(isset($this->request->post['customer_name'])){
                $call_request_data['customer_name'] = $this->request->post['customer_name'];
            } elseif(isset($saved_call_request_data['customer_name'])) {
                $call_request_data['customer_name'] = $saved_call_request_data['customer_name'];
            } else {
                $call_request_data['customer_name'] = '';
            }

            if(isset($this->request->post['customer_email'])){
                $call_request_data['customer_email'] = $this->request->post['customer_email'];
            } elseif(isset($saved_call_request_data['customer_email'])) {
                $call_request_data['customer_email'] = $saved_call_request_data['customer_email'];
            } else {
                $call_request_data['customer_email'] = '';
            }

            if(isset($this->request->post['customer_telephone'])){
                $call_request_data['customer_telephone'] = $this->request->post['customer_telephone'];
            } elseif(isset($saved_call_request_data['customer_telephone'])) {
                $call_request_data['customer_telephone'] = $saved_call_request_data['customer_telephone'];
            } else {
                $call_request_data['customer_telephone'] = '';
            }

            if(isset($this->request->post['call_request_status_id'])){
                $call_request_data['status_id'] = $this->request->post['call_request_status_id'];
            } elseif(isset($saved_call_request_data['status_id'])) {
                $call_request_data['status_id'] = $saved_call_request_data['status_id'];
            } else {
                $call_request_data['status_id'] = 0;
            }

            if(isset($this->request->post['comment'])){
                $call_request_data['comment'] = $this->request->post['comment'];
            } elseif(isset($saved_call_request_data['comment'])) {
                $call_request_data['comment'] = $saved_call_request_data['comment'];
            } else {
                $call_request_data['comment'] = '';
            }

            if(isset($this->request->post['date_added'])){
                $call_request_data['date_added'] = $this->request->post['date_added'];
            } elseif(isset($saved_call_request_data['date_added'])) {
                $call_request_data['date_added'] = $saved_call_request_data['date_added'];
            } else {
                $call_request_data['date_added'] = '';
            }

            if(isset($this->request->post['date_modified'])){
                $call_request_data['date_modified'] = $this->request->post['date_modified'];
            } elseif(isset($saved_call_request_data['date_modified'])) {
                $call_request_data['date_modified'] = $saved_call_request_data['date_modified'];
            } else {
                $call_request_data['date_modified'] = '';
            }
            
            if(isset($this->request->post['action'])){
                if($this->request->post['action'] == 'update'){
                    $update_result = $this->model_sale_call_request->updateCallRequestById($call_request_data);
                    
                    if($update_result){
                        $data['success'] = $this->language->get('text_updated_successful');
                    }
                }
            }
            
            // Call request statuses
            $cr_statuses = $this->model_sale_call_request->getCallRequestStatuses();
            $data['call_request_statuses'] = [];
            foreach($cr_statuses as $cr_status){
                $data['call_request_statuses'][] = [
                    'status_id' => $cr_status['status_id'],
                    'name'      => $cr_status['name']
                ];
            }
            //
            
            $data['call_request_id'] = $call_request_id;
            $data['customer_name'] = $call_request_data['customer_name'];
            $data['customer_email'] = $call_request_data['customer_email'];
            $data['customer_telephone'] = $call_request_data['customer_telephone'];
            $data['call_request_status_id'] = $call_request_data['status_id'];
            $data['call_request_comment'] = $call_request_data['comment'];
            $data['call_request_date_added'] = $call_request_data['date_added'];
            $data['call_request_date_modified'] = $call_request_data['date_modified'];
            
            $data['breadcrumbs'] = array();

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_home'),
                'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
            );

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('heading_title'),
                'href' => $this->url->link('sale/call_request', 'token=' . $this->session->data['token'], true)
            );
            
            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_request') . " №" . $call_request_id,
                'href' => $this->url->link('sale/call_request/viewCallRequest', 'callRequestId=' . (int)$call_request_id . '&token=' . $this->session->data['token'], true)
            );
            
            $data['heading_title'] = $this->language->get('heading_title');
            
            $data['text_call_request_id']      = $this->language->get('text_call_request_id');
            $data['text_customer_name']        = $this->language->get('text_customer_name');
            $data['text_customer_email']       = $this->language->get('text_customer_email');
            $data['text_customer_telephone']   = $this->language->get('text_customer_telephone');
            $data['text_call_request_status']  = $this->language->get('text_call_request_status');
            $data['text_call_request_comment'] = $this->language->get('text_call_request_comment');
            $data['text_call_request_date_added']    = $this->language->get('text_call_request_date_added');
            $data['text_call_request_date_modified'] = $this->language->get('text_call_request_date_modified');
            $data['text_request']              = $this->language->get('text_request');
            $data['text_call_request_heading'] = $this->language->get('text_request') . " №" . $call_request_id;
            
            $data['button_save']   = $this->language->get('button_save');
            $data['button_cancel'] = $this->language->get('button_cancel');
            
            $data['save_call_request_data'] = $this->url->link('sale/call_request/viewCallRequest', 'call_request_id=' . (int)$call_request_id . '&token=' . $this->session->data['token'], true);
            $data['cancel'] = $this->url->link('sale/call_request', 'token=' . $this->session->data['token'], true);
            
            $data['header'] = $this->load->controller('common/header');
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['footer'] = $this->load->controller('common/footer');
            
            $this->response->setOutput($this->load->view('sale/call_request_view', $data));
        }

        public function delete(){
            if(isset($this->request->post['selected'])){
                $this->load->model('sale/call_request');
                
                foreach($this->request->post['selected'] as $selected_item){
                    $this->model_sale_call_request->deleteCallRequestById($selected_item);
                }
            }
            
            $this->getList();
        }
        
	protected function validate() {
            if (!$this->user->hasPermission('modify', 'sale/callrequest')) {
                $this->error['warning'] = $this->language->get('error_permission');
            }

            return !$this->error;
	}	
}
