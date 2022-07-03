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
    Programa:          Mantenimiento de parametros
    Fecha:             
    Programador:       Luz María Montoya Medina
    descripcion:       Permite llevar un mantenimiento del parentesco que tienen los familiares registrados
                       con los estudiantes ,editar,eliminar nuevo
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador               Fecha                      Descripcion
  Diana Rut Garcia           30/06/2022                Cambios en el titulo
----------------------------------------------------------------------->
<?php
include_once "conexion.php";
include_once "conexion3.php";

?>
      <!--llamada de la fuction bitacora -->
     <?php 
      $codigoObjeto=43;
      $accion='Ingreso a la pantalla de mantenimiento familiares estudiantes';
      $descripcion= 'Aqui se visualiza los registros existentes de la tabla de familiares-estudiantes';
      bitacora($codigoObjeto, $accion,$descripcion);
      ?>
      
 <head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> <!--Para que funcione el selecrt2 -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script> 
</head> 

<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  
  <section class="content">
    <div class="container-fluid">
       <div class="content-header text-xl-center mb-3 "> 
          <h4> Parentesco Estudiantes con Familiares </h4>
        </div>
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
              <li class="nav-item">
                <a class="nav-link" style="color:#000000;" href="procesoRegistrarEstudiante">Agregar Estudiante</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" style="color:#000000;" href="crudFamiliaresEstudiantes">Agregar Relación Familiar-estudiante</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" style="color:#000000;" href="crudfamiliares">Ver Datos de Familiares</a>
              </li>
            </ul>
          </div>
          <div class="card-body">
          </br> 
