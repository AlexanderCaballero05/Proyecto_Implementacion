
<?php

class Conexion{

	public function conectar(){	

		$link = new PDO("mysql:host=localhost;dbname=si-ortizindustrial",
						"root",
						""); 

		$link -> exec("set names utf8");

		return $link;

	}

}
?>