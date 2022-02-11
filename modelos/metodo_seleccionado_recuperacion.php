<?php
    $db_host_name="localhost";
    $db_user_name="root";
    $db_password="";
    $db_name="db_Prueba_Prosecar";
  

    


$conn = new mysqli($db_host_name, $db_user_name, $db_password, $db_name );
if($conn->connect_error){
    die("conexion fallida: ".$conn->connect_error);
}
   ?> 

<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;


if(isset($_POST['usuario'])) {
    if(isset($_POST['correo'])) {

        $usuario = ($_POST["usuario"]);

        session_start();

        $consultar_usuario="SELECT *FROM tbl_ms_usuario WHERE NOMBRE_USUARIO='$usuario'";
        $existe=$conn->query($consultar_usuario);
        $filas=$existe->num_rows;

        if($filas>0){
            header("location: ../Vistas/modulos/Login/recuperacion_clave_correo.php"); 
          
                  }else{
                      
                    echo '<script>
                    alert(" No se puede acceder ");
                    window.location="../Vistas/modulos/Login/metodos_recuperar_clave.php";
                          </script>';
        }

    }
    else if(isset($_POST['recu'])) {


        $usuario = ($_POST["usuario"]);

        session_start();

        $consultar_usuario="SELECT *FROM tbl_ms_usuario WHERE NOMBRE_USUARIO='$usuario'";
        $existe=$conn->query($consultar_usuario);
        $filas=$existe->num_rows;

        if($filas>0){
            header("location: ../Vistas/modulos/Login/recuperacion_clave_preguntas.php"); 
          
                  }else{
                      
                    echo '<script>
                    alert(" El Usuario Ingresado no Existe ");
                    window.location="../Vistas/modulos/Login/metodos_recuperar_clave.php";
                          </script>';
        }


    }


}




















      
?>