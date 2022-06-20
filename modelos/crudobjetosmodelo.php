<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>

<?php
 /// este codigo me dio 3 ataques de panico asi q no lo toquen
  if ( isset($_POST['nombre'])){
    try{
     if (isset($_POST['ADD_OBJETO'])){
        $nombre_objeto = ($_POST['nombre']);
        $descripcion = ($_POST['descripcion']);
        $fechaActual = date('Y-m-d');
        $usuario =$_SESSION['vario'];
        try {
            $consulta_objeto = $db->prepare("SELECT COUNT(*) FROM tbl_objetos WHERE NOMBRE = (?);");
            $consulta_objeto->execute(array($nombre_objeto));
            $row=$consulta_objeto->fetchColumn();
            if($row>0){
                echo "<script>
                alert('El nombre del rol $nombre_rol ya se encuentra registrado');
                window.location = 'crudobjetos';
                </script>";
              exit;
              }else{
               try {
                $query_objeto = " INSERT INTO tbl_objetos(NOMBRE,DESCRIPCION,CREADO_POR_USUARIO,FECHA_CREACION)  
                VALUES ('$nombre_objeto','$descripcion','$usuario','$fechaActual'); ";
                $resul=$conn->query($query_objeto);
                if ($resul >0){
                  echo "<script> 
                  window.location = 'crudobjetos';
                  </script>";
                  exit;
                  include_once 'function_bitacora.php';
                         $codigoObjeto=6;
                        $accion='Registro';
                        $descripcion= 'Se agrego un nuevo objeto ';
                         bitacora($codigoObjeto, $accion,$descripcion);
                } else {
                  echo "<script> 
                        alert('Error !');
                        window.location = 'crudobjetos';
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

  } //FIN DEL IF DE REGISTAR
    ///// editar objeto 
   if (isset($_POST['cod_objetoedit'])){
      if (isset ($_POST['EDIT_OBJETO'])){
        $codigo_objeto =($_POST['cod_objetoedit']);
        $edinombre_objeto = ($_POST['editnombre']);
        $edi_descripcion = ($_POST['editdescripcion']);
        $fecha_modificacion= date('Y-m-d');

        $user = $_SESSION['vario'];

        try {
         $sentencia = $db->prepare("SELECT COUNT(*) FROM tbl_objetos where NOMBRE = (?) and CODIGO_OBJETO <> (?) ;");
         $sentencia->execute(array($edinombre_objeto,$codigo_objeto));
         $row=$sentencia->fetchColumn();
         if($row>0){
          echo "<script>
          alert('Ya existe un OBJETO con este mismo nombre: $edinombre_objeto');
          window.location = 'crudobjetos';
          </script>";
          exit;
         } else {
          try {
            $sql = " UPDATE tbl_objetos SET NOMBRE = '$edinombre_objeto' 
                                          ,DESCRIPCION = '$edi_descripcion',FECHA_MODIFICACION = '$fecha_modificacion', MODIFICADO_POR = 'ADMIN'
            WHERE CODIGO_OBJETO = '$codigo_objeto' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script>
              window.location = 'crudobjetos';
              </script>";
              include_once 'function_bitacora.php';
              $codigoObjeto=6;
              $accion='Modificacion';
              $descripcion= 'Se edito un objeto ';
              bitacora($codigoObjeto, $accion,$descripcion);
              exit;
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar el objeto!');
              window.location = 'crudobjetos';
              </script>";
            }
          }catch(PDOException $e){
          echo $e->getMessage(); 
          return false;
                  }
                   
        }//fin del else
        
        } catch(PDOException $e){
          echo $e->getMessage(); 
          return false;
         }

      }//FIN DEL IF  HIJO DE editar 

   }//FIN DEL IF DE editar 

   /// eliminar objeto 
   if (isset($_POST['objeto_eliminar'])){
     if (isset ($_POST['cod_objeto_eliminar'])){
       $code =($_POST['cod_objeto_eliminar']);
         try{
          $relacion_tablas =  $db->prepare("SELECT to2.CODIGO_OBJETO, tp.CODIGO_PERMISO 
          from tbl_objetos to2 , tbl_permisos tp 
          where to2.CODIGO_OBJETO = tp.CODIGO_OBJETO and to2.CODIGO_OBJETO = (?);;");
          $relacion_tablas->execute(array($code));
          $row = $relacion_tablas->fetchColumn();
          if($row >0){
            echo "<script>
            alert('¡No se puede eliminar este objeto,esta relacionado con otras tablas!');
            window.location = 'crudobjetos';
            </script>";
            exit;
          } else {
            try{
              $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
              mysqli_query($link, "DELETE FROM tbl_objetos WHERE  CODIGO_OBJETO = '$code' ");
              if(mysqli_affected_rows($link)>0){
                echo "<script>
              window.location = 'crudobjetos';
              </script>";
              include_once 'function_bitacora.php';
              $codigoObjeto=6;
              $accion='Eliminación';
              $descripcion= 'Se elimino un OBJETO ';
              bitacora($codigoObjeto, $accion,$descripcion);
              exit;
              }else{
                echo "<script>
                alert('¡Error al eliminar el objeto tiene relacion con otras tablas!');
                window.location = 'crudobjetos';
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

     }//FIN DEL IF  HIJO DE ELIMINAR 

   }//FIN DEL IF DE ELIMINAR


?>
