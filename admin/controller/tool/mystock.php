<?php
class ControllerToolMystock extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('tool/mystock');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('tool/mystock');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->user->hasPermission('modify', 'tool/mystock')) {
            if (is_uploaded_file($this->request->files['import']['tmp_name'])) {
                $content = file_get_contents($this->request->files['import']['tmp_name']);
            } else {
                $content = false;
            }

            if ($content) {
                $this->model_tool_backup->restore($content);
                $this->session->data['success'] = $this->language->get('text_success');
                $this->response->redirect($this->url->link('tool/mystock', 'token=' . $this->session->data['token'], true));
            } else {
                $this->error['warning'] = $this->language->get('error_empty');
            }
        }

        $data['heading_title'] = $this->language->get('heading_title');

        if (isset($this->session->data['error'])) {
            $data['error_warning'] = $this->session->data['error'];

            unset($this->session->data['error']);
        } elseif (isset($this->error['warning'])) {
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

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('tool/backup', 'token=' . $this->session->data['token'], true)
        );

        

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('tool/mystock', $data));
    }
	
}
