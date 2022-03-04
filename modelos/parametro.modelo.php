
 <?php
 // session_start();
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR PARÁMETROS


//AGREGAR/REGISTRAR UN PARÁMETRO
    if(isset($_POST['parametro'])){
       try{
          if(isset($_POST['agregar_param'])){
               $nombre_param = ($_POST['parametro']);
               $valor = ($_POST['valor_param']);
               $fechaActual = date('Y-m-d');   
              try{ 
                  $consulta_nom = $db->prepare("SELECT PARAMETRO FROM tbl_parametros WHERE PARAMETRO = (?);");
                  $consulta_nom->execute(array($nombre_param));
                  $row=$consulta_nom->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('El nombre de parámetro $nombre_param ya se encuentra registrado');
                    window.location = 'parametros';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_param = " INSERT INTO `tbl_parametros`( `PARAMETRO`, `VALOR`,  `FECHA_MODIFICACION`, `FECHA_CREACION` ) VALUES ('$nombre_param','$valor','$fechaActual' ,'$fechaActual'); ";
                      $resul=$conn->query($query_param);
                      if($resul >0){
                        echo "<script> 
                        alert('Parámetro registrado correctamente');
                        window.location = 'parametros';
                        </script>";
                        exit;
                      }else{
                        echo "<script> 
                        alert('Error auxilio!');
                        window.location = 'parametros';
                        </script>";
                        exit;
                      }
                    }catch(PDOException $e){
                    echo $e->getMessage(); 
                    return false;
                    }
                  }//fin del else de si no existe el nombre del parametro
              }catch(PDOException $e){
              echo $e->getMessage(); 
              return false;
              }
            }//fin del if de verificar si hay datos

       }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }//FIN DEL IF DE REGISTAR 



  //EDITAR UN PARÁMETRO 
  if(isset($_POST['id_param'])){
    if(isset($_POST['Edit_parametro'])){
      $codigo_param = ($_POST['id_param']);
      $editar_valor = ($_POST['Edit_valor']);
      try{
       //   
       $sentencia = $db->prepare("SELECT * FROM tbl_parametros where PARAMETRO = (?) and CODIGO_PARAMETRO <> (?) ;");
       $sentencia->execute(array($editar_valor ,$codigo_param));
       $row=$sentencia->fetchColumn();
         
            $sql = " UPDATE tbl_parametros SET VALOR = '$editar_valor'  
            WHERE CODIGO_PARAMETRO = '$codigo_param' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script>
              alert('¡Parámetro modificado exitosamente!');
              window.location = 'parametros';
              </script>";
              include_once 'function_bitacora.php';
              $codigoObjeto=1;
              $accion='Modificacion';
              $descripcion= 'Se edito un Parámetro ';
              bitacora($codigoObjeto, $accion,$descripcion);
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar el parámetro!');
              window.location = 'parametros';
              </script>";
            }

      }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }
  }

//ELIMINAR UN PARÁMETRO 
if(isset($_POST['param_eliminar'])){
  if(isset($_POST['ELIMINARPARAM'])){
    $code = ($_POST['param_eliminar']);//asigna a una variable el id del estado a eliminar
    try{
      $relacion_tablas =  $db->prepare("SELECT a.CODIGO_PARAMETRO, a.CODIGO_PARAM_USUARIO
       from tbl_parametros_usuarios a ,tbl_parametros p 
       where p.CODIGO_PARAMETRO = a.CODIGO_PARAMETRO and p.CODIGO_PARAMETRO = (?);;");
      $relacion_tablas->execute(array($code));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar este parámetro,esta relacionado con otras tablas!');
        window.location = 'parametros';
        </script>";
        exit;
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_parametros WHERE  CODIGO_PARAMETRO = '$code' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            alert('¡Parámetro eliminado!');
            window.location = 'parametros';
            </script>";
            include_once 'function_bitacora.php';
            $codigoObjeto=1;
            $accion='Modificacion';
            $descripcion= 'Se elimino el parámetro ';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar el parámetro!');
            window.location = 'parametros';
            </script>";
            exit;
          }
        }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
      }
    }catch(PDOException $e){
     echo $e->getMessage(); 
     return false;
    }
  }
}//Cierre del if 


?>