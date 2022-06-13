<?php
 // session_start();
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  include_once "modelos/Conexionpdo.php";
  include_once 'function_bitacora.php';
  
?>


<?php
//PARTE PARA EDITAR UN PAr valor

if(isset($_POST['id_paramusu'])){
 

  if(isset($_POST['editar_paramusu'])){
    //$usuario = $_SESSION['vario'];
    $codigo_paramusu = ($_POST['id_paramusu']);
    $editar_parvalor = ($_POST['editar_parvalor']);
    $codigo_usuario= ($_POST['codigo_usuario']);
    $codigo_parametro= ($_POST['codigo_parametro']);

    $fechaActual = date('Y-m-d');
     
      
        try{
          $sql = " UPDATE tbl_parametros_usuarios 
          SET PAR_VALOR = '$editar_parvalor',
          FECHA_MODIFICACION = '$fechaActual'  
          WHERE CODIGO_PARAM_USUARIO = '$codigo_paramusu'
                AND CODIGO_USUARIO = '$codigo_usuario'
                AND CODIGO_PARAMETRO = '$codigo_parametro' ";
          $consulta=$conn->query($sql);
          if ($consulta>0){
            echo "<script>
            alert('¡Contador modificado exitosamente!');
            window.location = 'crudparametrosusuario';
            </script>";
             //<!--llamada de la fuction bitacora -->
             $codigoObjeto=9;
             $accion='MODIFICACION';
             $descripcion= 'SE MODIFICO CONTADOR';
             bitacora($codigoObjeto, $accion,$descripcion);
          //}else{
            echo "<script>
            alert('¡Error al intentar modificar Par Valor!');
            window.location = 'crudparametrosusuario';
            </script>";
               //<!--llamada de la fuction bitacora -->
               //$codigoObjeto=9;
               //$accion='Editar parámetro fallido';
               //$descripcion= 'Se intentó editar el registro de Par valor ya existente';
               //bitacora($codigoObjeto, $accion,$descripcion);

         }
        }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
        }//fin del try catch
      
  }
}//cierre del if principal

//FUNCIONES DEL CRUD DE ELIMINAR UN PARAMETRO USUARIO

//PARTE PARA ELIMINAR UN PARAMETRO USUARIO
if(isset($_POST['paramusuario_eli'])){
  if(isset($_POST['ELIMINAR_PARAMETROUSUARIO'])){
    $code = ($_POST['paramusuario_eli']);//asigna a una variable el id del estado a eliminar
    
    try {
      $relacion_tablas =  $db->prepare("SELECT tpu.CODIGO_PARAMETRO , tpu.CODIGO_PARAM_USUARIO 
      from tbl_parametros_usuarios tpu 
      left join tbl_usuario tu       on tu.CODIGO_USUARIO = tpu.CODIGO_USUARIO 
      left join tbl_parametros tp    on tp.CODIGO_PARAMETRO = tpu.CODIGO_PARAMETRO 
      where tpu.CODIGO_PARAM_USUARIO =(?);");
      $relacion_tablas->execute(array($code));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar este campo,esta relacionado con otras tablas!');
        window.location = 'crudparametrosusuario';
        </script>";
        
        //<!--llamada de la fuction bitacora -->
        $codigoObjeto=9;
        $accion='INTENTO DE ELIMINACIÓN';
        $descripcion= 'INTENTO DE ELIMINACIÓN DE CONTADOR';
        bitacora($codigoObjeto, $accion,$descripcion); 

      }else{
        
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_parametros_usuarios WHERE  CODIGO_PARAM_USUARIO = $code");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            alert('¡Contador eliminado!');
            window.location = 'crudparametrosusuario';
            </script>";
             //<!--llamada de la fuction bitacora -->
             $codigoObjeto=9;
             $accion='ELIMINACIÓN';
             $descripcion= 'SE ELIMINO EL CONTADOR';
             bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar el contador!');
            window.location = 'crudparametrosusuario';
            </script>";
             //<!--llamada de la fuction bitacora -->
             $codigoObjeto=9;
             $accion='NO SE ELIMINO';
             $descripcion= 'NO  SE ELIMINO EL CONTADOR';
             bitacora($codigoObjeto, $accion,$descripcion); 
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
}