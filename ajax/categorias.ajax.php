<?php 

require_once "../controladores/categorias.controlador.php";
require_once "../modelos/categorias.modelo.php";

class ajaxCategorias{

	public $id;
	public $categoria;
	public $ruta;
	public $estado;
	public $fecha;

	public function MostrarCategorias(){

		$respuesta = ControladorCategorias::ctrMostrarCategorias();

		echo json_encode($respuesta);
	}

	public function registrarCategorias(){
		
		$respuesta = ControladorCategorias::ctrRegistrarCategorias($this->categoria, $this->ruta, $this->estado, $this->fecha);

		echo json_encode($respuesta,JSON_UNESCAPED_UNICODE);
	}

	public function eliminarCategoria(){
		
		$respuesta = ControladorCategorias::ctrEliminarCategoria($this->id);

		echo json_encode($respuesta,JSON_UNESCAPED_UNICODE);
	}

	public function actualizarCategoria(){
		
		$respuesta = ControladorCategorias::ctrActualizarCategoria($this->id,$this->categoria, $this->ruta, $this->estado, $this->fecha);

		echo json_encode($respuesta,JSON_UNESCAPED_UNICODE);
	}
	
}

if(!isset($_POST["accion"])){
	$respuesta = new ajaxCategorias();
	$respuesta -> MostrarCategorias();
}else{

	if($_POST["accion"] == "registrar"){
		$insertar = new ajaxCategorias();
		$insertar->categoria = $_POST["categoria"];
		$insertar->ruta = $_POST["ruta"];
		$insertar->estado = $_POST["estado"];
		$insertar->fecha = $_POST["fecha"];
		$insertar->registrarCategorias();
	}

	if($_POST["accion"] == "eliminar"){
		$eliminar = new ajaxCategorias();

		$eliminar->id = $_POST["id"];
		
		$eliminar->eliminarCategoria();
	}

	if($_POST["accion"] == "actualizar"){
		$actualizar = new ajaxCategorias();

		$actualizar->id = $_POST["id"];
		$actualizar->categoria = $_POST["categoria"];
		$actualizar->ruta = $_POST["ruta"];
		$actualizar->estado = $_POST["estado"];
		$actualizar->fecha = $_POST["fecha"];
		
		$actualizar->actualizarCategoria();
	}

}




