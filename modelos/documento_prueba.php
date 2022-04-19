<?php

$sentencia = $db->prepare("SELECT tic.FECHA_CITA,tic.HORARIO,tic.CODIGO_PERSONA_PACIENTE 
         from tbl_inscripcion_cita tic  where tic.CODIGO_PERSONA_PACIENTE  = ?");
         $sentencia ->execute(array($paciente));
         $ESPECIALISTAS = $sentencia->fetchALL();
          foreach ( $ESPECIALISTAS AS $RESULTADOS){
             $B_FECHA_CITA = $RESULTADOS['FECHA_CITA'];
             $B_HORA_CITA = $RESULTADOS['HORARIO'];
             $B_COD_PACIENTE = $RESULTADOS['CODIGO_PERSONA_PACIENTE'];
             if ( $fecha == $B_FECHA_CITA){
              echo "<script>
                alert('El ya tiene una cita registrada  a esa fecha ');
               window.location = 'procesocita';
                </script>";
                exit;
                
              } 
        
         
        
        }///  fin foreach



        echo '<pre>';
        echo $ESPECIALISTAS ;
        echo $consulta ;
        echo '</pre>';
        var_dump($ESPECIALISTAS);
        var_dump($hora);
        var_dump($especialista);
        var_dump($consulta);
        return;       
        // $sentencia = $db->prepare("SELECT tic.HORARIO,tic.FECHA_CITA,tic.CODIGO_PERSONA_PACIENTE 
        //from tbl_inscripcion_cita tic  where tic.CODIGO_ESPECIALISTA  =?");
        //$sentencia->execute(array($especialista));
        // $row=$sentencia->fetchColumn();
        //$ESPECIALISTAS = $row;   
        
        

        $sentencia = $db->prepare("SELECT tic.CODIGO_PERSONA , tic.CODIGO_ESPECIALISTA
        from tbl_inscripcion_cita tic  where tic.CODIGO_CITA = ?");
       $sentencia ->execute(array($cod));
       $ESPECIALISTAS = $sentencia->fetchALL();
        foreach ( $ESPECIALISTAS AS $RESULTADOS){
           $B_personas = $RESULTADOS['CODIGO_PERSONA'];
           $B_especialistas = $RESULTADOS['CODIGO_ESPECIALISTA'];
          try{
            
 
 
 
          }catch(PDOException $e){
           echo $e->getMessage(); 
         return false;
               }       
      }///  fin foreach



      try{
        $consulta_estudiante = $db->prepare("SELECT tic.CODIGO_ESPECIALISTA  , tic.HORARIO , tic.FECHA_CITA ,tic.CODIGO_ESTADO
          from tbl_inscripcion_cita tic where tic.CODIGO_CITA =? and tic.HORARIO= ? and tic.FECHA_CITA = ? and tic.CODIGO_ESTADO=? ;");
          $consulta_estudiante->execute(array( $cod,$hora, $fecha,$estado));
          $row=$consulta_estudiante->fetchColumn();
        if ($row == 0){
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
          }else{ 
           echo "<script>
           alert('Error al actualizar el registro');
           window.location = 'crudicitasgenerales';
           </script>";
         }
       }else{  
         echo "<script>
           alert('Error al debe buscar otra hora o fecha');
           window.location = 'crudicitasgenerales';
           </script>";
           exit;   
                }
      }  catch(PDOException $e){
            echo $e->getMessage(); 
          return false;
            }  



        ?>