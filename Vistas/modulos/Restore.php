<!-- 
-----------------------------------------------------------------------
        Universidad Nacional Autonoma de Honduras (UNAH)
	            	Facultad de Ciencias Economicas
          Departamento de Informatica administrativa
         Analisis, Programacion y Evaluacion de Sistemas
                   Segundo Periodo 2022

  Equipo:
  Arnold Alexander Caballero Garcia (aacaballero@unah.hn)
  Luz Maria Montoya Medina (luz.montoya@unah.hn)
  Diana Rut Garcia Amador (drgarciaa@unah.hn)
  Any Melissa Hernandez (anyhernandez@unah.hn)
  Gissela Yamileth Diaz (gdiaza@unah.hn)
  Cesar Fernando Rovelo (Cesar.rovelo@unah.hn)

  Catedratico:
  Lic. Claudia Nuñez (Analisis)
  Lic. Giancarlo Martini Scalici Aguilar (Implementación)
  Lic. Karla Melisa Garcia Pineda (Evaluación)

---------------------------------------------------------------------
---------------------------------------------------------------------
Programa:          Codigo que valida la restauración de los de datos
Fecha:             01-06-2022
Programador:       Arnold Caballero
descripcion:       Codigo que valida la restauración de los de datos 
-----------------------------------------------------------------------
Historial de Cambio
-----------------------------------------------------------------------
Programador               Fecha                      Descripcion

----------------------------------------------------------------------->

<?php
include './Connet.php';
$restorePoint=SGBD::limpiarCadena($_POST['restorePoint']);
$sql=explode(";",file_get_contents($restorePoint));
$totalErrors=0;
set_time_limit (60);
$conn=mysqli_connect('localhost','root', '', 'db_proyecto_prosecar');
$conn->query("SET FOREIGN_KEY_CHECKS=0");
for($i = 0; $i < (count($sql)-1); $i++){
    if($conn->query($sql[$i].";")){  
    }else{ 
        $totalErrors++; 
    }
}
$conn->query("SET FOREIGN_KEY_CHECKS=1");
$conn->close();

if($totalErrors>=0){

    include 'conexion3.php';


    $TRIGGER_ASIGNAR_PARAMETROS = "
    CREATE TRIGGER `TRIGGER_ASIGNAR_PARAMETROS` AFTER INSERT ON `tbl_usuario`
    FOR EACH ROW BEGIN
    IF(NEW.Codigo_usuario=1) THEN 
    INSERT INTO tbl_parametros_usuarios(Codigo_usuario, Codigo_parametro,Par_valor) values(NEW.Codigo_usuario,1,0); 
    ELSE INSERT INTO tbl_parametros_usuarios(Codigo_usuario, Codigo_parametro,Par_valor) values(NEW.Codigo_usuario,1,0);
    INSERT INTO tbl_parametros_usuarios(Codigo_usuario, Codigo_parametro,Par_valor) values(NEW.Codigo_usuario,2,0);
     INSERT INTO tbl_parametros_usuarios(Codigo_usuario, Codigo_parametro,Par_valor) values(NEW.Codigo_usuario,3,0);
     INSERT INTO tbl_parametros_usuarios(Codigo_usuario, Codigo_parametro,Par_valor) values(NEW.Codigo_usuario,19,0);
    END IF; END
    
    ";
    $triger1=$conn->query($TRIGGER_ASIGNAR_PARAMETROS);

    
        echo "<script>
        alert('Restauracion completada exitosamente');
        window.location = '../../RestauracionProsecar';
              </script>";

    

    
}else{
    echo  '<script>
    alert("Error al realizar la restauracion del sistema");
    window.location ="../../RestauracionProsecar"
    </script>';
}




  
  
