<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>

<?php
  //// agregar medicamento /////
  if (isset($_POST['agregar_medicame']) && isset($_POST['agregar_medicamento'])){
    $medicamento = $_POST['agregar_medicamento'];
    $codigo = $_POST['agregar_cod_medi'];
    $descripcion = $_POST['agregar_med_desc'];
    $fechaActual = date('Y-m-d');
    $usuario =$_SESSION['vario'];

    
    try {
        $consulta_objeto = $db->prepare("SELECT tm.NOMBRE_MEDICAMENTO  from tbl_medicamento tm  where tm.NOMBRE_MEDICAMENTO  =(?);");
        $consulta_objeto->execute(array($medicamento));
        $row=$consulta_objeto->fetchColumn();
        if($row>0){
            echo "<script>
            alert('El nombre del medicamento  $medicamento ya se encuentra registrado');
            window.location = 'crudmedicamento';
            </script>";
          exit;  
        } else {
            try {
              $query_medicamento = "INSERT INTO tbl_medicamento (CODIGO_MEDICAMENTO,NOMBRE_MEDICAMENTO,DESCRIPCION,CREADO_POR_USUARIO,FECHA_CREACION)
              VALUES ('$codigo','$medicamento','$descripcion','$usuario','$fechaActual');";
               $resul=$conn->query($query_medicamento);
               if ($resul >0){
                   echo "<script> 
                   window.location = 'crudmedicamento';
                   </script>";
                   exit;
                   include_once 'function_bitacora.php';
                          $codigoObjeto=35;/// CAMBIAR 
                         $accion='REGISTRO DE MEDICAMENTO';
                         $descripcion= 'SE AGREGO UN NUEVO MEDICAMENTO';
                          bitacora($codigoObjeto, $accion,$descripcion);
                 } else {
                   echo "<script> 
                         alert('Error!');
                         window.location = 'crudmedicamento';
                         </script>";
                         exit;
                 }

            }catch(PDOException $e){
                    echo $e->getMessage(); 
                    return false;
                            } 
        } // fin else 
    }catch(PDOException $e){
            echo $e->getMessage(); 
            return false;
                    } 
  } // fin if 

   

  ///// editar medicamento ////
   if (isset( $_POST['cod_edit_med']) && isset($_POST['guardar_med'])){
    $codigo = $_POST['cod_edit_med'];
    $medicamento = $_POST['edit_nom_medi'];
    $descripcion = $_POST['edit_desc_medi'];
    $fechaActual = date('Y-m-d');
    $usuario =$_SESSION['vario'];
      try {
        $sentencia = $db->prepare(" SELECT * from tbl_medicamento tm  
        where tm.NOMBRE_MEDICAMENTO  = (?) and tm.DESCRIPCION <> (?);");
       $sentencia->execute(array($medicamento,$codigo));
       $row=$sentencia->fetchColumn();
       
      
        try {
            $sql = "UPDATE tbl_medicamento tm set tm.NOMBRE_MEDICAMENTO = '$medicamento', tm.DESCRIPCION = '$descripcion', 
            tm.MODIFICADO_POR = '$usuario' , tm.FECHA_MODIFICACION = '$fechaActual' where tm.CODIGO_MEDICAMENTO  = '$codigo' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script>
              window.location = 'crudmedicamento';
              </script>";
              include_once 'function_bitacora.php';
              $codigoObjeto=35; // cambiar 
              $accion='MODIFICACION';
              $descripcion= 'SE EDITO UN MEDICAMENTO';
              bitacora($codigoObjeto, $accion,$descripcion);
              exit;
            }else{
                echo "<script>
                alert('¡Error al  intentar modificar el medicamento!');
                window.location = 'crudmedicamento';
                </script>";
              }
        }catch(PDOException $e){
                echo $e->getMessage(); 
                return false;
                        }
       // fin else 
      }catch(PDOException $e){
            echo $e->getMessage(); 
            return false;
                    } 
   }///fin if 

   //// eliminar medicamento  /////
   if(isset($_POST['eliminar_medicamentos'])){
    if(isset($_POST['eliminar_medica'])){
      $codigo = ($_POST['eliminar_medicamentos']);//asigna a una variable el id de la pregunta a  eliminar
      try{
          $relacion_tablas =  $db->prepare("SELECT rm.CODIGO_RECETA_MEDICA, rm.CODIGO_MEDICAMENTO from  tbl_receta_medica rm, tbl_medicamento m
          where m.CODIGO_MEDICAMENTO  = rm.CODIGO_MEDICAMENTO and m.CODIGO_MEDICAMENTO = (?);");
        $relacion_tablas->execute(array($codigo));
        $row = $relacion_tablas->fetchColumn();
        if($row >0){
          echo "<script>
          alert('¡No se puede eliminar esta, relacionado con otras tablas!');
          window.location = 'crudmedicamento';
          </script>";
          exit;
        }else{
          try{
            $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
            mysqli_query($link, "DELETE FROM tbl_medicamento WHERE  CODIGO_MEDICAMENTO = '$codigo' ");
            if(mysqli_affected_rows($link)>0){
              echo "<script>
              window.location = 'crudmedicamento';
              </script>";
              include_once 'function_bitacora.php';
              $codigoObjeto=35;
              $accion='ELIMINACION';
              $descripcion= 'SE ELIMINO UN MEDICAMENTO ';
              bitacora($codigoObjeto, $accion,$descripcion);
              exit;
            }else{
              echo "<script>
              alert('¡Error al eliminar el medicamento!');
              window.location = 'crudmedicamento';
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