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
    Programa:          Mantenimiento de familiares
    Fecha:             
    Programador:       Arnold Caballero
    descripcion:       Permite llevar un mantenimiento de los datos de los familiares registrados
                       en el sistema,editar,eliminar nuevo
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador               Fecha                      Descripcion
 Diana Rut Garcia           30/06/2022                Cambios en el titulo
----------------------------------------------------------------------->





<body oncopy="return false" onpaste="return false">
 
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
    <section class="content-header text-xl-center mb-3 ">
          <h1>
              <h4>Mantenimiento Familiares</h4>
          </h1>     
      </section>
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
          <li class="nav-item">
              <a class=" nav-link" style="color:#000000;" href="crudEstudiante">Ver datos Escolares</a>
            </li>
              <li class="nav-item ">
                <a class="nav-link "  style="color:#000000;"href="crudContenidoEconoEstudiante">Ver Datos Socioeconómicos</a>
              </li>
              <li class="nav-item ">
                <a class="nav-link active"  style="color:#000000;"href="crudfamiliares">Ver familiares</a>
              </li>
            </ul>
            
          </div><!--FIN DEL CARD HEADER -->
          <div class="card-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                  


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
                                $evaluar_permiso->execute(array($usuariomo, '26'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->

                 
                     <?php 
                      if($permiso_registrar == 'SI'){
                     ?>
               
              
                <a href="categoria">

                <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3" ><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar</button>
                </a>
               
                 <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte</button>
                <button hidden  onclick="Descargar1()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-danger mb-3" > <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>PDF Familiar</button>
              
                </a>

                <?php 
                      }
                     ?>
          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #FEFEFE "><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               
            </div>
            <form  method="POST" class="needs-validation" novalidate><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_familiar" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                        <th class="text-center">Acción</th>
                                            <th class="text-center">Código</th>
                                            <th class="text-center">Primer Nombre</th>
                                            <th class="text-center">Segundo Nombre</th>
                                            <th class="text-center">Primer Apellido</th>
                                            <th class="text-center">Segundo Apellido</th>
                                            <th class="text-center">Teléfono</th>
                                            <th class="text-center">Correo Electrónico</th>
                                            <th class="text-center">Dirección</th>
                                            <th class="text-center">Estado Civil</th>
                                            <th class="text-center">Nivel Educativo</th>
                                            <th class="text-center">Ingresos </th>
                                            <th class="text-center">Nombre Iglesia</th>
                        </tr>
                      </thead>
                      <tbody>
                      <?php
                                        $query = "SELECT tp.CODIGO_PERSONA, tf.CODIGO_FAMILIAR, tp.PRIMER_NOMBRE,tp.SEGUNDO_NOMBRE, tp.PRIMER_APELLIDO, tp.SEGUNDO_APELLIDO, tel.NUMERO_TELEFONO , cor.CORREO_PERSONA, tp.DIRECCION, tf.ESTADO_CIVIL, tf.NIVEL_EDUCATIVO, tF.INGRESOS_DE_FAMILIAR,tf.NOMBRE_IGLESIA
                                        from tbl_persona tp, tbl_familiar tf , tbl_telefono tel ,tbl_correo_electronico cor
                                        where tp.CODIGO_PERSONA = tf.CODIGO_PERSONA
                                        AND tp.CODIGO_PERSONA = tel.CODIGO_PERSONA
                                        AND tp.CODIGO_PERSONA = cor.CODIGO_PERSONA
                                        AND tp.CODIGO_TIPO_PERSONA = 7;";
                                        $result = $conn->query($query);
                                        if ($result->num_rows > 0) {
                                            while ($row = $result->fetch_assoc()) {
                                                $var1 = $row['CODIGO_PERSONA'];
                                                
                                                $var8 = $row['PRIMER_NOMBRE'];
                                                $var9 = $row['SEGUNDO_NOMBRE'];
                                                $var10 = $row['PRIMER_APELLIDO'];
                                                $var11 = $row['SEGUNDO_APELLIDO'];
                                                $var12 = $row['NUMERO_TELEFONO'];
                                                $var13 = $row['CORREO_PERSONA'];
                                                $var14 = $row['DIRECCION'];
                                                $var3 = $row['ESTADO_CIVIL'];
                                                $var4 = $row['NIVEL_EDUCATIVO'];
                                                $var5 = $row['INGRESOS_DE_FAMILIAR'];
                                                $var6 = $row['NOMBRE_IGLESIA'];
                                                $var7 = $row['CODIGO_FAMILIAR'];
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
                                      $evaluar_permiso_eliminar->execute(array($usuariomo, '26'));
                                      $row1=$evaluar_permiso_eliminar->fetchColumn();
                                      $permiso_eliminar =$row1; 
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

                                   //llamar al procedimiento almacenado
                                  $evaluar_permiso_actualizar = $db->prepare("CALL Sp_permiso_actualizar(?,?);");
                                  $evaluar_permiso_actualizar->execute(array($usuariomo, '26'));
                                  $row1=$evaluar_permiso_actualizar->fetchColumn();
                                  $permiso_actualizar =$row1; 
                                    
                                  }
                                ?>
                               


                                <?php
                                if ($permiso_eliminar == 'SI'){

                                ?>
                                <button id="ELIMINAR_FAMILIAR" name="ELIMINAR_FAMILIAR" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>

                              

                               </a>

                               <?php
                                  }
                                ?>


                                <?php
                                    if ($permiso_actualizar == 'SI'){

                                ?>
                                <a href="#EDITARFAMILIAR<?php echo $var1; ?>" data-toggle="modal">
                                
                                <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                
                              </a>

                                <?php
                                  }
                                 ?> 
                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          
                          <td class="text-center"><?php echo $var7; ?></td>
                                                    <td class="text-center"><?php echo $var7; ?></td>
                                                    <td class="text-center"><?php echo $var8; ?></td>
                                                    <td class="text-center"><?php echo $var9; ?></td>
                                                    <td class="text-center"><?php echo $var10; ?></td>
                                                    <td class="text-center"><?php echo $var11; ?></td>
                                                    <td class="text-center"><?php echo $var12; ?></td>
                                                    <td class="text-center"><?php echo $var13; ?></td>
                                                    <td class="text-center"><?php echo $var14; ?></td>
                                                    <td class="text-center"><?php echo $var3; ?></td>
                                                    <td class="text-center"><?php echo $var4; ?></td>
                                                    <td class="text-center"><?php echo $var5; ?></td>
                                                    <td class="text-center"><?php echo $var6; ?></td>

                         <!-- editar cita editar -->
                                                    
        <div  class="modal fade"id="EDITARFAMILIAR<?php echo $var1 ?>" role="dialog"  >
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <!-- Modal content  editar-->
                    <form method="POST" class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Editar Familiar
                        </h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-------------CUERPO DEL MODAL  editar--------------> 
                    <div class="modal-body"> 
                    <!-------- INICIO PRIMERA ROW editar ----------->         
                    <div class="row"> 
                        <input type="text" value="<?php echo $var1; ?>" hidden class="form-control" name="EDITARFAMILIAR" id="EDITARFAMILIAR" >
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtcodigo_persona">Estado Civil</label>
                                <input  type="text"  value ="<?php echo $var3; ?>" class="form-control" maxlength="20" minlength="5" autocomplete = "off" type="text" onkeyup="mayus(this);" 
                                onkeypress="return soloLetras(event);" onkeyup="mayus(this);"  name="editar_estado" id="edifa" required="">
                                <div class="invalid-feedback">
                                       campo obligatorio.
                                </div>
                              </div>
                        </div>
                    
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtcodigo_persona">Nivel Educativo</label>
                                <input  type="text"  value ="<?php echo $var4; ?>" class="form-control" minlength="5" maxlength="15"  autocomplete = "off" type="text"  onkeyup="mayus(this);" onkeypress="return soloLetras(event);" 
                                onKeyDown="sinespacio(this);"   onkeyup="mayus(this);" name="editar_nivele" id="edini" required="">
                                <div class="invalid-feedback">
                                       campo obligatorio.
                                </div>
                              </div>
                        </div>
                      </div>  
                    <div class="row"> 
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtcodigo_persona">Ingresos</label>
                                <input  type="text"  value ="<?php echo $var5; ?>" class="form-control" autocomplete = "off" type="text"  onkeypress="return solonumeros(event);" 
                                 name="editar_ingresos" id="ediingre" minlength="2" maxlength="6" onKeyDown="sinespacio(this);" required="">
                                <div class="invalid-feedback">
                                       campo obligatorio.
                                </div>
                              </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtcodigo_persona">Iglesia</label>
                                <input  type="text"  value ="<?php echo $var6; ?>" minlength="2" maxlength="50"class="form-control" autocomplete = "off" type="text"    
                                autocomplete = "off" type="text" onkeyup="mayus(this);" 
                                onkeypress="return soloLetras(event);"  onkeyup="mayus(this);"   name="editar_iglesia" id="ediglesia" required="">
                                <div class="invalid-feedback">
                                       campo obligatorio.
                                </div>
                              </div>
                        </div>
                    </div> 
            <!-- ------------------ FIN PRIMERA ROW editar---------------------- -->
                <div class="modal-footer ">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                    <button type="submit" name="edit_familiar"  id = "edit_familiar" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                </div>
                        </div><!--FIN CUERPO DEL MODAL editar --> 
                    </form>
                </div>
            </div>
        </div><!-- FIN DEL MODAL editar -->
                           <!-- inicio modal eliminar  -->   
        <div id="ELIMINAR<?php echo $var1 ?>"   name="ELIMINARFAMILIAR" id="ELIMINARFAMILIAR" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                        <form id="FORMEeliminar" method="POST">
                            <div class="modal-body">
                                <input type="text" value="<?php echo $var1; ?>" hidden class="form-control" name="eliminarfami" id="eliminarfami">
                                <h4 class="text-center">¿Esta seguro de eliminar los datos de <?php echo $var2 ?>?</h4>
                            </div> <!--fin el card body eliminar -->
                            <div class="modal-footer ">
                                <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                <button type="submit" name="eliminar_fami" id="eliminar_fami"  class="btn btn-primary">Si,eliminar</button>      
                            </div><!--FIN DEL DIV DE BOTONES DE GUARDAR eliminar -->
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

 

  </section>
<!-- Modal -->
</body>            
<script>
    function Descargar() {
      window.open('Reportes_Prosecar/reportefamiliar.php','_blank');;
      window.open(this.href,'_self');
    }
  </script>


<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_familiar').DataTable({

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
        "search": "Buscar Familiar:",
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
    
    var edifa=document.getElementById("edifa"); //el nombre del id del campo
    edifa.addEventListener('keydown', function(keyboardEvent){
  
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
});
var edini=document.getElementById("edini"); //el nombre del id del campo
    edini.addEventListener('keydown', function(keyboardEvent) {
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
});
var ediingre=document.getElementById("ediingre"); //el nombre del id del campo
    ediingre.addEventListener('keydown', function(keyboardEvent) {
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
});
var ediglesia=document.getElementById("ediglesia"); //el nombre del id del campo
    ediglesia.addEventListener('keydown', function(keyboardEvent) {
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
});
  </script>
 <script>
function soloLetras(e){
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
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
 //funcion para solu numeros ingresar en el campo
 function soloNumeros_tel(e){
   var teclaPulsada=window.event ? window.event.keyCode:e.which;
    // capturamos el contenido del input
    var valor=document.getElementById("tele").value;
    if(valor.length<9){
      if(teclaPulsada==9){
        return true;
      }
    // devolvemos true o false dependiendo de si es numerico o no
    return /\d/.test(String.fromCharCode(teclaPulsada));
    }else{
    return false;
    }
  }
   //funcion para quitar espacios
  function quitarespacios(e) {
    var cadena =  e.value;
    cadena = cadena.trim();
    e.value = cadena;
  };
  //funcion para poner mayusculas
  function mayus(e) {
    e.value = e.value.toUpperCase();
  }
  function mayus(e) {
    e.value = e.value.toUpperCase();
  }
   //funcion sin espacios 
  function sinespacio(e) {
    var cadena =  e.value;
    var limpia = "";
    var parts = cadena.split(" ");
    var length = parts.length;
    for (var i = 0; i < length; i++) {
     nuevacadena = parts[i];
     subcadena = nuevacadena.trim();
     if(subcadena != "") {
       limpia += subcadena + " ";
      }
    }
   limpia = limpia.trim();
   e.value = limpia;
  };
  //otra funcion para quitar espacios :V
  function quitarespacios(e) {
    var cadena =  e.value;
    cadena = cadena.trim();
    e.value = cadena;
  };
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

</script>