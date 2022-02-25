<?php
function bitacora($codigoObjeto, $accion,$descripcion){
include 'conexion.php';
//se obtiene el codigo del usuario
$usuario =$_SESSION['vario'];
$fechaActual = date('Y-m-d');

$consulta="SELECT CODIGO_USUARIO
             FROM tbl_usuario
             WHERE NOMBRE_USUARIO ='$usuario'";
$resultado = mysqli_query($conn,$consulta);
$filas= mysqli_fetch_array($resultado);
$codigoUsuario=$filas[0];

$consultaBitacora=mysqli_query($conn,"INSERT INTO tbl_bitacora_sistema (CODIGO_USUARIO, CODIGO_OBJETO, FECHA, ACCION, DESCRIPCION)
                        VALUES('$codigoUsuario','$codigoObjeto','$fechaActual','$accion','$descripcion')");


}


?>