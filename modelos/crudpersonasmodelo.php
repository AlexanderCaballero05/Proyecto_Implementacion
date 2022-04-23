<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>
<?php
 /// editar usario
 if(isset ($_POST['cod_personaguardar'])) {
  if (isset($_POST['EDIT_PERSONA'])){
        $user=$_SESSION['vario'];
        $codpersona = $_POST['cod_personaguardar'];
        $p_nombre = $_POST["p_nombre"];
        $s_nombre = $_POST["s_nombre"];
        $p_apellido = $_POST["p_apellido"];
        $s_apellido = $_POST["s_apellido"];
        $dni = $_POST["dni"];    
        $correo = $_POST['correo'];
        $telefono =$_POST['telefono'];
        $direccion= $_POST['direccion'];
        $fechaactual = (date("d-m-Y"));       
        try{
          // evaluemos si el CORREO existe y veamos a quien le pertenece (si es igual a 0 significa que no existe si es igual o mayor a 1 significa que ya lo tiene alguien)
          $sentencia = $db->prepare("SELECT CODIGO_PERSONA FROM tbl_correo_electronico WHERE correo_persona = ?;");
          $sentencia->execute(array($correo));
          $row=$sentencia->fetchColumn();
          $ID_PERSONA_CORREO = $row;
           // evaluemos si el DNI existe y veamos a quien le pertenece (si es igual a 0 significa que no existe si es igual o mayor a 1 significa que ya lo tiene alguien)
          $sentencia = $db->prepare("SELECT tp.CODIGO_PERSONA  from tbl_persona tp where tp.DNI = ?;");
          $sentencia->execute(array($dni));
          $row=$sentencia->fetchColumn();
          $ID_PERSONA_DNI = $row;
          if($ID_PERSONA_CORREO <= 0 || $ID_PERSONA_CORREO == $codpersona){
           if($ID_PERSONA_CORREO <= 0 || $ID_PERSONA_CORREO == $codpersona){   
                //consulta para la table persona
            $update_perfil = "UPDATE tbl_persona 
            SET PRIMER_NOMBRE = '$p_nombre' ,
                SEGUNDO_NOMBRE = '$s_nombre' ,
                PRIMER_APELLIDO = '$p_apellido' ,
                SEGUNDO_APELLIDO = '$s_apellido' ,
                DNI = '$dni',
                DIRECCION = '$direccion'
                WHERE CODIGO_PERSONA = '$codpersona'; ";
            $resultado11=$conn->query($update_perfil);
            //consulta para la table correo
            $update_correo = "UPDATE tbl_correo_electronico
            SET CORREO_PERSONA = '$correo' 
            WHERE CODIGO_PERSONA = '$codpersona'; ";
            $resulta=$conn->query($update_correo);
           //consulta para la table telefono
            $update_telefono = "UPDATE tbl_telefono
            SET NUMERO_TELEFONO = '$telefono' 
            WHERE CODIGO_PERSONA = '$codpersona'; ";
            $resultatel=$conn->query($update_telefono);
            if($resultado11 > 0 && $resulta > 0 && $resultatel > 0){
              echo "<script>
              window.location = 'crudpersonas';
              </script>";
          }else{
            echo "<script>
            alert('!Actualizacion fallida!');
            window.location = 'crudpersonas';
           </script>";
          }///FIN CONSULTA
         } elseif($ID_PERSONA_DNI <> $codpersona){
              echo "<script>
              alert('Ya existe una persona con el DNI: $dni');
             window.location = 'crudpersonas';
              </script>";
            }  // fin else dni
          }elseif($ID_PERSONA_CORREO <> $codpersona){
            echo "<script>
            alert('Ya existe una persona con el correo: $correo');
           window.location = 'crudpersonas';
            </script>";
          } // fin else correo 

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
             mysqli_query($link, "DELETE FROM tbl_persona WHERE  CODIGO_PERSONA = '$cod' ");
             if(mysqli_affected_rows($link)>0){
               echo "<script>
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
               window.location = 'crudpersonas';
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