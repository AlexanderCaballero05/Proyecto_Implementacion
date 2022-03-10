
<?php
 //VALIDACIONES DEL PROCESO DE CARGA ACADEMICA
 include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>

<?php
//codigo para insertar datos en el proceso

if(isset($_POST['tutor'])  ){
    if(isset($_POST['GUARDAR_CARGA'])){
        $hora = ($_POST['hora']);
        $fech_inicio = ($_POST['fecha_inicio']);
        $fecha_final = ($_POST['fecha_final']);
        $tutor = ($_POST['tutor']);
        $tutoria = ($_POST['tutoria']);
        $modalidad = ($_POST['modalidad']);
        $seccion = ($_POST['seccion']);
        $fecha = date('Y-m-d');
        $user=$_SESSION['vario'];

        try{

            $insert = " INSERT INTO `tbl_carga_academica`(`CODIGO_TUTORIA`, `CODIGO_PERSONA`, `CODIGO_MODALIDAD`, `SECCION`, 
            `HORA`,`FECHA_INICIO`, `FECHA_FINAL`, `CREADO_POR_USUARIO`, `FECHA_CREACION`) 
            VALUES ('$tutoria','$tutor','$modalidad','$seccion','$hora','$fech_inicio','$fecha_final', '$user','$fecha'); ";

            $resul=$conn->query($insert);
            if($resul >0){
             echo "<script> 
             alert('carga academica registrada correctamente');
             window.location = 'procesoCargaAcademica';
             </script>";
             exit;
             include_once 'function_bitacora.php';
             $codigoObjeto=20;
             $accion='Registro';
             $descripcion= 'Se asigno una carga academica ';
             bitacora($codigoObjeto, $accion,$descripcion);

            }else{
             echo "<script> 
             alert('No se puede agregar por alguna extraña razon');
             window.location = 'procesoCargaAcademica';
             </script>";
             exit;
            }

        }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
        }
    } //if secundario
}//if principal


//codigo para editar el proceso
if(isset($_POST['tutor']) && isset($_POST['tutoria']) ){
    if(isset($_POST['EDITAR_CARGA'])){
        $hora_modi = ($_POST['']);
        $fech_inicio_modi = ($_POST['']);
        $fecha_final_modi = ($_POST['']);
        $tutor_modi = ($_POST['']);
        $tutoria_modi = ($_POST['']);
        $modalidad_modi = ($_POST['']);
        $seccion_modi = ($_POST['']);
        $fecha = ($_POST['']);
        $usuario=$_SESSION['vario'];
        try{

        }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
        }

    } //if secundario
}//if principal



//CODIGO PARA ELIMINAR  LA  CARGA ACADEMICA
if(isset($_POST[''])){
    if(isset($_POST[''])){

    }//cierre del if secundario
}//cierre del if principal



















//Elaborado Diana Rut
?>


