<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>
<?php
    if(isset($_POST['nombre_alergia'])){
       try{
          if(isset($_POST['AGREGAR_ALERGIAS'])){
               $nombre_alergia = ($_POST['nombre_alergia']);
               $descripcion = ($_POST['descripcion_alergia']);
               $fechaActual = date('Y-m-d');
               $usuario =$_SESSION['vario'];   
              try{ 
                  $consulta_rol = $db->prepare("SELECT NOMBRE FROM tbl_alergias WHERE NOMBRE = (?);");
                  $consulta_rol->execute(array($nombre_alergia));
                  $row=$consulta_rol->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('El nombre de la alergia $nombre_alergia ya se encuentra registrado');
                    window.location = 'crudAlergias';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_rol = " INSERT INTO tbl_alergias( NOMBRE, DESCRIPCION, FECHA_CREACION,CREADO_POR) VALUES ('$nombre_alergia','$descripcion','$fechaActual','$usuario'); ";
                      $resul=$conn->query($query_rol);
                      if($resul >0){
                        echo "<script> 
                        window.location = 'crudAlergias';
                        </script>";
                        exit;
                        include_once 'function_bitacora.php';
                        $codigoObjeto=39;
                        $accion='INSERCIÓN';
                        $descripcion= 'SE REGISTRO UNA ALERGIA';
                         bitacora($codigoObjeto, $accion,$descripcion);
                      }else{
                        echo "<script> 
                        alert('Error auxilio!');
                        window.location = 'crudAlergias';
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

       }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }//FIN DEL IF DE REGISTAR UN ROL



  //PARTE PARA EDITAR UN ROLL
  if(isset($_POST['id_alergia'])){
    if(isset($_POST['editar_alergia'])){
      $codigo_alergia = ($_POST['id_alergia']);
      $editar_nombre = ($_POST['editar_nombre']);
      $editar_descripcion = ($_POST['editar_descripcion']);
      $fecha_modificacion = date('Y-m-d'); 
      $user=$_SESSION['vario'];

      try{
       // 
       $sentencia = $db->prepare("SELECT * FROM tbl_alergias where NOMBRE = (?) and CODIGO_ALERGIAS <> (?) ;");
       $sentencia->execute(array($editar_nombre,$codigo_alergia));
       $row=$sentencia->fetchColumn();
        if($row>0){
          echo "<script>
          alert('Ya existe una alergia con este mismo nombre: $editar_nombre');
          window.location = 'crudAlergias';
          </script>";
          exit;
        }else{
          try{
            $sql = " UPDATE tbl_alergias SET NOMBRE = '$editar_nombre' ,DESCRIPCION = '$editar_descripcion',FECHA_MODIFICACION = '$fecha_modificacion', MODIFICADO_POR = '$user'
            WHERE CODIGO_ALERGIAS = '$codigo_alergia' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo '<script>              
              window.location = "crudAlergias";
              </script>';
              include_once 'function_bitacora.php';
              $codigoObjeto=39;
              $accion='MODIFICACIÓN';
              $descripcion= 'SE MODIFICO UNA ALERGIA';
              bitacora($codigoObjeto, $accion,$descripcion);
              exit;
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar la alergia!');
              window.location = 'crudAlergias';
              </script>";
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

//PARTE PARA ELIMINAR UN ROL
if(isset($_POST['alergia_eliminar'])){
  if(isset($_POST['ELIMINAR_ALER'])){
    $code = ($_POST['alergia_eliminar']);
    try{
      $relacion_tablas =  $db->prepare("SELECT a.CODIGO_ALERGIAS FROM tbl_alergias a ,tbl_personas_alergias pa
      WHERE pa.CODIGO_ALERGIAS = a.CODIGO_ALERGIAS and a.CODIGO_ALERGIAS = (?);");
      $relacion_tablas->execute(array($code));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar,existe una relacion');
        window.location = 'crudAlergias';
        </script>";
        exit;
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_alergias WHERE  CODIGO_ALERGIAS = '$code' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            window.location = 'crudAlergias';
            </script>";
            include_once 'function_bitacora.php';
            $codigoObjeto=39;
            $accion='ELIMINACIÓN';
            $descripcion= 'SE ELIMINO UNA ALERGIA';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar la alergia!');
            window.location = 'crudAlergias';
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
}

?>