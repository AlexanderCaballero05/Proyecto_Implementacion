   

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4 menu_lateral">

    <!-- Brand Logo -->
    <a href="index.php" class="brand-link">
        <img src="vistas/assets/dist/img/logoparroquia.jpg" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">PROSECAR</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">

        <!-- Sidebar user (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="vistas/assets/dist/img/user1-128x128.jpg" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="perfilUsuario" class="d-block"><?php $usuario =$_SESSION['vario']; echo $usuario; ?></a>
            </div>
        </div>
      

     <!-- Sidebar Menu -->
     <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="index" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Menu general
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
          

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
                                $evaluar_permiso_mostrar = $db->prepare("CALL Sp_permiso_mostrar(?,?);");
                                $evaluar_permiso_mostrar->execute(array($usuariomo, '25'));
                                $row1=$evaluar_permiso_mostrar->fetchColumn();
                                $permiso_mostrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de mostrar del modulo 25.-->

                    <?php 
                    if ($permiso_mostrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?>        
          
            <!-- Menu de usuarios del sistema -->
            <li class="nav-item">
              <a href="" class="nav-link bg-gradient-navy">
                <i class="nav-icon fas fa-users"></i>
                <p>
                  Gestion Usuarios
                  <i class="fas fa-angle-left right"></i>
                  <span class="badge badge-info right"></span>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="categoria" class="nav-link" >
                   <i class="far fa-user nav-icon"></i>
                    <p>Registrar Usuarios</p>
                  </a>
                </li>

                <li class="nav-item">
                  <a href="ediusuarios" class="nav-link" > <!--modifique acuerdate -->
                    <i class="far fa-edit nav-icon"></i>
                    <p>Mantenimiento usuarios</p>
                  </a>
                </li>

                <li class="nav-item">
                  <a href="crudpersonas" class="nav-link" > <!--modifique acuerdate -->
                    <i class="far fa-edit nav-icon"></i>
                    <p>Mantenimiento personas</p>
                  </a>
                </li>

                <li class="nav-item">
                  <a href="crudespecialidad" class="nav-link" > <!--modifique acuerdate -->
                    <i class="far fa-edit nav-icon"></i>
                    <p>Especialidades</p>
                  </a>
                </li>
              
                <li class="nav-item">
                  <a href="crudPreguntasUsuarios" class="nav-link">
                    <i class="nav-icon fas fa-table"></i>
                    <p>Preguntas Usuarios</p>
                  </a>
                </li>
              </ul>
            </li>
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

                                //llamar al procedimiento almacenado
                                $evaluar_permiso_mostrar = $db->prepare("CALL Sp_permiso_mostrar(?,?);");
                                $evaluar_permiso_mostrar->execute(array($usuariomo, '26'));
                                $row1=$evaluar_permiso_mostrar->fetchColumn();
                                $permiso_mostrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de mostrar del modulo 26.-->

                    <?php 
                    if ($permiso_mostrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?>        
            <!-- Menu de graficas del sistema -->
            <li class="nav-item">
              <a href="" class="nav-link bg-gradient-navy">
                <i class="nav-icon fas fa-graduation-cap"></i>
                <p>
                  Gestion de Estudiantes
                  <i class="right fas fa-angle-left"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="crudEstudiante"class="nav-link">
                    <i class="far fa-edit nav-icon"></i>
                    <p>Agregar estudiantes</p>
                  </a>
                </li>
                 <!--<li class="nav-item">
                  <a href=" " class="nav-link">
                    <i class="nav-icon fas fa-table"></i>
                    <p>Tipo de contenido</p>
                  </a>
                </li> -->
                <!--
                <li class="nav-item">
                  <a href="crudtiposocioeconomico" class="nav-link" > modifique acuerdate 
                    <i class="nav-icon fas fa-table"></i>
                    <p>Tipo socieconomico</p>
                  </a>
                </li>-->
                   
              </ul>
            </li>
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

                                //llamar al procedimiento almacenado
                                $evaluar_permiso_mostrar = $db->prepare("CALL Sp_permiso_mostrar(?,?);");
                                $evaluar_permiso_mostrar->execute(array($usuariomo, '32'));
                                $row1=$evaluar_permiso_mostrar->fetchColumn();
                                $permiso_mostrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de mostrar del modulo 26.-->

                    <?php 
                    if ($permiso_mostrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?>        

            <!-- Menu de graficas del sistema -->
            <li class="nav-item">
                          <a href="" class="nav-link bg-gradient-navy">
                            <i class="nav-icon fas  fa-hospital-user"></i>
                            <p>
                              Gestion de Citas 
                              <i class="right fas fa-angle-left"></i>
                            </p>
                          </a>
                          <ul class="nav nav-treeview">
                            <li class="nav-item">
                              <a href="crudinscripcioncita"class="nav-link">
                                <i class="far fa-edit nav-icon"></i>
                                <p>Agregar Cita </p>
                              </a>
                            </li>
                           
                          </ul>
                        </li>
                    
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

                                //llamar al procedimiento almacenado
                                $evaluar_permiso_mostrar = $db->prepare("CALL Sp_permiso_mostrar(?,?);");
                                $evaluar_permiso_mostrar->execute(array($usuariomo, '26'));
                                $row1=$evaluar_permiso_mostrar->fetchColumn();
                                $permiso_mostrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de mostrar del modulo 26.-->

                    <?php 
                    if ($permiso_mostrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?>        
            <!-- Menu de graficas del sistema -->
            <li class="nav-item">
              <a href="" class="nav-link bg-gradient-navy">
                <i class="nav-icon fas  fa-copy"></i>
                <p>
                  Gestion de Familiares
                  <i class="right fas fa-angle-left"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="crudfamiliares"class="nav-link">
                    <i class="far fa-edit nav-icon"></i>
                    <p>Agregar familiares</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href=" " class="nav-link">
                    <i class="nav-icon fas fa-table"></i>
                    <p>Familiares estudiantes</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="crudtiposocioeconomico" class="nav-link" > <!--modifique acuerdate -->
                    <i class="nav-icon fas fa-table"></i>
                    <p>Tipo de parentesco</p>
                  </a>
                </li>
              </ul>
            </li>
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

                                //llamar al procedimiento almacenado
                                $evaluar_permiso_mostrar = $db->prepare("CALL Sp_permiso_mostrar(?,?);");
                                $evaluar_permiso_mostrar->execute(array($usuariomo, '28'));
                                $row1=$evaluar_permiso_mostrar->fetchColumn();
                                $permiso_mostrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de mostrar del modulo 26.-->

                    <?php 
                    if ($permiso_mostrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?>        
           <!-- Menu de Carga Academica -->
           <li class="nav-item">
            <a href="#" class="nav-link bg-success">
            <i class="nav-icon fas fa-edit"></i>
              <p>
                Carga Academica
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>

            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="crudTutorias" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Registrar tutorias</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="crudCargaAcademica" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Carga academica</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="crudmodalidad" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Registrar modalidad</p>
                </a>
              </li>
            </ul>
          </li> <!--fin Menu de Carga Academica -->
          

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

                                //llamar al procedimiento almacenado
                                $evaluar_permiso_mostrar = $db->prepare("CALL Sp_permiso_mostrar(?,?);");
                                $evaluar_permiso_mostrar->execute(array($usuariomo, '29'));
                                $row1=$evaluar_permiso_mostrar->fetchColumn();
                                $permiso_mostrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de mostrar del modulo 26.-->

                    <?php 
                    if ($permiso_mostrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?>   
          <!-- Menu de Matricula -->
          <li class="nav-item">
          <a href="#" class="nav-link bg-success">
            <i class=" nav-icon fas fa-school"></i>
            <p>
              Matricula
              <i class="fas fa-angle-left "></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="crudTutorias" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Adicionar tutoria</p>
                </a>
              </li>
              <li class="nav-item">
              <a href="crudMatricula" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Listado de matriculas</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Calificaciones</p>
                </a>
              </li>
            </ul>
          </li> <!-- Menu de Matricula -->

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

                                //llamar al procedimiento almacenado
                                $evaluar_permiso_mostrar = $db->prepare("CALL Sp_permiso_mostrar(?,?);");
                                $evaluar_permiso_mostrar->execute(array($usuariomo, '30'));
                                $row1=$evaluar_permiso_mostrar->fetchColumn();
                                $permiso_mostrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de mostrar del modulo 26.-->

                    <?php 
                    if ($permiso_mostrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?> 




         <!-- Menu de AREA MEDICA -->
         <li class="nav-item">
          <a href="#" class="nav-link">
            <i class=" nav-icon fas fa-briefcase-medical "></i>
            <p>
              Area Medica
              <i class="fas fa-angle-left right"></i>
            </p>
          </a>

          <ul class="nav nav-treeview">
           <li class="nav-item">
             <a href="ProcesoCitasMedicos"class="nav-link">
               <i class="far fa-edit nav-icon"></i>
                <p>Proceso consultas</p>
             </a>
           </li>

            <li class="nav-item">
              <a href="procesoExpedienteMedico" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                <p>Proceso de expedientes</p>
              </a>
            </li>
          </ul>
        </li>





        <li class="nav-item">
          <a href="#" class="nav-link">
            <i class=" nav-icon fas fa-briefcase-medical "></i>
            <p>
              Mantenimiento medica
              <i class="fas fa-angle-left right"></i>
            </p>
          </a>

          <ul class="nav nav-treeview">
           <li class="nav-item">
             <a href="crudPreClinica"class="nav-link">
               <i class="nav-icon fas fa-table"></i>
                <p>mantenimiento Preclinica</p>
             </a>
           </li>

            <li class="nav-item">
              <a href="crudConsulta" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                <p>Mantenimiento consultas</p>
              </a>
            </li>

            <li class="nav-item">
              <a href="procesoExpedienteMedico" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                <p>mantenimiento medicamentos</p>
              </a>
            </li>

            <li class="nav-item">
              <a href="procesoExpedienteMedico" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                <p>mantenimiento medicamentos-pacientes</p>
              </a>
            </li>


            <li class="nav-item">
              <a href="crudAlergias" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                <p>mantenimiento alergias</p>
              </a>
            </li>

            <li class="nav-item">

              <a href="crudrecetamedica" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>Receta Medica</p>
              </a>
            </li>

            <li class="nav-item">
              <a href="crudmedicamento" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>Medicamento</p>
              </a>
            </li>

              <a href="procesoExpedienteMedico" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                <p>mantenimiento transtornos</p>
              </a>
            </li>


            <li class="nav-item">
              <a href="procesoExpedienteMedico" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                <p>mantenimiento condiciones fisicas</p>
              </a>
            </li>
          </ul>
        </li>
         

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

                                //llamar al procedimiento almacenado
                                $evaluar_permiso_mostrar = $db->prepare("CALL Sp_permiso_mostrar(?,?);");
                                $evaluar_permiso_mostrar->execute(array($usuariomo, '31'));
                                $row1=$evaluar_permiso_mostrar->fetchColumn();
                                $permiso_mostrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de mostrar del modulo 26.-->

                    <?php 
                    if ($permiso_mostrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?> 




         <!-- Menu de AREA PSICOLOGO -->
         <li class="nav-item">
          <a href="#" class="nav-link">
            <i class=" nav-icon fas fa-briefcase"></i>
            <p>
              Area Psicologica
              <i class="fas fa-angle-left right"></i>
            </p>
          </a>

          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="ProcesoCitasPsicologicas" class="nav-link">
                <i class="far fa-edit nav-icon"></i>
                <p>Proceso de consultas</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="crudPruebapsicometrica" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                <p>Pruebas Psicométricas</p>
              </a>
            </li>

            <li class="nav-item">
              <a href="  " class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                <p>Expedientes de pacientes</p>
              </a>
            </li>

          </ul>
        </li>
         

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

                                //llamar al procedimiento almacenado
                                $evaluar_permiso_mostrar = $db->prepare("CALL Sp_permiso_mostrar(?,?);");
                                $evaluar_permiso_mostrar->execute(array($usuariomo, '27'));
                                $row1=$evaluar_permiso_mostrar->fetchColumn();
                                $permiso_mostrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de mostrar del modulo 27.-->

                    <?php 
                    if ($permiso_mostrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?>      

          <li class="nav-item">
            <a href="#" class="nav-link bg-gradient-navy">
              <i class=" nav-icon fas fa-shield-alt"></i>
              <p>
                Seguridad
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="crudPermisos" class="nav-link">
                  <i class="nav-icon fas fa-table"></i>
                  <p>Permisos</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="crudRoles" class="nav-link">
                  <i class="nav-icon fas fa-table"></i>
                  <p>Roles</p>
                </a>
              </li>
              <li class="nav-item">

                <a href="crudpreguntas" class="nav-link">
                  <i class="nav-icon fas fa-table"></i>
                  <p>Preguntas</p>
                </a>
              </li>
              <li class="nav-item">
                  <a href="estado" class="nav-link" > 
                    <i class="nav-icon fas fa-table"></i>
                    <p>Mantenimiento Estado</p>
                  </a>
                </li>
             
              <li class="nav-item">
                <a href="crudParametros" class="nav-link" > <!--hace referencia al archivo para editar parametros-->
                   <i class="nav-icon fas fa-table"></i>
                   <p>Parametros</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="crudobjetos" class="nav-link">
                  <i class="nav-icon fas fa-table"></i>
                  <p>Objetos</p>
                </a>
              </li>
              <li class="nav-item">
              <a href="parametrosusuario" class="nav-link" > 
                  <i class="nav-icon fas fa-table"></i>
                  <p>Parametros usuarios</p>
              </a>
              </li>
              <li class="nav-item">
                <a href="crudtipopersona" class="nav-link">
                  <i class="nav-icon fas fa-table"></i>
                  <p>Tipo Persona</p>
                </a>
              </li>

              </li>
              <li class="nav-item">
              <a href="area" class="nav-link" > 
                  <i class="nav-icon fas fa-table"></i>
                  <p>Area</p>
              </a>
              </li>



            </ul>
          </li>


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

                                //llamar al procedimiento almacenado
                                $evaluar_permiso_mostrar = $db->prepare("CALL Sp_permiso_mostrar(?,?);");
                                $evaluar_permiso_mostrar->execute(array($usuariomo, '7'));
                                $row1=$evaluar_permiso_mostrar->fetchColumn();
                                $permiso_mostrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de mostrar del modulo 26.-->

                    <?php 
                    if ($permiso_mostrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?> 

                    <li class="nav-item">
                      <a href="Formbitacora" class="nav-link bg-gradient-navy">
                        <i class="nav-icon fas fa-table"></i>
                        <p>
                          Bitacora del sistema
                          <i class="fas fa-angle-left right"></i>
                        </p>
                      </a>
                    </li>

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

                                //llamar al procedimiento almacenado
                                $evaluar_permiso_mostrar = $db->prepare("CALL Sp_permiso_mostrar(?,?);");
                                $evaluar_permiso_mostrar->execute(array($usuariomo, '10'));
                                $row1=$evaluar_permiso_mostrar->fetchColumn();
                                $permiso_mostrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de mostrar del modulo 26.-->

                    <?php 
                    if ($permiso_mostrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?> 
                    <li class="nav">
                      <a href="Respaldo" class="nav-link bg-gradient-navy">
                        <i class=" nav-icon fas fa-cloud-download-alt"></i>
                        <p>
                          Respaldo y Restauración
                          <i class="fas fa-angle-left right"></i>
                        </p>
                      </a>
                    </li>
                    <?php
                    }
                      ?>





         </li>  
         </u><!--final del item menu principal-->

      </nav>
      <!-- /.sidebar-menu -->
     
    </div>
    <!-- /.sidebar -->
</aside>
