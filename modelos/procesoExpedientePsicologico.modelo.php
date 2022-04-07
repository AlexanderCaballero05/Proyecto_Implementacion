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
         


            $insertar_expediente ="INSERT INTO TBL_EXPEDIENTE_PSICOLOGICO_UNICO (CODIGO_PERSONA, ANTECEDENTES_FAMILIARES , ANTECEDENTES_PERSONALES , ANTECEDENTES_CLINICOS) 
                                                                VALUES ('$codigo_expediente_paciente', '$antecedentes_familiares','$antecedentes_personales', '$antecedentes_clinicos')";
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
            window.location = 'ProcesoCitasPsicologicas';
            </script>";  
            exit;
        }else{
            echo "<script> 
            window.location = 'ProcesoCitasPsicologicas';
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