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
          <div class="card-header">
            <ul class="nav nav-tabs card-header-tabs">
              <li class="nav-item">
                <a class="nav-link "  href="crudMatricula">Ver Matricula</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="true" href="procesoMatricula">Matricula</a>
              </li>
              <li class="nav-item">
                <a class="nav-link disabled">Otros</a>
              </li>
            </ul>
          </div>
          <div class="card-body"><!--Cuerpo del card body principal -->
            </br>
            
            
            <form action="">
            <div class="row sm-6">
                      <label for="">Seleccionar al estudiante:</label>
                       <input type="text" name="nombre1" class="form-control" placeholder="Buscar" onkeyup="mayus(this);" minlength="3" maxlength="20"   required="">
                       <button  class="btn btn-secondary "  class="col-sm-1 col-form">Buscador</button>
                    
              </div>
            </form>
            <br>
           

               <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;">Clases a matricular </strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_asignaturas" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th>Asignatura </th>
                          <th>Nombre del Tutor</th>
                          <th>Modalidad</th>
                          <th>Seccion</th>
                          <th>Hora</th>                     
                          <th>Acción</th>                   
                        </tr>
                      </thead>
                      <tbody>
                        <?php                      
               $query = "SELECT  t.NOMBRE as TUTORIA,
                CONCAT_WS(' ',p.PRIMER_NOMBRE,p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) as TUTOR,
                 m.TIPO as MODALIDAD, c.SECCION, c.HORA, c.CODIGO_CARGA 
                 FROM tbl_carga_academica c ,tbl_tutoria t, tbl_persona p, tbl_modalidad m 
                 WHERE c.CODIGO_PERSONA= p.CODIGO_PERSONA 
                 AND c.CODIGO_TUTORIA= t.CODIGO_TUTORIA 
                 AND c.CODIGO_MODALIDAD= m.CODIGO_MODALIDA;";
              $result = $conn->query($query);
              if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                  $var1 = $row['TUTORIA'];
                  $var2 = $row['TUTOR'];
                  $var3 = $row['MODALIDAD'];
                  $var4 = $row['SECCION'];
                  $var5 = $row['HORA'];
                  $var6 = $row['CODIGO_CARGA'];
                  
                        ?>
                        <tr>
                          
                          <td class="text-center"><?php echo $var1; ?></td>
                          <td class="text-center"><?php echo $var2; ?></td>
                          <td class="text-center"><?php echo $var3; ?></td> 
                          <td class="text-center"><?php echo $var4; ?></td>
                          <td class="text-center"><?php echo $var6; ?></td> 

                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                                
                                <a href="# <?php echo $var1; ?>" data-toggle="modal">
                               
                                <button type='button' name="btnmatricular" id="btnmatricular"  style="color:white;"class="btn btn-Primary"><span> <i class="nav-icon fas fa-edit mx-1"></i></span>Matricular</button>
                                 
                              </a>
                              </div>
                            </div><!-- final del text-center -->
                          </td>
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
          
          <br>
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #33FFC8" id="asignaturas"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;">Clases ya matriculadas </strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_asignaturas" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th>Asignatura </th>
                          <th>Nombre del Tutor</th>
                          <th>Modalidad</th>
                          <th>Seccion</th>
                          <th>Hora</th>                     
                          <th>Acción</th>                   
                        </tr>
                      </thead>
                      <tbody>
                        <?php                      
               $query = "SELECT  t.NOMBRE as TUTORIA,
               CONCAT_WS(' ',p.PRIMER_NOMBRE,p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) as TUTOR,
                m.TIPO as MODALIDAD, c.SECCION, c.HORA, c.CODIGO_CARGA 
                FROM tbl_carga_academica c ,tbl_tutoria t, tbl_persona p, tbl_modalidad m, tbl_matricula_academica ma  
                WHERE c.CODIGO_PERSONA= p.CODIGO_PERSONA 
                AND c.CODIGO_TUTORIA= t.CODIGO_TUTORIA 
                AND c.CODIGO_MODALIDAD= m.CODIGO_MODALIDA
                AND ma.CODIGO_CARGA = c.CODIGO_CARGA
                AND ma.CODIGO_ESTUDIANTE = $codigo;";
              $result = $conn->query($query);
              if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                  $var1 = $row['TUTORIA'];
                  $var2 = $row['TUTOR'];
                  $var3 = $row['MODALIDAD'];
                  $var4 = $row['SECCION'];
                  $var5 = $row['HORA'];
                  $var6 = $row['CODIGO_CARGA'];
                  
                        ?>
                        <tr>
                          
                          <td class="text-center"><?php echo $var1; ?></td>
                          <td class="text-center"><?php echo $var2; ?></td>
                          <td class="text-center"><?php echo $var3; ?></td> 
                          <td class="text-center"><?php echo $var4; ?></td>
                          <td class="text-center"><?php echo $var6; ?></td> 

                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                                
                                <a href="# <?php echo $var1; ?>" data-toggle="modal">
                               
                                <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-Danger"><span> <i class="nav-icon fas fa-trash"></i></span> Eliminar</button>
                                 
                              </a>
                              </div>
                            </div><!-- final del text-center -->
                          </td>
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


 
<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
$(document).ready( function () {
    $('#tabla_asignaturas').DataTable({
      language:espanol
    });
} );

 //Funcion para habilitar el de la tabla
 $( function() {
    $("#estudiante").change( function() {
        if ($(this).val() > 0 ) {
          document.getElementById('asignaturas').style.display = "block";
          document.getElementById('tabla_asignaturas').style.display = "block";
          
        } else{
          document.getElementById('asignaturas').style.display = "none";
          document.getElementById('tabla_asignaturas').style.display = "none";
           
        }
    });
  });


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
    "paginate": {
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