<body oncopy="return false" onpaste="return false">
  

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
                                $evaluar_permiso->execute(array($usuariomo, '43'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->

                    <?php 
                    if ($permiso_registrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?>      

                    <button  data-toggle="modal"  href="#agregar_param" type='button' id="btnNuevo"  style="color:white;"class="btn btn-primary mb-3"><span><i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar Relación Familiar-Estudiante</button>
                  <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079" class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>

                  <?php
                    }
                    ?>


          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
            </div>
            <form  method="POST" class="needs-validation" novalidate><!-- form start -->
              <div class="card-body">
                <div class="table-responsive">
                  <table id="tabla_familiaresEstudiantes" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th class="text-center">Acción</th>
                          <th class="text-center">ID</th>
                          <th class="text-center">Familiar</th>
                          <th class="text-center">Parentesco</th>
                          <th class="text-center">Estudiante</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT  fe.CODIGO_FAMILIAR_ESTUDIANTE,
                        (select concat_ws (' ',tp2.PRIMER_NOMBRE, ' ',tp2.SEGUNDO_NOMBRE,' ',tp2.PRIMER_APELLIDO,' ',tp2.SEGUNDO_APELLIDO) from tbl_persona tp2
                         where fa.CODIGO_PERSONA = tp2.CODIGO_PERSONA) as FAMILIAR, pa.NOMBRE as PARENTESCO,
                         CONCAT(' ',p.PRIMER_NOMBRE, ' ',p.SEGUNDO_NOMBRE,' ',p.PRIMER_APELLIDO,' ',p.SEGUNDO_APELLIDO) AS ESTUDIANTE ,fe.CODIGO_ESTUDIANTE, fe.CODIGO_FAMILIAR, fe.CODIGO_PARENTESCO
                        FROM tbl_estudiante es, tbl_parentesco pa, tbl_familiares_estudiante fe, tbl_persona p, tbl_familiar fa
                        WHERE es.CODIGO_PERSONA = p.CODIGO_PERSONA
                       AND pa.CODIGO_PARENTESCO = fe.CODIGO_PARENTESCO
                       AND fa.CODIGO_FAMILIAR = fe.CODIGO_FAMILIAR
                        AND fe.CODIGO_ESTUDIANTE = es.CODIGO_ESTUDIANTE;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_FAMILIAR_ESTUDIANTE'];
                            $var2 = $row['FAMILIAR'];
                            $var3 = $row['PARENTESCO'];
                            $var4 = $row['ESTUDIANTE'];
                            $var5 = $row['CODIGO_ESTUDIANTE'];
                            $var6 = $row['CODIGO_FAMILIAR'];
                            $var7 = $row['CODIGO_PARENTESCO'];
                           

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
                                $evaluar_permiso_actualizar->execute(array($usuariomo, '43'));
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
                                $evaluar_permiso_eliminar->execute(array($usuariomo, '43'));
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

                               <a href="#ELIMINARFAMILIAREST<?php echo $var1;?>" data-toggle="modal">
                                <button id="ELIMINARPARAM" name="ELIMINARPARAM" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>


                               <?php
                                }
                               ?>


                               <?php 
                                if ($permiso_actualizar == 'SI')
                                {
                                ?>

                                <a href="#EDITARFAMILIAREST<?php echo $var1; ?>" data-toggle="modal">
                                <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                </a>

                                <?php 
                                }
                                ?>

                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          <td class="text-center"><?php echo $var1; ?></td>
                          <td class="text-center"><?php echo $var2.",ES"; ?></td>
                          <td class="text-center"><?php echo $var3; ?></td>
                          <td class="text-center"><?php echo "DE,".$var4; ?></td>
                        
                        <!--INICIO DEL MODAL DE EDITAR -->
                          <div id="EDITARFAMILIAREST<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                              <form id="FORMEDITRAPERSONAS" method="POST" class=" needs-validation">
                    <div class="modal-header" style="background-color: #0CCDE3">
                    <h4 class="text-center">Editar Parentesco</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                      <div class="row mb-2"><!-- INICIO PRIMERA ROW -->
                           <input type="text" hidden value="<?php echo $var1 ?>"name="codigo_tabla">
                                             <?php //
                                            $query = "SELECT	fam.CODIGO_FAMILIAR,CONCAT_WS(' ',DNI, PRIMER_NOMBRE,SEGUNDO_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO) AS NOMBRE
                                            FROM tbl_persona per, tbl_familiar fam
                                            WHERE per.CODIGO_PERSONA = fam.CODIGO_PERSONA
                                            AND per.CODIGO_TIPO_PERSONA = 7;";
                                            $resultadod=$conn->query($query);                
                                            ?>
                        <!-- ***********BUSCAR AL FAMILIAR*********** -->
                                   
                              
                                      <div class="col-sm-12">
                                      <label for="">Familiar: </label>
                                          <div class="col-sm-12 mt-2 mb-4">
                                            <select  style="width: 100%;"  class="form-control select2" name="editFamiliarParentesco" required="" >
                                            <option value="<?php echo $var6?>"> <?php echo $var2; ?></option>
                                                <?php 
                                                  if ($resultadod->num_rows > 0) {
                                                  while($row = $resultadod->fetch_assoc()) { 
                                                  $codigo = $row['CODIGO_FAMILIAR'];
                                                  $nombre = $row['NOMBRE'];
                                                  
                                                  ?>
                                                <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                                                <?php 
                                                } 
                                                }
                                                ?>
                                              </select>
                                                  
                                              <div class="invalid-feedback">
                                                  Agregue un nombre!
                                              </div>

                                              <div class="valid-feedback">
                                                ¡Se ve bien!
                                               </div>
                                </div>
                            </div>
                      </div> 


                            <!-- ***********BUSCAR AL ESTUDIANTE*********** -->
         <div class="row mb-5"><!-- INICIO PRIMERA ROW -->
                           
                            <?php //
                    $query = "SELECT  est.CODIGO_ESTUDIANTE,CONCAT_WS(' ',DNI, PRIMER_NOMBRE,SEGUNDO_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO) AS NOMBRE
                    FROM tbl_persona per, tbl_estudiante est
                    WHERE per.CODIGO_PERSONA = est.CODIGO_PERSONA
                    AND per.CODIGO_TIPO_PERSONA = 4;";
                    $resultadod=$conn->query($query);                
                    ?>

                 <label for="">Estudiante:</label>
                  <div class="col-sm-12">
                    <select  style="width: 100%;"  class="form-control select2" name="editarEstudianteParentesco" required="" >
                    <option value="<?php echo $var5?>"><?php echo $var4; ?></option>
                        <?php 
                          if ($resultadod->num_rows > 0) {
                          while($row = $resultadod->fetch_assoc()) { 
                          $codigo = $row['CODIGO_ESTUDIANTE'];
                          $nombre = $row['NOMBRE'];
                          
                          ?>
                        <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                        <?php 
                        } 
                        }
                        ?>
                      </select>
                          
                      <div class="invalid-feedback">
                          Agregue un nombre!
                      </div>

                      <div class="valid-feedback">
                        ¡Se ve bien!
                   </div>
                </div>


                          
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                          <?php
                            $querypare ="SELECT pa.CODIGO_PARENTESCO, pa.NOMBRE
                            FROM tbl_parentesco pa";
                            $parentesco=$conn->query($querypare)
                          ?>
                        <div class="row mb-5">
                          <div class="col-sm-12">
                            <label>Parentesco</label>
                            <select class="form-control select2" name="editarparentesco" required="">
                              <option value="<?php echo $var7?>"><?php echo $var3; ?></option>
                                       <?php 
                                        if ($parentesco->num_rows > 0) {
                                        while($rowt = $parentesco->fetch_assoc()) { ?>
                                        <option value="<?php echo $rowt['CODIGO_PARENTESCO'];?>"><?php echo $rowt['NOMBRE']; ?></option>
                                      <?php } 
                                              }?>
                            </select>
                          </div>
                        </div>
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" name="editar_familiar_parentesco" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
                                
                            </div>
                          </div><!-- FIN DEL MODAL EDITAR -->  


                          <!--MODAL ELIMINAR -->
                          <div id="ELIMINARFAMILIAREST<?php echo $var1 ?>"  name="div_eliminar" id="div_eliminar"class="modal fade" role="dialog">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel"></h5>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMEeliminar" method="POST">
                                  <div class="modal-body">
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="eliminar_familiares" id="eliminar_familiares">
                                    <h4 class="text-center">¿Esta seguro de eliminar el registro de parentesco de  <?php echo $var2; ?> ?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_FAMILIARES" id="ELIMINARPARAM"  class="btn btn-primary">Si,eliminar</button>      
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
            
          </div><!-- fINAL DEL card PRIMARY -->
        </div><!--FINAL DE COL-M12-->
      </div><!-- FINAL ROW PADRE -->
    </div><!-- FINAL CONTAINER FLUID --> 
  </section><!-- FINAL SECTION -->

  <!--INICIO DEL MODAL DE RELACIÓN DE ESTUDIANTES Y FAMILIARES -->
  <div id="agregar_param" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITRAPERSONAS" method="POST" class=" needs-validation">
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Parentesco</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                      <div class="row mb-2"><!-- INICIO PRIMERA ROW -->
                        
                                             <?php //
                                            $query = "SELECT	fam.CODIGO_FAMILIAR,CONCAT_WS(' ',DNI, PRIMER_NOMBRE,SEGUNDO_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO) AS NOMBRE
                                            FROM tbl_persona per, tbl_familiar fam
                                            WHERE per.CODIGO_PERSONA = fam.CODIGO_PERSONA
                                            AND per.CODIGO_TIPO_PERSONA = 7;";
                                            $resultadod=$conn->query($query);                
                                            ?>
                        <!-- ***********BUSCAR AL FAMILIAR*********** -->
                                   <a href="categoria">
                                      <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3 mt-2"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar persona</button>
                                      </a>
                              
                                      <div class="col-sm-12">
                                      <label for="">Familiar: </label>
                                          <div class="col-sm-12 mt-2 mb-4">
                                            <select  style="width: 100%;"  class="form-control select2" name="FamiliarParentesco" required="" >
                                            <option selected disabled value=""> Buscar familiares...</option>
                                                <?php 
                                                  if ($resultadod->num_rows > 0) {
                                                  while($row = $resultadod->fetch_assoc()) { 
                                                  $codigo = $row['CODIGO_FAMILIAR'];
                                                  $nombre = $row['NOMBRE'];
                                                  
                                                  ?>
                                                <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                                                <?php 
                                                } 
                                                }
                                                ?>
                                              </select>
                                                  
                                              <div class="invalid-feedback">
                                                  Agregue un nombre!
                                              </div>

                                              <div class="valid-feedback">
                                                ¡Se ve bien!
                                               </div>
                                </div>
                            </div>
                      </div> 


                            <!-- ***********BUSCAR AL ESTUDIANTE*********** -->
         <div class="row mb-5"><!-- INICIO PRIMERA ROW -->
                           
                            <?php //
                    $query = "SELECT  est.CODIGO_ESTUDIANTE,CONCAT_WS(' ',DNI, PRIMER_NOMBRE,SEGUNDO_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO) AS NOMBRE
                    FROM tbl_persona per, tbl_estudiante est
                    WHERE per.CODIGO_PERSONA = est.CODIGO_PERSONA
                    AND per.CODIGO_TIPO_PERSONA = 4;";
                    $resultadod=$conn->query($query);                
                    ?>

                 <label for="">Estudiante:</label>
                  <div class="col-sm-12">
                    <select  style="width: 100%;"  class="form-control select2" name="EstudianteParentesco" required="" >
                    <option selected disabled value=""> Buscar Estudiantes...</option>
                        <?php 
                          if ($resultadod->num_rows > 0) {
                          while($row = $resultadod->fetch_assoc()) { 
                          $codigo = $row['CODIGO_ESTUDIANTE'];
                          $nombre = $row['NOMBRE'];
                          
                          ?>
                        <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                        <?php 
                        } 
                        }
                        ?>
                      </select>
                          
                      <div class="invalid-feedback">
                          Agregue un nombre!
                      </div>

                      <div class="valid-feedback">
                        ¡Se ve bien!
                   </div>
                </div>


                          
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                          <?php
                            $querypare ="SELECT pa.CODIGO_PARENTESCO, pa.NOMBRE
                            FROM tbl_parentesco pa";
                            $parentesco=$conn->query($querypare)
                          ?>
                        <div class="row mb-5">
                          <div class="col-sm-12">
                            <label>Parentesco</label>
                            <select class="form-control select2" name="parentesco" required="">
                              <option selected disabled value="">Seleccione el parentesco...</option>
                                       <?php 
                                        if ($parentesco->num_rows > 0) {
                                        while($rowt = $parentesco->fetch_assoc()) { ?>
                                        <option value="<?php echo $rowt['CODIGO_PARENTESCO'];?>"><?php echo $rowt['NOMBRE']; ?></option>
                                      <?php } 
                                              }?>
                            </select>
                          </div>
                        </div>
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" name="familiar_parentesco" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO PARAMETRO -->

  <!-- Button trigger modal -->


<!-- Modal -->
                                </div><!--fin del modal contener -->
              </div><!--fin del modal dialog -->
          </div><!--fin del modal de eliminar -->          
        </div><!--fIN DEL CARD GENERAL -->
   </div><!-- CIerre del container fluid--> 
  </section>



</div><!-- /.content-wrapper -->
  <aside class="control-sidebar control-sidebar-dark"><!-- Control Sidebar -->
  </aside>
  <!-- /.control-sidebar -->
</div>
  </div><!-- /.content-wrapper -->
  <aside class="control-sidebar control-sidebar-dark"><!-- Control Sidebar -->
  </aside>
</div><!-- ./wrapper -->

</body><!-- Final del body -->





                                  
<!-- funciones del sistema -->
<script>
  function soloLetras(e){
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = " áéíóúabcdefghijklmnñopqrstuvwxyz_-";
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

//funcion para solo letras y algunos caracteres
function soloLetrascaracteres(e){
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = "_áéíóúabcdefghijklmnñopqrstuvwxyz";
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
  //otra funcion para quitar espacios 
  function quitarespacios(e) {
    var cadena =  e.value;
    cadena = cadena.trim();
    e.value = cadena;
  };
</script>


<!-- Función para poder generar el reporte de la tabla -->
<script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteFamiliarEstudiante.php','_blank');
      window.open(this.href,'_self');
    }
  </script>


<!-- función para no dejar espacios en blanco -->
<script>

$(document).ready(function() {
    $('.hb').select2();
});

    (function () { 
        'use strict'
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


<!-- Función para dejar la tabla en español -->
<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_familiaresEstudiantes').DataTable({

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
