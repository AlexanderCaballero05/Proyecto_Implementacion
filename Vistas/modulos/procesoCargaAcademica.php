<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include_once  "conexionpdo.php";
?>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script><!--Para que funcione el selecrt2 -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
</head>

<body>
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
                 <a class="nav-link" href="crudCargaAcademica">Ver carga academica</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="true" href="#">Carga academica</a>
              </li>
            </ul>
          </div><!--FIN DEL CARD HEADER -->
          <div class="card-body"><!--Cuerpo del card body principal -->
            </br>
          <form id="formBuscarCarga" action="procesoCargaAcademica" method="POST">
             <div class="row mb-4">
              <?php // AQUI INICIA EL SELECT con su botoncito,(como se escriba :v)
              $query = "SELECT c.CODIGO_PERSONA, c.CODIGO_CARGA,t.NOMBRE as TUTORIA,  CONCAT_WS(' ',p.PRIMER_NOMBRE,p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) 
              as NOMBRE_COMPLETO  ,m.TIPO as MODALIDAD, c.SECCION, c.HORA, c.FECHA_INICIO, c.FECHA_FINAL, c.CREADO_POR_USUARIO, c.FECHA_CREACION, c.MODIFICADO_POR, c.FECHA_MODIFICACION
              FROM tbl_carga_academica c ,tbl_tutoria t, tbl_persona p, tbl_modalidad m 
              WHERE c.CODIGO_PERSONA= p.CODIGO_PERSONA AND c.CODIGO_TUTORIA= t.CODIGO_TUTORIA
              AND c.CODIGO_MODALIDAD= m.CODIGO_MODALIDA";
              $resultadod=$conn->query($query);                
              ?>
              <div class="col-sm-6">
               <select style="width: 100%;"  class="form-control select2" required=""  name="BUSCADOR" id="BUSCADOR" type="text" required >
                 <option selected disabled value="">Buscar carga academica</option>
                 <?php 
                   if ($resultadod->num_rows > 0) {
                   while($row = $resultadod->fetch_assoc()) { 
                   $codigo_buscar = $row['CODIGO_CARGA']; //se trae el codigo de carga al que pertenece la seccion
                   $nombre = $row['NOMBRE_COMPLETO']; //el nombre del encargado de la seccion (se repiten los nombre,porque llevan varias secciones)
                   $seccion = $row['SECCION'];
                   $tutoria = $row['TUTORIA'];// y el nombre de la seccion
                   $conca = $seccion .' '.$tutoria.' ' .$nombre; //se concatena la seccion con el encargado para que lo busque de esta forma
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
         </form> <!--fin del formBuscarCarga -->
            <form method="POST"  class=" needs-validation" novalidate  >
              <div class="row">
                <!--Input que guarda el codigo de la carga,con este dato sirve para eliminar y editar,se pone en hidden para que no se visualice-->
               <input class="form-control" hidden  value="<?php echo $var1; ?>" type="text" name="IDCARGA" >
                <div class="col-md-4 mb-3"> <!--HORA-->
                    <label for="validationCustom03"  class="control-label">Hora Incio:</label> 
                    <div class="form-group">
                      <input class="form-control" value="<?php echo $var7; ?>" type="time" name="hora1"  required><!--Tiene como value la variable 7 que contiene  la hora -->
                    </div>
                </div>
                <div class="col-md-4 mb-3"> <!--HORA-->
                    <label for="validationCustom03"  class="control-label">Hora Final:</label> 
                    <div class="form-group">
                      <input class="form-control" value="<?php  ?>" type="time" name="hora_final1" required><!--Tiene como value la variable 7 que contiene  la hora -->
                    </div>
                </div>
                  <div class="col-md-4 mb-3"> <!--FECHA INICIO-->
                    <label  class="control-label">Fecha Inicio:</label> 
                    <div class="form-group">
                      <input class="form-control" value="<?php echo $var8; ?>" type="date" name="fecha_inicio1"><!--Tiene como value la variable 8 que contiene  la fecha de inicio -->
                    </div>
                  </div>
              </div><!--Cierre del primer row -->

              <div class="row">
                <div class="col-md-4 mb-3"> <!--FECHA FINAL-->
                    <label  class="control-label">Fecha final:</label> 
                    <div class="form-group">
                      <input class="form-control" value="<?php echo $var9; ?>" type="date" name="fecha_final1"    >
                    </div>
                </div>
                <div class="col-md-4 mb-3 "> 
                  <?php //
                  $query = "SELECT CODIGO_PERSONA, CONCAT_WS(' ',PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO,SEGUNDO_APELLIDO) as NOMBRE
                  FROM `tbl_persona` WHERE CODIGO_TIPO_PERSONA = 2;";
                  $resultadod=$conn->query($query);                
                  ?>
                  <div class="form-group">
                    <label  class="control-label">Encargado:</label>
                    <select class="form-control select2"  style="width: 100%;"  name="tutor1" required>
                       
                      <option value="<?php echo $var2;?>"> <?php echo $var11; ?></option><!--Se muestra el nombre completo y se trae al value el codigo de la persona de la tabla carga -->
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
                  <label  class="control-label">Tutoria:</label> 
                  <div class="form-group">
                    <select style="width: 100%" class="form-control select2"   style="width: 100%;" name="tutoria1"  required>
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
              </div><!--FINAL DEL ROW -->
              <div class="row">
                <div class="col-md-4"> 
                  <?php //
                  $query = "SELECT * FROM tbl_modalidad";
                  $resultadod=$conn->query($query);                
                  ?>
                  <label for="identidad" class="control-label">Modalidad:</label> 
                  <div class="form-group">
                    <select class="form-control select2 "  style="width: 100%;"  name="modalidad1"  required>
                    <option value="<?php echo $var4; ?>" ><?php echo $var13; ?></option><!--La misama forma que lo de encargado -->
                      <?php 
                        if($resultadod->num_rows > 0) {
                          while($row = $resultadod->fetch_assoc()) { 
                          $codigo_modalidad = $row['CODIGO_MODALIDA'];
                          $nombre = $row['TIPO'];
                        ?>
                      <option  value="<?php echo $codigo_modalidad?>" ><?php echo $nombre;?></option>
                      <?php 
                      } 
                      }
                      ?>
                    </select> 
                  </div>
                </div><!--cierre de modalidad  -->
                <div class="col-md-4"><!--seccion-->
                    <label for="identidad" class="control-label">Sección:</label> 
                    <div class="form-group">
                      <select class="form-control select2" id="" name="seccion1" >
                      <option value="<?php echo $var6; ?>"><?php echo $var6; ?></option>
                       <option value="SECCIONA">SECCION A</option><!--se esta en proceso si dejarlo asi o no :v -->
                       <option value="SECCIONB">SECCION B </option>
                       <option value ="SECCIONC">SECCION C </option>
                       <option value ="SECCIOND">SECCION D </option>
                       <option value ="SECCIONE">SECCION E </option>
                       <option value ="SECCIONF">SECCION F </option>
                      </select>
                    </div>
                  </div>
              </div><!--Fin del row -->
              </br></br></br>

              <!-- <button type="submit"  id="" name="GUARDAR_CARGA" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>-->
              <button type="submit" name="EDITAR_CARGA" class="btn btn-warning btn mx-1"><span> <i class="nav-icon fas fa-edit mx-1"></i></span>Editar</button>
              <a href="#ELIMINAR" data-toggle="modal">
              <button type="submit"  id="" name="eli" class="btn btn-danger btn mx-1"><span> <i class="nav-icon fas fa-trash mx-1"></i></span>Eliminar</button>
              </a> 
            </form><!-- FIN DEL  PRIMER FORM-->
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
                        <input type="text" hidden value ="<?php echo $var1; ?>"  class="form-control" name="eliminar_carga" id="eliminar_carga">
                        <h4 class="text-center">¿Esta seguro de eliminar la carga academica <?php  ?>?</h4>
                      </div> <!--fin el card body -->
                      <div class="modal-footer ">
                        <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        <button type="submit"  name="ELIMINAR_CARGA" id="ELIMINAR_CARGA"  class="btn btn-primary">Si,eliminar</button>      
                      </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                    </form> <!--FIN FORMULARIO FLTRADO-->
                  </div><!--fin del modal contener -->
              </div><!--fin del modal dialog -->         
          </div><!--fin del modal de eliminar -->
          <?php
          }else {  //ES un else por si no hay datos en el isset ,osea si no se buscar una carga,entonces se muestran  todos los campos vacios,para que se llenen
           ?>
           <!--FORMULARIO FLTRADO-->
           </form> <!-- NO QUITAR -->
            <form  class=" needs-validation" novalidate id="FORMREGISTRAR" method="POST">
              <div class="row">
                <div class="col-md-4 mb-3"> <!--HORA-->
                    <label for="validationCustom03"  class="control-label">Hora Inicio:</label> 
                    <div class="form-group">
                      <input class="form-control"  type="time"  name="hora" id="" required >
                        <div class="invalid-feedback">
                        Llene este campo.
                        </div>
                    </div>
                  </div>
                  <div class="col-md-4 mb-3"> <!--HORA-->
                    <label for="validationCustom03"  class="control-label">Hora Final:</label> 
                    <div class="form-group">
                      <input class="form-control"  type="time"  name="hora_final"  required >
                        <div class="invalid-feedback">
                        Llene este campo.
                        </div>
                    </div>
                  </div>
                  <div class="col-md-4 mb-3"> <!--FECHA INICIO-->
                    <label  class="control-label">Fecha Inicio:</label> 
                    <div class="form-group">
                      <input class="form-control" type="date"  name="fecha_inicio" required>
                       <div class="invalid-feedback">
                         Llene este campo.
                        </div>
                    </div>
                  </div>
              </div><!--Cierre del row general -->
              <div class="row">

                 <div class="col-md-4 mb-3"> <!--FECHA FINAL-->
                    <label  class="control-label">Fecha final:</label> 
                    <div class="form-group">
                      <input class="form-control" type="date"  name="fecha_final" required>
                       <div class="invalid-feedback">
                         Llene este campo.
                        </div>
                    </div>
                  </div>
                <div class="col-md-4 mb-3"> <!--Fila para el encargado-->
                  <?php 
                  $query = "SELECT CODIGO_PERSONA, CONCAT_WS(' ',PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO,SEGUNDO_APELLIDO) as NOMBRE
                  FROM `tbl_persona` WHERE CODIGO_TIPO_PERSONA = 2;";
                  $resultadod=$conn->query($query);                
                  ?>
                  <div class="form-group">
                    <label  class="control-label">Encargado:</label>
                    <select  class="form-control select2"  style="width: 100%;"  name="tutor" id="tutor" required >
                      <option selected disabled value="">Seleccione</option>
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
                     <div class="invalid-feedback">
                         Llene este campo.
                     </div>
                  </div>
                </div><!--CIERRE DEL ENCARAGADO -->

                <div class="col-md-4"> 
                  <?php //
                  $query = "SELECT * FROM tbl_tutoria";
                  $resultadod=$conn->query($query);                
                  ?>
                  <label for="identidad" class="control-label">Tutoria:</label> 
                  <div class="form-group">
                    <select style="width: 100%"   class="form-control select2" required name="tutoria"   >
                      <option selected disabled value="" >--Seleccione--</option>
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
                     <div class="invalid-feedback">
                        Llene este campo.
                      </div>
                  </div>
                </div><!--CIERRE DE LA TUTORIA -->
              </div><!--FINAL DEL ROW -->

              <div class="row">
                <div class="col-md-4"> 
                  <?php //
                  $query = "SELECT * FROM tbl_modalidad";
                  $resultadod=$conn->query($query);                
                  ?>
                  <label for="identidad" class="control-label">Modalidad:</label> 
                  <div class="form-group">
                    <select  class="form-select select2 " id="modalidad" style="width: 100%;"  name="modalidad"  required>
                      <option selected disabled value="" >--Seleccione--</option>
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
                     <div class="invalid-feedback">
                        Llene este campo.
                      </div> 
                  </div>
                </div><!--cierre de la modalidad  -->
                <div class="col-md-4"><!--CORREO ELECTRONICO-->
                    <label for="identidad" class="control-label">Sección:</label> 
                    <div class="form-group">
                      <select class="form-control select2" id="" name="seccion" required >
                       <option  selected disabled value="">--Seleccione</option>
                       <option value="SECCIONA">SECCION A</option>
                       <option value="SECCIONB">SECCION B </option>
                       <option value ="SECCIONC">SECCION C </option>
                       <option value ="SECCIOND">SECCION D </option>
                       <option value ="SECCIONE">SECCION E </option>
                       <option value ="SECCIONF">SECCION F </option>
                      </select>
                      <div class="invalid-feedback">
                        Llene este campo.
                      </div>
                    </div>
                  </div>
              </div><!--Fin del row -->
              </br></br></br>
              <button type="submit"  id="" name="GUARDAR_CARGA" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
            </form><!-- FIN DEL FORM-->
          </div><!--FIN DEL CARD BODY -->

           <?php
              }//cierre del else :)
            ?>
                         
        </div><!--fIN DEL CARD GENERAL -->
   </div><!-- CIerre del container fluid--> 
  </section>
</div>
</div>



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

<!-- Elaborado por Diana Rut y Jose Guifarro :) -->
                    


