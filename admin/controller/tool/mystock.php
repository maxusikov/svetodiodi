<?php
class ControllerToolMystock extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('tool/mystock');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('tool/mystock');

        $data['heading_title'] = $this->language->get('heading_title');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('tool/mystock', 'token=' . $this->session->data['token'], true)
        );

        $data['mystock_data'] = $this->url->link('tool/mystock/myStockData', 'token=' . $this->session->data['token'], true);
        $data['get_mystock_data'] = $this->url->link('tool/mystock/getMyStockData', 'token=' . $this->session->data['token'], true);

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('tool/mystock', $data));
    }
    
    public function myStockData(){
        $this->load->language('tool/mystock');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('tool/mystock');

        $data['heading_title'] = $this->language->get('heading_title');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('tool/mystock', 'token=' . $this->session->data['token'], true)
        );
        
        $data['mystock_data'] = '';
        
        
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        
        $this->response->setOutput($this->load->view('tool/mystock', $data));
    }
    
    public function getMyStockData(){
        $response_data = [
            'status' => 'info',
            'info'   => 'Request not processed'
        ];
        
        
        
        echo json_encode($response_data);
    }
}
