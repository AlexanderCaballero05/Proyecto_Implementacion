<?php
include './Connet.php';
$restorePoint=SGBD::limpiarCadena($_POST['restorePoint']);
$sql=explode(";",file_get_contents($restorePoint));
$totalErrors=0;
set_time_limit (60);
$con=mysqli_connect('localhost','root', '', 'db_proyecto_prosecar');
$con->query("SET FOREIGN_KEY_CHECKS=0");
for($i = 0; $i < (count($sql)-1); $i++){
    if($con->query($sql[$i].";")){  
    }else{ 
        $totalErrors++; 
    }
}
$con->query("SET FOREIGN_KEY_CHECKS=1");
$con->close();

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
    $TRIGGER16=$conn->query($TRIGGER_ASIGNAR_PARAMETROS);

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




  
  
