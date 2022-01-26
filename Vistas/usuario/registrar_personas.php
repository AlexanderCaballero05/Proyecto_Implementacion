<div class="col-md-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Registrar Personas</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <form  action="./validacion_persona.php" method="POST">
                  <div class="row">
                     <div class="col-sm-3">
                        <!-- text input -->
                        <div class="form-group">
                            <label>Primer Nombre</label>
                            <input type="text" name="nombre1" class="form-control" required>
                        </div>
                     </div>
                     <div class="col-sm-3">
                        <div class="form-group">
                            <label>Segundo Nombre</label>
                            <input type="text" name="nombre2" class="form-control"  required>
                        </div>
                     </div>
                     <div class="col-sm-3">
                        <div class="form-group">
                            <label>Primer Apellido</label>
                            <input type="text" name="apellido1" class="form-control"  required>
                        </div>
                     </div>
                     <div class="col-sm-3">
                        <!-- textarea -->
                        <div class="form-group">
                            <label>Segundo Apellido</label>
                            <input type="text" name="apellido2" class="form-control" required>
                        </div>
                      </div>
                  </div>
                  <div class="row">
                      <div class="col-sm-2">
                        <div class="form-group">
                            <label>DNI</label>
                            <input type="text" name="DNI" class="form-control" required>
                        </div>
                     </div>
                     <div class="col-sm-2">
                      <div class="form-group">
                        <label>Sexo</label>
                        <select name="sexo" class="custom-select">
                          <option value="Femenino" >Femenino</option>
                          <option value="Masculino" >Masculino</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-sm-2">
                      <div class="form-group">
                        <label>Ocupación</label>
                        <select name="codigo_rol" class="custom-select">
                          <option value="1">Estudiante</option>
                          <option value="2">Medico</option>
                          <option value="3">Tutor</option>
                          <option value="3">Administrador</option>
                          <option value="4">Psicologo</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-sm-2">
                            <div class="form-group">
                                <label>Teléfono</label>
                                <input type="num" class="form-control"  >
                            </div>
                    </div>
                    <div class="col-sm-4">
                            <div class="form-group">
                                <label>Correo</label>
                                <input type="num" class="form-control"  >
                            </div>
                    </div>
                  </div>

                 <div class="row">
                      <div class="col-sm-2">
                        <div class="form-group">
                            <label>Fecha nacimiento</label>
                            <input type="date" name="fecha_nacimiento" class="form-control"  >
                        </div>
                     </div>
                     <div class="col-sm-4">
                        <div class="form-group">
                            <label>Lugar Nacimiento</label>
                            <input type="text" name="lugar_nacimiento"class="form-control"  >
                        </div>
                     </div>
                     <div class="col-sm-6">
                            <div class="form-group">
                                <label>Dirección</label>
                                <textarea class="form-control" rows="2"></textarea>
                            </div>
                        </div>

                  </div>
                 
                  <div class="row">
                         <div class="col-sm-2">
                            <div class="form-group">
                                <label>Fecha Inscripción</label>
                                <input type="date" name="fecha_inscripcion" class="form-control"  >
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="form-group">
                                <label>Fecha Salida</label>
                                <input type="date" name="fecha_baja" class="form-control"  >
                            </div>
                        </div>
                        <div class="col-sm-2">
                        <!-- select -->
                        <div class="form-group">
                            <label>Estado</label>
                            <select name="codigo_estado" class="custom-select">
                            <option value="1">Activo</option>
                            <option value="2">Inactivo</option>
                            <option value="3">Ausente</option>
                            </select>
                        </div>
                        </div>
                        <div class="col-sm-3">
                        <div class="form-group">
                            <label>Tipo rol</label>
                            <select name="codigo_estado" class="custom-select">
                            <option value="1">Administrador</option>
                            <option value="2">usuario</option>
                           
                            </select>
                        </div>
                        </div>

                  </div>
                  <section class="submission">
      <!-- El button envia todos los inputs de este  formulario al archivo especificado dentro del atributo action-->
                   
                      <input class="btn btn-primary btn-lg" type="submit" name="registrarse">
                      
                  </section>
                </form>
              </div>
              <!-- /.card-body -->
            </div>
</div>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>



