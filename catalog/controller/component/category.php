<?php
class ControllerComponentCategory extends Controller {
	public function index() {
		$this->load->model('catalog/category');
                $this->load->model('tool/image');
                
                $categories = [
                    '62' => $this->model_catalog_category->getCategory(62),
                    '76' => $this->model_catalog_category->getCategory(76),
                    '60' => $this->model_catalog_category->getCategory(60),
                    '61' => $this->model_catalog_category->getCategory(61),
                    '77' => $this->model_catalog_category->getCategory(77),
                    '78' => $this->model_catalog_category->getCategory(78),
                    '63' => $this->model_catalog_category->getCategory(63),
                    '66' => $this->model_catalog_category->getCategory(66),
                    '64' => $this->model_catalog_category->getCategory(64),
                ];
                
                $data['categories'] = [];
                
                foreach ($categories as $key=>$category) {
                    $data['categories'][$key] = [
                        'category_id' => $category['category_id'],
                        'name' => $category['name'],
                        'image' => $this->model_tool_image->resize($category['image'], 500, 500),
                        'href' => $this->url->link('product/category', 'path=' . $category['category_id'])
                    ];
                }

                $data['uzor'] = $this->model_tool_image->resize('catalog/uzor1.png', 530, 56);
                
                return $this->load->view('component/category', $data);
	}
}