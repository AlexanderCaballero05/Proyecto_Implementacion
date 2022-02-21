<?php 

class ControladorCategorias{

	static public function ctrMostrarCategorias(){
		
		$respuesta = ModeloCategorias::mdlMostrarCategorias();

		return $respuesta;
	}

	static public function ctrRegistrarCategorias($categoria, $ruta, $estado, $fecha){

		$respuesta = ModeloCategorias::mdlRegistrarCategorias($categoria, $ruta, $estado, $fecha);

		return $respuesta;
	}

	static public function ctrEliminarCategoria($id){

		$respuesta = ModeloCategorias::mdlEliminarCategoria($id);

		return $respuesta;
	}

	static public function ctrActualizarCategoria($id,$categoria, $ruta, $estado, $fecha){

		$respuesta = ModeloCategorias::mdlActualizarCategoria($id,$categoria, $ruta, $estado, $fecha);

		return $respuesta;
	}

}