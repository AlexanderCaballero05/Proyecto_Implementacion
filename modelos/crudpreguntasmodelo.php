<?php
  //session_start();

  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  
  include_once 'function_bitacora.php';
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR UNA PREGUNTA
    if(isset($_POST['pregunta'])){
      
       try{
          if(isset($_POST['agregar_pregunta'])){
               $pregunta = ($_POST['pregunta']);
               $estados= ($_POST['estadopregunta']);
               $fechaActual = date('Y-m-d');  
               $usuario=$_SESSION['vario']; 
              try{ 
                  $consulta_pregunta = $db->prepare("SELECT * FROM tbl_preguntas WHERE pregunta = (?);");
                  $consulta_pregunta->execute(array($pregunta));
                  $row=$consulta_pregunta->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('La pregunta $pregunta ya se encuentra registrada');
                    window.location = 'crudpreguntas';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_pregunta = " INSERT INTO `tbl_preguntas`(`CODIGO_ESTADO`,`PREGUNTA`, `CREADO_POR_USUARIO`, `FECHA_CREACION`)
                       VALUES ('$estados','$pregunta',' $usuario','$fechaActual');";
                      $resul=$conn->query($query_pregunta);
                      if($resul >0){
                        echo "<script> 
                        window.location = 'crudpreguntas';
                        </script>";
                        exit;
                      }else{
                        echo "<script> 
                        alert('Error auxilio!');
                        window.location = 'crudpreguntas';
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
    }//FIN DEL IF DE REGISTAR UNA PREGUNTA



  //PARTE PARA EDITAR UNA PREGUNTA
  if(isset($_POST['id_pregunta'])){
    if(isset($_POST['editar'])){
      $codigo_pregunta = ($_POST['id_pregunta']);
      $editar_pregunta = ($_POST['editar_pregunta']);
      $editar_estado = ($_POST['editar_estadopre']);
      $fechaActual = date('Y-m-d');  
      $usuario = $_SESSION['vario']; 
      try{
       // 
       $sentencia = $db->prepare("SELECT * FROM tbl_preguntas where PREGUNTA = (?) and CODIGO_PREGUNTAS <> (?) ;");
       $sentencia->execute(array($editar_pregunta,$codigo_pregunta));
       $row=$sentencia->fetchColumn();
        if($row>0){
          echo "<script>
          alert('Ya existe una pregunta con este mismo nombre: $editar_pregunta');
          window.location = 'crudpreguntas';
          </script>";
          exit;

        }else{
         
          try{
            $sql = " UPDATE tbl_preguntas
            SET CODIGO_ESTADO = '$editar_estado',
            pregunta = '$editar_pregunta',
            MODIFICADO_POR = '$usuario', 
            FECHA_MODIFICACION = '$fechaActual'
            WHERE CODIGO_PREGUNTAS = '$codigo_pregunta' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script>
              window.location = 'crudpreguntas';
              </script>";

            }else{
              echo "<script>
              alert('¡Error al  intentar modificar la pregunta!');
              window.location = 'crudpreguntas';
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

//PARTE PARA ELIMINAR UNA PREGUNTA
if(isset($_POST['pregunta_eliminar'])){
  if(isset($_POST['ELIMINAR_PREGUNTA'])){
    $codigo = ($_POST['pregunta_eliminar']);//asigna a una variable el id de la pregunta a  eliminar
    try{
        $relacion_tablas =  $db->prepare("SELECT  u.CODIGO_PREGUNTA_USUARIO, u.CODIGO_PREGUNTAS from  tbl_preguntas_usuarios u, tbl_preguntas p
        where p.CODIGO_PREGUNTAS = u.CODIGO_PREGUNTAS and p.CODIGO_PREGUNTAs = (?);");
      $relacion_tablas->execute(array($codigo));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar esta, relacionado con otras tablas!');
        window.location = 'crudpreguntas';
        </script>";
        exit;
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_preguntas WHERE  CODIGO_PREGUNTAS = '$codigo' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            window.location = 'crudpreguntas';
            </script>";
            include_once 'function_bitacora.php';
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar la pregunta!');
            window.location = 'crudpreguntas';
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