<?php 
require_once "controladores/plantilla.controlador.php";
require_once "controladores/usuario.controlador.php";
//require_once "modelos/plantilla.modelo.php";

$plantilla = new ControladorPlantilla();
$plantilla -> ctrPlantilla();
?>