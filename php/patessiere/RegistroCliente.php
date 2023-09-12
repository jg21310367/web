<?php
require "Conexion.php";
require "access.php";

header('Content-Type: application/json');


$var = getParams();

$nombre = $var->nombre;
$apellido = $var->apellido;
$domicilio = $var->domicilio;
$telefono = $var->telefono;
$correo = $var->correo;
$password = $var->password;


if (!$conexion->query("CALL reg_cliente('$nombre', '$apellido', '$domicilio', '$telefono', '$correo', '$password')")) {
    echo json_encode(['success' => false, 'message' => 'Registro fallido']);
}else{
  echo json_encode(['success' => true, 'message' => 'Registro exitoso']);
}


$conexion->close();

?>