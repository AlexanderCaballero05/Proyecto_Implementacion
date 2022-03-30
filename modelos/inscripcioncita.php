<?php
 session_start();
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  include_once 'function_bitacora.php';
?>
<?php


if(isset($_POST['GUARDARCITA'])){
  if(isset($_POST['CODPACIENTE'])){
         $paciente=($_POST['CODPACIENTE']);
         $fecha=($_POST['agregar_fecha_cita']);
         $hora=($_POST['agregar_hora']);
         $especialista=($_POST['agregar_especialista']);
         $user= $_SESSION['vario'];
         $fechaactual = date("Y-m-d");

         $sentencia = $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_PERSONA
         from tbl_inscripcion_cita   where  CODIGO_PERSONA  = (?) and HORARIO = (?)  and FECHA_CITA = (?)");
         $sentencia->execute(array($paciente,$hora,$fecha));
          $row=$sentencia->fetchColumn();
          if($row >0){ 
            echo "<script> 
            alert('No se puede porque tiene otra cita en la misma fecha y misma hora');
            window.location = 'procesocita';
            </script>";
            exit;
          }else{
            $consulta2 = $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_ESPECIALISTA
           from tbl_inscripcion_cita   where  CODIGO_ESPECIALISTA  = (?) and HORARIO = (?)  and FECHA_CITA = (?)");
           $consulta2->execute(array($especialista,$hora,$fecha));
           $row2=$consulta2->fetchColumn();
           if( $row2 > 0){
            echo "<script> 
            alert('Especialista ya tiene asignada una cita en esa fecha y hora');
            window.location = 'procesocita';
            </script>";
            exit;
           }else{
             try {
            $sql ="call sp_insert_inscripcion_cita('$paciente','$especialista','$fecha','$hora','$fechaactual','$user');";
            $consulta=$conn->query($sql);

            if($consulta >0){ 
              echo "<script> 
              alert('Cita registrada exitosamente');
              window.location = 'procesocita';
              </script>";
              $codigoObjeto=32;
              $accion='Registro';
              $descripcion='Se vizualiza citas registradas';
              bitacora($codigoObjeto,$accion,$descripcion);
              exit;
            }else{
              echo "<script> 
              alert('Ocurrio algun error,comunicarse con el administrador Arnold');
              window.location = 'procesocita';
              </script>";
              exit;
            }
        }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
        } 
           }
      }
  }// if hijo 
}// if padre


  //con lo de ditar no toque,porque ya les daba y no tengo el procediemiento :v ,ya eso ustedes lo terminan 
 ///BOTON DE EDITAR 
if (isset($_POST['cod_edit_cita'])){
  if(isset($_POST['edit_cita'])){
    $cod_cita = $_POST['cod_edit_cita'];
    $fecha_cita = $_POST['edit_fecha_cita'];
    $hora_cita = $_POST['edit_hora'];
    $user=$_SESSION['vario'];
    $fechaactual = strtotime(date("Y-m-d")); 
       try {
        $consulta_estudiante = $db->prepare("SELECT tic.CODIGO_ESPECIALISTA  , tic.HORARIO , tic.FECHA_CITA  
        from tbl_inscripcion_cita tic where tic.CODIGO_CITA =  ? and tic.HORARIO= ? and tic.FECHA_CITA = ? ;");
        $consulta_estudiante->execute(array( $cod_cita,$hora_cita, $fecha_cita));
        $row=$consulta_estudiante->fetchColumn();
  
         if ($row == 0){
           $sql = "CALL  	sp_actualizar_inscripcion_cita
           ('$fecha_cita','$hora_cita','$user','$cod_cita','$fechaactual');" ;
           $consulta=$conn->query($sql);
           if ($consulta > 0){
            echo "<script>
            alert('Actualización Exitosa');
               window.location = 'crudinscripcioncita';
                </script>";
              $codigoObjeto=32;
              $accion='Actualizacion';
              $descripcion='Se vizualiza citas registradas';
              bitacora($codigoObjeto,$accion,$descripcion);
           }else{ 
            echo "<script>
            alert('Error al actualizar el registro');
            window.location = 'crudinscripcioncita';
            </script>";
          }
        }else{  
          echo "<script>
            alert('Error al debe buscar otra hora o fecha');
            window.location = 'crudinscripcioncita';
            </script>";
            exit;   
                 }
  
        }catch(PDOException $e){
          echo $e->getMessage(); 
        return false;
          }
  
  }
  }
  
  
  
  
  //boton de eliminar
  if (isset ($_POST['eliminar_nue_cita'])){
  
   if (isset($_POST['eliminar_cita'])){
  
       $cod = $_POST['eliminar_nue_cita'];
       try {
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE from tbl_inscripcion_cita  where CODIGO_CITA = '$cod' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            alert('¡Cita eliminada!');
            window.location = 'crudinscripcioncita';
            </script>";
            $codigoObjeto=32;// cambiar 
            $accion='ELIMINACION';
            $descripcion= 'Se elimino una CITA ';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
              echo "<script>
              alert('¡Error al eliminar la cita tiene relacion con otras tablas !');
              window.location = 'crudinscripcioncita';
              </script>";
              exit;
            }
  
          }catch(PDOException $e){
          echo $e->getMessage(); 
        return false;
          }
        }
      }      
   
?>
<!-- modificado por Gissela y Any :( -->
