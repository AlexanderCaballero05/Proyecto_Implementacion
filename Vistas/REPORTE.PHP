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
   left: 3cm; 
   right: 3cm;
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
    min-height: 40%;
  }
  .c1{
    width: 12%;
    margin:10px;
    max-width: 12%;
    min-height: 15px;
  }
  .c2{
    width: 49.5%;
    margin:2px;
    min-width: 49.5%;
    min-height: 200px;

  }
    </style>
    <style>
   .pagenum:before {
        content: counter(page);
    }
</style>
    <title>Reporte paciente uwu</title>
  </head>
  <body>
    <header>
      <p font face="Arial"  style="text-align: center; font-size:20px"><b>PROYECTO SEMILLERO CARMELITANO PROSECAR</b> <img></p>
      <p  style="text-align: center; font-size: 18px;">Historial medico del paciente</p>
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
      FROM tbl_persona p ,tbl_expediente_medico ex
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
      <legend>Expediente clinico</legend>
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
           <th>Enfermedades</th>
           <th>Alergias</th>
           <th>Trastornos</th>
           <th>Enfermedades</th>
         </tr>
      </thead>
      <tbody>
         <tr>
         <td ><?php echo ucwords(strtolower($var1)); ?></td>
         <td ><?php echo ucwords(strtolower($var2)); ?></td>
         <td ><?php echo ucwords(strtolower($var3)); ?></td>
         <td ><?php echo ucwords(strtolower($var4)); ?></td>
         <td ><?php echo ucwords(strtolower($var5));?></td>
         <td ><?php echo ucwords(strtolower($var6));?></td>
         </tr>
         <?php
           }
           }
         ?>
      </tbody>
    </table>
    </fieldset>
    <br>
    <legend style="padding-bottom: 4px; margin-bottom:5px;"> Citas medicas paciente   </legend><br><hr>
      <?php
        $consulti = "SELECT con.FECHA_CREACION, con.CODIGO_CONSULTA, pe.CODIGO_PERSONA, con.CODIGO_CITA, con.SINTOMAS, 
        con.DIAGNOSTICO_INGRESO, con.EVOLUCION, con.DIAGNOSTICO_EGRESO, pre.PESO, pre.MASA_CORPORAL, pre.ESTATURA, 
        pre.TEMPERATURA, pre.PULSO, pre.FRECUENCIA_CARDIACA, pre.FRECUENCIA_RESPIRATORIA, pre.DESNUTRICION, 
        GROUP_CONCAT(med.NOMBRE_MEDICAMENTO) AS NOMBRE_MEDICAMENTO, GROUP_CONCAT(exa.EXAMEN_MEDICO) as NOMBRE_EXAMEN
          FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_estado est, tbl_consulta_medica con, tbl_preclinica pre,
         tbl_examenes_pacientes exap, tbl_examenes_medicos exa, tbl_receta_medica recp, tbl_medicamento med
                WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
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
      <p>Datos pre-clinica <?php echo $fecha;?></p><hr><br>
      <table style="border-collapse: collapse;  border: 0.4px solid #FFFF;">
        <thead >
           <tr>
             <th style="border-collapse: collapse;  border: 0.4px solid #FFFF;">Peso</th>
             <th style="border-collapse: collapse;  border: 0.4px solid #FFFF;">Estatura</th>
             <th style="border-collapse: collapse;  border: 0.4px solid #FFFF;">Temperatura</th>
             <th style="border-collapse: collapse;  border: 0.4px solid #FFFF;">Masa </th>
             <th style="border-collapse: collapse;  border: 0.4px solid #FFFF;">FC</th>
             <th style="border-collapse: collapse;  border: 0.4px solid #FFFF;">FR</th>
             <th style="border-collapse: collapse;  border: 0.4px solid #FFFF;">Pulso</th>
           </tr>
        </thead>
        <tbody>
        <td  style="border-collapse: collapse;  border: 0.4px solid #FFFF; text-align: center;"  ><?php echo $peso ." lb"; ?></td>
              <td  style="border-collapse: collapse;  border: 0.4px solid #FFFF; text-align: center;"><?php echo $estatura." m"; ?></td>
              <td style="border-collapse: collapse;  border: 0.4px solid #FFFF; text-align: center;" ><?php echo $tempe." °C"; ?></td>
              <td style="border-collapse: collapse;  border: 0.4px solid #FFFF; text-align: center;" ><?php echo $masa ." Imc"; ?></td>
              <td  style="border-collapse: collapse;  border: 0.4px solid #FFFF;text-align: center;"><?php echo $fc." fc"; ?></td>
              <td  style="border-collapse: collapse;  border: 0.4px solid #FFFF; text-align: center;" ><?php echo $fr." fr"; ?></td>
              <td  style="border-collapse: collapse;  border: 0.4px solid #FFFF; text-align: center;"><?php echo $pulso." lpm"; ?></td>
        </tbody>
      </table>
      </div>
      <br>
      
      <div id="caja3">
        <p>Consulta medica<?php echo $fecha;?></p><hr><br>
        <div class="c" id="caja2" ><label>Sintomas</label> 
          <textarea ><?php  echo ucwords(strtolower($sintomas)) ?></textarea> 
        </div>
        <div class="c" id="caja2" > <label>Diagnostico Ingreso</label> <textarea ><?php  echo ucwords(strtolower($diagnostico_ingreso))  ?></textarea></div>
        <div class="c" id="caja2" > <label>Evolución</label> <textarea  ><?php echo  ucwords(strtolower($evolucion)) ?></textarea></div>
        <div class="c" id="caja2" > <label>Diagnostico Egreso</label> <textarea  ><?php echo ucwords(strtolower($diagnostico_egreso))?></textarea></div>
      </div>
      <div id="caja3">
        <legend style="background-color: #ffff; color:#000000;"> Datos recetas/Examenes</legend><br><hr>
        <div class="c2" id=caja2><label>Medicamentos Recetados</label>
        <textarea ><?php  echo ucwords(strtolower($medicamentos)) ?></textarea>
        </div>
        <div class="c2" id=caja2><label>Examenes Recetados</label>
         <textarea   ><?php  echo ucwords(strtolower($examenes));?></textarea>
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

$dompdf->stream("Reporte_historialMedico.pdf", array("Attachment" => false));
echo $dompdf->output();
?>