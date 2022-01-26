<div class="col-md-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Registrar Tipos de Usuarios</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <form  action="./validacion_persona.php" method="POST">
                  <div class="row">
                     <div class="col-sm-4">
                        <!-- text input -->
                        <div class="form-group">
                            <label>Tipo de usuario </label>
                            <input type="text" name="nombre1" class="form-control" required>
                        </div>
                     </div>
                     <div class="col-sm-4">
                        <div class="form-group">
                            <label>Área a pertenecer</label>
                            <input type="text" name="nombre2" class="form-control"  required>
                        </div>
                     </div>
                  </div>

                  <section class="submission">
                <!-- El button envia todos los inputs de este  formulario al archivo especificado dentro del atributo action-->
                  <input class="btn btn-primary btn-lg" type="submit" name="registrarse" style="float: right;">
                  </section>
                  <!--la tabla comienza aqui -->
                  <setion class="content">
                  <div class="container-fluid">
                  <div claas="row">
                  <div class ="col-12">
                  <div class="card">
                  <div class ="card-header">
                   <h3 class="card-title">Tipos de usuarios Existente</h3>
                  </div>
                   <div class= "card-body">
                   <table id="example2" class="table table-bordered table-hover">
                     <thead>
                      <tr>
                      <th>Tipo de Usuario </th>
                      <th> Área que pertenece </th>
                      </tr>
                     </thead>
                     <tbody>
                     <tr>
                     <td>Administrador</td>
                     <td>Administración</td>
                     </tr>
                     <tr>
                     <td>Secretaria</td>
                     <td>Administración</td>
                     </tr>                  
                     </tbody>
                     
                   </table>
                   </div>
                  </div>
                  </div>
                  </div>
                 </div> 
                  <!--la tabla termina aqui -->            
                 </setion>
 
                </form>
              </div>
              <!-- /.card-body -->
            </div>
</div>