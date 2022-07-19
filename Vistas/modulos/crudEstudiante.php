<!-- 
-----------------------------------------------------------------------
        Universidad Nacional Autonoma de Honduras (UNAH)
	            	Facultad de Ciencias Economicas
          Departamento de Informatica administrativa
         Analisis, Programacion y Evaluacion de Sistemas
                   Segundo Periodo 2022

  Equipo:
  Arnold Alexander Caballero Garcia (aacaballero@unah.hn)
  Luz Maria Montoya Medina (luz.montoya@unah.hn)
  Diana Rut Garcia Amador (drgarciaa@unah.hn)
  Any Melissa Hernandez (anyhernandez@unah.hn)
  Gissela Yamileth Diaz (gdiaza@unah.hn)
  Cesar Fernando Rovelo (Cesar.rovelo@unah.hn)

  Catedratico:
  Lic. Claudia Nuñez (Analisis)
  Lic. Giancarlo Martini Scalici Aguilar (Implementación)
  Lic. Karla Melisa Garcia Pineda (Evaluación)

---------------------------------------------------------------------
---------------------------------------------------------------------
Programa:          Pantalla de mantenimiento de los datos escolares del estudiante
Fecha:             01-04-2022
Programador:       Arnold Caballero
descripcion:       Pantalla de mantenimiento de los datos estudiantiles escolares etc
-----------------------------------------------------------------------
Historial de Cambio
-----------------------------------------------------------------------
Programador               Fecha                      Descripcion
ANY HERNANDEZ         		11-06-2022                 revision de ortagrafia 
Arnol Caballero        		17-06-2022                 Validacion de los maximos y minimos de los inputs 
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
              <a class=" nav-link" style="color:#000000;" href="ediusuariosestudiantes">Ver datos generales</a>
            </li>
          <li class="nav-item">
              <a class=" nav-link active" style="color:#000000;" href="crudEstudiante">Ver datos Escolares</a>
            </li>
              <li class="nav-item ">
                <a class="nav-link "  style="color:#000000;"href="crudContenidoEconoEstudiante">Ver Datos Socioeconómicos</a>
              </li>
              <li class="nav-item ">
                <a class="nav-link "  style="color:#000000;"href="crudfamiliares">Ver familiares</a>
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
                                $evaluar_permiso->execute(array($usuariomo, '26'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                          ?> <!-- fin del codigo para sustraer el permiso de insertar.-->
                          <?php
                             if ($permiso_registrar == 'SI'){

                          ?>
             <a  href="categoria">
              <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar</button>
              </a>
             <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"  class="btn  mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte</button>
              
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
                          <th class="text-center">Grado Actual</th>
                          <th class="text-center">Repitente</th>
                          <th class="text-center">Indice Académico</th>
                          <th class="text-center">Pasatiempos</th>
                          <th class="text-center">Distractores Escolares</th>
                          <th class="text-center">Metas</th>
                          <th class="text-center">Sacramentos</th>
                          <th class="text-center">Estado</th>
                          
    
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT e.CODIGO_ESTUDIANTE, p.PRIMER_NOMBRE , p.PRIMER_APELLIDO, p.CODIGO_PERSONA, e.GRADO_ACTUAL, e.REPITENTE,
                        e.INDICE_ACADEMICO, e.MATE_BAJO_RENDI ,e.PASATIEMPOS, e.DISTRACTORES_ESCOLARES, e.METAS,GROUP_CONCAT(sac.NOMBRE) as sacramentos, es.NOMBRE
                       FROM  tbl_sacramento_estudiante sacp, tbl_sacramento sac, tbl_estudiante e, tbl_persona p , tbl_usuario u, tbl_estado es
                       WHERE sacp.CODIGO_SACRAMENTO = sac.CODIGO_SACRAMENTO
                             AND sacp.CODIGO_ESTUDIANTE = e.CODIGO_ESTUDIANTE
                             AND e.CODIGO_PERSONA= p.CODIGO_PERSONA
                             AND p.CODIGO_PERSONA = u.CODIGO_PERSONA
                             AND u.CODIGO_ESTADO = es.CODIGO_ESTADO
                             
                           GROUP BY e.CODIGO_ESTUDIANTE;";
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
                            $var10 = $row['sacramentos'];
                            $var11 = $row['NOMBRE'];
                            
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
                                $evaluar_permiso_actualizar->execute(array($usuariomo, '26'));
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
                                $evaluar_permiso_eliminar->execute(array($usuariomo, '26'));
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
                                <button type='submit' title='Imprimir' style="color:white;background-color:#FA0079"class="btn btn mb-3"><span><i class="nav-icon fa fa-file-pdf mx-1"></i></span></button> 
                                </form>
                                </a>
                                <a>
                                

                                

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
                          <td class="text-center"><?php echo $var10; ?></td>
                          <td class="text-center"><?php echo $var11; ?></td>


                         
                          

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
                                          <input  type="text"  value ="<?php echo $var4; ?>" class="form-control"  maxlength="15" minlength="1" onkeyup="mayus(this);" autocomplete = "off" type="text"  name="editGRADOACTUAL" id="editar_estudiante" 
                                          autocomplete ="off" required ="">
                                              <div class="invalid-feedback">
                                              Campo Obligatorio.
                                              </div>
                                        </div>
                                      </div>
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Pasatiempos</label>
                                            <textarea class="form-control"  type="textarea" maxlength="255" minlength="2"  name="ediTPASATIEMPOS" id="editar_pasatiempos"  onkeyup="mayus(this);" autocomplete = "off" onkeypress="return soloLetras(event);" required=""><?php echo $var7 ?></textarea>
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
                                          <textarea class="form-control"  type="textarea" maxlength="255" minlength="2"  name="editDISTRACTORES" id="editar_distractores"  onkeyup="mayus(this);" autocomplete = "off" onkeypress="return soloLetras(event);" required=""><?php echo $var8 ?></textarea>

                                              <div class="invalid-feedback">
                                              Campo Obligatorio.
                                              </div>
                                        </div>
                                      </div>
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Metas</label>
                                          <textarea class="form-control"  type="textarea" maxlength="255" minlength="2"  name="editMETAS" id="editar_metas"  onkeyup="mayus(this);" autocomplete = "off" onkeypress="return soloLetras(event);" required=""><?php echo $var9 ?></textarea>

                                           
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
                                    <h4 class="text-center">¿Esta seguro de eliminar al estudiante <?php echo $var2; ?>?</h4>
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

<script>
  (function () {
    'use strict'
    var forms = document.querySelectorAll('.needs-validation')
    Array.prototype.slice.call(forms)
      .forEach(function (form) {
        form.addEventListener('submit', function (event) {
          if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
          }
          form.classList.add('was-validated')
        }, false)
      })
  })()
</script>


  