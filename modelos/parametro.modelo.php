
 <?php
 // session_start();
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR UN ROL
    if(isset($_POST['nombre_rol'])){
       try{
          if(isset($_POST['agregar_rol'])){
               $nombre_rol = ($_POST['nombre_rol']);
               $descripcion = ($_POST['descripcion_rol']);
               $fechaActual = date('Y-m-d');   
              try{ 
                  $consulta_rol = $db->prepare("SELECT NOMBRE FROM tbl_roles WHERE NOMBRE = (?);");
                  $consulta_rol->execute(array($nombre_rol));
                  $row=$consulta_rol->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('El nombre del rol $nombre_rol ya se encuentra registrado');
                    window.location = 'roles';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_rol = " INSERT INTO `tbl_roles`( `NOMBRE`, `DESCRIPCION`,  `FECHA_MODIFICACION`) VALUES ('$nombre_rol','$descripcion','$fechaActual'); ";
                      $resul=$conn->query($query_rol);
                      if($resul >0){
                        echo "<script> 
                        alert('Rol registrado correctamente');
                        window.location = 'roles';
                        </script>";
                        exit;
                      }else{
                        echo "<script> 
                        alert('Error auxilio!');
                        window.location = 'roles';
                        </script>";
                        exit;
                      }
                    }catch(PDOException $e){
                    echo $e->getMessage(); 
                    return false;
                    }
                  }//fin del else de si no existe el nombre del rol
              }catch(PDOException $e){
              echo $e->getMessage(); 
              return false;
              }
            }//fin del if de verificar si hay datos

       }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }//FIN DEL IF DE REGISTAR UN ROL



  //PARTE PARA EDITAR UN ROLL
  if(isset($_POST['id_rol'])){
    if(isset($_POST['editar_rol'])){
      $codigo_rol = ($_POST['id_rol']);
      $editar_nombre = ($_POST['editar_nombre']);
      $editar_descripcion = ($_POST['editar_descripcion']);
      try{
       // 
       $sentencia = $db->prepare("SELECT * FROM tbl_roles where NOMBRE = (?) and CODIGO_TIPO_ROL <> (?) ;");
       $sentencia->execute(array($editar_nombre,$codigo_rol));
       $row=$sentencia->fetchColumn();
        if($row>0){
          echo "<script>
          alert('Ya existe un rol con este mismo nombre: $editar_nombre');
          window.location = 'roles';
          </script>";
          exit;

        }else{
         
          try{
            $sql = " UPDATE tbl_roles SET NOMBRE = '$editar_nombre' ,DESCRIPCION = '$editar_descripcion'  
            WHERE CODIGO_TIPO_ROL = '$codigo_rol' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script>
              alert('¡Rol modificado exitosamente!');
              window.location = 'roles';
              </script>";
              include_once 'function_bitacora.php';
              $codigoObjeto=1;
              $accion='Modificacion';
              $descripcion= 'Se edito un rol ';
              bitacora($codigoObjeto, $accion,$descripcion);
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar el rol!');
              window.location = 'roles';
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
if(isset($_POST['rol_eliminar'])){
  if(isset($_POST['ELIMINAR_ROL'])){
    $code = ($_POST['rol_eliminar']);//asigna a una variable el id del estado a eliminar
    try{
      $relacion_tablas =  $db->prepare("SELECT u.CODIGO_TIPO_ROL, u.CODIGO_USUARIO  from  tbl_usuario  u ,tbl_roles r
      where r.CODIGO_TIPO_ROL  = u.CODIGO_TIPO_ROL  and r.CODIGO_TIPO_ROL  = (?);;");
      $relacion_tablas->execute(array($code));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar este rol,esta relacionado con otras tablas!');
        window.location = 'roles';
        </script>";
        exit;
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_roles WHERE  CODIGO_TIPO_ROL = '$code' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            alert('¡Rol eliminado!');
            window.location = 'roles';
            </script>";
            include_once 'function_bitacora.php';
            $codigoObjeto=1;
            $accion='Modificacion';
            $descripcion= 'Se elimino un rol ';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar el rol!');
            window.location = 'roles';
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


//*****Elaborado por Diana Rut,no quiten creditos :v *******
?>