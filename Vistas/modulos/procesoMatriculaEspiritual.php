<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include "conexionpdo.php";
 
 $codigoObjeto=23;
 $accion='INGRESO A MATRÍCULA';
 $descripcion= 'AGREGA UNA MATRÍCULA ESPIRITUAL';
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
       <section class="content-header text-xl-center mb-3 btn-light">
              <h4> Matricular Alumno<i class=" nav-icon fas  fa-graduation-cap"></i> </h4>
        </section>
    <div class="container-fluid">
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
            <ul class="nav nav-tabs card-header-tabs">
              <li class="nav-item">
                <a class="nav-link"  style="color:#000000;" href="crudMatricula">Ver Matrícula</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" style="color:#000000;" aria-current="true" href="procesoMatricula">Agregar Matrícula Académica</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" style="color:#000000;" aria-current="true" href="procesoMatriculaEspiritual">Agregar Matrícula Espiritual</a>
              </li>
            </ul>
          </div>
          <div class="card-body">
          </br> 

          <form method="POST" action="procesoMatriculaEspiritual">
            <div class="row mb-4">
              <form method="POST" action="procesoMatriculaEspiritual">
                     <?php
                      $query = "SELECT es.CODIGO_ESTUDIANTE, CONCAT_WS(' ',p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE, p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) as NOMBRE
                      FROM tbl_estudiante es , tbl_persona p 
                      where  p.CODIGO_PERSONA = es.CODIGO_PERSONA";
                      $resultado=$conn->query($query);
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

                                //llamar al procedimiento almacenado
                                $evaluar_permiso = $db->prepare("CALL Sp_permiso_insertar(?,?);");
                                $evaluar_permiso->execute(array($usuariomo, '23'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                          ?> <!-- fin del codigo para sustraer el permiso de insertar.-->
                          <?php
                             if ($permiso_registrar == 'SI'){

                          ?>
                    <div class="col-sm-4">
                    <div class="form-group">
                      <select style="width: 100%" class="form-control select2"   style="width: 100%;" name="BUSCA_ESTUDIANTE"  required>
                        <option selected enable value="">Seleccione Alumno</option> <!--Lo mismo que el de arriba :v -->
                        <?php 
                          if ($resultado->num_rows > 0) {
                            while($row = $resultado->fetch_assoc()) { 
                            $codigo_es = $row['CODIGO_ESTUDIANTE'];
                            $nombre_Estudiante = $row['NOMBRE'];
                          ?>
                        <option value="<?php echo $codigo_es?>"><?php echo $nombre_Estudiante;?></option>
                        <?php
                        }
                        }
                        ?>
                      </select>
                   </div>
                   
              </div>
                  <div class="col-sm-4">
                     <button  type="submit" name="BOTON_BUSCAR"  id= "BOTON_BUSCAR" class="btn btn-primary " class="col-sm-1 col-form"><span> <i class="nav-icon fa fa-search mx-1"></i></span>Buscador</button>
                   </div>
              </form>

                       <?php
                        }
                        ?>
            </div>
           </br> 
           
           

           

           <?php
            if( isset($_POST['BOTON_BUSCAR'])){
              $codigo_es = $_POST['BUSCA_ESTUDIANTE'];
              $query = "SELECT es.CODIGO_ESTUDIANTE, CONCAT_WS(' ',p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE, p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) as NOMBRE
              FROM tbl_estudiante es , tbl_persona p 
              where p.CODIGO_PERSONA = es.CODIGO_PERSONA AND  es.CODIGO_ESTUDIANTE = '$codigo_es' ;";
              $result = $conn->query($query);
              if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                  $COD_ES = $row['CODIGO_ESTUDIANTE'];
                  $NOMBRE_ES = $row['NOMBRE'];
               }
              }
            ?>
            <div class="row">
              <label class="px-4">Estudiante:</label>
              <div class="col-md-4 mb-3">
                  <input hidden class="form-control" value="<?php echo $COD_ES; ?> ">
                  <input disabled class="form-control" value="<?php echo $NOMBRE_ES; ?> ">
              </div>
             </div>

            
             

          <div class="card ">
            <div class="card-header text-center" style="background-color: #3FCDFD"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;">Carga espiritual para matricular </strong></h1>
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
                                <button type='button' name="btnmatricular_espritual" id="btnmatricular_espritual"  style="color:white;"class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span>Matricular Catequesis</button>
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
                                <form id="FORMESTUDIANTE" method="POST">
                                  <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Matricular Catequesis</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                  <strong>Información de la catequesis</strong>
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
          <div class="row"><!-- boton para descargar la "forma 03" -->
           <div class="col-md-12">
            <!-- boton para descargar el reporte -->
            <form method="post"  action="Reportes_Prosecar/reporteMatriculaespiritualindividual.php" target="_blank"> 
            <input type="hidden" name="imprimirmatriculaindividual" value="<?php echo $codigo_es ?>">
            <button   type='submit' title='Imprimir' style="color:white; background-color:#FA0079" class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>
            </form>
           </div><!-- cierre del col-md-12 -->
          </div><!-- cierre del botón -->
          

          <div class="card">
            <div class="card-header text-center" style="background-color:#3FCDFD " id="asignaturas"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;">Catequesis Matriculadas </strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_asignaturas" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th class="text-center"> Acción</th> 
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
                AND ma.CODIGO_ESTUDIANTE = '$codigo_es'; ";
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
                                    <h4 class="text-center">¿Está seguro de eliminar la clase? <?php echo $var1; ?>?</h4>
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
              </form><!-- CIERRE DE ESTE -->

            </form><!--FORM GENERAL -->
            <?php
               }
            ?>
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
   //funcion de mostrar el estilo de la datatable
