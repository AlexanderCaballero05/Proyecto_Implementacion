<?php 
require_once "modelos/function_bitacora.php";
require_once "controladores/plantilla.controlador.php";
require_once "controladores/usuario.controlador.php";
require_once "modelos/usuario.modelo.php";
require_once "modelos/personas.modelo.php";
require_once "modelos/crudespecialidad.modelo.php";
require_once "modelos/crudobjetosmodelo.php";
require_once "modelos/crudpersonasmodelo.php";
require_once "modelos/crudsocioeconomicomodelo.php";
require_once "modelos/paramusuario.modelo.php";
require_once "modelos/crudRoles.modelo.php";
require_once "modelos/estado.modelo.php";
require_once "modelos/crudTutoria.modelo.php";
require_once "modelos/crudPermisos.modelo.php";
require_once "modelos/crudpreguntasmodelo.php";
require_once "modelos/crudmodalid.php";
require_once "modelos/crudtipopersonamode.php";
require_once "modelos/crudEstudiante.modelo.php";
require_once "modelos/crudParametros.modelo.php";
require_once "modelos/crudPrueba.modelo.php";
require_once "modelos/perfilUsuario.modelo.php";
require_once "modelos/procesoCarga.modelo.php";
require_once "modelos/procesoPreClinica.modelo.php";
require_once "modelos/ProcesoCitasMedicas.modelo.php";
require_once "modelos/area.modelo.php";
require_once "modelos/procesoMatricula.modelo.php";



require_once "modelos/crudAlergia.modelo.php";

require_once "modelos/familiaresmodelo.php";


require_once "modelos/inscripcioncita.php";






$plantilla = new PlantillaControlador();
$plantilla->plantilla();
?>