   

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
                <i class="nav-icon fas fa-copy"></i>
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
                    <p>Editar Usuarios</p>
                  </a>
                </li>

                <li class="nav-item">
                  <a href="crudpersonas" class="nav-link" > <!--modifique acuerdate -->
                    <i class="far fa-edit nav-icon"></i>
                    <p>Editar personas</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="crudtiposocioeconomico" class="nav-link" > <!--modifique acuerdate -->
                    <i class="far fa-circle nav-icon"></i>
                    <p>tipo de socio economico</p>
                  </a>
                </li>



                <li class="nav-item">
                  <a href="estado" class="nav-link" > <!--modifique acuerdate -->
                    <i class="far fa-circle nav-icon"></i>
                    <p>Mantenimiento Estado</p>
                  </a>
                </li>
              
                
              
                <li class="nav-item">
                  <a href="crudPreguntasUsuarios" class="nav-link">
                    <i class="far fa-circle nav-icon"></i>
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
                <i class="nav-icon fas fa-chart-pie"></i>
                <p>
                  Gestion de Estudiantes
                  <i class="right fas fa-angle-left"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="crudEstudiante"class="nav-link">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Estudiantes</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href=" " class="nav-link">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Tipo de contenido</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href=" " class="nav-link">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Contenido</p>
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
                <a href="crudModalidad" class="nav-link">
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
                <a href="procesoCargaAcademica" class="nav-link">
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




         <!-- Menu de otras cosas -->
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
              <a href="" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>Registar Cita</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="  " class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>Medicamentos</p>
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
                  <i class="far fa-circle nav-icon"></i>
                  <p>Roles</p>
                </a>
              </li>
              <li class="nav-item">

                <a href="crudpreguntas" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Preguntas</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="crudtipopersona" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Tipo Persona</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="" class="nav-link">

              <a href="crudParametros" class="nav-link" > <!--hace referencia al archivo para editar parametros-->
                  <i class="far fa-circle nav-icon"></i>
                  <p>Parametros</p>
              </a>
              </li>
              <li class="nav-item">
                <a href="crudobjetos" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Objetos</p>
                </a>
              </li>
              <li class="nav-item">
              <a href="parametrosusuario" class="nav-link" > 
                  <i class="far fa-circle nav-icon"></i>
                  <p>Parametros usuarios</p>
              </a>
              </li>
              <li class="nav-item">
                <a href="" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Recuperar clave</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Tipos usuario</p>
                </a>
              </li>
              <li class="nav-item">
                <a href=""class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Modulos</p>
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
                      <a href="#" class="nav-link bg-gradient-navy">
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