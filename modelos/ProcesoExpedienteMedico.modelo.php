<?php
 include_once 'conexion3.php';
 include_once 'conexion.php';
 include_once 'conexion2.php';
 include_once  "conexionpdo.php";
 
?>

<?php
    if(isset($_POST['codigo_paciente_expediente'])){
        
            $codigo_expediente_paciente = ($_POST['codigo_paciente_expediente']);
            $tipo_sangre = ($_POST['tipo_sangre']);
            $tratamientos = ($_POST['tratamientos']);
            $enfermedades = ($_POST['enfermedades']);
         
              

            $insertar_expediente ="INSERT INTO tbl_expediente_medico (CODIGO_PERSONA, CODIGO_TIPO_SANGRE, TRATAMIENTOS, ENFERMEDADES) 
                                                                VALUES ('$codigo_expediente_paciente', '$tipo_sangre','$tratamientos', '$enfermedades')";
            $consulta=$conn->query($insertar_expediente);
            $codigo= mysqli_insert_id($conn);

             //Para insertar alergias
                if (is_array($_POST['alergia'])) {
                    foreach ($_POST['alergia'] as $alergia){
                      $sentencia = $db->prepare("CALL Sp_insertar_alergias(?,?);");
                      // llamar al procedimiento almacenado
                      $sentencia->execute(array($codigo,$alergia));
                      $conn->commit();
                    }
                   
                        }//fin Para insertar alergias

                        //Para insertar transtornos
                        if(array($_POST['transtornos'])){
                            foreach($_POST['transtornos'] as $trastornos){
                                $query_transtornos = $db->prepare("CALL Sp_insertar_transtornos(?,?);");
                                $query_transtornos->execute(array($codigo,$trastornos));
                                $conn->commit();

                            }
                        } //Fin para insertar transtornos

                        //inicio de insertar apariencias
                                if(array($_POST['apariencia'])){
                                    foreach($_POST['apariencia'] as $apariencias){
                                        $query_apariencia = $db->prepare("CALL Sp_insertar_apariencias(?,?);");
                                        $query_apariencia->execute(array($codigo, $apariencias));
                                        $conn->commit();


                                    }  
                                    
                        
                                     echo "<script> 
                                  window.location = 'procesoPreClinica';
                                  </script>";
                                } // fin para apariencias
            
                               
     

        

            

    }


?>


<?php
//CODIGO PARA ACTUALIZAR EL ESTADO DE INCRIPCION CITA A FINALIZADO  :)
if(isset($_POST['EXPEDIENTE_CITA'])){
    if(isset($_POST['FINALIZAR_EXPEDIENTE'])){
        $codigo = ($_POST['EXPEDIENTE_CITA']);
        $estado = "13";
        $update = "UPDATE tbl_inscripcion_cita set CODIGO_ESTADO = '$estado'  where CODIGO_CITA = '$codigo'";
        $consulTITA=$conn->query($update);
        if ($consulTITA >0 ){
            echo "<script> 
            window.location = 'ProcesoCitasMedicos';
            </script>";  
            exit;
        }else{
            echo "<script> 
            alert('Ocurrio algun error,comuniquese con el admin :)');
            window.location = 'ProcesoCitasMedicos';
            </script>";  
            exit;
        }
    }
}
?>