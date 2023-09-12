<?php
$hostname = 'localhost';
$database = 'patessiere';
$username = 'root';
$contraseña = ''; 
$json = array();

	$conexion = new mysqli($hostname, $username, $contraseña, $database);
	if($conexion -> connect_errno){
		echo "No se conecto a la bd";
	}
?>