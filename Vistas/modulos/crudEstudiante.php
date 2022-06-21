<!-- ---------------------------------------------------------------------
ELABORADO POR ARNOLD GARCIA u otr persona
	Universidad Nacional Autonoma de Honduras (UNAH)
	  	Facultad de Ciencias Economicas
	Departamento de Informatica administrativa
     Analisis, Programacion y Evaluacion de Sistemas
             Segundo periodo 2022
Equipo:
Arnold Caballero.......... (no me acuerdo)

Catedratico:
Lic. Karla Melisa Garcia Pineda  --Evaluacion
Lic Giancarlo Scalichi -- Implementacion de sistemas
Clauidia Nuñez -- Analisis y diseño
---------------------------------------------------------------------
Programa:          Pantalla que muestra los datos  de los estudiantes
Fecha:            
Programador:       
descripcion:       Pantalla de mantenimiento edita datos de estudiantes
-----------------------------------------------------------------------
Historial de Cambio
-----------------------------------------------------------------------
Programador               Fecha                      Descripcion
ANY HERNANDEZ         		11-06-2022                 revision de ortagrafia 
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
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
        <div class="content-header text-xl-center mb-3">
              <h4>Estudiantes Prosecar </h4>
        </div>
  
  <section class="content">
    <div class="card"> 
        <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
          <li class="nav-item">
              <a class=" nav-link active" style="color:#000000;" href="crudEstudiante">Ver datos Escolares</a>
            </li>
              <li class="nav-item ">
                <a class="nav-link "  style="color:#000000;"href="crudContenidoEconoEstudiante">Ver Datos Socioeconómicos</a>
              </li>
              <li class="nav-item">
                <a class="nav-link " style="color:#000000;" href="procesoRegistrarEstudiante">Agregar Estudiante</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" style="color:#000000;" href="crudFamiliaresEstudiantes">Relación Estudiante-Familiar</a>
              </li>
          </ul>
        </div>
        <div class="card-body">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
            </br>
           <div class="pl-3">

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
                                $evaluar_permiso = $db->prepare("CALL Sp_permiso_insertar(?,?);");
                                $evaluar_permiso->execute(array($usuariomo, '16'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                          ?> <!-- fin del codigo para sustraer el permiso de insertar.-->
                          <?php
                             if ($permiso_registrar == 'SI'){

                          ?>
             <a  href="procesoRegistrarEstudiante">
              <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar Estudiante</button>
              </a>
             <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"  class="btn  mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar reporte</button>
              
           </div>
                       <?php
                        }
                        ?>

          
          <!-- jquery validation -->
          <div class="card ">
            <div class="card-header text-center" ><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"></h1>
            </div>
            <form  method="POST" id="form"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_estudiantes" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th class="text-center">Acción</th>
                          <th class="text-center">Código</th>
                          <th class="text-center">Nombre</th>
                          <th class="text-center">Apellido</th>
                          <th class="text-center">Grado actual</th>
                          <th class="text-center">Repitente</th>
                          <th class="text-center">Indice académico</th>
                          <th class="text-center">Pasatiempos</th>
                          <th class="text-center">Distractores escolares</th>
                          <th class="text-center">Metas</th>
                          
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT e.CODIGO_ESTUDIANTE, p.PRIMER_NOMBRE , p.PRIMER_APELLIDO, p.CODIGO_PERSONA, e.GRADO_ACTUAL, e.REPITENTE,
                         e.INDICE_ACADEMICO, e.MATE_BAJO_RENDI ,e.PASATIEMPOS, e.DISTRACTORES_ESCOLARES, e.METAS
                        FROM tbl_estudiante e , tbl_persona p
                        WHERE e.CODIGO_PERSONA= p.CODIGO_PERSONA;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_ESTUDIANTE'];
                            $var2 = $row['PRIMER_NOMBRE'];
                            $var3 = $row['PRIMER_APELLIDO'];
                            $var4 = $row['GRADO_ACTUAL'];
                            $var5 = $row['REPITENTE'];
                            $var6 = $row['INDICE_ACADEMICO'];
                            $var7 = $row['PASATIEMPOS'];
                            $var8 = $row['DISTRACTORES_ESCOLARES'];
                            $var9 = $row['METAS'];
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
                                $evaluar_permiso_actualizar->execute(array($usuariomo, '16'));
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
                                $evaluar_permiso_eliminar->execute(array($usuariomo, '16'));
                                $row1=$evaluar_permiso_eliminar->fetchColumn();
                                $permiso_eliminar =$row1; 
                            }
                            ?> 


                                <?php
                                  if($permiso_eliminar == 'SI')
                                   {
                                ?>
                                
                                
                               <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                <button id="ELIMINAR_ESTUDIANTE" name="ELIMINAR_ESTUDIANTE" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>
                               <?php
                                  }
                                ?>

                                
                                <?php 
                                if ($permiso_actualizar == 'SI')
                                {
                                ?>

                                <a href="#EDITARESTUDIANTE<?php echo $var1; ?>" data-toggle="modal">
                                <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                </a>

                                <a>
                                <form method="post"  action="Reportes_Prosecar/reporteEstudiante.php" target="_blank"> 
                                <input type="text" hidden name="reporte_estudiante" value="<?php echo $var1 ?>">
                                <button type='submit' title='Imprimir'  style="color:white; "class="btn btn-info mb-3"><span><i class="nav-icon fa fa-file-pdf mx-1"></i></span></button> 
                                </form>
                                </a>

                                <?php 
                                }
                                ?>
                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          <td class="text-center"><?php echo $var1; ?></td>
                          <td class="text-center"><?php echo $var2; ?></td>
                          <td class="text-center"><?php echo $var3; ?></td>
                          <td class="text-center"><?php echo $var4; ?></td>
                          <td class="text-center"><?php echo $var5; ?></td>
                          <td class="text-center"><?php echo $var6; ?></td>
                          <td class="text-center"><?php echo $var7; ?></td>
                          <td class="text-center"><?php echo $var8; ?></td>
                          <td class="text-center"><?php echo $var9; ?></td>
                          

                        <!--INICIO DEL MODAL DE EDITAR ESTUDIANTE -->
                          <div id="EDITARESTUDIANTE<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                                <form id="FORMEDITRAPERSONAS" method="POST" class="needs-validation" novalidate >
                                  <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar Estudiante</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="id_estudiante" id="id_estudiante">
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Grado Actual</label>
                                          <input  type="text"  value ="<?php echo $var4; ?>" class="form-control"  maxlength="2" minlength="1" onkeypress="return solonumero(event)"  autocomplete = "off" type="text"  name="editGRADOACTUAL" id="editar_estudiante" 
                                          autocomplete ="off" required =" ">
                                              <div class="invalid-feedback">
                                              Campo Obligatorio.
                                              </div>
                                        </div>
                                      </div>
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Pasatiempos</label>
                                          <input  type="text"  value ="<?php echo $var7 ?>" class="form-control"  maxlength="50"     autocomplete = "off" type="text"   name="ediTPASATIEMPOS" id="editar_pasatiempos" autocomplete ="off" required =" ">
                                              <div class="invalid-feedback">
                                              Campo Obligatorio.
                                              </div>
                                        </div>
                                      </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 

                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Distractores Escolares</label>
                                          <input  type="text"  value ="<?php echo $var8; ?>" class="form-control"  maxlength="20" minlength="5"    autocomplete = "off" type="text" onkeypress="return soloLetras(event);"  name="editDISTRACTORES" id="editar_distractores"required =" ">
                                              <div class="invalid-feedback">
                                              Campo Obligatorio.
                                              </div>
                                        </div>
                                      </div>
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Metas</label>
                                          <input  type="text"  value ="<?php echo $var9; ?>" class="form-control"  maxlength="50"     autocomplete = "off" type="text"   name="editMETAS" id="editar_metas" required =" ">
                                              <div class="invalid-feedback">
                                              Campo Obligatorio.
                                              </div>
                                             </div>
                                      </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY --> 

                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="editar_estudiante" name="editar_estudiante" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                                  </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                </div>
                              </form>
                            </div>
                          </div><!-- FIN DEL MODAL EDITAR -->  
                            
                          <!--INCICIO DEL MODAL ELIMINAR   -->
                          <div id="ELIMINAR<?php echo $var1 ?>"  name="div_eliminar" id="div_eliminar"class="modal fade" role="dialog">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel"></h5>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMEeliminar" method="POST">
                                  <div class="modal-body">
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="estudiante_eliminar" id="estudiante_eliminar">
                                    <h4 class="text-center">¿Esta seguro de eliminar el estudiante<?php echo $var2; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_ESTUDIANTE" id="ELIMINAR_ESTUDIANTE"  class="btn btn-primary">Si,eliminar</button>      
                                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                               </form>
                               </div><!--fin del modal contener -->
                            </div><!--fin del modal dialog -->
                          </div><!--fin del modal de eliminar -->
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
    <div>
       
  </section><!-- FINAL SECTION -->
  </div>

  <!--INICIO DEL MODAL DE AGREGAR UN NUEVO ESTUDIANTE -->
  <div id="AGREGAR_ESTUDIANTE" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
                    <?php
                    include_once "conexion3.php";
                    $query= "SELECT p.CODIGO_PERSONA,p.PRIMER_NOMBRE FROM tbl_persona p WHERE p.CODIGO_TIPO_PERSONA = 4";
                    $result= $conn->query($query);
                    ?>
                    <!--Traer el contenido socienomico de dispositivos electronicos-->
                    <?php
                    include_once "conexion3.php";
                    $query1= "SELECT s.CODIGO_TIPOSOCIO ,s.NOMBRE_TIPO FROM tbl_contenido_socioeconomico s";
                    $result1= $conn->query($query1);
                    ?>
           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITRAPERSONAS" method="POST">
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Estudiante</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                        <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Nombre Estudiante</label>
                                   
                                    <select class="form-control" name="codigo_persona" id="codigo_estudiante">

                                     <option value="">Seleccionar estudiante</option>
                                     <?php
                                      if ($result->num_rows > 0){
                                        while($row = $result->fetch_assoc()){

                                        

                                       
                                      ?>
                                     <option value="<?php echo $row['CODIGO_PERSONA'];?>"><?php echo $row['PRIMER_NOMBRE'];?></option>
                                     <?php
                                      }
                                    }

                                      ?>
                                   </select>
                                </div>
                                    <!-- INICIO DEL COMBOBOX CONTENIDO SOCIOECONOMICO --> 
                                <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Contenido Socioeconomico</label>
                                   
                                    <select class="form-control" name="contenido_socio" id="contenido_socio">

                                     <option value="">Contenido</option>
                                     <?php
                                      if ($result1->num_rows > 0){
                                        while($row1 = $result1->fetch_assoc()){

                                        

                                       
                                      ?>
                                     <option value="<?php echo $row1['CODIGO_TIPOSOCIO'];?>"><?php echo $row1['NOMBRE_TIPO'];?></option>
                                     <?php
                                      }
                                    }

                                      ?>
                                   </select>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Grado Actual</label>
                                    <input  type="text"  class="form-control"  maxlength="2" minlength="1"  onKeyDown="sinespacio(this);" onkeypress="return solonumero(event)" autocomplete = "off" type="text"  placeholder="Ingrese un nombre al estudiante" name="nombre_estudiante" id="nombre_estudiante">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Pasatiempos</label>
                                    <textarea  type="text"  class="form-control"  maxlength="150"    onkeyup="mayus(this);" autocomplete = "off" type="text"  placeholder="Ingrese una descripción del Estudiante" name="pasatiempos_estudiante" id="pasatiempos_estudiante"></textarea>
                                </div>
                            </div>
                        </div> <!-- FIN DE EL PRIMER ROW --> 

                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Distractores Escolares</label>
                                    <input  type="text" class="form-control"  maxlength="20" minlength="5"  onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese un distractor" name="distractores_estudiante" id="distractores_estudiante">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Metas</label>
                                    <textarea  type="text" class="form-control"  maxlength="150"    onkeyup="mayus(this);" autocomplete = "off" type="text"  placeholder="Ingrese una meta del Estudiante" name="metas_estudiante" id="metas_estudiante"></textarea>
                                </div>
                            </div>
                        </div> <!-- FIN DE EL PRIMER ROW --> 

                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="editar_estudiante" name="editar_estudiante" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO ESTUDIANTE --> 
   <!--funcion que advierte al usuario antes de salir de un proceso con cambios no guardados-->
   <script>
 var isSubmitting = false

$(document).ready(function () {
    $('#form').submit(function(){
        isSubmitting = true
    })

    $('#form').data('initial-state', $('#form').serialize());

    $(window).on('beforeunload', function() {
        if (!isSubmitting && $('#form').serialize() != $('#form').data('initial-state')){
            return 'You have unsaved changes which will not be saved.'
        }
    });
})
  </script>
  <!--fin de la funcion que advierte al usuario antes de salir de un proceso con cambios no guardados-->
   </body>
  <!-- Button trigger modal -->


<!-- Modal -->



<script type="text/javascript"> 
  $(document).ready( function () {
      $('#tabla_estudiantes').DataTable({

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
        "search": "Buscar Estudiante:",
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

<script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteEstudiantes.php','_blank');
      window.open(this.href,'_self');
    } 
  </script>


  