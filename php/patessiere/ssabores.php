<?php
require "Conexion.php";
require "access.php";

header('Content-Type: application/json');

$result = $conexion->query("SELECT * FROM sabores");

$data = array();

if (mysqli_num_rows($result) > 0) {
    while($row = mysqli_fetch_assoc($result)) {
        $data[] = $row;
    }
}

echo json_encode($data);

$conexion->close();
?>