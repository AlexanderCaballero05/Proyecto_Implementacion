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
      <p  style="text-align: center; font-size: 18px;">Historial psicologico del paciente</p>
      <p  style="font-size: 13px;"> Fecha: <?php  echo date("d/m/Y | g:i:a");?></p>
    </header>
    
   

   <footer>
      <p style="  text-align: center;"><b> Prosecar © Todos los derechos reservados.</b></p> 
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
      <legend>Expediente Psicologico</legend>
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
           <th>Antecedentes Clinicos</th>
           <th>Sintomas Neuroticos</th>
          
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
        $consulti = "SELECT con.FECHA_CREACION, con.SINTOMAS, con.DIAGNOSTICO_INGRESO, con.DIAGNOSTICO_EGRESO, con.OBSEVARCIONES,
         pla.ACTIVIDAD, pla.TECNICA, pla.MATERIALES, pla.TAREAS, pla.RESULTADOS
        FROM tbl_expediente_psicologico_consulta con , tbl_inscripcion_cita cit, tbl_persona per, tbl_plan_terapeutico pla
        WHERE con.CODIGO_CITA = cit.CODIGO_CITA
        AND cit.CODIGO_PERSONA = per.CODIGO_PERSONA
        AND pla.CODIGO_CONSULTA = con.CODIGO_EXPEDIENTE_PSICO
        AND cit.AREA_CITA = '3'
        AND cit.CODIGO_PERSONA = '$persona';";
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
      
      <legend style="padding-bottom: 4px; margin-bottom:5px;"> Citas psicologicas paciente  <?php echo $fecha; ?> </legend><br><hr>
      <div>
      <div class="c" id="caja2" ><label>Sintomas</label> 
        <textarea ><?php  echo ucwords(strtolower($sintomas)) ?></textarea> 
      </div>
      <div class="c" id="caja2" > <label>Diagnostico Ingreso</label> <textarea ><?php  echo ucwords(strtolower($diagnostico_ingreso))  ?></textarea></div>
      <div class="c" id="caja2" > <label>Evolución</label> <textarea  ><?php echo  ucwords(strtolower($observaciones)) ?></textarea></div>
      <div class="c" id="caja2" > <label>Diagnostico Egreso</label> <textarea  ><?php echo ucwords(strtolower($diagnostico_egreso))?></textarea></div>

      </div>
      

      <div id="caja3">
        <legend style="background-color: #ffff; color:#000000;">Datos Plan terapeutico</legend><br><hr>
        
        <div class="c1" id=caja1><label>Actividades</label>
        <textarea ><?php echo $actividades?></textarea>
        </div>
        <div class="c1" id=caja2><label>Resultados</label>
        <textarea  ><?php echo $resultados?></textarea>
        </div>
        
        </div>

        <div class="c1" id=caja2><label>Tecnicas</label>
        <textarea ><?php echo $tecnicas."fc"?></textarea>
        </div>
        
        <div class="c1" id=caja2><label>Tareas</label>
        <textarea ><?php echo $tareas."lpm"?></textarea>
        </div>
        
        <div class="c1" id=caja2><label>Materiales</label>
        <textarea ><?php echo $materiales."Imc"?></textarea>
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

$dompdf->stream("reporte.pdf", array("Attachment" => false));
echo $dompdf->output();
?>