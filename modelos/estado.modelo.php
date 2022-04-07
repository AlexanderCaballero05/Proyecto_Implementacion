<?php
  
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR UN ESTADO
    if(isset($_POST['nombre_estado'])){
       try{
          if(isset($_POST['agregar_estado'])){
               $nombre_estado = ($_POST['nombre_estado']);
               $descripcion = ($_POST['descripcion_estado']);
                  
              try{ 
                  $consulta_estado = $db->prepare("SELECT NOMBRE FROM tbl_estado WHERE NOMBRE = (?);");
                  $consulta_estado->execute(array($nombre_estado));
                  $row=$consulta_estado->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('El nombre del estado $nombre_estado ya se encuentra registrado');
                    window.location = 'estado';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_estado = " INSERT INTO `tbl_estado`( `NOMBRE`, `DESCRIPCION`) VALUES ('$nombre_estado','$descripcion'); ";
                      $resul=$conn->query($query_estado);
                      if($resul >0){
                        echo "<script> 
                          
                        window.location = 'estado';
                        </script>";
                        exit;
                      }else{
                        echo "<script> 
                        alert('Error auxilio!');
                        window.location = 'estado';
                        </script>";
                        exit;
                      }
                    }catch(PDOException $e){
                    echo $e->getMessage(); 
                    return false;
                    }
                  }//fin del else de si no existe el nombre del estado
              }catch(PDOException $e){
              echo $e->getMessage(); 
              return false;
              }
            }//fin del if de verificar si hay datos

       }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }//FIN DEL IF DE REGISTAR UN ESTADO



  //PARTE PARA EDITAR UN ESTADO
  if(isset($_POST['id_estado'])){
    if(isset($_POST['editar_estado'])){
      $codigo_estado = ($_POST['id_estado']);
      $editar_nombre = ($_POST['editar_nombre']);
      $editar_descripcion = ($_POST['editar_descripcion']);
      
      try{
       // 
       $sentencia = $db->prepare("SELECT * FROM tbl_estado where NOMBRE = (?) and CODIGO_ESTADO <> (?) ;");
       $sentencia->execute(array($editar_nombre,$codigo_estado));
       $row=$sentencia->fetchColumn();
        if($row>0){
          echo "<script>
          alert('Ya existe un estado con este mismo nombre: $editar_nombre');
          window.location = 'estado';
          </script>";
          exit;

        }else{
         
          try{
            $sql = " UPDATE tbl_estado SET NOMBRE = '$editar_nombre' ,DESCRIPCION = '$editar_descripcion'  
            WHERE CODIGO_ESTADO = '$codigo_estado' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script>
              window.location = 'estado';
              </script>";
              include_once 'function_bitacora.php';
              $codigoObjeto=1;
              $accion='Modificacion';
              $descripcion= 'Se edito un estado ';
              bitacora($codigoObjeto, $accion,$descripcion);
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar el Estado!');
              window.location = 'estado';
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

//PARTE PARA ELIMINAR UN ESTADO
if(isset($_POST['estado_eliminar'])){
  if(isset($_POST['ELIMINAR_ESTADO'])){
    $code = ($_POST['estado_eliminar']);//asigna a una variable el id del estado a eliminar
    try{
      $relacion_tablas =  $db->prepare("SELECT u.CODIGO_ESTADO, u.CODIGO_USUARIO  from  tbl_usuario  u ,tbl_estado r
      where r.CODIGO_ESTADO  = u.CODIGO_ESTADO  and r.CODIGO_ESTADO  = (?);;");
      $relacion_tablas->execute(array($code));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡Error al eliminar un estado, relacionado con otras tablas!');
        window.location = 'estado';
        </script>";
        exit;
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_estado WHERE  CODIGO_ESTADO = '$code' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            
            window.location = 'estado';
            </script>";
            include_once 'function_bitacora.php';
            $codigoObjeto=1;
            $accion='Modificacion';
            $descripcion= 'Se elimino un estado ';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar el estado!');
            window.location = 'estado';
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


//*****Elaborado por Carlos Amador,no quiten creditos :v *******
?>      