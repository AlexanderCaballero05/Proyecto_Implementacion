<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include_once 'conexionpdo.php';
 include "conexionpdo.php";
 
 $codigoObjeto=20;
 $accion='Ingreso al proceso de Carga Academica';
 $descripcion= 'Usuario se autentifico ';
 bitacora($codigoObjeto, $accion,$descripcion);
?>

<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
</head>
                   

    <div id="AGREGAR_EXAMEN" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form  method="POST"  class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Examen</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Nombre del examen:</label>
                                    <input id="bloquear"  type="text"  class="form-control"  maxlength="40" minlength="5"   onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese un nombre al examen" name="nombre_examen"  required="">
                                    <div class="invalid-feedback">
                                     campo obligatorio.
                                   </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Descripción del examen:</label>
                                    <textarea  type="text"   class="form-control"  maxlength="100"  autocomplete = "off" type="text"  placeholder="Ingrese una descripción al examen" name="descripcion_examen"  required=""></textarea>
                                    <div class="invalid-feedback">
                                      campo obligatorio.
                                   </div>
                                </div>
                            </div>
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" name="agregar_examen_medico" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR UN EXAMEN --> 

   <div id="AGREGAR_RECETA" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form  method="POST"  class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar un medicamento</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW --> 
                             <div class="col-sm-12">
                                  <div class="form-group">
                                   <label for="txtcodigo_persona"> Codigo del Medicamento</label>
                                    <input type="text"  class="form-control" maxlength="10" onkeyup="mayus(this);" autocomplete="off" type="text"  onkeypress="return solonumero(event)" ; 
                                     name="agregar_cod_medi">
                                 </div>
                              </div>
                            <div class="col-sm-12">
                              <div class="form-group">
                                <label for="txtcodigo_persona">Nombre del Medicamento</label>
                                <input type="text" class="form-control" maxlength="50" minlength="5"  onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);"
                                 name="agregar_medicamento" >
                              </div>
                            </div>
                            <div class="col-sm-12">
                               <div class="form-group">
                                  <label for="txtcodigo_persona">Descripcion</label>
                                  <input type="text" class="form-control" maxlength="100" minlength="5" onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);"
                                   name="agregar_med_desc" >
                                </div>
                            </div>  
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" name="AGREGAR_MEDICAMENTO" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR UN MEDICAMENTO --> 

