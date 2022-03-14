<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include "conexionpdo.php";
 
 $codigoObjeto=20;
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
          <div class="card-body">
          <div class="row">
            <div class="col-md-12">
                <a href="procesoCargaAcademica">
            
            <form id="formMatricula" action="procesoCargaAcademica" method="POST">
            <h5>Matricula</h5>
            <hr>
            </br>
            <!--INICIO COMOBOX PARA ELEGIR AL ESTUDIANTE-->
            <div class="form-group">

            <!-- query para traer los datos del estudiante -->
            <?php
            include_once "conexion3.php";
            $query= "SELECT p.CODIGO_PERSONA,CONCAT_WS(' ',p.PRIMER_NOMBRE,p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) 
            as NOMBRE_COMPLETO FROM tbl_persona p WHERE p.CODIGO_TIPO_PERSONA = 4";
            $result= $conn->query($query);
            ?>

                <label for="txtcodigo_persona">Seleccionar Estudiante:</label>
                    <select class="form-control" name="PERUSUARIO" required="">
                      <option selected disabled value="">Estudiante</option>
                      <?php
                        if ($result->num_rows > 0){
                          while($row = $result->fetch_assoc()){
                      ?>
                      <option value="<?php echo $row['CODIGO_PERSONA'];?>"><?php echo $row['NOMBRE_COMPLETO'];?></option>
                       <?php
                       }
                         }

                        ?>
                      </select> </br>
                      
            </div> <!--FIN DEL COMOBOX -->
            <h5>Carga Académica</h5>
            <hr> </br>
            <div class="row mb-4">
              <?php // AQUI INICIA EL SELECT con su boton
              $query = "SELECT c.CODIGO_PERSONA, c.CODIGO_CARGA,t.NOMBRE as TUTORIA,  CONCAT_WS(' ',p.PRIMER_NOMBRE,p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) 
              as NOMBRE_COMPLETO  ,m.TIPO as MODALIDAD, c.SECCION, c.HORA, c.FECHA_INICIO, c.FECHA_FINAL, c.CREADO_POR_USUARIO, c.FECHA_CREACION, c.MODIFICADO_POR, c.FECHA_MODIFICACION
              FROM tbl_carga_academica c ,tbl_tutoria t, tbl_persona p, tbl_modalidad m 
              WHERE c.CODIGO_PERSONA= p.CODIGO_PERSONA AND c.CODIGO_TUTORIA= t.CODIGO_TUTORIA
              AND c.CODIGO_MODALIDAD= m.CODIGO_MODALIDA";
              $resultadod=$conn->query($query);                
              ?>
              <div class="col-sm-4">
               <select style="width: 100%;"  class="form-control select2" required=""  name="BUSCADOR" id="BUSCADOR" type="text" required >
                 <option selected disabled value="">Buscar carga academica</option>
                 <?php 
                   if ($resultadod->num_rows > 0) {
                   while($row = $resultadod->fetch_assoc()) { 
                   $codigo_buscar = $row['CODIGO_CARGA']; //se trae el codigo de carga al que pertenece la seccion
                   $nombre = $row['NOMBRE_COMPLETO']; //el nombre del encargado de la seccion (se repiten los nombre,porque llevan varias secciones)
                   $seccion = $row['SECCION']; // y el nombre de la seccion
                   $conca = $seccion .' '.$nombre; //se concatena la seccion con el encargado para que lo busque de esta forma
                   ?>
                 <option value="<?php echo $codigo_buscar?>" ><?php echo $conca;?></option><!--En el value se trae el codigo de carga y se muestra la concatenacion de seccion y encargado -->
                 <?php 
                 } 
                 }
                 ?>
               </select><!--Fin del select de busqueda por seccion y tutor -->
           </div>
           <button type="submit"  name="filtrartutor"  class="btn btn-info"><i style='font-size:18px' class='fas'>&#xf0d0;</i></button><!--botoncito de busqueda : ) -->     
         </div><!--AQUI TERMINARIA-->
         <?php
         if(isset($_POST['BUSCADOR'])) {
            $CODIGO = $_POST['BUSCADOR'];
            $query = "SELECT c.CODIGO_PERSONA, c.CODIGO_CARGA,t.NOMBRE as TUTORIA,c.CODIGO_MODALIDAD,m.TIPO, c.SECCION, c.HORA, c.FECHA_INICIO, c.FECHA_FINAL, c.CODIGO_TUTORIA,CONCAT_WS(' ',p.PRIMER_NOMBRE,p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) 
            as NOMBRE_COMPLETO, t.NOMBRE as TUTORIA,m.TIPO as MODALIDAD
            FROM tbl_carga_academica c ,tbl_tutoria t, tbl_persona p, tbl_modalidad m
            WHERE c.CODIGO_PERSONA= p.CODIGO_PERSONA AND c.CODIGO_TUTORIA= t.CODIGO_TUTORIA
            AND c.CODIGO_MODALIDAD= m.CODIGO_MODALIDA and c.CODIGO_CARGA='$CODIGO'";
            $result = $conn->query($query);

            if ($result->num_rows > 0) { 
             while($row = $result->fetch_assoc()) { //se asigna las variables que vamos utilizar
                $var1 = $row['CODIGO_CARGA'];
                $var2 = $row['CODIGO_PERSONA'];
                $var3 = $row['CODIGO_MODALIDAD'];
                $var4 = $row['CODIGO_TUTORIA'];
                $var6 = $row['SECCION'];
                $var7 = $row['HORA'];
                $var8 = $row['FECHA_INICIO'];
                $var9 = $row['FECHA_FINAL'];
                $var10 = $row['TIPO'];
                $var11 = $row['NOMBRE_COMPLETO']; //Se trae el nombre completo de la persona
                $var12 = $row['TUTORIA'];
                $var13 = $row['MODALIDAD'];
            }
          }
          ?>
           <!--FORMULARIO FLTRADO-->
         </form>
            <form method="POST">
              <div class="row">
                <!--Input que guarda el codigo de la carga,con este dato sirve para eliminar y editar,se pone en hidden para que no se visualice-->
               <input class="form-control"  hidden value="<?php echo $var1; ?>" type="text" name="IDCARGA" id="IDCARGA"   >
                <div class="col-md-4 mb-3"> <!--HORA-->
                    <label for="validationCustom03"  class="control-label">Hora de clase:</label> 
                    <div class="form-group">
                      <input class="form-control" value="<?php echo $var7; ?>" type="time" maxlength="13" minlength="13" name="hora" id="" required><!--Tiene como value la variable 7 que contiene  la hora -->
                    </div>
                </div>
                  <div class="col-md-4 mb-3"> <!--FECHA INICIO-->
                    <label  class="control-label">Fecha Inicio:</label> 
                    <div class="form-group">
                      <input class="form-control" value="<?php echo $var8; ?>" type="date" maxlength="13" minlength="13" name="fecha_inicio"><!--Tiene como value la variable 8 que contiene  la fecha de inicio -->
                    </div>
                  </div>
                  <div class="col-md-4 mb-3"> <!--FECHA FINAL-->
                    <label  class="control-label">Fecha final:</label> 
                    <div class="form-group">
                      <input class="form-control" value="<?php echo $var9; ?>" type="date" maxlength="13" minlength="13" name="fecha_final" id="fecha_final"   >
                    </div>
                  </div>
              </div><!--Cierre del primer row -->

              <div class="row">
                <div class="col-md-4 mb-3 "> 
                  <?php //
                  $query = "SELECT CODIGO_PERSONA, CONCAT_WS(' ',PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO,SEGUNDO_APELLIDO) as NOMBRE
                  FROM `tbl_persona` WHERE CODIGO_TIPO_PERSONA = 2;";
                  $resultadod=$conn->query($query);                
                  ?>
                  <div class="form-group">
                    <label  class="control-label">Encargado:</label>
                    <select class="form-control select2"  style="width: 100%;"  name="tutor" id="tutor" required>
                      <option value="<?php echo $var2; ?>"><?php echo $var11; ?></option><!--Se muestra el nombre completo y se trae al value el codigo de la persona de la tabla carga -->
                      <?php 
                        if ($resultadod->num_rows > 0) {
                          while($row = $resultadod->fetch_assoc()) { 
                          $codigo_tutor = $row['CODIGO_PERSONA'];
                          $nombre = $row['NOMBRE'];
                        ?>
                      <option value="<?php echo $codigo_tutor?>" ><?php echo $nombre;?></option><!--Trae el nombre de las personas que son tutores de la tabla de personas -->
                      <?php 
                      } 
                      }
                      ?>
                    </select> 
                  </div>
                </div><!--CIERRE DEL ENCARAGADO -->

                <div class="col-md-4"> 
                  <?php //
                  $query = "SELECT * FROM tbl_tutoria";
                  $resultadod=$conn->query($query);                
                  ?>
                  <label for="identidad" class="control-label">Tutoria:</label> 
                  <div class="form-group">
                    <select style="width: 100%" class="form-control select2"   style="width: 100%;" name="tutoria" id="editar_area" required>
                      <option value="<?php echo $var4; ?>" ><?php echo $var12; ?></option> <!--Lo mismo que el de arriba :v -->
                      <?php 
                        if ($resultadod->num_rows > 0) {
                          while($row = $resultadod->fetch_assoc()) { 
                          $codigo_tutoria = $row['CODIGO_TUTORIA'];
                          $nombre = $row['NOMBRE'];
                        ?>
                      <option value="<?php echo $codigo_tutoria?>" ><?php echo $nombre;?></option>
                      <?php 
                      } 
                      }
                      ?>
                    </select> 
                  </div>
                </div><!--CIERRE DE LA TUTORIA -->

                <div class="col-md-4"> 
                  <?php //
                  $query = "SELECT * FROM tbl_modalidad";
                  $resultadod=$conn->query($query);                
                  ?>
                  <label for="identidad" class="control-label">Modalidad:</label> 
                  <div class="form-group">
                    <select class="form-control select2 " id="modalidad" style="width: 100%;"  name="modalidad"  required>
                    <option value="<?php echo $var4; ?>" ><?php echo $var13; ?></option><!--La misama forma que lo de encargado -->
                      <?php 
                        if($resultadod->num_rows > 0) {
                          while($row = $resultadod->fetch_assoc()) { 
                          $codigo_modalidad = $row['CODIGO_MODALIDA'];
                          $nombre = $row['TIPO'];
                        ?>
                      <option value="<?php echo $codigo_modalidad?>" ><?php echo $nombre;?></option>
                      <?php 
                      } 
                      }
                      ?>
                    </select> 
                  </div>
                </div><!--CIERRE DEL  -->
              </div><!--FINAL DEL ROW -->
              <div class="row">
                <div class="col-md-4"><!--seccion-->
                    <label for="identidad" class="control-label">Sección:</label> 
                    <div class="form-group">
                      <select class="form-control select2" id="" name="seccion">
                      <option value="<?php echo $var6; ?>"><?php echo $var6; ?></option>
                       <option value="Sección A">Sección A</option><!--se esta en proceso si dejarlo asi o no :v -->
                       <option value="Sección B">Sección B </option>
                       <option value ="Sección C">Sección C </option>
                      </select>
                    </div>
                  </div>
              </div><!--Fin del row -->
              </br></br></br>

              <button type="submit"  id="" name="GUARDAR_CARGA" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
              <button type="submit"  id="" name="EDITAR_CARGA" class="btn btn-warning btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Editar</button>
              <a href="#ELIMINAR" data-toggle="modal">
              <button type="submit"  id="" name="eli" class="btn btn-danger btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Eliminar</button>
              </a> 
            </form><!-- FIN DEL FORM-->
          </div><!--FIN DEL CARD BODY -->

          <!--INICIO DEL MODAL ELIMINAR   -->
          <div id="ELIMINAR"  name="div_eliminar" id="div_eliminar"class="modal fade" role="dialog">
              <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <form id="FORMEeliminar" method="POST">
                      <div class="modal-body">
                        <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="rol_eliminar" id="rol_eliminar">
                        <h4 class="text-center">¿Esta seguro de eliminar la carga academica <?php  ?>?</h4>
                      </div> <!--fin el card body -->
                      <div class="modal-footer ">
                        <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        <button type="submit"  name="ELIMINAR_CARGA" id="ELIMINAR_CARGA"  class="btn btn-primary">Si,eliminar</button>      
                      </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                    </form> <!--FIN FORMULARIO FLTRADO-->
          <?php
          }else {  //ES un else por si no hay datos en el isset ,osea si no se buscar una carga,entonces se muestran  todos los campos vacios,para que se llenen
           ?>
           <!--FORMULARIO FLTRADO-->
         </form>
            <form method="POST">
              <div class="row">
                <div class="col-md-4 mb-3"> <!--HORA-->
                    <label for="validationCustom03"  class="control-label">Hora de clase:</label> 
                    <div class="form-group">
                      <input class="form-control"  type="time" maxlength="13" minlength="13" name="hora" id="" required >
                        <div class="invalid-feedback">
                        Llene este campo.
                        </div>
                    </div>
                  </div>
                  <div class="col-md-4 mb-3"> <!--FECHA INICIO-->
                    <label  class="control-label">Fecha Inicio:</label> 
                    <div class="form-group">
                      <input class="form-control" type="date" maxlength="13" minlength="13" name="fecha_inicio" >
                    </div>
                  </div>
                  <div class="col-md-4 mb-3"> <!--FECHA FINAL-->
                    <label  class="control-label">Fecha final:</label> 
                    <div class="form-group">
                      <input class="form-control" type="date" maxlength="13" minlength="13" name="fecha_final" id=""   >
                    </div>
                  </div>
              </div><!--Cierre del row general -->
              <div class="row">
                <div class="col-md-4 mb-3"> <!--Fila para el encargado-->
                  <?php 
                  $query = "SELECT CODIGO_PERSONA, CONCAT_WS(' ',PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO,SEGUNDO_APELLIDO) as NOMBRE
                  FROM `tbl_persona` WHERE CODIGO_TIPO_PERSONA = 2;";
                  $resultadod=$conn->query($query);                
                  ?>
                  <div class="form-group">
                    <label  class="control-label">Encargado:</label>
                    <select class="form-control select2"  style="width: 100%;"  name="tutor" id="tutor" required>
                      <option selected disabled></option>
                      <?php 
                        if ($resultadod->num_rows > 0) {
                          while($row = $resultadod->fetch_assoc()) { 
                          $codigo_tutor = $row['CODIGO_PERSONA'];
                          $nombre = $row['NOMBRE'];
                        ?>
                      <option value="<?php echo $codigo_tutor?>" ><?php echo $nombre;?></option>
                      <?php 
                      } 
                      }
                      ?>
                    </select> 
                  </div>
                </div><!--CIERRE DEL ENCARAGADO -->

                <div class="col-md-4"> 
                  <?php //
                  $query = "SELECT * FROM tbl_tutoria";
                  $resultadod=$conn->query($query);                
                  ?>
                  <label for="identidad" class="control-label">Tutoria:</label> 
                  <div class="form-group">
                    <select style="width: 100%" class="form-control select2"   style="width: 100%;" name="tutoria" id="editar_area" required>
                      <option selected disabled >--Seleccione--</option>
                      <?php 
                        if ($resultadod->num_rows > 0) {
                          while($row = $resultadod->fetch_assoc()) { 
                          $codigo_tutoria = $row['CODIGO_TUTORIA'];
                          $nombre = $row['NOMBRE'];
                        ?>
                      <option value="<?php echo $codigo_tutoria?>" ><?php echo $nombre;?></option>
                      <?php 
                      } 
                      }
                      ?>
                    </select> 
                  </div>
                </div><!--CIERRE DE LA TUTORIA -->
                <div class="col-md-4"> 
                  <?php //
                  $query = "SELECT * FROM tbl_modalidad";
                  $resultadod=$conn->query($query);                
                  ?>
                  <label for="identidad" class="control-label">Modalidad:</label> 
                  <div class="form-group">
                    <select class="form-control select2 " id="modalidad" style="width: 100%;"  name="modalidad"  required>
                      <option selected disabled>--Seleccione--</option>
                      <?php 
                        if($resultadod->num_rows > 0) {
                          while($row = $resultadod->fetch_assoc()) { 
                          $codigo_modalidad = $row['CODIGO_MODALIDA'];
                          $nombre = $row['TIPO'];
                        ?>
                      <option value="<?php echo $codigo_modalidad?>" ><?php echo $nombre;?></option>
                      <?php 
                      } 
                      }
                      ?>
                    </select> 
                  </div>
                </div><!--CIERRE DEL  -->
              </div><!--FINAL DEL ROW -->
              <div class="row">
                <div class="col-md-4"><!--CORREO ELECTRONICO-->
                    <label for="identidad" class="control-label">Sección:</label> 
                    <div class="form-group">
                      <select class="form-control select2" id="" name="seccion">
                      <option selected disabled >--Seleccione--</option>
                       <option value="Sección A">Sección A</option>
                       <option value="Sección B">Sección B </option>
                       <option value ="Sección C">Sección C </option>
                      </select>
                    </div>
                  </div>
              </div><!--Fin del row -->
              </br></br></br>
              <button type="submit"  id="" name="GUARDAR_CARGA" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
              <button type="submit"  id="" name="EDITAR_CARGA" class="btn btn-warning btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Editar</button>
              <a href="#ELIMINAR" data-toggle="modal">
              <button type="submit"  id="" name="eli" class="btn btn-danger btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Eliminar</button>
              </a> 

            </form><!-- FIN DEL FORM-->
          </div><!--FIN DEL CARD BODY -->
             <!--INICIO DEL MODAL ELIMINAR   -->
          <div id="ELIMINAR"  name="div_eliminar" id="div_eliminar"class="modal fade" role="dialog">
              <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <form id="FORMEeliminar" method="POST">
                      <div class="modal-body">
                        <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="rol_eliminar" id="rol_eliminar">
                        <h4 class="text-center">¿Esta seguro de eliminar la carga academica <?php  ?>?</h4>
                      </div> <!--fin el card body -->
                      <div class="modal-footer ">
                        <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        <button type="submit"  name="ELIMINAR_CARGA" id="ELIMINAR_CARGA"  class="btn btn-primary">Si,eliminar</button>      
                      </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                    </form> <!--FIN FORMULARIO FLTRADO-->
           <?php
              }
            ?>

</div>
</div>
</div>
                  </div><!--fin del modal contener -->
              </div><!--fin del modal dialog -->
          </div><!--fin del modal de eliminar -->          
        </div><!--fIN DEL CARD GENERAL -->
   </div><!-- CIerre del container fluid--> 
  </section>
  </div><!--fin del form group -->
<!-- Cierre del div wraper -->


 <script>
    (function () { //todavia no esta lo del validation :v
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