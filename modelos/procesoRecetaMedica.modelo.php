<!-- 
-----------------------------------------------------------------------
        Universidad Nacional Autonoma de Honduras (UNAH)
	            	Facultad de Ciencias Economicas
          Departamento de Informatica administrativa
         Analisis, Programacion y Evaluacion de Sistemas
                   Segundo Periodo 2022

  Equipo:
  Arnold Alexander Caballero Garcia (aacaballero@unah.hn)
  Luz Maria Montoya Medina (luz.montoya@unah.hn)
  Diana Rut Garcia Amador (drgarciaa@unah.hn)
  Any Melissa Hernandez (anyhernandez@unah.hn)
  Gissela Yamileth Diaz (gdiaza@unah.hn)
  Cesar Fernando Rovelo (Cesar.rovelo@unah.hn)

  Catedratico:
  Lic. Claudia Nuñez (Analisis)
  Lic. Giancarlo Martini Scalici Aguilar (Implementación)
  Lic. Karla Melisa Garcia Pineda (Evaluación)
---------------------------------------------------------------------
    Programa:          Proceso receta medica
    Fecha:             09-Junio-2022
    Programador:       Diana Rut Garcia 
    descripcion:       Permite llevar un mantenimiento de las alergias del area media ,editar,eliminar nuevo
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador               Fecha                      Descripcion
D'aniel Martinez        8-01-2022                        verificar las validaciones
D'aniel Martinez        8-01-2022                        no permititr valores repetidos al agregar medicamento y examenes
D'aniel Martinez        8-01-2022                        poder eliminar y editar exámenes y medicamentos
Diana Rut               02-08-2022                       Cambio en la consulta de si se repite la receta medica
Diana Rut               03-08-2022                       Se agrego el codigo_estado a los insert de examenes y medicamentos
----------------------------------------------------------------------->
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
          $consultar=0;
          if($tipo_receta ==1){ //Para cuando es una receta de medicamentos
            $existe = $db->prepare("SELECT COUNT(*) FROM tbl_receta_medica WHERE CODIGO_MEDICAMENTO = (?)
            AND CODIGO_CONSULTA = (?)");
            $existe->execute(array($codigo_medicamento,$codigo_consulta));
            $row=$existe->fetchColumn();
            if($row>0){
              echo "<script> alert('El medicamento ya se receto');
              window.location = 'procesoRecetaMedica'; </script>";
            }else {
              try{
                $insertar_reseta = "INSERT INTO `tbl_receta_medica` (`CODIGO_CONSULTA`, `CODIGO_MEDICAMENTO`, `INDICACIONES_RECETA`, `OBSERVACIONES`, `FECHA_RECETA`, `CREADO_POR_USUARIO`, `FECHA_CREACION`)
                VALUES('$codigo_consulta', '$codigo_medicamento', '$indicaciones', '$observaciones', '$fecha_receta', 'ADMIN', '$fecha_receta')";
                $consulta_receta =$conn->query($insertar_reseta);
                if($consulta_receta>0){
                   echo "<script> window.location = 'procesoRecetaMedica';</script>"; exit;
                }else{
                   echo "<script> window.location = 'procesoRecetaMedica'; </script>"; exit;
                }//fin del else si ocurrio algun error :/
              }catch(PDOException $e){
              echo $e->getMessage(); 
              return false;
              }
            }
             
          }else if($tipo_receta ==2){//Para cuando son examenenes medicos
             
            $existe2 = $db->prepare("SELECT COUNT(*) FROM tbl_examenes_pacientes WHERE CODIGO_EXAMEN_MEDICO = (?)
            AND CODIGO_CONSULTA= (?)");
            $existe2->execute(array($codigo_examen,$codigo_consulta));
            $row=$existe2->fetchColumn();
            if($row>0){
              echo "<script> alert('El examen ya se receto');
              window.location = 'procesoRecetaMedica'; </script>";
            }else {
              try{
            $insertar_examen = "INSERT INTO `tbl_examenes_pacientes`(`CODIGO_CONSULTA`, `CODIGO_EXAMEN_MEDICO`, `OBSERVACIONES`, `INDICACIONES`)
             VALUES('$codigo_consulta', '$codigo_examen', '$observaciones','$indicaciones')";
             $consulta_examen =$conn->query($insertar_examen);
             if($consulta_receta>0){
                echo "<script> window.location = 'procesoRecetaMedica'; </script>"; exit;
             }else{
                echo "<script> 
                  
                window.location = 'procesoRecetaMedica'; </script>"; exit;
             }
                
              }catch(PDOException $e){
              echo $e->getMessage(); 
              return false;
              }
            }
             
             
             
          }//fin del elseif de insertar examenes medicoa
       }  
   }//fin del if de insertar las recetas/examenes 

   //Cuando ya de plano termino de recetar los examenes y recetas :)
   if(isset($_POST['finalizar_consulta'])){
        $codigo_consulta = ($_POST['consultita']);
        $existe = $db->prepare("SELECT COUNT(CODIGO_MEDICAMENTO) FROM tbl_receta_medica WHERE CODIGO_CONSULTA = (?)");
        $existe->execute(array($codigo_consulta));
        $row=$existe->fetchColumn();

        $existe2 = $db->prepare("SELECT COUNT(CODIGO_EXAMEN) FROM tbl_examenes_pacientes WHERE CODIGO_CONSULTA= (?)");
            $existe2->execute(array($codigo_consulta));
            $row2=$existe2->fetchColumn();
        if($row<=0 AND $row2<=0){
          echo "<script> alert('No tiene agregado ningun Medicamento o Exámen Médico ');
          window.location = 'procesoRecetaMedica'; </script>";
          exit;
        }else{
          $codigo_cita = ($_POST['codigo_finalizar']);
          $cambiar_estado = "UPDATE tbl_inscripcion_cita
          SET CODIGO_ESTADO = '12'
          WHERE CODIGO_CITA = ' $codigo_cita'";
          $consulta_estado =$conn->query($cambiar_estado);
          echo "<script> window.location = 'expedienteMedico'; </script>"; exit;
        }
      
   }
