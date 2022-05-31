<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  include_once  "conexionpdo.php";
  
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR UN estudiante
    if(isset($_POST['GUARDARPERSONA'])){
       try{
          if(isset($_POST['CODPERSONA'])){
            //Datos escolares
               $codigo_persona = ($_POST['CODPERSONA']);
               $grado = ($_POST['GRADO']);
               $repitente = ($_POST['REPITENTE']);
               $indice = ($_POST['INDICE']);
               $materias = ($_POST['MATERIAS']);
               $pasatiempos = ($_POST['PASATIEMPOS']);
               $distractores = ($_POST['DISTRACTORES']);
               $metas = ($_POST['METAS']);
                  
              try{ 
                  $consulta_estudiante = $db->prepare("SELECT CODIGO_PERSONA FROM tbl_estudiante WHERE CODIGO_PERSONA = (?);");
                  $consulta_estudiante->execute(array($codigo_persona));
                  $row=$consulta_estudiante->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('El nombre del estudiante ya se encuentra registrado');
                    window.location = 'procesoRegistrarEstudiante';
                    </script>";
                  exit;
                  }else{
                    try{
                      
                      $query_estudiante = "INSERT INTO tbl_estudiante(CODIGO_PERSONA, GRADO_ACTUAL, REPITENTE, INDICE_ACADEMICO, MATE_BAJO_RENDI, PASATIEMPOS, DISTRACTORES_ESCOLARES, METAS)
                       VALUES ('$codigo_persona','$grado','$repitente','$indice','$materias', '$pasatiempos', '$distractores', '$metas'); ";
                      $resul=$conn->query($query_estudiante);
                      $codigo = mysqli_insert_id($conn);

                      //inicio del insert de dispositivos
                      if(is_array($_POST['dispositivos'])){
                          foreach ($_POST['dispositivos'] as $dispositivos){
                            $query_contenido = $db->prepare("CALL Sp_insertar_socieconomico_dispositivos(?,?);");
                            $query_contenido->execute(array($dispositivos,$codigo));     
                           $conn->commit();
                          }
                      }  //fin del insert de dispositivos

                       //inicio del insert de servicios
                       if(is_array($_POST['servicios'])){
                          foreach($_POST['servicios'] as $servicios){
                            $sp_servicios = $db->prepare("CALL Sp_insertar_socieconomico_servicios(?,?);");
                            $sp_servicios->execute(array($servicios,$codigo));
                            $conn->commit();
                          }
                       } //fin del insert de servicios

                        //inicio del insert de proveedor
                       if(is_array($_POST['proveedor'])){
                         foreach($_POST['proveedor'] as $proveedor){
                         $sp_proveedor = $db->prepare("CALL Sp_insertar_socieconomico_proveedor(?,?);");
                         $sp_proveedor->execute(array($proveedor,$codigo));
                         $conn->commit();
                          }
                       } //fin del insert de servicios

                          //inicio del insert de basicos
                       if(is_array($_POST['basicos'])){
                         foreach($_POST['basicos'] as $basicos){
                         $sp_basicos = $db->prepare("CALL Sp_insertar_socieconomico_basicos(?,?);");
                         $sp_basicos->execute(array($basicos,$codigo));
                         $conn->commit();
                        }
                       } //fin del insert de servicios

                        if(is_array($_POST['sacramento'])) {//codigo para insertar los sacramentos
                          foreach ($_POST['sacramento'] as $sacramento){
                            $sentencia = $db->prepare(" CALL Sp_insertar_sacramentos(?,?);");
                            $sentencia->execute(array($sacramento,$codigo));
                            $conn->commit();
                          }
                        }//fin del insert de sacramentos estudiantes
                      echo "<script>
                      window.location = 'crudEstudiante';
                      </script>";
                      exit; 
                    
                      
                    }catch(PDOException $e){
                    echo $e->getMessage(); 
                    return false;
                    }
                  }//fin del else de si no existe el nombre del estudiante
              }catch(PDOException $e){
              echo $e->getMessage(); 
              return false;
              }
            }//fin del if de verificar si hay datos

       }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }//FIN DEL IF DE REGISTAR UN estudiante


  //PARTE PARA EDITAR DATOS ESCOLARES DE UN ESTUDIANTE
  if(isset($_POST['id_estudiante'])){
    if(isset($_POST['editar_estudiante'])){
      $codigo_estudiante = ($_POST['id_estudiante']);
      $editar_grado = ($_POST['editGRADOACTUAL']);
      $editar_pasatiempos = ($_POST['ediTPASATIEMPOS']);
      $editar_distractores = ($_POST['editDISTRACTORES']);
      $editar_metas = ($_POST['editMETAS']);
      
         
          try{
            $sql = "UPDATE tbl_estudiante SET GRADO_ACTUAL = '$editar_grado',
                                                PASATIEMPOS = '$editar_pasatiempos',
                                                DISTRACTORES_ESCOLARES = '$editar_distractores',
                                                METAS = '$editar_metas' 
                                                WHERE CODIGO_ESTUDIANTE = '$codigo_estudiante' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script>
              alert('¡Estudiante modificado exitosamente!');
              window.location = 'crudEstudiante';
              </script>";
              include_once 'function_bitacora.php';
              $codigoObjeto=1;
              $accion='Modificacion';
              $descripcion= 'Se edito un estudiante ';
              bitacora($codigoObjeto, $accion,$descripcion);
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar el estudiante!');
              window.location = 'crudEstudiante';
              </script>";
            }
          }catch(PDOException $e){
          echo $e->getMessage(); 
          return false;
          }//fin del try catch
     
    }
  }//cierre del if principal


