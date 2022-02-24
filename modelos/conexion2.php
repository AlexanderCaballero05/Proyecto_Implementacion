<?php
//conexion buena
$servername= "localhost";
$username= "root";
$password= "";
$database= "db_proyecto_prosecar";
$conexion = new mysqli();

$conexion->connect($servername,$username,$password,$database);
if ($conexion->connect_error){
    die("conexion fallida: ".$conexion->connect_error);
}else
?>