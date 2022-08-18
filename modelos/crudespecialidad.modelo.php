<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR UN CONTENIDO SOCIOECONOMICO
 if (isset($_POST['nueva_espe']) && isset ($_POST['agregarespecialidad'])){
     $especialidad= $_POST['agregarespecialidad'];
     $descripcion = $_POST['agregardescripcion'];
     $area = $_POST['codigo_area'];
      try {
        $consulta = $db->prepare("SELECT COUNT(*) as especialidad from tbl_especialidad te
        where te.NOMBRE  = ?;");
        $consulta->execute(array($especialidad));
        $row=$consulta->fetchColumn();
        if($row>0){
          echo "<script>
          alert('El nombre de la especialidad $especialidad ya se encuentra registrado');
          window.location = 'crudespecialidad';
          </script>";
        exit;
        }else{
          try{
            $query = " INSERT INTO tbl_especialidad( NOMBRE,CODIGO_AREA, DESCRIPCION, CODIGO_ESTADO) VALUES ('$especialidad','$area','$descripcion','2'); ";
            $resul=$conn->query($query);
            if($resul >0){
              echo "<script> 
              window.location = 'crudespecialidad';
              </script>";
              exit;
              include_once 'function_bitacora.php';
             
            }else{
              echo "<script> 
              alert('Error auxilio!');
              window.location = 'crudespecialidad';
              </script>";
              exit;
            }
          }catch(PDOException $e){
          echo $e->getMessage(); 
          return false;
          }
        } //fin else 
      }catch(PDOException $e){
       echo $e->getMessage(); 
       return false;
      }

 }// fin  if 


 if (isset($_POST['editespecialidad']) &&  isset($_POST['editare'])){
  $especialidad= $_POST['editespecialidad'];
  $descripcion = $_POST['editar_descripcion'];
  $cod = $_POST['id_especialidad'];
  $estado = $_POST['ESTADOUSUARIO'];
  try {
    $sentencia = $db->prepare("SELECT COUNT(*) FROM tbl_especialidad where NOMBRE = (?) and CODIGO_ESPECIALIDAD <> (?) ;");
    $sentencia->execute(array($especialidad,$cod));
    $row=$sentencia->fetchColumn();
     if($row>0){
       echo "<script>
       alert('Ya existe una especialidad con este mismo nombre: $especialidad');
       window.location = 'crudespecialidad';
       </script>";
       exit;
     } else{
      try{
        $sql = "UPDATE tbl_especialidad 
        SET CODIGO_ESTADO = '$estado',
        NOMBRE = '$especialidad',
        DESCRIPCION = '$descripcion'
        WHERE CODIGO_ESPECIALIDAD = '$cod' ";
        $consulta=$conn->query($sql);
        if ($consulta>0){
          echo '<script>              
          window.location = "crudespecialidad";
          </script>';
          include_once 'function_bitacora.php';
         
          exit;
        }else{
          echo "<script>
          alert('¡Error al modificar la especialidad!');
          window.location = 'crudespecialidad';
          </script>";
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

 } // fin if 


 //PARTE PARA ELIMINAR UNA ESPECIALIDAD
 if(isset($_POST['eliminar'])){
   if(isset($_POST['ELIMINAR_ESPECIALIDAD'])){ 
     $codigo = ($_POST['eliminar']);//asigna a una variable el id de la pregunta a  eliminar
     try{   //prueben tan siquiera lo que hacen en la base -_- ,no solo copien!!
         $relacion_tablas =  $db->prepare("SELECT pe.CODIGO_ESPECIALIDAD from tbl_persona_especialidad pe ,tbl_especialidad es 
         where pe.CODIGO_ESPECIALIDAD = es.CODIGO_ESPECIALIDAD and  es.CODIGO_ESPECIALIDAD =(?);");
       $relacion_tablas->execute(array($codigo));
       $row = $relacion_tablas->fetchColumn();
       if($row >0){
         echo "<script>
         alert('¡No se puede eliminar esta, relacionado con otras tablas!');
         window.location = 'crudespecialidad';
         </script>";
         exit;
       }else{
         try{
           $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
           mysqli_query($link, "DELETE FROM tbl_especialidad WHERE  CODIGO_ESPECIALIDAD = '$codigo' ");
           if(mysqli_affected_rows($link)>0){
             echo "<script>
             window.location = 'crudespecialidad';
             </script>";
             include_once 'function_bitacora.php';
             
             exit;
           }else{
             echo "<script>
             alert('¡Error al eliminar la especialidad!');
             window.location = 'crudespecialidad';
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
 
 
 //**Elaborado por Diana Rut,no quiten creditos :v, modificado por yonatan ****
 ?>


