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


if (isset($_POST['reporte_estudiante'])) {
	$persona =($_POST['reporte_estudiante']);
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
  table ,th,td{
    width: 100%;
    border-collapse: collapse;
    border: 0.5px solid #AFB5B8;
    background-color:#FFFF;

  }
  th,td{
    padding:8px;
  }
  thead{
    background-color:#F4F8F9;
  }
    #caja1{
    float:left;
    }
    #caja2{
    float:left;
    }
    #caja3{
      clear:both;
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
  .c{
    width: 24.5%;
    margin:2px;
    min-width: 24.5%;
    min-height: 200px;
  }
  .c1{
    width: 12%;
    margin:10px;
    max-width: 12%;
    min-height: 40px;
  }
  .c2{
    width: 49.5%;
    margin:2px;
    min-width: 49.5%;
    min-height: 200px;

  }
    </style>
    <title>Reporte paciente uwu</title>
  </head>
  <body>
    <header>
      <p font face="Arial"  style="text-align: center; font-size:20px"><b>PROYECTO SEMILLERO CARMELITANO PROSECAR</b> <img></p>
      <p  style="text-align: center; font-size: 18px;">Reporte estudiante</p>
      <p  style="font-size: 13px;"> Fecha: <?php  echo date("d/m/Y | g:i:a");?></p>
    </header>
    
   

   <footer>
      <p style="  text-align: center;"><b> Prosecar © Todos los derechos reservados.</b></p> 
   </footer>
   <main>
    <fieldset>
      <?php
      $query = "SELECT CONCAT_WS(' ', p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO) AS NOMBRE, p.DNI, p.FECHA_NACIMIENTO 
      FROM tbl_persona p ,tbl_estudiante es
           where es.CODIGO_PERSONA = p.CODIGO_PERSONA
           AND CODIGO_ESTUDIANTE = '$persona' ";
    $resul=$conn->query($query);  
    if($resul->num_rows > 0){
      while($row = $resul->fetch_assoc()){
        $nombre = $row['NOMBRE'];
        $dni = $row['DNI'];
        $fecha = $row['FECHA_NACIMIENTO'];
        $fechaEntera = strtotime($fecha);
        $f = date("Y");
        $anio = date("Y", $fechaEntera);
        $edad = $f - $anio;

      }
    }
      ?>      
      <legend>  Datos Personales Paciente</legend><br>
      <label  ><b>Nombre completo:</b> </label><?php  echo ucwords(strtolower($nombre)); ?> <br>
      <label  ><b>DNI: </b></label> <?php echo $dni; ?><br>
      <label  ><b>Edad: </b></label><?php echo $edad . " años"; ?><br>
    </fieldset>
    <br>
    <fieldset>
      <legend>Datos Escolares</legend>
    <br>
    <table>
    <?php
       $consulta = "SELECT  es.GRADO_ACTUAL, es.REPITENTE, es.INDICE_ACADEMICO, es.MATE_BAJO_RENDI, es.PASATIEMPOS,
       es.DISTRACTORES_ESCOLARES, es.METAS
          FROM tbl_estudiante es
          WHERE es.CODIGO_ESTUDIANTE = '$persona'";
       $resul=$conn->query($consulta);
       if ($resul->num_rows > 0) {
        while($row = $resul->fetch_assoc()) { 
        $var1 = $row['GRADO_ACTUAL'];
        $var2 = $row['REPITENTE'];
        $var3 = $row['INDICE_ACADEMICO'];
        $var4 = $row['MATE_BAJO_RENDI'];
        $var5 = $row['PASATIEMPOS'];
        $var6 = $row['DISTRACTORES_ESCOLARES'];
        $var7 = $row['METAS'];
       
        ?>
      <thead>
         <tr>
           <th>Grado Actual</th>
           <th>Reitente</th>
           <th>Indice Academico</th>
           <th>Materias</th>
           <th>Pasatiempos</th>
           <th>Distractores</th>
           <th>Metas</th>
          
         </tr>
      </thead>
      <tbody>
         <tr>
         <td ><?php echo ucwords(strtolower($var1)); ?></td>
         <td ><?php echo ucwords(strtolower($var2)); ?></td>
         <td ><?php echo ucwords(strtolower($var3)); ?></td>
         <td ><?php echo ucwords(strtolower($var4)); ?></td>
         <td ><?php echo ucwords(strtolower($var5)); ?></td>
         <td ><?php echo ucwords(strtolower($var6)); ?></td>
         <td ><?php echo ucwords(strtolower($var7)); ?></td>
         
         </tr>
         <?php
           }
           }
         ?>
      </tbody>
    </table>
    </fieldset>
    <br>



