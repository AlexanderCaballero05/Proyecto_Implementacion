<?php
  //session_start();

  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  
  include_once 'function_bitacora.php';
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR UNA PREGUNTA
    if(isset($_POST['agregarsintomasneu'])){
       try{
          if(isset($_POST['agregarsintoneuro'])){
               $tiposintoma = ($_POST['agregarsintomasneu']);
              try{ 
                  $consulta_sintomas = $db->prepare("SELECT COUNT(*) FROM tbl_sintomas_neuroticos WHERE tipo = (?);");
                  $consulta_sintomas->execute(array($tiposintoma));
                  $row=$consulta_sintomas->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('Este sintoma neurótico ya se encuentra registrado');
                    window.location = 'crudsintomasneuroticos';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_sintoma = " INSERT INTO `tbl_sintomas_neuroticos`( `TIPO`) VALUES ('$tiposintoma'); ";
                      $resul=$conn->query($query_sintoma);
                      if($resul >0){
                        echo "<script> 
                        alert('Se registro correctamente'); 
                        window.location = 'crudsintomasneuroticos';
                        </script>";
                        include_once 'function_bitacora.php';
                       bitacora($codigoObjeto,$accion,$descripcion);
                        exit;
                      }else{
                        echo "<script> 
                        alert('Error auxilio!');
                        window.location = 'crudsintomasneuroticos';
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



  //PARTE PARA EDITAR UN SINTOMAS 
  if(isset($_POST['sintoneu'])){
    if(isset($_POST['editarsintoma'])){
      $codigo_sintoma = ($_POST['sintoneu']);
      $editar_sintomas = ($_POST['editarsintoneu']);
      try{
       // 
       $sentencia = $db->prepare("SELECT COUNT(*) FROM tbl_sintomas_neuroticos where TIPO = (?) and CODIGO_SINTOMA_NEUROTICO <> (?) ;");
       $sentencia->execute(array($editar_sintomas,$codigo_sintoma));
       $row=$sentencia->fetchColumn();
        if($row>0){
          echo "<script>
          alert('Ya existe un síntoma con este mismo nombre: $editar_sintomas');
          window.location = 'crudsintomasneuroticos';
          </script>";
          exit;

        }else{
         
          try{
            $sql = "UPDATE tbl_sintomas_neuroticos
            SET TIPO = '$editar_sintomas'
            WHERE CODIGO_SINTOMA_NEUROTICO = '$codigo_sintoma' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script>
              alert('El síntoma se modifico correctamente'); 
              window.location = 'crudsintomasneuroticos';
              </script>";
              
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar el síntoma!');
              window.location = 'crudsintomasneuroticos';
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

//PARTE PARA ELIMINAR UN SINTOMA NEURÓTICO
if(isset($_POST['eliminarsintoneu'])){
  if(isset($_POST['ELIMINARSINTOMA'])){
    $codigo = ($_POST['eliminarsintoneu']);//asigna a una variable el id de la pregunta a  eliminar
    try{
        $relacion_tablas =  $db->prepare("SELECT  ps.CODIGO_PERSONA_SINTOMA, ps.CODIGO_SINTOMA_NEUROTICO from  tbl_personas_sintomas ps, tbl_sintomas_neuroticos sn
        where sn.CODIGO_SINTOMA_NEUROTICO= ps.CODIGO_SINTOMA_NEUROTICO and sn.CODIGO_SINTOMA_NEUROTICO = (?);");
      $relacion_tablas->execute(array($codigo));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar, esta relacionado con otras tablas!');
        window.location = 'crudsintomasneuroticos';
        </script>";
        exit;
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_sintomas_neuroticos WHERE  CODIGO_SINTOMA_NEUROTICO = '$codigo' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            alert('Se elimino correctamente'); 
            window.location = 'crudsintomasneuroticos';
            </script>";
            
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar la pregunta!');
            window.location = 'crudsintomasneuroticos';
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