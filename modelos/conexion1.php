<?php

  class Conexion1
  {     

    function __construct() {
        
    }
    
      function ConectarDB() {
        
        $server = "localhost";
        $user = "root";
        $password = "";
        $database = "db_proyecto_prosecar";
        
        $conexion = mysqli_connect($server,$user,$password,$database) or die("Error al conectar a la base de datos.");

        if($conexion){
            echo "Conexión exitosa.";
        }
        
      }
  }
?>