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


if (isset($_POST['reporte_estudiante'])) {
	$persona =($_POST['reporte_estudiante']);
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
  img{
    float: right;
    width: 80px; 
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
    <title>Reporte Estudiante</title>
  </head>
  <body>
    <header>
    <img src="../Vistas/modulos/REPORTES/img/LOGO.jpg">
      <p font face="Arial"  style="text-align: center; font-size:20px"><b>PROYECTO SEMILLERO CARMELITANO PROSECAR</b> <img></p>
      <p  style="text-align: center; font-size:20px;">Reporte del Estudiante</p>
      <p  style="font-size: 14px;"> Fecha: <?php  echo date("d/m/Y | g:i:a");?></p>
    </header>
    
   

   <footer>
      <p style="  text-align: center;"><b> Proyecto Prosecar. <?php  echo date("Y");?></b></p> 
   </footer>
   <main>
    <fieldset>
      <?php
      $query = "SELECT CONCAT_WS(' ', p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO) AS NOMBRE, p.DNI, 
      concat_ws(' ', p.LUGAR_NACIMIENTO, p.FECHA_NACIMIENTO) as LUGAR_NACIMIENTO, p.FECHA_NACIMIENTO, tel.NUMERO_TELEFONO, se.SEXO ,p.DIRECCION
      FROM tbl_persona p ,tbl_estudiante es, tbl_telefono tel, tbl_sexo se
           where es.CODIGO_PERSONA = p.CODIGO_PERSONA
           AND p.CODIGO_PERSONA = tel.CODIGO_PERSONA
           AND p.SEXO = se.CODIGO_SEXO
           AND CODIGO_ESTUDIANTE = '$persona'
           GROUP BY es.CODIGO_ESTUDIANTE";
    $resul=$conn->query($query);  
    if($resul->num_rows > 0){
      while($row = $resul->fetch_assoc()){
        $nombre = $row['NOMBRE'];
        $dni = $row['DNI'];
        $sexo = $row['SEXO'];
        $fecha = $row['FECHA_NACIMIENTO'];
        $lugar = $row['LUGAR_NACIMIENTO'];
        $telefono = $row['NUMERO_TELEFONO'];
        $direccion = $row['DIRECCION'];

        $fechaEntera = strtotime($fecha);
        $f = date("Y");
        $anio = date("Y", $fechaEntera);
        $edad = $f - $anio;

      }
    }
      ?>      
      <legend>  Datos Personales Estudiante</legend><br>
      <label style="margin-bottom: 100px;" ><b>Nombre Completo Estudiante:</b> <?php  echo ucwords(strtolower($nombre)); ?> </label><br>
      <label style="margin-bottom: 30px;" ><b>fecha de Nacimiento:</b> <?php  echo ucwords(strtolower($fecha)); ?></label> <br>
      <label style="padding-right: 80px;" ><b>DNI: </b><?php echo $dni; ?></label>
      <label style="padding-right: 110px;"><b>Edad: </b><?php echo $edad . " años"; ?></label>
      <label ><b>Sexo: </b><?php echo ucwords(strtolower($sexo)); ?></label><br>
      <label style="padding-right: 85px;" ><b>Teléfono: </b><?php echo $telefono; ?></label>
      <label style="margin-bottom: 30px;" ><b>Dirección:</b> <?php  echo ucwords(strtolower($direccion)); ?></label> <br>

    </fieldset>
    <br>

    <br>
    <fieldset>
      <legend>Datos Escolares</legend>
    <br>
    <table>
    <?php
       $consulta = "SELECT  es.GRADO_ACTUAL, es.REPITENTE, es.INDICE_ACADEMICO, es.MATE_BAJO_RENDI, es.PASATIEMPOS,
       es.DISTRACTORES_ESCOLARES, es.METAS
          FROM tbl_estudiante es
          WHERE es.CODIGO_ESTUDIANTE = '$persona'";
       $resul=$conn->query($consulta);
       if ($resul->num_rows > 0) {
        while($row = $resul->fetch_assoc()) { 
          $var1 = $row['GRADO_ACTUAL'];
          $var2 = $row['REPITENTE'];
          $var3 = $row['INDICE_ACADEMICO'];
          $var4 = $row['MATE_BAJO_RENDI'];
          $var5 = $row['PASATIEMPOS'];
          $var6 = $row['DISTRACTORES_ESCOLARES'];
          $var7 = $row['METAS'];
       
        ?>
      <thead>
         <tr>
         <th>Grado Actual</th>
           <th>Repitente</th>
           <th>Indíce Académico</th>
           <th>Materias</th>
           <th>Pasatiempos</th>
           <th>Distractores</th>
           <th>Metas</th>
          
         </tr>
      </thead>
      <tbody>
         <tr>
         <td style="text-align: center"><?php echo ucwords(strtolower($var1)); ?></td>
         <td style="text-align: center"><?php echo ucwords(strtolower($var2)); ?></td>
         <td style="text-align: center"><?php echo ucwords(strtolower($var3)); ?></td>
         <td ><?php echo ucwords(strtolower($var4)); ?></td>
         <td ><?php echo ucwords(strtolower($var5)); ?></td>
         <td ><?php echo ucwords(strtolower($var6)); ?></td>
         <td ><?php echo ucwords(strtolower($var7)); ?></td>
         
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
    $sentencia = $db->prepare("SELECT GROUP_CONCAT(con.NOMBRE_TIPO) as DISPOSITIVOS
    FROM tbl_estudiante_socioeconomico es, tbl_contenido_socioeconomico con, tbl_tipo_socioeconomico tip
    WHERE es.CODIGO_CONTENIDO_SOCIOECONOMICO = con.CODIGO_CONTENIDO_SOCIOECONOMICO
    AND con.CODIGO_TIPOSOCIO = tip.CODIGO_TIPOSOCIO
    AND con.CODIGO_TIPOSOCIO = 1
    AND es.CODIGO_ESTUDIANTE = (?); " );
	 $sentencia->execute(array($persona));
	 $row=$sentencia->fetchColumn();
	 if($row>0){
	   $dispositivos = $row;
	 }



     $sentencia = $db->prepare("SELECT GROUP_CONCAT(con.NOMBRE_TIPO) as SERVICIOS
     FROM tbl_estudiante_socioeconomico es, tbl_contenido_socioeconomico con, tbl_tipo_socioeconomico tip
     WHERE es.CODIGO_CONTENIDO_SOCIOECONOMICO = con.CODIGO_CONTENIDO_SOCIOECONOMICO
     AND con.CODIGO_TIPOSOCIO = tip.CODIGO_TIPOSOCIO
     AND con.CODIGO_TIPOSOCIO = 2
     AND es.CODIGO_ESTUDIANTE = (?); " );
      $sentencia->execute(array($persona));
      $row=$sentencia->fetchColumn();
      if($row>0){
        $servcios = $row;
      }


      $sentencia = $db->prepare("SELECT GROUP_CONCAT(con.NOMBRE_TIPO) as PROVEEDOR
      FROM tbl_estudiante_socioeconomico es, tbl_contenido_socioeconomico con, tbl_tipo_socioeconomico tip
      WHERE es.CODIGO_CONTENIDO_SOCIOECONOMICO = con.CODIGO_CONTENIDO_SOCIOECONOMICO
      AND con.CODIGO_TIPOSOCIO = tip.CODIGO_TIPOSOCIO
      AND con.CODIGO_TIPOSOCIO = 3
      AND es.CODIGO_ESTUDIANTE = (?); " );
       $sentencia->execute(array($persona));
       $row=$sentencia->fetchColumn();
       if($row>0){
         $proveedor = $row;
       }


       $sentencia = $db->prepare("SELECT GROUP_CONCAT(con.NOMBRE_TIPO) as SERVICIOS
       FROM tbl_estudiante_socioeconomico es, tbl_contenido_socioeconomico con, tbl_tipo_socioeconomico tip
       WHERE es.CODIGO_CONTENIDO_SOCIOECONOMICO = con.CODIGO_CONTENIDO_SOCIOECONOMICO
       AND con.CODIGO_TIPOSOCIO = tip.CODIGO_TIPOSOCIO
       AND con.CODIGO_TIPOSOCIO = 4
       AND es.CODIGO_ESTUDIANTE = (?); " );
        $sentencia->execute(array($persona));
        $row=$sentencia->fetchColumn();
        if($row>0){
          $basicos = $row;
        }

?>
    <fieldset>
      <legend>Datos Socieconomicos</legend>
    <br>
    <table>
      <thead>
         <tr>
           <th>Dispositivos Electrónicos</th>
           <th>Servicios de Internet</th>
           <th>Proveedor(es)</th>
           <th>Servicios Basicos</th>
          
         </tr>
      </thead>
      <tbody>
         <tr>
         <td ><?php echo ucwords(strtolower($dispositivos)); ?></td>
         <td ><?php echo ucwords(strtolower($servcios)); ?></td>
         <td ><?php echo ucwords(strtolower($proveedor)); ?></td>
         <td ><?php echo ucwords(strtolower($basicos)); ?></td>
         
         </tr>
         
      </tbody>
    </table>
    </fieldset>
     <br>
<!--formacion espritual-->
     <fieldset>
       <legend>Formación Espiritual</legend>
       <br>
       <table>
       <?php
       $consulta = "SELECT est.CODIGO_ESTUDIANTE, GROUP_CONCAT(' ',sac.NOMBRE) as sacramentos
       FROM  tbl_estudiante est, tbl_sacramento_estudiante psa, tbl_sacramento sac
       WHERE EST.CODIGO_ESTUDIANTE = psa.CODIGO_ESTUDIANTE
       		AND psa.CODIGO_SACRAMENTO = sac.CODIGO_SACRAMENTO
             AND est.CODIGO_ESTUDIANTE = '$persona'
             group by psa.CODIGO_ESTUDIANTE
                      ";
       $resul=$conn->query($consulta);
       if ($resul->num_rows > 0) {
        while($row = $resul->fetch_assoc()) { 
          $sacramentos = $row['sacramentos'];
        ?>
         <thead>
           <tr>
             <th>Iglesia Asistente</th>
             <th>Sacramentos Realizados</th>
           </tr>
         </thead>
         <tbody>
          <tr>
            <td style="text-align: center"><?php echo $Iglesiaa = "Santa Teresa de Jesús"?></td>
            <td><?php echo  ucwords(strtolower($sacramentos));?></td>
          </tr>
          <?php
           }
           }
         ?>
         </tbody>
       </table>
     </fieldset>
<!--fin de formacion espritual-->
<br>
<br>
    <fieldset>

      <legend>Situación familiar (Personas con quienes vive)</legend>
    <br>
    <table>
    <thead>
         <tr>
         <th>Nombre Apellido</th>
           <th>Edad</th>
           <th>Estado Civil</th>
           <th>Parentesco</th>
           <th>Nivel Educativo</th>
           <th>Ingresos Mensuales</th>
           <th>Iglesia Asiste</th>
          
         </tr>
      </thead>
    <?php
       $consulta = "SELECT fest.CODIGO_FAMILIAR_ESTUDIANTE, fam.CODIGO_FAMILIAR,  concat_ws(' ', per.PRIMER_NOMBRE, per.PRIMER_APELLIDO) as FAMILIAR, fam.ESTADO_CIVIL, fam.NIVEL_EDUCATIVO, fam.INGRESOS_DE_FAMILIAR, fam.NOMBRE_IGLESIA, par.NOMBRE as PARENTESCO
       from tbl_persona per, tbl_familiar fam, tbl_estudiante est, tbl_familiares_estudiante fest, tbl_parentesco par
       WHERE per.CODIGO_PERSONA = fam.CODIGO_PERSONA
       AND fest.CODIGO_ESTUDIANTE = est.CODIGO_ESTUDIANTE
       AND fest.CODIGO_FAMILIAR = fam.CODIGO_FAMILIAR
       AND fest.CODIGO_PARENTESCO = par.CODIGO_PARENTESCO
       AND fest.CODIGO_ESTUDIANTE = '$persona'
       GROUP by fam.CODIGO_FAMILIAR;
";
       $resul=$conn->query($consulta);
       if ($resul->num_rows > 0) {
        while($row = $resul->fetch_assoc()) { 
          $nombre = $row['FAMILIAR'];
          $edad = $row['INGRESOS_DE_FAMILIAR'];
          $estadocivil = $row['ESTADO_CIVIL'];
          $Parentesco = $row['PARENTESCO'];
          $Nivel = $row['NIVEL_EDUCATIVO'];
          $Ingresos = $row['INGRESOS_DE_FAMILIAR'];
          $Iglesia = $row['NOMBRE_IGLESIA'];
       
        ?>

      
      
      <tbody>
         <tr>
         <td style="text-align: center"><?php echo ucwords(strtolower($nombre)); ?></td>
         <td style="text-align: center"><?php echo ucwords(strtolower($edad)); ?></td>
         <td style="text-align: center"><?php echo ucwords(strtolower($estadocivil)); ?></td>
         <td style="text-align: center" ><?php echo ucwords(strtolower($Parentesco)); ?></td>
         <td style="text-align: center"><?php echo ucwords(strtolower($Nivel)); ?></td>
         <td style="text-align: center"><?php echo ucwords(strtolower($Ingresos)); ?></td>
         <td style="text-align: center"><?php echo ucwords(strtolower($Iglesia)); ?></td>
         
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
 <br>
 <br>
 <br>
 <br>
 <br>
    <fieldset>
      <legend>Tutorias que ha Cursado</legend>
      <br>
      <table>
        <thead>
          <tr>
                        <th class="text-center">Número</th>
                        <th class="text-center">Tutoría</th>
                        <th class="text-center">Grado</th>
                        <th class="text-center">Año</th>
                        <th class="text-center">Período</th>
                        <th class="text-center">Observación</th>


          </tr>
        </thead>
        <tbody>
               <?php
                      $query = "SELECT   mat.CODIGO_MATRICULA, concat_ws(' ',per.PRIMER_NOMBRE, per.SEGUNDO_NOMBRE, per.PRIMER_APELLIDO) as ALUMNO ,t.NOMBRE as NOMBRE_TUTORIA ,s.NOMBRE AS SECCION, c.HORA, C.ANIO, c.PERIODO, esta.NOMBRE AS ESTADO_MATRICULA
                      FROM tbl_carga_academica c ,tbl_tutoria t, tbl_persona p, tbl_modalidad m , tbl_seccion s, tbl_matricula_academica mat, tbl_estudiante est, tbl_persona per, tbl_estado esta
                      WHERE c.CODIGO_PERSONA= p.CODIGO_PERSONA 
                      AND c.CODIGO_TUTORIA= t.CODIGO_TUTORIA
                      AND c.CODIGO_MODALIDAD= m.CODIGO_MODALIDA 
                      AND c.CODIGO_SECCION = s.CODIGO_SECCION
                      AND c.CODIGO_CARGA = mat.CODIGO_CARGA
                      AND mat.CODIGO_ESTUDIANTE = est.CODIGO_ESTUDIANTE
                      AND mat.OBSERVACION = esta.CODIGO_ESTADO
                      AND est.CODIGO_PERSONA = per.CODIGO_PERSONA
                      AND mat.CODIGO_ESTUDIANTE = '$persona'; ";
                      
                      $result = $conn->query($query);
                      if ($result->num_rows > 0) {
                          $contador=0;
                        while($row = $result->fetch_assoc()) {
                          $contador=$contador+1;
                          $var2 = $row['NOMBRE_TUTORIA'];
                          $var3 = $row['SECCION'];
                          $var4 = $row['ANIO'];
                          $var5 = $row['PERIODO'];
                          $var6 = $row['ESTADO_MATRICULA'];
                          
                      ?>
                   <tr>
                        <td style="text-align: center"><?php echo $contador; ?></td>
                        <td style="text-align: center"><?php echo  ucwords(strtolower($var2)); ?></td>                      
                        <td style="text-align: center"><?php echo  ucwords(strtolower($var3)); ?></td>
                        <td style="text-align: center"><?php echo  ucwords(strtolower($var4)); ?></td>
                        <td style="text-align: center"><?php echo  ucwords(strtolower($var5)); ?></td>
                        <td style="text-align: center"><?php echo  ucwords(strtolower($var6)); ?></td>
                   </tr>
                    <?php
                        }
                        }
                      ?>
        </tbody>
      </table>
    </fieldset>
    <br>
<!------------------------------------- Are medica------------------------------------------------->
    <fieldset>
      <legend>Expediente Área Médica</legend>
      <br>
      <table>
          <thead>
                <tr>
                  <th class="text-center">Código expediente</th>
                  <th class="text-center">Fecha Creación</th>
                  <th class="text-center">Estado</th>
                  <th class="text-center">Cantidad de Citas</th>
                </tr>
          </thead>
          <tbody>
            <?php
               $sentencia = $db->prepare("SELECT ex.CODIGO_CONSULTA
               FROM tbl_consulta_medica ex ,tbl_persona pe , tbl_estudiante est, tbl_inscripcion_cita cita
               WHERE cita.CODIGO_PERSONA = pe.CODIGO_PERSONA
               and ex.CODIGO_CITA = cita.CODIGO_CITA
               and pe.CODIGO_PERSONA = est.CODIGO_PERSONA
               and est.CODIGO_ESTUDIANTE = (?); " );
                $sentencia->execute(array($persona));
                $row1=$sentencia->fetchColumn();
                if($row1>0){
                  $basicos = $row1;
                }
            ?>
          <?php
       $consulta = "SELECT ex.CODIGO_EXPEDIENTE, es.NOMBRE AS ESTADO, ex.FECHA_CREACION
       FROM tbl_expediente_medico ex ,tbl_persona pe , tbl_estado es, tbl_estudiante est
       WHERE pe.CODIGO_PERSONA = ex.CODIGO_PERSONA 
       and es.CODIGO_ESTADO = ex.CODIGO_ESTADO
       and pe.CODIGO_PERSONA = est.CODIGO_PERSONA
       and est.CODIGO_ESTUDIANTE = '$persona';
";
       $resul=$conn->query($consulta);
       if ($resul->num_rows > 0) {
        while($row = $resul->fetch_assoc()) { 
          $nombre = $row['CODIGO_EXPEDIENTE'];
          $edad = $row['FECHA_CREACION'];
          $estadocivil = $row['ESTADO'];
        ?>
            <tr>

            <td style="text-align: center"><?php echo ucwords(strtolower($nombre)); ?></td>
            <td style="text-align: center"><?php echo ucwords(strtolower($edad)); ?></td>
            <td style="text-align: center"><?php echo ucwords(strtolower($estadocivil)); ?></td>
            <td style="text-align: center"><?php echo ucwords(strtolower($row1)); ?></td>

            </tr>
          </tbody>
          <?php
                        }
                        }
                      ?>
      </table>


    </fieldset>
<!--fin de -- Are medica-->
<br>
<!---------------------------------------------------- Are Psicologica------------------------------------------------>
    <fieldset>
      <legend>Expediente en Área Psicológica</legend>
      <br>
      <table>
          <thead>
                <tr>
                  <th class="text-center">Codigo Expediente</th>
                  <th class="text-center">Fecha Creación</th>
                  <th class="text-center">Estado</th>
                  <th class="text-center">Cantidad de Citas</th>
                </tr>
          </thead>
          <tbody>
            <?php
               $sentencia = $db->prepare("SELECT ex.CODIGO_EXPEDIENTE_PSICO
               FROM tbl_expediente_psicologico_consulta ex ,tbl_persona pe , tbl_estudiante est, tbl_inscripcion_cita cita
               WHERE cita.CODIGO_PERSONA = pe.CODIGO_PERSONA
               and ex.CODIGO_CITA = cita.CODIGO_CITA
               and pe.CODIGO_PERSONA = est.CODIGO_PERSONA
               and est.CODIGO_ESTUDIANTE = (?); " );
                $sentencia->execute(array($persona));
                $row11=$sentencia->fetchColumn();
                if($row1>0){
                  $basicos = $row1;
                }
            ?>
          <?php
       $consulta = "SELECT ex.CODIGO_EXPEDIENTE, es.NOMBRE AS ESTADO, ex.FECHA_CREACION
       FROM tbl_expediente_psicologico_unico ex ,tbl_persona pe , tbl_estado es, tbl_estudiante est
       WHERE pe.CODIGO_PERSONA = ex.CODIGO_PERSONA 
       and es.CODIGO_ESTADO = ex.CODIGO_ESTADO
       and pe.CODIGO_PERSONA = est.CODIGO_PERSONA
       and est.CODIGO_ESTUDIANTE = '$persona';
";
       $resul=$conn->query($consulta);
       if ($resul->num_rows > 0) {
        while($row = $resul->fetch_assoc()) { 
          $nombre = $row['CODIGO_EXPEDIENTE'];
          $edad = $row['FECHA_CREACION'];
          $estadocivil = $row['ESTADO'];
        ?>
            <tr>

            <td style="text-align: center"><?php echo ucwords(strtolower($nombre)); ?></td>
            <td style="text-align: center"><?php echo ucwords(strtolower($edad)); ?></td>
            <td style="text-align: center"><?php echo ucwords(strtolower($estadocivil)); ?></td>
            <td style="text-align: center"><?php echo ucwords(strtolower($row1)); ?></td>

            </tr>
          </tbody>
          <?php
                        }
                        }
                      ?>
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

$dompdf->stream("Reporte_Estudiante.pdf", array("Attachment" => true));
echo $dompdf->output();
?>