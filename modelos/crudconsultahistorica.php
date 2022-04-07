<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  include_once 'function_bitacora.php';
?>
<?php
if (isset($_POST['cod_edit_con'])){
  if(isset($_POST['edicon'])){
    $cod_con = $_POST['cod_edit_con'];
    $sintomas = $_POST['sintomas'];
    $dingreso = $_POST['dingreso'];
    $diegreso = $_POST['diegreso'];
    $observaciones = $_POST['observaciones'];
    $user=$_SESSION['vario'];
    $fechaactual = strtotime(date("Y-m-d")); 
       try {
        
           $sql = " UPDATE tbl_expediente_psicologico_consulta
           SET SINTOMAS = '$sintomas',
           DIAGNOSTICO_INGRESO= '$dingreso',
           DIAGNOSTICO_EGRESO= '$diegreso',
           OBSEVARCIONES= '$observaciones',
           MODIFICADO_POR = '$user',
           FECHA_MODIFICACION='$fechaactual'
           WHERE CODIGO_EXPEDIENTE_PSICO = '$cod_con' ";
           
           $consulta=$conn->query($sql);
           if ($consulta > 0){
            echo "<script>
               window.location = 'crudconsultashistoricas';
                </script>";
              $codigoObjeto=32;
              $accion='Actualizacion';
              $descripcion='Se vizualiza consulta registradas';
              bitacora($codigoObjeto,$accion,$descripcion);
           }else{ 
            echo "<script>
            alert('Error al actualizar el registro');
            window.location = 'crudconsultashistoricas';
            </script>";
          }
  
        }catch(PDOException $e){
          echo $e->getMessage(); 
        return false;
          }
  
  }
  }
  ?>