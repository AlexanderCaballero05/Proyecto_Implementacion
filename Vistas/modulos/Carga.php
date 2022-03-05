<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include "conexionpdo.php";
 include_once 'function_bitacora.php';
 
 $codigoObjeto=20;
 $accion='Ingreso al proceso de Carga Academica';
 $descripcion= 'Usuario se autentifico ';
 bitacora($codigoObjeto, $accion,$descripcion);
?>

<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  <section class="content">
    <div class="container-fluid">

        <div class="card ">
          <div class="card-header">
            <ul class="nav nav-tabs card-header-tabs">
              <li class="nav-item">
                <a class="nav-link active" aria-current="true" href="#">Carga academica</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="carga_academica">Ver carga</a>
              </li>
              <li class="nav-item">
                <a class="nav-link disabled">Otros</a>
              </li>
            </ul>
          </div>
          <div class="card-body"><!--Cuerpo del card body principal -->
            </br>
            <form method="POST">

             <div class="row">
              <div class="col-md-3 mb-3">
              <input type="text" id="buscar" class="form-control" >
              </div>
            

             </div>

            <div class="row">
             <div class="col-md-4"> <!--INICIO IDENTIDAD-->
                <label for="identidad" class="control-label">Hora</label> 
                 <div class="form-group">
                  <input class="form-control" type="time" maxlength="13" minlength="13" name="identidad" id="identidad" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);" placeholder="Ej: 0801199716227" required="" >
                </div>
              </div>
              <div class="col-md-4"> <!--INICIO IDENTIDAD-->
                <label for="identidad" class="control-label">Fecha Inicio</label> 
                 <div class="form-group">
                  <input class="form-control" type="date" maxlength="13" minlength="13" name="identidad" id="identidad" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);" placeholder="Ej: 0801199716227" required="" >
                </div>
              </div>
              <div class="col-md-4"> <!--INICIO IDENTIDAD-->
                <label for="identidad" class="control-label">Fecha final</label> 
                 <div class="form-group">
                  <input class="form-control" type="date" maxlength="13" minlength="13" name="identidad" id="identidad" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);" placeholder="Ej: 0801199716227" required="" >
                </div>
              </div>
            </div><!--Cierre del row general -->

            <div class="row">

              <div class="col-md-4"> 
                <?php //
                 $query = "SELECT CODIGO_PERSONA, CONCAT(PRIMER_NOMBRE, ' ',SEGUNDO_NOMBRE,' ',PRIMER_APELLIDO) AS NOMBRE
                 FROM `tbl_persona` WHERE CODIGO_TIPO_PERSONA = 2;";
                 $resultadod=$conn->query($query);                
                ?>
                <label for="identidad" class="control-label">Encargado</label> 
                 <div class="form-group">
                   <select class="form-control select2 select2-primary"   style="width: 100%;" name="editar_area" id="editar_area" required>
                    <option value="<?php echo $var6?>"><?php echo $var3;?></option>
                     <?php 
                       if ($resultadod->num_rows > 0) {
                         while($row = $resultadod->fetch_assoc()) { 
                          $codigo = $row['CODIGO_PERSONA'];
                          $nombre = $row['NOMBRE'];
                      ?>
                    <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                    
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
                <label for="identidad" class="control-label">Clase/Tutoria</label> 
                 <div class="form-group">
                   <select class="form-control select2 select2-primary"   style="width: 100%;" name="editar_area" id="editar_area" required>
                    <option value="<?php echo $var6?>"><?php echo $var3;?></option>
                     <?php 
                       if ($resultadod->num_rows > 0) {
                         while($row = $resultadod->fetch_assoc()) { 
                          $codigo = $row['CODIGO_TUTORIA'];
                          $nombre = $row['NOMBRE'];
                      ?>
                    <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                    
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
                <label for="identidad" class="control-label">Modalidad</label> 
                 <div class="form-group">
                   <select class="form-control select2 select2-primary"   style="width: 100%;" name="editar_area" id="editar_area" required>
                    <option value="<?php echo $var6?>"><?php echo $var3;?></option>
                     <?php 
                       if ($resultadod->num_rows > 0) {
                         while($row = $resultadod->fetch_assoc()) { 
                          $codigo = $row['CODIGO_MODALIDAD'];
                          $nombre = $row['TIPO'];
                      ?>
                    <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                    
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
                          <input class="form-control" type="email" maxlength="50"  name="correo" id="" onKeyDown="sinespacio(this);"   required="" >
                        </div>
                </div>

            </div>
            </br></br></br>

            <button type="submit"  id="GUARDARPERSONA" name="GUARDAR" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
            <button type="submit"  id="GUARDARPERSONA" name="GUARDAR" class="btn btn-warning btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Editar</button>
            <button type="submit"  id="GUARDARPERSONA" name="GUARDAR" class="btn btn-danger btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Eliminar</button>
            
           


            </form>
          </div>
        </div>



   </div><!-- CIerre del container fluid--> 
  </section>
</div><!-- Cierre del div wraper -->


