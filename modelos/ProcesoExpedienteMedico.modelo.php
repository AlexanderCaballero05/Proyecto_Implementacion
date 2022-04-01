<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include_once  "conexionpdo.php";
?>


<?php
    if(isset($_POST['codigo_paciente_expediente'])){
        
            $codigo_expediente_paciente = ($_POST['codigo_paciente_expediente']);
            $tipo_sangre = ($_POST['tipo_sangre']);
            $tratamientos = ($_POST['tratamientos']);
            $enfermedades = ($_POST['enfermedades']);
           // $alergias = ($_POST['alergia[]']);
            //$transtornos = ($_POST['antecedentes[]']);
            //$apariencia_fisica ($_POST['apariencia[]']);


            $insertar_expediente ="INSERT INTO tbl_expediente_medico (CODIGO_CITA_PERSONA, CODIGO_TIPO_SANGRE, TRATAMIENTOS, ENFERMEDADES) 
                                                                VALUES ('$codigo_expediente_paciente', '$tipo_sangre','$tratamientos', '$enfermedades')";
            $consulta=$conn->query($insertar_expediente);

            if ($consulta>0){
               echo "<script>
                        alert('Datos preClinica guardados');
                        window.location = 'procesoExpedienteMedico';
                        </script>";
                        exit;



                            //Para insertar alergias
                if (is_array($_POST['alergia'])) {
                    foreach ($_POST['alergia'] as $alergia){
                      $sentencia = $db->prepare("CALL Sp_insertar_alergias(?,?);");
                      // llamar al procedimiento almacenado
                      $sentencia->execute(array($codigo_expediente_paciente,$alergia));
                    }
                    echo "<script>
                        alert('Datos preClinica guardados');
                        window.location = 'procesoExpedienteMedico';
                        </script>";
                        exit;
                        }else{
                        echo "<script>
                        alert('ERRROR');
                        window.location = 'procesoExpedienteMedico';
                        </script>";
                        exit;
        
    
                }//fin de insertar alergias

     
            }else{
                echo "<script>
                alert('ERRROR');
                window.location = 'procesoExpedienteMedico';
                </script>";
                exit;



            }

    }


?>