<?php

    include('../Vistas/modulos/conexionpdo.php');
    session_start();
    $usuario= $_SESSION['vario'];
    //Consulta que trae el codigo del usuario
    $sentencia1 = $db->prepare("SELECT p.CODIGO_PERSONA
    FROM tbl_usuario u, tbl_persona p 
    WHERE u.CODIGO_PERSONA = p.CODIGO_PERSONA
    AND NOMBRE_USUARIO = (?);");
    $sentencia1->execute(array($usuario));
    $cod_usuario=$sentencia1->fetchColumn();
?>
<?php

ob_start();
date_default_timezone_set("America/Guatemala");
?>


<?php
include('conexion.php');
include('conexion2.php'); 
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "db_proyecto_Prosecar";
try {
    $db= new PDO( "mysql:host=localhost;dbname=db_proyecto_prosecar",
                  "root",
                  "", 
                  array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));           
} catch (PDOException $e) {
    echo "ERROR DE CONEXION DE: ".$e->getMessage();
}


   
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <style type="text/css">
  fieldset {
    background-color: #FBFBFB;
  }
  legend {
    background-color: #04B6F6;
    color: white;
    padding: 2px 9px;
  }
  body {
    margin-top: 4cm;
    margin-left: 1cm;
    margin-right: 1cm;
    margin-bottom: 2cm;
  }
  @page {
    margin: 0cm 0cm;
  }
  
  footer {
   position: fixed; 
   bottom: 0.5cm; 
   left: 0cm; 
   right: 0cm;
   height: 1cm;
  }
   header {
    position: fixed;
    top: 0.5cm;
    left: 1cm;
    right: 0cm;
    height: 4cm;
  }
  .pagenum:before {
     content: counter(page);
  }
  img{
    float: right;
    width: 70px; 
    padding-right: 1.5cm;
  }
    </style>
    <title>Reporte Cita Psicológica</title>
  </head>
  <body>
    <header>
      <img src="../Vistas/modulos/REPORTES/img/LOGO.jpg">
      <p font face="Arial"  style="text-align: center; font-size:20px"><b>PROYECTO SEMILLERO CARMELITANO PROSECAR</b> <img></p>
      <p  style="text-align: center; font-size: 18px;">Reporte de Cita Psicológica</p>
      <p  style="font-size: 13px;"> Fecha: <?php  echo date("d/m/Y | g:i:a");?></p>
    </header>
    <footer style="text-align: center;">
      <label style="text-align: center;">Página<span  class="pagenum"></label></p>
   </footer>
   <main>
    <fieldset>
      <?php
      $query = "SELECT CONCAT_WS(' ', p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO) AS NOMBRE,
       p.DNI, 
      concat_ws(' ', p.LUGAR_NACIMIENTO, p.FECHA_NACIMIENTO) as LUGAR_NACIMIENTO,
       p.FECHA_NACIMIENTO, tel.NUMERO_TELEFONO, co.CORREO_PERSONA,
        se.SEXO ,p.DIRECCION
       FROM tbl_persona p 
        left join  tbl_telefono tel          ON p.CODIGO_PERSONA = tel.CODIGO_PERSONA
        left join  tbl_correo_electronico co on p.CODIGO_PERSONA = co.CODIGO_PERSONA
        left join tbl_sexo se                on p.SEXO = se.CODIGO_SEXO
        where p.CODIGO_PERSONA ='$cod_usuario'
        GROUP BY p.CODIGO_PERSONA ";
    $resul=$conn->query($query);  
    if($resul->num_rows > 0){
      while($row = $resul->fetch_assoc()){
        $nombre = $row['NOMBRE'];
        $dni = $row['DNI'];
        $sexo = $row['SEXO'];
        $fecha = $row['FECHA_NACIMIENTO'];
        $lugar = $row['LUGAR_NACIMIENTO'];
        $telefono = $row['NUMERO_TELEFONO'];
        $correo = $row['CORREO_PERSONA'];
        $direccion = $row['DIRECCION'];

        $fechaEntera = strtotime($fecha);
        $f = date("Y");
        $anio = date("Y", $fechaEntera);
        $edad = $f - $anio;

      }
    }
      ?> 
       <?php
      if (isset($_POST['reporte'])) {
        $cod_cita=($_POST['reporte']);
    }
       $consulta = "SELECT  IC.CODIGO_CITA,
       P.CODIGO_PERSONA,
       IC.FECHA_CITA,
       IC.HORARIO,
       IC.CODIGO_PERSONA, 
       IC.CODIGO_ESPECIALISTA,
       CONCAT_WS(' ',P.PRIMER_NOMBRE, P.SEGUNDO_NOMBRE, P.PRIMER_APELLIDO,P.SEGUNDO_APELLIDO) AS 
       MEDICO, 
       CONCAT_WS(' ',OT.PRIMER_NOMBRE, OT.SEGUNDO_NOMBRE, OT.PRIMER_APELLIDO,OT.SEGUNDO_APELLIDO) AS 
       PACIENTE, 
       IC.CODIGO_ESTADO,
       est.NOMBRE as nombre_estado,
       ar.NOMBRE as nombre_area, 
       espe.NOMBRE as nombre_especialidad
      FROM tbl_inscripcion_cita IC 
      left join tbl_persona_especialidad E   on IC.CODIGO_ESPECIALISTA = E.CODIGO_PERSONA_ESPECIALIDAD 
      left join  tbl_persona P               on P.CODIGO_PERSONA = E.CODIGO_PERSONA
      left join tbl_persona OT               on OT.CODIGO_PERSONA = IC.CODIGO_PERSONA 
      left join tbl_area a                   on IC.AREA_CITA = a.CODIGO_AREA 
      left join tbl_estado est               on IC.CODIGO_ESTADO = est.CODIGO_ESTADO
      left join tbl_area ar                  on IC.AREA_CITA = ar.CODIGO_AREA 
      left join tbl_especialidad espe        on E.CODIGO_ESPECIALIDAD = espe.CODIGO_ESPECIALIDAD   
      where   IC.CODIGO_CITA = $cod_cita;";
       $resul=$conn->query($consulta);
       if ($resul->num_rows > 0) {
        while($row = $resul->fetch_assoc()) { 
          $var1 = $row['FECHA_CITA'];
          $var2 = $row['HORARIO'];
          $var3 = $row['MEDICO'];
          $var4 = $row['PACIENTE'];
          $var5 = $row['nombre_especialidad'];
          $var6 = $row['nombre_area'];
           }
           }
         ?>     
      <legend>  Datos Personales Estudiante</legend><br>
      <label style="margin-bottom: 100px;" ><b>Nombre Completo:</b> <?php  echo ucwords(strtolower($nombre)); ?> </label><br>
      <label style="margin-bottom: 30px;" ><b>Lugar y fecha Nacimiento:</b> <?php  echo ucwords(strtolower($lugar)); ?></label> <br>
      <label style="padding-right: 80px;" ><b>DNI: </b><?php echo $dni; ?></label>
      <label style="padding-right: 110px;"><b>Edad: </b><?php echo $edad . " años"; ?></label>
      <label ><b>Sexo: </b><?php echo ucwords(strtolower($sexo)); ?></label><br>
      <label style="padding-right: 85px;" ><b>Teléfono: </b><?php echo $telefono; ?></label>
      <label><b>Correo: </b><?php echo $correo; ?></label><br>
      <label style="margin-bottom: 30px;" ><b>Dirección:</b> <?php  echo ucwords(strtolower($direccion)); ?></label> <br>
    </fieldset>
    <br>
    <fieldset>
      <legend>Información de la Cita</legend><br>
      <label style="margin-bottom: 100px;" ><b>Fecha de la Cita:</b> <?php  echo ucwords(strtolower($var1)); ?></label> <br>
      <label style="margin-bottom: 100px;" ><b>Hora de la Cita:</b> <?php  echo ucwords(strtolower($var2)); ?></label> <br>
      <label style="margin-bottom: 100px;" ><b>Especialista de la Cita:</b> <?php  echo ucwords(strtolower($var3)); ?></label> <br>
      <label style="margin-bottom: 100px;" ><b>Especialidad de la Cita:</b> <?php  echo ucwords(strtolower($var5)); ?></label> <br>
      <label style="margin-bottom: 100px;" ><b>Área de la Cita:</b> <?php  echo ucwords(strtolower($var6)); ?></label> <br>
    </fieldset>
      
   </main>

    
  </body>
</html>
<?php
require_once '../libreria_reportes/dompdf/autoload.inc.php';
use Dompdf\Dompdf;
$html = ob_get_clean();
//echo $html;



$dompdf = new Dompdf();

$options = $dompdf->getOptions();
$options->set(array('isRemoteEnabled' => true));
$dompdf ->setOptions($options);

$dompdf ->loadHtml($html);

$dompdf->setPaper('letter');
$dompdf->render();

$dompdf->stream("reporte.pdf", array("Attachment" => false));
echo $dompdf->output();
?>