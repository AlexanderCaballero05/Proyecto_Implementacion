<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include "conexionpdo.php";
?>
<head>

</head>
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div>
      <section class="content">
      <div class="card"> <!--card del menu-->
        <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link active" style="color:#000000;" href="#"> Ver Pre-Clinica</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="procesoPreClinica">Pre-Clinica</a>
            </li>
          </ul>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-md-12">
            <a href="procesoCargaAcademica" >
                <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-info mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Nuevo Registro</button>
                </a>
                <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Descargar Reporte</button>
                </br></br>
                <div class="row">
                   <label class=" col-sm-1 control-label" style=" text-align: right; width: 150px">Desde:</label>
                    <div class="col-sm-2">
                      <input class="form-control" type="date" id="bd-desde" name="desde" value="" />
                    </div>
                    <label class=" col-sm-1 control-label" style=" text-align: right; width: 150px">Hasta:</label>
                    <div class="col-sm-2">
                      <input class="form-control" type="date" id="bd-desde" name="desde" value="" />
                    </div>
                    <button type="submit" class="btn btn-primary"  name="filtrartutor" class="col-sm-1 col-form"><span> <i class="nav-icon fa fa-search mx-1"></i></span>Generar</button>  
                    
                </div><!--fin de row -->
                </br></br>
            <form  method="POST">
              <div class= "card">
                 <div class="card-header text-center" style="background-color: #F7F8F9;">
                    <h5 class=" card-title text-center"><strong style="color:black;">Listado de Datos Pre-Clinica</strong></h5>
                 </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table id="tabla_preclinicarga" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th class="text-center">ACCION</th>
                        <th class="text-center">ID </th>
                        <th class="text-center">PACIENTE CITA</th>
                        <th class="text-center">PESO</th>
                        <th class="text-center">ESTATURA</th>
                        <th class="text-center">FRECUENCIA CARDIACA</th>
                        <th class="text-center">FRECUENCIA RESPIRATORIA</th>
                        <th class="text-center">MASA CORPORAL</th>
                        <th class="text-center">PULSO</th>
                        <th class="text-center">TEMPERATURA</th>
                        <th class="text-center">ESTATUS DE DESNUTRICION</th>
                        <th class="text-center">FECHA PRE-CLINICA</th>
                      </tr>
                    </thead>
                    <tbody>
                    <?php
                      $query = "SELECT  pre.TEMPERATURA,pre.PULSO,pre.DESNUTRICION,pre.MASA_CORPORAL,    pre.CODIGO_PRECLINICA, pre.FRECUENCIA_CARDIACA , pre.FRECUENCIA_RESPIRATORIA, pre.PESO,pre.ESTATURA, c.CODIGO_CITA as CODIGO,
                      CONCAT_WS(' ',p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE, p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) AS PACIENTE ,pre.FECHA_CREACION
                      from tbl_inscripcion_cita c ,tbl_persona p ,tbl_preclinica pre 
                     where p.CODIGO_PERSONA = c.CODIGO_PERSONA and pre.CODIGO_CITA = c.CODIGO_CITA";
                      $result = $conn->query($query);
                      if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                          $var1 = $row['CODIGO_PRECLINICA'];
                          $var2 = $row['PACIENTE'];
                          $var3 = $row['PESO'];
                          $var4 = $row['ESTATURA'];
                          $var5 = $row['FRECUENCIA_CARDIACA'];
                          $var6 = $row['FRECUENCIA_RESPIRATORIA'];
                          $var7 = $row['FECHA_CREACION'];
                          $var8 = $row['TEMPERATURA'];
                          $var9 = $row['PULSO'];
                          $var10 = $row['DESNUTRICION'];
                          $var11 = $row['MASA_CORPORAL'];

                      ?>
                      <tr>
                        <td>
                          <div class="text-center">
                            <div class="btn-group">
                                <!--Codigo para asignar permiso del boton de editar -->
                                <?php
                                  $usuario=$_SESSION['vario'];
                                  //Evaluo si existe el tipo de Rol
                                  $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                                  $evaluar_usuario->execute(array($usuario));
                                  $row=$evaluar_usuario->fetchColumn();
                                  if($row > 0){
                                      $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                                      //llamar al procedimiento almacenado
                                      $evaluar_permiso_actualizar = $db->prepare("CALL Sp_permiso_actualizar(?,?);");
                                      $evaluar_permiso_actualizar->execute(array($usuariomo, '2'));
                                      $row2=$evaluar_permiso_actualizar->fetchColumn();
                                      $permiso_actualizar =$row2; 
                                  }
                                  ?>
                                  <?php
                                    if($permiso_actualizar == 'SI'){
                                  ?>
                                  <?php
                                    }
                                  ?>
                                  <a href="#EDITARPRECLINICA<?php echo $var1; ?>" data-toggle="modal">
                                    <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                    </a>
                            </div>
                          </div><!--fin del text-center -->
                        </td>
                        <td class="text-center"><?php echo $var1; ?></td>
                        <td class="text-center"><?php echo $var2; ?></td>
                        <td class="text-center"><?php echo $var3; ?></td>
                        <td class="text-center"><?php echo $var4; ?></td>
                        <td class="text-center"><?php echo $var5; ?></td>
                        <td class="text-center"><?php echo $var6; ?></td>
                        <td class="text-center"><?php echo $var11; ?></td>
                        <td class="text-center"><?php echo $var9; ?></td>
                        <td class="text-center"><?php echo $var8; ?></td>
                        <td class="text-center"><?php echo $var10; ?></td>
                        <td class="text-center"><?php echo $var7; ?></td>
                        
                        <div id="EDITARPRECLINICA<?php echo $var1 ?>" class="modal fade" role="dialog">
                          <div class="modal-dialog modal-lg">
                            <div class="modal-content"><!-- Modal content-->
                              <form  method="POST">
                                <div class="modal-header" style="background-color: #0CCDE3">
                                  <h4 class="text-center">Editar Preclinica </h4>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body"><!--CUERPO DEL MODAL -->
                                  <div class="row"><!-- INICIO PRIMERA ROW --> 
                                        <input type="text" value ="<?php echo $var1; ?>" hidden  class="form-control" name="id_preclinica">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="txtcodigo_persona">Peso:</label>
                                                <input  type="text"  value ="<?php echo $var3;?>" class="form-control" name="editar_peso">
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="txtcodigo_persona">Estatura:</label>
                                                <input  type="text"  value ="<?php echo $var4; ?>" class="form-control" name="editar_estatura">
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="txtcodigo_persona">Masa Corporal:</label>
                                                <input  type="text"  value ="<?php echo $var11; ?>" class="form-control" name="editar_estatura">
                                            </div>
                                        </div>
                                  </div><!--fin row -->
                                  <div class="row">
                                      <div class="col-sm-4">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Frecuencia Cardica:</label>
                                          <input type="text"  value ="<?php echo $var5; ?>" class="form-control" name="editar_fc">
                                        </div>
                                      </div>
                                      <div class="col-sm-4">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Frecuencia Respiratoria:</label>
                                          <input type="text"  value ="<?php echo $var6; ?>" class="form-control" name="editar_fr">
                                        </div>
                                      </div>
                                      <div class="col-sm-4">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Pulso:</label>
                                          <input type="text"  value ="<?php echo $var9; ?>" class="form-control" name="editar_fr">
                                        </div>
                                      </div>
                                  </div><!--fin row -->
                                  <div class="row">
                                     <div class="col-sm-4">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Temperatura:</label>
                                          <input type="text"  value ="<?php echo $var8; ?>" class="form-control" name="editar_fr">
                                        </div>
                                      </div>
                                      <div  class="col-sm-4 mb-3">
                                        <div class="form-group">
                                          <label for="" class="control-label">Estatus de desnutrición</label>
                                          <select class="form-control " required name="desnutricion" required> 
                                          <option  value="10">--Seleccione--</option>
                                            <option  value="No tiene">No tiene</option>
                                            <option   value="Moderado">Moderado</option>
                                            <option  value="Grave">Grave</option>
                                          </select>
                                        </div>
                                      </div>
                                      
                                  </div>
                                 
                    
                                </div><!--fin modal body -->
                                <div class="modal-footer ">
                                  <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                  <button type="submit" name="editar_preclinica" class="btn btn-warning btn mx-1"><span> <i class="nav-icon fas fa-edit mx-1"></i></span>Editar</button>
                                </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                              </form>
                            </div>
                          </div>
                        </div><!--fin modal editar -->
                      </tr>
                      <?php
                        }
                        }
                      ?>
                    </tbody>
                 </table>
                </div>
               </div>
              </div>
            </form><!--fin del form -->
            </div>
          </div>
        </div> 
      </div><!-- card del menu-->
     </section>
  </div> 
</div>   
<div>
</div>


<script>
    function Descargar() {
      window.open('Reportes_Prosecar/reportePreClinica.php','_blank');
      window.open(this.href,'_self');
    }
  </script>


<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_preclinicarga').DataTable({

        language: {
        "decimal": "",
        "emptyTable": "No hay información",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
        "infoEmpty": "Mostrando 0 a 0 de 0 Entradas",
        "infoFiltered": "(Filtrado de _MAX_ total entradas)",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Mostrar _MENU_ Entradas",
        "loadingRecords": "Cargando...",
        "processing": "Procesando...",
        "search": "Buscar Registro:",
        "zeroRecords": "Sin resultados encontrados",
        "paginate": {
            "first": "Primero",
            "last": "Ultimo",
            "next": "Siguiente",
            "previous": "Anterior"
        }
      },
        
      })
  } );
</script>

