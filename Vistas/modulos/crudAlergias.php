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
    Programa:          Mantenimiento de alergias
    Fecha:             09-Junio-2022
    Programador:       Diana Rut Garcia 
    descripcion:       Permite llevar un mantenimiento de las alergias del area media ,editar,eliminar nuevo
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador               Fecha                      Descripcion
DIANA RUT GARCIA    		09-06-2022                 Cambio en el titulo y en el modal de editar
DIANA RUT GARCIA    		21-06-2022                 Cambio en ortografia
D'aniel Martinez        11-07-2022                 Quitar bitacora de acceso al mantenimiento
D'aniel Martinez        11-07-2022                 Arreglar ortografía.
D'aniel Martinez        11-07-2022                 Arreglar minimo y maximo de los inputs.
D'aniel Martinez        11-07-2022                 Quitar espacios inicio y final para evitar campos vacios
D'aniel Martinez        11-07-2022                 Agregar funcion para input descripcion acepte letras y numeros unicamente.
----------------------------------------------------------------------->
<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include "conexionpdo.php";
 
?>

<head>
</head>
<body oncopy="return false" onpaste="return false"></body>
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  <section class="content">
    <div class="container-fluid">
    <div class="content-header text-xl-center mb-3 ">
        <h4>Mantenimiento Alergias</h4>    
    </div>
      <div class="row">
        <div class="col-md-12">
        <?php
         include "conexionpdo.php";
         $usuario=$_SESSION['vario'];
          //Evaluo si existe el tipo de Rol
          $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
          $evaluar_usuario->execute(array($usuario));
          $row=$evaluar_usuario->fetchColumn();
          if($row > 0){
           $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
           $evaluar_permiso = $db->prepare("CALL Sp_permiso_insertar(?,?);");
           $evaluar_permiso->execute(array($usuariomo, '30'));
           $row1=$evaluar_permiso->fetchColumn();
            $permiso_registrar =$row1;             
           }
          ?> <!-- fin del codigo para sustraer el permiso de insertar.-->       
          <?php
          if($permiso_registrar == 'SI'){
          ?>
           
          <button  data-toggle="modal"  href="#AGREGAR_ALERGIA" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar Alergia</button>
          <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>   
          <!-- Inicios del card -->
          <?php
           }
          ?>
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;"></strong></h1>
            </div>
            <form  method="POST"class="needs-validation" novalidate><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_roles" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th class="text-center">Acción</th>
                          <th class="text-center">Código Alergia</th>
                          <th class="text-center">Nombre Alergia</th>
                          <th class="text-center">Descripción</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT * FROM tbl_alergias
                        ORDER BY  CODIGO_ALERGIAS ASC ;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_ALERGIAS'];
                            $var2 = $row['NOMBRE'];
                            $var3 = $row['DESCRIPCION'];
                        ?>
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">

                              <!-- Codigo de permiso para Eliminar -->
                              <?php
                                $usuario=$_SESSION['vario'];
                                $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL  FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                                $evaluar_usuario->execute(array($usuario));
                                $row=$evaluar_usuario->fetchColumn();
                                if($row > 0){
                                  $usuariomo = $row;
                                  $evaluar_permiso_eliminar = $db->prepare("CALL Sp_permiso_eliminar(?,?);");
                                  $evaluar_permiso_eliminar->execute(array($usuariomo, '30'));
                                  $row1=$evaluar_permiso_eliminar->fetchColumn();
                                  $permiso_eliminar =$row1; 
                                }
                              ?> 
                               <?php
                                 if($permiso_eliminar == 'SI'){
                               ?>                            
                              <!--Fin del boton de eliminar -->
                               <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                <button id="ELIMINAR" name="ELIMINAR" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>
                               <?php
                                }
                               ?>
                              <!--Codigo para asignar permiso del boton de editar -->
                              <?php
                               $usuario=$_SESSION['vario'];
                               //Evaluo si existe el tipo de Rol
                               $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                               $evaluar_usuario->execute(array($usuario));
                               $row=$evaluar_usuario->fetchColumn();
                               if($row > 0){
                                  $usuariomo = $row;
                                  $evaluar_permiso_actualizar = $db->prepare("CALL Sp_permiso_actualizar(?,?);");
                                  $evaluar_permiso_actualizar->execute(array($usuariomo, '30'));
                                  $row2=$evaluar_permiso_actualizar->fetchColumn();
                                  $permiso_actualizar =$row2; 
                               }
                              ?>
                              <?php
                                if($permiso_actualizar == 'SI')
                                {
                              ?>
                                
                             
                              <a href="#EDITAR_ALERGIA<?php echo $var1; ?>" data-toggle="modal">
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
                          <td class="text-center"><?php echo $var3; ?></td>
                        
                          <div id="EDITAR_ALERGIA<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal contenido-->
                                <div class="modal-header" style="background-color: #0CCDE3">
                                  <h4 class="text-center">Editar Alergia</h4>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMEDITRAPERSONAS" method="POST" >
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="id_alergia" >
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Nombre Alergia</label>
                                          <input  type="text" class="form-control" value ="<?php echo $var2; ?>"pattern=".{6,35}"maxlength="35" onkeypress="return soloLetras(event);" onkeyup="this.value=this.value.replace(/^\s+/,'');"   autocomplete = "off" type="text" name="editar_nombre" onblur="quitarespacios(this);" required>
                                          <div class="invalid-feedback">
                                       Campo Obligatorio.
                                   </div>
                                        </div>
                                      </div>
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Descripción Alergia</label>
                                          <input  type="text" class="form-control" value ="<?php echo $var3; ?>" pattern=".{6,100}"  maxlength="100" onkeypress="return soloLetrasNum(event);" onkeyup="this.value=this.value.replace(/^\s+/,'');" autocomplete = "off" type="text"   name="editar_descripcion" id="editar_descripcion" onblur="quitarespacios(this);"required>
                                          <div class="invalid-feedback">
                                       Campo Obligatorio.
                                   </div>
                                        </div>
                                      </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY -->                       
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="editar_alergia" name="editar_alergia" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                                  </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                </div>
                              </form>
                            </div>
                          </div><!-- FIN DEL MODAL EDITAR -->  
                            
                          <!--INICIO DEL MODAL ELIMINAR   -->
                          <div id="ELIMINAR<?php echo $var1 ?>"  name="div_eliminar" id="div_eliminar"class="modal fade" role="dialog">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel"></h5>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMEeliminar" method="POST">
                                  <div class="modal-body">
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="alergia_eliminar" >
                                    <h4 class="text-center">¿Está seguro de eliminar la alergia? <?php echo $var2; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_ALER" id="ELIMINAR_ALER"  class="btn btn-primary">Si, eliminar</button>      
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

  <!--INICIO DEL MODAL DE AGREGAR UN NUEVO ROL -->
    <div id="AGREGAR_ALERGIA" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form  method="POST"  class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Alergia</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Nombre Alergia</label>
                                    <input  type="text"  class="form-control" pattern=".{6,35}"maxlength="35" onkeypress="return soloLetras(event);" onkeyup="this.value=this.value.replace(/^\s+/,'');" autocomplete = "off" type="text" placeholder="Ingrese un tipo de alergia" name="nombre_alergia" onblur="quitarespacios(this);" required>
                                     <div class="invalid-feedback">
                                       Campo Obligatorio.
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Descripción Alergia</label>
                                    <input  type="text"   class="form-control"  pattern=".{6,100}"maxlength="100" onkeypress="return soloLetrasNum(event);" onkeyup="this.value=this.value.replace(/^\s+/,'');" autocomplete = "off" type="text"  placeholder="Ingrese una descripción de la alergia" name="descripcion_alergia" onblur="quitarespacios(this);" required>
                                    <div class="invalid-feedback">
                                       Campo Obligatorio.
                                   </div>
                                </div>
                            </div>
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="AGREGAR_ALERGIAS" name="AGREGAR_ALERGIAS" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO ROL --> 
   <!--Elaborado por Diana Rut y modificado por ella :v -->
  
   <script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteAlergia.php','_blank');
      window.open(this.href,'_self');
    }

  </script>

<script type="text/javascript"> 
  $(document).ready( function () {
      $('#tabla_roles').DataTable({
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
        "search": "Buscar Alergia:",
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
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  var forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
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

<script>
     $(document).ready( function () {
      $("input").on("keypress", function () {
       $input=$(this);
       setTimeout(function () {
        $input.val($input.val().toUpperCase());
       },50);
      })
     })
</script>

 <script>
     function soloLetrasNum(e){
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = " ¿áéíóúabcdefghijklmnñopqrstuvwxyz?1234567890";
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