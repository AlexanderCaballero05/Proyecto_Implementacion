<?php

class Conexion{

	static public function conectar(){	

		$base = new PDO("mysql:host=localhost;dbname=db_Proyecto_Prosecar",
						"root",
						""); 

		$base -> exec("set names utf8");

		return $base;
	}

}
?>
