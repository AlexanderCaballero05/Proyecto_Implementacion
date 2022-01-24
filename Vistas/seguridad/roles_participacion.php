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
                            <label>Area a pertenecer</label>
                            <input type="text" name="nombre2" class="form-control"  required>
                        </div>
                     </div>
                  </div>

                  <section class="submission">
                <!-- El button envia todos los inputs de este  formulario al archivo especificado dentro del atributo action-->
                       <input type="submit" name="registrarse">
                  </section>


                </form>
              </div>
              <!-- /.card-body -->
            </div>
</div>