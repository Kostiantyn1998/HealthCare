<?php

//test key
   
define("STRIPE_PUBLIC_TEST_KEY", "pk_test_MuNQ9KiNS3ZF7C0RBMVYcshM");   
define("STRIPE_SECRET_TEST_KEY", "sk_test_BgqrEqRLrzhsrMxYaRvIFnwd");
define("STRIPE_CLIENT_TEST_ID", "ca_CF6PwiZJKO999vpgZrU8Am3mQVe9MzDf");   

define("STRIPE_PUBLIC_LIVE_KEY", "pk_live_99F9rEolqUk26NsKTZ4iwZHI");   
define("STRIPE_SECRET_LIVE_KEY", "sk_live_p1OeVLoOvn2ecKCpT95IThk9");  
define("STRIPE_CLIENT_LIVE_ID", "ca_CF6PbjacAlixv9B3NhsoTW2D6b4ALS74");

define("CHARGE_STATUS_CHARGED", 1);
define("CHARGE_STATUS_REFUNDED", 10);
define("CHARGE_STATUS_PAID",2);

//app fee rate
define("APP_FEE", 0.05);


require FCPATH . 'vendor/stripe/stripe-php/init.php';

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



class Payments extends CI_Model {
         
    function __construct(){
        parent::__construct();        
        \Stripe\Stripe::setApiKey(STRIPE_SECRET_TEST_KEY);
        Stripe\Stripe::setClientId(STRIPE_CLIENT_TEST_ID);
    }
    
    public function payfor6months($object) {
        try{
            $amount = $object["amount"];
            $currency = $object["currency"];
            $description = "charge for user membership";
            $source = $object["stripeToken"];
            $charge = \Stripe\Charge::create(
                    [
                        "amount"=> $amount,
                        "currency"=> $currency,
                        "description"=> $description,
                        "source"=>$source                        
                    ]);
            //add charge in charge table
            $this->db->set("charge_id", $charge->id)
                    ->set("charge_amount", $amount)
                    ->set("charge_currency", $currency)
                    ->set("charge_created_at", time())
                    ->set("charge_user", $object["user_id"])
                    ->insert("tbl_charges");
            //change charged user status
            $date = new DateTime();
            $months = new DateInterval("P6M");
            $date->add($months);
            $paid = $date->getTimeStamp();
            $this->db->where("user_id", $object["user_id"])->set("user_paid", $paid)->update("tbl_users");
            return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"success", "user_paid"=>$paid];
        }
        catch(\Stripe\Error\Card $e) {
            // Since it's a decline, \Stripe\Error\Card will be caught
            
            
            return $this->processStripeError($e);
        } catch (\Stripe\Error\RateLimit $e) {
        // Too many requests made to the API too quickly            
            
            
            return $this->processStripeError($e);
        } catch (\Stripe\Error\InvalidRequest $e) {
        // Invalid parameters were supplied to Stripe's API
            
            
            return $this->processStripeError($e);
        } catch (\Stripe\Error\Authentication $e) {
        // Authentication with Stripe's API failed
        // (maybe you changed API keys recently)
            
            
            return $this->processStripeError($e);
        } catch (\Stripe\Error\ApiConnection $e) {
        // Network communication with Stripe failed
            
            
            return $this->processStripeError($e);
        } catch (\Stripe\Error\Base $e) {
        // Display a very generic error to the user, and maybe send
        // yourself an email
            
            
            return $this->processStripeError($e);
        } catch (Exception $e) {
        // Something else happened, completely unrelated to Stripe
            
            
            return $this->processStripeError($e);
        }
    }
    
    function processStripeError($error) {
        $body = $error->getJsonBody();
        $errorObject = $body["error"];
        return [KEY_RESULT=>RES_FAIL, KEY_RES_MESSAGE=>$errorObject['message']];
    }
    
}
    