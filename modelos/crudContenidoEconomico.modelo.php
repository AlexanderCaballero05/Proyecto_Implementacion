<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR UN CONTENIDO SOCIOECONOMICO
    if(isset($_POST['codigo_contenido'])){
       try{
          if(isset($_POST['agregar_contenido'])){
               $codigo_contenido = ($_POST['codigo_contenido']);
               $contenido_nombre = ($_POST['contenido_nombre']); 
                  
              try{ 
                  $consulta_contenido = $db->prepare("SELECT COUNT(*) FROM tbl_contenido_socioeconomico WHERE CODIGO_TIPOSOCIO = (?);");
                  $consulta_contenido->execute(array($contenido_nombre));
                  $row=$consulta_contenido->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('Contenido ya se encuentra registrado');
                    window.location = 'crudContenidoEconomico';
                    </script>"; 
                  exit;
                  }else{
                    try{
                      
                      $query_contenido = " INSERT INTO `tbl_contenido_socioeconomico`(`CODIGO_TIPOSOCIO`,`NOMBRE_TIPO`) VALUES ('$codigo_contenido','$contenido_nombre'); ";
                      $resul=$conn->query($query_contenido);
                      if($resul >0){
                        echo "<script> window.location = 'crudContenidoEconomico'; </script>";
                        include_once 'function_bitacora.php';
                        $codigoObjeto=18;
                        $accion='INSERCIÓN';
                        $descripcion= 'SE REGISTRO UN CONTENIDO DE TIPO SOCIOECONÓMICO';
                        bitacora($codigoObjeto, $accion,$descripcion);
                        exit;
                      }else{
                        echo "<script> 
                        alert('Ocurrio algun error');
                        window.location = 'crudContenidoEconomico';
                        </script>";
                        exit;
                      }

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
        }//FIN DEL IF DE REGISTAR UN CONTENIDO SOCIOECONOMICO



  //PARTE PARA EDITAR UN CONTENIDO SOCIOECONOMICO
  if(isset($_POST['id_contenido'])){
    if(isset($_POST['editar_contenido'])){
      $codigo_contenido = ($_POST['id_contenido']);

      $editar_nombre = ($_POST['editar_nombre']);
     
      try{
       // 
       $sentencia = $db->prepare("SELECT COUNT(*) FROM tbl_Contenido_Socioeconomico where NOMBRE_TIPO = (?)
       and CODIGO_CONTENIDO_SOCIOECONOMICO <> (?);");
       $sentencia->execute(array($editar_nombre,$codigo_contenido));
       $row=$sentencia->fetchColumn();
        if($row>0){
          echo "<script>
          alert('Ya existe un contenido con este mismo nombre: $editar_nombre');
          window.location = 'crudContenidoEconomico';
          </script>";
          exit;

        }else{
         
          try{
            $sql = " UPDATE tbl_Contenido_Socioeconomico SET NOMBRE_TIPO = '$editar_nombre' WHERE CODIGO_CONTENIDO_SOCIOECONOMICO = '$codigo_contenido' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script> window.location = 'crudContenidoEconomico'; </script>";
              include_once 'function_bitacora.php';
              $codigoObjeto=18;
              $accion='MODIFICACIÓN';
              $descripcion= 'SE MODIFICO UN CONTENIDO DE TIPO SOCIOECONÓMICO ';
              bitacora($codigoObjeto, $accion,$descripcion);
              exit;
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar el nombre del Contenido!');
              window.location = 'crudContenidoEconomico';
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

//PARTE PARA ELIMINAR UN CONTENIDO
if(isset($_POST['contenido_eliminar'])){
  if(isset($_POST['ELIMINAR_CONTENIDO'])){
    $code = ($_POST['contenido_eliminar']);//asigna a una variable el id del contenido a eliminar
    try{
      $relacion_tablas =  $db->prepare("SELECT es.CODIGO_CONTENIDO_SOCIOECONOMICO , es.CODIGO_ESTUDIANTE_SOCIOECONOMICO
      from tbl_estudiante_socioeconomico es ,tbl_contenido_socioeconomico con 
      where es.CODIGO_CONTENIDO_SOCIOECONOMICO = con.CODIGO_CONTENIDO_SOCIOECONOMICO 
       and con.CODIGO_CONTENIDO_SOCIOECONOMICO = (?);");
      $relacion_tablas->execute(array($code));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡Error al eliminar, relacionado con otras tablas!');
        window.location = 'crudContenidoEconomico';
        </script>";
        exit;
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_Contenido_socioeconomico WHERE  CODIGO_TIPOSOCIO  = '$code' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            window.location = 'crudContenidoEconomico';
            </script>";
            include_once 'function_bitacora.php';
            $codigoObjeto=18;
            $accion='ELIMINACIÓN';
            $descripcion= 'SE ELIMINO UN CONTENIDO DE TIPO SOCIOECONÓMICO ';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar contenido, relacionado con otras tablas!');
            window.location = 'crudContenidoEconomico';
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