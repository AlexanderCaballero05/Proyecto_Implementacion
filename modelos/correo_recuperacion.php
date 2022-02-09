<?php
 include_once "conexion.php";

   ?> 

<?php


if(isset($_POST['usuario'])) {
    if(isset($_POST['correo'])) {

        $usuario = ($_POST["usuario"]);

        session_start();

        $consultar_usuario="SELECT *FROM tbl_ms_usuario WHERE NOMBRE_USUARIO='$usuario'";
        $existe=$conn->query($consultar_usuario);
        $filas=$existe->num_rows;

        if($filas>0){
            header("location: ../Login/verificar_correo.php"); 
          
                  }else{
                      
                    echo '<script>
                    alert(" El Usuario Ingresado no Existe ");
                    window.location="../Login/recuperar_clave.php";
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
            header("location: ../Login/recuperacion_clave_preguntas.php"); 
          
                  }else{
                      
                    echo '<script>
                    alert(" El Usuario Ingresado no Existe ");
                    window.location="../Login/recuperar_clave.php";
                          </script>';
        }


    }


}




















      
?>