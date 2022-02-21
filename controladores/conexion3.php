<?php

class Conexion{

	static public function conectar(){	

		$base = new PDO("mysql:host=localhost;dbname=db_proyecto_prosecar",
						"root",
						""); 

		$base -> exec("set names utf8");

		return $base;
	}

}
?>