?>
<?php
?>


<?php
//CODIGO PARA AGREGAR UN EXAMEN  NUEVO DENTRO DE LA PANTALLA RECETAS MEDICAS 
 if(isset($_POST['nombre_examen'])){
   if(isset($_POST['agregar_examen_medico'])){
    $nombre_examen1 = ($_POST['nombre_examen']);
    $descripcion_examen = ($_POST['descripcion_examen']);
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
        $insertar_examen = "INSERT INTO tbl_examenes_medicos(EXAMEN_MEDICO,DESCRIPCION,FECHA_CREACION,CREADO_POR_USUARIO,CODIGO_ESTADO) VALUES ('$nombre_examen1','$descripcion_examen','$fechaActual','$usuario','2'); ";
        $consulta=$conn->query($insertar_examen);
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
               $query_medicamento = "INSERT INTO tbl_medicamento (CODIGO_MEDICAMENTO,NOMBRE_MEDICAMENTO,DESCRIPCION,CREADO_POR_USUARIO,FECHA_CREACION,CODIGO_ESTADO)
               VALUES ('$codigo','$medicamento','$descripcion','$usuario','$fechaActual','2');";
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


///// editar examenes receta medica ////
if (isset( $_POST['cod_edit_examenes']) && isset($_POST['guardar_examenes'])){
   $codigo = $_POST['cod_edit_examenes'];
   $nomExam = $_POST['nom_exam'];
   $indicacion = $_POST['edit_indicacion'];
   $observacion = ($_POST['edit_obs']); 
     
         try{
            $sql = "UPDATE tbl_examenes_pacientes EP set EP.INDICACIONES='$indicacion', EP.OBSERVACIONES='$observacion'
            where EP.CODIGO_EXAMEN_PACIENTE  = '$codigo' ";
            $consulta=$conn->query($sql);
           if ($consulta>0){
             echo "<script>
             window.location = 'procesoRecetaMedica';
             </script>";
            
             exit;
           }else{
             echo "<script>
             alert('¡Error al  intentar modificar el medicamento!');
             window.location = 'procesoRecetaMedica';
             </script>";
           }
         }catch(PDOException $e){
           echo $e->getMessage(); 
           return false;
         }

       
  }//FIN DEL CODIGO PARA EDITAR

//// eliminar examen  /////


?>

<?php
if(isset($_POST['eliminar_ex'])){
  if(isset($_POST['eliminar_exm'])){
    $codExm = ($_POST['eliminar_ex']);//asigna a una variable el id de la pregunta a  eliminar
    
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_examenes_pacientes WHERE  CODIGO_EXAMEN_PACIENTE = '$codExm' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            window.location = 'procesoRecetaMedica';
            </script>";
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar el Exámen!');
            window.location = 'procesoRecetaMedica';
            </script>";
            exit;
          }
        }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
      }
    
}//Cerre del if padre
?>


<?php
///// ------------------------------------------medicamento---------------------------------------   ////

///// editar medicamento receta medica   ////
if (isset( $_POST['cod_edit_Medicamento']) && isset($_POST['guardar_Medicamento'])){
   $codigo = $_POST['cod_edit_Medicamento'];
   $indicacion = $_POST['edit_indicacion_Medic'];
   $observacion = ($_POST['edit_obs_Medic']); 
     
         try{
            $sql = "UPDATE tbl_receta_medica RM set RM.INDICACIONES_RECETA='$indicacion', RM.OBSERVACIONES='$observacion'
            where RM.CODIGO_RECETA_MEDICA  = '$codigo' ";
            $consulta=$conn->query($sql);
           if ($consulta>0){
             echo "<script>
             window.location = 'procesoRecetaMedica';
             </script>";
            
             exit;
           }else{
             echo "<script>
             alert('¡Error al  intentar modificar el medicamento!');
             window.location = 'procesoRecetaMedica';
             </script>";
           }
         }catch(PDOException $e){
           echo $e->getMessage(); 
           return false;
         }

       
  }//FIN DEL CODIGO PARA EDITAR

//// eliminar examen  /////


?>

<?php
if(isset($_POST['eliminar_Medic'])){
  if(isset($_POST['eliminar_Medicamento'])){
    $codMedic = ($_POST['eliminar_Medic']);//asigna a una variable el id de la pregunta a  eliminar
    
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_receta_medica WHERE  CODIGO_RECETA_MEDICA = '$codMedic' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            window.location = 'procesoRecetaMedica';
            </script>";
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar el Medicamento!');
            window.location = 'procesoRecetaMedica';
            </script>";
            exit;
          }
        }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
      }
    
}//Cerre del if padre
?>




















