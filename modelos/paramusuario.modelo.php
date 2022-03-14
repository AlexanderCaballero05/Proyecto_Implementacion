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
  $usuario=$_SESSION['vario']; //variable que trae el usuario que está logeado
  if(isset($_POST['editar_paramusu'])){
    $codigo_paramusu = ($_POST['id_paramusu']);
    $editar_parvalor = ($_POST['editar_parvalor']);
    $fechaActual = date('Y-m-d');
    try{
     // 
     $sentencia = $db->prepare("SELECT * FROM tbl_parametros_usuarios where PAR_VALOR = (?) and CODIGO_PARAM_USUARIO <> (?) ;");
     $sentencia->execute(array($editar_parvalor,$codigo_paramusu));
     $row=$sentencia->fetchColumn();
      if($row>0){
        echo "<script>
        alert('Ya existe un Par Valor igual: $editar_parvalor');
        window.location = 'parametrosusuario';
        </script>";
        exit;
      }else{
        try{
          $sql = " UPDATE tbl_parametros_usuarios 
          SET PAR_VALOR = '$editar_parvalor',
          MODIFICADO_POR = '$usuario',
          FECHA_MODIFICACION = '$fechaActual'  
          WHERE CODIGO_PARAM_USUARIO = '$codigo_paramusu' ";
          $consulta=$conn->query($sql);
          if ($consulta>0){
            echo "<script>
            alert('¡Par Valor modificado exitosamente!');
            window.location = 'parametrosusuario';
            </script>";
             //<!--llamada de la fuction bitacora -->
             $codigoObjeto=9;
             $accion='Editar parámetro';
             $descripcion= 'Se editó el registro de Par valor ya existente';
             bitacora($codigoObjeto, $accion,$descripcion);
          }else{
            echo "<script>
            alert('¡Error al intentar modificar Par Valor!');
            window.location = 'parametrosusuario';
            </script>";
               //<!--llamada de la fuction bitacora -->
               $codigoObjeto=9;
               $accion='Editar parámetro fallido';
               $descripcion= 'Se intentó editar el registro de Par valor ya existente';
               bitacora($codigoObjeto, $accion,$descripcion);

          }
        }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
        }//fin del try catch
      }//fin del else
    }catch(PDOException $e){
      echo $e->getMessage(); 
      return false;
     }
  }
}//cierre del if principal

//FUNCIONES DEL CRUD DE ELIMINAR UN PARAMETRO USUARIO

//PARTE PARA ELIMINAR UN PARAMETRO USUARIO
if(isset($_POST['paramusuario_eli'])){
  if(isset($_POST['ELIMINAR_PARAMETROUSUARIO'])){
    $code = ($_POST['paramusuario_eli']);//asigna a una variable el id del estado a eliminar
    try{
      $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
      mysqli_query($link, "DELETE FROM tbl_parametros_usuarios WHERE  CODIGO_PARAM_USUARIO = $code");
      if(mysqli_affected_rows($link)>0){
        echo "<script>
        alert('¡Parametro Usuario eliminado!');
        window.location = 'parametrosusuario';
        </script>";
         //<!--llamada de la fuction bitacora -->
         $codigoObjeto=9;
         $accion='Eliminar PAR VALOR';
         $descripcion= 'Se eliminó un registro de Par Valor';
         bitacora($codigoObjeto, $accion,$descripcion);
        exit;
      }else{
        echo "<script>
        alert('¡Error al eliminar el parametro usuario!');
        window.location = 'parametrosusuario';
        </script>";
         //<!--llamada de la fuction bitacora -->
         $codigoObjeto=9;
         $accion='No eliminar parámetro';
         $descripcion= 'Intento de invalido de eliminar Par Valor';
         bitacora($codigoObjeto, $accion,$descripcion); 
        exit;
      }
    }catch(PDOException $e){
      echo $e->getMessage(); 
      return false;
    }
  }
}