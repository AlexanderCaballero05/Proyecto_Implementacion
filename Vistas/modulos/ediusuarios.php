<!-- ---------------------------------------------------------------------
ELABORADO POR Diana Rut
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
Programa:          Pantalla que muestra los datos del usuario
Fecha:             01-jan-2016
Programador:       Javier
descripcion:       Mantenimiento de usuario,edita elimina 
-----------------------------------------------------------------------
Historial de Cambio
-----------------------------------------------------------------------
Programador               Fecha                      Descripcion
Diana Rut               28/05/2022            Se modifico la parte de rol para que no se edite
----------------------------------------------------------------------->
<?php
 include "conexionpdo.php";
include_once "conexion.php";
include_once "conexion3.php";
?>
<?php
  $parametro ="NUM_MAX_CARACTER";
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array($parametro));
  $row=$sentencia->fetchColumn();
  if($row>0){
    $valor = $row;
  }
?>
<?php
  $parametro1 ="NUM_MIN_CARACTER";
  $sentencia1 = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia1->execute(array($parametro1));
  $row1 = $sentencia1->fetchColumn();
  if($row1>0){
    $valor1 = $row1;
  }
?>
    <!--llamada de la fuction bitacora -->
  <?php 
  $codigoObjeto=14;
  $accion='Ingreso a la pantalla de mantenimiento usuarios';
  $descripcion= 'Ver los registros de los usuarios';
  bitacora($codigoObjeto, $accion,$descripcion);
  ?>
<head>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="../vistas/assets/plugins/jquery/jquery.min.js"></script>
</head>

