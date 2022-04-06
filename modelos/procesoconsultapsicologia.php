<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>
<?php
//agregar  
 if (isset ($_POST['sintomas3'] )){
  session_start();
  $usuario= $_SESSION['vario'];
  $fechaActual= date('Y-m-d');
 if ( isset ($_POST['Guardar_Consulta3'])){   
  try {
   $observaciones= ($_POST['observaciones3']);
    $Egreso= ($_POST['Egreso3']);
    $Ingreso= ($_POST['Ingreso3']);
    $sintomas= ($_POST['sintomas3']);
    $codigocita2= ($_POST['codigocita3']); 
    $estado=8 ;

       $insert= "INSERT into tbl_expediente_psicologico_consulta (CODIGO_CITA, SINTOMAS,DIAGNOSTICO_INGRESO,
       DIAGNOSTICO_EGRESO,OBSEVARCIONES,CREADO_POR,FECHA_CREACION) values ('$codigocita2','$sintomas','$Ingreso','$Egreso',
       '$observaciones','$usuario','$fechaActual')";
        $consulta=$conn->query($insert);
        $update = "UPDATE tbl_inscripcion_cita set CODIGO_ESTADO = '$estado'  where CODIGO_CITA = '$codigo_cita2'";
        $consult=$conn->query($update);

        if ($consulta >0 && $consult >0 ){
        echo "<script> 
        alert('Consulta Médica registrada exitosamente!');
        window.location = 'procesoconsulta';
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

