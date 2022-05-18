<?php 
include "conexionpdo.php";
?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Home</title>
	<link rel="stylesheet" href="css/normalize.css">
	<link rel="stylesheet" href="css/sweetalert2.css">
	<link rel="stylesheet" href="css/material.min.css">
	<link rel="stylesheet" href="css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
	<link rel="stylesheet" href="css/main.css">
	
	<script>window.jQuery || document.write('<script src="js/jquery-1.11.2.min.js"><\/script>')</script>
	<script src="js/material.min.js" ></script>
	<script src="js/sweetalert2.min.js" ></script>
	<script src="js/jquery.mCustomScrollbar.concat.min.js" ></script>
	<script src="js/main.js" ></script>
</head>
<div class="content-wrapper">
<section class="content-header">
  <h1>
  <CENTER>
  <h6 class="card-subtitle" row text-center><strong><i>PROYECTO SEMILLERO CARMELITANO PROSECAR"</i></strong></h6>
  Panel Administrador  
  </CENTER>   
 </h1>
</section>
<section  class="content" >
<div class="row" style="aling-items: center;">
<div class="box-body">
<div class="panel-content"> 
<!--INICIO-->
<!--COLLAPSEvision-->
<div class="box box-primary collapsed-box">
        <div class="box-header with-border">
        <h3>
        <div class="text-center">
        <h3 class="box-title" ><strong>VISIÓN</h3>
          <div class="box-tools pull-right">
          <h3>
         </div><!-- /.box-tools -->
        </div><!-- /.box-header -->
        <div class="box-body">
        <h6 class="card-subtitle text-justify"><i>A partir de un acompañamiento integral en lo niños, niñas y jóvenes los valores humanos, cristianos y espirituales,
          que les capacite para lo que será su proyecto de vida, vocación y misión, con herramientas que les faciliten su entrada al mundo laboral.
        </i></h6>
        </div><!-- /.box-body -->
      </div><!-- /.box -->
<!--COLLAPSEvision--> 
<!--COLLAPSEmision-->
<div class="box box-danger collapsed-box">
        <div class="box-header with-border">
        <h2>
        <div class="text-center">
          <h3 class="box-title"><strong>MISIÓN</h3>
          <div class="box-tools pull-right">
          <h2>
          </div><!-- /.box-tools -->
        </div><!-- /.box-header -->
        <div class="box-body">
        <h6 class="card-subtitle text-justify"><i>Brindar acompañamiento académico, médico, psicológico, tecnológico y de espiritual que propicie el desarrollo integral, en jóvenes que estudien de 7° al 9°
          grado y bachillerato, en edades de 12 a 18 años, que pertenezcan a los sectores de Las Torres, La Rosa, La Padrera y Flor del Campo de la Parroquia Santa Teresa de Jésus. 
        </i></h6>
        </div><!-- /.box-body -->
      </div><!-- /.box -->
<!--COLLAPSEmision-->
<!--COLLAPSE1-->
<div class="box box-info collapsed-box">
        <div class="box-header with-border">
        <h2>
        <div class="text-center">
          <h3 class="box-title"><strong>USUARIOS</h3>
          <div class="box-tools pull-right">
          <h2>
          </div><!-- /.box-tools -->
        </div><!-- /.box-header -->
        <div class="box-body">
        <div class="row">
<!--ITEM5-->
<?php
include "conexionpdo.php";
    $sentencia = $db->prepare("SELECT COUNT(*) FROM tbl_usuario;");
    // llamar al procedimiento almacenado
    $sentencia->execute();
    $row=$sentencia->fetchColumn();
    $conteo4 = $row;
?>
<div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-blue">
            <div class="inner">
              <h3><?php echo $conteo4 ?></h3>
              <p><strong>Total usuarios registrados</strong></p>
            </div>
            <div class="icon">
              <i class="fa fa-users"></i>
            </div>
            <a href="ediusuarios" class="small-box-footer">Mas info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
