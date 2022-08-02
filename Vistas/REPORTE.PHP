<?php

ob_start();
date_default_timezone_set("America/Guatemala");
?>
<?php
include('conexion.php');
include('conexion2.php'); 

if (isset($_POST['expediente'])) {
	$persona =($_POST['expediente']);
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
    padding:6px;
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
    margin-top: 4.5cm;
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
   left: 3cm; 
   right: 3cm;
   height: 1cm;
  }
   header {
    position: fixed;
    top: 0.5cm;
    left: 1.5cm;
    right: 0cm;
    height: 4.5cm;
  }
  img{
    float: right;
    width: 70px; 
    padding-right: 1.5cm;
  }
  .c{
    width: 706px;
    margin:2px;
    padding: 10px;
    margin: 8px;
    border: 1px solid #404141;
  }
  .c2{ /* Son estilos para los div que hacen como si fueran un textarea,si no sabe pues practique css :v */
    width: 706px;
    margin:2px;
    min-height: 200px;
    border: 1px solid #404141;
    margin: 8px;
    padding: 10px;
  }
   </style>
    <style>
   .pagenum:before {
      content: counter(page);/*Es para que salga la enumeracion de la pagina si */
    }
   </style>
    <title>Historial Medico Paciente</title>
  </head>
  <body>
    <header>
    <img src="LOGO.jpg">
      <p font face="Arial"  style="text-align: center; font-size:20px"><b>PROYECTO SEMILLERO CARMELITANO PROSECAR</b> <img></p>
      <p  style="text-align: center; font-size: 19px;">Historial Medico del Paciente</p>
       <p  style="font-size: 14px;"> Fecha: <?php  echo date("d/m/Y | g:i:a");?></p>
    </header>
   <footer>
    <p style="text-align: center; "><b> Prosecar <?php  echo date("Y");?> </b><b style="color:white;"></b>
      <label >Página<span  class="pagenum"></label></p>
      
   </footer>
   <main>
    <fieldset>
      <?php
      $query = "SELECT  p.DNI, p.FECHA_NACIMIENTO,CONCAT_WS(' ', p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO) AS NOMBRE ,
      s.SEXO ,t.NUMERO_TELEFONO TELEFONO FROM tbl_persona p ,tbl_expediente_medico ex ,tbl_sexo s ,tbl_telefono t
      where  t.CODIGO_PERSONA = p.CODIGO_PERSONA and  s.CODIGO_SEXO= p.SEXO and ex.CODIGO_PERSONA = p.CODIGO_PERSONA AND ex.CODIGO_PERSONA = '$persona'";
    $resul=$conn->query($query);  
    if($resul->num_rows > 0){
      while($row = $resul->fetch_assoc()){
        $nombre = $row['NOMBRE'];
        $dni = $row['DNI'];
        $fecha = $row['FECHA_NACIMIENTO'];
        $sexo = $row['SEXO'];
        $telefono = $row['TELEFONO'];
        $fechaEntera = strtotime($fecha);
        $f = date("Y");
        $anio = date("Y", $fechaEntera);
        $edad = $f - $anio;
      }
    }
      ?>      
      <legend>  Datos Personales Paciente</legend><br>
      <label  ><b>Nombre completo: </b><?php  echo ucwords(strtolower($nombre)); ?></label><br>
      <label style="padding-right: 24px;" ><b>DNI:  </b><?php echo $dni; ?></label> 
      <label><b>Edad: </b><?php echo $edad . " años"; ?> </label><br>
      <label style="padding-right: 20px;"><b>Celular: </b> <?php echo $telefono;?></label>
       <label><b> Sexo:</b> <?php echo  ucwords(strtolower($sexo)); ?></label>
      <br>
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
           <th>Tipo Sangre</th>
           <th>Tratamientos</th>
           <th>Enfermedades</th>
           <th>Alergias</th>
           <th>Trastornos</th>
           <th>Apariencia</th>
         </tr>
      </thead>
      <tbody>
         <tr>
         <td ><?php echo utf8_decode(strtolower($var1)); ?></td>
         <td ><?php echo utf8_decode(strtolower($var2)); ?></td>
         <td ><?php echo utf8_decode(strtolower($var3)); ?></td>
         <td ><?php echo utf8_decode(strtolower($var4)); ?></td>
         <td ><?php echo utf8_decode(strtolower($var5));?></td>
         <td ><?php echo utf8_decode(strtolower($var6));?></td>
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
        $consulti = "SELECT con.FECHA_CREACION, con.CODIGO_CONSULTA, pe.CODIGO_PERSONA, con.CODIGO_CITA, con.SINTOMAS, 
        con.DIAGNOSTICO_INGRESO, con.EVOLUCION, con.DIAGNOSTICO_EGRESO, pre.PESO, pre.MASA_CORPORAL, pre.ESTATURA, 
        pre.TEMPERATURA, pre.PULSO, pre.FRECUENCIA_CARDIACA, pre.FRECUENCIA_RESPIRATORIA, pre.DESNUTRICION, 
        GROUP_CONCAT(med.NOMBRE_MEDICAMENTO) AS NOMBRE_MEDICAMENTO, GROUP_CONCAT(exa.EXAMEN_MEDICO) as NOMBRE_EXAMEN,
        CONCAT_WS(' ',pee.PRIMER_NOMBRE,pee.SEGUNDO_NOMBRE,pee.PRIMER_APELLIDO,pee.SEGUNDO_APELLIDO) as  MEDICO,
        i.HORARIO AS HORA
          FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_estado est, tbl_consulta_medica con, tbl_preclinica pre,
         tbl_examenes_pacientes exap, tbl_examenes_medicos exa, tbl_receta_medica recp, tbl_medicamento med ,tbl_persona_especialidad pes, tbl_persona pee
                WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                AND pes.CODIGO_PERSONA_ESPECIALIDAD = i.CODIGO_ESPECIALISTA
                AND pee.CODIGO_PERSONA = pes.CODIGO_PERSONA
                AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
                AND i.CODIGO_CITA = pre.CODIGO_CITA
                AND con.CODIGO_CITA = i.CODIGO_CITA
                AND con.CODIGO_PRECLINICA = pre.CODIGO_PRECLINICA
                AND con.CODIGO_CONSULTA = recp.CODIGO_CONSULTA
                AND recp.CODIGO_MEDICAMENTO = med.CODIGO_MEDICAMENTO
                AND exap.CODIGO_CONSULTA = con.CODIGO_CONSULTA
                AND exap.CODIGO_EXAMEN_MEDICO = exa.CODIGO_EXAMEN_MEDICO
                AND  i.AREA_CITA = '2'
                AND pe.CODIGO_PERSONA= '$persona'
                GROUP BY con.CODIGO_CONSULTA;";
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
          $fecha = $row['FECHA_CREACION'];
          $MEDICO = $row['MEDICO'];
          $HORA = $row['HORA'];
          $peso = $row['PESO'];
          $estatura = $row['ESTATURA'];
          $masa = $row['MASA_CORPORAL'];
          $pulso = $row['PULSO'];
          $tempe = $row['TEMPERATURA'];
          $fc = $row['FRECUENCIA_CARDIACA'];
          $fr = $row['FRECUENCIA_RESPIRATORIA'];
          $desnutricion = $row['DESNUTRICION'];
          $medicamentos = $row['NOMBRE_MEDICAMENTO'];
          $examenes = $row['NOMBRE_EXAMEN'];
      ?>
      <div id="caja3">
       <div style="background-color: #2FB8F6;padding: 3.5px; text-align:center; color:#FBFBFB; "><label style="font-size: 18px;">Consulta medica fecha: <?php echo $fecha;?></label></div>
       <br>
       <fieldset>
         <legend>Datos Generales de la Consulta</legend><br>
         <label  ><b>Nombre del Medico: </b><?php  echo ucwords(strtolower($MEDICO)); ?></label><br>
         <label style="padding-right: 22px;"><b>Hora</b><?php echo $HORA; ?></label>
         <label><b>Fecha: </b><?php echo $fecha; ?></label>
       </fieldset>
       
      <p>Datos de preclínica </p><hr><br>
      <table style="border-collapse: collapse;  border: 0.4px solid #FFFF;">
        <thead >
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
        <tbody>
        <td  style="border-collapse: collapse;  border: 0.4px solid #FFFF; text-align: center;"><div style=" border:1px solid #404141; padding:2px;"><?php echo $peso ." lb"; ?></div></td>
         <td  style="border-collapse: collapse;  border: 0.4px solid #FFFF; text-align: center;"><div style=" border:1px solid #404141; padding:2px;"><?php echo $estatura." m"; ?></div></td>
              <td style="border-collapse: collapse;  border: 0.4px solid #FFFF; text-align: center;" ><div style=" border:1px solid #404141; padding:2px;"><?php echo $tempe." °C"; ?></div></td>
              <td style="border-collapse: collapse;  border: 0.4px solid #FFFF; text-align: center;" ><div style=" border:1px solid #404141;padding:2px;"><?php echo $masa ." Imc"; ?></div></td>
              <td  style="border-collapse: collapse;  border: 0.4px solid #FFFF;text-align: center;"><div style=" border:1px solid #404141; padding:2px;"><?php echo $fc." fc"; ?></div></td>
              <td  style="border-collapse: collapse;  border: 0.4px solid #FFFF; text-align: center;" ><div style=" border:1px solid #404141; padding:2px;"><?php echo $fr." fr"; ?></div></td>
              <td  style="border-collapse: collapse;  border: 0.4px solid #FFFF; text-align: center;"><div style=" border:1px solid #404141;padding:2px;"><?php echo $pulso." lpm"; ?></div></td>
        </tbody>
      </table>
      </div>
      <br>
      
      <div id="caja3">
        <p>Datos de Consulta Medica </p><hr><br>
        <div class="c"  ><label><b>Síntomas:</b></label> 
          <?php  echo utf8_decode(strtolower($sintomas)) ?>
        </div>
        <div class="c" > <label><b>Diagnóstico Ingreso: </b></label> <?php  echo utf8_decode(strtolower($diagnostico_ingreso))?> </div>
        <div class="c" > <label><b>Evolución: </b></label> <?php echo  utf8_decode(strtolower($evolucion)) ?> </div>
        <div class="c"  > <label><b>Diagnóstico Egreso: </b></label> <?php echo utf8_decode(strtolower($diagnostico_egreso))?></div>
      </div>
      <div id="caja3">
        <p> Datos Recetas/Examenes</p><hr><br>
        <div class="c2" ><label><b>Medicamentos Recetados: </b></label>
         <?php  echo utf8_decode(strtolower($medicamentos)) ?>
        </div>
        <div class="c2" ><label><b> Examenes Recetados:</b></label>
         <?php  echo utf8_decode(strtolower($examenes));?> 
        </div>
      </div>
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
$options->set(array('isPhpEnabled' => true));



$dompdf ->setOptions($options);

$dompdf ->loadHtml($html);

$dompdf->setPaper('letter');
$dompdf->render();

$dompdf->stream("Reporte_historialMedico.pdf", array("Attachment" => true));
echo $dompdf->output();
?>