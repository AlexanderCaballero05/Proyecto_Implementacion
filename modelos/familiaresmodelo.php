<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 <?php

  //session_start();
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR UN FAMILIAR

  //PARTE PARA AGREGA UN FAMILIAR

  if(isset($_POST['CODpFAMILIAR'])){
    $codigo_persona = ($_POST['CODpFAMILIAR']);
     
    $registro = "SELECT * FROM tbl_familiar 
                  WHERE CODIGO_PERSONA = '$codigo_persona';";
    
    $consulta_registro=$conn->query($registro);
    $fila=$consulta_registro->num_rows;

      if($fila == 1){
        echo '<script>
        alert("Usuario ya se encuentra registrado");
        window.location = "procesoRegistrarFamiliares";
        </script>';
                exit;
      }else{

            $Estado_civil = ($_POST['CIVIL']);
            $nivel_educativo = ($_POST['NIVEL']);
            $ingresos = ($_POST['INGRESOS']);
            $iglesia = ($_POST['IGLESIA']); 

              $insert_familiar = "INSERT INTO tbl_familiar(CODIGO_PERSONA, ESTADO_CIVIL, NIVEL_EDUCATIVO, INGRESOS_DE_FAMILIAR, NOMBRE_IGLESIA)
                                                      VALUES('$codigo_persona', '$Estado_civil', '$nivel_educativo', '$ingresos', '$iglesia');";
              
              $insert_consulta =$conn->query($insert_familiar);

            if($insert_consulta > 0){
                echo '<script>
                        window.location = "crudfamiliares";
                        </script>';

            }else{
              echo '<script>
              alert("Error al crear el registro");
              window.location = "crudfamiliares";
              </script>';

           }



      }

  }

  //PARTE PARA EDITAR UN FAMILIAR
  if(isset($_POST['EDITARFAMILIAR'])){
    if(isset($_POST['edit_familiar'])){
      $codigo_familiares = ($_POST['EDITARFAMILIAR']);
      $editar_estado = ($_POST['editar_estado']);
      $editar_nivelE= ($_POST['editar_nivele']);
      $editar_ingresos= ($_POST['editar_ingresos']);
      $editar_iglesia= ($_POST['editar_iglesia']);
      
      
       // 
          try{
            $sql = "UPDATE tbl_familiar SET ESTADO_CIVIL = '$editar_estado',
                                          NIVEL_EDUCATIVO = '$editar_nivelE', 
                                          INGRESOS_DE_FAMILIAR = '$editar_ingresos', 
                                          NOMBRE_IGLESIA = '$editar_iglesia'
                                        WHERE CODIGO_PERSONA = '$codigo_familiares'; ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script>
              alert('¡Modificación realizada correctamente!');
              window.location = 'crudfamiliares';
              </script>";

              include_once 'function_bitacora.php';
              $codigoObjeto=2;
              $accion='Modificacion';
              $descripcion= 'Se edito un familiar ';
              bitacora($codigoObjeto, $accion,$descripcion);
              exit;
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar el familiar!');
              window.location = 'crudfamiliares';
              </script>";
            }
          }catch(PDOException $e){
          echo $e->getMessage(); 
          return false;
          }//fin del try catch
      }
  }//cierre del if principal

//PARTE PARA ELIMINAR UN Familiar
if(isset($_POST['eliminarfami'])){
  if(isset($_POST['eliminar_fami'])){
    $code = ($_POST['eliminarfami']);//asigna a una variable el id del estado a eliminar
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_familiar WHERE  CODIGO_FAMILIAR = '$code' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            window.location = 'crudfamiliares';
            </script>";
            include_once 'function_bitacora.php';
            $codigoObjeto=2;
            $accion='Eliminación';
            $descripcion= 'Se elimino un familiar ';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('¡No puede eliminar este familiar tiene relación con estudiantes!');
            window.location = 'crudfamiliares';
            </script>";
            exit;
          }
        }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
      }
}//Cirre del if padre


//*****Elaborado por Diana Rut,no quiten creditos :v *******
?>