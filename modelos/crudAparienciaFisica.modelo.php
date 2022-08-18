<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 <?php

  //session_start();
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR UN ROL
if(isset($_POST['aparienciaa'])){
  try{
     if(isset($_POST['nuevoo'])){
          $nombre_apariencia= ($_POST['aparienciaa']);
          $fechaActual = date('Y-m-d');
          $usuario =$_SESSION['vario'];
          $estado_mantenimiento = ($_POST['ESTADOMANTENIMIENTO']);    
              try{ 
                  $consulta_modalidad = $db->prepare("SELECT COUNT(*) FROM tbl_apariencia_fisica WHERE TIPO = (?);");
                  $consulta_modalidad->execute(array($nombre_apariencia));
                  $row=$consulta_modalidad->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('El nombre $nombre_apariencia ya se encuentra registrado');
                    window.location = 'crudAparienciaFisica';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_modalidad = " INSERT INTO tbl_apariencia_fisica (TIPO,CODIGO_ESTADO) VALUES ('$nombre_apariencia','$estado_mantenimiento' ); ";
                      $resul=$conn->query($query_modalidad);
                      if($resul >0){
                        echo "<script> 
                        window.location = 'crudAparienciaFisica';
                        </script>";
                        exit;
                       
                      }else{
                        echo "<script> 
                        alert('Error !');
                        window.location = 'crudAparienciaFisica';
                        </script>";
                        exit;
                      }
                    }catch(PDOException $e){
                    echo $e->getMessage(); 
                    return false;
                    }
                  }//fin del else de si no existe el nombre del rol
              }catch(PDOException $e){
              echo $e->getMessage(); 
              return false;
              }
            }//fin del if de verificar si hay datos

       }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }//FIN DEL IF DE REGISTAR UN ROL



  //PARTE PARA EDITAR UN tipo de modalidad
  if(isset($_POST['id_apariencia'])){
    if(isset($_POST['editaapariencia'])){
      $codigo_examen = ($_POST['id_apariencia']);
      $editar_examen = ($_POST['editar_apariencia']);
      $fecha_modificacion = date('Y-m-d'); 
      $user=$_SESSION['vario'];
      $editar_estado = ($_POST['EDITARESTADO']); 
      try{
       // 
       $sentencia = $db->prepare("SELECT COUNT(*) FROM tbl_apariencia_fisica where TIPO = (?) and CODIGO_APARIENCIA <> (?) ;");
       $sentencia->execute(array($editar_examen,$codigo_examen));
       $row=$sentencia->fetchColumn();
        if($row>0){
          echo "<script>
          alert('Ya existe la apariencia: $editar_examen');
          window.location = 'crudAparienciaFisica';
          </script>";
          exit;
        }else{
          try{
            $sql = " UPDATE tbl_apariencia_fisica SET TIPO = '$editar_examen' , CODIGO_ESTADO='$editar_estado'
            WHERE CODIGO_APARIENCIA = '$codigo_examen'";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo '<script>
              
              window.location = "crudAparienciaFisica";
              </script>';
              include_once 'function_bitacora.php';
              
              exit;
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar la apariencia!');
              window.location = 'crudAparienciaFisica';
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


 //// eliminar medicamento  /////
 if(isset($_POST['eliminar_aparienciafisica'])){
   if(isset($_POST['eliminar_apariencia'])){
     $codigo = ($_POST['eliminar_aparienciafisica']);//asigna a una variable el id de la pregunta a  eliminar
     try{
         $relacion_tablas =  $db->prepare("SELECT pa.CODIGO_PERSONAS_APARIENCIA, pa.CODIGO_APARIENCIA from  tbl_apariencia_fisica af ,tbl_personas_apariencia pa
         where af.CODIGO_APARIENCIA  = pa.CODIGO_APARIENCIA and af.CODIGO_APARIENCIA = (?);");
       $relacion_tablas->execute(array($codigo));
       $row = $relacion_tablas->fetchColumn();
       if($row >0){
         echo "<script>
         alert('¡No se puede eliminar esta, relacionado con otras tablas!');
         window.location = 'crudAparienciaFisica';
         </script>";
         exit;
       }else{
         try{
           $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
           mysqli_query($link, "DELETE FROM tbl_apariencia_fisica WHERE  CODIGO_APARIENCIA = '$codigo'");
           if(mysqli_affected_rows($link)>0){
             echo "<script>
             window.location = 'crudAparienciaFisica';
             </script>";
             include_once 'function_bitacora.php';
           
             exit;
           }else{
             echo "<script>
             alert('¡Error al eliminar la apariencia!');
             window.location = 'crudAparienciaFisica';
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