<?php
require "Conexion.php";
require "access.php";

header('Content-Type: application/json');

$var = getParams();

$sabor = $var->selectedOptionSabores;
$tamanio = $var->selectedOptionTamanios;
$relleno = $var->selectedOptionRellenos;
$cobertura = $var->selectedOptionCoberturas;
$precio = $var->precio;
$imagen = $var->imagen;


$result = $conexion->query("INSERT INTO pasteles(Sabor_ID, Tamanio_ID, Relleno_ID, Cobertura_ID, Precio, Imagen) 
    VALUES ($sabor, $tamanio, $relleno,$cobertura, $precio, '$imagen')");

if ($result) {
  echo json_encode(['success' => true, 'message' => 'Pastel agregado']);
} else {
  echo json_encode(['success' => false, 'message' => 'Error al agregar']);
}

$conexion->close();
?>