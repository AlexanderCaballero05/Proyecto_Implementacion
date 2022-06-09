<!-- 
-----------------------------------------------------------------------
        Universidad Nacional Autonoma de Honduras (UNAH)
	            	Facultad de Ciencias Economicas
          Departamento de Informatica administrativa
         Analisis, Programacion y Evaluacion de Sistemas
                   Segundo Periodo 2022

  Equipo:
  Arnold Alexander Caballero Garcia (aacaballero@unah.hn)
  Luz Maria Montoya Medina (luz.montoya@unah.hn)
  Diana Rut Garcia Amador (drgarciaa@unah.hn)
  Any Melissa Hernandez (anyhernandez@unah.hn)
  Gissela Yamileth Diaz (gdiaza@unah.hn)
  Cesar Fernando Rovelo (Cesar.rovelo@unah.hn)

  Catedratico:
  Lic. Claudia Nuñez (Analisis)
  Lic. Giancarlo Martini Scalici Aguilar (Implementación)
  Lic. Karla Melisa Garcia Pineda (Evaluación)

---------------------------------------------------------------------

    Programa:          Funcion que realiza el registro de las acciones que un usuario realiza sobre los objetos o pantallas del sistema
    Fecha:             20-Marzo-2022
    Programador:       Arnold Caballero 
    descripcion:       Valida agregar a los roles de usuario permisos sobre objetos o modulos del sistema

-----------------------------------------------------------------------
                      Historial de Cambio
-----------------------------------------------------------------------

    Programador               Fecha                      Descripcion
    Arnold Caballero     		07-06-2022                 cambio en agregar la hora exacta a la fecha de las acciones de la bitacora
.

----------------------------------------------------------------------->


<?php
function bitacora($codigoObjeto, $accion,$descripcion){
include 'conexion.php';
//se obtiene el codigo del usuario
$usuario =$_SESSION['vario'];

date_default_timezone_set("America/Guatemala");
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