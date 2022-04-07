<?php
 // session_start();
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  include_once "modelos/Conexionpdo.php";
  include_once 'function_bitacora.php';
  
?>
<?php

//AGREGAR/REGISTRAR LA MATRICULA
if(isset($_POST['AGREGAR_MATRICULA'])){
   isset($_POST['ID_ESTUDIANTE']);
      $ESTUDIANTE = ($_POST['ID_ESTUDIANTE']);
      $CARGA =  ($_POST['ID_CARGA']);
      $usuario = $_SESSION['vario']; //variable que trae el usuario que está logeado
      $fechaActual = date('Y-m-d');  
      $tutoria = ($_POST['tutoria']);
   try{
     $consulta = "";
     $consulta = $db->prepare("SELECT ma.CODIGO_CARGA ,ma.CODIGO_ESTUDIANTE, ca.CODIGO_TUTORIA 
     from tbl_carga_academica ca ,tbl_matricula_academica ma
     where ca.CODIGO_CARGA = ma.CODIGO_CARGA and ca.CODIGO_TUTORIA = (?) and ma.CODIGO_ESTUDIANTE = (?)");
     $consulta ->execute(array($tutoria,$ESTUDIANTE));
     $row = $consulta->fetchColumn();

     if($row > 0){
      echo "<script> 
      alert('No puede adicionar esta clase,ya la tiene matriculada');
      window.location = 'procesoMatricula';
      </script>";

     }else{
      $matricula = " INSERT INTO `tbl_matricula_academica`( `CODIGO_CARGA`, `CODIGO_ESTUDIANTE`,`FECHA_MATRICULA`, `CREADO_POR_USUARIO`,  `FECHA_CREACION` ) 
      VALUES ('$CARGA','$ESTUDIANTE','$fechaActual','$usuario','$fechaActual' ); ";
      $resul=$conn->query($matricula);

      if($resul >0){
        echo "<script> 
        
        window.location = 'crudMatricula';
        </script>";
      }else{
        echo "<script> 
        
        window.location = 'crudMatricula';
        </script>";
      }

     }

      
      
   }catch(PDOException $e){
    echo $e->getMessage(); 
    return false;
   }
}//FIN DEL IF DE REGISTAR



if(isset($_POST['ma_eliminar'])){
  if(isset($_POST['ELIMINAR_MATRICULA'])){
    $code = ($_POST['ma_eliminar']);//asigna a una variable el id del estado a eliminar
    $estudiante = ($_POST['estudiante_eli']);
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE from  tbl_matricula_academica where CODIGO_MATRICULA = '$code' and CODIGO_ESTUDIANTE = '$estudiante';");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            
            window.location = 'crudMatricula';
            </script>";
            exit;
          }else{
            echo "<script>
            
            window.location = 'crudMatricula';
            </script>";
            exit;
          }
        }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       
      }
    
  }
}//Cirre del if padre

if(isset($_POST['MatriEliminar'])){
  if(isset($_POST['ELIMINARMATRICULA2'])){
    $code = ($_POST['MatriEliminar']);//asigna a una variable el id del estado a eliminar
    $estudiante = ($_POST['estudianteElim']);
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE from  tbl_matricula_academica where CODIGO_MATRICULA = '$code' and CODIGO_ESTUDIANTE = '$estudiante';");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            
            window.location = 'crudMatricula';
            </script>";
            exit;
          }else{
            echo "<script>
            
            window.location = 'crudMatricula';
            </script>";
            exit;
          }
        }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       
      }
    
  }
}//Cirre del if padre