//PARTE PARA ELIMINAR UN ESTUDIANTE
if(isset($_POST['estudiante_eliminar'])){
  if(isset($_POST['ELIMINAR_ESTUDIANTE'])){
    $code = ($_POST['estudiante_eliminar']);//asigna a una variable el id del estudiante a eliminar
    try{
      $relacion_tablas =  $db->prepare("SELECT u.CODIGO_TIPO_ROL, u.CODIGO_USUARIO  from  tbl_usuario  u ,tbl_roles r
      where r.CODIGO_TIPO_ROL  = u.CODIGO_TIPO_ROL  and r.CODIGO_TIPO_ROL  = (?);;");
      $relacion_tablas->execute(array($code));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar este estudiante,esta relacionado con otras tablas!');
        window.location = 'crudEstudiante';
        </script>";
        exit;
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_estudiante WHERE  CODIGO_ESTUDIANTE = '$code' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            alert('¡Estudiante eliminado!');
            window.location = 'estudiante';
            </script>";
            include_once 'function_bitacora.php';
            $codigoObjeto=1;
            $accion='Modificacion';
            $descripcion= 'Se elimino un estudiante ';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar el estudiante!');
            window.location = 'estudiante';
            </script>";
            exit;
          }
        }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
      }
    }catch(PDOException $e){
     echo $e->getMessage(); 
     return false;
    }
  }
}//Cerre del if padre


?>


