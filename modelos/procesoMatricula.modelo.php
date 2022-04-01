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
if(isset($_POST['estudiante'])){
       
    $usuario=$_SESSION['vario']; //variable que trae el usuario que está logeado
   try{
      if(isset($_POST['btnmatricular'])){
           $estudiante = ($_POST['estudiante']);
           $carga = ($_POST['CODIGO_CARGA']);
           $fechaActual = date('Y-m-d');   
          try{ 
              $consulta_nom = $db->prepare("SELECT PARAMETRO FROM tbl_parametros WHERE PARAMETRO = (?);");
              $consulta_nom->execute(array($nombre_param));
              $row=$consulta_nom->fetchColumn();
              if($row>0){
                echo "<script>
                alert('El nombre de parámetro $nombre_param ya se encuentra registrado');
                window.location = 'crudParametros';
                </script>";
              exit;
              }else{
                try{
                  $query_param = " INSERT INTO `tbl_matricula_academica`( `CODIGO_CARGA`, `CODIGO_ESTUDIANTE`,`FECHA_MATRICULA`, `CREADO_POR_USUARIO`,  `FECHA_CREACION` ) VALUES ('$carga','$estudiante','$fechaActual','$usuario','$fechaActual' ); ";
                  $resul=$conn->query($query_param);
                  if($resul >0){
                    echo "<script> 
                    alert('egistro de matricula exitoso');
                    window.location = 'procesoMatricula';
                    </script>";
                    

                    //<!--llamada de la fuction bitacora -->
                    $codigoObjeto=3;
                    $accion='Insertar parámetro';
                    $descripcion= 'Registro de matricula exitoso';
                    bitacora($codigoObjeto, $accion,$descripcion);

                  }else{
                    echo "<script> 
                    alert('Error !');
                    window.location = 'procesoMatricula';
                    </script>";
                    
                    //<!--llamada de la fuction bitacora -->
                    $codigoObjeto=3;
                    $accion='Registro fallido de parámetro';
                    $descripcion= 'Se intentó insertar un nuevo parámetro';
                    bitacora($codigoObjeto, $accion,$descripcion);
                  }
                }catch(PDOException $e){
                echo $e->getMessage(); 
                return false;
                }
              }//fin del else de si no existe el nombre del parametro
          }catch(PDOException $e){
          echo $e->getMessage(); 
          return false;
          }
        }//fin del if de verificar si hay datos

   }catch(PDOException $e){
    echo $e->getMessage(); 
    return false;
   }
}//FIN DEL IF DE REGISTAR