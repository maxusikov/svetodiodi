<?php
class ControllerAccountCallRequest extends Controller {
        public function index() {
            
        }

        public function sendCallRequest(){
            $response_data = [
                'status' => 'info',
                'info'   => 'Request not processed'
            ];
            
            $request_data = [];
            
            if(isset($this->request->post['name'])){
                $customer_name = trim($this->request->post['name']);
                
                if(utf8_strlen($customer_name) < 2 || utf8_strlen($customer_name) > 64){
                    $response_data['error'] = 'Имя должно содержать от 3 до 64 символов';
                    $response_data['error_type']  = 'name_error';

                    echo json_encode($response_data);
                    return;
                }
            } else {
                $response_data['error'] = 'Нет данных имени';
                $response_data['error_type']  = 'name_error';
                
                echo json_encode($response_data);
                return;
            }
            
            if(isset($this->request->post['email'])){
                $customer_email = trim($this->request->post['email']);
                
                if(utf8_strlen($customer_email) < 2 || utf8_strlen($customer_email) > 96){
                    $response_data['error'] = 'Почта должна содержать от 8 до 96 символов';
                    $response_data['error_type']  = 'email_error';
                    
                    echo json_encode($response_data);
                    return;
                }
            } else {
                $response_data['error'] = 'Нет данных почты в запросе';
                $response_data['error_type']  = 'no_email_data_error';
                
                echo json_encode($response_data);
                return;
            }
            
            if(isset($this->request->post['telephone'])){
                $customer_telephone = trim($this->request->post['telephone']);
                
                if(utf8_strlen($customer_telephone) < 6 || utf8_strlen($customer_telephone) > 20){
                    $response_data = [
                        'error' => 'Телефон должен содержать корректное число символов',
                        'type'  => 'phone_error'
                    ];
                    echo json_encode($response_data);
                    return;
                }
            } else {
                $response_data = [
                    'error' => 'Нет данных телефона',
                    'type'  => 'no_phone_data_error'
                ];
                
                echo json_encode($response_data);
                return;
            }
            
            $this->load->model('account/order');
            
            $request_data = [
                'customer_name' => $customer_name,
                'customer_email'         => $customer_email,
                'customer_telephone'     => $customer_telephone
            ];
            
            if ($this->model_account_order->addCallRequest($request_data)) {
                $response_data['status'] = 'success';
                $response_data['info'] = 'Запрос отправлен. Наш менеджер свяжется с Вами в ближайшее время.';
            } else {
                $response_data['status'] = 'fail';
                $response_data['info'] = 'Запрос не отправлен. Обратитесь к администрации сайта.';
            };
            
            echo json_encode($response_data);
        }
}