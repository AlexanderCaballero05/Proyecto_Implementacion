<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include "conexionpdo.php";
 
 $codigoObjeto=23;
 $accion='Ingreso Matricula';
 $descripcion= 'Ingreso al proceso/registros de matricula ';
 bitacora($codigoObjeto, $accion,$descripcion);
?>



<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  <section class="content">
    <div class="container-fluid">

    <section class="content">
    <div class="container-fluid">
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link " style="color:#000000;" href="#">Citas Medicas</a>
            </li>
            <li class="nav-item" disabled="disabled">
            <a class="nav-link" style="color:#000000;" href="#">Pre Clinica</a>
            </li>
            <li class="nav-item">
            <a class="nav-link active" style="color:#000000;" href="#">Consultas Medicas</a>
            </li>
            <li class="nav-item">
            <a class="nav-link " style="color:#000000;" href="#">Recetas Medicas</a>
            </li>
          </ul>
          </div>
          <div class="card-body"><!--Cuerpo del card body principal -->
            
            <form id="formMatricula" action="procesoMatricula" method="POST">
            <h5>Datos del Paciente</h5>
            <hr>
            
            <form action="">
            <div class="row mb-8">
                    <div class="col">
                    <?php 
                          $query = "SELECT c.CODIGO_CITA as CODIGO, CONCAT_WS(' ',p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE, p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) 
                          as PACIENTE  from tbl_inscripcion_cita c ,tbl_persona p
                          where p.CODIGO_PERSONA = c.CODIGO_PERSONA
                          AND c.CODIGO_ESTADO = '11'";
                          $resul=$conn->query($query);                
                          ?>
                      <label for="">Nombre del paciente:</label>
                       <input type="text" name="nombre" class="form-control"  aria-label="primer nombre" onkeyup="mayus(this);" minlength="3" maxlength="20" value="" >
                    </div>
                     <div class="col">
                         <label for="">DNI:</label>
                         <input type="text" name="dni" class="form-control"  aria-label="segundo nombre" onkeyup="mayus(this);" minlength="3" maxlength="20" onkeypress="return soloLetras(event);"  required onblur="quitarespacios(this);" onkeydown="sinespacio(this);" required="">
                    </div>
                    </div>
            </form>
            
                    </br>
                    <h5>Preclinica</h5>
                    <hr>
                  
            <!--INICIO COMBOBOX PARA ELEGIR AL ESTUDIANTE-->
            <div class="form-group">
            <div class= "row">                      
            <div class="col-sm-2 mb-3">
                         <label for="" class="control-label">Peso</label> 
                            <div class="form-group">
                                <input type="text"  required class="form-control" name="peso" required >
                                <div class="invalid-feedback">
                                 Llene este campo.
                                </div>
                            </div>
                        </div><!--fin del peso -->

                        <div  class="col-sm-2 mb-3">
                          <label for="" class="control-label">Estatura</label> 
                            <div class="form-group">
                                <input type="text"  required class="form-control"  name="estatura" required >
                                <div class="invalid-feedback">
                                 Llene este campo.
                                </div>
                            </div>
                        </div><!--fin del la estatura -->
                        <div  class="col-sm-2 mb-3">
                          <label for="" class="control-label">temperatura</label> 
                            <div class="form-group">
                                <input type="text"  required class="form-control"  name="temperatura" required >
                                <div class="invalid-feedback">
                                 Llene este campo.
                                </div>
                            </div>
                        </div><!--fin del temperatura -->
                        <div  class="col-sm-4 mb-3">
                          <div class="form-group">
                            <label for="" class="control-label">Estatus de desnutrición</label>
                            <select class="form-control " required name="desnutricion" required> 
                             <option  value="">--Seleccione--</option>
                              <option  value="No tiene">No tiene</option>
                              <option   value="Moderado">Moderado</option>
                              <option  value="Grave">Grave</option>
                            </select>
                          </div>
                        </div>
                    </div> <!--fin del row -->
                    <div class="row">
                     
                       <div  class="col-sm-2 mb-3">
                          <label for="" class="control-label">Presión Arterial</label> 
                           <div class="form-group">
                             <input class="form-control" type="text" name="FC" required> 
                              <div class="invalid-feedback">
                              Llene este campo.
                              </div>
                            </div>
                        </div><!--fin de presion -->
                        <div class="col-md-2 mb-3"> <!--Nivel de respiracion-->
                          <label for="validationCustom03"  class="control-label">Nivel Respiración</label> 
                          <div class="form-group">
                            <input class="form-control"  type="text"  name="FR"  required >
                              <div class="invalid-feedback">
                              Llene este campo.
                              </div>
                          </div>
                        </div>
                        <div class="col-md-2 mb-3"> <!--PULSO-->
                          <label for="validationCustom03"  class="control-label">Pulso</label> 
                          <div class="form-group">
                            <input class="form-control"  type="text"  name="pulso"  required >
                              <div class="invalid-feedback">
                              Llene este campo.
                              </div>
                          </div>
                        </div>
                        <div class="col-md-4 mb-3"> <!--masica corporal-->
                          <label for="validationCustom03"  class="control-label">Indice masa corporal</label> 
                          <div class="form-group">
                            <input class="form-control"  type="text"  name="masa_corporal"  required >
                              <div class="invalid-feedback">
                              Llene este campo.
                              </div>
                          </div>
                        </div>
                      </div><!--fin del div de form-group-->
                      
                    </div><!--fin del div de row-->
                    
                    <h5>Consulta</h5>
                    <hr>
                    <div class="row">
                      <div class="col-md-6"> 
                        <label for="identidad" class="control-label">Sintomas:</label> 
                        <div class="form-group">
                          <textarea class="form-control" type="text" maxlength="500" minlength="5" name="sintomas" id="sintomas"   autocomplete = "off"></textarea>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <label for="identidad" class="control-label">Diagnóstico:</label> 
                        <div class="form-group">
                          <textarea class="form-control" type="text" maxlength="100" minlength="5" name="diagnostico1" id="diagnostico1"  autocomplete = "off" ></textarea>
                        </div>
                      </div>
                    </div><!--Fin de una fila -->
                             
                    <div class="row">
                      <div class="col-md-6"> 
                        <label for="identidad" class="control-label">Evolución:</label> 
                        <div class="form-group">
                          <textarea class="form-control" type="text" maxlength="200" minlength="5" name="evolucion" id="evolucion" onKeyDown="sinespacio(this);"  autocomplete = "off" ></textarea>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <label for="identidad" class="control-label">Diagnóstico de egreso/ Hallazgos importantes:</label> 
                        <div class="form-group">
                          <textarea class="form-control" type="text" maxlength="100" minlength="5" name="diagnostico2" id="diagnostico2" onKeyDown="sinespacio(this);"  autocomplete = "off"></textarea>
                        </div>
                      </div>
                    </div><!--Fin de una fila -->
                    <br>
                    <button type="submit"  id="" name="Guardar_PreClinica" class="btn btn-info btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Registrar </button>
                      
                </div><!--fin del div de responsivi -->
              </div> <!-- /.card-body -->
            </form>
          </div><!-- fINAL DEL card PRIMARY -->
        </div><!--FINAL DE COL-M12-->
      </div><!-- FINAL ROW PADRE -->
    </div><!-- FINAL CONTAINER FLUID --> 
                      </div>
                      </div>
  </section><!-- FINAL SECTION -->

 

 
 
