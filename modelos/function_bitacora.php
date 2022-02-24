<?php
function bitacora($codigoObjeto, $accion,$descripcion){
include_once 'conexion.php';

$usuario =$_SESSION['vario'];

//se obtiene el codigo del usuario

$consulta="SELECT CODIGO_USUARIO
             FROM tbl_usuario
             WHERE NOMBRE_USUARIO ='$usuario'";
$resultado = mysqli_query($conn,$consulta);
$filas= mysqli_fetch_array($resultado);
$codigoUsuario=$filas[0];

$consultaBitacora=mysqli_query($conn,"INSERT INTO tbl_bitacora_sistema (CODIGO_USUARIO, CODIGO_OBJETO, FECHA, ACCION, DESCRIPCION)
                        VALUES('$codigoUsuario','$codigoObjeto','2022-02-01 21:58:56','$accion','$descripcion')");


}


?>