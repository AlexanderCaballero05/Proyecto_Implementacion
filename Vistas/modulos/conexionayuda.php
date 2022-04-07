<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "db_proyecto_prosecar";
try {
    $db= new PDO( "mysql:host=$servername;dbname=$dbname",
                  "$username",
                  "$password", 
                  array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));           
} catch (Execption $e) {
    echo "ERROR DE CONEXION DE: ".$e->getMessage();
}

?>