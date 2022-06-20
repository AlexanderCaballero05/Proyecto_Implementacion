<?php

ob_start();
date_default_timezone_set("America/Guatemala");
?>
<?php
include('conexion.php');
include('conexion2.php'); 
if (isset($_POST['id_persona_plan'])) {
	$persona =($_POST['id_persona_plan']);
    $cod_usuario = ($_POST['id_usuario_plan']);
    $codigo_cita = ($_POST['codigo_cita_reporte_Plan']);
    $codigo_consulta = ($_POST['codigo_consulta_reporte_Plan']);
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
    width: 706px;
    margin:2px;
    padding: 10px;
    margin: 8px;
    border: 1px solid #404141;
  }
  img{
    float: right;
    width: 70px; 
    padding-right: 1.5cm;
  }
  .pagenum:before {
        content: counter(page);
    }
  
    </style>
    <title>Reporte paciente psicologia</title>
  </head>
  <body>
    <header>
    <img src="../Vistas/modulos/REPORTES/img/LOGO.jpg">
      <p font face="Arial"  style="text-align: center; font-size:20px"><b>PROYECTO SEMILLERO CARMELITANO PROSECAR</b> <img></p>
      <p  style="text-align: center; font-size: 20px;">Consulta Psicológica del Paciente</p>
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
      FROM tbl_persona p ,tbl_expediente_psicologico_unico ex
           where ex.CODIGO_PERSONA = p.CODIGO_PERSONA AND ex.CODIGO_PERSONA = '$persona' ";
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
      <legend>Expediente Psicológico</legend>
    <br>
    <table>
    <?php
       $consulta = "SELECT exp.CODIGO_EXPEDIENTE, concat(per.PRIMER_NOMBRE,' ',per.PRIMER_APELLIDO) as nombr, exp.ANTECEDENTES_FAMILIARES, 
       exp.ANTECEDENTES_PERSONALES, exp.ANTECEDENTES_CLINICOS, GROUP_CONCAT(sin.TIPO) as TIPO
       FROM tbl_expediente_psicologico_unico exp, tbl_persona per, tbl_personas_sintomas psin, tbl_sintomas_neuroticos sin            			       
       WHERE exp.CODIGO_PERSONA = per.CODIGO_PERSONA
       AND exp.CODIGO_EXPEDIENTE = psin.CODIGO_EXPEDIENTE
       AND psin.CODIGO_SINTOMA_NEUROTICO = sin.CODIGO_SINTOMA_NEUROTICO
       AND exp.CODIGO_PERSONA = '$persona'";
       $resul=$conn->query($consulta);
       if ($resul->num_rows > 0) {
        while($row = $resul->fetch_assoc()) { 
        $var1 = $row['ANTECEDENTES_FAMILIARES'];
        $var2 = $row['ANTECEDENTES_PERSONALES'];
        $var3 = $row['ANTECEDENTES_CLINICOS'];
        $var4 = $row['TIPO'];
       
        ?>
      <thead>
         <tr>
           <th>Antecedentes Familiares</th>
           <th>Antecedentes Personales</th>
           <th>Antecedentes Clínicos</th>
           <th>Síntomas Neuróticos</th>
          
         </tr>
      </thead>
      <tbody>
         <tr>
         <td ><?php echo (strtolower($var1)); ?></td>
         <td ><?php echo (strtolower($var2)); ?></td>
         <td ><?php echo (strtolower($var3)); ?></td>
         <td ><?php echo (strtolower($var4)); ?></td>
         
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
        $consulti = "SELECT con.FECHA_CREACION, con.SINTOMAS, con.DIAGNOSTICO_INGRESO, con.DIAGNOSTICO_EGRESO, con.OBSEVARCIONES,plan.CODIGO_CONSULTA , plan.ACTIVIDAD, plan.TECNICA, plan.MATERIALES, plan.TAREAS, plan.RESULTADOS
        FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_persona_especialidad es, tbl_estado est, tbl_expediente_psicologico_consulta con, tbl_plan_terapeutico plan
                              WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                                AND i.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
                                  AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
                                    AND con.CODIGO_CITA = i.CODIGO_CITA
                                     AND con.CODIGO_EXPEDIENTE_PSICO = plan.CODIGO_CONSULTA
                                         AND es.CODIGO_PERSONA = '$cod_usuario'
                                           AND i.CODIGO_ESTADO = '16' 
                                             AND  i.AREA_CITA = '3'
                                               AND con.CODIGO_CITA = '$codigo_cita' 
                                                 AND plan.CODIGO_CONSULTA = '$codigo_consulta'
                                                   AND i.FECHA_CITA = CURDATE();";
        $resul=$conn->query($consulti);
      ?>
      
      
      <?php
        if ($resul->num_rows > 0) {
          while($row = $resul->fetch_assoc()) { 
          $sintomas = $row['SINTOMAS'];
          $diagnostico_ingreso = $row['DIAGNOSTICO_INGRESO'];
          $diagnostico_egreso = $row['DIAGNOSTICO_EGRESO'];
          $observaciones = $row['OBSEVARCIONES'];
          $fecha = $row['FECHA_CREACION'];

          $actividades = $row['ACTIVIDAD'];
          $tecnicas = $row['TECNICA'];
          $materiales = $row['MATERIALES'];
          $tareas = $row['TAREAS'];
          $resultados = $row['RESULTADOS'];
         
      ?>
      <div style="background-color: #2FB8F6;padding: 3.5px; text-align:center; color:#FBFBFB; "><label style="font-size: 18px;">Cita Psicológica Paciente <?php echo $fecha;?></label></div>
      <p>Datos Cita Psicológica</p><hr><br>
      <div>
      <div class="c" ><label><b>Síntomas: </b></label> <?php  echo utf8_decode(strtolower($sintomas)) ?> </div>
      <div class="c" > <label><b>Diagnóstico Ingreso: </b></label> <?php  echo utf8_decode(strtolower($diagnostico_ingreso))  ?></div>
      <div class="c" > <label><b>Evolución: </b></label> <?php echo  utf8_decode(strtolower($observaciones)) ?></div>
      <div class="c" > <label><b>Diagnóstico Egreso: </b></label> <?php echo utf8_decode(strtolower($diagnostico_egreso))?></div>

      </div>
      

      <div id="caja3">
        <p>Datos Plan Terapéutico</p><hr><br>
        
        <div class="c" > <label><b>Actividades: </b></label> <?php echo utf8_decode(strtolower($actividades))?> </div>
        <div class="c" ><label><b>Resultados: </b></label> <?php echo utf8_decode(strtolower($resultados))?></div>
        <div class="c" ><label><b>Técnicas: </b></label><?php echo utf8_decode(strtolower($tecnicas))?></div>
        <div class="c" ><label><b>Tareas: </b></label><?php echo utf8_decode(strtolower($tareas))?></div>
       </div>

       <div id="caja3">
        <div class="c" ><label><b>Materiales: </b></label><?php echo utf8_decode(strtolower($materiales))?></div>
        </div>
      
      
        
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

$dompdf->stream("ReporteConsulta_Psicologica.pdf", array("Attachment" => true));
echo $dompdf->output();
?>