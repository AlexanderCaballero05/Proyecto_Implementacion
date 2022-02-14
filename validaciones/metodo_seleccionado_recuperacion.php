<?php
    $db_host_name="localhost";
    $db_user_name="root";
    $db_password="";
    $db_name="db_Proyecto_prosecar";
    $conn = new mysqli($db_host_name, $db_user_name, $db_password, $db_name );
    if($conn->connect_error){
        die("conexion fallida: ".$conn->connect_error);
    }
   ?> 
<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;


if(isset($_REQUEST['usuario'])) {  //aqui capturo el usuario enviado
    if(isset($_REQUEST['correo'])) { //este if es verdad si se presiono el boton correo <entonces.. entro al bloque de codigo

        $usuario = ($_POST["usuario"]);// entonces capturo el dato del usuario enviado mediante el metodo POST

        session_start();

        $consultar_usuario="SELECT *FROM tbl_usuario WHERE NOMBRE_USUARIO='$usuario'"; // construyo el query o consulta requerida
        $existe=$conn->query($consultar_usuario); //hago la consulta a la base de datos con el dato capturado
        $filas=$existe->num_rows; // Hago el array para buscar el dato

        if($filas>0){ // si es mayor a 1 se encontro el dato, entonces entro la pantalla de recuperacion de correo
            header("location: ../Vistas/modulos/Login/recuperacion_clave_correo.php"); 
          
                  }else{
                      
                    echo '<script>
                    alert("Datos incorrectos");
                    window.location="../Vistas/modulos/Login/metodos_recuperar_clave.php";
                          </script>';
        }

    }
    else if(isset($_POST['recu'])) { // este if es verdad si se presiono el boton preguntas <entonces.. entro al bloque de codigo


        $usuario = ($_POST["usuario"]);

        session_start();
        $_SESSION['usua'] = $_POST["usuario"]; // se crea una variable de sesion con el nombre del isuario

        $consultar_usuario="SELECT *FROM tbl_usuario WHERE NOMBRE_USUARIO='$usuario'";
        $existe=$conn->query($consultar_usuario);
        $filas=$existe->num_rows;

        if($filas>0){
            header("location: ../Vistas/modulos/Login/recuperacion_clave_preguntas.php"); 
          
                  }else{
                      
                    echo '<script>
                    alert("Datos incorrectos");
                    window.location="../Vistas/modulos/Login/metodos_recuperar_clave.php";
                          </script>';
        }


    }


}




















      
?>