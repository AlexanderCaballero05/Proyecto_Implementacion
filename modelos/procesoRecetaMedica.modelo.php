<?php
include_once "conexion.php";
include_once "conexion3.php";
include_once 'conexionpdo.php';
include "conexionpdo.php";
?>
<?php
//se modifico esta parte para poder agregar los examenes medicos  :) por Rut
  if(isset($_POST['receta_medica'])){
       if(isset($_POST['codigo_consulta'])){
          $codigo_consulta = ($_POST['codigo_consulta']);
          $fecha_receta = ($_POST['fecha_receta']);
          $codigo_medicamento = ($_POST['codigo_medicamento']);
          $indicaciones =  ($_POST['indicaciones']);
          $observaciones =  ($_POST['observaciones']);
          $tipo_receta = ($_POST['recetas']);
          $codigo_examen = ($_POST['codigo_examen']); 

          if($tipo_receta ==1){ //Para cuando es una receta de medicamentos
             $insertar_reseta = "INSERT INTO `tbl_receta_medica` (`CODIGO_CONSULTA`, `CODIGO_MEDICAMENTO`, `INDICACIONES_RECETA`, `OBSERVACIONES`, `FECHA_RECETA`, `CREADO_POR_USUARIO`, `FECHA_CREACION`)
             VALUES('$codigo_consulta', '$codigo_medicamento', '$indicaciones', '$observaciones', '$fecha_receta', 'ADMIN', '$fecha_receta')";
             $consulta_receta =$conn->query($insertar_reseta);
             if($consulta_receta>0){
                echo "<script> window.location = 'procesoRecetaMedica';</script>"; exit;
             }else{
                echo "<script> window.location = 'procesoRecetaMedica'; </script>"; exit;
             }//fin del else si ocurrio algun error :/
          }else if($tipo_receta ==2){//Para cuando son examenenes medicos
             $insertar_examen = "INSERT INTO `tbl_examenes_pacientes`(`CODIGO_CONSULTA`, `CODIGO_EXAMEN_MEDICO`, `OBSERVACIONES`, `INDICACIONES`)
             VALUES('$codigo_consulta', '$codigo_examen', '$observaciones','$indicaciones')";
             $consulta_examen =$conn->query($insertar_examen);
             if($consulta_receta>0){
                echo "<script> window.location = 'procesoRecetaMedica'; </script>"; exit;
             }else{
                echo "<script> 
                window.location = 'procesoRecetaMedica'; </script>"; exit;
             }
          }//fin del elseif de insertar examenes medicoa
       }  
   }//fin del if de insertar las recetas/examenes 

   //Cuando ya de plano termino de recetar los examenes y recetas :)
   if(isset($_POST['finalizar_consulta'])){
        $codigo_cita = ($_POST['codigo_finalizar']);
        $cambiar_estado = "UPDATE tbl_inscripcion_cita
        SET CODIGO_ESTADO = '12'
        WHERE CODIGO_CITA = ' $codigo_cita'";
        $consulta_estado =$conn->query($cambiar_estado);
        echo "<script> window.location = 'expedienteMedico'; </script>"; exit;
    }
?>
<?php
?>


<?php
//CODIGO PARA AGREGAR UN EXAMEN  NUEVO DENTRO DE LA PANTALLA RECETAS MEDICAS 
 if(isset($_POST['nombre_examen'])){
   if(isset($_POST['agregar_examen_medico'])){
    $nombre_examen1 = ($_POST['nombre_examen']);
    $descripcion = ($_POST['descripcion_examen']);
    $fechaActual = date('Y-m-d');
    $usuario = $_SESSION['vario'];

    $existe = $db->prepare("SELECT COUNT(*) FROM tbl_examenes_medicos WHERE EXAMEN_MEDICO = (?);");
    $existe->execute(array($nombre_examen1));
    $row=$existe->fetchColumn();
    if($row>0){
      echo "<script> alert('el examen  $nombre_examen ya se encuentra registrado');
      window.location = 'procesoRecetaMedica'; </script>";
    }else{
        try{
        $insertar_examen = " INSERT INTO tbl_examenes_medicos(EXAMEN_MEDICO,DESCRIPCION,FECHA_CREACION,CREADO_POR_USUARIO) VALUES ('$nombre_examen1','$descripcion_examen','$fechaActual','$usuario'); ";
        $resul=$conn->query($insertar_examen);
          if($consulta>0){
            echo "<script>
            alert('Examen Registrado Correctamente');
            window.location = 'procesoRecetaMedica'; </script>"; exit;
          }else{
           echo "<script>
            alert('Ocurrio algun error');
            window.location = 'procesoRecetaMedica'; </script>"; exit;
           }
        }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
        }
    }//fin else
   }    
 }

//CODIGO PARA AGREGAR UN MEDICAMENTO NUEVO DENTRO DE LA PANTALLA RECETAS MEDICAS 
 if (isset($_POST['AGREGAR_MEDICAMENTO']) && isset($_POST['agregar_medicamento'])){
        $medicamento = $_POST['agregar_medicamento'];
        $codigo = $_POST['agregar_cod_medi'];
        $descripcion = $_POST['agregar_med_desc'];
        $fechaActual = date('Y-m-d');
        $usuario =$_SESSION['vario'];
         //consulta para validar que no se repita el mismo codigo en el medicamento  
          $consulta = $db->prepare("SELECT COUNT(*)  from tbl_medicamento tm  where tm.NOMBRE_MEDICAMENTO  =(?) || tm.CODIGO_MEDICAMENTO  =(?); ");
          $consulta->execute(array($medicamento,$codigo));
          $row=$consulta->fetchColumn();
          if($row>0){
            echo "<script> alert('El nombre o el código del medicamento  ya se encuentra registrado');window.location = 'procesoRecetaMedica';</script>";
            exit;
          }else{
           try{
               $query_medicamento = "INSERT INTO tbl_medicamento (CODIGO_MEDICAMENTO,NOMBRE_MEDICAMENTO,DESCRIPCION,CREADO_POR_USUARIO,FECHA_CREACION)
               VALUES ('$codigo','$medicamento','$descripcion','$usuario','$fechaActual');";
               $resul=$conn->query($query_medicamento);
               if($resul >0){
                  echo "<script>
                   alert('Medicamento Registrado Correctamente');
                   window.location='procesoRecetaMedica'; </script>"; exit; 
               }else{
                  echo "<script> 
                  alert('Ocurrio un error');
                  window.location ='procesoRecetaMedica'; </script>"; exit;
               }
             }catch(PDOException $e){
              echo $e->getMessage(); 
              return false;
            }
         }//fin else
 }
?>

















