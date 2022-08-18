<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>
<?php 
  if (isset ($_POST['guardar_tipo'])){
      
    if (isset($_POST['guardar_tipo_socio'])){
     $tipo = $_POST['guardar_tipo'];
     $descripcion = $_POST['guardar_descripcion'];
     $fechaActual = date('Y-m-d');
     $usuario =$_SESSION['vario'];
     
     try {
        $consulta_objeto = $db->prepare("SELECT COUNT(*)  from tbl_tipo_socioeconomico  where TIPO  = (?);");
        $consulta_objeto->execute(array($tipo));
        $row=$consulta_objeto->fetchColumn();
        if($row>0){
            echo "<script>
            alert('El nombre del tipo Socioeconómico  $tipo ya se encuentra registrado');
            window.location = 'crudtiposocioeconomico';
            </script>";
          exit;
          
        } else {
            
            try {
                $query_objeto = " INSERT INTO tbl_tipo_socioeconomico (TIPO,DESCRIPCION,CREADO_POR,FECHA_CREACION)  
                VALUES ('$tipo','$descripcion','$usuario','$fechaActual'); ";
                $resul=$conn->query($query_objeto);
                if ($resul >0){
                    echo "<script> 
                    alert('Tipo Socioeconómico registrado correctamente');
                    window.location = 'crudtiposocioeconomico';
                    </script>";
                   
                    exit;
                  }else{
                    echo "<script> 
                    alert('Ocurrio algun error');
                    window.location = 'crudtiposocioeconomico';
                    </script>";
                    exit;
                  }
            }catch(PDOException $e){
             echo $e->getMessage(); 
             return false;
            }
        }// fin else  
     }catch(PDOException $e){
      echo $e->getMessage(); 
      return false;
      } 
    }//
  }

  // ******EDITAR TIPO SOCIOECONOMICO******

   if  (isset($_POST['cod_edit_tipo'])){
    if (isset($_POST['edit_tipo'])){
        $code =($_POST['cod_edit_tipo']);
        $editipo = ($_POST['edit_tipo_socio']);
        $edi_descripcion = ($_POST['edit_descripcion']);
        $fecha_modificacion= date('Y-m-d');
        $user =$_SESSION['vario'];
         try {
            $sentencia = $db->prepare("SELECT COUNT(*) FROM tbl_tipo_socioeconomico where TIPO = (?)
             and CODIGO_TIPOSOCIO <> (?) ;");
            $sentencia->execute(array($editipo,$code));
            $row=$sentencia->fetchColumn();
            if($row>0){
             echo "<script>
             alert('Ya existe un tipo Socioeconómico con este mismo nombre: $editipo');
             window.location = 'crudtiposocioeconomico';
             </script>";
             exit;
            }else{
              try{
                $sql = " UPDATE tbl_tipo_socioeconomico SET TIPO = '$editipo' ,DESCRIPCION = '$edi_descripcion',FECHA_MODIFICACION = '$fecha_modificacion', MODIFICADO_POR = '$user'
                WHERE CODIGO_TIPOSOCIO = '$code' ";
                $consulta=$conn->query($sql);
                if ($consulta>0){
                  echo "<script>
                  alert('¡Tipo Socioeconómico modificado exitosamente!');
                  window.location = 'crudtiposocioeconomico';
                  </script>";
                  
                  exit;
                }else{
                    echo "<script>
                    alert('¡Error al  intentar modificar el tipo Socioeconómico!');
                    window.location = 'crudtiposocioeconomico';
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
    }
   }
   

   ///// eliminar socio economico 

    if (isset($_POST['eliminar_tipo_socio'])){
        if (isset ($_POST ['eliminar_tipo'])){
            $code =($_POST['eliminar_tipo_socio']);
           try {
            $relacion_tablas =  $db->prepare("SELECT tts.TIPO ,tcs.NOMBRE_TIPO 
            from tbl_tipo_socioeconomico tts , tbl_contenido_socioeconomico tcs  
            where  tts.CODIGO_TIPOSOCIO =tcs.CODIGO_TIPOSOCIO  and tts.CODIGO_TIPOSOCIO = (?);");
            $relacion_tablas->execute(array($code));
            $row = $relacion_tablas->fetchColumn();
            if($row >0){
              echo "<script>
              alert('¡No se puede eliminar este tipo socioeconómico,esta relacionado con otras tablas!');
              window.location = 'crudtiposocioeconomico';
              </script>";
              exit;
            }else{
             try {
                $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
                mysqli_query($link, "DELETE FROM tbl_tipo_socioeconomico WHERE  CODIGO_TIPOSOCIO = '$code' ");
                if(mysqli_affected_rows($link)>0){
                  echo "<script>
                alert('¡Tipo socioeconómico eliminado!');
                window.location = 'crudtiposocioeconomico';
                </script>";
               
                exit;
            }else{
                echo "<script>
                alert('¡Error al eliminar el Tipo socio Economico tiene relacion con otras tablas !');
                window.location = 'crudtiposocioeconomico';
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