<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\SMTP;
include 'connection.php';
class APi{
    
    
        
 function send_email($recipient_name, $recipient_address, $email_subject, $email_content, $cc = '', $log = false) {
        if (!$log) {
            goto send_mail;
        }
         $con = db_connect();
        //Log Email
        $n = mysqli_query($con,"insert into sent_email (recipient_name, recipient_email, subject, email_body, copies, _when_added) values ('" . mysqli_real_escape_string($con,$recipient_name) . "', '" . mysqli_real_escape_string($con,$recipient_address) . "', '" . mysqli_real_escape_string($con,$email_subject) . "', '" . mysqli_real_escape_string($con,$email_content) . "', '" . mysqli_real_escape_string($con,$cc) . "', '" . date("Y-m-d H:i:s") . "')");

        if ($n) {
            return true;
        } else {
            error_log(mysqli_error($this->con));
            return false;
        }

        send_mail:
      
    if (file_exists("../application/third_party/vendor/autoload.php")) {
            require_once("../application/third_party/vendor/autoload.php");
        }else{
             require_once("../application/third_party/vendor/autoload.php");
        }
     


$mail = new PHPMailer(true);                              // Passing `true` enables exceptions
try {
    //Server settings
    $mail->SMTPDebug = 0;                                 // Enable verbose debug output//
    $mail->isSMTP();                                      // Set mailer to use SMTP
    $mail->Host = 'tls://smtp.gmail.com:587';  // Specify main and backup SMTP servers
    $mail->SMTPAuth = true;                               // Enable SMTP authentication
    $mail->Username = '8hrisystem@gmail.com';                 // SMTP username
    $mail->Password = 'Xe2DFoJVcR5N';                           // SMTP password
    $mail->SMTPSecure = 'ssl';                            // Enable TLS encryption, `ssl` also accepted
    $mail->Port = 465;                                    // TCP port to connect to
$mail->IsHTML(true);
    //Recipients
    $mail->setFrom('8hrisystem@gmail.com', 'HR Management Information System');
    $mail->AddAddress($recipient_address, $recipient_name);  // Add a recipient
    $mail->Subject = $email_subject;
    $mail->Body = $email_content;
    if ($cc != "") {
            $mail->AddCC('', $cc);
     }
    $mail->isHTML(true);                                  // Set email format
     $mail->AddAddress($recipient_address, $recipient_name);
     if ($mail->Send());
} catch (Exception $e) {
    echo 'Message could not be sent.';
    echo 'Mailer Error: ' . $mail->ErrorInfo;
}
    }
}


?>