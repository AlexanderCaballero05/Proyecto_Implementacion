<?php
  session_start();
  include "function_bitacora.php";
 include_once "conexion.php";
 include_once "conexion3.php";
?> 
<?php

if(isset($_SESSION['vario'])) {
    $usuario = $_SESSION['vario'];
     try{ 
         $sentencia = $db->prepare("SELECT CODIGO_USUARIO FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
         $sentencia->execute(array($usuario));
         $row=$sentencia->fetchColumn();
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
                  window.location='../Vistas/modulos/cambio_contrasena_preguntas.php';
                  </script>";
                  $_SESSION['vario'] =$usuario;
                  //llamada de la fuction bitacora -->
                  $codigoObjeto=1;
                  $accion='recuperacion contraseña por preguntas';
                  $descripcion= 'Solicitud recuperacion de contraseña ';
                  bitacora($codigoObjeto, $accion,$descripcion);

                }else{ //Si no hay registros en la fila ,la respuesta es incorrecta y se bloquea al usuario :/
                  $updat = "UPDATE tbl_usuario SET CODIGO_ESTADO = 4 WHERE CODIGO_USUARIO = '$user';";
                  $resultado =$conn->query($updat);
                  echo "<script> alert('Usuario bloqueado');location.href = '../index.php';</script>";
                }
            }
        }else{
          echo "<script> alert('El Usuario Ingresado no Existe'); window.location = '../Vistas/modulos/metodos_recuperar_clave.php'; </script>";
        }
    }catch(PDOException $e){
    echo $e->getMessage();  
    return false; } 
}


