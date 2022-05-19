<?php

ob_start();
date_default_timezone_set("America/Guatemala");
?>
<?php
include('conexion.php');
include('conexion2.php'); 
if (isset($_POST['reporteHistoricoEspiritual'])) {
	$persona =($_POST['reporteHistoricoEspiritual']);
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
    text-align: center;
  }
  thead{
    background-color:#F4F8F9;
  }
    #caja1{
    float:left;
    }
    #caja2{
    float:right;
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
   bottom: 1cm; 
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
  .c1{
    width: 706px;
    margin:2px;
    padding: 10px;
    margin: 8px;
    border: 1px solid #404141;
  }
  
  .pagenum:before {
        content: counter(page);
    }
    </style>
    <title>Historial psicologico paciente</title>
  </head>
  <body>
    <header>
      <p font face="Arial"  style="text-align: center; font-size:20px"><b>PROYECTO SEMILLERO CARMELITANO PROSECAR</b> <img></p>
      <p  style="text-align: center; font-size: 18px;">Historial espiritual de la persona</p>
      <p  style="font-size: 13px;"> Fecha: <?php  echo date("d/m/Y | g:i:a");?></p>
      
    </header>
    
   

   <footer>
     <p style="text-align: center; "><b> Prosecar © Todos los derechos reservados <?php  echo date("Y");?> </b><b style="color:white;">letras pra rellenar para </b>
      <label >Página<span  class="pagenum"></label></p>
   </footer>
   <main>
    <fieldset>
      <?php
      $query = "SELECT  p.DNI, p.FECHA_NACIMIENTO,CONCAT_WS(' ', p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO) AS NOMBRE 
      FROM tbl_persona p, tbl_expediente_espiritual ex
           where ex.CODIGO_PERSONA = p.CODIGO_PERSONA
            AND ex.CODIGO_PERSONA = '$persona' ";
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
      <legend>  Datos Personales</legend><br>
      <label  ><b>Nombre completo:</b> </label><?php  echo ucwords(strtolower($nombre)); ?> <br>
      <label  ><b>DNI: </b></label> <?php echo $dni; ?><br>
      <label  ><b>Edad: </b></label><?php echo $edad . " años"; ?><br>
    </fieldset>
    <br>
    <fieldset>
      <legend>Expediente Espiritual</legend>
    <br>
    <table>
    <?php
       $consulta = "SELECT exp.CODIGO_EXPEDIENTE, exp.NOMBRE_IGLESIA, exp.GRUPO_IGLESIA, exp.TIEMPO_ASISTIR_IGLESIA, exp.MOTIVACION_IGLESIA
       FROM tbl_expediente_espiritual exp
       WHERE CODIGO_PERSONA = '$persona';";
       $resul=$conn->query($consulta);
       if ($resul->num_rows > 0) {
        while($row = $resul->fetch_assoc()) { 
            $var1 = $row['NOMBRE_IGLESIA'];
            $var2 = $row['GRUPO_IGLESIA'];
            $var3 = $row['TIEMPO_ASISTIR_IGLESIA'];
            $var4 = $row['MOTIVACION_IGLESIA'];
       
        ?>
      <thead>
         <tr>
           <th>Nombre Iglesia</th>
           <th>Grupo_iglesia</th>
           <th>Tiempo de asistir</th>
           <th>Motivacion en la iglesia</th>
          
         </tr>
      </thead>
      <tbody>
         <tr>
         <td ><?php echo ucwords(strtolower($var1)); ?></td>
         <td ><?php echo ucwords(strtolower($var2)); ?></td>
         <td ><?php echo ucwords(strtolower($var3)); ?></td>
         <td ><?php echo ucwords(strtolower($var4)); ?></td>
         
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
        $consulti = "SELECT con.FECHA_CREACION, con.MOTIVO_CONSULTA, con.OBSERVACIONES
        FROM tbl_inscripcion_cita i, tbl_persona pe ,tbl_consulta_espiritual con
        WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                                   AND con.CODIGO_CITA = i.CODIGO_CITA
                                     AND pe.CODIGO_PERSONA = '$persona'
                                         AND  i.AREA_CITA = '4';";
        $resul=$conn->query($consulti);
      ?>
      
      
      <?php
        if ($resul->num_rows > 0) {
          while($row = $resul->fetch_assoc()) { 
            $motivo_consulta = $row['MOTIVO_CONSULTA'];
            $observaciones_espiritual = $row['OBSERVACIONES'];
             $fecha = $row['FECHA_CREACION'];

         
         
      ?>
  

<div class="caja3"><!--no quiere hacer caso esta cajita :/ -->
<div style="background-color: #2FB8F6;padding: 3.5px; text-align:center; color:#FBFBFB;"><label style="font-size: 18px;">Cita espiritual <?php echo $fecha;?></label></div>
      <p><b>Datos consulta Espiritual</b></p><hr><br>
      <div class="c1" ><label><b>Motivo consulta</b></label> 
        <?php  echo ucwords(strtolower($motivo_consulta)) ?> 
      </div>
      <div class="c1" > <label><b>Observaciones</b></label> <?php  echo ucwords(strtolower($observaciones_espiritual))  ?></div>
      <div>
     <br>



      
      
        
    <?php
       }
       }
      ?>

      




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