<?php
  
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  
?>
<?php

  //PARTE PARA EDITAR UNA RECETA MEDICA
  if(isset($_POST['id_rece'])){
    $usuario=$_SESSION['vario']; //variable que trae el usuario que está logeado
    if(isset($_POST['editar_receta'])){
      $codigo_receta_medica = ($_POST['id_rece']);
      $editar_nombre = ($_POST['editar_nombre']);
      $editar_indicacion = ($_POST['editar_indicacion']);
      $editar_observaciones = ($_POST['editar_observaciones']);
      $fechaActual = date('Y-m-d');
      try{
      
          try{
            $sql = " UPDATE tbl_receta_medica 
            SET NOMBRE_MEDICAMENTO = '$editar_nombre' ,
            INDICACIONES_RECETA = '$editar_indicacion',
            OBSERVACIONES = '$editar_observaciones', 
            FECHA_MODIFICACION = '$fechaActual',
            MODIFICADO_POR = '$usuario'
            WHERE CODIGO_RECETA_MEDICA = '$codigo_receta_medica' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script>
              alert('¡Receta medica ha sido modificado exitosamente!');
              window.location = 'crudrecetamedica';
              </script>";
              include_once 'function_bitacora.php';
              $codigoObjeto=34;
              $accion='Modificacion';
              $descripcion= 'Se edito la receta medica ';
              bitacora($codigoObjeto, $accion,$descripcion);
            }else{
              echo "<script>
              alert('¡Error al intentar modificar la receta medica!');
              window.location = 'crudrecetamedica';
              </script>";
            }
          }catch(PDOException $e){
          echo $e->getMessage(); 
          return false;
          }//fin del try catch
        }//fin del else
      catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }
  }//cierre del if principal

//PARTE PARA ELIMINAR UNA RECETA MEDICA
if(isset($_POST['rece_eli'])){
  if(isset($_POST['ELIMINAR_RECETA'])){
    $code = ($_POST['rece_eli']);//asigna a una variable el id del estado a eliminar
    try{
      $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
      mysqli_query($link, "DELETE FROM tbl_receta_medica WHERE  CODIGO_RECETA_MEDICA = $code");
      if(mysqli_affected_rows($link)>0){
        echo "<script>
        alert('¡Receta medica eliminado!');
        window.location = 'crudrecetamedica';
        </script>";
         //<!--llamada de la fuction bitacora -->
         $codigoObjeto=34;
         $accion='Eliminar Receta';
         $descripcion= 'Se eliminó la receta medica';
         bitacora($codigoObjeto, $accion,$descripcion);
        exit;
      }else{
        echo "<script>
        alert('¡Error al eliminar la receta medica!');
        window.location = 'crudrecetamedica';
        </script>";
         //<!--llamada de la fuction bitacora -->
         $codigoObjeto=34;
         $accion='No eliminar receta medica';
         $descripcion= 'Intento de invalido de eliminar receta medica';
         bitacora($codigoObjeto, $accion,$descripcion); 
        exit;
      }
    }catch(PDOException $e){
      echo $e->getMessage(); 
      return false;
    }
  }
}