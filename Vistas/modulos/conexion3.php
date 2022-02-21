<?php
	$servername = "localhost";
    $username ="root";
  	$password = "";
  	$dbname = "si-ortizindustrial";

	$conn = new mysqli($servername, $username, $password, $dbname);
	$conn -> set_charset("utf8");
      if($conn->connect_error){
        die("Conexión fallida: ".$conn->connect_error);
      }
?>
