<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>
<?php
 /// editar usario
 if(isset ($_POST['cod_personaguardar'])) {
        $user=$_SESSION['vario'];
  if (isset($_POST['EDIT_PERSONA'])){
        $codpersona = $_POST['cod_personaguardar'];
        $p_nombre = $_POST["p_nombre"];
        $s_nombre = $_POST["s_nombre"];
        $p_apellido = $_POST["p_apellido"];
        $s_apellido = $_POST["s_apellido"];
        $dni = $_POST["dni"];
        $sexo = $_POST["sexo"];
        $tipo_persona= $_POST["cod_tip_per"];     
        $f_nacimiento = $_POST["f_nacimiento"];
        $lugar_n = $_POST["lugar_n"];
        $correo = $_POST['correo'];
        $telefono =$_POST['telefono'];
        $direccion= $_POST['direccion'];
        $fechaactual = strtotime(date("d-m-Y"));   
        try{
          // evaluemos si el CORREO existe y veamos a quien le pertenece (si es igual a 0 significa que no existe si es igual o mayor a 1 significa que ya lo tiene alguien)
          $sentencia = $db->prepare("SELECT CODIGO_PERSONA FROM tbl_correo_electronico WHERE correo_persona = ?;");
          $sentencia->execute(array($correo));
          $row=$sentencia->fetchColumn();
          $CODIGO_PERSONA_CORREO = $row;
          $sentencia = $db->prepare("SELECT COUNT(*) FROM tbl_correo_electronico WHERE correo_persona = ?;");
          $sentencia->execute(array($correo));
          $row=$sentencia->fetchColumn();
          $CONTEOCORREO = $row;
          // evaluemos si la IDENTIDAD existe y veamos a quien le pertenece (si es igual a 0 significa que no existe si es igual o mayor a 1 significa que ya lo tiene alguien)
          $sentencia = $db->prepare("SELECT CODIGO_PERSONA FROM tbl_persona WHERE dni = ?;");
          $sentencia->execute(array($dni));
          $row=$sentencia->fetchColumn();
          $CODIGO_PERSONA_IDENTIDAD = $row;
          $sentencia = $db->prepare("SELECT COUNT(*) FROM tbl_persona WHERE dni = ?;");
          $sentencia->execute(array($dni));
          $row=$sentencia->fetchColumn();
          $CONTEOIDENTIDAD = $row;
          
          if($CONTEOIDENTIDAD == 0 || $CODIGO_PERSONA_IDENTIDAD == $codpersona){
            if($CONTEOCORREO == 0 || $CODIGO_PERSONA_CORREO == $codpersona){
                try{
                  $sql = "CALL  	sp_actualizar_personas('$p_nombre','$s_nombre','$p_apellido','$s_apellido','$dni','$f_nacimiento','$lugar_n','$sexo','$user','$fechaactual','$correo','$telefono','$codpersona','$tipo_persona','$direccion');" ;
                    $consulta=$conn->query($sql);
                      if ($consulta>0) {
                            echo "<script>
                              alert('Actualización Exitosa');
                                 window.location = 'crudpersonas';
                                  </script>";
                                  include_once 'function_bitacora.php';
                                  $codigoObjeto=14;
                                  $accion='actualizo';
                                  $descripcion= 'Se actualizo una persona ';
                                  bitacora($codigoObjeto, $accion,$descripcion);
                                }else{ 
                                echo "<script>
                            alert('Error al actualizar el registro');
                            window.location = 'crudpersonas';
                             </script>";
                              }
                                  return true;
                                } catch(PDOException $e) {
                            
                                echo $e->getMessage();  
                                    return false;
                                }
            }elseif ($CODIGO_PERSONA_CORREO <> $codpersona || $CONTEOCORREO>0) {
              echo "<script>
              alert('Ya existe una persona con el correo electrónico: $correo');
                 window.location = 'crudpersonas';
                  </script>";
            }
          }elseif($CODIGO_PERSONA_IDENTIDAD <> $codpersona || $CONTEOIDENTIDAD >0){
            echo "<script>
            alert('Ya existe una persona con el número de identidad: $dni');
               window.location = 'crudpersonas';
                </script>";
          }    
          return true;
        } catch(PDOException $e) {
    
        echo $e->getMessage();  
            return false;
        }

  }  ///fin el hijo

 } //fin el padre 

 /// eliminar 
 if (isset($_POST['cod_personaeliminar'])){   
  if (isset($_POST['ELIMINAR_PERSONA'])) {
      $cod = $_POST['cod_personaeliminar'];
       try {
         $sentencia = $db->prepare("SELECT td.CODIGO_DIRECCION  ,tce.CODIGO_PERSONA  ,tt.CODIGO_PERSONA  ,ttp.CODIGO_TIPO_PERSONA 
         FROM tbl_persona tp 
         left join tbl_direccion td  on  td.CODIGO_PERSONA =tp.CODIGO_PERSONA 
         left join tbl_correo_electronico tce  on tce.CODIGO_PERSONA = tp.CODIGO_PERSONA 
         left join tbl_telefono tt on tt.CODIGO_PERSONA =tp.CODIGO_PERSONA 
         left join tbl_tipo_persona ttp on ttp.CODIGO_TIPO_PERSONA =tp.CODIGO_PERSONA 
         where  tp.CODIGO_PERSONA = (?);");
           $sentencia->execute(array($cod));
           $row=$sentencia->fetchColumn();
          if ($row >0){
           echo "<script>
           alert('¡No se pueden eliminar esta persona,estan relacionado con otras tablas!');
           window.location = 'crudpersonas';
           </script>";
           exit;
          } else {
            try {
             $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
             mysqli_query($link, "DELETE FROM tbl_persona WHERE  CODIGo_PERSONA = '$cod' ");
             if(mysqli_affected_rows($link)>0){
               echo "<script>
               alert('¡PERSONA eliminada!');
               window.location = 'crudpersonas';
               </script>";
               include_once 'function_bitacora.php';
               $codigoObjeto=14;
               $accion='ELIMINACION';
               $descripcion= 'Se elimino UNA PERSONA ';
               bitacora($codigoObjeto, $accion,$descripcion);
               exit;
             }else{
               echo "<script>
               alert('¡Error al eliminar la persona tiene relacion con otras tablas !');
               window.location = 'crudPermisos';
               </script>";
               exit;
             }
            } catch(PDOException $e){
               echo $e->getMessage(); 
             return false;
               }
          }
       } catch(PDOException $e){
         echo $e->getMessage(); 
        return false;
        }
    }//// IF HIJO FIN
  }/// IF PADRE FIN
  

 ?>