<body oncopy="return false" onpaste="return false">
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  
  <section class="content">
     <section class="content-header text-xl-center mb-3">
          <h4>MANTENIMIENTO USUARIOS</h4>    
      </section>
   <div class="card"> 
        <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
                <a class="nav-link" style="color:#000000;" href="crudpersonas">Ver datos personas</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" style="color:#000000;" href="ediusuarios">Ver datos usuarios</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" style="color:#000000;" href="categoria">Agregar personas/usuarios</a>
              </li>
          </ul>
        </div>
        <div class="card-body">
    <div class="container-fluid">
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
            //llamar al procedimiento almacenado
            $evaluar_permiso = $db->prepare("CALL Sp_permiso_insertar(?,?);");
            $evaluar_permiso->execute(array($usuariomo, '25'));
            $row1=$evaluar_permiso->fetchColumn();
            $permiso_registrar =$row1;             
          }
        ?> <!-- fin del codigo para sustraer el permiso de insertar.-->
        <?php 
          if($permiso_registrar == 'SI'){
        ?> 
        <a href="categoria"> 
            <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar persona</button>
        </a>
         <button onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>
         <?php 
         }
        ?>
          <div class="card ">
            <div class="card-header text-center" ><!-- TITULO ENCABEZADO DATOS PERSONALES -->
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                <div class="table-responsive">
                  <table id="tabla_usuarios" class="table table-bordered table-striped">
                      <thead >
                        <tr>
                          <th class="text-center">Acción</th>
                          <th class="text-center">Primer Nombre</th>
                          <th class="text-center">Primer Apellido</th>
                          <th class="text-center">Nombre Usuario</th>
                          <th class="text-center">Correo Electronico</th>
                          <th class="text-center">Estado</th>
                          <th class="text-center">Rol</th>
                        </tr>
                      </thead>
                      <tbody class="text-center">
                        <?php
                        $query = "SELECT u.CODIGO_USUARIO, p.CODIGO_PERSONA, u.NOMBRE_USUARIO , p.PRIMER_NOMBRE, p.PRIMER_APELLIDO,
                        e.NOMBRE as ESTADO , r.NOMBRE as ROLL, u.CODIGO_TIPO_ROL,u.CODIGO_ESTADO, c.correo_persona, u.FECHA_CREACION ,u.FECHA_MODIFICACION , u.CREADO_POR
                        FROM tbl_usuario u
                        left join tbl_roles r on r.CODIGO_TIPO_ROL = u.CODIGO_TIPO_ROL
                        left join tbl_estado e on e.CODIGO_ESTADO = u.CODIGO_ESTADO
                        left join tbl_persona p on p.CODIGO_PERSONA = u.CODIGO_PERSONA
                        left join tbl_correo_electronico c on c.CODIGO_PERSONA = p.CODIGO_PERSONA
                        where
                        u.CODIGO_USUARIO > 1 ORDER BY CODIGO_USUARIO ASC;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var2 = $row['CODIGO_PERSONA'];
                            $var3 = $row['PRIMER_NOMBRE'];
                            $var4 = $row['PRIMER_APELLIDO'];
                            $var6 = $row['NOMBRE_USUARIO'];
                            $var15 = $row['correo_persona'];
                            $var7 = $row['ESTADO'];
                            $var8 = $row['ROLL'];
                            $var13 = $row['CODIGO_ESTADO']; 
                            $var14 = $row['CODIGO_TIPO_ROL']; 
                            $var16 = $row['CODIGO_USUARIO'];
                        ?>
                            <?php
                            include "conexionpdo.php";
                            $usuario=$_SESSION['vario'];
                            //Evaluo si existe el tipo de Rol
                            $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                            $evaluar_usuario->execute(array($usuario));
                            $row=$evaluar_usuario->fetchColumn();
                            if($row > 0){
                              $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                              //llamar al procedimiento almacenado
                              $evaluar_permiso_actualizar = $db->prepare("CALL Sp_permiso_actualizar(?,?);");
                              $evaluar_permiso_actualizar->execute(array($usuariomo, '14'));
                              $row1=$evaluar_permiso_actualizar->fetchColumn();
                              $permiso_actualizar =$row1; 
                            }
                            ?> 
                            <?php
                            include "conexionpdo.php";
                            $usuario=$_SESSION['vario'];
                            //Evaluo si existe el tipo de Rol
                            $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL  FROM tbl_usuario  WHERE NOMBRE_USUARIO = (?);");
                            $evaluar_usuario->execute(array($usuario));
                            $row=$evaluar_usuario->fetchColumn();
                            if($row > 0){
                              $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                              $evaluar_permiso_eliminar = $db->prepare("CALL Sp_permiso_eliminar(?,?);");
                              $evaluar_permiso_eliminar->execute(array($usuariomo, '14'));
                              $row1=$evaluar_permiso_eliminar->fetchColumn();
                              $permiso_eliminar =$row1; 
                            }
                            ?> 
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                              <?php
                                 if($permiso_eliminar == 'SI')
                                 {
                              ?>                     
                               <a href="#ELIMINAR<?php echo $var2;?>" data-toggle="modal">
                                <button id="ELIMINAR_USUARIO" name="ELIMINAR_USUARIO" type='button'   class="form-control btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>
                               <?php
                                  }
                                 ?>
                                <?php 
                                  if ($permiso_actualizar == 'SI'){
                                      
                                 ?>
                                <a href="#EDITARPERSONA<?php echo $var2; ?>" data-toggle="modal">
                                <button type='button' id="btnGuardar"  style="color:white;"class="form-control btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                </a>
                                <a>
                                <form method="post"  action="Reportes_Prosecar/reporteUsuarioIndividual.php" target="_blank"> 
                                <input type="hidden" name="imprimirreporteindividual" value="<?php echo $var2?>">
                                <button type='submit'  style="color:white; "class=" form-control btn btn-info mb-3"><span><i class="nav-icon fa fa-file-pdf mx-1"></i></span></button> 
                                </form>
                                </a>
                                <?php
                                  }
                                 ?>
                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          <td><?php echo $var3; ?></td>
                          <td><?php echo $var4; ?></td>
                          <td><?php echo $var6; ?></td>
                          <td><?php echo $var15; ?></td>
                          <td><?php echo $var7; ?></td>
                          <td><?php echo $var8; ?></td>
                        <!--INICIO DEL MODAL DE EDITAR -->
                          <div id="EDITARPERSONA<?php echo $var2 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-lg">
                              <div class="modal-content"><!-- Modal content-->
                                <form id="FORMEDITRAPERSONAS" method="POST">
                                  <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center"> Usuarios</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var2; ?>" hidden class="form-control" name="CODUSUARIO" id="CODUSUARIO">
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Nombre Usuario</label>
                                          <input  type="text"  value ="<?php echo $var6; ?>" class="form-control"  maxlength="20" minlength="5"  onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" readonly="" placeholder="Ingrese Nombre" name="NOMUSUARIO" id="NOMUSUARIO">
                                        </div>
                                      </div>
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Primer nombre</label>
                                          <input  type="text"  value ="<?php echo $var3; ?>"   class="form-control"  maxlength="20" minlength="5"  onKeyDown="sinespacio(this);"  onkeyup="mayus(this);" autocomplete = "off" type="text"  onkeypress="return soloLetras(event);" placeholder="Ingrese Nombre" name="nombre_modi" id="nombre_modi">
                                        </div>
                                      </div>
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Primer Apellido</label>
                                          <input  type="text"  value ="<?php echo $var4; ?>" class="form-control"  maxlength="20" minlength="5"  onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese Nombre" name="apellido_modi" id="apellido_modi">
                                        </div>
                                      </div>
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Correo</label>
                                          <input  type="text"  value ="<?php echo $var15; ?>" class="form-control"  maxlength="50" minlength="5"  onKeyDown="sinespacio(this);"  autocomplete = "off" type="text"   name="correo_modi" id="correo_modi">
                                        </div>
                                      </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                    <div class="row"> <!-- INICIO SEGUNDO ROW --> 
                                      <?php //--INICIO DEL ESTADO
                                      $query = "SELECT * FROM tbl_estado WHERE  NOMBRE <>'NUEVO'  AND NOMBRE <> 'INDEFINIDO'  AND NOMBRE <> 'PENDIENTE' and NOMBRE <>'BLOQUEADO' 
                                      AND CODIGO_ESTADO <> '7'  AND CODIGO_ESTADO <> '8' AND CODIGO_ESTADO <> '9' AND CODIGO_ESTADO <> '10' AND CODIGO_ESTADO <> '11'
                                      AND CODIGO_ESTADO <> '12'   AND CODIGO_ESTADO <> '13' ";
                                      $resultadod=$conn->query($query);                
                                      ?> 
                                      <div class="col-sm-6">
                                        <label for="cbx_persona" class="control-label">Estado</label>  
                                        <div class="form-group">
                                          <select class="form-control select2 select2-primary"   style="width: 100%;" name="ESTADOUSUARIO" id="ESTADOUSUARIO" required="">
                                            <option value="<?php echo $var13?>"><?php echo $var7;?></option>
                                            <option value="2">ACTIVO</option>
                                            <option value="3">INACTIVO</option>
                                            <option value="1">NUEVO</option>
                                            <option value="4">BLOQUEADO</option>
                                          </select> 
                                        </div>  
                                      </div> <!--FIN DE ESTADO--> 
                                      <?php
                                        $query = "SELECT CODIGO_TIPO_ROL,NOMBRE FROM tbl_roles WHERE NOMBRE <>'Indefinido' and NOMBRE <>'INDEFINIDO' ;";
                                        $resultadod=$conn->query($query);                
                                        ?> 
                                        <div class="col-sm-6">
                                          <label for="cbx_persona" class="control-label">Rol</label>  
                                          <div class="form-group">
                                            <input class="form-control"   style="width: 100%;" name="ROLUSUARIO" id="ROLUSUARIO" readonly value="<?php echo $var8;?>" >
                                          </div>  
                                        </div> <!--FIN ROL-->
                                    </div> <!-- FIN ROW --> 

                                     <div class="row">
                                      <div class="col-sm-6">
                                        <button type="button"  class="btn btn-primary mb-3" onclick="Mostar_div(<?php echo $var2?>)">Resetear Contraseña</button>
                                      </div>
                                    </div>
                                   <div  class="row">

                                      <div style="display:none;" id="Mostrar_reseteo<?php echo $var2?>" class="col-sm-6 mb-2">
                                        <label for="" class="control-label">Cambiar Contraseña</label> 
                                        <div class="input-group">
                                          <input type="password" class="form-control" id="clave_nueva<?php echo $var2?>" minlength="<?php echo $valor1;?>"  maxlength="<?php echo $valor?>"  name="clave_nueva">
                                          <div class="input-group-prepend">
                                            <button  class="form-control btn btn-info btn-sm btn-block" onclick="mostrar2(<?php echo $var2?>)" type="button"><span class="icon2 fa fa-eye-slash"></button></span>
                                          </div>
                                          <div class="invalid-feedback">
                                            Debe teber minimo <?php echo $valor1; ?> caracteres y tener mayúscula,minúscula y un caracter especial.
                                          </div>
                                        </div>
                                      </div>

                                      <div style="display:none;" id="Mostrar_reseteo1<?php echo $var2?>" class="col-sm-6 mb-2">
                                        <label  class="control-label">Confirmar Contraseña</label> 
                                        <div class="input-group">
                                          <input type="password" class="form-control" id="confirmar_clave<?php echo $var2?>" minlength="<?php echo $valor1;?>"  maxlength="<?php echo $valor?>" name="confirmar_clave"  >
                                          <div class="input-group-prepend">
                                            <button  class="form-control btn btn-info btn-sm btn-block" onclick="mostrar1(<?php echo $var2?>)" type="button"><span class="icon1 fa fa-eye-slash"></button></span>
                                          </div>
                                          <div class="invalid-feedback">
                                            Debe teber minimo <?php echo $valor1; ?> caracteres y debe ser igual a la contraseña.
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div><!--FINAL DEL CARD BODY -->                       
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="ACT_PERSONA" name="ACT_PERSONA" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>  
                                  </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                </div>
                              </form>
                            </div>
                          </div><!-- FIN DEL MODAL EDITAR -->  

                          <div id="ELIMINAR<?php echo $var2 ?>"  name="div_eliminar" id="div_eliminar"class="modal fade" role="dialog">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel"></h5>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMEeliminar" method="POST">
                                  <div class="modal-body">
                                    <input type="text" value ="<?php echo $var2; ?>" hidden class="form-control" name="usuario_eliminar" id="usuario_eliminar">
                                    <h4 class="text-center">¿Esta seguro de eliminar el usuario <?php echo $var6; ?>?</h4>
                                </div> <!--fin el card body -->
                                  <div class="modal-footer ">
                                    <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                    <button type="submit"  name="ELIMINAR" id="ELIMINAR"  class="btn btn-primary">Si,eliminar</button>      
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
    </div>
  </div>
  </section><!-- FINAL SECTION -->
