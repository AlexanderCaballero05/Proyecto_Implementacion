<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>
<?php 
  ////////////editar  Expediente
   if  (isset($_POST['codigo_expediente'])){
    if (isset($_POST['editar_expediente'])){
        $codigo_expediente =($_POST['codigo_expediente']);
        $editar_familiar = ($_POST['editar_familiar']);
        $editar_personal = ($_POST['editar_personal']);
        $editar_clinico = ($_POST['editar_clinico']);
     
        
              try {
                $sql = " UPDATE tbl_expediente_psicologico_unico SET ANTECEDENTES_FAMILIARES = '$editar_familiar' ,ANTECEDENTES_PERSONALES = '$editar_personal',ANTECEDENTES_CLINICOS = '$editar_clinico'
                WHERE CODIGO_EXPEDIENTE = '$codigo_expediente' ";
                $consulta=$conn->query($sql);
                if ($consulta>0){
                  echo "<script>
                  alert('Se actualizo correctamente')
                  window.location = 'crudExpedientePsicoUnico';
                  </script>";
                  include_once 'function_bitacora.php';
                  $codigoObjeto=62;
                  $accion='MODIFICACIÓN';
                  $descripcion= 'SE MODIFICÓ UN EXPEDIENTE PSICOLÓGICO ÚNICO';
                  bitacora($codigoObjeto, $accion,$descripcion);
                  exit;
                }else{
                    echo "<script>
                    alert('¡Error al  intentar modificar la especialidad !');
                    window.location = 'crudExpedientePsicoUnico';
                    </script>";
                  }
              }catch(PDOException $e){
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
              window.location = 'crudExpedientePsicoUnico';
              </script>";
              exit;
            }else{
             try {
                $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
                mysqli_query($link, "DELETE FROM tbl_especialidad WHERE  CODIGO_ESPECIALIDAD = '$code' ");
                if(mysqli_affected_rows($link)>0){
                  echo "<script>
                alert('¡Especialidad eliminada!');
                window.location = 'crudExpedientePsicoUnico';
                </script>";
                include_once 'function_bitacora.php';
                $codigoObjeto=62;
                $accion='ELIMIMINACIÓN';
                $descripcion= 'SE ELIMINÓ UN EXPEDIENTE PSICOLOGICO ÚNICO ';
                bitacora($codigoObjeto, $accion,$descripcion);
                exit;
            }else{
                echo "<script>
                alert('¡Error al eliminar la especialidad tiene relacion con otras tablas !');
                window.location = 'crudExpedientePsicoUnico';
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