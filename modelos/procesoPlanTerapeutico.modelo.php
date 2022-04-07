<?php
 include_once 'conexion3.php';
 include_once 'conexion.php';
 include_once 'conexion2.php';
 include_once  "conexionpdo.php";
 
?>

<?php
    if(isset($_POST['codigo_consulta_paciente'])){
        
            
            $codigo_persona = ($_POST['codigo_consulta_paciente']);
            $actividad = ($_POST['actividad']);
            $tecnica = ($_POST['tecnica']);
            $materiales = ($_POST['materiales']);
            $tareas = ($_POST['tareas']);
            $resultados = ($_POST['resultados']);
         
            $consulta_expediente = $db->prepare("SELECT CODIGO_PERSONA FROM TBL_PLAN_TERAPEUTICO WHERE CODIGO_PERSONA = (?);");
            $consulta_expediente->execute(array($codigo_persona));
            $row=$consulta_expediente->fetchColumn();
          
        if($row>0){
            echo "<script>
                alert('Expediente ya se encuentra registrado');
                window.location = 'procesoPlanTerapeutico'
             </script>";

        }else{ 
            


            $insertar_expediente ="INSERT INTO TBL_PLAN_TERAPEUTICO (CODIGO_PERSONA, ACTIVIDAD , TECNICA , MATERIALES, TAREAS, RESULTADOS) 
                                                                VALUES ('$codigo_persona', '$actividad','$tecnica', '$materiales','$resultados')";
            $consulta=$conn->query($insertar_expediente);
            $codigo= mysqli_insert_id($conn);

            
    
                        echo "<script>
                        window.location = 'procesoPlanTerapeutico'
                     </script>";

        }

            

    }


?>