</div><!-- /.content-wrapper -->
  <aside class="control-sidebar control-sidebar-dark"><!-- Control Sidebar -->
  </aside>
  <!-- /.control-sidebar -->
</div>
  </div><!-- /.content-wrapper -->
  <aside class="control-sidebar control-sidebar-dark"><!-- Control Sidebar -->
  </aside>
</div><!--  -->
</body>


<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_usuarios').DataTable({
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
        "search": "Buscar un  Usuario:",
        "zeroRecords": "El usuario no existe",
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
      window.open('Reportes_Prosecar/reporteUsuarios.php','_blank');
      window.open(this.href,'_self');
    }
  </script>

<script>
   function Descargar3() {
      window.open('Reportes_Prosecar/reportecitaMedica.php','_blank');
      window.open(this.href,'_self');
    }
  </script>

<script>//funcion que muestra/oculta el div de resetear contraseña
  function Mostar_div(e){
    console.log('object');
     console.log(e);
    let x = document.getElementById('Mostrar_reseteo'+e);
   let  y = document.getElementById('Mostrar_reseteo1'+e);
    if(x.style.display === "none" && y.style.display === "none"){
      x.style.display = "block";
      y.style.display = "block";
    }else{
      x.style.display = "none";
      y.style.display = "none";
    }
  }
</script> 

<script  type="text/javascript">
  function mostrar1(e){
    var cambio1 = document.getElementById("confirmar_clave"+e);
    if(cambio1.type == "password"){
        cambio1.type = "text";
    $('.icon1').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
    }else{
        cambio1.type = "password";
    $('.icon1').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
    }        
  }
</script>
<script type="text/javascript">
  function mostrar2(e){
    var cambio2 = document.getElementById("clave_nueva"+e);
    if(cambio2.type == "password"){
        cambio2.type = "text";
    $('.icon2').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
    }else{
        cambio2.type = "password";
    $('.icon2').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
    }        
  }
</script>


<!--Ordenado y comentado para su mejor compresion ,psdt si lo toca ,ordenelo :) -->
<!-- Elaborado  y modificado  unicamente por ♠Diana Rut con ayuda de terceros(algunas cosas :v)  -->