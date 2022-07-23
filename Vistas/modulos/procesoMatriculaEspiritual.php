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
    Programa:          Mantenimiento de parametros
    Fecha:             
    Programador:       Luz María Montoya Medina y Diana Rut Garcia Amador
    descripcion:       Permite realizar el procesod de matricula a las tutorias,editar,eliminar nuevo
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador               Fecha                      Descripcion
    Gissela Diaz                                        Cambios en la  Ortografía
    Diana Rut Garcia          22/07/2022              Cambios del proceso de matricula,se trae el estudiante desde otra pantalla
----------------------------------------------------------------------->
<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include "conexionpdo.php";
 
 $codigoObjeto=23;
 $accion='INGRESO A MATRÍCULA';
 $descripcion= 'AGREGA UNA MATRÍCULA ESPIRITUAL';
 bitacora($codigoObjeto, $accion,$descripcion);
?>
<?php
  if (isset($_POST['estu_codigo1'])) {
       $estudiante =($_POST['estu_codigo1']);
       $codigo_persona =($_POST['persona_codigo1']);
    }  
 ?>
    

<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  <section class="content">
    <div class="container-fluid">

    <section class="content">
       <section class="content-header text-xl-center mb-3 ">
              <h4> Matrícula Espiritual <i class=" nav-icon fas  fa-graduation-cap"></i> </h4>
        </section>
    <div class="container-fluid">
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
            <ul class="nav nav-tabs card-header-tabs">
              <li class="nav-item">
                <a class="nav-link"  style="color:#000000;" href="crudMatricula">Ver Matrícula</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" style="color:#000000;">Agregar Matrícula Académica</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" style="color:#000000;" aria-current="true" href="procesoMatriculaEspiritual">Agregar Matrícula Espiritual</a>
              </li>
            </ul>
          </div>
          <div class="card-body">
          <div class="row">
              <div class="col-md-12 col-md-offset-2">
              <button onclick="location.href='ediusuariosestudiantes'"  type="button"  style="color:white;"class="btn btn- lg btn-success float-right"><span><i class="nav-icon fa fa-arrow-left mx-2 "></i></span> Regresar </button>
              </div>
            </div><hr>
          <form method="POST">
           <div class="row">
              <?php
                $query = "SELECT es.CODIGO_ESTUDIANTE, CONCAT_WS(' ',p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE, p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) as NOMBRE
                FROM tbl_estudiante es , tbl_persona p 
                where p.CODIGO_PERSONA = es.CODIGO_PERSONA AND  es.CODIGO_ESTUDIANTE = '$estudiante';";
                $result = $conn->query($query);
                if ($result->num_rows > 0) {
                  while($row = $result->fetch_assoc()) {
                    $COD_ES = $row['CODIGO_ESTUDIANTE'];
                    $NOMBRE_ES = $row['NOMBRE'];
                 }
                }
              ?>
               <div class="col-sm-12">
                  <div class="form-group">
                    <label >Nombre del Estudiante</label>
                    <input hidden class="form-control" value="<?php echo $COD_ES; ?> ">
                    <input  type="text" value="<?php echo $NOMBRE_ES;?>"class="form-control" readonly >
                  </div>
               </div>
            </div><!--Fin del row que muestra el nombre del estudiante -->
            <hr color="blue"> 
            
          <div class="card">
            <div class="card-header text-center"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center">Carga Espiritual Disponible</h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_asignaturas" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th class="text-center">Acción</th> 
                          <th class="text-center">Catequesis</th>
                          <th class="text-center">Nombre del Catequista</th>
                          <th class="text-center">Modalidad</th>
                          <th class="text-center">Sección</th>
                          <th class="text-center">Hora</th> 
                          <th class="text-center">Fecha Inicio</th>                     
                                            
                        </tr>
                      </thead>
                      <tbody>
                        <?php                      
                        $query = "SELECT c.CODIGO_CARGA, c.CODIGO_PERSONA, c.CODIGO_MODALIDAD, c.CODIGO_TUTORIA, t.NOMBRE as TUTORIA,  CONCAT_WS(' ',p.PRIMER_NOMBRE,p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO)
                        as NOMBRE_COMPLETO  ,m.TIPO as MODALIDAD, s.NOMBRE AS SECCION, c.HORA , c.HORA_FINAL, c.FECHA_INICIO, c.FECHA_FINAL,                             c.CREADO_POR_USUARIO
                        FROM tbl_carga_academica c ,tbl_tutoria t, tbl_persona p, tbl_modalidad m , tbl_seccion s
                        WHERE c.CODIGO_PERSONA= p.CODIGO_PERSONA 
                        AND c.CODIGO_TUTORIA= t.CODIGO_TUTORIA
                        AND c.CODIGO_MODALIDAD= m.CODIGO_MODALIDA 
                        AND c.CODIGO_SECCION = s.CODIGO_SECCION
                        AND t.CODIGO_AREA = 4;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['TUTORIA'];
                            $var2 = $row['NOMBRE_COMPLETO'];
                            $var3 = $row['MODALIDAD'];
                            $var4 = $row['SECCION'];
                            $var5 = $row['HORA'];
                            $var6 = $row['CODIGO_CARGA'];
                            $var7 = $row['FECHA_INICIO'];
                            $var8 =  $row['CODIGO_TUTORIA'];
                                  ?>
                        <tr>
                        <td>
                            <div class="text-center" >
                              <div class="btn-group">
                                <a href="#MODAL<?php echo $var6; ?>" data-toggle="modal">
                                <button type='button' name="btnmatricular_espritual" id="btnmatricular_espritual"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Matricular</button>
                              </a>
                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          <td class="text-center"><?php echo $var1; ?></td>
                          <td class="text-center"><?php echo $var2; ?></td>
                          <td class="text-center"><?php echo $var3; ?></td> 
                          <td class="text-center"><?php echo $var4; ?></td>
                          <td class="text-center"><?php echo $var6; ?></td> 
                          <td class="text-center"><?php echo $var7; ?></td> 

                          <div id="MODAL<?php echo $var6; ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-lg">
                              <div class="modal-content"><!-- Modal content-->
                                  <div class="modal-header" style="background-color: #0CCDE3">
                                     <H5>Información de la Catequesis</h5>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                  <form method="POST">
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    </hr> 
                                    <div class="row"><!-- INICIO PRIMERA ROW --> 
                                      <input type="text" value ="<?php echo $var6; ?>" hidden class="form-control" name="CODIGO_CARGA" id="ID_CARGA"><!--este es el importante -->
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Catequista</label>
                                          <input  type="text"  value ="<?php echo $var2; ?>" class="form-control" readonly>
                                        </div>
                                      </div>
                                      <div class="col-sm-3">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Sección</label>
                                          <input  type="text"  value ="<?php echo $var4; ?>" class="form-control" readonly>
                                        </div>
                                      </div>
                                      <div class="col-sm-3">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Hora</label>
                                          <input  type="text"  value ="<?php echo $var5; ?>" class="form-control" readonly>
                                        </div>
                                      </div>
                                      <div class="col-sm-4">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Catequesis</label>
                                          <input hidden type="text" name="CATEQUESIS" value ="<?php echo $var8; ?>" >
                                          <input  type="text"  value ="<?php echo $var1; ?>" class="form-control"  readonly>
                                          <input hidden type="text"  value ="<?php echo $COD_ES ?>" class="form-control" name="ID_ESTUDIANTE"><!--Y este tambien es muy importante -->
                                        </div>
                                      </div>
                                      <div class="col-sm-4">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Fecha Inicio</label>
                                          <input  type="text"  value ="<?php echo $var7; ?>" class="form-control"  readonly>
                                          <input hidden type="text"  value ="<?php echo $COD_ES ?>" class="form-control" name="ID_ESTUDIANTE"><!--Y este tambien es muy importante -->
                                        </div>
                                      </div>
                                      <div class="col-sm-4">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Fecha Final</label>
                                          <input  type="text"  value ="<?php echo $var7; ?>" class="form-control"  readonly>
                                          <input hidden type="text"  value ="<?php echo $COD_ES ?>" class="form-control" name="ID_ESTUDIANTE"><!--Y este tambien es muy importante -->
                                        </div>
                                      </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY -->                       
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit"  name="AGREGAR_MATRICULA_ESPIRITUAL" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Matricular</button>      
                                  </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                </div>
                              </form>
                            </div>
                          </div><!-- FIN DEL MODAL EDITAR -->  
                      </tr>             
                      </tbody>
                      <?php
                        }
                        }
                        ?>
                  </table>
                </div><!--fin del div de responsivi -->
                
              </div> <!-- /.card-body -->
            </form>
          </div><!-- fINAL DEL card PRIMARY -->
          <br>

            <!-- boton para descargar el reporte 
            <form method="post"  action="Reportes_Prosecar/reporteMatriculaespiritualindividual.php" target="_blank"> 
            <input type="hidden" name="imprimirmatriculaindividual" value="<?php echo $codigo_es ?>">
            <button   type='submit' title='Imprimir' style="color:white; background-color:#FA0079" class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte</button>
            </form> -->
          

          <div class="card">
            <div class="card-header text-center"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center">Catequesis Matriculadas</h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                <div class="table-responsive">
                  <table id="tabla" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th class="text-center">Acción</th> 
                          <th class="text-center">Catequesis</th>
                          <th class="text-center"> Nombre del Catequista</th>
                          <th class="text-center"> Modalidad</th>
                          <th class="text-center"> Sección</th>
                          <th class="text-center"> Hora</th>                                
                        </tr>
                      </thead>
                      <tbody>
                        <?php                      
                          $query = "SELECT  t.NOMBRE as TUTORIA, ma.CODIGO_MATRICULA, ma.CODIGO_ESTUDIANTE,
                          CONCAT_WS(' ',p.PRIMER_NOMBRE,p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) as TUTOR,m.TIPO as MODALIDAD,se.NOMBRE as SECCION , c.HORA, c.CODIGO_CARGA 
                            FROM tbl_carga_academica c, tbl_seccion se ,tbl_tutoria t, tbl_persona p, tbl_modalidad m, tbl_matricula_academica ma  
                            WHERE c.CODIGO_PERSONA= p.CODIGO_PERSONA 
                            AND c.CODIGO_TUTORIA= t.CODIGO_TUTORIA 
                            AND c.CODIGO_MODALIDAD= m.CODIGO_MODALIDA
                            AND ma.CODIGO_CARGA = c.CODIGO_CARGA
                            AND c.CODIGO_SECCION = se.CODIGO_SECCION
                            AND t.CODIGO_AREA = 4
                            AND ma.CODIGO_ESTUDIANTE = '$estudiante'; ";
                          $result = $conn->query($query);
                          if ($result->num_rows > 0) {
                            while($row = $result->fetch_assoc()) {
                              $var1 = $row['TUTORIA'];
                              $var2 = $row['TUTOR'];
                              $var3 = $row['MODALIDAD'];
                              $var4 = $row['SECCION'];
                              $var5 = $row['HORA'];
                              $var6 = $row['CODIGO_CARGA'];
                              $var8 =  $row['CODIGO_MATRICULA'];
                              $var9 =  $row['CODIGO_ESTUDIANTE'];
                              ?>
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                                <a href="#ELIMINAR<?php echo $var8; ?>" data-toggle="modal">
                                <button type='button' id="ELIMINAR_MA"  style="color:white;"class="btn btn-Danger"><span> <i class="nav-icon fas fa-trash"></i></span> Eliminar</button>
                              </a>
                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          <td class="text-center"><?php echo $var1; ?></td>
                          <td class="text-center"><?php echo $var2; ?></td>
                          <td class="text-center"><?php echo $var3; ?></td> 
                          <td class="text-center"><?php echo $var4; ?></td>
                          <td class="text-center"><?php echo $var5; ?></td>
                        
                          <div id="ELIMINAR<?php echo $var8 ?>"  name="div_eliminar" id="div_eliminar"class="modal fade" role="dialog">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel"></h5>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMEeliminar" method="POST">
                                   <div class="modal-body">
                                       <input type="text" value ="<?php echo $var8; ?>" hidden class="form-control" name="ma_eliminar">
                                       <input type="text" value ="<?php echo $var9; ?>" hidden class="form-control" name="estudiante_eli">
                                       <h4 class="text-center">¿Está seguro de eliminar la clase <?php echo $var1; ?>?</h4>
                                    </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_MATRICULA"   class="btn btn-primary">Si, eliminar</button>      
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
            </form><!--FORM GENERAL -->
          </div><!-- fINAL DEL card PRIMARY -->  
           
        </div><!--FINAL DE COL-M12-->

      </div><!-- FINAL ROW PADRE -->

         </div><!-- FINAL CONTAINER FLUID --> 
        </div>
        </div>
      </section>
      </section>
            </div><!--fin del modal contener -->
              </div><!--fin del modal dialog -->
          </div><!--fin del modal de eliminar -->          
        </div><!--fIN DEL CARD GENERAL -->
   </div><!-- CIerre del container fluid--> 
  </section>
<!-- Cierre del div wraper -->
                      
<script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteMatricula.php','_blank');
      window.open(this.href,'_self');
    }
</script>
      
<script type="text/javascript"> 
  $(document).ready( function () {
      $('#tabla_asignaturas').DataTable({
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
        "search": "Buscar:",
        "zeroRecords": "La Tutoría no existe.",
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
      


