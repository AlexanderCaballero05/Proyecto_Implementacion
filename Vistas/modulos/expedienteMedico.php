<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include "conexionpdo.php";
 
 $codigoObjeto=2;
 $accion='Ingreso a la tabla de roles';
 $descripcion= 'Usuario se autentifico ';
 bitacora($codigoObjeto, $accion,$descripcion);
 
?>

<body oncopy="return false" onpaste="return false"> 
    <div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
        </div><!-- /.container-fluid -->
    </div>
    <section class="content">
        <div class="container-fluid">
            <section class="content-header text-xl-center mb-3 btn-light"> 
                <h4> EXPEDIENTE MEDICO PACIENTE <i class="nav-icon fas fa-stethoscope"></i></h4>
            </section>
            <div class="card">
                <div class="card-header" style="background-color:#B3F2FF;">
                    <ul class="nav nav-tabs card-header-tabs">
                       <li class="nav-item">
                            <a class="nav-link" style="color:#000000;" href="#">Citas Medicas</a>
                        </li>
                        <li class="nav-item">
                            <a  class="nav-link " aria-current="true" href="#"  style=" color:#000000;">Pre Clinica</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" style="color:#000000;" href="#">Consultas Medicas</a>
                        </li>
                        <li class="nav-item">
                           <a class="nav-link" style="color:#000000;" href="#">Recetas Medicas</a>
                        </li>
                        <li class="nav-item">
                           <a class="nav-link active" style="color:#000000;" href="#">Expedientes Medicos</a>
                        </li>
                    </ul>
                </div><!--FIN DEL CARD HEADER -->
                <div class="card-body"><!--Cuerpo del card body principal -->
                <form method="POST"  class=" needs-validation" novalidate>
                  </br><strong class="form-check-label" >Datos Personales  Paciente</strong>
                  <hr> 
                  <div class="row">
                     <div  class="col-sm-5 mb-3">
                         <label for="" class="control-label">Nombre Paciente</label>
                          <div class="form-group">
                             <input  readonly class="form-control" value="<?php echo $nombre_pa;?>">
                             <input  hidden name="codigo_paciente" value="<?php echo $codigo;?>">
                          </div>
                     </div>
                     <div  class="col-sm-4 mb-3">
                         <label for="" class="control-label">DNI</label>
                          <div class="form-group">
                             <input  readonly class="form-control" value="<?php echo $nombre_pa;?>">
                          </div>
                     </div>
                     <div  class="col-sm-3 mb-3">
                         <label for="" class="control-label">Fecha Nacimiento</label>
                          <div class="form-group">
                             <input  readonly class="form-control" value="<?php echo $nombre_pa;?>">
                          </div>
                     </div>
                  </div><!--fin row -->
                  <strong class="form-check-label" >Datos generales Expediente</strong>
                  <hr> 
                  <div class="row">
                     <div  class="col-sm-2 mb-3">
                         <label for="" class="control-label">Tipo Sangre</label>
                          <div class="form-group">
                             <input  readonly class="form-control" value="<?php echo $nombre_pa;?>">
                          </div>
                     </div>
                     <div  class="col-sm-5 mb-3">
                         <label  class="form-label">Tratamientos que toma actualmente</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" value="<?php echo $nombre_pa;?>"></textarea>
                          </div>
                     </div>
                     <div  class="col-sm-5 mb-3">
                         <label  class="form-label">Enfermedad que padece</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" value="<?php echo $nombre_pa;?>"></textarea>
                          </div>
                     </div>
                  </div>
                  <strong class="form-check-label" >Datos generales Expediente</strong>
                  <hr> 
                  <div class="row">
                       <div class="col-sm-4 mb-3">
                            <div class="card">
                                <div class="card-header" style="background-color:#DFD4FE;">
                                    <strong>ALERGIAS </strong>
                                </div>
                                <div class="card-body">

                                </div>
                            </div>
                       </div>
                       <div class="col-sm-4 mb-3">
                            <div class="card">
                                <div class="card-header" style="background-color:#DFD4FE;">
                                    <strong>Trastornos Corporales</strong>
                                </div>
                                <div class="card-body">

                                </div>
                            </div>
                       </div>
                       <div class="col-sm-4 mb-3">
                            <div class="card">
                                <div class="card-header" style="background-color:#DFD4FE;">
                                    <strong>Apariencia Fisica</strong>
                                </div>
                                <div class="card-body">

                                </div>
                            </div>
                       </div>
                  </div><!--fin row -->
                  <strong class="form-check-label">Información de la consulta</strong>
                  <hr> 
                  <div class="row">
                      <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Sintomas</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" value="<?php ?>"></textarea>
                          </div>
                      </div>
                      <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Diagnostico</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" value="<?php ?>"></textarea>
                          </div>
                      </div>
                      <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Evolución</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" value="<?php ?>"></textarea>
                          </div>
                      </div>
                      <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Diagnostico de egresp</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" value="<?php ?>"></textarea>
                          </div>
                      </div>
                  </div><!-- fin row-->
                  <strong class="form-check-label">Información de la receta</strong>
                  <hr> 
                  <div class="row">
                     <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Medicamentos recetados</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" value="<?php ?>"></textarea>
                          </div>
                      </div>
                      <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Observaciones medicamentos</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" value="<?php ?>"></textarea>
                          </div>
                      </div>
                  </div>
                </form>
                </div><!--fin card body -->
            </div><!-- FINAL cad genera -->
        </div><!-- FINAL CONTAINER FLUID --> 
    </section><!-- FINAL SECTION -->
</body>

   <script>//previene que se mantenga una tecla pulsada
      var texto=document.getElementById('bloquear');
      texto.addEventListener('keydown', function(keyboardEvent) {
        if (keyboardEvent.repeat)
            keyboardEvent.preventDefault();
      });
      var texto1 =document.getElementById('bloquear1');
      texto1.addEventListener('keydown', function(keyboardEvent) {
        if (keyboardEvent.repeat)
            keyboardEvent.preventDefault();
      });
  </script>

  <script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteRol.php','_blank');
      window.open(this.href,'_self');
    }
  </script> 

