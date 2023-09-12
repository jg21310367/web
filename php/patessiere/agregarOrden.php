<?php
require "Conexion.php";
require "access.php";
require "pdfFile.php";

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/Exception.php';
require 'PHPMailer/PHPMailer.php';
require 'PHPMailer/SMTP.php';

header('Content-Type: application/json');

$var = getParams();

$pasteles = $var->array;
$usuario = $var->user;


$ordenInsertada = $conexion->query("INSERT INTO ordenes(Usuario_ID, Fecha, Total_pagar, Completada) 
    VALUES ($usuario, CURDATE(), 0.00, 0)");


if ($ordenInsertada) {
  $ordenID = mysqli_insert_id($conexion); 
  foreach ($pasteles as $p) {
    $precio = $p->Cantidad * $p->pastel->Precio;
    $pastelID = $p->pastel->Pastel_ID;
    $cant = $p->Cantidad;
    $result = $conexion->query("INSERT INTO detalles_orden(Pastel_ID, Cantidad, Precio, Orden_ID) 
    VALUES ($pastelID, $cant, $precio, $ordenID)");
  }
}

if ($result) {
  echo json_encode(['success' => true, 'message' => 'Pastel agregado']);
} else {
  echo json_encode(['success' => false, 'message' => 'Error al agregar']);
}

$rgrantotal = $conexion->query("SELECT Total_pagar FROM ordenes WHERE Orden_ID = $ordenID");
if($rgrantotal->num_rows>0){
  while($fila=$rgrantotal->fetch_assoc()){
         $grantotal = $fila['Total_pagar'];
   }
}

$rcorreo = $conexion->query("SELECT Correo FROM usuarios WHERE Usuario_ID = $usuario");
if($rcorreo->num_rows>0){
  while($fila1=$rcorreo->fetch_assoc()){
         $correo = $fila1['Correo'];
   }
}

Crear($pasteles, $grantotal);


$mail = new PHPMailer(true);

try {
    //Server settings
    $mail->SMTPDebug = 0;                      //Enable verbose debug output
    $mail->isSMTP();                                            //Send using SMTP
    $mail->Host       = 'smtp.googlemail.com';                     //Set the SMTP server to send through
    $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
    $mail->Username   = 'a21310367@ceti.mx';                     //SMTP username
    $mail->Password   = 'jging2021';                               //SMTP password
    $mail->SMTPSecure = 'tls';            //Enable implicit TLS encryption
    $mail->Port       = 587;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

    //Recipients
    $mail->setFrom('a21310367@ceti.mx', 'PATISSIERE');
    $mail->addAddress($correo);     //Add a recipient

    //Attachments
    $mail->addAttachment('temp/orden.pdf');         //Add attachments
    //$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    //Optional name

    //Content
    $mail->isHTML(true);                                  //Set email format to HTML
    $mail->Subject = 'PATISSIERE agradece su compra';
    $mail->Body    = 'Por favor encuentre los detalles de su pedido en el archivo adjunto';
  

    $mail->send();
} catch (Exception $e) {
    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
}



$conexion->close();
?>