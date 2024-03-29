<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR UN estudiante
    if(isset($_POST['editar_estudiante'])){
       try{
          if(isset($_POST['editar_estudiante'])){
               $codigo_persona = ($_POST['codigo_persona']);
               $codigo_contenido = ($_POST['contenido_socio']);

               $nombre_estudiante = ($_POST['nombre_estudiante']);
               $pasatiempos_estudiante = ($_POST['pasatiempos_estudiante']);
               $distractores_estudiante = ($_POST['distractores_estudiante']);
               $metas_estudiante = ($_POST['metas_estudiante']);
                  
              try{ 
                  $consulta_estudiante = $db->prepare("SELECT GRADO_ACTUAL FROM tbl_estudiante WHERE GRADO_ACTUAL = (?);");
                  $consulta_estudiante->execute(array($nombre_estudiante));
                  $row=$consulta_estudiante->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('El nombre del estudiante $nombre_estudiante ya se encuentra registrado');
                    window.location = 'estudiante';
                    </script>";
                  exit;
                  }else{
                    try{
                      
                      $query_estudiante = " INSERT INTO `tbl_estudiante`( `CODIGO_PERSONA`,`GRADO_ACTUAL`, `PASATIEMPOS`, `DISTRACTORES_ESCOLARES`, `METAS`) VALUES ('$codigo_persona','$nombre_estudiante','$pasatiempos_estudiante','$distractores_estudiante','$metas_estudiante'); ";
                      $resul=$conn->query($query_estudiante);
                      $codigo = mysqli_insert_id($conn);

                      $query_contenido = "INSERT INTO `tbl_estudiante_socioeconomico` (`CODIGO_CONTENIDO_SOCIOECONOMICO`, `CODIGO_ESTUDIANTE`) VALUES ( '$codigo_contenido', '$codigo')";    
                      $resul2=$conn->query($query_contenido);
                      
                      $conn->commit();
                      
                        echo "<script> 
                        alert('Estudiante registrado correctamente');
                        window.location = 'estudiante';
                        </script>";
                    
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



  //PARTE PARA EDITAR UN estudiante
  if(isset($_POST['id_estudiante'])){
    if(isset($_POST['editar_estudiante'])){
      $codigo_estudiante = ($_POST['id_estudiante']);
      $editar_estudiante = ($_POST['editar_estudiante']);
      $editar_pasatiempos = ($_POST['editar_pasatiempos']);
      $editar_distractores = ($_POST['editar_distractores']);
      $editar_metas = ($_POST['editar_metas']);
      try{
       // 
       $sentencia = $db->prepare("SELECT * FROM tbl_estudiante where NOMBRE = (?) and CODIGO_ESTUDIANTE <> (?) ;");
       $sentencia->execute(array($editar_nombre,$codigo_estudiante));
       $row=$sentencia->fetchColumn();
        if($row>0){
          echo "<script>
          alert('Ya existe un estudiante con este mismo nombre: $editar_nombre');
          window.location = 'estudiante';
          </script>";
          exit;

        }else{
         
          try{
            $sql = " UPDATE tbl_estudiante SET GRADO_ACTUAL = '$editar_estudiante' ,PASATIEMPOS = '$editar_pasatiempos' ,DISTRACTORES_ESCOLARES = '$editar_distractores', METAS = '$editar_metas'  WHERE CODIGO_ESTUDIANTE = '$codigo_estudiante' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script>
              alert('¡Estudiante modificado exitosamente!');
              window.location = 'estudiante';
              </script>";
             
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar el estudiante!');
              window.location = 'estudiante';
              </script>";
            }
          }catch(PDOException $e){
          echo $e->getMessage(); 
          return false;
          }//fin del try catch
        }//fin del else
      }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
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
        window.location = 'estudiante';
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


//*****Elaborado por Carlos Amador,no quiten creditos :v *******
?>