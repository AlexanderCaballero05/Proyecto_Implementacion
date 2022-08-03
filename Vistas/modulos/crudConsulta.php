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
    Programa:          Mantenimiento de consultas 
    Fecha:           
    Programador:      
    descripcion:        Permite llevar un mantenimiento de consultas 
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador               Fecha                      Descripcion
  ANY HERNANDEZ         		11-06-2022                 revision de ortografia 
----------------------------------------------------------------------->


<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 
?>
<head>

</head>

<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
                        
  <section class="content">
    <div class="container-fluid">
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
            <ul class="nav nav-tabs card-header-tabs">
              <li class="nav-item">
                <a class="nav-link active" aria-current="true" href="#">Ver Consultas Médicas</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" style="color:#000000;" href="procesoConsulta">Consulta Médica</a>
              </li>
              
            </ul>
          </div><!--FIN DEL CARD HEADER -->
          <div class="card-body">
          <div class="row">
            <div class="col-md-12">
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
                                $evaluar_permiso->execute(array($usuariomo, '1'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                          ?> <!-- fin del codigo para sustraer el permiso de insertar.-->
                          <php
                             if ($permiso_registrar= 'ON'){

                          ?>
                <a href="procesoExpedienteMedico">
                <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3">Nuevo Expediente</button>
                </a>
                <php
                   }
                 ?>
          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;">Consulta Médica </strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_expediente" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                        <th class="text-center">Acción</th>
                        <th class="text-center">Código</th>
                        <th class="text-center">Paciente</th>
                        <th class="text-center">Diagnóstico Ingreso</th>
                        <th class="text-center">Diagnóstico Egreso</th>
                        <th class="text-center">Fecha</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php                      
               $query = "SELECT m.CODIGO_EXPEDIENTE_MEDICO, concat_ws (' ',tp.PRIMER_NOMBRE,' ',tp.PRIMER_APELLIDO) as PACIENTE ,m.DIAGNOSTICO_INGRESO, m.DIAGNOSTICO_EGRESO, m.FECHA_CREACION as FECHA
               FROM tbl_expediente_medico_historico m, tbl_persona tp, tbl_inscripcion_cita c
               WHERE c.CODIGO_PERSONA_PACIENTE = tp.CODIGO_PERSONA;";
              $result = $conn->query($query);
              if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    $var1 = $row['CODIGO_EXPEDIENTE_MEDICO'];
                    $var3 = $row['PACIENTE'];
                    $var5 = $row['DIAGNOSTICO_INGRESO'];
                    $var6 = $row['DIAGNOSTICO_EGRESO'];
                    $var7 = $row['FECHA'];
                        ?>
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                                
                               <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
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
                                      $evaluar_permiso_eliminar->execute(array($usuariomo, '1'));
                                      $row1=$evaluar_permiso_eliminar->fetchColumn();
                                      $permiso_eliminar =$row1; 
                                  }
                                ?>  
                                <php
                                    if ($permiso_registrar= 'SI'){

                                ?>
                                <button id="ELIMINAR_MATRICULA" name="ELIMINAR_MATRICULA" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               <php
                                  }
                                ?>
                               </a>
                                <a href="#editar_expediente<?php echo $var1; ?>" data-toggle="modal">
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
                                  $evaluar_permiso_actualizar->execute(array($usuariomo, '1'));
                                  $row1=$evaluar_permiso_actualizar->fetchColumn();
                                  $permiso_actualizar =$row1; 
                                    
                                  }
                                ?>
                                <php
                                    if ($permiso_registrar= 'ON'){

                                ?>
                                <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                <php
                                  }
                                 ?> 
                              </a>
                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          <td class="text-center"><?php echo $var1; ?></td>
                            <td class="text-center"><?php echo $var3; ?></td>
                            <td class="text-center"><?php echo $var5; ?></td>
                            <td class="text-center"><?php echo $var6; ?></td>
                            <td class="text-center"><?php echo $var7; ?></td>
                        <!--INICIO DEL MODAL DE EDITAR -->
                        <div id="editar_expediente<?php echo $var1; ?>" class="modal fade" role="dialog">
                         <div class="modal-dialog modal-lg">
                             <div class="modal-content">
                                 <!-- Modal content-->
                                 <form method="POST">
                                     <div class="modal-header" style="background-color: #0CCDE3">
                                         <h4 class="text-center">Editar información del Expediente Médico
                                         </h4>
                                         <button type="button" class="close" data-dismiss="modal">&times;</button>
                                     </div>
                                     <div class="modal-body">
                                         <!--CUERPO DEL MODAL -->
                                         <div class="row">
                                             <!-- INICIO PRIMERA ROW -->
                                             <input type="text" value="<?php echo $var1; ?>" hidden class="form-control"
                                                  name="cod_edit_expe" id="cod_edit_expe" >
                                             <div class="col-sm-6">
                                                 <div class="form-group">
                                                     <label for="txtcodigo_persona">
                                                     Diagnóstico Ingreso</label>
                                                     <input type="text" value="<?php echo $var5; ?>" class="form-control" maxlength="50" minlength="5"  onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);" 
                                                     name="edit_tipo_expe" id="edit_tipo_expe">
                                                 </div>
                                             </div>
                                             <div class="col-sm-6">
                                                 <div class="form-group">
                                                     <label for="txtcodigo_persona">
                                                     Diagnóstico Egreso</label>
                                                     <input type="text" value="<?php echo $var6; ?>" class="form-control" maxlength="100" minlength="5"  onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);"
                                                      name="edit_descripcion_expe" id="edit_descripcion_expe">
                                                 </div>
                                             </div>
                                         </div> <!-- FIN DE EL PRIMER ROW -->
                                     </div>
                                     <!--FINAL DEL CARD BODY -->
                                     <div class="modal-footer ">
                                         <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                         <button type="submit"  name="edit_tipo_expe"  id="edit_tipo_expe" class="btn btn-success"><span>
                                                 <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                                     </div>
                                     <!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                 </form>
                             </div>
                         </div>
                        </div><!-- FIN DEL MODAL EDITAR --> 
                            
              <!-- inicio modal eliminar  -->   
              <div id="ELIMINAR<?php echo $var1 ?>"  
                          name="eliminar_tipo_expe" id="eliminar_tipo_expe"class="modal fade" role="dialog">
                          <div class="modal-dialog">
                          <div class="modal-content">
                              <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLabel"></h5>
                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                              </div>
                              <form id="FORMEeliminar" method="POST">
                              <div class="modal-body">
                                  <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="eliminar_tipo_expe" id="eliminar_tipo_expe">
                                  <h4 class="text-center">¿Esta seguro de eliminar este campo? <?php echo $var1; ?>?</h4>
                              </div> <!--fin el card body -->
                                  <div class="modal-footer ">

                                  <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                  <button type="submit"  
                                  name="eliminar_expe" id="eliminar_expe"  class="btn btn-primary">Si,eliminar</button>      
                                  </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                          </form>
                          </div><!--fin del modal contener -->
                          </div><!--fin del modal dialog -->
                      </div><!--fin del modal de eliminar -->
                          <!--fin del modal de eliminar -->
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
  </section><!-- FINAL SECTION -->

  
  <!-- Button trigger modal -->

  </section>
<!-- Modal -->

<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
$(document).ready( function () {
    $('#tabla_expediente').DataTable({
      language:espanol
    });
} );

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
} 

</script>
