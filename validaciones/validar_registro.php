<?php

include_once "conexion.php";

$usuario = $_POST["ingusuario"];
$contrasena = $_POST["ingcontrasena"];
$correo = $_POST["ingcorreo"];

if(isset($_POST['btnregistrar'])){

    $contrasena = password_hash($contrasena,PASSWORD_DEFAULT);
    $queryregistrar = "INSERT INTO TBL_USARIO (nombre_usuario,contrasena) VALUES ('$usuario','$contrasena')";
    

    if(mysqli_query($queryregistrar)){
        echo "<script>alert('Usuario registrado: $usuario'); window.location = 'plantilla.php' </script>";
       
    }else{

        echo "Error: ".$queryregistrar."<br>" .mysql_error($conn);
    }

}


?>