$(document).ready( function () {
    $('#tabla_asignaturas').DataTable({
      language:espanol
    });
} );

//todo lo que tenga que ver con el datatable se verá en español
let = espanol = {
    "processing": "Procesando...",
    "lengthMenu": "Mostrar _MENU_ registros",
    "zeroRecords": "No se encontraron resultados",
    "emptyTable": "Ningún dato disponible en esta tabla",
    "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
    "infoFiltered": "(filtrado de un total de _MAX_ registros)",
    "search": "Buscar:",
    "infoThousands": ",",
    "loadingRecords": "Cargando...",
    "p?aginate": {
        "first": "Primero",
        "last": "Último",
        "next": "Siguiente",
        "previous": "Anterior"
    },
    "aria": {
        "sortAscending": ": Activar para ordenar la columna de manera ascendente",
        "sortDescending": ": Activar para ordenar la columna de manera descendente"
    },
    "buttons": {
        "copy": "Copiar",
        "colvis": "Visibilidad",
        "collection": "Colección",
        "colvisRestore": "Restaurar visibilidad",
        "copyKeys": "Presione ctrl o u2318 + C para copiar los datos de la tabla al portapapeles del sistema. <br \/> <br \/> Para cancelar, haga clic en este mensaje o presione escape.",
        "copySuccess": {
            "1": "Copiada 1 fila al portapapeles",
            "_": "Copiadas %ds fila al portapapeles"
        },
        "copyTitle": "Copiar al portapapeles",
        "csv": "CSV",
        "excel": "Excel",
        "pageLength": {
            "-1": "Mostrar todas las filas",
            "_": "Mostrar %d filas"
        },
        "pdf": "PDF",
        "print": "Imprimir",
        "renameState": "Cambiar nombre",
        "updateState": "Actualizar",
        "createState": "Crear Estado",
        "removeAllStates": "Remover Estados",
        "removeState": "Remover",
        "savedStates": "Estados Guardados",
        "stateRestore": "Estado %d"
    },
    "autoFill": {
        "cancel": "Cancelar",
        "fill": "Rellene todas las celdas con <i>%d<\/i>",
        "fillHorizontal": "Rellenar celdas horizontalmente",
        "fillVertical": "Rellenar celdas verticalmentemente"
    },
    "decimal": ",",
    "searchBuilder": {
        "add": "Añadir condición",
        "button": {
            "0": "Constructor de búsqueda",
            "_": "Constructor de búsqueda (%d)"
        },
        "clearAll": "Borrar todo",
        "condition": "Condición",
        "conditions": {
            "date": {
                "after": "Despues",
                "before": "Antes",
                "between": "Entre",
                "empty": "Vacío",
                "equals": "Igual a",
                "notBetween": "No entre",
                "notEmpty": "No Vacio",
                "not": "Diferente de"
            },
            "number": {
                "between": "Entre",
                "empty": "Vacio",
                "equals": "Igual a",
                "gt": "Mayor a",
                "gte": "Mayor o igual a",
                "lt": "Menor que",
                "lte": "Menor o igual que",
                "notBetween": "No entre",
                "notEmpty": "No vacío",
                "not": "Diferente de"
            },
            "string": {
                "contains": "Contiene",
                "empty": "Vacío",
                "endsWith": "Termina en",
                "equals": "Igual a",
                "notEmpty": "No Vacio",
                "startsWith": "Empieza con",
                "not": "Diferente de",
                "notContains": "No Contiene",
                "notStarts": "No empieza con",
                "notEnds": "No termina con"
            },
            "array": {
                "not": "Diferente de",
                "equals": "Igual",
                "empty": "Vacío",
                "contains": "Contiene",
                "notEmpty": "No Vacío",
                "without": "Sin"
            }
        },
        "data": "Data",
        "deleteTitle": "Eliminar regla de filtrado",
        "leftTitle": "Criterios anulados",
        "logicAnd": "Y",
        "logicOr": "O",
        "rightTitle": "Criterios de sangría",
        "title": {
            "0": "Constructor de búsqueda",
            "_": "Constructor de búsqueda (%d)"
        },
        "value": "Valor"
    },
    "searchPanes": {
        "clearMessage": "Borrar todo",
        "collapse": {
            "0": "Paneles de búsqueda",
            "_": "Paneles de búsqueda (%d)"
        },
        "count": "{total}",
        "countFiltered": "{shown} ({total})",
        "emptyPanes": "Sin paneles de búsqueda",
        "loadMessage": "Cargando paneles de búsqueda",
        "title": "Filtros Activos - %d",
        "showMessage": "Mostrar Todo",
        "collapseMessage": "Colapsar Todo"
    },
    "select": {
        "cells": {
            "1": "1 celda seleccionada",
            "_": "%d celdas seleccionadas"
        },
        "columns": {
            "1": "1 columna seleccionada",
            "_": "%d columnas seleccionadas"
        },
        "rows": {
            "1": "1 fila seleccionada",
            "_": "%d filas seleccionadas"
        }
    },
    "thousands": ".",
    "datetime": {
        "previous": "Anterior",
        "next": "Proximo",
        "hours": "Horas",
        "minutes": "Minutos",
        "seconds": "Segundos",
        "unknown": "-",
        "amPm": [
            "AM",
            "PM"
        ],
        "months": {
            "0": "Enero",
            "1": "Febrero",
            "10": "Noviembre",
            "11": "Diciembre",
            "2": "Marzo",
            "3": "Abril",
            "4": "Mayo",
            "5": "Junio",
            "6": "Julio",
            "7": "Agosto",
            "8": "Septiembre",
            "9": "Octubre"
        },
        "weekdays": [
            "Dom",
            "Lun",
            "Mar",
            "Mie",
            "Jue",
            "Vie",
            "Sab"
        ]
    },
    "editor": {
        "close": "Cerrar",
        "create": {
            "button": "Nuevo",
            "title": "Crear Nuevo Registro",
            "submit": "Crear"
        },
        "edit": {
            "button": "Editar",
            "title": "Editar Registro",
            "submit": "Actualizar"
        },
        "remove": {
            "button": "Eliminar",
            "title": "Eliminar Registro",
            "submit": "Eliminar",
            "confirm": {
                "_": "¿Está seguro que desea eliminar %d filas?",
                "1": "¿Está seguro que desea eliminar 1 fila?"
            }
        },
        "error": {
            "system": "Ha ocurrido un error en el sistema (<a target=\"\\\" rel=\"\\ nofollow\" href=\"\\\">Más información&lt;\\\/a&gt;).<\/a>"
        },
        "multi": {
            "title": "Múltiples Valores",
            "info": "Los elementos seleccionados contienen diferentes valores para este registro. Para editar y establecer todos los elementos de este registro con el mismo valor, hacer click o tap aquí, de lo contrario conservarán sus valores individuales.",
            "restore": "Deshacer Cambios",
            "noMulti": "Este registro puede ser editado individualmente, pero no como parte de un grupo."
        }
    },
    "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
    "stateRestore": {
        "creationModal": {
            "button": "Crear",
            "name": "Nombre:",
            "order": "Clasificación",
            "paging": "Paginación",
            "search": "Busqueda",
            "select": "Seleccionar",
            "columns": {
                "search": "Búsqueda de Columna",
                "visible": "Visibilidad de Columna"
            },
            "title": "Crear Nuevo Estado",
            "toggleLabel": "Incluir:"
        },
        "emptyError": "El nombre no puede estar vacio",
        "removeConfirm": "¿Seguro que quiere eliminar este %s?",
        "removeError": "Error al eliminar el registro",
        "removeJoiner": "y",
        "removeSubmit": "Eliminar",
        "renameButton": "Cambiar Nombre",
        "renameLabel": "Nuevo nombre para %s",
        "duplicateError": "Ya existe un Estado con este nombre.",
        "emptyStates": "No hay Estados guardados",
        "removeTitle": "Remover Estado",
        "renameTitle": "Cambiar Nombre Estado"
    }
};



</script>

