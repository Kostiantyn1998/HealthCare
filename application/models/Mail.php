<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require FCPATH . 'vendor/phpmailer/phpmailer/src/Exception.php';
require FCPATH . 'vendor/phpmailer/phpmailer/src/PHPMailer.php';
require FCPATH . 'vendor/phpmailer/phpmailer/src/SMTP.php';

class Mail {
    public static function setUpMail(){
        
        $mail = new PHPMailer(true);
         
         
        /*
        $mail->setFrom('steffi.jeffreys@yahoo.com', 'Handi Admin');

        $mail->isSMTP();
        $mail->Host = 'smtp.mail.yahoo.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'steffi.jeffreys@yahoo.com';
        $mail->Password = 'Passw0rd@123';
        $mail->SMTPSecure = 'ssl';
        $mail->Port = 465;
        //special email address
        */

        $mail->isSMTP();

        $mail->Host = 'smtp.gmail.com';
        $mail->Port = 587;
        $mail->SMTPSecure = 'tls';
        $mail->SMTPAuth = true;
        $mail->setFrom("bigshark0522@gmail.com", "test");//From = "bigshark0522@gmail.com";
        $mail->Username = "bigshark0522@gmail.com";
        $mail->Password = "bigsystemfuse810";
        $mail->FromName = "Shaadi Mubarak";
        
        

        //todo: activate for production environment
//            $mail->SMTPKeepAlive = true;

        return $mail;
    }
}