<?php
 include_once 'conexion3.php';
 include_once 'conexion.php';
 include_once 'conexion2.php';
 include_once  "conexionpdo.php";
 
?>

<?php
    if(isset($_POST['codigo_paciente_expediente_psicologico'])){
      $codigo_expediente_paciente = ($_POST['codigo_paciente_expediente_psicologico']);
      $antecedentes_familiares = ($_POST['antecedentes_familiares']);
      $antecedentes_personales = ($_POST['antecedentes_personales']);
      $antecedentes_clinicos = ($_POST['antecedentes_clinicos']);
      date_default_timezone_set("America/Guatemala");
      $Fechaactual=  date('Y-m-d'); 
      $insertar_expediente ="INSERT INTO TBL_EXPEDIENTE_PSICOLOGICO_UNICO (CODIGO_PERSONA, CODIGO_ESTADO, ANTECEDENTES_FAMILIARES , ANTECEDENTES_PERSONALES , ANTECEDENTES_CLINICOS, FECHA_CREACION) 
      VALUES ('$codigo_expediente_paciente', '2', '$antecedentes_familiares','$antecedentes_personales', '$antecedentes_clinicos', '$Fechaactual')";
      $consulta=$conn->query($insertar_expediente);
      $codigo= mysqli_insert_id($conn);

      //Para insertar neuroticos
       if (is_array($_POST['neuroticos'])) {
            foreach ($_POST['neuroticos'] as $neuroticos){
              $sentencia = $db->prepare("CALL Sp_insertar_sintomas(?,?);");
              // llamar al procedimiento almacenado
              $sentencia->execute(array($codigo,$neuroticos));
              $conn->commit();
            } 
        }//fin Para insertar neuroticos
        echo "<script>
        window.location = 'procesoconsultapsicologia'
        </script>";
        $codigoObjeto=31;
        $accion='REGISTRAR';
        $descripcion= 'SE REGISTRO EL EXPEDIENTE PSICOLÓGICO A LA PERSONA CON CODIGO'.$codigo_expediente_paciente;
        bitacora($codigoObjeto, $accion,$descripcion);
        exit;
    }
?>
<?php
//CODIGO PARA AGREGAR UN SINTOMA NEUROTICO DENTRO DEL MISMO PROCESO
 if(isset($_POST['AGREGAR_SINTOMAN'])){
    try{
       if(isset($_POST['sintomaN'])){
            $tiposintoma = ($_POST['sintomaN']);
           try{ 
               $consulta_sintomas = $db->prepare("SELECT COUNT(*) FROM tbl_sintomas_neuroticos WHERE tipo = (?);");
               $consulta_sintomas->execute(array($tiposintoma));
               $row=$consulta_sintomas->fetchColumn();
               if($row>0){
                 echo "<script>
                 alert('Este sintoma neurótico ya se encuentra registrado');
                 window.location = 'procesoExpedientePsicologico';
                 </script>";
               exit;
               }else{
                 try{
                   $query_sintoma = " INSERT INTO `tbl_sintomas_neuroticos`( `TIPO`) VALUES ('$tiposintoma'); ";
                   $resul=$conn->query($query_sintoma);
                   if($resul >0){
                     echo "<script> 
                     alert('Se registro correctamente'); 
                     window.location = 'procesoExpedientePsicologico';
                     </script>";
                     include_once 'function_bitacora.php';
                    bitacora($codigoObjeto,$accion,$descripcion);
                     exit;
                   }else{
                     echo "<script> 
                     alert('Error');
                     window.location = 'procesoExpedientePsicologico';
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
 }
?>


<?php
//CODIGO PARA ACTUALIZAR EL ESTADO DE INCRIPCION CITA A FINALIZADO  :)
if(isset($_POST['EXPEDIENTE_CITA_PSICOLOGICO'])){
    if(isset($_POST['FINALIZAR_EXPEDIENTE_PSICOLOGICO'])){
        $codigo = ($_POST['EXPEDIENTE_CITA_PSICOLOGICO']);
        $estado = "13";
        $update = "UPDATE tbl_inscripcion_cita set CODIGO_ESTADO = '$estado'  where CODIGO_CITA = '$codigo'";
        $consulTITA=$conn->query($update);
        if ($consulTITA >0 ){
            echo "<script> 
            window.location = 'crudPacientesPsicologicos';
            </script>";  
            exit;
        }else{
            echo "<script> 
            window.location = 'crudPacientesPsicologicos';
            </script>";  
            exit;
        }
    }
}
?>


<?php
if(isset($_POST['Crear_plan_terapeutico'])){
  $codigo = ($_POST['EXPEDIENTE_CITA_PSICOLOGICO']);
  $estado = "14";
  $update = "UPDATE tbl_inscripcion_cita set CODIGO_ESTADO = '$estado'  where CODIGO_CITA = '$codigo'";
  $consulTITA=$conn->query($update);
   if ($consulTITA >0 ){
     echo "<script> 
     window.location = 'procesoPlanTerapeutico';
     </script>";  
     exit;
   }
}


?>