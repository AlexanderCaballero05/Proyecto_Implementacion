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
  fieldset {
    background-color: #F7F9FA;
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

  .c2{
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
    <title>Reporte paciente</title>
  </head>
  <body>
  <header>
    <img src="LOGO.jpg">
      <p font face="Arial"  style="text-align: center; font-size:20px"><b>PROYECTO SEMILLERO CARMELITANO PROSECAR</b> <img></p>
      <p  style="text-align: center; font-size: 20px;">Reporte Médico del Paciente</p>
       <p  style="font-size: 14px;"> Fecha: <?php  echo date("d/m/Y | g:i:a");?></p>
    </header>
    <footer style="text-align: center;">
      <label style="text-align: center;">Página<span  class="pagenum"></label></p>
    </footer>
   <main>
    <fieldset>
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
      <label  ><b>Código de la cita: </b></label><?php echo $codigo_cita;?><br>
    </fieldset>
    <br>

    <fieldset>
      <legend>Expediente Clínico</legend>
     
    <br>
    <table>
    <?php
       $consulta = "SELECT exp.CODIGO_EXPEDIENTE, concat(per.PRIMER_NOMBRE,' ',per.PRIMER_APELLIDO) as nombre, san.TIPO as TIPO_SANGRE, exp.TRATAMIENTOS, exp.ENFERMEDADES, ale.NOMBRE as ALERGIAS, tra.TIPO as TRASTORNOS, apa.TIPO as APARIENCIA
       FROM tbl_expediente_medico exp, tbl_persona per, tbl_personas_alergias alep, tbl_personas_transtornos trap, tbl_personas_apariencia apap, tbl_alergias ale, tbl_transtornos_corporales tra, tbl_apariencia_fisica apa, tbl_tipo_sangre san
       WHERE exp.CODIGO_PERSONA = per.CODIGO_PERSONA
       AND exp.CODIGO_EXPEDIENTE = alep.CODIGO_EXPEDIENTE_PERSONA
       AND exp.CODIGO_EXPEDIENTE = trap.CODIGO_EXPEDIENTE
       AND exp.CODIGO_EXPEDIENTE = apap.CODIGO_EXPEDIENTE
       AND alep.CODIGO_ALERGIAS = ale.CODIGO_ALERGIAS
       AND trap.CODIGO_TRANSTORNO = tra.CODIGO_TRANSTORNO
       AND apap.CODIGO_APARIENCIA = apa.CODIGO_APARIENCIA
       AND exp.CODIGO_TIPO_SANGRE = san.CODIGO_TIPO_SANGRE and exp.CODIGO_PERSONA = '$persona'
       GROUP by exp.CODIGO_PERSONA ;";
       $resul=$conn->query($consulta);
       if ($resul->num_rows > 0) {
        while($row = $resul->fetch_assoc()) { 
        $var1 = $row['TIPO_SANGRE'];
        $var2 = $row['TRATAMIENTOS'];
        $var3 = $row['ENFERMEDADES'];
        $var4 = $row['ALERGIAS'];
        $var5 = $row['TRASTORNOS'];
        $var6 = $row['APARIENCIA'];
        ?>
      <thead>
         <tr>
           <th>Tipo sangre</th>
           <th>Tratamientos</th>
           <th>Apariencia</th>
           <th>Alergias</th>
           <th>Trastornos</th>
           <th>Enfermedades</th>
         </tr>
      </thead>
      <tbody>
         <tr>
         <td ><?php echo utf8_decode(strtolower($var1)); ?></td>
         <td ><?php echo utf8_decode(strtolower($var2)); ?></td>
         <td ><?php echo utf8_decode(strtolower($var6)); ?></td>
         <td ><?php echo utf8_decode(strtolower($var4)); ?></td>
         <td ><?php echo utf8_decode(strtolower($var5));?></td>
         <td ><?php echo utf8_decode(strtolower($var3));?></td>
         </tr>
         <?php
           }
           }
         ?>
      </tbody>
    </table>
    </fieldset>
    <br>

    <fieldset style="background-color: #F7F9FA;">
     <legend>Datos Preclínica</legend>
     <br>
     <table style="border-collapse: collapse;  border: 0.4px solid #FFFF; background-color: #F7F9FA;">
         <?php
          $pre ="SELECT pr.PESO, pr.ESTATURA, pr.TEMPERATURA, pr.DESNUTRICION, pr.FRECUENCIA_CARDIACA,pr.FRECUENCIA_RESPIRATORIA, pr.PULSO, pr.MASA_CORPORAL, pr.CODIGO_PRECLINICA
          FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_persona_especialidad es, tbl_estado est, tbl_preclinica pr
          WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
          AND i.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
          AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
          AND  pr.CODIGO_CITA = i.CODIGO_CITA
          and  i.AREA_CITA = '2'
          AND i.CODIGO_CITA ='$codigo_cita'";
          $resul=$conn->query($pre);
          if($resul-> num_rows > 0){
            while($row = $resul->fetch_assoc()){
                $var1 = $row['PESO'];
                $var2 = $row['ESTATURA'];
                $var3 = $row['TEMPERATURA'];
                $var4 = $row['DESNUTRICION'];
                $var5 = $row['FRECUENCIA_CARDIACA'];
                $var6 = $row['FRECUENCIA_RESPIRATORIA'];
                $var7 = $row['PULSO'];
                $var8 = $row['MASA_CORPORAL'];
         ?>
       <thead style="background-color: #F7F9FA;">
           <tr>
           <th style="border-collapse: collapse;  border: 0.4px solid #FFFF; text-align: left;">Peso</th>
             <th style="border-collapse: collapse;  border: 0.4px solid #FFFF;text-align: left;">Estatura</th>
             <th style="border-collapse: collapse;  border: 0.4px solid #FFFF;text-align: left;">Temperatura</th>
             <th style="border-collapse: collapse;  border: 0.4px solid #FFFF;text-align: left;">Masa </th>
             <th style="border-collapse: collapse;  border: 0.4px solid #FFFF;text-align: left;">FC</th>
             <th style="border-collapse: collapse;  border: 0.4px solid #FFFF;text-align: left;">FR</th>
             <th style="border-collapse: collapse;  border: 0.4px solid #FFFF;text-align: left;">Pulso</th>
           </tr>
       </thead>
       <tbody style="background-color: #F7F9FA;">
          <tr>
              <td style="border-collapse: collapse;  border: 0.4px solid #FFFF; text-align: center;"><div style=" border:1px solid #404141; padding:2px;"><?php echo $var1 ." lb"; ?></div></td>
              <td style="border-collapse: collapse;  border: 0.4px solid #FFFF; text-align: center;"><div style=" border:1px solid #404141; padding:2px;"><?php echo $var2." m"; ?></div></td>
              <td style="border-collapse: collapse;  border: 0.4px solid #FFFF; text-align: center;"><div style=" border:1px solid #404141; padding:2px;"><?php echo $var3." °C"; ?></div></td>
              <td style="border-collapse: collapse;  border: 0.4px solid #FFFF; text-align: center;"><div style=" border:1px solid #404141; padding:2px;"><?php echo $var8 ." Imc"; ?></div></td>
              <td style="border-collapse: collapse;  border: 0.4px solid #FFFF; text-align: center;"><div style=" border:1px solid #404141; padding:2px;"><?php echo $var5." fc"; ?></div></td>
              <td style="border-collapse: collapse;  border: 0.4px solid #FFFF; text-align: center;"><div style=" border:1px solid #404141; padding:2px;"><?php echo $var6." fr"; ?></div></td>
              <td style="border-collapse: collapse;  border: 0.4px solid #FFFF; text-align: center;"><div style=" border:1px solid #404141; padding:2px;"><?php echo $var7." lpm"; ?></div></td>
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
        $consulti ="SELECT CON.CODIGO_CONSULTA, con.CODIGO_CITA, con.SINTOMAS, con.DIAGNOSTICO_INGRESO, con.EVOLUCION, con.DIAGNOSTICO_EGRESO, i.FECHA_CITA
        FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_persona_especialidad es, tbl_estado est, tbl_consulta_medica con
        WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
          AND i.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
            AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
              AND con.CODIGO_CITA = i.CODIGO_CITA
                  AND i.CODIGO_ESTADO = '12' 
                    AND  i.AREA_CITA = '2'
                      AND con.CODIGO_CITA = '$codigo_cita'
                        AND i.FECHA_CITA = CURDATE();";
          $resul=$conn->query($consulti);
      ?>
      <?php
        if ($resul->num_rows > 0) {
            while($row = $resul->fetch_assoc()) { 
            $codigo_consulta = $row['CODIGO_CONSULTA'];
            $sintomas = $row['SINTOMAS'];
            $diagnostico_ingreso = $row['DIAGNOSTICO_INGRESO'];
            $evolucion = $row['EVOLUCION'];
            $diagnostico_egreso = $row['DIAGNOSTICO_EGRESO'];
            $fecha_cita = $row['FECHA_CITA'];
      ?>
       <div style="background-color: #2FB8F6;padding: 3.5px; text-align:center; color:#F7F9FA; "><label style="font-size: 18px;">Información de la Consulta <?php echo $fecha_cita;?></label></div><br>
       <div>
          <div class="c" ><label><b>Síntomas: </b></label> <?php  echo utf8_decode(strtolower($sintomas)) ?> </div>
          <div class="c" > <label><b>Diagnóstico Ingreso: </b></label> <?php  echo utf8_decode(strtolower($diagnostico_ingreso))?></div>
          <div class="c" > <label><b>Evolución: </b></label><?php echo  utf8_decode(strtolower($evolucion)) ?></div>
          <div class="c" > <label><b>Diagnóstico Egreso: </b></label><?php echo utf8_decode(strtolower($diagnostico_egreso))?></div>
       </div>
      <?php 
       } 
       }
      ?>
      <?php
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
            <legend style="background-color: #ffff; color:#000000;">Información de los medicamentos</legend><br><hr>
            <div class="c" ><label><b>Nombre del Medicamento: </b></label>
              <?php  echo utf8_decode(strtolower($medicamentos)) ?>
            </div>
            <div class="c" ><label><b>Indicaciones del Medicamento: </b></label>
              <?php  echo utf8_decode(strtolower($indicaciones)) ?>
            </div>
            <div class="c" ><label><b>Observaciones del Medicamento: </b></label>
              <?php  echo utf8_decode(strtolower($observacion));?>
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
           <p>Información de los Exámenes </p><hr><br>
            <div class="c2"><label><b>Nombre del Examen: </b></label>
              <?php  echo utf8_decode(strtolower($examen)) ?>
            </div>
            <div class="c2"><label><b>Indicaciones del Examen: </b></label>
              <?php  echo utf8_decode(strtolower($indicacion)) ?>
            </div>
            <div class="c2"><label><b>Observaciones del Examen: </b></label>
              <?php  echo utf8_decode(strtolower($observa));?>
            </div>
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

$dompdf->stream("Consulta_Medica.pdf", array("Attachment" => true));
echo $dompdf->output();
?>

