<!-- 
-----------------------------------------------------------------------
Universidad Nacional Autonoma de Honduras (UNAH)
		Facultad de Ciencias Economicas
Departamento de Informatica administrativa
Analisis, Programacion y Evaluacion de Sistemas
           Primer Periodo 2016

Equipo:


Catedratico:
Lic. Claudia Nuñez (Analisis)
Lic. Giancarlo Martini Scalici Aguilar (Implementación)
Lic. Karla Melisa Garcia Pineda (Evaluación)

---------------------------------------------------------------------

Programa:         Pantalla de Ingreso a Apariencia Física
Fecha:             
Programador:       
descripcion:       Pantalla que contrala los tipos de Apariencia fisica 

-----------------------------------------------------------------------
                      Historial de Cambio
-----------------------------------------------------------------------

Programador               Fecha                      Descripcion
Gissela Diaz              08/06/2022                cambios de nombres de variables y nombre objeto 
                                                    y descripción
Diana Rut Garcia          21/06/2022                Cambios en el modal con validaciones                                        
D'aniel Martinez          11-07-2022                 Quitar bitacora de acceso al mantenimiento
D'aniel Martinez          11-07-2022                 Arreglar ortografía.
D'aniel Martinez          11-07-2022                 Arreglar minimo y maximo de los inputs.
D'aniel Martinez          11-07-2022                 Quitar espacios inicio y final para evitar campos vacios
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
      </div>
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  
  <section class="content">
    <div class="container-fluid">
    <div class="content-header text-xl-center mb-3 ">
            <h4>Mantenimiento Apariencia Física</h4>    
    </div>
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
                                $evaluar_permiso->execute(array($usuariomo, '30'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->
                            <?php
                             if ($permiso_registrar == 'SI'){

                             ?>
            <button  data-toggle="modal"  href="#AGREGAR" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar Apariencia</button>
            <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Descargar Reporte</button>
              </br></br>

                </a>
                <?php
                   }
                 ?>
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3">
               <h1 class=" card-title text-center"><strong style="color:black;"></strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_Apariencia" class="table table-bordered table-striped">
                      <thead class="text-center">
                        <tr>
                        <th class="text-center">Acción</th>
                         <th class="text-center">Código</th>
                         <th class="text-center">Tipo de Apariencia</th>        
                         <th class="text-center">Estado</th> 
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                         $query = "SELECT * FROM tbl_apariencia_fisica ;";
                         $result = $conn->query($query);
                         if ($result->num_rows > 0) {
                             while ($row = $result->fetch_assoc()) {
                                 $var1 = $row['CODIGO_APARIENCIA'];
                                 $var2 = $row['TIPO'];
                                 $var4= $row['CODIGO_ESTADO'];
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

                                      $evaluar_permiso_eliminar = $db->prepare("CALL Sp_permiso_eliminar(?,?);");
                                      $evaluar_permiso_eliminar->execute(array($usuariomo, '30'));
                                      $row1=$evaluar_permiso_eliminar->fetchColumn();
                                      $permiso_eliminar =$row1; 
                                  }
                                  ?>  
                                
                                 <!-- fin del codigo para sustraer el permiso de eliminar-->
                                  <?php 
                                    if($permiso_eliminar == 'SI'){
                                  ?>
                                  <a href="#ELIMINAR<?php echo $var1; ?>" data-toggle="modal">
                                    <button id="eliminar_medic" name="eliminar_medic" type='button' class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                                    </button>
                                 </a>
                                 <?php 
                                   }
                                 ?>
                                <!-- Codigo de permiso para Actualizar -->
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
                                      $evaluar_permiso_actualizar->execute(array($usuariomo, '30'));
                                      $row1=$evaluar_permiso_actualizar->fetchColumn();
                                      $permiso_actualizar =$row1; 
                                  }
                                  ?>

                                 <?php
                                    if ($permiso_actualizar == 'SI'){

                                  ?>
                                </a>
                                <a href="#EDITAREXAMEN<?php echo $var1; ?>" data-toggle="modal">
                                <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                <?php
                                  }
                                 ?>
                              
                              </a>
                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          <td class="text-center"><?php echo $var1; ?></td>
                          <td class="text-center"><?php echo $var2; ?></td>
                          <td class="text-center"><?php
                              $consulta1 = mysqli_query($conn,"SELECT NOMBRE FROM tbl_estado WHERE CODIGO_ESTADO='$var4'");
                              $IDE2=mysqli_fetch_array($consulta1); 
                              ECHO $IDE2['NOMBRE'];
                          ?></td>
                                                    
                                        <!--INICIO DEL MODAL DE EDITA EXAMEN -->
                          
                        <!--INICIO DEL MODAL DE EDITAR -->
                        <div id="EDITAREXAMEN<?php echo $var1; ?>" class="modal fade" role="dialog">
                         <div class="modal-dialog modal-md">
                             <div class="modal-content">
                                <div class="modal-header" style="background-color: #0CCDE3">
                                  <h4 class="text-center">Editar Apariencia Física</h4>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                 <form method="POST">
                                     <div class="modal-body"><!--CUERPO DEL MODAL -->
                                         <div class="row">
                                             <!-- INICIO PRIMERA ROW -->
                                             <input type="text" value="<?php echo $var1; ?>" hidden class="form-control" name="id_apariencia" id="id_apariencia" >
                                             <div class="col-sm-12">
                                                 <div class="form-group">
                                                     <label>Apariencia Física</label>
                                                     <input  type="text"  value="<?php echo $var2; ?>" class="form-control" pattern=".{5,50}" maxlength="50" onkeypress="return soloLetras(event);" onkeyup="this.value=this.value.replace(/^\s+/,'');"  autocomplete="off" type="text"  
                                                     name="editar_apariencia" id="editar_apariencia" onblur="quitarespacios(this);" required>
                                                 </div>
                                             </div>
                                             <div class="col-md-6"><!--INICIO estado--> 
                                            <div class="form-group">
					                                      <label class="control-label">Estado</label>
                                                <select class="form-control select2 select2-primary"   style="width: 100%;" name="EDITARESTADO" id="EDITARESTADO" required>
                                                    <option  disabled value="">-- Seleccione --</option>
                                                    <option value="2"<?php if ($var4==2) { ECHO "selected"; } ?>>ACTIVO</option>
                                                    <option value="3"<?php if ($var4==3) { ECHO "selected"; } ?>>INACTIVO</option>
                                                </select> 
                                                <div class="invalid-feedback">
                                                        Elija una opción.
                                                </div>
                                            </div>
                                      </div> <!--Fin estado -->
                                         </div> <!-- FIN DE EL PRIMER ROW -->
                                     </div>
                                     <!--FINAL DEL CARD BODY -->
                                     <div class="modal-footer ">
                                         <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                         <button type="submit"  name="editaapariencia"  id="editaapariencia" class="btn btn-success"><span>
                                        <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                                     </div>
                                     <!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                 </form>
                             </div>
                         </div>
                         </div><!-- FIN DEL MODAL EDITAR -->
                            
                         <!--INCICIO DEL MODAL ELIMINAR   -->
                         <div id="ELIMINAR<?php echo $var1 ?>"  
                                                    name="eliminar_apariencia" id="eliminar_apariencia"class="modal fade" role="dialog">
                                                    <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        </div>
                                                        <form id="FORMEeliminar" method="POST">
                                                        <div class="modal-body">
                                                            <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="eliminar_aparienciafisica" id="eliminar_aparienciafisica">
                                                            <h4 class="text-center">¿Está seguro de eliminar la Apariencia? <?php echo $var2;?>?</h4>
                                                        </div> <!--fin el card body -->
                                                            <div class="modal-footer ">

                                                            <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                                            <button type="submit"  
                                                            name="eliminar_apariencia" id="eliminar_apariencia"  class="btn btn-primary">Si,eliminar</button>      
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
                            </div>
                            <!--fin del div de responsivi -->
                        </div> <!-- /.card-body -->

                    </div><!-- fINAL DEL card PRIMARY -->
                </div>


                <!--FINAL DE COL-M12-->
            </div><!-- FINAL ROW PADRE -->
        </div><!-- FINAL CONTAINER FLUID -->
    </section><!-- FINAL SECTION -->
</div>



  <!--INICIO DEL MODAL DE AGREGAR UN NUEVA APARIENCIA FISICA -->
  <div id="AGREGAR" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITARMODA" method="POST" class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Apariencia Física</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                          <div class="col-sm-12">
                              <div class="form-group">
                                  <label >Nombre Apariencia Física</label>
                                    <input  type="text"  class="form-control"  pattern=".{5,50}" maxlength="50" onkeypress="return soloLetras(event);" onkeyup="this.value=this.value.replace(/^\s+/,'');"  autocomplete = "off" type="text" placeholder="Ingrese la apariencia fisica" name="apariencia" id="apariencia" onblur="quitarespacios(this);" required="">
                                <div class="invalid-feedback">
                                  Campo obligatorio.
                                </div>
                          </div> 
                          <div class="col-sm-6">
                               <div class="form-group">
				                        	<label for="cbx_persona" class="control-label">Estado</label>
                                      <select class="form-control select2 select2-primary"   style="width: 100%;" name="ESTADOMANTENIMIENTO" id="ESTADOMANTENIMIENTO" required>
                                         <option selected disabled value="">-- Seleccione --</option>
                                         <option value="2">ACTIVO</option>
                                          <option value="3">INACTIVO</option>
                                       </select> 
                                 </div> 
                            </div>
                    </div><!--FINAL DEL CARD BODY --> 
                    </div>                      
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="nuevo" name="nuevo" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO TUTORIA Elaborado por Diana Rut --> 
  
 

<script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteApariencia.php','_blank');
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
<script type="text/javascript"> 
  $(document).ready( function () {
      $('#tabla_Apariencia').DataTable({
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
        "search": "Buscar Apariencia:",
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
     $(document).ready( function () {
      $("input").on("keypress", function () {
       $input=$(this);
       setTimeout(function () {
        $input.val($input.val().toUpperCase());
       },50);
      })
     })
    </script>