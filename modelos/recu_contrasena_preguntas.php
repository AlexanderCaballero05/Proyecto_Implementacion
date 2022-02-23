<?php
  session_start();
 include_once "conexion.php";
 include_once "conexion3.php";
?> 
<?php

if(isset($_SESSION['usua'])) {
    $usuario = $_SESSION['usua'];
     try{ 
        //$consultar_usuario="SELECT CODIGO_USUARIO FROM tbl_usuario WHERE NOMBRE_USUARIO='$usuario'";
         $sentencia = $db->prepare("SELECT CODIGO_USUARIO FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
         $sentencia->execute(array($usuario));
         $row=$sentencia->fetchColumn();

        //$filas=$existe->num_rows;
        if($row>0){
            $user = $row;
           if(isset($_POST['verificar_res'])){
                $pregunta=($_POST['pregunta_usuario']);
                $respuesta=($_POST['respuesta']);

                $consultar="SELECT * FROM tbl_preguntas_usuarios r WHERE  r.CODIGO_USUARIO ='$user' AND r.CODIGO_PREGUNTAS = '$pregunta' AND r.RESPUESTA = '$respuesta';";
                $existe1=$conn->query($consultar);
                $row=$existe1->num_rows;
               if($row>0){ //Si se en la consulta hay una fila si hay registro de la busqueda ,es decir que si es correcta la respuesta
                  echo "<script>
                  alert('Respuesta correcta');
                 
                  window.location='../Vistas/modulos/cambio_contrasena_preguntas.php';
                  </script>";
                }else{ //Si no hay registros en la fila ,la respuesta es incorrecta
                  echo "<script>
                  alert('Respuesta incorrecta');
                  location.href = '../Vistas/modulos/metodos_recuperar_clave.php';
                  </script>";
                }
            }
        }else{
            echo "<script>
            alert('El Usuario Ingresado no Existe');
            window.location = '../Vistas/modulos/metodos_recuperar_clave.php';
            </script>";
        }
    }catch(PDOException $e){
    echo $e->getMessage();  
    return false; } 
}


