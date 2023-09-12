<?php
require "Conexion.php";
require "access.php";

header('Content-Type: application/json');


$var = getParams();

$correo = $var->correo;
$password = $var->password;
$isAdmin = $var->admin;

// Validate the username and password
// You should use prepared statements to avoid SQL injection
$result = $conexion->query("SELECT * FROM usuarios WHERE correo = '$correo' AND password = '$password' AND status = 1 AND admin = '$isAdmin' limit 1");


if ($result->num_rows > 0) {
  $row = mysqli_fetch_assoc($result);
  $id = $row["Usuario_ID"];
  echo json_encode(['success' => true, 'user' => $id]);
} else {
  echo json_encode(['success' => false, 'message' => 'Correo o contrasena invalidos']);
}

$conexion->close();

?>