<?php

ob_start();
date_default_timezone_set("America/Guatemala");
?>
<?php
include('conexion.php');
include('conexion2.php'); 
  
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <style type="text/css">

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
  .c{
    width: 706px;
    margin:2px;
    padding: 10px;
    margin: 8px;
    border: 1px solid #404141;
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


  .pagenum:before {
        content: counter(page);
    }
    </style>
    <title>Recetas Paciente</title>
  </head>
  <body>
  <header>
    <img src="../Vistas/modulos/REPORTES/img/LOGO.jpg">
      <p font face="Arial"  style="text-align: center; font-size:20px"><b>PROYECTO SEMILLERO CARMELITANO PROSECAR</b> <img></p>
      <p  style="text-align: center; font-size: 20px;">Recetas Medicamentos-Examenes</p>
       <p  style="font-size: 14px;"> Fecha: <?php  echo date("d/m/Y | g:i:a");?></p>
    </header>
  
   <footer>
     <p style="text-align: center; "><b> Prosecar © Todos los derechos reservados <?php  echo date("Y");?> </b><b style="color:white;">letras pra rellenar para </b>
      <label >Página<span  class="pagenum"></label></p>
   </footer>

   <main>
   <fieldset><!--Los datos personales del paciente,los de simempre :v -->
      <?php
      $query = "SELECT i.CODIGO_CITA as CODIGO, i.CODIGO_PERSONA, CONCAT_WS(' ',pe.PRIMER_NOMBRE,pe.SEGUNDO_NOMBRE,pe.PRIMER_APELLIDO) as PACIENTE,  pe.DNI, i.FECHA_CITA, i.HORARIO, est.NOMBRE as nombre_estado, pe.FECHA_NACIMIENTO
      FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_persona_especialidad es, tbl_estado est
      WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
      AND i.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
      AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
      AND i.CODIGO_ESTADO = '12' 
      and  i.AREA_CITA = '2'
      AND i.FECHA_CITA = CURDATE();";
        $resul=$conn->query($query);  
        if ($resul->num_rows > 0) {
            while($row = $resul->fetch_assoc()) { 
             $codigo_cita = $row['CODIGO'];
             $persona = $row['CODIGO_PERSONA'];
             $nombre_pa = $row['PACIENTE'];
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
      <label  ><b>Nombre completo:</b> </label><?php  echo utf8_decode(ucwords(strtolower($nombre_pa))); ?> <br>
      <label  ><b>DNI: </b></label> <?php echo $dni; ?><br>
      <label  ><b>Edad: </b></label><?php echo $edad . " años"; ?><br>
      <label  ><b>Codigo de la cita: </b></label><?php echo $codigo_cita;?><br>
    </fieldset>
    <br>

    
    <div style="background-color: #2FB8F6;padding: 3.5px; text-align:center; color:#F7F9FA; "><label style="font-size: 18px;">Medicamentos Recetados</label></div><br>
    <?php
     $consulti ="SELECT CON.CODIGO_CONSULTA FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_persona_especialidad es, tbl_estado est, tbl_consulta_medica con
     WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA AND i.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
     AND i.CODIGO_ESTADO = est.CODIGO_ESTADO AND con.CODIGO_CITA = i.CODIGO_CITA AND i.CODIGO_ESTADO = '12' 
     AND  i.AREA_CITA = '2' AND con.CODIGO_CITA = '$codigo_cita' AND i.FECHA_CITA = CURDATE();";
     $dato=$conn->query($consulti);
     if ($dato->num_rows > 0) {
      while($row = $dato->fetch_assoc()) { 
      $codigo_consulta = $row['CODIGO_CONSULTA'];
      } 
    }

      $consulta = "SELECT rec.CODIGO_CONSULTA, med.NOMBRE_MEDICAMENTO as medicamentos, rec.INDICACIONES_RECETA as indicaciones ,rec.OBSERVACIONES
        FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_persona_especialidad es, tbl_estado est, tbl_consulta_medica con, tbl_receta_medica rec, tbl_medicamento med
        WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
        AND i.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
        AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
        AND con.CODIGO_CITA = i.CODIGO_CITA
        AND con.CODIGO_CONSULTA = rec.CODIGO_CONSULTA
        AND rec.CODIGO_MEDICAMENTO = med.CODIGO_MEDICAMENTO
        AND i.CODIGO_ESTADO = '12' 
        AND  i.AREA_CITA = '2'
        AND con.CODIGO_CITA = '$codigo_cita' 
        AND rec.CODIGO_CONSULTA = '$codigo_consulta'
        AND i.FECHA_CITA = CURDATE() ";
      $resul=$conn->query($consulta);
      if ($resul->num_rows > 0) {
        while($row = $resul->fetch_assoc()) { 
        $medicamentos = $row['medicamentos'];
        $indicaciones = $row['indicaciones'];
        $observacion = $row['OBSERVACIONES'];
        ?>
        
      <div id="caja3">
            <legend style="background-color: #ffff; color:#000000;">Datos de la receta</legend><br><hr>
            <div class="c" ><label><b>Nombre del medicamento: </b></label>
              <?php  echo (strtolower($medicamentos)) ?>
            </div>
            <div class="c" ><label><b>Indicaciones del medicamento: </b></label>
              <?php  echo (strtolower($indicaciones)) ?>
            </div>
            <div class="c" ><label><b>Observaciones del medicamento: </b></label>
              <?php  echo (strtolower($observacion));?>
            </div>
      </div><br>
      <?php
        }
        }
      ?>
    
    <div id="caja3">
          <?php
           $consulti ="SELECT  med.EXAMEN_MEDICO as examen, rec.INDICACIONES as indicaciones ,rec.OBSERVACIONES
           FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_estado est, tbl_consulta_medica con, tbl_examenes_pacientes  rec, tbl_examenes_medicos med
           WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
           AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
           AND con.CODIGO_CITA = i.CODIGO_CITA
           AND con.CODIGO_CONSULTA = rec.CODIGO_CONSULTA
           AND rec.CODIGO_EXAMEN_MEDICO = med.CODIGO_EXAMEN_MEDICO
           AND i.CODIGO_ESTADO = '12' 
           AND  i.AREA_CITA = '2'
           AND con.CODIGO_CITA = '$codigo_cita' 
           AND rec.CODIGO_CONSULTA = '$codigo_consulta'
           AND i.FECHA_CITA = CURDATE() ";
           $resul=$conn->query($consulti);
           if ($resul->num_rows > 0) {
             while($row = $resul->fetch_assoc()) { 
             $examen= $row['examen'];
             $indicacion = $row['indicaciones'];
             $observa = $row['OBSERVACIONES'];
             ?>
           <div style="background-color: #2FB8F6;padding: 3.5px; text-align:center; color:#F7F9FA; "><label style="font-size: 18px;">Examenes recetados</label></div><br>
           <p>Datos de examenes </p><hr><br>
            <div class="c"><label><b>Nombre del examen: </b></label>
              <?php  echo utf8_decode(strtolower($examen)) ?>
            </div>
            <div class="c"><label><b>Indicaciones del examen: </b></label>
              <?php  echo utf8_decode(strtolower($indicaciones)) ?>
            </div>
            <div class="c"><label><b>Observaciones del examen: </b></label>
              <?php  echo utf8_decode(strtolower($observa));?>
            </div>
      </div>
      <?php 
        } 
        }
      ?>
    
   </main>

    <!--Elaborado por Diana Rut  -->
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

$dompdf->stream("Recetas_paciente.pdf", array("Attachment" => true));
echo $dompdf->output();
?>
