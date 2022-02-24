<?php
include_once 'modelos/function_bitacora.php'; 
require_once "controladores/plantilla.controlador.php";
require_once "controladores/usuario.controlador.php";
require_once "modelos/usuario.modelo.php";

$plantilla = new PlantillaControlador();
$plantilla->plantilla();