<!--ITEM5-->
<!--ITEM6-->
<?php
include "conexionpdo.php";
    $sentencia = $db->prepare("CALL Sp_mostrar_estados(?);");
    // llamar al procedimiento almacenado
    $sentencia->execute(array(1));
    $row=$sentencia->fetchColumn();
    $conteo = $row;
?>
<div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3><?php echo $conteo ?></h3>
              <p><strong>Usuarios habilitados</strong></p>
            </div>
            <div class="icon">
              <i class="fa fa-user"></i>
            </div>
            <a href="ediusuarios" class="small-box-footer">Mas info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
<!--ITEM6-->
<!--ITEM7-->
<?php
include "conexionpdo.php";
    $sentencia = $db->prepare("CALL Sp_mostrar_estados(?);");
    // llamar al procedimiento almacenado
    $sentencia->execute(array(4));
    $row=$sentencia->fetchColumn();
    $conteo2 = $row;
?>
<div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3><?php echo $conteo2 ?></h3>
              <p><strong>Usuarios bloqueados</strong></p>
            </div>
            <div class="icon">
              <i class="fa fa-user-times"></i>
            </div>
            <a href="ediusuarios" class="small-box-footer">Mas info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
<!--ITEM7-->
<!--ITEM8-->
<?php
include "conexionpdo.php";
    $sentencia = $db->prepare("CALL Sp_mostrar_estados(?);");
    // llamar al procedimiento almacenado
    $sentencia->execute(array(5));
    $row=$sentencia->fetchColumn();
    $conteo3 = $row;
?>
<div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3><?php echo $conteo3 ?></h3>
              <p><strong>Usuarios inactivos</strong></p>
            </div>
            <div class="icon">
              <i class="fa fa-user-plus"></i>
            </div>
            <a href="ediusuarios" class="small-box-footer">Mas info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
<!--ITEM8-->
</div>
        </div><!-- /.box-body -->
      </div><!-- /.box -->
<!--COLLAPSE1-->
<!--COLLAPSE2-->
<div class="box box-success collapsed-box">
        <div class="box-header with-border">
        <div class="text-center">
          <h3 class="box-title"><strong>TIPOS DE USUARIOS</h3>
          <div class="box-tools pull-right">
          
          </div><!-- /.box-tools -->
        </div><!-- /.box-header -->
        <div class="box-body">
        <div class="row">	
<!--ITEM1-->
<?php
include "conexionpdo.php";
    $sentencia = $db->prepare("CALL Sp_mostrar_tipos_personas(?);");
    // llamar al procedimiento almacenado
    $sentencia->execute(array(1));
    $row=$sentencia->fetchColumn();
    $admin = $row;
    $Por=$admin/$conteo4; 
    $poradmin = number_format($Por, 2);
?>
<div class="col-lg-4 col-xs-7">
<div class="info-box bg-yellow">
<span class="info-box-icon"><i class="fa fa-child"></i></span>
        <div class="info-box-content">
          <span class="info-box-text">Tutores registrados</span>
          <span class="info-box-number"><?php echo $admin ?></span>
          <!-- The progress section is optional -->
          <div class="progress">
            <div class="progress-bar" style="width:<?php echo $poradmin?>%"></div>
          </div>
          <span class="progress-description">
          
           Representan un <?php echo $poradmin?>% del total <?php echo $conteo4 ?>
          </span>
        </div><!-- /.info-box-content -->
      </div><!-- /.info-box -->
</div>        
<!--ITEM1-->
<!--ITEM2-->
<?php
include "conexionpdo.php";
    $sentencia = $db->prepare("CALL Sp_mostrar_tipos_personas(?);");
    // llamar al procedimiento almacenado
    $sentencia->execute(array(2));
    $row=$sentencia->fetchColumn();
    $bog = $row;
    $Por=$bog/$conteo4; 
    $porbog = number_format($Por, 2);
