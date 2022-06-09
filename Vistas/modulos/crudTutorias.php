<!-- -----------------------------------------------------------------------
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
    Programa:          Mantenimiento de tutorias
    Fecha:             09-Junio-2022
    Programador:       Diana Rut Garcia
    descripcion:       Edita,elimina y registra una tutoria
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador           Fecha                      Descripcion
Diana Rut Garcia     		09-06-2022                Cambio en mensajes bitacora,con detalles de escritura y otros
----------------------------------------------------------------------->
<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include "conexionpdo.php";
 
 $codigoObjeto=22;
 $accion='INGRESO AL MANTENIMIENTO TUTORÍAS';
 $descripcion= 'USUARIO SE AUTENTIFICO';
 bitacora($codigoObjeto, $accion,$descripcion);
?>
<head>
</head>
<body oncopy="return false" onpaste="return false" >
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  <section class="content">
    <div class="container-fluid">
     <div class="content-header text-xl-center mb-3 ">
        <h4>Mantenimiento Tutorías</h4>     
      </div>
      <div class="row">
        <div class="col-md-12">
        <?php
          $usuario=$_SESSION['vario'];
           //Evaluo si existe el tipo de Rol
           $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL  FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
           $evaluar_usuario->execute(array($usuario));
           $row=$evaluar_usuario->fetchColumn();
           if($row > 0){
             $usuariomo = $row;
             $evaluar_permiso = $db->prepare("CALL Sp_permiso_insertar(?,?);");
             $evaluar_permiso->execute(array($usuariomo, '22'));
             $row1=$evaluar_permiso->fetchColumn();
             $permiso_registrar =$row1;             
            }
          ?> <!-- fin del codigo para sustraer el permiso de insertar.-->   
           <?php
           if($permiso_registrar == 'SI' ){
           ?> 
            <button  data-toggle="modal"  href="#AGREGAR_TUTORIA" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar Tutoría</button>
           <?php
            }
           ?>
           <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>
          <!-- Inicio del card -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;"></strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                <div class="table-responsive">
                  <table id="tabla_tutoria" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th class="text-center">Acción</th>
                          <th class="text-center">Código</th>
                          <th class="text-center">Nombre Tutoría</th>
                          <th class="text-center">Área</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT CODIGO_TUTORIA,t.CODIGO_AREA, t.NOMBRE , a.NOMBRE as AREA, t.FECHA_CREACION, t.CREADO_POR, t.FECHA_MODIFICACION, t.MODIFICADO_POR
                        FROM tbl_tutoria t, tbl_area a
                        WHERE  a.CODIGO_AREA = t.CODIGO_AREA ORDER BY  CODIGO_TUTORIA ASC ;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_TUTORIA'];
                            $var2 = $row['NOMBRE'];
                            $var3 = $row['AREA'];
                            $var6 = $row['CODIGO_AREA'];
                        ?>
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                              <?php
                                $usuario=$_SESSION['vario'];
                                //Evaluo si existe el tipo de Rol
                                $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario  WHERE NOMBRE_USUARIO = (?);");
                                $evaluar_usuario->execute(array($usuario));
                                $row=$evaluar_usuario->fetchColumn();
                                if($row > 0){
                                  $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                                  $evaluar_permiso_eliminar = $db->prepare("CALL Sp_permiso_eliminar(?,?);");
                                  $evaluar_permiso_eliminar->execute(array($usuariomo, '22'));
                                  $row1=$evaluar_permiso_eliminar->fetchColumn();
                                  $permiso_eliminar =$row1; 
                                }
                             ?>    
                             <?php
                             if($permiso_eliminar == 'SI'){
                             ?>                           
                               <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                <button id="eliminar" name="eliminar" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>
                              <?php
                               }
                              ?>
                               <?php
                                $usuario=$_SESSION['vario'];
                                //Evaluo si existe el tipo de Rol
                                $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario  WHERE NOMBRE_USUARIO = (?);");
                                $evaluar_usuario->execute(array($usuario));
                                $row=$evaluar_usuario->fetchColumn();
                                if($row > 0){
                                  $usuariomo = $row;
                                  $evaluar_permiso_actualizar = $db->prepare("CALL Sp_permiso_actualizar(?,?);");
                                  $evaluar_permiso_actualizar->execute(array($usuariomo, '22'));
                                  $row1=$evaluar_permiso_actualizar->fetchColumn();
                                  $permiso_actualizar =$row1; 
                                }
                               ?>
                               <?php
                                if($permiso_actualizar == 'SI' ){
                               ?>
                                <a href="#EDITARTUTORIA<?php echo $var1; ?>" data-toggle="modal">
                                <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                </a>
                                <?php
                                 }
                                ?><!--Fin del if de permitir permiso de actualizar -->
                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          <td class="text-center"><?php echo $var1; ?></td>
                          <td class="text-center"><?php echo $var2; ?></td>
                          <td class="text-center"><?php echo $var3; ?></td>
                        <!--INICIO DEL MODAL DE EDITAR TUTORIA -->
                          <div id="EDITARTUTORIA<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                                <div class="modal-header" style="background-color: #0CCDE3">
                                  <h4 class="text-center">Editar Tutoría</h4>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMEDITRAPERSONAS" method="POST" >
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="id_tutoria" id="id_tutoria">
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Nombre Tutoría</label>
                                          <input  id="bloquear1" required type="text"  value ="<?php echo $var2; ?>" class="form-control"  maxlength="20" minlength="5" onkeyup="mayus(this);"   autocomplete = "off" type="text" onkeypress="return soloLetras(event);"  name="editar_nombre" id="editar_nombre">
                                        </div>
                                      </div>

                                      <div class="col-sm-12">
                                        <?php //--INICIO DEL ESTADO
                                        $query = "SELECT  CODIGO_AREA,NOMBRE 
                                        FROM tbl_area
                                        where CODIGO_AREA BETWEEN 1 and 4
                                        and CODIGO_AREA <> 2
                                        and  CODIGO_AREA <> 3";
                                        $resultadod=$conn->query($query);                
                                       ?>
                                       <label  class="control-label">Área</label>  
                                       <div class="form-group">
                                         <select class="form-control select2 select2-primary"   style="width: 100%;" name="editar_area" id="editar_area" required>
                                         <option value="<?php echo $var6?>"><?php echo $var3;?></option>
                                          <?php 
                                          if ($resultadod->num_rows > 0) {
                                          while($row = $resultadod->fetch_assoc()) { 
                                          $codigo = $row['CODIGO_AREA'];
                                          $area = $row['NOMBRE'];
                                          ?>
                                        <option value="<?php echo $codigo?>" ><?php echo $area;?></option>
                                        <?php } 
                                         }?>
                                        </select> 
                                       </div>
                                      </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY -->                       
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="editar_tutoria" name="editar_tutoria" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
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
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="tutoria_eliminar" id="tutoria_eliminar">
                                    <h4 class="text-center">¿Está seguro de eliminar la tutoría <?php echo $var2; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_TUTORIA" id="ELIMINAR_TUTORIA"  class="btn btn-primary">Si,eliminar</button>      
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
  </section><!-- FINAL SECTION -->

  <!--INICIO DEL MODAL DE AGREGAR UNA NUEVA TUTORIA -->
  <div id="AGREGAR_TUTORIA" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITRAPERSONAS" method="POST" class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Tutoría</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Nombre Tutoría</label>
                                    <input id="bloquear" required type="text"  value ="" class="form-control"  maxlength="100" minlength="5"   onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese un nombre a la tutoria" name="nombre_tutoria">
                                    <div class="invalid-feedback">
                                     Campo obligatorio.
                                   </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                              <?php //--INICIO DEL ESTADO
                                $query = "SELECT  CODIGO_AREA,NOMBRE 
                                FROM tbl_area
                                where CODIGO_AREA BETWEEN 1 and 4
                                and CODIGO_AREA <> 2
                                and  CODIGO_AREA <> 3;";
                                $resultadod=$conn->query($query);                
                               ?>
                              <label  class="control-label">Área</label>  
                                <div class="form-group">
                                    <select class="form-control select2 select2-primary"   style="width: 100%;" name="codigo_area" id="codigo_area" required>
                                      <option selected enable value=""> --Seleccionar Area-- </option>
                                      <?php 
                                       if ($resultadod->num_rows > 0) {
                                       while($row = $resultadod->fetch_assoc()) { 
                                       $codigo_area = $row['CODIGO_AREA'];
                                       $area = $row['NOMBRE'];
                                       ?>
                                      <option value="<?php echo $codigo_area?>" ><?php echo $area;?></option>
                                      <?php } 
                                      }?>
                                      <div class="invalid-feedback">
                                         Campo obligatorio.
                                     </div>
                                    </select> 
                                </div>
                            </div>
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="nueva_tutoria" name="nueva_tutoria" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO TUTORIA Elaborado por Diana Rut --> 
  
</body>
<script>
  var texto=document.getElementById('bloquear');
  texto.addEventListener('keydown', function(keyboardEvent) {
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
  });
  var texto1 =document.getElementById('bloquear1');
  texto1.addEventListener('keydown', function(keyboardEvent) {
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
  });
</script>

<script type="text/javascript"> 
  $(document).ready( function () {
      $('#tabla_tutoria').DataTable({
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
        "search": "Buscar Tutoría:",
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
      window.open('Reportes_Prosecar/reporteTutoria.php','_blank');
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
