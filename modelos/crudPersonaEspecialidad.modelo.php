<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR UN CONTENIDO SOCIOECONOMICO

    if(isset($_POST['codigo_persona'])){
       try{
          if(isset($_POST['agregar_especialidad'])){
               $codigo_persona = ($_POST['codigo_persona']);
               $EDITARESPECIALIDAD = ($_POST['EDITARESPECIALIDAD']);
                  
              try{ 
                  $consulta_contenido = $db->prepare("SELECT e.CODIGO_ESPECIALIDAD  from tbl_persona_especialidad e  where e.CODIGO_ESPECIALIDAD = (?);");
                  $consulta_contenido->execute(array($codigo_persona));
                  $row=$consulta_contenido->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('Esta especialidad ya se encuentra registrado');
                    window.location = 'crudPersonaEspecialidad';
                    </script>"; 
                  exit;
                  }else{
                    try{
                      
                      $query_especialidad = " INSERT INTO `tbl_persona_especialidad`(`CODIGO_PERSONA`,`CODIGO_PERSONA_ESPECIALIDAD`) VALUES ('$codigo_persona','$EDITARESPECIALIDAD'); ";
                      $resul=$conn->query($query_especialidad);
                      if($resul >0){
                        echo "<script> 
                        alert('Especialidad registrada correctamente');
                        window.location = 'crudPersonaEspecialidad';
                        </script>";
                        exit;
                      }else{
                        echo "<script> 
                        alert('Error auxilio!');
                        window.location = 'crudPersonaEspecialidad';
                        </script>";
                        exit;
                      }

                      }catch(PDOException $e){
                        echo $e->getMessage(); 
                        return false;
                        }
                      }//fin del else de si no existe el nombre del esepcialista
                  }catch(PDOException $e){
                  echo $e->getMessage(); 
                  return false;
                  }
                }//fin del if de verificar si hay datos
    
           }catch(PDOException $e){
            echo $e->getMessage(); 
            return false;
           }
        }//FIN DEL IF DE REGISTAR UNA ESPECIALIDAD



  //PARTE PARA EDITAR NOMBRE Y ESPECIALIDAD DEL MEDICO/PSICOLOGO
  if(isset($_POST['id_especialidad'])){
    if(isset($_POST['editar_especialidad'])){
      $codigo_especialidad = ($_POST['id_especialidad']);
      $editar_nombre = ($_POST['editar_nombre']);
      $editar_perespecialidad = ($_POST['editar_perespecialidad']);
     
      try{
       // 
       $sentencia = $db->prepare("SELECT * FROM tbl_persona_especialidad where CODIGO_PERSONA = (?) and CODIGO_ESPECIALIDAD <> (?) ;");
       $sentencia->execute(array($editar_nombre));
       $row=$sentencia->fetchColumn();
        if($row>0){
          echo "<script>
          alert('Ya existe un especialista con este mismo nombre: $editar_nombre');
          window.location = 'crudPersonaEspecialidad';
          </script>";
          exit;

        }else{
         
          try{
            $sql = " UPDATE tbl_persona_especialidad SET CODIGO_PERSONA = '$editar_nombre' ,CODIGO_ESPECIALIDAD = '$editar_perespecialidad' WHERE CODIGO_PERSONA_ESPECIALIDAD = '$codigo_especialidad' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script>
              alert('Especialista modificado exitosamente!');
              window.location = 'crudPersonaEspecialidad';
              </script>";
              include_once 'function_bitacora.php';
              $codigoObjeto=1;
              $accion='Modificacion';
              $descripcion= 'Se edito un estudiante ';
              bitacora($codigoObjeto, $accion,$descripcion);
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar el registro!');
              window.location = 'crudPersonaEspecialidad';
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

//PARTE PARA ELIMINAR UN ESPECIALISTA
if(isset($_POST['contenido_especialidad'])){
  if(isset($_POST['ELIMINAR_ESPECIALIDAD'])){
    $code = ($_POST['contenido_especialidad']);//asigna a una variable el id del especialista a eliminar
    try{
      $relacion_tablas =  $db->prepare("SELECT pe.CODIGO_PERSONA_ESPECIALIDAD, CONCAT_WS(' ',p.PRIMER_NOMBRE,p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) 
      as CODIGO_PERSONA, e.NOMBRE as CODIGO_ESPECIALIDAD FROM tbl_persona_especialidad pe, tbl_especialidad e, tbl_persona p WHERE pe.codigo_especialidad = e.codigo_especialidad and pe.CODIGO_PERSONA = p.CODIGO_PERSONA;");
      $relacion_tablas->execute(array($code));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar el registro, relacionado con otras tablas!');
        window.location = 'crudPersonaEspecialidad';
        </script>";
        exit;
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_persona_especialidad WHERE  CODIGO_PERSONA_ESPECIALIDAD = '$code' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            alert('¡Especialista eliminado correctamente!');
            window.location = 'crudPersonaEspecialidad';
            </script>";
            include_once 'function_bitacora.php';
            $codigoObjeto=1;
            $accion='Modificacion';
            $descripcion= 'Se elimino un especialista ';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar el especialista!');
            window.location = 'crudPersonaEspecialidad';
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