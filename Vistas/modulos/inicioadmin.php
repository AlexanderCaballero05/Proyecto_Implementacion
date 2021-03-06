<?php 
include "conexionpdo.php";
?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Inicio</title>
</head>
<div class="content-wrapper">
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 px-3">Bienvenido <?php  echo $_SESSION['vario'];  ?></h1>
          </div>
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div><!-- /.content-header -->
    <section class="content">
      <div class="container-fluid">
        <div class="accordion" id="accordionExample"><!--Codigo de la mision y vision -->
          <div class="card card-info card-outline">
            <div class="card-header" id="headingOne">
              <h2 class="mb-0">
                <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                  VISIÓN
                </button>
              </h2>
            </div>
            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
              <div class="card-body">
              A partir de un acompañamiento integral en lo niños, niñas y jóvenes los valores humanos, cristianos y espirituales,
              que les capacite para lo que será su proyecto de vida, vocación y misión, con herramientas que les faciliten su entrada al mundo laboral.
              </div>
            </div>
          </div>
          <div class="card card-success card-outline">
            <div class="card-header" id="headingTwo">
              <h2 class="mb-0">
                <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                MISIÓN
                </button>
              </h2>
            </div>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
              <div class="card-body">
                Brindar acompañamiento académico, médico, psicológico, tecnológico y de espiritual que propicie el desarrollo integral, en jóvenes que estudien de 7° al 9°
                grado y bachillerato, en edades de 12 a 18 años, que pertenezcan a los sectores de Las Torres, La Rosa, La Padrera y Flor del Campo de la Parroquia Santa Teresa de Jésus. 
              </div>
            </div>
          </div>
        </div><!--fin de mision y vision -->
       
        <?php
           include "conexionpdo.php";
           $usuario=$_SESSION['vario'];
           //Evaluo si existe el tipo de Rol
           $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
           $evaluar_usuario->execute(array($usuario));
           $row=$evaluar_usuario->fetchColumn();
           if($row > 0){
             $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
             //llamar al procedimiento almacenado
             $evaluar_permiso_mostrar = $db->prepare("CALL Sp_permiso_mostrar(?,?);");
             $evaluar_permiso_mostrar->execute(array($usuariomo, '25'));
             $row1=$evaluar_permiso_mostrar->fetchColumn();
             $permiso_mostrar =$row1;             
            }
        ?>
        <?php 
          if ($permiso_mostrar == 'SI'){ // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
        ?> 
        <div class="card">
            <div style="background-color: #f4f6f9;" class="card-body">
            <div class="panel-content">
          <h4 class="m-0 px-3">Usuarios</h4><hr> 
         <div class="row">
           <?php
             include "conexionpdo.php";
             $sentencia = $db->prepare("SELECT COUNT(*) FROM tbl_usuario;");
             // llamar al procedimiento almacenado
             $sentencia->execute();
             $row=$sentencia->fetchColumn();
             $conteo4 = $row;
            ?>
            <div class="col-lg-3 col-6">
              <div class="small-box bg-info">
                <div class="inner">
                  <h3><?php echo $conteo4 ?></h3>
                  <p><strong>Total Usuarios Registrados</strong></p>
                </div>
                <div class="icon">
                   <i class="fa fa-users"></i>
                </div>
                  <a href="ediusuarios" class="small-box-footer">Mas info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div>
            <?php
              include "conexionpdo.php";
              $sentencia = $db->prepare("CALL Sp_mostrar_estados(?);");
              // llamar al procedimiento almacenado
              $sentencia->execute(array(1));
              $row=$sentencia->fetchColumn();
              $conteo = $row;
            ?>
            <div class="col-lg-3 col-6">
              <div class="small-box bg-green">
                <div class="inner">
                 <h3><?php echo $conteo ?></h3>
                 <p><strong>Usuarios Habilitados</strong></p>
                </div>
                <div class="icon">
                  <i class="fa fa-user"></i>
                </div>
                 <a href="ediusuarios" class="small-box-footer">Mas info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div>
            <?php
              include "conexionpdo.php";
              $sentencia = $db->prepare("CALL Sp_mostrar_estados(?);");
              // llamar al procedimiento almacenado
              $sentencia->execute(array(2));
              $row=$sentencia->fetchColumn();
              $conteo2 = $row;
            ?>
            <div class="col-lg-3 col-6">
               <div class="small-box bg-red">
                <div class="inner">
                    <h3><?php echo $conteo2 ?></h3>
                    <p><strong>Usuarios Bloqueados</strong></p>
                </div>
                <div class="icon">
                    <i class="fa fa-user-times"></i>
                </div>
                    <a href="ediusuarios" class="small-box-footer">Mas info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div>
            <?php
              include "conexionpdo.php";
              $sentencia = $db->prepare("CALL Sp_mostrar_estados(?);");
              $sentencia->execute(array(3));
              $row=$sentencia->fetchColumn();
              $conteo3 = $row;
            ?>
            <div class="col-lg-3 col-6">
              <div class="small-box bg-yellow">
                <div class="inner">
                    <h3><?php echo $conteo3 ?></h3>
                    <p><strong>Usuarios Inactivos</strong></p>
                </div>
                <div class="icon">
                    <i class="fa fa-user-plus"></i>
                </div>
                    <a href="ediusuarios" class="small-box-footer">Mas info <i class="fa fa-arrow-circle-right"></i></a>
               </div>
            </div>
         </div><!--Fin row -->
         <h4 class="m-0 px-3">Tipos de Usuarios</h4><hr>
         <div class="row">
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
                  <span class="info-box-text"><b>Tutores Registrados</b></span>
                  <span class="info-box-number"><?php echo $admin ?></span>
                  <!-- The progress section is optional -->
                  <div class="progress">
                    <div class="progress-bar" style="width:<?php echo $poradmin?>%"></div>
                  </div>
                  <span class="progress-description">
                  Representan un <?php echo $poradmin?>% del Total <?php echo $conteo4 ?>
                  </span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div> 
            <?php
              include "conexionpdo.php";
              $sentencia = $db->prepare("CALL Sp_mostrar_tipos_personas(?);");
              // llamar al procedimiento almacenado
              $sentencia->execute(array(2));
              $row=$sentencia->fetchColumn();
              $estu = $row;
              $Por=$estu/$conteo4; 
              $porbog = number_format($Por, 2);
            ?>
            <div class="col-lg-4 col-xs-7">
            <div class="info-box" style="background-color:#00c0ef; color:white;">
              <span class="info-box-icon"><i class="fa fa-child"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text"><b>Estudiantes Registrados</b></span>
                  <span class="info-box-number"><?php echo $estu ?></span>
                  <!-- The progress section is optional -->
                  <div class="progress">
                    <div class="progress-bar" style="width:<?php echo $porbog?>%"></div>
                  </div>
                  <span class="progress-description">
                  Representan un <?php echo $porbog?>% del Total <?php echo $conteo4 ?>
                  </span>
                </div><!-- /.info-box-content -->
              </div>
            </div>  
            <?php
                include "conexionpdo.php";
                $sentencia = $db->prepare("CALL Sp_mostrar_tipos_personas(?);");
                // llamar al procedimiento almacenado
                $sentencia->execute(array(3));
                $row=$sentencia->fetchColumn();
                $medi = $row;
                $Por=$medi/$conteo4; 
                $porventa = number_format($Por, 2);
            ?>
            <div class="col-lg-4 col-xs-7">
              <div class="info-box bg-green">
                <span class="info-box-icon"><i class="fa fa-child"></i></span>
                  <div class="info-box-content">
                    <span class="info-box-text"><b>Medicos Registrados</b></span>
                    <span class="info-box-number"><?php echo $medi ?></span>
                    <!-- The progress section is optional -->
                    <div class="progress">
                      <div class="progress-bar" style="width:<?php echo $porventa?>%"></div>
                    </div>
                    <span class="progress-description">
                    Representan un <?php echo $porventa?>% del Total <?php echo $conteo4 ?>
                    </span>
                  </div><!-- /.info-box-content -->
                </div><!-- /.info-box -->
            </div> 
         </div><!--fin row -->
         <div class="row">
           <?php
            include "conexionpdo.php";
            $sentencia = $db->prepare("CALL Sp_mostrar_tipos_personas(?);");
            // llamar al procedimiento almacenado
            $sentencia->execute(array(4));
            $row=$sentencia->fetchColumn();
            $psi = $row; 
            $Por=$psi/$conteo4; 
            $porsup = number_format($Por, 2);
          ?>
           <div class="col-lg-4 col-xs-7">
            <div class="info-box bg-info">
              <span class="info-box-icon"><i class="fa fa-child"></i></span>
              <div class="info-box-content">
                <span class="info-box-text"><b>Psicólogos Registrados</b></span>
                <span class="info-box-number"><?php echo $psi ?></span>
                <!-- The progress section is optional -->
                <div class="progress">
                  <div class="progress-bar" style="width:<?php echo $porsup?>%"></div>
                </div>
                <span class="progress-description">
                Representan un <?php echo $porsup ?>% del Total <?php echo $conteo4 ?>
                </span>
              </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
           </div> 
           <?php
            include "conexionpdo.php";
            $sentencia = $db->prepare("CALL Sp_mostrar_tipos_personas(?);");
            // llamar al procedimiento almacenado
            $sentencia->execute(array(5));
            $row=$sentencia->fetchColumn();
            $admin = $row;
            $Por=$admin/$conteo4; 
            $porventa = number_format($Por, 2);
           ?>
           <div class="col-lg-4 col-xs-7">
            <div class="info-box bg-green">
            <span class="info-box-icon"><i class="fa fa-child"></i></span>
              <div class="info-box-content">
                <span class="info-box-text"><b>Administradores Registrados</b></span>
                <span class="info-box-number"><?php echo $admin ?></span>
                <!-- The progress section is optional -->
                <div class="progress">
                  <div class="progress-bar" style="width:<?php echo $porventa?>%"></div>
                </div>
                <span class="progress-description">
                Representan un <?php echo $porventa?>% del Total <?php echo $conteo4 ?>
                </span>
              </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
          </div> 
          <?php
            include "conexionpdo.php";
            $sentencia = $db->prepare("CALL Sp_mostrar_tipos_personas(?);");
            // llamar al procedimiento almacenado
            $sentencia->execute(array(6));
            $row=$sentencia->fetchColumn();
            $enfer = $row;
            $Por=$enfer/$conteo4; 
            $poradmin = number_format($Por, 1);
          ?>
          <div class="col-lg-4 col-xs-7">
            <div class="info-box bg-yellow">
            <span class="info-box-icon"><i class="fa fa-child"></i></span>
              <div class="info-box-content">
                <span class="info-box-text"><b>Enfermeros Registrados</b></span>
                <span class="info-box-number"><?php echo $enfer ?></span>
                <!-- The progress section is optional -->
                <div class="progress">
                  <div class="progress-bar" style="width:<?php echo $poradmin?>%"></div>
                </div>
                <span class="progress-description">
                Representan un <?php echo $poradmin?>% del Total <?php echo $conteo4 ?>
                </span>
              </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
          </div> 
          <?php
           include "modelos/Conexionpdo.php";
            $sentencia = $db->prepare("CALL Sp_mostrar_tipos_personas(?);");
            // llamar al procedimiento almacenado
            $sentencia->execute(array(7));
            $row=$sentencia->fetchColumn();
            $cat = $row;
            $Por=$cat/$conteo4; 
            $porcon = number_format($Por, 2);
          ?>
          <div class="col-lg-4 col-xs-7">
            <div class="info-box bg-gray">
            <span class="info-box-icon"><i class="fa fa-child"></i></span>
              <div class="info-box-content">
                <span class="info-box-text"><b>Catequistas Registrados</b></span>
                <span class="info-box-number"><?php echo $cat ?></span>
                <!-- The progress section is optional -->
                <div class="progress">
                  <div class="progress-bar" style="width:<?php echo $porcon?>%"></div>
                </div>
                <span class="progress-description">
                Representan un <?php echo $porcon?>% del Total <?php echo $conteo4 ?>
                </span>
              </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
          </div> 

         </div><!--Fin row -->
        </div><!-- Panel-->

            </div>
        </div>
        
        <?php 
          }
        ?> 
      </div><!--Container -->
    </section>
</div>
</html>

