<?php
    $db_host_name="localhost";
    $db_user_name="root";
    $db_password="";
    $db_name="db_proyecto_Prosecar";
    
    


$conn = new mysqli($db_host_name, $db_user_name, $db_password, $db_name );
if($conn->connect_error){
    die("conexion fallida: ".$conn->connect_error);
}
