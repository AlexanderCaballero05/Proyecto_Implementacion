<?php
ob_start();
?>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <style type="text/css">
      
    </style>
        <!-- Theme style -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> 
  

    <title>Reporte pacientes uwu</title>
  </head>
  <body>
  <h5 style="text-align: center;">PROYECTO SEMILLERO CARMELITANO PROSECAR</h5>
    <h5 style="text-align: center;">Reporte medico paciente</h5>
  

    
   
    <div class="card">
    <div class="card-header">
      Featured
    </div>
    <div class="card-body">
      
      <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
      <a href="#" class="btn btn-primary">Go somewhere</a>
    </div>
  </div>
    </br>

    <div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Email address</label>
  <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
</div>
<input class="form-control form-control-lg" type="text" placeholder=".form-control-lg">
<input class="form-control" type="text" placeholder="Default input">
<input class="form-control form-control-sm" type="text" placeholder=".form-control-sm">
     
 


    
    

    
  </body>
</html>
<?php
$html = ob_get_clean();
//echo $html;
require_once '../libreria_reportes/dompdf/autoload.inc.php';
use Dompdf\Dompdf;
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