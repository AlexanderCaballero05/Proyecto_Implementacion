<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  
  include_once 'function_bitacora.php';
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR UN TIPO DE SANGRE 
    if(isset($_POST['tiposangre'])){
       try{
          if(isset($_POST['agregar_tiposangre'])){
               $tiposangre = ($_POST['tiposangre']);
               $fechaActual = date('Y-m-d');  
               $usuario=$_SESSION['vario']; 
              try{ 
                  $consulta_tipo = $db->prepare("SELECT COUNT(*) FROM tbl_tipo_sangre WHERE tipo = (?);");
                  $consulta_tipo->execute(array($tiposangre));
                  $row=$consulta_tipo->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('El tipo de sangre $tiposangre ya se encuentra registrado');
                    window.location = 'crudtiposangre';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_tiposangre = " INSERT INTO `tbl_tipo_sangre`( `TIPO`, `CREADO_POR`, `FECHA_CREACION`) VALUES ('$tiposangre',' $usuario','$fechaActual'); ";
                      $resul=$conn->query($query_tiposangre);
                      if($resul >0){
                        echo "<script> 
                        window.location = 'crudtiposangre';
                        </script>";
                        include_once 'function_bitacora.php';
                        $codigoObjeto=37;
                        $accion='INSERCIÓN';
                        $descripcion='SE REGISTRÓ UN NUEVO TIPO DE SANGRE';
                       bitacora($codigoObjeto,$accion,$descripcion);
                        exit;
                      }else{
                        echo "<script> 
                        alert('Error auxilio!');
                        window.location = 'crudtiposangre';
                        </script>";
                        exit;
                      }
                    }catch(PDOException $e){
                    echo $e->getMessage(); 
                    return false;
                    }
                  }//fin del else de si no existe 
              }catch(PDOException $e){
              echo $e->getMessage(); 
              return false;
              }
            }//fin del if de verificar si hay datos

       }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }//FIN DEL IF DE REGISTAR UNA PREGUNTA



  //PARTE PARA EDITAR UN TIPO DE SANGRE
  if(isset($_POST['id_tiposangre'])){
    if(isset($_POST['editar'])){
      $usuario=$_SESSION['vario']; 
      $fechaActual = date('Y-m-d');  
      $codigo_tipo = ($_POST['id_tiposangre']);
      $editar_tipo = ($_POST['editar_tiposangre']);
      try{
       // 
       $sentencia = $db->prepare("SELECT COUNT(*) FROM tbl_tipo_sangre where TIPO = (?) and CODIGO_TIPO_SANGRE <> (?) ;");
       $sentencia->execute(array($editar_tipo,$codigo_tipo));
       $row=$sentencia->fetchColumn();
        if($row>0){
          echo "<script>
          alert('Ya existe un tipo de sangre con este mismo nombre: $editar_tipo');
          window.location = 'crudtiposangre';
          </script>";
          exit;

        }else{
         
          try{
            $sql = " UPDATE tbl_tipo_sangre
            SET tipo = '$editar_tipo',
            MODIFICADO_POR = '$usuario', 
            FECHA_MODIFICACION = '$fechaActual'
            WHERE CODIGO_TIPO_SANGRE = '$codigo_tipo' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script>
              window.location = 'crudtiposangre';
              </script>";
              include_once 'function_bitacora.php';
              $codigoObjeto=37;
              $accion='MODIFICACIÓN'; 
              $descripcion= 'SE MODIFICÓ UN TIPO DE SANGRE';
              bitacora($codigoObjeto, $accion,$descripcion);
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar el tipo de sangre!');
              window.location = 'crudtiposangre';
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

//PARTE PARA ELIMINAR UNA PREGUNTA
if(isset($_POST['eliminar_tiposangre'])){
  if(isset($_POST['ELIMINAR_TIPOSANGRE'])){
    $codigo = ($_POST['eliminar_tiposangre']);//asigna a una variable el id del tipo de sangre a  eliminar
    try{
        $relacion_tablas =  $db->prepare("SELECT  p.CODIGO_EXPEDIENTE, p.CODIGO_TIPO_SANGRE from  tbl_EXPEDIENTE_MEDICO p, tbl_tipo_sangre tp
        where p.CODIGO_TIPO_SANGRE = tp.CODIGO_TIPO_SANGRE and p.CODIGO_TIPO_SANGRE= (?);");
      $relacion_tablas->execute(array($codigo));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar está relacionado con otras tablas!');
        window.location = 'crudtiposangre';
        </script>";
        exit;
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_tipo_sangre WHERE  CODIGO_TIPO_SANGRE = '$codigo' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            window.location = 'crudtiposangre';
            </script>";
            include_once 'function_bitacora.php';
            $codigoObjeto=37;
            $accion='ELIMINACIÓN';
            $descripcion= 'SE ELIMINÓ UN TIPO DE SANGRE';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar tipo de sangre!');
            window.location = 'crudtiposangre';
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
}//Cerre del if padre

?>