<!-- 
-----------------------------------------------------------------------
Universidad Nacional Autonoma de Honduras (UNAH)
		Facultad de Ciencias Economicas
Departamento de Informatica administrativa
Analisis, Programacion y Evaluacion de Sistemas
          Segundo Periodo 2022
Equipo:
Catedratico:
Lic. Claudia Nuñez (Analisis)
Lic. Giancarlo Martini Scalici Aguilar (Implementación)
Lic. Karla Melisa Garcia Pineda (Evaluación)

---------------------------------------------------------------

Programa:         Pantalla de Ingreso a mantenimiento modalidad
Fecha:             01-jan-2016
Programador:       ?
descripcion:       Pantalla que contrala los expedientes unicos 
-----------------------------------------------------------------------
                      Historial de Cambio
-----------------------------------------------------------------------

Programador                   Fecha               Descripción
Diana Rut Garcia            20/06/2022          Modificaciones en el modal
Diana Rut Garcia            20/07/2022          Modificaciones en el boton del reporte
----------------------------------------------------------------------->

<?php
 include_once "conexion.php";
 include_once "conexion3.php";
?>

<head>

</head>

<body oncopy="return false" onpaste="return false"> 
<div class="content-wrapper">
  <div class="content-header">
  <div class="text-center">
      
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
    <div class="content-header text-xl-center mb-3 ">
        <h4>Expedientes Psicológicos </h4>
    </div>
  </div>
  
  
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
        
        <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte</button>
          
    
          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;"></strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_expedienteunico" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th class="text-center">Acción</th>
                          <th class="text-center">ID</th>
                          <th class="text-center">Nombre del Paciente</th>
                          <th class="text-center">Antecedentes Familiares</th>
                          <th class="text-center">Antecedentes Personales</th>
                          <th class="text-center">Antecedentes Clínicos</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT expu.CODIGO_EXPEDIENTE, CONCAT_WS(' ',p.PRIMER_NOMBRE,p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) as CODIGO_PERSONA, expu.ANTECEDENTES_FAMILIARES, expu.ANTECEDENTES_PERSONALES, expu.ANTECEDENTES_CLINICOS 
                        FROM tbl_expediente_psicologico_unico expu, tbl_persona p, tbl_tipo_persona tp
                        WHERE expu.CODIGO_PERSONA = p.CODIGO_PERSONA and tp.CODIGO_TIPO_PERSONA = 6;";


                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_EXPEDIENTE'];
                            $var2 = $row['CODIGO_PERSONA'];
                            $var4 = $row['ANTECEDENTES_FAMILIARES'];
                            $var5 = $row['ANTECEDENTES_PERSONALES'];
                            $var6 = $row['ANTECEDENTES_CLINICOS'];
                        ?>
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">

                              <?php
                            include "conexionpdo.php";
                            $usuario=$_SESSION['vario'];
                            //Evaluo si existe el tipo de Rol
                            $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL 
                                                            FROM tbl_usuario 
                                                            WHERE NOMBRE_USUARIO = (?);");
                            $evaluar_usuario->execute(array($usuario));
                            $row=$evaluar_usuario->fetchColumn();
                            if($row > 0){
                                $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado

                                //llamar al procedimiento almacenado
                                $evaluar_permiso_actualizar = $db->prepare("CALL Sp_permiso_actualizar(?,?);");
                                $evaluar_permiso_actualizar->execute(array($usuariomo, '31'));
                                $row1=$evaluar_permiso_actualizar->fetchColumn();
                                $permiso_actualizar =$row1; 
                                
                                
                               
                            }
                            ?> 



                            <?php
                            include "conexionpdo.php";
                            $usuario=$_SESSION['vario'];
                            //Evaluo si existe el tipo de Rol
                            $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL 
                                                            FROM tbl_usuario 
                                                            WHERE NOMBRE_USUARIO = (?);");
                            $evaluar_usuario->execute(array($usuario));
                            $row=$evaluar_usuario->fetchColumn();
                            if($row > 0){
                                $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado

                                $evaluar_permiso_eliminar = $db->prepare("CALL Sp_permiso_eliminar(?,?);");
                                $evaluar_permiso_eliminar->execute(array($usuariomo, '31'));
                                $row1=$evaluar_permiso_eliminar->fetchColumn();
                                $permiso_eliminar =$row1; 
                            }
                            ?> 
                                <?php
                                if ($permiso_eliminar == 'SI'){
                                    
                                ?> 
                              
                         
                               <?php
                                }
                                ?>
                               
                               <?php
                                if ($permiso_actualizar == 'SI'){    
                                ?> 
                                <a href="#EDITAREXPEDIENTE<?php echo $var1; ?>" data-toggle="modal">
                                <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                </a>
                                <?php
                                }
                                ?>


                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          <td class="text-center"><?php echo $var1; ?></td>
                          <td class="text-center"><?php echo $var2; ?></td> 
                          <td class="text-center"><?php echo $var4; ?></td>
                          <td class="text-center"><?php echo $var5; ?></td>
                          <td class="text-center"><?php echo $var6; ?></td>
                          
              
                        

                            <?php
                              include_once "conexion3.php";
                              $query2= "SELECT esp.CODIGO_ESPECIALIDAD ,esp.NOMBRE
                              FROM tbl_especialidad esp
                              WHERE esp.CODIGO_ESPECIALIDAD = 2 and CODIGO_ESTADO =2;";
                              $result2= $conn->query($query2);
                           ?>

                        <!--INICIO DEL MODAL DE EDITAR UN EXPEDIENTE -->
                          <div id="EDITAREXPEDIENTE<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-lg">
                              <div class="modal-content"><!-- Modal content-->
                                <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar Expediente</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMEDITRAPERSONAS" method="POST">
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="number" value ="<?php echo $var1; ?>" hidden class="form-control" name="codigo_expediente" id="codigo_expediente">
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Nombre del Paciente</label>
                                          <input  type="text"  value ="<?php echo $var2; ?>" class="form-control"  maxlength="100" minlength="5"  onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" readonly="" placeholder="" name="editar_nombre" id="editar_nombre">
                                        </div>
                                      </div>

                                      <div class="col-sm-12">
                                        <div class="form-group">
                                         <label for="BASICOS" class="control-label">Antecedentes Psicológicos Familiares</label> 
                                         <textarea  type="text"  class="form-control"  maxlength="600"     autocomplete = "off" type="text" onkeyup="mayus(this);" onkeypress="return soloLetras(event);" name="editar_familiar" id="editar_familiar" required ><?php echo $var4; ?></textarea>
                                         <div class="invalid-feedback">
                                         campo obligatorio.
                                        </div>
                                        </div>
                                      </div>
                                      
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                         <label for="BASICOS" class="control-label">Antecedentes Psicológicos Personales</label> 
                                         <textarea  type="text"  class="form-control"  maxlength="600"  autocomplete = "off" type="text" onkeyup="mayus(this);" onkeypress="return soloLetras(event);" name="editar_personal" id="editar_personal" required><?php echo $var5;?></textarea>
                                         <div class="invalid-feedback">
                                         campo obligatorio.
                                        </div>
                                        </div>
                                      </div>

                                      <div class="col-sm-12">
                                        <div class="form-group">
                                         <label for="BASICOS" class="control-label">Antecedentes Psicológicos Clinicos</label> 
                                         <textarea  type="text"  class="form-control"  maxlength="600"  onkeyup="mayus(this);"   autocomplete = "off" type="text" onkeypress="return soloLetras(event);"  name="editar_clinico" id="editar_clinico" required><?php echo $var6;?></textarea>
                                         <div class="invalid-feedback">
                                         campo obligatorio.
                                        </div>
                                        </div>
                                      </div>


                                    </div> <!-- FIN DE EL PRIMER ROW --> 

                                    
                                  </div><!--FINAL DEL CARD BODY --> 

                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="editar_expediente" name="editar_expediente" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                                  </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                </div>
                              </form>
                            </div>
                          </div><!-- FIN DEL MODAL EDITAR -->  
                         
                          

                          
                         
                      </tr>             
                        <?php
                        }
                        }
                        ?>
                      </tbody>
                  </table>
                </div><!--fin del div de responsivi -->
              </div> <!-- /.card-body -->
            </form>
          </div><!-- fINAL DEL card PRIMARY -->
        </div><!--FINAL DE COL-M12-->
      </div><!-- FINAL ROW PADRE -->
    </div><!-- FINAL CONTAINER FLUID --> 
  </section><!-- FINAL SECTION -->
</div>
</body>


<!-- Modal -->

<script>
  function soloLetras(e){
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = " áéíóúabcdefghijklmnñopqrstuvwxyz_-";
   especiales = ["8-37-39-46"];
   tecla_especial = false
   for(var i in especiales){
    if(key == especiales[i]){
      tecla_especial = true;
      break;
    }
  }
  if(letras.indexOf(tecla)==-1 && !tecla_especial){
    return false;
  }
 }
 </script>



<script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteExpedienteUnico.php','_blank');
      window.open(this.href,'_self');
    }
  </script>

<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
   $(document).ready( function () {
      $('#tabla_expedienteunico').DataTable({
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
        "search": "Buscar Expediente:",
        "zeroRecords": "No existe el expediente",
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