<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 <?php

  //session_start();
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>
<?php

//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR UN ESTADO
if(isset($_POST['agregar_tipoo'])){
  
  try{
     if(isset($_POST['agregar_patologiaa'])){
          $agregar_tipo = ($_POST['agregar_tipoo']);
          $estado_mantenimiento = ($_POST['ESTADOMANTENIMIENTO']);
             
         try{ 
             $consulta_estado = $db->prepare("SELECT COUNT(*) FROM tbl_transtornos_corporales WHERE TIPO = (?);");
             $consulta_estado->execute(array($agregar_tipo));
             $row=$consulta_estado->fetchColumn();
             if($row>0){
               echo "<script>
               alert('El nombre del trastorno $agregar_tipo ya se encuentra registrado');
               window.location = 'crudTranstornos';
               </script>";
             exit;
             }else{
               try{
                 $query_estado = " INSERT INTO `tbl_transtornos_corporales`(TIPO, CODIGO_ESTADO) VALUES ('$agregar_tipo','$estado_mantenimiento'); ";
                 $resul=$conn->query($query_estado);
                 if($resul >0){
                   echo "<script> 
                   alert('Se registro correctamente'); 
                   window.location = 'crudTranstornos';
                   </script>";
                   exit;
                 }else{
                   echo "<script> 
                   alert('Ocurrio algun error');
                   window.location = 'crudTranstornos';
                   </script>";
                   exit;
                 }
               }catch(PDOException $e){
               echo $e->getMessage(); 
               return false;
               }
             }//fin del else de si no existe el nombre del estado
         }catch(PDOException $e){
         echo $e->getMessage(); 
         return false;
         }
       }//fin del if de verificar si hay datos

  }catch(PDOException $e){
   echo $e->getMessage(); 
   return false;
  }
}//FIN DEL IF DE REGISTAR UN TRANSTORNO

  //PARTE PARA EDITAR UN TRANSTORNO
  if(isset($_POST['EDITARNOPATOLOGIA'])){
    if(isset($_POST['editar_nopatologia'])){
      $codigo_nopatologia = ($_POST['EDITARNOPATOLOGIA']);
      $editar_tipo = ($_POST['editar_tipo']);
      $editar_estado = ($_POST['EDITARESTADO']);
       //cODIGO PARA VERIFICAR QUE NO EXISTA EL TRANSTORNO YA
       $sentencia = $db->prepare("SELECT COUNT(*) FROM tbl_transtornos_corporales WHERE TIPO = (?) and CODIGO_TRANSTORNO <> (?) ;");
       $sentencia->execute(array($editar_tipo,$codigo_nopatologia));
       $row=$sentencia->fetchColumn();
        if($row>0){
          echo "<script>
          alert('Ya existe un trastorno con este nombre: $editar_tipo');
          window.location = 'crudTranstornos';
          </script>";
          exit;
        }else{
          try{
            $sql = "UPDATE tbl_transtornos_corporales SET TIPO = '$editar_tipo', CODIGO_ESTADO='$editar_estado'
                  WHERE CODIGO_TRANSTORNO = '$codigo_nopatologia'; ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo '<script>
              alert("Trastorno modificado correctamente"); 
              window.location = "crudTranstornos";
              </script>';
              include_once 'function_bitacora.php';
              exit;
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar el registro!');
              window.location = 'crudTranstornos';
              </script>";
            }
          }catch(PDOException $e){
          echo $e->getMessage(); 
          return false;
          }//fin del try catch

        }
          
      }
  }//cierre del if principal

//PARTE PARA ELIMINAR UNA TRANSTORNO
if(isset($_POST['transtorno_eliminar'])){
  if(isset($_POST['ELIMINAR_TRANSTORNO'])){
    $code = $_POST['transtorno_eliminar'];//asigna a una variable el id del estado a eliminar

     $relacion_tablas =  $db->prepare("SELECT  pt.CODIGO_TRANSTORNO, pt.CODIGO_PERSONAS_TRANSTORNOS 
     from  tbl_personas_transtornos pt, tbl_transtornos_corporales tc
           where pt.CODIGO_TRANSTORNO = tc.CODIGO_TRANSTORNO and  pt.CODIGO_TRANSTORNO= (?);");
      $relacion_tablas->execute(array($code));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar, está relacionado con otras tablas!');
        window.location = 'crudTranstornos';
        </script>";
        exit;
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_transtornos_corporales WHERE CODIGO_TRANSTORNO='$code' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            alert('Se elimino correctamente'); 
            window.location = 'crudTranstornos';
            </script>";
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar el trastorno!');
            window.location = 'crudTranstornos';
            </script>";
            exit;
          }
        }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }

      }
  }
}

//Cerre del if padre


//*****Elaborado por Carlos Amador ,no quiten creditos :v *******
?> 