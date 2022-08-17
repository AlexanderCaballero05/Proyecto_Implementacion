<?php

//con lo de ditar no toque,porque ya les daba y no tengo el procediemiento :v ,ya eso ustedes lo terminan 
 ///BOTON DE EDITAR 
 if (isset($_POST['cod_edit_cita'])){
  if(isset($_POST['edit_citaGenerales'])){
    $fecha= $_POST['edit_fecha_cita'];
    $hora =$_POST['edit_hora'];
    $estado =$_POST['estado_edit'];
    $cod =$_POST['cod_edit_cita'];
    $ENCARGADO= $_POST['encargadocitados'];
    $paciente1= $_POST['paciente_editar'];
    try{
       $sentencia_especialista = $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_PERSONA
       from tbl_inscripcion_cita   where CODIGO_PERSONA  = (?) AND HORARIO = (?)  and FECHA_CITA = (?) and CODIGO_ESTADO = (?)
       and CODIGO_CITA <> (?) ");//El <> es el que hace la magia :v
       $sentencia_especialista->execute(array($paciente1,$hora,$fecha,$estado,$cod));
       $row=$sentencia_especialista->fetchColumn();
      if($row >0){
        // verifica que si el especialista nuevo que seleccionó no tiene algun compromiso en la misma fecha
        echo "<script>
        alert('No se puede porque tiene otra cita en la misma fecha y misma hora');
        window.location = 'crudcitasgenerales';
        </script>";
        exit;
      }else{
       $sentencia_paciente= $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_ESPECIALISTA , CODIGO_ESTADO, CODIGO_CITA
       from tbl_inscripcion_cita   where CODIGO_ESPECIALISTA  = (?) and HORARIO = (?)  and FECHA_CITA = (?) and CODIGO_ESTADO = (?) 
        AND CODIGO_CITA <> (?) ");
       $sentencia_paciente->execute(array($ENCARGADO,$hora,$fecha,$estado,$cod));
       $row=$sentencia_paciente->fetchColumn();
       if($row > 0){
        echo "<script> 
        alert('El  Especialista  ya tiene asignada una cita en esa fecha y hora');
        window.location = 'crudcitasgenerales';
        </script>";
         exit; 
       }else{
        $sql ="UPDATE  tbl_inscripcion_cita SET  HORARIO ='$hora', FECHA_CITA='$fecha', CODIGO_ESTADO ='$estado', CODIGO_ESPECIALISTA ='$ENCARGADO' where CODIGO_CITA ='$cod' ;";
        $consulta=$conn->query($sql);
        if($consulta > 0){
          echo "<script>
          alert('Cita Actualizada');
          window.location = 'crudcitasgenerales';
          </script>";
          // $codigoObjeto=32;
          // $accion='MODIFICACIÓN';
          // $descripcion='SE MODIFICÓ UNA CITA';
          // bitacora($codigoObjeto,$accion,$descripcion);
        }else{
          echo "<script>
          alert('Ocurrio un error');
          window.location = 'crudcitasgenerales';
          </script>";
        }//Fin validaciones 
       }
      }//Fin primer else
    }catch(PDOException $e){
    echo $e->getMessage(); 
    return false;
   }
  }
}

  if (isset($_POST['cod_enviar_cita1'])){
    if(isset($_POST['enviar_cita1'])){
        $codigo_cita = ($_POST['cod_enviar_cita1']);
        $estado_cita = ($_POST['estado_cita1']);

        $enviar_cita = "UPDATE tbl_inscripcion_cita
                         SET CODIGO_ESTADO = '9'
                         WHERE CODIGO_CITA = '$codigo_cita'";

        $consulta_cita =$conn->query($enviar_cita);

    }
  }
  
  ?>
