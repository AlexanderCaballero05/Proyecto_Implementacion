<?php

  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  include_once 'function_bitacora.php';
  
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR UN TIPO DE PERSONA
    if(isset($_POST['TIPO_PERSONA'])){
       try{
          if(isset($_POST['agregar_persona'])){
               $persona = ($_POST['TIPO_PERSONA']);
               
              try{ 
                  $consulta_pregunta = $db->prepare("SELECT NOMBRE FROM tbl_tipo_persona WHERE NOMBRE = (?);");
                  $consulta_pregunta->execute(array($persona));
                  $row=$consulta_pregunta->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('La $persona ya se encuentra registrado');
                    window.location = 'crudtipopersona';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_pregunta = " INSERT INTO `tbl_tipo_persona`( `nombre`) VALUES ('$persona'); ";
                      $resul=$conn->query($query_pregunta);
                      if($resul >0){
                        echo "<script> 
                        alert('¡Se agrego un  nuevo tipo de persona!');
                        window.location = 'crudtipopersona';
                        </script>";
                        $codigoObjeto=12;
                        $accion='SE AGREGO';
                        $descripcion='SE AGREGO UN TIPO DE PERSONA';
                       bitacora($codigoObjeto,$accion,$descripcion);
                        exit;
                      }else{
                        echo "<script> 
                        alert('¡Error auxilio!');
                        window.location = 'crudtipopersona';
                        </script>";
                        exit;
                      }
                    }catch(PDOException $e){
                    echo $e->getMessage(); 
                    return false;
                    }
                  }//fin del else de si no existe 
              }catch(PDOException $e){
              echo $e->getMessage(); 
              return false;
              }
            }//fin del if de verificar si hay datos

       }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }//FIN DEL IF DE REGISTAR UN TIPO PERSONA



  //PARTE PARA EDITAR UNA PREGUNTA
  if(isset($_POST['id_editar'])){
    if(isset($_POST['editartipoper'])){
      $codigo_persona = ($_POST['id_editar']);
      $editar_persona = ($_POST['editar_persona']);
      try{
       // 
       $sentencia = $db->prepare("SELECT * FROM tbl_tipo_persona where NOMBRE = (?) and CODIGO_TIPO_PERSONA <> (?) ;");
       $sentencia->execute(array($editar_persona,$codigo_persona));
       $row=$sentencia->fetchColumn();
        if($row>0){
          echo "<script>
          alert('Ya existe un tipo de persona con este mismo nombre: $editar_persona');
          window.location = 'crudtipopersona';
          </script>";
          exit;

        }else{
         
          try{
            $sql = " UPDATE tbl_tipo_persona SET nombre= '$editar_persona'  
            WHERE CODIGO_tipo_persona= '$codigo_persona' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script>
              alert('¡Se modifico el tipo de persona!');
              window.location = 'crudtipopersona';
              </script>";
              $codigoObjeto=12;
              $accion='MODIFICACIÓN';
              $descripcion= 'SE MODIFICO UN TIPO DE PERSONA ';
              bitacora($codigoObjeto, $accion,$descripcion);
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar el tipo de persona!');
              window.location = 'crudtipopersona';
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

//PARTE PARA ELIMINAR UN tipo PERSONA
if(isset($_POST['persona_eliminar'])){
  if(isset($_POST['ELIMINAR_PERSONA'])){
    $codigo = ($_POST['persona_eliminar']);//asigna a una variable el id de la pregunta a  eliminar
    try{
        $relacion_tablas =  $db->prepare("SELECT  p.CODIGO_TIPO_PERSONA, p.CODIGO_PERSONA from  tbl_persona P, tbl_tipo_persona t
        where t.CODIGO_TIPO_PERSONA = P.CODIGO_TIPO_PERSONA and t.CODIGO_TIPO_PERSONA  = (?);");
      $relacion_tablas->execute(array($codigo));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar este campo, esta relacionado con otras tablas!');
        window.location = 'crudtipopersona';
        </script>";
        exit;
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_tipo_persona WHERE CODIGO_TIPO_PERSONA = '$codigo' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            alert('¡Se elimino un tipo de persona!');
            window.location = 'crudtipopersona';
            </script>";
            $codigoObjeto=12;
            $accion='Eliminacion';
            $descripcion= 'Se elimino una persona';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar la persona!');
            window.location = 'crudtipopersona';
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