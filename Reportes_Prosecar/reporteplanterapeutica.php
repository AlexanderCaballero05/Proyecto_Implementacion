<?php

    include('../Vistas/modulos/conexionpdo.php');
    session_start();
    $usuario= $_SESSION['vario'];
    //Consulta que trae el codigo del usuario
    $sentencia1 = $db->prepare("SELECT p.CODIGO_PERSONA
    FROM tbl_usuario u, tbl_persona p 
    WHERE u.CODIGO_PERSONA = p.CODIGO_PERSONA
    AND NOMBRE_USUARIO = (?);");
    $sentencia1->execute(array($usuario));
    $cod_usuario=$sentencia1->fetchColumn();
?>
<?php

ob_start();
date_default_timezone_set("America/Guatemala");
?>


<?php


include('conexion.php');
include('conexion2.php'); 


$servername = "localhost";
$username = "root";
$password = "";
$dbname = "db_proyecto_Prosecar";
try {
    $db= new PDO( "mysql:host=localhost;dbname=db_proyecto_prosecar",
                  "root",
                  "", 
                  array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));           
} catch (PDOException $e) {
    echo "ERROR DE CONEXION DE: ".$e->getMessage();
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

  .espacio{
    padding-left: 4px;
    padding-right: 4px;

  }

    </style>
    <title>Reporte cita espiritual</title>
  </head>
  <body>
    <header>
      <p font face="Arial"  style="text-align: center; font-size:20px"><b>PROYECTO SEMILLERO CARMELITANO PROSECAR</b> <img></p>
      <p  style="text-align: center; font-size: 18px;">Reporte de citas de los estudiante</p>
      <p  style="font-size: 13px;"> Fecha: <?php  echo date("d/m/Y | g:i:a");?></p>
    </header>
    
   

   <footer>
      <p style="  text-align: center;"><b> Prosecar © Todos los derechos reservados.</b></p> 
   </footer>
   <main>
    <fieldset>
      <?php
      $query = " SELECT 
      CONCAT_WS(' ',pe.PRIMER_NOMBRE,pe.SEGUNDO_NOMBRE,pe.PRIMER_APELLIDO,pe.SEGUNDO_APELLIDO) as NOMBRE,
      pe.DNI, 
      concat_ws(' ', pe.LUGAR_NACIMIENTO, pe.FECHA_NACIMIENTO) as LUGAR_NACIMIENTO,
      pe.FECHA_NACIMIENTO, 
      tel.NUMERO_TELEFONO, 
      co.CORREO_PERSONA,
      se.SEXO ,
      pe.DIRECCION
      FROM tbl_expediente_psicologico_consulta con, tbl_inscripcion_cita i, tbl_persona pe ,tbl_persona_especialidad es, tbl_estado esta , tbl_telefono tel,          
         tbl_correo_electronico co,  tbl_sexo se  
       WHERE con.CODIGO_CITA = i.CODIGO_CITA
       AND i.CODIGO_PERSONA = pe.CODIGO_PERSONA
       and pe.CODIGO_PERSONA = co.CODIGO_PERSONA 
       and pe.CODIGO_PERSONA = tel.CODIGO_PERSONA
       and pe.SEXO = se.CODIGO_SEXO
       AND i.CODIGO_ESTADO = esta.CODIGO_ESTADO
       AND I.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
       AND es.CODIGO_PERSONA = '$cod_usuario'
       AND esta.CODIGO_ESTADO = '14'
        GROUP BY pe.CODIGO_PERSONA ";
    $resul=$conn->query($query);  
    if($resul->num_rows > 0){
      while($row = $resul->fetch_assoc()){
        $nombre = $row['NOMBRE'];
        $dni = $row['DNI'];
        $sexo = $row['SEXO'];
        $fecha = $row['FECHA_NACIMIENTO'];
        $lugar = $row['LUGAR_NACIMIENTO'];
        $telefono = $row['NUMERO_TELEFONO'];
        $correo = $row['CORREO_PERSONA'];
        $direccion = $row['DIRECCION'];

        $fechaEntera = strtotime($fecha);
        $f = date("Y");
        $anio = date("Y", $fechaEntera);
        $edad = $f - $anio;

      }
    }
      ?>      
      <legend>  Datos Personales Estudiante</legend><br>
      <label style="margin-bottom: 100px;" ><b>Nombre completo:</b> <?php  echo ucwords(strtolower($nombre)); ?> </label><br>
      <label style="margin-bottom: 30px;" ><b>Lugar y fecha de nacimiento:</b> <?php  echo ucwords(strtolower($lugar)); ?></label> <br>
      <label style="padding-right: 80px;" ><b>DNI: </b><?php echo $dni; ?></label>
      <label style="padding-right: 110px;"><b>Edad: </b><?php echo $edad . " años"; ?></label>
      <label ><b>Sexo: </b><?php echo ucwords(strtolower($sexo)); ?></label><br>
      <label style="padding-right: 85px;" ><b>Telefono: </b><?php echo $telefono; ?></label>
      <label><b>Correo: </b><?php echo $correo; ?></label><br>
      <label style="margin-bottom: 30px;" ><b>Direccion:</b> <?php  echo ucwords(strtolower($direccion)); ?></label> <br>

    </fieldset>
    <br>

    <br>
    <fieldset>
      <legend>Datos de la cita espiritual </legend>
    <br>
    <table>
    <?php
      
       $consulta = "SELECT tpt.ACTIVIDAD ,tpt.TECNICA 
       ,tpt.MATERIALES ,tpt.TAREAS ,tpt.RESULTADOS 
       FROM tbl_expediente_psicologico_consulta con, tbl_inscripcion_cita i, tbl_persona pe ,tbl_persona_especialidad es, tbl_estado esta , tbl_plan_terapeutico tpt  
        WHERE con.CODIGO_CITA = i.CODIGO_CITA
        AND i.CODIGO_PERSONA = pe.CODIGO_PERSONA
        AND i.CODIGO_ESTADO = esta.CODIGO_ESTADO
        and tpt.CODIGO_CONSULTA = con.CODIGO_EXPEDIENTE_PSICO 
        AND I.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
        AND es.CODIGO_PERSONA = '$cod_usuario'
        AND esta.CODIGO_ESTADO = '14'"; 
       $resul=$conn->query($consulta);
       if ($resul->num_rows > 0) {
        while($row = $resul->fetch_assoc()) { 
          $var1 = $row['ACTIVIDAD'];
          $var2 = $row['TECNICA'];
          $var3 = $row['MATERIALES'];
          $var4 = $row['TAREAS'];
          $var5 = $row['RESULTADOS'];
       
        ?>
      <thead>
         <tr>
           <th>Actividad</th>
           <th>Tecnica</th>
           <th>Materiales</th>
           <th>Tareas</th>
           <th>Resultados</th>  
         </tr>
      </thead>
      <tbody>
         <tr>
         <td style="text-align: center"><?php echo ucwords(strtolower($var1)); ?></td>
         <td style="text-align: center"><?php echo ucwords(strtolower($var2)); ?></td>
         <td style="text-align: center"><?php echo ucwords(strtolower($var3)); ?></td>
         <td ><?php echo ucwords(strtolower($var4)); ?></td>
         <td ><?php echo ucwords(strtolower($var5)); ?></td>
         
         </tr>
         <?php
           }
           }
         ?>
      </tbody>
    </table>
    </fieldset>
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

$dompdf->setPaper('a4','landscape');
$dompdf->render();

$dompdf->stream("reporte.pdf", array("Attachment" => false));
echo $dompdf->output();
?>