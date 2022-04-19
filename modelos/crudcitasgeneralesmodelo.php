<?php

//con lo de ditar no toque,porque ya les daba y no tengo el procediemiento :v ,ya eso ustedes lo terminan 
 ///BOTON DE EDITAR 
if (isset($_POST['cod_edit_cita2'])){
  if(isset($_POST['edit_cita1'])){
    $fecha= $_POST['edit_fecha_cita1'];
    $hora =$_POST['edit_hora1'];
    $estado =$_POST['estado_edit1'];
    $cod =$_POST['cod_edit_cita2'];
     try {
      $sentencia = $db->prepare("SELECT tic.CODIGO_PERSONA , tic.CODIGO_ESPECIALISTA
        from tbl_inscripcion_cita tic  where tic.CODIGO_CITA = ?");
       $sentencia ->execute(array($cod));
       $ESPECIALISTAS = $sentencia->fetchALL();
        foreach ( $ESPECIALISTAS AS $RESULTADOS){
           $personas = $RESULTADOS['CODIGO_PERSONA'];
           $especialistas = $RESULTADOS['CODIGO_ESPECIALISTA'];
        
         $sentencia_paciente= $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_PERSONA
         from tbl_inscripcion_cita   where  CODIGO_PERSONA  = (?) and HORARIO = (?)  and FECHA_CITA = (?) and CODIGO_ESTADO = 5 ");
         $sentencia_paciente->execute(array($personas,$hora,$fecha));
          $row=$sentencia_paciente->fetchColumn();
          if($row >0){
            echo "<script>
                alert('El ya tiene una cita registrada  a esa fecha ');
               window.location = 'crudcitasgenerales';
                </script>";
                exit;
          }else {
            $sentencia_especialista = $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_PERSONA
          from tbl_inscripcion_cita   where  CODIGO_PERSONA  = (?) and HORARIO = (?)  and FECHA_CITA = (?) and CODIGO_ESTADO = 5  ");
          $sentencia_especialista->execute(array($especialistas,$hora,$fecha));
           $row=$sentencia_especialista->fetchColumn();
           if($row >0){
             echo "<script>
                 alert('El ya tiene una cita registrada a esa fecha ');
                window.location = 'crudcitasgenerales';
                 </script>";
                 exit;
           } else {
            $sql ="UPDATE  tbl_inscripcion_cita SET  HORARIO ='$hora', FECHA_CITA='$fecha', CODIGO_ESTADO ='$estado' where CODIGO_CITA ='$cod' ;";
            $consulta=$conn->query($sql);
            if ($consulta > 0){
             echo "<script>
                window.location = 'crudicitasgenerales';
                 </script>";
               $codigoObjeto=32;
               $accion='Actualizacion';
               $descripcion='Se vizualiza citas registradas';
               bitacora($codigoObjeto,$accion,$descripcion);
               
               }
          }

          } // fin else 
      }///  fin foreach
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
