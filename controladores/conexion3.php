<?php
error_reporting(0);
    $db_host_name="localhost";
    $db_name="db_Proyecto_Prosecar";
    $db_user_name="root";
    $db_password="";
    $conexion = new mysqli();

$conexion->connect($db_host_name, $db_user_name, $db_password, $db_name );
if ($conexion->connect_error){
    die("conexion fallida: ".$conexion->connect_error);
}
?>