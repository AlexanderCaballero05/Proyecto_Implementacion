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
  }
  .pagenum:before {
        content: counter(page);
    }
    </style>
    <title>Recetas Paciente</title>
  </head>
  <body>
    <header>
      
    </header>
   <footer>
     <p style="text-align: center; "><b> Prosecar © Todos los derechos reservados <?php  echo date("Y");?> </b><b style="color:white;">letras pra rellenar para </b>
      <label >Página<span  class="pagenum"></label></p>
   </footer>

   <main>


     

   
   

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
