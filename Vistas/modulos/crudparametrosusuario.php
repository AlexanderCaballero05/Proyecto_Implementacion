
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
    Programa:          Mantenimiento de los parametros de los usuarios
    Fecha:             
    Programador:      
    descripcion:       Permite llevar un mantenimiento de los parametros de los usuarios es su relación  ,editar,eliminar nuevo
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador               Fecha                      Descripcion
  ANY HERNANDEZ         		11-06-2022                 revision de ortagrafia 
----------------------------------------------------------------------->


<?php
include_once "conexion.php";
include_once "conexion3.php";
?>
      <!--llamada de la fuction bitacora -->
     <?php 
      $codigoObjeto=1;
      $accion='Parametros Usuarios';
      $descripcion= 'Ver los parametros de los usuarios';
      bitacora($codigoObjeto, $accion,$descripcion);
      ?>
      
<head>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="../vistas/assets/plugins/jquery/jquery.min.js"></script>
</head>


<body oncopy="return false" onpaste="return false" >
<div class="content-wrapper">
  <div class="content-header">
    <div class="text-center">
      <h2>Parametro Usuarios</h2>
    </div>
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  
  <section class="content">
    <div class="container-fluid">
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
                                $evaluar_permiso->execute(array($usuariomo, '9'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->

                    <?php 
                    if ($permiso_registrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?>     
        <a href="categoria"> 
        <button  data-toggle="modal"  href="#agregar_param" type='button' id="btnNuevo"  style="color:white;"class="btn btn-primary mb-3"><span><i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar Parámetro</button>
        </a>  
        <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Descargar Reporte</button>
                  <?php
                    }
                    ?>
          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;"></strong></h1>
            </div>
            <form  method="POST" class="needs-validation" novalidate><!-- form start -->
              <div class="card-body">
                <div class="table-responsive">
                  <table id="example1" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th class="text-center">Editar</th>
                          <th class="text-center">Nombre Usuario</th>
                          <th class="text-center">Nombre Parámetro</th>
                          <th class="text-center">Contador</th>
                         
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT a.CODIGO_PARAM_USUARIO, a.CODIGO_USUARIO, u.NOMBRE_USUARIO,a.CODIGO_PARAMETRO, p.PARAMETRO,a.PAR_VALOR
                        FROM tbl_parametros_usuarios a ,tbl_parametros p, tbl_usuario u WHERE a.CODIGO_USUARIO = u.CODIGO_USUARIO AND a.CODIGO_PARAMETRO = p.CODIGO_PARAMETRO
                        ORDER BY a.CODIGO_PARAM_USUARIO;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                           
                            $var1 = $row['NOMBRE_USUARIO'];
                            $var2 = $row['PARAMETRO'];
                            $var3 = $row['PAR_VALOR'];
                            $var4 = $row['CODIGO_USUARIO'];
                            $var5 = $row['CODIGO_PARAMETRO'];
                            $var6 = $row['CODIGO_PARAM_USUARIO']
                           
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
                                $evaluar_permiso_actualizar->execute(array($usuariomo, '9'));
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
                                $evaluar_permiso_eliminar->execute(array($usuariomo, '9'));
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
                               <a href="#ELIMINAR<?php echo $var6;?>" data-toggle="modal">
                                <button id="ELIMINAR_PARAMETROUSUARIO" name="ELIMINAR_PARAMETROUSUARIO" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>

                                  <?php
                                  }
                                  ?>
 
                                
                                <?php 
                                if ($permiso_actualizar == 'SI')
                                {
                                ?>
                                <a href="#EDITARROL<?php echo $var6; ?>" data-toggle="modal">
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
                          
                     
                          
                          <!--INICIO DEL MODAL DE EDITAR PAR VALOR -->
                          <div id="EDITARROL<?php echo $var6 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                                <form id="FORMEDITRAPERSONAS" method="POST" class="needs-validation" novalidate>
                                  <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar Parametro Usuario</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                    <input  type="text"  value ="<?php echo $var4; ?>" hidden class="form-control"  maxlength="2" minlength="1"    autocomplete = "off" type="text" onkeypress="return solonumero(event)" name="codigo_usuario" id="editar_parvalor">
                                          <input  type="text"  value ="<?php echo $var5; ?>" hidden class="form-control"  maxlength="2" minlength="1"    autocomplete = "off" type="text" onkeypress="return solonumero(event)" name="codigo_parametro" id="editar_parvalor">

                                      <input type="text" value ="<?php echo $var6; ?>" hidden class="form-control" name="id_paramusu" id="id_paramusu">
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txt_parvalor">Contador</label>
                                          <input  type="text"  value ="<?php echo $var3; ?>" 
                                          class="form-control"  maxlength="2" minlength="1"   
                                           autocomplete = "off" type="text" onkeypress="return solonumero(event)" 
                                           name="editar_parvalor" id="editar_parvalor" required =""  >
                                           <div class="invalid-feedback">
                                          Campo Obligatorio.
                                          </div>
                                        </div>
                                      </div>
                                      <div class="col-sm-12">
                                       
                                      </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY -->                       
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="editar_paramusu" name="editar_paramusu" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                                  </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                </div>
                              </form>
                            </div>
                          </div><!-- FIN DEL MODAL EDITAR -->  


                          <div id="ELIMINAR<?php echo $var6 ?>"  name="paramusuario_eli" id="paramusuario_eli"class="modal fade" role="dialog">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel"></h5>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMEeliminar" method="POST">
                                  <div class="modal-body">
                                    <input type="text" value ="<?php echo $var6; ?>" hidden class="form-control" name="paramusuario_eli" id="paramusuario_eli">
                                    <h4 class="text-center">¿Esta seguro de eliminar este parametro? a <?php echo $var1; ?></h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">

                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_PARAMETROUSUARIO" id="ELIMINAR_PARAMETROUSUARIO"  class="btn btn-primary">Si,eliminar</button>      
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
                      </body>

  <!-- Button trigger modal -->


<!-- Modal -->



</div><!-- /.content-wrapper -->
  <aside class="control-sidebar control-sidebar-dark"><!-- Control Sidebar -->
  </aside>
  <!-- /.control-sidebar -->
</div>
  </div><!-- /.content-wrapper -->
  <aside class="control-sidebar control-sidebar-dark"><!-- Control Sidebar -->
  </aside>
</div><!-- ./wrapper -->


<script type="text/javascript"> 
$( function() {
    $("#ESTADOUSUARIO").change( function() {
        if ($(this).val() === "4") {
          document.getElementById('CONUSUARIO').disable = true;
        
        } else{
          document.getElementById('CONUSUARIO').disable = false;
         
        }
    });
 }); 

</script>



<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $( function() {
    $("#cbx_persona").change( function() {
        if ($(this).val() === "2") {
           document.getElementById("c").style.display="block";
        } else {
            document.getElementById("c").style.display="none";
        }
    });
  });
</script>

                                  
<!-- funciones del sistema -->
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

<script type="text/javascript"> function solonumero(e) {
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla==8) return true;
        else if (tecla==0||tecla==9)  return true;
       // patron =/[0-9\s]/;// -> solo letras
        patron =/[0-9\s]/;// -> solo numeros
        te = String.fromCharCode(tecla);
        return patron.test(te);
    }
	</script>

<script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteParametroUsuario.php','_blank');
      window.open(this.href,'_self');
    } 
  </script>