<?php

require_once "conexion1.php";


class ModeloUsuarios{
    /*=============================================
	MOSTRAR USUARIOS
	===============================================*/

    static public function mdlMostrarUsuarios($tabla, $item, $valor){

        if($item != null){

            $stmt = Conexion::conectar()->prepare("SELECT NOMBRE_USUARIO,CONTRASENA,CODIGO_TIPO_ROL,CODIGO_ESTADO,p.PAR_VALOR
            FROM $tabla u, tbl_parametros_usuarios p
            WHERE p.CODIGO_USUARIO = u.CODIGO_USUARIO 
            AND $item =:$item 
            AND p.CODIGO_PARAMETRO = 1;");


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


        $stmt = Conexion::conectar()->prepare("SELECT VALOR FROM $ta
                                               WHERE $ite = :$ite");

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








 }
















