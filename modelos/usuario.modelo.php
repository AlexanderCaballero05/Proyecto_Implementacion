<?php

  require_once "conexion1.php";

 class ModeloUsuarios{

	/*=============================================
	MOSTRAR USUARIOS
	=============================================*/

	static public function mdlMostrarUsuarios($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT NOMBRE_USUARIO,CONTRASENA,CODIGO_TIPO_ROL,CODIGO_ESTADO,p.Par_valor FROM $tabla U
			INNER JOIN TBL_PARAMETROS_USUARIOS P ON P.CODIGO_USUARIO = U.CODIGO_USUARIO
			WHERE $item =:$item and P.CODIGO_PARAMETRO = 1;");


			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}
		

		$stmt -> close();

		$stmt = null;

	}

	static public function mdlMostrarparametros($ta, $ite, $val){

		if($ite != null){

			$stmt = Conexion::conectar()->prepare("SELECT VALOR FROM $ta WHERE $ite = :$ite");

			$stmt -> bindParam(":".$ite, $val, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $ta");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}
		

		$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	REGISTRO DE USUARIO
	=============================================*/

// 	static public function mdlIngresarUsuarios($tabla,$datos){

// 		$stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(user_cod_usuario,emp_cod_empleados,user_usuario,user_contraseña,user_tipo_usuario,user_estado) VALUES (null,:emp_cod_empleados,:user_usuario,:user_contraseña,:user_tipo_usuario,:user_estado");

// 		$stmt->bindParam(":emp_cod_empleados",$datos["emp_cod_empleados"],PDO::PARAM_STR);
// 		$stmt->bindParam(":user_usuario",$datos["user_usuario"],PDO::PARAM_STR);
// 		$stmt->bindParam(":user_contraseña",$datos["user_contraseña"],PDO::PARAM_STR);
// 		$stmt->bindParam(":user_tipo_usuario",$datos["user_tipo_usuario"],PDO::PARAM_STR);
// 		$stmt->bindParam(":user_estado",$datos["user_estado"],PDO::PARAM_STR);

// 		if ($stmt->execute()) 
// 		{
			
// 			return "ok";

// 		} else {
			
// 			return "error";
		
// 		}
// 		$stmt -> close ();

// 		$stmt = null;
// 	}

 }