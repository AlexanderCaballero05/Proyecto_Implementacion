
 <?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR SECCION
    if(isset($_POST['nombre_seccion'])){
       try{
          if(isset($_POST['agregar_seccion'])){
               $nombre_seccion = ($_POST['nombre_seccion']);
               $descripcion = ($_POST['descripcion_seccion']); 
              try{ 
                  $consulta_seccion = $db->prepare("SELECT COUNT(*) FROM tbl_seccion WHERE NOMBRE = (?);");
                  $consulta_seccion->execute(array($nombre_seccion));
                  $row=$consulta_seccion->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('El nombre de la sección $nombre_seccion ya se encuentra registrado');
                    window.location = 'crudSeccion';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_seccion = "INSERT INTO TBL_SECCION(NOMBRE, DESCRIPCION) VALUES ('$nombre_seccion','$descripcion'); ";
                      $resul=$conn->query($query_seccion);
                      if($resul >0){
                        echo "<script> 
                        alert('La sección se registro correctamente'); 
                        window.location = 'crudSeccion';
                        </script>";
                        include_once 'function_bitacora.php';
                        $codigoObjeto=46;
                        $accion='INSERCIÓN';
                        $descripcion= 'SE REGISTRO UNA SECCIÓN';
                         bitacora($codigoObjeto, $accion,$descripcion);
                         exit;
                      }else{
                        echo "<script> 
                        alert('Ocurrio algun error');
                        window.location = 'crudSeccion';
                        </script>";
                        exit;
                      }
                    }catch(PDOException $e){
                    echo $e->getMessage(); 
                    return false;
                    }
                  }//fin del else de si no existe el nombre 
              }catch(PDOException $e){
              echo $e->getMessage(); 
              return false;
              }
            }//fin del if de verificar si hay datos

       }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }//



  //PARTE PARA EDITAR UN SECCION
  if(isset($_POST['id_seccion'])){
    if(isset($_POST['editar_seccion'])){
      $codigo_seccion = ($_POST['id_seccion']);
      $editar_nombre = ($_POST['editar_nombre']);
      $editar_descripcion = ($_POST['editar_descripcion']);
      try{
       // 
       $sentencia = $db->prepare("SELECT COUNT(*) FROM tbl_seccion where NOMBRE = (?) and CODIGO_SECCION <> (?) ;");
       $sentencia->execute(array($editar_nombre,$codigo_seccion));
       $row=$sentencia->fetchColumn();
        if($row>0){
          echo "<script>
          alert('Ya existe una sección con este mismo nombre: $editar_nombre');
          window.location = 'crudSeccion';
          </script>";
          exit;
        }else{
          try{
            $sql = " UPDATE tbl_seccion SET NOMBRE = '$editar_nombre' ,DESCRIPCION = '$editar_descripcion'
            WHERE CODIGO_SECCION = '$codigo_seccion' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo '<script>  
              alert("Sección modificada correctamente");             
              window.location = "crudSeccion";
              </script>';
              include_once 'function_bitacora.php';
              $codigoObjeto=46;
              $accion='MODIFICACIÓN';
              $descripcion= 'SE MODIFICO UNA SECCIÓN';
              bitacora($codigoObjeto, $accion,$descripcion);
              exit;
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar la seccion!');
              window.location = 'crudSeccion';
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
  }

//PARTE PARA ELIMINAR UN SECCION
if(isset($_POST['seccion_eliminar'])){
  if(isset($_POST['ELIMINAR_SECCION'])){
    $code = ($_POST['seccion_eliminar']);//asigna a una variable el id del estado a eliminar
    try{
      $relacion_tablas =  $db->prepare("SELECT  t.CODIGO_SECCION  ,t.NOMBRE from tbl_seccion t,tbl_carga_academica c
      where  t.CODIGO_SECCION = c.CODIGO_SECCION and t.CODIGO_SECCION  = (?);");
      $relacion_tablas->execute(array($code));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar la sección,esta relacionado con carga!');
        window.location = 'crudSeccion';
        </script>";
        exit;
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_seccion WHERE  CODIGO_SECCION = '$code' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            alert('Se elimino correctamente'); 
            window.location = 'crudSeccion';
            </script>";
            include_once 'function_bitacora.php';
            $codigoObjeto=46;
            $accion='ELIMINACIÓN';
            $descripcion= 'SE ELIMINO UNA SECCIÓN';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar la sección!');
            window.location = 'crudSeccion';
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