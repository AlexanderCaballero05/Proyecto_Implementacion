<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  
?>
<?php
//parte para agregar un nuveo registro
if(isset($_POST['codigo_paciente'])){
  session_start();
  $usuario = $_SESSION['vario'];
  if(isset($_POST['Guardar_PreClinica'])){
    try{
      $codigo_cita = ($_POST['codigo_paciente']);
      $peso = ($_POST['peso']);
      $estatura = ($_POST['estatura']);
      $tipo_sangre = ($_POST['tipo_sangre']);
      $fechaActual = date('Y-m-d'); 
      $user = 'admin';
      //
      $inser ="INSERT INTO tbl_preclinica (`CODIGO_CITA`, `CODIGO_TIPO_SANGRE`, `PESO`, `ESTATURA`, `CREADO_POR`, `FECHA_CREACION`)
       VALUES ('$codigo_cita','$tipo_sangre','$peso', '$estatura', '$usuario', '$fechaActual') ";
      $consulta=$conn->query($inser);
      if ($consulta>0){

        if (is_array($_POST['alergia'])) {
          foreach ($_POST['alergia'] as $alergia){
            $sentencia = $db->prepare("CALL Sp_insertar_alergias(?,?);");
            // llamar al procedimiento almacenado
            $sentencia->execute(array($codigo_cita,$alergia));
          }
          echo "<script>
          alert('Datos preClinica guardados');
          window.location = 'procesoPreClinica';
          </script>";
          exit;
        }else{
          echo "<script>
          alert('ERRROR');
          window.location = 'procesoPreClinica';
          </script>";
          exit;
        
        }
        
      }else{    
        exit;

      }
    }catch(PDOException $e){
    echo $e->getMessage(); 
    return false;
    }

  }

}
  
 

  







  //PARTE PARA EDITAR UN REGISTRO EN PRECLINICA
  if(isset($_POST['id_preclinica'])){
    if(isset($_POST['editar_preclinica'])){
      $codigo_preclinica = ($_POST['id_preclinica']);
      $editar_peso = ($_POST['editar_peso']);
      $editar_estatura = ($_POST['editar_estatura']);
     
      try{         
          try{
            $sql = " UPDATE tbl_Preclinica SET PESO = '$editar_peso',ESTATURA = '$editar_estatura' WHERE CODIGO_PRECLINICA = '$codigo_preclinica' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script>
              alert('Registro modificado exitosamente!');
              window.location = 'crudPreclinica';
              </script>";
              include_once 'function_bitacora.php';
              $codigoObjeto=1;
              $accion='Modificacion';
              $descripcion= 'Se edito un registro en la Preclinica ';
              bitacora($codigoObjeto, $accion,$descripcion);
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar un registro en Preclinica!');
              window.location = 'crudPreclinica';
              </script>";
            }
          }catch(PDOException $e){
          echo $e->getMessage(); 
          return false;
          }//fin del try catch
        
      }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }
  }//cierre del if principal

//PARTE PARA ELIMINAR UN REGISTRO EN PRECLINICA
if(isset($_POST['preclinica_eliminar'])){
  if(isset($_POST['ELIMINAR_PRECLINICA'])){
    $code = ($_POST['preclinica_eliminar']);//
    try{
      
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_Preclinica WHERE  CODIGO_PRECLINCA = '$code' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            alert('Registro eliminado!');
            window.location = 'crudPreclinica';
            </script>";
            include_once 'function_bitacora.php';
            $codigoObjeto=1;
            $accion='Modificacion';
            $descripcion= 'Se elimino un registro en la tabla preclinica';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar un registro!');
            window.location = 'crudPreclinica';
            </script>";
            exit;
          }
        }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
      //}//
    }catch(PDOException $e){
     echo $e->getMessage(); 
     return false;
    }
  }
}//Cerre del if padre

//Solo la parte de eliminar ***********
//*****Realizo solo la parte de eliminar y no completa*** por Carlos Amador,no quiten creditos :v *******
?>