?>
<div class="col-lg-4 col-xs-7">
<div class="info-box bg-red">
<span class="info-box-icon"><i class="fa fa-child"></i></span>
        <div class="info-box-content">
          <span class="info-box-text">Estudiantes registrados</span>
          <span class="info-box-number"><?php echo $bog ?></span>
          <!-- The progress section is optional -->
          <div class="progress">
            <div class="progress-bar" style="width:<?php echo $porbog?>%"></div>
          </div>
          <span class="progress-description">
          
           Representan un <?php echo $porbog?>% del total <?php echo $conteo4 ?>
          </span>
        </div><!-- /.info-box-content -->
      </div><!-- /.info-box -->
</div>        
<!--ITEM2-->
<!--ITEM3-->
<?php
include "conexionpdo.php";
    $sentencia = $db->prepare("CALL Sp_mostrar_tipos_personas(?);");
    // llamar al procedimiento almacenado
    $sentencia->execute(array(3));
    $row=$sentencia->fetchColumn();
    $venta = $row;
    $Por=$venta/$conteo4; 
    $porventa = number_format($Por, 2);
?>
<div class="col-lg-4 col-xs-7">
<div class="info-box bg-green">
<span class="info-box-icon"><i class="fa fa-child"></i></span>
        <div class="info-box-content">
          <span class="info-box-text">Medicos registrados</span>
          <span class="info-box-number"><?php echo $venta ?></span>
          <!-- The progress section is optional -->
          <div class="progress">
            <div class="progress-bar" style="width:<?php echo $porventa?>%"></div>
          </div>
          <span class="progress-description">
          
           Representan un <?php echo $porventa?>% del total <?php echo $conteo4 ?>
          </span>
        </div><!-- /.info-box-content -->
      </div><!-- /.info-box -->
</div>        
<!--ITEM3-->
<!--ITEM4-->
<?php
include "conexionpdo.php";
    $sentencia = $db->prepare("CALL Sp_mostrar_tipos_personas(?);");
    // llamar al procedimiento almacenado
    $sentencia->execute(array(5));
    $row=$sentencia->fetchColumn();
    $super = $row; 
    $Por=$super/$conteo4; 
    $porsup = number_format($Por, 2);
?>
<div class="col-lg-4 col-xs-7">
<div class="info-box bg-orange">
        <span class="info-box-icon"><i class="fa fa-child"></i></span>
        <div class="info-box-content">
          <span class="info-box-text">Psicologos registrados</span>
          <span class="info-box-number"><?php echo $super ?></span>
          <!-- The progress section is optional -->
          <div class="progress">
            <div class="progress-bar" style="width:<?php echo $porsup?>%"></div>
          </div>
          <span class="progress-description">
           Representan un <?php echo $porsup ?>% del total <?php echo $conteo4 ?>
          </span>
        </div><!-- /.info-box-content -->
      </div><!-- /.info-box -->
</div>        
<!--ITEM4-->

<?php
include "modelos/Conexionpdo.php";
    $sentencia = $db->prepare("CALL Sp_mostrar_tipos_personas(?);");
    // llamar al procedimiento almacenado
    $sentencia->execute(array(4));
    $row=$sentencia->fetchColumn();
    $con = $row;
    $Por=$con/$conteo4; 
    $porcon = number_format($Por, 2);
?>
<div class="col-lg-4 col-xs-7">
<div class="info-box bg-gray">
<span class="info-box-icon"><i class="fa fa-child"></i></span>
        <div class="info-box-content">
          <span class="info-box-text">Catequista registrados</span>
          <span class="info-box-number"><?php echo $con ?></span>
          <!-- The progress section is optional -->
          <div class="progress">
            <div class="progress-bar" style="width:<?php echo $porcon?>%"></div>
          </div>
          <span class="progress-description">
          
           Representan un <?php echo $porcon?>% del total <?php echo $conteo4 ?>
          </span>
        </div><!-- /.info-box-content -->
      </div><!-- /.info-box -->
</div>        
<!--ITEM5-->
</div>
        </div><!-- /.box-body -->
      </div><!-- /.box -->
<!--COLLAPSE2-->
<!--COLLAPSE3-->

<!--ITEM10-->
<!--ITEM11-->

</html>