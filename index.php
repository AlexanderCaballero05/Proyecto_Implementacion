<?php 
require_once "modelos/function_bitacora.php";
require_once "controladores/plantilla.controlador.php";
require_once "controladores/usuario.controlador.php";
require_once "modelos/usuario.modelo.php";
require_once "modelos/personas.modelo.php";
require_once "modelos/rol.modelo.php";
require_once "modelos/crudobjetosmodelo.php";
require_once "modelos/crudpersonasmodelo.php";
require_once "modelos/crudsocioeconomicomodelo.php";

$plantilla = new PlantillaControlador();
$plantilla->plantilla();
?>