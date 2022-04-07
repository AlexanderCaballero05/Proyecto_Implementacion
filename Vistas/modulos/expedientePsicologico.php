<?php
 include_once "conexion1.php";
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
                <h4> EXPEDIENTE PSICOLOGICO PACIENTE <i class="nav-icon fas fa-stethoscope"></i></h4>
            </section>
            <div class="card">
                <div class="card-header" style="background-color:#B3F2FF;">
                <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Citas Psicologicas</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Registrar expediente</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Consultas Psicologicas</a>
            </li>
            <li class="nav-item">
            <a class="nav-link active" style="color:#000000;" href="#">Informe de consulta</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Planes terapeuticos</a>
            </li>
          </ul>
                </div><!--FIN DEL CARD HEADER -->
                <div class="card-body"><!--Cuerpo del card body principal -->
                <button type="submit"  id="" name="FINALIZAR_EXPEDIENTE" class="btn btn-info btn mx-1"><span><i class="nav-icon fas fa-edit mx-1"></i></span>Crear Plan terapeutico</button>

                <form method="POST" >
                  </br><strong class="form-check-label" >Datos Personales  Paciente</strong>
                  <hr> 
                  <div class="row">
                     <div  class="col-sm-5 mb-3">
                         <label for="" class="control-label">Nombre Paciente</label>
                         <?php 
                           $query = "SELECT p.CODIGO_PERSONA, p.DNI, c.CODIGO_CITA as CODIGO, CONCAT_WS(' ',p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE, p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) 
                           as PACIENTE , p.FECHA_NACIMIENTO from tbl_inscripcion_cita c ,tbl_persona p ,tbl_area a
                           where p.CODIGO_PERSONA = c.CODIGO_PERSONA
                           AND c.CODIGO_ESTADO = '12' and  c.AREA_CITA = a.CODIGO_AREA  and a.CODIGO_AREA = 3 ";
                           $resul=$conn->query($query);                
                           ?>  
                              <?php 
                                   if ($resul->num_rows > 0) {
                                   while($row = $resul->fetch_assoc()) { 
                                    $codigo_cita = $row['CODIGO'];
                                    $persona = $row['CODIGO_PERSONA'];
                                    $nombre_pa = $row['PACIENTE'];
                                    $dni = $row['DNI'];
                                    $fecha = $row['FECHA_NACIMIENTO'];
                              ?>              
                          <label for="" class="control-label">Paciente</label> 
                          <div class="form-group">
                            <input  readonly class="form-control" value="<?php echo $nombre_pa;?>">
                            <input  hidden name="EXPEDIENTE_CITA" value="<?php echo $codigo_cita;?>">
                          </div>
                     </div>
                     <div  class="col-sm-4 mb-3">
                         <label for="" class="control-label">DNI</label>
                          <div class="form-group">
                             <input  readonly class="form-control" value="<?php echo $dni;?>">
                          </div>
                     </div>
                     
                     <div  class="col-sm-3 mb-3">
                         <label for="" class="control-label">Fecha Nacimiento</label>
                          <div class="form-group">
                             <input  readonly class="form-control" value="<?php echo $fecha;?>">
                          </div>
                     </div>
                  <?php
                    }
                    }
                 ?>
                  </div><!--fin row -->
                  <strong class="form-check-label" >Datos generales Expediente</strong>
                  <hr> 
                  <div class="row">
                      <?php
                       $consulta = "SELECT exp.CODIGO_EXPEDIENTE, concat(per.PRIMER_NOMBRE,' ',per.PRIMER_APELLIDO) as nombr, exp.ANTECEDENTES_FAMILIARES, exp.ANTECEDENTES_PERSONALES, exp.ANTECEDENTES_CLINICOS, sin.TIPO
                       FROM tbl_expediente_psicologico_unico exp, tbl_persona per, tbl_personas_sintomas psin, tbl_sintomas_neuroticos sin            			       WHERE exp.CODIGO_PERSONA = per.CODIGO_PERSONA
                       AND exp.CODIGO_EXPEDIENTE = psin.CODIGO_EXPEDIENTE
                       AND psin.CODIGO_SINTOMA_NEUROTICO = sin.CODIGO_SINTOMA_NEUROTICO
                       AND exp.CODIGO_PERSONA = '$persona'";
                       $resul=$conn->query($consulta);
                      ?>
                      <?php 
                         if ($resul->num_rows > 0) {
                         while($row = $resul->fetch_assoc()) { 
                         $sangre = $row['ANTECEDENTES_FAMILIARES'];
                         $tratamientos = $row['ANTECEDENTES_PERSONALES'];
                         $enfermedades = $row['ANTECEDENTES_CLINICOS'];
                         $alergias = $row['TIPO'];
                         
                        ?>   
                     <div class="col-sm-3 mb-3">
                         <label for="" class="control-label">Antecedentes Familiares</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $sangre ;?></textarea>
                          </div>
                     </div>
                     <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Antecedentes Personales</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $tratamientos ;?></textarea>
                          </div>
                     </div>
                     <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Antecedentes clinicos</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $enfermedades;?></textarea>
                          </div>
                     </div>
                     <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Sintomas neuroticos</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $alergias;?></textarea>
                          </div>
                     </div>
                
                       
                       <?php
                       }
                       }
                      ?>
                  </div><!--fin row -->
                  <strong class="form-check-label">Información de la consulta</strong>
                  <hr> 
                  <div class="row">
                      <?php
                       $codigo='12';
                       $area='3';
                       $consultar = $db->prepare("SELECT c.CODIGO_CITA  from tbl_inscripcion_cita c  ,tbl_area a
                       where  c.CODIGO_ESTADO = (?) and  c.AREA_CITA = a.CODIGO_AREA  and a.CODIGO_AREA = (?);");
                       $consultar->execute(array($codigo,$area));
                       $row=$consultar->fetchColumn();
                       if($row >0 ){
                          $cita = $row;
                       }
                       $consulti ="SELECT * FROM `tbl_expediente_psicologico_consulta` cm ,tbl_inscripcion_cita c
                       where 	cm.CODIGO_CITA = c.CODIGO_CITA and  cm.CODIGO_CITA = '$cita'";
                        $resul=$conn->query($consulti);
                      ?>
                      <?php 
                         if ($resul->num_rows > 0) {
                         while($row = $resul->fetch_assoc()) { 
                         $sintomas = $row['SINTOMAS'];
                         $diagnostico_ingreso = $row['DIAGNOSTICO_INGRESO'];
                         $evolucion = $row['OBSEVARCIONES'];
                         $diagnostico_egreso = $row['DIAGNOSTICO_EGRESO'];
                         
                        ?> 
                      <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Sintomas</label>
                          <div class="form-group">
                             <textarea  type="textarea" readonly class="form-control" ><?php echo $sintomas;?></textarea>
                          </div>
                      </div>
                      <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Diagnostico Ingreso</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $diagnostico_ingreso ; ?></textarea>
                          </div>
                      </div>
                      <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Observaciones</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $evolucion; ?></textarea>
                          </div>
                      </div>
                      <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Diagnostico de egreso</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $diagnostico_egreso; ?></textarea>
                          </div>
                      </div>
                      <?php
                       }
                       }
                      ?>
                  </div><!-- fin row-->
                 

                  <button type="submit"  id="" name="FINALIZAR_EXPEDIENTE" class="btn btn-info btn mx-1"><span><i class="nav-icon fas fa-arrow-right mx-1"></i></span>Cierre</button>
                  <button   href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger "> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>
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