<?php
    $sentencia = $db->prepare("SELECT GROUP_CONCAT(con.NOMBRE_TIPO) as DISPOSITIVOS
    FROM tbl_estudiante_socioeconomico es, tbl_contenido_socioeconomico con, tbl_tipo_socioeconomico tip
    WHERE es.CODIGO_CONTENIDO_SOCIOECONOMICO = con.CODIGO_CONTENIDO_SOCIOECONOMICO
    AND con.CODIGO_TIPOSOCIO = tip.CODIGO_TIPOSOCIO
    AND con.CODIGO_TIPOSOCIO = 1
    AND es.CODIGO_ESTUDIANTE = (?); " );
	 $sentencia->execute(array($persona));
	 $row=$sentencia->fetchColumn();
	 if($row>0){
	   $dispositivos = $row;
	 }



     $sentencia = $db->prepare("SELECT GROUP_CONCAT(con.NOMBRE_TIPO) as SERVICIOS
     FROM tbl_estudiante_socioeconomico es, tbl_contenido_socioeconomico con, tbl_tipo_socioeconomico tip
     WHERE es.CODIGO_CONTENIDO_SOCIOECONOMICO = con.CODIGO_CONTENIDO_SOCIOECONOMICO
     AND con.CODIGO_TIPOSOCIO = tip.CODIGO_TIPOSOCIO
     AND con.CODIGO_TIPOSOCIO = 2
     AND es.CODIGO_ESTUDIANTE = (?); " );
      $sentencia->execute(array($persona));
      $row=$sentencia->fetchColumn();
      if($row>0){
        $servcios = $row;
      }


      $sentencia = $db->prepare("SELECT GROUP_CONCAT(con.NOMBRE_TIPO) as PROVEEDOR
      FROM tbl_estudiante_socioeconomico es, tbl_contenido_socioeconomico con, tbl_tipo_socioeconomico tip
      WHERE es.CODIGO_CONTENIDO_SOCIOECONOMICO = con.CODIGO_CONTENIDO_SOCIOECONOMICO
      AND con.CODIGO_TIPOSOCIO = tip.CODIGO_TIPOSOCIO
      AND con.CODIGO_TIPOSOCIO = 3
      AND es.CODIGO_ESTUDIANTE = (?); " );
       $sentencia->execute(array($persona));
       $row=$sentencia->fetchColumn();
       if($row>0){
         $proveedor = $row;
       }


       $sentencia = $db->prepare("SELECT GROUP_CONCAT(con.NOMBRE_TIPO) as SERVICIOS
       FROM tbl_estudiante_socioeconomico es, tbl_contenido_socioeconomico con, tbl_tipo_socioeconomico tip
       WHERE es.CODIGO_CONTENIDO_SOCIOECONOMICO = con.CODIGO_CONTENIDO_SOCIOECONOMICO
       AND con.CODIGO_TIPOSOCIO = tip.CODIGO_TIPOSOCIO
       AND con.CODIGO_TIPOSOCIO = 4
       AND es.CODIGO_ESTUDIANTE = (?); " );
        $sentencia->execute(array($persona));
        $row=$sentencia->fetchColumn();
        if($row>0){
          $basicos = $row;
        }

?>
    <fieldset>
      <legend>Datos Socieconomicos</legend>
    <br>
    <table>
      <thead>
         <tr>
           <th>Dispositivos electronicos</th>
           <th>Servicios de internet</th>
           <th>Proveedor(es)</th>
           <th>Servicios Basicos</th>
          
         </tr>
      </thead>
      <tbody>
         <tr>
         <td ><?php echo ucwords(strtolower($dispositivos)); ?></td>
         <td ><?php echo ucwords(strtolower($servcios)); ?></td>
         <td ><?php echo ucwords(strtolower($proveedor)); ?></td>
         <td ><?php echo ucwords(strtolower($basicos)); ?></td>
         
         </tr>
         
      </tbody>
    </table>
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

$dompdf->setPaper('a4','landscape');
$dompdf->render();

$dompdf->stream("reporte.pdf", array("Attachment" => false));
echo $dompdf->output();
?>