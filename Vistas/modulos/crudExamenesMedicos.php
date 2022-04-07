<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 $codigoObjeto=19;
 $accion='Ingreso a mantenimiento examenes';
 $descripcion='mantenimiento examenes medicos';
bitacora($codigoObjeto,$accion,$descripcion);
?>

<head>
<?php 
$fecha_actual = date("Y-m-d");
  $_SESSION["bdesde"] = date("Y-m-d",strtotime($fecha_actual."- 1 month"));
  $_SESSION["bhasta"] = date("Y-m-d",strtotime($fecha_actual."+ 1 day"));

?>

<?php 
if(isset($_POST["bdesde"]) && isset($_POST["bhasta"])){
  $_SESSION["bdesde"] = $_POST["bdesde"];
  $_SESSION["bhasta"] = $_POST["bhasta"];

}
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
        <div class="col-md-10">
           
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
                             if ($permiso_registrar= 'SI'){

                          ?>

                         
            <button  data-toggle="modal"  href="#AGREGAR_EXAMEN" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3">Agregar Examen</button>
                <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Descargar Reporte</button>
                
              </br></br>
                <div class="row">
                   <label class=" col-sm-1 control-label" style=" text-align: right; width: 150px">Desde:</label>
                    <div class="col-sm-2">
                      <input class="form-control" type="date" id="bd-desde" name="desde" value="" />
                    </div>
                    <label class=" col-sm-1 control-label" style=" text-align: right; width: 150px">Hasta:</label>
                    <div class="col-sm-2">
                      <input class="form-control" type="date" id="bd-desde" name="desde" value="" />
                    </div>
                    <button type="submit" class="btn btn-primary"  name="filtrartutor" class="col-sm-1 col-form"><span> <i class="nav-icon fa fa-search mx-1"></i></span>Generar</button>  
                    
                </div><!--fin de row -->
                </br></br>
                    
                

                </a>
                <php
                   }
                 ?>
          
          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;">Examenes Medicos</strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_Examen" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                        <th>Acción</th>
                                            <th>ID</th>
                                            <th>Examen Medico</th>
                                            <th>Descripcion</th>
                                            
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                         $query = "SELECT * FROM tbl_examenes_medicos ;";
                         $result = $conn->query($query);
                         if ($result->num_rows > 0) {
                             while ($row = $result->fetch_assoc()) {
                                 $var1 = $row['CODIGO_EXAMEN_MEDICO'];
                                 $var2 = $row['EXAMEN_MEDICO'];
                                 $var3 = $row['DESCRIPCION'];
                               
                        ?>
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                               <!-- fin del codigo para sustraer el permiso de eliminar-->
                               <?php 
                                                                if($permiso_eliminar= 'ON'){
                                                                ?>
                                                                <a href="#ELIMINAR<?php echo $var1; ?>" data-toggle="modal">
                                                                    <button id="eliminar_medic" name="eliminar_medic" type='button' class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                                                                    </button>
                                                                </a>
                                                                <?php 
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
                                      $evaluar_permiso_eliminar->execute(array($usuariomo, '1'));
                                      $row1=$evaluar_permiso_eliminar->fetchColumn();
                                      $permiso_eliminar =$row1; 
                                  }
                                  ?>  
                                  <php
                                    if ($permiso_registrar= 'SI'){

                      
                               
                                  }
                                 ?>
                                </a>
                                <a href="#EDITAREXAMEN<?php echo $var1; ?>" data-toggle="modal">
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
                                      $evaluar_permiso_actualizar->execute(array($usuariomo, '1'));
                                      $row1=$evaluar_permiso_actualizar->fetchColumn();
                                      $permiso_actualizar =$row1; 
                                    
                                  }
                                  ?>
                                 <php
                                    if ($permiso_registrar= 'SI'){

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
                                                    <td class="text-center"><?php echo $var2; ?></td>
                                                    <td class="text-center"><?php echo $var3; ?></td>
                                                    

    

                        
                                        <!--INICIO DEL MODAL DE EDITA EXAMEN -->
                          
                        <!--INICIO DEL MODAL DE EDITAR -->
                        <div id="EDITAREXAMEN<?php echo $var1; ?>" class="modal fade" role="dialog">
                         <div class="modal-dialog modal-lg">
                             <div class="modal-content">
                                 <!-- Modal content-->
                                 <form method="POST">
                                     <div class="modal-header" style="background-color: #0CCDE3">
                                         <h4 class="text-center">Editar Examen
                                         </h4>
                                         <button type="button" class="close" data-dismiss="modal">&times;</button>
                                     </div>
                                     <div class="modal-body">
                                         <!--CUERPO DEL MODAL -->
                                         <div class="row">
                                             <!-- INICIO PRIMERA ROW -->
                                             <input type="text" value="<?php echo $var1; ?>" hidden class="form-control"
                                                  name="id_examen" id="id_examen" >
                                             <div class="col-sm-6">
                                                 <div class="form-group">
                                                     <label for="txtcodigo_persona">
                                                     Examen Medico</label>
                                                     <input required type="text"  value="<?php echo $var2; ?>" class="form-control" maxlength="30" minlength="5" onKeyDown="sinespacio(this);"  onkeyup="mayus(this);"onkeyup="mayus(this);"  autocomplete="off" type="text" onkeypress="return soloLetras(event);" 
                                                     name="editar_examen" id="editar_examen">
                                                 </div>
                                             </div>
                                             <div class="col-sm-6">
                                                 <div class="form-group">
                                                     <label for="txtcodigo_persona">
                                                         Descripcion</label>
                                                     <input type="text" value="<?php echo $var3; ?>" class="form-control" maxlength="35" minlength="5"  onkeyup="mayus(this);"onkeyup="mayus(this);"  autocomplete="off" type="text" onkeypress="return soloLetras(event);"
                                                      name="editar_descripcionexamen" id="editar_descripcionexamen">
                                                 </div>
                                             </div>
                                         </div> <!-- FIN DE EL PRIMER ROW -->
                                     </div>
                                     <!--FINAL DEL CARD BODY -->
                                     <div class="modal-footer ">
                                         <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                         <button type="submit"  name="editaexa"  id="editaexa" class="btn btn-success"><span>
                                                 <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                                     </div>
                                     <!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                 </form>
                             </div>
                         </div>
                         </div> <!-- FIN DEL MODAL EDITAR --> 
                            
                            
                      <div id="ELIMINAR<?php echo $var1 ?>"  
                                                    name="eliminar_medicamento" id="eliminar_medicamento"class="modal fade" role="dialog">
                                                    <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        </div>
                                                        <form id="FORMEeliminar" method="POST">
                                                        <div class="modal-body">
                                                            <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="eliminar_medicamento" id="eliminar_medicamento">
                                                            <h4 class="text-center">¿Esta seguro de eliminar este campo? <?php echo $var2; ?>?</h4>
                                                        </div> <!--fin el card body -->
                                                            <div class="modal-footer ">

                                                            <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                                            <button type="submit"  
                                                            name="eliminar_medica" id="eliminar_medica"  class="btn btn-primary">Si,eliminar</button>      
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

    <!-- Button trigger modal -->


    <!-- Modal -->



  <!--INICIO DEL MODAL DE AGREGAR UN NUEVA ESPECIALIDAD -->
  <div id="AGREGAR_EXAMEN" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITARMODA" method="POST">
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">AGREGAR  EXAMEN</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtmodalidad">Nombre Examen</label>
                                    <input  type="text"  class="form-control"  maxlength="30" minlength="5"  onKeyDown="sinespacio(this);" onkeyup="mayus(this);" onKeyDown="sinespacio(this);"  autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese el examen" name="nombre_examen" id="nombre_examen" required="">
                                    <div class="invalid-feedback">
                                  campo obligatorio.
                                   </div>

                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtmodalidad">Descripción</label>
                                    <textarea  type="text"   class="form-control"  maxlength="35"   onkeyup="mayus(this);"  autocomplete = "off" type="text"  placeholder="Ingrese una descripción del examen" name="descripcion_examen" id="descripcion_examen" required=""></textarea>
                                    <div class="invalid-feedback">
                                  campo obligatorio.
                                   </div>
                                   <div class="col-sm-12">

                            </div>
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                   
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="nuevo_ex" name="nuevo_ex" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO TUTORIA Elaborado por Diana Rut --> 
  
   <!--Funcion de la datatable -->

  <!-- Button trigger modal -->


<!-- Modal -->
<script>
    window.onload = function() {
     var myinput = document.getElementByld('bloquear');// el id del input donde quieres aplicarlo
     myinput.onpaste = function(e){
       e.preventDefault();
     }
     myinput.oncopy = function(e){
      e.preventDefault();
     }
    }
  </script>
<script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteExamen.php','_blank');
      window.open(this.href,'_self');
    }
  </script>
  

<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
$(document).ready( function () {
    $('#tabla_especialidad').DataTable();
} );

//funcion para poner mayusculas
    function mayus(e) {
        e.value = e.value.toUpperCase();
    }

   

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