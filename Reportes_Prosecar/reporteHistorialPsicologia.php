<?php

ob_start();
date_default_timezone_set("America/Guatemala");
?>
<?php
include('conexion.php');
include('conexion2.php'); 
if (isset($_POST['reporteHistoricoPsicologico'])) {
	$persona =($_POST['reporteHistoricoPsicologico']);
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
    width: 94%;
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
  img{
    float: right;
    width: 70px; 
    padding-right: 1.5cm;
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
    <title>Historial Psicológico Paciente</title>
  </head>
  <body>
    <header>
    <img src="../Vistas/modulos/REPORTES/img/LOGO.jpg">
      <p font face="Arial"  style="text-align: center; font-size:20px"><b>PROYECTO SEMILLERO CARMELITANO PROSECAR</b> <img></p>
      <p  style="text-align: center; font-size: 20px;">Historial Psicológico del Paciente</p>
      <p  style="font-size: 14px;"> Fecha: <?php  echo date("d/m/Y | g:i:a");?></p>
    </header>
    
   <footer style="text-align: center;">
      <label style="text-align: center;">Página<span  class="pagenum"></label></p>
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
      <legend>Datos Personales Paciente</legend><br>
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
       $consulta = "SELECT exp.CODIGO_EXPEDIENTE, CONCAT_WS(' ',per.PRIMER_NOMBRE,per.SEGUNDO_NOMBRE,per.PRIMER_APELLIDO,per.SEGUNDO_APELLIDO) as nombr, exp.ANTECEDENTES_FAMILIARES, 
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
      <tbody >
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
        $consulti = "SELECT con.FECHA_CREACION, con.SINTOMAS, con.DIAGNOSTICO_INGRESO, con.DIAGNOSTICO_EGRESO, con.OBSEVARCIONES,
        pla.ACTIVIDAD, pla.TECNICA, pla.MATERIALES, pla.TAREAS, pla.RESULTADOS, cit.HORARIO AS HORA,
        CONCAT_WS(' ',pee.PRIMER_NOMBRE,pee.SEGUNDO_NOMBRE,pee.PRIMER_APELLIDO,pee.SEGUNDO_APELLIDO) as  MEDICO
       FROM tbl_expediente_psicologico_consulta con 
       LEFT JOIN  tbl_inscripcion_cita cit ON con.CODIGO_CITA = cit.CODIGO_CITA
       LEFT JOIN tbl_persona_especialidad pes ON  pes.CODIGO_PERSONA_ESPECIALIDAD = cit.CODIGO_ESPECIALISTA
       LEFT JOIN tbl_persona pee ON  pee.CODIGO_PERSONA = pes.CODIGO_PERSONA
       LEFT JOIN tbl_persona per ON  cit.CODIGO_PERSONA = per.CODIGO_PERSONA
       LEFT JOIN  tbl_persona_especialidad espe ON espe.CODIGO_PERSONA_ESPECIALIDAD = cit.CODIGO_ESPECIALISTA
       LEFT JOIN  tbl_plan_terapeutico pla ON pla.CODIGO_CONSULTA = con.CODIGO_EXPEDIENTE_PSICO
       WHERE  cit.AREA_CITA = '3' AND cit.CODIGO_PERSONA = '$persona'
       ORDER BY con.FECHA_CREACION   DESC;";
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
          $hora = $row['HORA'];
          $medico = $row['MEDICO'];
          $actividades = $row['ACTIVIDAD'];
          $tecnicas = $row['TECNICA'];
          $materiales = $row['MATERIALES'];
          $tareas = $row['TAREAS'];
          $resultados = $row['RESULTADOS'];
      ?>
      <?php 
      if($actividades == '' and $tecnicas == '' and $materiales == '' and $tareas == '' and $resultados == ''){
            $plan = 'No hay plan Terapéutico para esta cita.';  
        ?>
    <div class="caja3"><!--no quiere hacer caso esta cajita :/ -->
    <div style="background-color: #2FB8F6;padding: 3.5px; text-align:center; color:#FBFBFB; "><label style="font-size: 18px;">Cita Psicológica Paciente <?php echo $fecha;?></label></div><br>
      <fieldset>
        <legend>Datos Generales de la Consulta</legend><br>
         <label  ><b>Nombre del Psicológo: </b> <?php echo ucwords(strtolower($medico)); ?></label><br>
         <label style="padding-right: 22px;"><b>Hora</b><?php echo $hora; ?></label>
         <label><b>Fecha: </b><?php echo $fecha; ?></label>
      </fieldset>

      <p>Datos Consulta Psicológica</p><hr color="blue"><br>
      <div class="c1"  ><label><b>Síntomas</b></label> 
        <?php  echo ucwords(strtolower($sintomas)) ?>
      </div>
      <div class="c1"  > <label><b>Diagnóstico Ingreso</b></label> <?php  echo ucwords(strtolower($diagnostico_ingreso))  ?></div>
      <div class="c1"  > <label><b>Evolución</b></label> <?php echo  ucwords(strtolower($observaciones)) ?></div>
      <div class="c1"  > <label><b>Diagnóstico Egreso</b></label> <?php echo ucwords(strtolower($diagnostico_egreso))?></div>
      <div>
     <br>
      
      
      <div class="caja3"> 
        <p>Datos Plan Terapéutico </p><hr><br>
        <div class="c1" >
           <?php echo ($plan);?><!--En caso que no tenga plan,solo decir que no tiene :v -->
        </div>
      </div>
          <br>
      <?php
      }else{ 
      ?>
<div class="caja3"><!--no quiere hacer caso esta cajita :/ -->
<div style="background-color: #2FB8F6;padding: 3.5px; text-align:center; color:#FBFBFB;"><label style="font-size: 18px;">Cita Psicológica Paciente <?php echo $fecha;?></label></div><br>
       <fieldset>
        <legend>Datos Generales de la Consulta</legend><br>
         <label  ><b>Nombre del Psicólogo: </b> <?php echo ucwords(strtolower($medico)); ?></label><br>
         <label style="padding-right: 22px;"><b>Hora</b><?php echo $hora; ?></label>
         <label><b>Fecha: </b><?php echo $fecha; ?></label>
      </fieldset>
      <p>Datos Consulta Psicológica</p><hr><br>
      <div class="c1" ><label><b>Síntomas</b></label> 
        <?php  echo ucwords(strtolower($sintomas)) ?> 
      </div>
      <div class="c1" > <label><b>Diagnóstico Ingreso</b></label> <?php  echo ucwords(strtolower($diagnostico_ingreso))  ?></div>
      <div class="c1" > <label><b>Evolución</b></label> <?php echo  ucwords(strtolower($observaciones)) ?></div>
      <div class="c1" > <label><b>Diagnóstico Egreso</b></label> <?php echo ucwords(strtolower($diagnostico_egreso))?></div>
      <div>
     <br>



      <div class="caja3"> 
      <p>Datos Plan Terapéutico </p><hr><br>
        <div class="c1" ><label><b>Actividades a realizar: </b></label>
            <?php  echo ucwords(strtolower($actividades)); ?>
        </div>
        <div class="c1" ><label><b>Resultados: </b></label>
         
          <?php echo ucwords(strtolower($resultados));?>
        </div>
        
      <div id="caja3">
        <div class="c1" ><label><b>Técnicas: </b></label>
          <?php echo ucwords(strtolower($tecnicas));?>
          </div>
          
          <div class="c1" ><label><b>Tareas: </b></label>
          <?php echo ucwords(strtolower($tareas));?>
          </div>
          
          <div class="c1" ><label><b>Materiales: </b></label>
          <?php echo ucwords(strtolower($materiales));?>
          </div>
      </div><br>
      </div>
      <?php
        } 
        ?>
      
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

$dompdf->stream("Historial_Psicológico.pdf", array("Attachment" => true)); // True significa que se descargara de inmediato al darle click
echo $dompdf->output();
?>