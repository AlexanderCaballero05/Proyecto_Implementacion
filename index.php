<?php 
require_once "modelos/function_bitacora.php";
require_once "controladores/plantilla.controlador.php";
require_once "controladores/usuario.controlador.php";
require_once "modelos/usuario.modelo.php";
require_once "modelos/personas.modelo.php";
require_once "modelos/crudRoles.modelo.php";
require_once "modelos/estado.modelo.php";
require_once "modelos/crudTutoria.modelo.php";
require_once "modelos/crudPermisos.modelo.php";

require_once "modelos/crudEstudiante.modelo.php";
require_once "modelos/crudParametros.modelo.php";
require_once "modelos/procesoCarga.modelo.php";







$plantilla = new PlantillaControlador();
$plantilla->plantilla();