<?php
class ModelSaleCallRequest extends Model{
        public function addCallRequest($call_request_data){
            $sql = "INSERT INTO `" . DB_PREFIX . "customer_call_requests` (customer_name, customer_email, customer_telephone) VALUES('" . (string)$call_request_data['name'] . "', '" . (string)$call_request_data['email'] .  "', '" . (string)$call_request_data['telephone'] . "')";
            if($this->db->query($sql)) {
                $result = $this->db->lastId();
            } else {
                return false;
            }
            
            return result;
        }
        
        public function updateCallRequestById($request_data){
            $sql = "UPDATE `" . DB_PREFIX . "customer_call_request` SET customer_name='" . (string)$request_data['customer_name'] . "', customer_email='" . (string)$request_data['customer_email'] . "', customer_telephone='" . (string)$request_data['customer_telephone'] . "', status_id='" . (int)$request_data['status_id'] . "', comment='" . (string)$request_data['comment'] . "', date_modified=NOW() WHERE call_request_id='" . (int)$request_data['call_request_id'] . "'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        
        public function deleteCallRequestById($request_id){
            $sql = "DELETE FROM `" . DB_PREFIX . "customer_call_request` WHERE call_request_id='" . (int)$request_id . "'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        
        public function getCallRequestById($request_id){
            $sql  = "SELECT * FROM `" . DB_PREFIX . "customer_call_request` WHERE call_request_id='" . (int)$request_id . "'";
            
            $result = $this->db->query($sql);
            
            return $result->row;
        }
        
        public function getCallRequestList($filter_data){
            $sql  = "SELECT ccr.call_request_id as call_request_id, ccr.customer_name as customer_name, ccr.customer_email as customer_email, ccr.customer_telephone as customer_telephone, ccrs.name as call_request_status, ccr.comment as comment, ccr.date_added as date_added, ccr.date_modified as date_modified ";
            $sql .= "FROM `" . DB_PREFIX . "customer_call_request` ccr LEFT JOIN `" . DB_PREFIX . "customer_call_request_status` ccrs ON ccr.status_id=ccrs.status_id";
            
            $result = $this->db->query($sql);
            
            return $result->rows;
        }
        
        public function getCallRequestByEmail($request_email){
            $sql = "SELECT * FROM `" . DB_PREFIX . "customer_call_request` WHERE email='" . (string)$request_email . "'";
            
            $result = $this->db->query($sql);
            
            return $result->row;
        }
        
        public function getCallRequestByTelephone($request_telephone){
            $sql = "SELECT * FROM `" . DB_PREFIX . "customer_call_request` WHERE telephone='" . (string)$request_telephone . "'";
            
            $result = $this->db->query($sql);
            
            return $result->row;
        }
        
        public function getCallRequestStatuses(){
            $sql = "SELECT * FROM `" . DB_PREFIX . "customer_call_request_status`";
            
            $result = $this->db->query($sql);
            
            return $result->rows;
        }
}