<?php

  // PARTE PARA EDITAR DATOS SOCIECONOMICOS DE UN ESTUDIANTE
  if(isset($_POST['EDITDISPOSITIVOS'])){
  if(isset($_POST['id_estudiante_conte'])){
    if(isset($_POST['editar_contenidoSocio'])){
      $codigo_contenido = ($_POST['id_contenido']);
      $edit_dispositivos = ($_POST['EDITDISPOSITIVOS']);
      $codigo_estudiante_conte = ($_POST['id_estudiante_conte']);
     
        $editar_contenido = "UPDATE tbl_estudiante_socioeconomico
                               SET CODIGO_CONTENIDO_SOCIOECONOMICO = '$edit_dispositivos'
                            WHERE CODIGO_ESTUDIANTE = '$codigo_estudiante_conte'
                            AND CODIGO_CONTENIDO_SOCIOECONOMICO = '$codigo_contenido'
                            ";


        $result_consulta=$conn->query($editar_contenido);






        if($result_consulta>0){
          echo "<script>
          alert('¡contenido Estudiante modificado exitosamente!');
          window.location = 'crudContenidoEconoEstudiante';
          </script>";
        }else{

          echo "<script>
          alert('¡Error al  intentar modificar el estudiante!');
          window.location = 'crudContenidoEconoEstudiante';
          </script>";


        }


    }
  }
}elseif(isset($_POST['EDITSERVICIOS'])){
  if(isset($_POST['id_estudiante_conte'])){
    if(isset($_POST['editar_contenidoSocio'])){
      $codigo_contenido = ($_POST['id_contenido']);
      $edit_servicios = ($_POST['EDITSERVICIOS']);
      $codigo_estudiante_conte = ($_POST['id_estudiante_conte']);
     /* 
      $edit_proveedor = ($_POST['EDITPROVEEDOR']);
      $edit_basicos   = ($_POST['EDITBASICOS']);*/
     // $anterior = $_SESSION['codigo']; AND CODIGO_CONTENIDO_SOCIOECONOMICO = '$anterior';
        $editar_contenido = "UPDATE tbl_estudiante_socioeconomico
                               SET CODIGO_CONTENIDO_SOCIOECONOMICO = '$edit_servicios'
                            WHERE CODIGO_ESTUDIANTE = '$codigo_estudiante_conte'
                            AND CODIGO_CONTENIDO_SOCIOECONOMICO = '$codigo_contenido'
                            ";


        $result_consulta=$conn->query($editar_contenido);






        if($result_consulta>0){
          echo "<script>
          alert('¡contenido Estudiante modificado exitosamente!');
          window.location = 'crudContenidoEconoEstudiante';
          </script>";
        }else{

          echo "<script>
          alert('¡Error al  intentar modificar el estudiante!');
          window.location = 'crudContenidoEconoEstudiante';
          </script>";


        }


    }
  }



}elseif(isset($_POST['EDITPROVEEDOR'])){
  if(isset($_POST['id_estudiante_conte'])){
    if(isset($_POST['editar_contenidoSocio'])){
      $codigo_contenido = ($_POST['id_contenido']);
      $codigo_estudiante_conte = ($_POST['id_estudiante_conte']);
      $edit_proveedor = ($_POST['EDITPROVEEDOR']);
     /*  $edit_basicos   = ($_POST['EDITBASICOS']);*/
        $editar_contenido = "UPDATE tbl_estudiante_socioeconomico
                               SET CODIGO_CONTENIDO_SOCIOECONOMICO = '$edit_proveedor'
                            WHERE CODIGO_ESTUDIANTE = '$codigo_estudiante_conte'
                            AND CODIGO_CONTENIDO_SOCIOECONOMICO = '$codigo_contenido'
                            ";


        $result_consulta=$conn->query($editar_contenido);






        if($result_consulta>0){
          echo "<script>
          alert('¡contenido Estudiante modificado exitosamente!');
          window.location = 'crudContenidoEconoEstudiante';
          </script>";
        }else{

          echo "<script>
          alert('¡Error al  intentar modificar el estudiante!');
          window.location = 'crudContenidoEconoEstudiante';
          </script>";


        }


    }
  }




}elseif(isset($_POST['EDITBASICOS'])){
  if(isset($_POST['id_estudiante_conte'])){
    if(isset($_POST['editar_contenidoSocio'])){
      $codigo_contenido = ($_POST['id_contenido']);
      $codigo_estudiante_conte = ($_POST['id_estudiante_conte']);
       $edit_basicos   = ($_POST['EDITBASICOS']);

        $editar_contenido = "UPDATE tbl_estudiante_socioeconomico
                               SET CODIGO_CONTENIDO_SOCIOECONOMICO = '$edit_basicos'
                            WHERE CODIGO_ESTUDIANTE = '$codigo_estudiante_conte'
                            AND CODIGO_CONTENIDO_SOCIOECONOMICO = '$codigo_contenido'
                            ";


        $result_consulta=$conn->query($editar_contenido);






        if($result_consulta>0){
          echo "<script>
          alert('¡contenido Estudiante modificado exitosamente!');
          window.location = 'crudContenidoEconoEstudiante';
          </script>";
        }else{

          echo "<script>
          alert('¡Error al  intentar modificar el estudiante!');
          window.location = 'crudContenidoEconoEstudiante';
          </script>";


        }


    }
  }










}

?>