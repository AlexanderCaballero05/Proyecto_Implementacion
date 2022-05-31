<?php
  session_start();
  include "function_bitacora.php";
 include_once "conexion.php";
 include_once "conexion3.php";
?> 
<?php
  //Parametro de maximo nombre usuario
  $intentos = "NUM_INTENTOS_PREGUNTAS";
  $sentencia1 = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia1->execute(array($intentos));
  $row1=$sentencia1->fetchColumn();
  if($row1>0){
    $parametro = $row1;
  }

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
                }else{ //Si no hay registros en la fila ,la respuesta es incorrecta y se bloquea al usuario :/
                  $sentencia2 = $db->prepare("SELECT p.PAR_VALOR
                  from tbl_usuario u, tbl_parametros_usuarios p 
                  WHERE u.CODIGO_USUARIO = p.CODIGO_USUARIO
                  AND P.CODIGO_PARAMETRO = 19
                  AND u.NOMBRE_USUARIO = (?);");
                  $sentencia2->execute(array($usuario));
                  $valor_usuario=$sentencia2->fetchColumn();// cantidad que tiene el usuario de intentos validos

                  if($valor_usuario < $parametro){ //evalua que la cantidad de intentos validos que tiene el usuario sea menor que el parametro
                    $query = "UPDATE tbl_parametros_usuarios SET 
                      PAR_VALOR=(PAR_VALOR+1)
                      WHERE CODIGO_USUARIO=(SELECT codigo_usuario From tbl_usuario where NOMBRE_USUARIO = '$usuario') AND CODIGO_PARAMETRO = 19;";
                      $dato=$conn->query($query); 
                      echo "<script> alert('Respuesta incorrecta,intente otra vez')
                      window.location='../Vistas/modulos/recuperacion_clave_preguntas.php';
                      </script>";
                  }else{ // si es mayor significa que supero las veces de intentos validos,osea va bloquear el usuario
                    echo "<script> alert('Contactar al administrador su usuario ha sido bloqueado');
                    location.href = '../index.php';</script>";
                    $updat = "UPDATE tbl_usuario SET CODIGO_ESTADO = 4 WHERE CODIGO_USUARIO = '$user';";
                    $resultado =$conn->query($updat);
                  }
                }
            }
        }else{
          echo "<script> alert('El Usuario Ingresado no Existe'); window.location = '../Vistas/modulos/metodos_recuperar_clave.php'; </script>";
        }
    }catch(PDOException $e){
    echo $e->getMessage();  
    return false; } 
}


