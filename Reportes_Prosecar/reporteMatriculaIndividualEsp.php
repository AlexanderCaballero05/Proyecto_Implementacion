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
    <title>Reporte clases matriculadas</title>
  </head>
  <body>
  <header>
    <img src="../assets/imagenes/logoparroquia.jpg">
      <p font face="Arial"  style="text-align: center; font-size:20px"><b>PROYECTO SEMILLERO CARMELITANO PROSECAR</b> <img></p>
      <p  style="text-align: center; font-size: 20px;">Reporte Matricula Individual</p>
       <p  style="font-size: 14px;"> Fecha: <?php  echo date("d/m/Y | g:i:a");?></p>
    </header>
   <footer>
     <p style="text-align: center; "><b> Prosecar © Todos los derechos reservados <?php  echo date("Y");?> </b><b style="color:white;">letras pra rellenar para </b>
      <label >Página<span  class="pagenum"></label></p>
   </footer>
   <main>
    <fieldset>
      <?php
      if (isset($_POST['imprimirmatriculaindividuales'])) {
        $codigo_estudiante=($_POST['imprimirmatriculaindividuales']);
      }
      $query = "SELECT DISTINCT pe.CODIGO_PERSONA, CONCAT_WS(' ',pe.PRIMER_NOMBRE,pe.SEGUNDO_NOMBRE,pe.PRIMER_APELLIDO, pe.SEGUNDO_APELLIDO) as ESTUDIANTE, pe.DNI, pe.FECHA_NACIMIENTO, es.GRADO_ACTUAL, es.INDICE_ACADEMICO
      FROM tbl_matricula_academica ma, tbl_estudiante es, tbl_persona pe
      WHERE es.CODIGO_PERSONA = pe.CODIGO_PERSONA
      AND es.CODIGO_ESTUDIANTE = ma.CODIGO_ESTUDIANTE
      AND ma.CODIGO_ESTUDIANTE =  $codigo_estudiante;";
        $resul=$conn->query($query);  
        if ($resul->num_rows > 0) {
            while($row = $resul->fetch_assoc()) { 
             $persona = $row['CODIGO_PERSONA'];
             $nombre_pa = $row['ESTUDIANTE'];
             $dni = $row['DNI'];
             $fecha = $row['FECHA_NACIMIENTO'];
             $fechaEntera = strtotime($fecha);
             $f = date("Y");
             $anio = date("Y", $fechaEntera);
             $edad = $f - $anio;
             $grado = $row['GRADO_ACTUAL'];
             $promedio = $row['INDICE_ACADEMICO'];
            }  
            }
      ?>      
      <legend>  Datos Personales </legend><br>
      <label  ><b>Nombre completo:</b> </label><?php  echo utf8_decode(ucwords(strtolower($nombre_pa))); ?> <br>
      <label  ><b>DNI: </b></label> <?php echo $dni; ?><br>
      <label  ><b>Edad: </b></label><?php echo $edad . " años"; ?><br>
      <label  ><b>Grado: </b></label><?php echo $grado ; ?><br>
      <label  ><b>Promedio: </b></label><?php echo $promedio . "%"; ?><br>
      <br>
    </fieldset>
    <br>

    <fieldset>
      <legend>Clases Académicas Matriculadas</legend>
     
    <br>
    <table>
    <thead>
         <tr>
           <th>Asignatura</th>
           <th>Nombre del Tutor</th>
           <th>Modalidad</th>
           <th>Sección</th>
           <th>Hora</th>
         </tr>
      </thead>
    <?php
    if (isset($_POST['imprimirmatriculaindividuales'])) {
      $codigo_estudiante=($_POST['imprimirmatriculaindividuales']);
    }
       $consulta = "SELECT  t.NOMBRE as TUTORIA, ma.CODIGO_MATRICULA, ma.CODIGO_ESTUDIANTE, t.CODIGO_TUTORIA,
       CONCAT_WS(' ',p.PRIMER_NOMBRE,p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) as TUTOR,m.TIPO as MODALIDAD,se.NOMBRE as SECCION , c.HORA, c.CODIGO_CARGA 
        FROM tbl_carga_academica c, tbl_seccion se ,tbl_tutoria t, tbl_persona p, tbl_modalidad m, tbl_matricula_academica ma  
        WHERE c.CODIGO_PERSONA= p.CODIGO_PERSONA 
        AND c.CODIGO_TUTORIA= t.CODIGO_TUTORIA 
        AND c.CODIGO_MODALIDAD= m.CODIGO_MODALIDA
        AND ma.CODIGO_CARGA = c.CODIGO_CARGA
        AND c.CODIGO_SECCION = se.CODIGO_SECCION
        AND t.CODIGO_AREA = 4
        AND ma.CODIGO_ESTUDIANTE = '$codigo_estudiante'";
       $resul=$conn->query($consulta);
       if ($resul->num_rows > 0) {
        while($row = $resul->fetch_assoc()) { 
        $var1 = $row['TUTORIA'];
        $var2 = $row['TUTOR'];
        $var3 = $row['MODALIDAD'];
        $var4 = $row['SECCION'];
        $var5 = $row['HORA'];
        ?>
      
      <tbody>
         <tr>
         <td ><?php echo utf8_decode(strtolower($var1)); ?></td>
         <td ><?php echo utf8_decode(strtolower($var2)); ?></td>
         <td ><?php echo utf8_decode(strtolower($var3)); ?></td>
         <td ><?php echo utf8_decode(strtolower($var4)); ?></td>
         <td ><?php echo utf8_decode(strtolower($var5));?></td>
         </tr>
         <?php
           }
           }
         ?>
      </tbody>
    </table>
    </fieldset>
    <br>

    <br>  
    
      
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

$dompdf->stream("Matricula_Academica_Individual.pdf", array("Attachment" => true));
echo $dompdf->output();
?>