<div class="content-wrapper">
    <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  <section class="content">     
  <div class="container-fluid">
   <section class="content">
    <div class="container-fluid">
        <section class="content-header text-xl-center mb-3 btn-light"> 
          <h4> REGISTRO DE RECETAS PROSECAR  <i class="nav-icon fas fa-stethoscope"></i></h4>
        </section>
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
            <ul class="nav nav-tabs card-header-tabs">
              <li class="nav-item">
                 <a class="nav-link" style="color:#000000;" href="#">Citas Medicas</a>
              </li>
              <li class="nav-item">
                <a  class="nav-link" aria-current="true" href="#"  style=" color:#000000;">Pre Clinica</a>
              </li>
              <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Consultas Medicas</a>
            </li>

            <li class="nav-item">
            <a  class="nav-link active" style="color:#000000;" href="#">Recetas Medicas</a>
            </li>
            </ul>
          </div>
          <div class="card-body"><!--Cuerpo del card body principal -->
          <div class="card-header "> <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                      <h2 class="card-title" > <strong>Registro de recetas medicas</strong></h2>
           </div></br>

         <form method="POST" class="needs-validation" novalidate>

         <div class="row pl-3 ">
         <?php
          $usuario= $_SESSION['vario'];
          $sentencia1 = $db->prepare("SELECT p.CODIGO_PERSONA
          FROM tbl_usuario u, tbl_persona p 
          WHERE u.CODIGO_PERSONA = p.CODIGO_PERSONA
          AND NOMBRE_USUARIO = (?);");
          $sentencia1->execute(array($usuario));
          $cod_usuario=$sentencia1->fetchColumn();
          ?>
        <?php   
            $query = "SELECT con.CODIGO_CONSULTA, con.CODIGO_CITA, CONCAT_WS(' ',pe.DNI,pe.PRIMER_NOMBRE,pe.SEGUNDO_NOMBRE,pe.PRIMER_APELLIDO) as PACIENTE , i.FECHA_CITA
            FROM tbl_consulta_medica con, tbl_inscripcion_cita i, tbl_persona pe ,tbl_persona_especialidad es, tbl_estado esta
            WHERE con.CODIGO_CITA = i.CODIGO_CITA
            AND i.CODIGO_PERSONA = pe.CODIGO_PERSONA
            AND i.CODIGO_ESTADO = esta.CODIGO_ESTADO
            AND I.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
            AND es.CODIGO_PERSONA = '$cod_usuario'
            AND esta.CODIGO_ESTADO = '8';";
            $resultadocon=$conn->query($query); 
            ?>
            <?php
            if ($resultadocon->num_rows > 0) {
              while($row = $resultadocon->fetch_assoc()) { 
              $codigocon = $row['CODIGO_CONSULTA'];
              $codigocita = $row['CODIGO_CITA'];
              $nombrecon = $row['PACIENTE'];   
              $fecha_cita = $row['FECHA_CITA'];            
            ?>
         <div class="col-sm-3 mb-3">
          <label for="" class="form-label">Fecha de receta</label>
          <input class="form-control" type="text" hidden value="<?php echo $fecha_cita?>" name="fecha_receta" id="" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);">
          <input class="form-control" type="text" readonly value="<?php echo $fecha_cita?>" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);">
      </div>
<!--Inicio del paciente -->
<div class="col-sm-6  mb-3">

    <label for="" class="control-label">Paciente</label> 
    <div class="form-group">
       <input  readonly class="form-control" value="<?php echo $nombrecon;?>">
       <input type="text" name="codigo_consulta" hidden  value="<?php echo $codigocon?>" > 
       <input type="text" hidden value="<?php echo $codigocita ?>" name="codigo_cita">    
    </div>
    <?php 
      } 
      }
     ?>
   </div><!--fin del paciente -->
       <div class="col-sm-3 mb-3">
            <div class="form-group">
              <label for="" class="control-label">Tipo de receta</label>
              <select class="form-control select2 " required id="recetas" name="recetas" required> 
                <option selected disabled value="">--Seleccione--</option>
                <option  value="1">--Receta medica--</option>
                <option  value="2">--Examen medico--</option>
                
              </select>
              <div class="invalid-feedback">
                Llene este campo.
              </div>
            </div>
       </div>  
    </div><!--fin row para no perderse -->
        <!--select  para agregar el medicamento-->
        <div style ="display:none;"  id="medicamentos"> 
               <?php
                $query1 = "SELECT me.CODIGO_MEDICAMENTO , me.NOMBRE_MEDICAMENTO
                FROM tbl_medicamento me; ";
                $resultado2=$conn->query($query1);
                ?>
                <div class="row pl-4 mb-3 "  >
                 <button  data-toggle="modal"  href="#AGREGAR_RECETA" type='button'   style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar medicamento</button>
                  <div class="col-sm-10">
                   <!-- <label for="identidad" class="control-label">Medicamento</label> -->
                      <select  style="width: 100%;"  class="form-control select2" name="codigo_medicamento" id="" type="text">
                      <option selected disabled value="">---Buscar medicamento---</option>
                          <?php 
                            if ($resultado2->num_rows > 0) {
                            while($row1 = $resultado2->fetch_assoc()) { 
                            $codigo1 = $row1['CODIGO_MEDICAMENTO'];
                            $nombre1 = $row1['NOMBRE_MEDICAMENTO'];
                            ?>
                          <option value="<?php echo $codigo1?>" ><?php echo $nombre1;?></option>
                          <?php 
                          } 
                          }
                          ?>
                      </select>
                  </div>  
                </div> <!--fin de Datalist para agregar el medicamento-->
              </div>
              <div style ="display:none;"  id="examenes"> 
                  <?php
                  $query3 = "SELECT * FROM `tbl_examenes_medicos`; ";
                  $resultado3=$conn->query($query3);
                  ?>
                <div class="row pl-4 mb-3 "  >
                 <button  data-toggle="modal"  href="#AGREGAR_EXAMEN" type='button'   style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar examen</button>
                  <div class="col-sm-10">
                   <!-- <label for="identidad" class="control-label">Medicamento</label> -->
                      <select  style="width: 100%;"  class="form-control select2" name="codigo_examen"  type="text">
                      <option selected disabled value="">---Buscar Examenes---</option>
                          <?php 
                            if ($resultado3->num_rows > 0) {
                            while($row1 = $resultado3->fetch_assoc()) { 
                            $codigo2 = $row1['CODIGO_EXAMEN_MEDICO'];
                            $nombre2 = $row1['EXAMEN_MEDICO'];
                            ?>
                          <option value="<?php echo $codigo2?>" ><?php echo $nombre2;?></option>
                          <?php 
                          } 
                          }
                          ?>
                      </select>
                  </div>  
                </div> <!--fin de Datalist para agregar el examen-->
              </div>
              <div class="modal fade" id="AGREGAR_RECETA" class="modal fade" role="dialog">
              
              </div><!-- FIN DEL MODAL AGREGAR -->
                  <div class="row pl-3">
                        <div class="col-md-6"> <!--INICIO INDICE ACADEMICO-->
                          <label for="identidad" class="control-label">Indicacione de receta</label> 
                          <div class="form-group">
                            
                          <textarea class="form-control" type="textarea" name="indicaciones" id="indicaciones" onkeyup="mayus(this);" autocomplete = "off" onkeypress=""></textarea>
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                        </div>
                        <div class="col-md-6"> <!--INICIO PASATIEMPOS-->
                          <label for="MATERIAS" class="control-label">Observaciones</label> 
                          <div class="form-group">
                          <textarea class="form-control" type="textarea" name="observaciones" id="observaciones" onkeyup="mayus(this);" autocomplete = "off" onkeypress=""></textarea>
                               <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                        </div>
                  </div>
                      </br></br></br>
                      <div class="card-footer mb-2 pr-2">
                           <button type="submit"  id="receta_medica" name="receta_medica" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                      <!--colocar esta seguro que quiere finalizar la consulta-->
                           <button style="color:#ffff;" type="submit"   name="finalizar_consulta" class="btn btn-warning btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Finalizar consulta</button>
                      </div>
          </form>
          </div>
        </div>
   </div><!-- CIerre del container fluid--> 
  </section>
</div><!-- Cierre del div wraper -->


<!--Para el que vea este archivo perdon tando desmadre :'v  -->

<script>//codigo del select
    $( function() {
        $("#recetas").change( function() {
        if ($(this).val() === "1") {//
          document.getElementById('examenes').style.display = "none";
          document.getElementById('medicamentos').style.display = "block";

        }else if($(this).val() === "2"){//
          document.getElementById('medicamentos').style.display = "none";
          document.getElementById('examenes').style.display = "block";
        }
    });
  }); // 
</script>

<script type="text/javascript">
(function() {
    'use strict'
    var forms = document.querySelectorAll('.needs-validation')
    Array.prototype.slice.call(forms)
        .forEach(function(form) {
            form.addEventListener('submit', function(event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }
                form.classList.add('was-validated')
            }, false)
        })
})()
</script>
