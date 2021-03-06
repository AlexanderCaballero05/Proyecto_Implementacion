<?php 
require_once "modelos/function_bitacora.php";
require_once "controladores/plantilla.controlador.php";
require_once "controladores/usuario.controlador.php";
require_once "modelos/usuario.modelo.php";
require_once "modelos/personas.modelo.php";
require_once "modelos/estudiantes.modelo.php";
require_once "modelos/crudespecialidad.modelo.php";
require_once "modelos/crudobjetosmodelo.php";
require_once "modelos/crudpersonasmodelo.php";
require_once "modelos/crudsocioeconomicomodelo.php";
require_once "modelos/crudparamusuario.modelo.php";
require_once "modelos/crudRoles.modelo.php";
require_once "modelos/estado.modelo.php";
require_once "modelos/crudTutoria.modelo.php";
require_once "modelos/crudPermisos.modelo.php";
require_once "modelos/crudpreguntasmodelo.php";
require_once "modelos/crudPreguntasUsuarios.modelo.php";
require_once "modelos/crudmodalid.php";
require_once "modelos/crudtipopersonamode.php";
require_once "modelos/crudEstudiante.modelo.php";
require_once "modelos/crudParametros.modelo.php";
require_once "modelos/crudPrueba.modelo.php";
require_once "modelos/perfilUsuario.modelo.php";
require_once "modelos/procesoCarga.modelo.php";
require_once "modelos/procesoConsulta.modelo.php";
require_once "modelos/procesoPreClinica.modelo.php";
require_once "modelos/ProcesoCitasMedicas.modelo.php";
require_once "modelos/procesoConsultaEspiritual.modelo.php";
require_once "modelos/ProcesoExpedienteMedico.modelo.php";
require_once "modelos/ProcesoExpedientePsicologico.modelo.php";
require_once "modelos/procesoRecetaMedica.modelo.php";
require_once "modelos/area.modelo.php";
require_once "modelos/tiposangremodelo.php";
require_once "modelos/crudSacramento.modelo.php";
require_once "modelos/crudSeccion.modelo.php";
require_once "modelos/crudconsultahistorica.php";
require_once "modelos/crudAparienciaFisica.modelo.php";
require_once "modelos/crudExamenesMedicos.modelo.php";
require_once "modelos/procesoMatricula.modelo.php";
require_once "modelos/crudcitasgeneralesmodelo.php";

//require_once "modelos/crudrecetamedica.modelo.php";
require_once "modelos/crudmedicamento.modelo.php";

require_once "modelos/crudAlergia.modelo.php";
require_once "modelos/familiaresmodelo.php";
require_once "modelos/familiaresEstudiantes.modelo.php";
require_once "modelos/crudParentesco.modelo.php";
require_once "modelos/inscripcioncita.php";
require_once "modelos/procesoconsultapsicologia.php";

require_once "modelos/crudTranstornos.modelo.php";
require_once "modelos/crudPersonaEspecialidad.modelo.php";
require_once "modelos/crudContenidoEconomico.modelo.php";
require_once "modelos/crudExpedientePsicoUnico.modelo.php";
require_once "modelos/procesoPlanTerapeutico.modelo.php";
require_once "modelos/crudsintomasneuroticosmodelo.php";





$plantilla = new PlantillaControlador();
$plantilla->plantilla();
?>