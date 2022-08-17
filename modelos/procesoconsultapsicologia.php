<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>

<?php
    if(isset($_POST['codigo_cita_psicologica'])){
        if(isset($_POST['enviar_cita_psicologica'])){ 
        $codigo_cita_psicologica = ($_POST['codigo_cita_psicologica']);
        //$estado_cita_medica = ($_POST['estado_cita_medica']);
        $codigo_persona = ($_POST['codigo_persona']);

        $consulta_expediente = $db->prepare("SELECT CODIGO_PERSONA FROM TBL_EXPEDIENTE_PSICOLOGICO_UNICO WHERE CODIGO_PERSONA = (?);");
        $consulta_expediente->execute(array($codigo_persona));
        $row=$consulta_expediente->fetchColumn();

        if($row>0){
          $enviar_cita_psicologica = "UPDATE tbl_inscripcion_cita
          SET CODIGO_ESTADO = '11'
          WHERE CODIGO_CITA = '$codigo_cita_psicologica'";
           $consulta_cita_psicologica =$conn->query($enviar_cita_psicologica);
           echo "<script> 
            window.location = 'procesoconsultapsicologia';
            </script>";
  
          }else{
            $enviar_cita_psicologica = "UPDATE tbl_inscripcion_cita
            SET CODIGO_ESTADO = '11'
            WHERE CODIGO_CITA = '$codigo_cita_psicologica'";
           $consulta_cita_psicologica =$conn->query($enviar_cita_psicologica); 
            echo "<script>
            window.location = 'procesoExpedientePsicologico'
            </script>";
          }
        }
    }
?>

<?php
//agregar  
 if (isset ($_POST['sintomas3'] )){
  $fechaActual= date('Y-m-d');
 if ( isset ($_POST['Guardar_Consulta3'])){   
  try {
   $observaciones= ($_POST['observaciones3']);
    $Egreso= ($_POST['Egreso3']);
    $Ingreso= ($_POST['Ingreso3']);
    $sintomas= ($_POST['sintomas3']);
    $codigocita2= ($_POST['codigocita3']); 
  
       $insert= "INSERT into tbl_expediente_psicologico_consulta (CODIGO_CITA, SINTOMAS,DIAGNOSTICO_INGRESO,
       DIAGNOSTICO_EGRESO,OBSEVARCIONES,FECHA_CREACION) values ('$codigocita2','$sintomas','$Ingreso','$Egreso',
       '$observaciones','$fechaActual')";
        $consulta=$conn->query($insert);
        
        if ($consulta >0){
          $update = "UPDATE tbl_inscripcion_cita
          set CODIGO_ESTADO = '12'  
          where CODIGO_CITA = '$codigocita2';";
          $consult=$conn->query($update);
          echo "<script> 
          window.location = 'expedientePsicologico';
          </script>";  
          exit;
        }else{  
          echo "<script> 
          alert('Ocurrio algun error,comuniquese con el administrador');
          window.location = 'procesoconsultapsicologia';
          </script>";  
          exit;  
        }
    }catch(PDOException $e){
      $conn->rollback();
      echo $e->getMessage(); 
      return false;
    } // fin catch 
  }/// fin if segundo
 }// fin  if primero

  
?>

