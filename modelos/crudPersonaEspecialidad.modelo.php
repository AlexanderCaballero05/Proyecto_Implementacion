<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>
<?php 
  if (isset ($_POST['guardar_tipo_espe'])){
      
    if (isset($_POST['guardar_espe'])){
     $tipo = $_POST['guardar_tipo_espe'];
     $descripcion = $_POST['guardar_descripcion_espe'];
     $fechaActual = date('Y-m-d');
     $usuario =$_SESSION['vario'];
     
     try {
        $consulta_objeto = $db->prepare("SELECT COUNT(*)  from tbl_especialidad ep  where ep.NOMBRE  = (?);");
        $consulta_objeto->execute(array($tipo));
        $row=$consulta_objeto->fetchColumn();
        if($row>0){
            echo "<script>
            alert('El nombre de la especialidad $tipo ya se encuentra registrada');
            window.location = 'crudespecialidad';
            </script>";
          exit;
          
        } else {
            
            try {
                $query_objeto = " INSERT INTO tbl_especialidad (NOMBRE,DESCRIPCION)  
                VALUES ('$tipo','$descripcion'); ";
                $resul=$conn->query($query_objeto);
                if ($resul >0){
                    echo "<script> 
                    alert('Especialidad registrada correctamente');
                    window.location = 'crudespecialidad';
                    </script>";
                    exit;
                    include_once 'function_bitacora.php';
                           $codigoObjeto=25;
                          $accion='Registro';
                          $descripcion= 'Se agrego una nueva especialidad';
                           bitacora($codigoObjeto, $accion,$descripcion);
                  } else {
                    echo "<script> 
                          alert('Error !');
                          window.location = 'crudespecialidad';
                          </script>";
                          exit;
                  }

            }catch(PDOException $e){
                echo $e->getMessage(); 
                return false;
                        }

        }// fin else padre  

     }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
                } 

      }// if fin hijoo

  }// if fin padre
  ////////////editar  especialidad
   if  (isset($_POST['cod_edit_espe'])){
    if (isset($_POST['guar_e'])){
        $code =($_POST['cod_edit_espe']);
        $editipo = ($_POST['edit_tipo_espe']);
        $edi_descripcion = ($_POST['edit_descripcion_espe']);
        $fecha_modificacion = date('Y-m-d'); 
        $user=$_SESSION['vario'];
         try {
            $sentencia = $db->prepare("SELECT COUNT(*) FROM tbl_especialidad where NOMBRE = (?)
             and DESCRIPCION <> (?) ;");
            $sentencia->execute(array($editipo,$code));
            $row=$sentencia->fetchColumn();
            if($row>0){
             echo "<script>
             alert('Ya existe una especialidad con este mismo nombre: $editipo');
             window.location = 'crudespecialidad';
             </script>";
             exit;
            } else {
              try {
                $sql = " UPDATE tbl_especialidad SET NOMBRE = '$editipo' ,DESCRIPCION = '$edi_descripcion'
                WHERE CODIGO_ESPECIALIDAD = '$code' ";
                $consulta=$conn->query($sql);
                if ($consulta>0){
                  echo "<script>
                  alert('¡Especialidad modificada exitosamente!');
                  window.location = 'crudespecialidad';
                  </script>";
                  include_once 'function_bitacora.php';
                  $codigoObjeto=25;
                  $accion='Modificacion';
                  $descripcion= 'Se edito una  Especialidad';
                  bitacora($codigoObjeto, $accion,$descripcion);
                  exit;
                }else{
                    echo "<script>
                    alert('¡Error al  intentar modificar la especialidad !');
                    window.location = 'crudespecialidad';
                    </script>";
                  }
              }catch(PDOException $e){
                echo $e->getMessage(); 
                return false;
                        } 

            }// fin else padre 

         } catch(PDOException $e){
            echo $e->getMessage(); 
            return false;
                    } 

    }// fin hijo if 
     
   }// fin padre if 
   

   ///// eliminar socio economico 

    if (isset($_POST['eliminar_tipo_espe'])){
        if (isset ($_POST ['eliminar_espe'])){
            $code =($_POST['eliminar_tipo_espe']);
           try {
            $relacion_tablas =  $db->prepare("SELECT ep.NOMBRE ,pe.CODIGO_PERSONA_ESPECIALIDAD 
            from tbl_especialidad ep , tbl_persona_especialidad pe  
            where  ep.CODIGO_ESPECIALIDAD =pe.CODIGO_PERSONA_ESPECIALIDAD and ep.CODIGO_ESPECIALIDAD = (?);");
            $relacion_tablas->execute(array($code));
            $row = $relacion_tablas->fetchColumn();
            if($row >0){
              echo "<script>
              alert('¡No se puede eliminar la especialidad, esta relacionada con otras tablas!');
              window.location = 'crudespecialidad';
              </script>";
              exit;
            }else{
             try {
                $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
                mysqli_query($link, "DELETE FROM tbl_especialidad WHERE  CODIGO_ESPECIALIDAD = '$code' ");
                if(mysqli_affected_rows($link)>0){
                  echo "<script>
                alert('¡Especialidad eliminada!');
                window.location = 'crudespecialidad';
                </script>";
                include_once 'function_bitacora.php';
                $codigoObjeto=25;
                $accion='Eliminación';
                $descripcion= 'Se elimino una especialidad ';
                bitacora($codigoObjeto, $accion,$descripcion);
                exit;
            }else{
                echo "<script>
                alert('¡Error al eliminar la especialidad tiene relacion con otras tablas !');
                window.location = 'crudespecialidad';
                </script>";
                exit;
              } 
             }catch(PDOException $e){
                echo $e->getMessage(); 
                return false;
                }
            }// else padre fin

           }catch(PDOException $e){
            echo $e->getMessage(); 
            return false;
            }
        } // fin if hijo 

    }///fin if padre 

?>