<?php

require_once "../controladores/usuario.controlador.php";
require_once "../modelos/usuarios.modelo.php";

class AjaxUsuarios{

/*=============================================
	EDITAR USUARIO
=============================================*/

	public $idUsuario;

	public function ajaxEditarUsuario(){

		$item = "Codigo_Usuario";
		$valor = $this->idUsuario;

		$respuesta = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);

		echo json_encode($respuesta);

	}

}

/*=============================================
	EDITAR USUARIO
=============================================*/
if (isset($_POST["idUsuario"])){

	$editar = new AjaxUsuarios();
	$editar -> idUsuario = $_POST["idUsuario"];
	$editar -> ajaxEditarUsuario();

}

