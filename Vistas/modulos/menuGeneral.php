   

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
                <a href="perfilUsuario" class="d-block"><?php $usuario=$_SESSION['vario']; echo $usuario; ?></a>
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
                  <a href="crudpersonas" class="nav-link" >
                   <i class="far fa-user nav-icon"></i>
                    <p>Proceso Personas/Usuarios</p>
                  </a>
                </li>

                <li class="nav-item">
                  <a href="crudparametrosusuario" class="nav-link" > 
                  <i class="nav-icon fas fa-table"></i>
                      <p>Mantenimiento de Parametros usuarios</p>
                  </a>
              </li>
              <li class="nav-item">
                <a href="crudtipopersona" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                  <p>Mantenimiento de Tipo Persona</p>
                </a>
              </li>

                <li class="nav-item">
                  <a href="crudespecialidad" class="nav-link" > <!--modifique acuerdate -->
                  <i class="nav-icon fas fa-table"></i>
                    <p>Mantenimiento Especialidades</p>
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
                    <p>Proceso de estudiantes</p>
                  </a>
                </li>

                <li class="nav-item">
                  <a href="crudSacramentos"class="nav-link">
                  <i class="nav-icon fas fa-table"></i>
                    <p>Mantenimiento Sacramentos</p>
                  </a>
                </li>
                

                <li class="nav-item">
                  <a href="crudContenidoEconomico" class="nav-link">
                  <i class="nav-icon fas fa-table"></i>
                    <p>Mantenimiento Tipo de contenido</p>
                  </a>
                </li> 
                 
                <li class="nav-item">
                  <a href="crudtiposocioeconomico" class="nav-link" >
                  <i class="nav-icon fas fa-table"></i>
                    <p>Mantenimiento Tipo socieconomico</p>
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
                              <a href="crudcitasgenerales"class="nav-link">
                                <i class="far fa-edit nav-icon"></i>
                                <p>Proceso de Citas </p>
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
                                $evaluar_permiso_mostrar->execute(array($usuariomo, '33'));
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
                  <a href="procesoRegistrarFamiliares"class="nav-link">
                    <i class="far fa-edit nav-icon"></i>
                    <p>Proceso de familiares</p>
                  </a>
                </li>
                <li class="nav-item">

                  <a href="crudParentesco" class="nav-link" > <!--modifique acuerdate -->
                  <i class="nav-icon fas fa-table"></i>
                    <p>Mantenimiento de parentesco</p>
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
            <a href="#" class="nav-link bg-gradient-navy">
            <i class="nav-icon fas fa-edit"></i>
              <p>
                Carga Academica
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>

            <ul class="nav nav-treeview">

            <li class="nav-item">
                <a href="crudCargaAcademica" class="nav-link">
                <i class="far fa-edit nav-icon"></i>
                  <p>Proceso carga academica</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="crudTutorias" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                  <p>Mantenimiento tutorias</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="crudSeccion" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                  <p>Mantenimiento Secciones</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="crudmodalidad" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                  <p>Mantenimiento modalidad</p>
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
          <a href="#" class="nav-link bg-gradient-navy">
            <i class=" nav-icon fas fa-school"></i>
            <p>
              Matricula
              <i class="fas fa-angle-left "></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
              <li class="nav-item">
              <a href="crudMatricula" class="nav-link">
                 <i class="far fa-edit nav-icon"></i>
                  <p>Proceso de matricula</p>
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
                                $evaluar_permiso_mostrar->execute(array($usuariomo, '38'));
                                $row1=$evaluar_permiso_mostrar->fetchColumn();
                                $permiso_mostrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de mostrar del modulo 26.-->

                    <?php 
                    if ($permiso_mostrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?>   

                   <!-- Menu de AREA DE TUTOR academico-->
                     <li class="nav-item">
                     <a href="#" class="nav-link bg-gradient-navy">
                          <i class=" nav-icon fas fa-briefcase"></i>
                          <p>
                            Area Academica
                            <i class="fas fa-angle-left right"></i>
                          </p>
                        </a>

                        <ul class="nav nav-treeview">
                          <li class="nav-item">
                            <a href="crudTutoriasTutor" class="nav-link">
                              <i class="far fa-edit nav-icon"></i>
                              <p>Proceso tutorias academicas</p>
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
                                $evaluar_permiso_mostrar->execute(array($usuariomo, '52'));
                                $row1=$evaluar_permiso_mostrar->fetchColumn();
                                $permiso_mostrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de mostrar del modulo 26.-->

                    <?php 
                    if ($permiso_mostrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?>   

                   <!-- Menu de AREA DE TUTOR espiritual -->
                     <li class="nav-item">
                     <a href="#" class="nav-link bg-gradient-navy">
                          <i class=" nav-icon fas fa-briefcase"></i>
                          <p>
                            Area Espiritual
                            <i class="fas fa-angle-left right"></i>
                          </p>
                        </a>

                        <ul class="nav nav-treeview">
                          <li class="nav-item">
                            <a href="crudTutorEspiritual" class="nav-link">
                              <i class="far fa-edit nav-icon"></i>
                              <p>Proceso tutorias espirituales</p>
                            </a>
                          </li>      
                          
                          <li class="nav-item">
                            <a href="procesoCitasEspirituales" class="nav-link">
                              <i class="far fa-edit nav-icon"></i>
                              <p>Proceso eventos espirituales</p>
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
                                $evaluar_permiso_mostrar->execute(array($usuariomo, '49'));
                                $row1=$evaluar_permiso_mostrar->fetchColumn();
                                $permiso_mostrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de mostrar del modulo 26.-->

                    <?php 
                    if ($permiso_mostrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?> 
              <!--Menu de enfermero-->
             <li class="nav-item">
          <a href="#" class="nav-link bg-gradient-navy">
            <i class=" nav-icon fas fa-briefcase-medical "></i>
            <p>
              Area Medica
              <i class="fas fa-angle-left right"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
          <li class="nav-item">
             <a href="procesoCitaspPreclinica"class="nav-link">
               <i class="far fa-edit nav-icon"></i>
                <p>Proceso de Preclinica</p>
             </a>
           </li>
          </ul>
        </li>
          <!-- fin Menu de enfermero-->

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
          <a href="#" class="nav-link bg-gradient-navy">
            <i class=" nav-icon fas fa-briefcase-medical "></i>
            <p>
              Area Medica
              <i class="fas fa-angle-left right"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
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
                                $evaluar_permiso_mostrar->execute(array($usuariomo, '50'));
                                $row1=$evaluar_permiso_mostrar->fetchColumn();
                                $permiso_mostrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de mostrar del modulo 26.-->

                    <?php 
                    if ($permiso_mostrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?> 
          <li class="nav-item">
             <a href="procesoCitaspPreclinica"class="nav-link">
               <i class="far fa-edit nav-icon"></i>
                <p>Proceso de Preclinica</p>
             </a>
           </li>

           <?php
          }
          ?>

           <li class="nav-item">
             <a href="ProcesoCitasMedicos"class="nav-link">
               <i class="far fa-edit nav-icon"></i>
                <p>Proceso consultas</p>
             </a>
           </li>
           <li class="nav-item">
             <a href="crudPacientesMedicos"class="nav-link">
               <i class="far fa-edit nav-icon"></i>
                <p>Lista de pacientes Medicos</p>
             </a>
           </li>
            
          </ul>
        </li>

        <li class="nav-item">
          <a href="#" class="nav-link bg-gradient-navy">
            <i class="nav-icon fas fa-briefcase-medical"></i>
            <p>
              Mantenimiento medico
              <i class="nav-icon "></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="crudAlergias" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
                <p>Mantenimiento alergias</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="crudtiposangre" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
                <p>Mantenimiento tipo sangre</p>
              </a>
            </li>
            <li class="nav-item">

            <li class="nav-item">
              <a href="crudmedicamento" class="nav-link">
               <i class="nav-icon fas fa-table"></i>
                <p>Mantenimiento Medicamentos</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="crudExamenesMedicos" class="nav-link">
               <i class="nav-icon fas fa-table"></i>
                <p>Mantenimiento Examenes</p>
              </a>
            </li>
              <li>
              <a href="crudTranstornos" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
                <p>Mantenimiento transtornos</p>
              </a>
            </li>


            <li class="nav-item">
              <a href="crudAparienciaFisica" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
                <p>Mantenimiento apariencias fisicas</p>
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
          <a href="#" class="nav-link bg-gradient-navy">
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
              <a href="crudExpedientePsicoUnico" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                <p>Lista de pacientes </p>
              </a>
            </li>

            <li class="nav-item">
              <a href="crudsintomasneuroticos" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                <p>Mantenimiento sintomas</p>
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
                  <p>Mantenimiento de Permisos</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="crudRoles" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                  <p>Mantenimiento de Roles</p>
                </a>
              </li>
              <li class="nav-item">

                <a href="crudpreguntas" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                  <p>Mantenimiento de Preguntas</p>
                </a>
              </li>
              <li class="nav-item">
                  <a href="estado" class="nav-link" > 
                  <i class="nav-icon fas fa-table"></i>
                    <p>Mantenimiento de Estados</p>
                  </a>
                </li>
             
              <li class="nav-item">
                <a href="crudParametros" class="nav-link" > <!--hace referencia al archivo para editar parametros-->
                <i class="nav-icon fas fa-table"></i>
                   <p>Mantenimiento de Parametros</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="crudobjetos" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                  <p>Mantenimiento de Objetos</p>
                </a>
              </li>
            

              </li>
              <li class="nav-item">
              <a href="area" class="nav-link" > 
              <i class="nav-icon fas fa-table"></i>
                  <p>Mantenimiento de Areas</p>
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

                    <!-- <li class="nav">
                      <a href="RespaldoProsecar" class="nav-link bg-gradient-navy">
                        <i class=" nav-icon fas fa-cloud-download-alt"></i>
                        <p>
                          Restauración
                          <i class="fas fa-angle-left right"></i>
                        </p>
                      </a>
                    </li>-->
                    <?php
                    }
                      ?>





         </li>  
         </ul><!--final del item menu principal-->

      </nav>
      <!-- /.sidebar-menu -->
     
    </div>
    <!-- /.sidebar -->
    
</aside>
