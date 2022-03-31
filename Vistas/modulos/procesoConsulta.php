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
            <a class=" nav-link active" style="color:#000000;" href="#">Citas Medicas</a>
            </li>
            <li class="nav-item" disabled="disabled">
            <a class="nav-link" style="color:#000000;" href="#">Pre Clinica</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Consultas Medicas</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Recetas Medicas</a>
            </li>
          </ul>
          </div>
          <div class="card-body"><!--Cuerpo del card body principal -->
            </br>
            
            
            <form id="formMatricula" action="procesoMatricula" method="POST">
            <h5>Datos del Paciente</h5>
            <hr>
            </br>
            <form action="">
            <div class="row mb-8">
                    <div class="col">
                      <label for="">Nombre del paciente:</label>
                       <input type="text" name="nombre1" class="form-control" placeholder="Primer Nombre" aria-label="primer nombre" onkeyup="mayus(this);" minlength="3" maxlength="20" onkeypress="return soloLetras(event);"  required onblur="quitarespacios(this);" onkeydown="sinespacio(this);" required="">
                    </div>
                     <div class="col">
                         <label for="">DNI:</label>
                         <input type="text" name="nombre2" class="form-control" placeholder="Segundo Nombre" aria-label="segundo nombre" onkeyup="mayus(this);" minlength="3" maxlength="20" onkeypress="return soloLetras(event);"  required onblur="quitarespacios(this);" onkeydown="sinespacio(this);" required="">
                    </div>
                    </div>
            </form>
            
                    </br>
                    <h5>Preclinica</h5>
                    <hr>
                    </br>
            <!--INICIO COMBOBOX PARA ELEGIR AL ESTUDIANTE-->
            <div class="form-group">
            <div class= "row">                      
                        <div class="col-sm-2">
                         <label for="" class="control-label">Peso</label> 
                            <div class="form-group">
                                <input type="text" placeholder=" Ej:60 kg" required class="form-control" name="peso" >
                            </div>
                        </div><!--fin del peso -->

                        <div  class="col-sm-2">
                          <label for="" class="control-label">Estatura</label> 
                            <div class="form-group">
                                <input type="text" placeholder=" Ej:1.82 cm" required class="form-control"  name="estatura" >
                            </div>
                        </div><!--fin del la estatura -->

                        <div  class="col-sm-2">
                            <?php 
                            $query = "SELECT CODIGO_TIPO_SANGRE,TIPO from tbl_tipo_sangre ";
                            $resultadod=$conn->query($query);                
                            ?>
                          <label for="" class="control-label">Tipo Sangre</label> 
                           <div class="form-group">
                             <select class="form-control select2" tyle="width: 100%;"  name ="tipo_sangre"  required > 
                                <option selected >--Seleccione tipo--</option>
                                <?php 
                                    if ($resultadod->num_rows > 0) {
                                    while($row = $resultadod->fetch_assoc()) { 
                                    $codigo = $row['CODIGO_TIPO_SANGRE'];
                                    $tipo_sangre= $row['TIPO'];
                                    ?>
                                <option value="<?php echo $codigo; ?>" ><?php echo $tipo_sangre;?></option>
                                <?php 
                                } 
                                }
                                ?>
                             </select>
                            </div>
                        </div><!--fin del tipo sangre -->
                    </div> <!--fin del row -->
                    </br>
                    <h5>Consulta</h5>
                    <hr>
                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                         <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="id_param" id="id_param">
                            <div class="col-sm-12">
                                 <div class="form-group">
                                    <label for="txtcodigo_parametro">Sintomas</label>
                                    <textarea  type="text"   class="form-control"  maxlength="50" minlength="5"  onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese el parámetro" name="Edit_nomparam" id="Edit_nomparam"></textarea>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                 <div class="form-group">
                                    <label for="txtnombre_usuario">Diagnostico de ingreso</label>
                                    <textarea  type="text"   class="form-control"  maxlength="100"     autocomplete = "off" type="text"   name="Edit_valor" id="Edit_valor"></textarea>
                                    </div>
                            </div> 
                            <div class="col-sm-12">
                                 <div class="form-group">
                                    <label for="txtnombre_usuario">Diagnostico de egreso</label>
                                    <textarea  type="text"   class="form-control"  maxlength="100"     autocomplete = "off" type="text"   name="Edit_valor" id="Edit_valor"></textarea>
                                    </div>
                            </div> 
                     </div> <!-- FIN DE EL PRIMER ROW --> 
                      
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

 

 
 
