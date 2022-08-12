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
    Programa:          Menú general
    Fecha:             20/03/2022
    Programador:       Arnold Caballero
    descripcion:       Menú general que aparece en todo el sistema
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador               Fecha                      Descripcion
    Luz Montoya         		18-06-2022                 cambio del orden en las opciones de seguridad 
    Diana Rut Garcia       09-07-2022                 cambio en el nombre del nombres del menu
    Diana Rut Garcia       09-07-2022                 cambio en el orden del menu de personas
    Diana Rut Garcia       21-07-2022                 cambio en el orden del menu de estudiante
    Diana Rut Garcia       22-07-2022                 cambio en los nombres del menu
----------------------------------------------------------------------->

<?php
  include_once "conexion.php";
  include_once "conexion3.php";
 ?>

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4 menu_lateral position-fixed">

    <!-- Brand Logo -->
    <a href="index.php" class="brand-link">
        <img src="vistas/assets/dist/img/logoparroquia.jpg"  class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">PROSECAR</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar position-fixed">

        <!-- parte de la foto de perfil y nombre de usuario :3-->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
          <?php 
            $nomUser= $_SESSION['vario'];
            $query = "SELECT  imagen from tbl_usuario where NOMBRE_USUARIO ='$nomUser'; ";
            $result = $conn->query($query);
            if ($result->num_rows > 0) {
              while($row = $result->fetch_assoc()) {
              $var12 = $row['imagen'];
              ?>
              <?php
               }
              ?>
              <div class="image">
                <img style="width:35px ; heigth:33px"  class="img-circle elevation-1"   src="data:image/jpeg;base64,<?php echo base64_encode($var12); ?>">
                 <!--  <img src="vistas/assets/dist/img/user1-128x128.jpg" class="img-circle elevation-2" alt="User Image"> -->
              </div>
              
             <?php
            }else if ($result->num_rows < 0){
             ?>
              <div class="image">
              <img src="vistas/assets/dist/img/usuario.PNG" class="img-circle elevation-2" alt="imagen del usiaro">
               <!--<img src="vistas/assets/dist/img/user1-128x128.jpg" class="img-circle elevation-2" alt="yghg Image"> -->
              </div>

             <?php
            }
          ?>
          
            
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
                Menu General
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
                  Gestión Usuarios
                  <i class="fas fa-angle-left right"></i>
                  <span class="badge badge-info right"></span>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="categoria" class="nav-link" >
                   <i class="far fa-user nav-icon"></i>
                    <p>Agregar Personas/Usuarios</p>
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
            <!-- Menu de gestion del estudinate -->
            <li class="nav-item">
              <a href="" class="nav-link bg-gradient-navy">
                <i class="nav-icon fas fa-graduation-cap"></i>
                <p>
                Gestión de Estudiantes
                  <i class="right fas fa-angle-left"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="ediusuariosestudiantes"class="nav-link">
                    <i class="far fa-edit nav-icon"></i>
                    <p>Proceso Estudiantes</p>
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
                    <p>Mantenimiento Contenido Socieconómico</p>
                  </a>
                </li> 
                <!--
                <li class="nav-item">
                  <a href="crudtiposocioeconomico" class="nav-link" >
                  <i class="nav-icon fas fa-table"></i>
                    <p>Mantenimiento Tipo Socieconómico</p>
                  </a>
                </li> -->
                <li class="nav-item">
                  <a href="crudParentesco" class="nav-link" > <!--modifique acuerdate -->
                  <i class="nav-icon fas fa-table"></i>
                    <p>Mantenimiento Parentesco</p>
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
                              Gestión Citas 
                              <i class="right fas fa-angle-left"></i>
                            </p>
                          </a>
                          <ul class="nav nav-treeview">
                            <li class="nav-item">
                              <a href="crudcitasgenerales"class="nav-link">
                                <i class="far fa-edit nav-icon"></i>
                                <p>Proceso Citas </p>
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
                                $evaluar_permiso_mostrar->execute(array($usuariomo, '51'));
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
                    Área de Estudiantes
                  <i class="right fas fa-angle-left"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="citasestudiantes"class="nav-link">
                    <i class="far fa-edit nav-icon"></i>
                    <p>Citas</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="matriculaestudiantes" class="nav-link" > 
                  <i class="nav-icon fas fa-table"></i>
                    <p>Tutorías</p>
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
                                $evaluar_permiso_mostrar->execute(array($usuariomo, '20'));
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
                Gestión Carga Académica y Espiritual
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>

            <ul class="nav nav-treeview">

            <li class="nav-item">
                <a href="crudCargaAcademica" class="nav-link">
                <i class="far fa-edit nav-icon"></i>
                  <p>Proceso Carga Académica</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="crudTutorias" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                  <p>Mantenimiento Tutorías</p>
                </a>
              </li>
              <li class="nav-item">
              <a href="area" class="nav-link" > 
              <i class="nav-icon fas fa-table"></i>
                  <p>Mantenimiento Áreas</p>
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
                  <p>Mantenimiento Modalidad</p>
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
                                $evaluar_permiso_mostrar->execute(array($usuariomo, '23'));
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
              Matrícula Académica y Espiritual
              <i class="fas fa-angle-left "></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
              <li class="nav-item">
              <a href="crudMatricula" class="nav-link">
                 <i class="far fa-edit nav-icon"></i>
                  <p>Proceso Matricula</p>
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
                          <i class="nav-icon fas fa-briefcase "></i>
                          <p>
                           Área Académica
                            <i class="fas fa-angle-left right"></i>
                          </p>
                        </a>

                        <ul class="nav nav-treeview">
                          <li class="nav-item">
                            <a href="crudTutoriasTutor" class="nav-link">
                              <i class="far fa-edit nav-icon"></i>
                              <p>Proceso Tutorías Académicas</p>
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
                            Área Espiritual
                            <i class="fas fa-angle-left right"></i>
                          </p>
                        </a>

                        <ul class="nav nav-treeview">
                          <li class="nav-item">
                            <a href="crudTutorEspiritual" class="nav-link">
                              <i class="far fa-edit nav-icon"></i>
                              <p>Proceso Tutorías Espirituales</p>
                            </a>
                          </li>      
                          
                          <li class="nav-item">
                            <a href="procesoCitasEspirituales" class="nav-link">
                              <i class="far fa-edit nav-icon"></i>
                              <p>Proceso Eventos Espirituales</p>
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
              Área de Enfermeria
              <i class="fas fa-angle-left right"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
          <li class="nav-item">
             <a href="procesoCitaspPreclinica"class="nav-link">
               <i class="far fa-edit nav-icon"></i>
                <p>Proceso Preclínica</p>
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
              Área Médica
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
                <p>Proceso Preclínica</p>
             </a>
           </li>

           <?php
          }
          ?>

           <li class="nav-item">
             <a href="ProcesoCitasMedicos"class="nav-link">
               <i class="far fa-edit nav-icon"></i>
                <p>Proceso Consultas</p>
             </a>
           </li>
           <li class="nav-item">
             <a href="crudPacientesMedicos"class="nav-link">
               <i class="far fa-edit nav-icon"></i>
                <p>Lista de Pacientes Medicos</p>
             </a>
           </li>
            
          </ul>
        </li>

        <li class="nav-item">
          <a href="#" class="nav-link bg-gradient-navy">
            <i class="nav-icon fas fa-briefcase-medical"></i>
            <p>
              Mantenimiento Médico
              <i class="nav-icon "></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="crudAlergias" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
                <p>Alergias</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="crudtiposangre" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
                <p>Tipo Sangre</p>
              </a>
            </li>
            <li class="nav-item">

            <li class="nav-item">
              <a href="crudmedicamento" class="nav-link">
               <i class="nav-icon fas fa-table"></i>
                <p>Medicamentos</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="crudExamenesMedicos" class="nav-link">
               <i class="nav-icon fas fa-table"></i>
                <p>Exámenes</p>
              </a>
            </li>
              <li>
              <a href="crudTranstornos" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
                <p>Trastornos</p>
              </a>
            </li>


            <li class="nav-item">
              <a href="crudAparienciaFisica" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
                <p>Apariencias Físicas</p>
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
              Área Psicológica
              <i class="fas fa-angle-left right"></i>
            </p>
          </a>

          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="ProcesoCitasPsicologicas" class="nav-link">
                <i class="far fa-edit nav-icon"></i>
                <p>Proceso Consultas</p>
              </a>
            </li>
                    
            <li class="nav-item">
              <a href="crudExpedientePsicoUnico" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                <p>Expedientes Psicológicos</p>
              </a>
            </li>

            <li class="nav-item">
              <a href="crudsintomasneuroticos" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                <p>Mantenimiento Síntomas</p>
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
                <a href="crudtipopersona" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                  <p>Tipos Persona</p>
                </a>
              </li>

                <li class="nav-item">
                  <a href="crudespecialidad" class="nav-link" > <!--modifique acuerdate -->
                  <i class="nav-icon fas fa-table"></i>
                    <p>Especialidades</p>
                  </a>
                </li>
              

              <li class="nav-item">
                <a href="ediusuarios" class="nav-link">
                 <i class="nav-icon fas fa-table"></i>
                  <p>Usuarios</p>
                </a>
              </li>

            <li class="nav-item">
                <a href="crudRoles" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                  <p>Roles</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="crudPermisos" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                  <p>Permisos</p>
                </a>
              </li>

              
              
              <li class="nav-item">
                <a href="crudobjetos" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                  <p>Objetos</p>
                </a>
              </li>
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
                    <p>Estados</p>
                  </a>
                </li>
             
              <li class="nav-item">
                <a href="crudParametros" class="nav-link" > <!--hace referencia al archivo para editar parametros-->
                <i class="nav-icon fas fa-table"></i>
                   <p>Parametros</p>
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
                          Bitacora del Sistema
                          <!-- <i class="fas fa-angle-left right"></i> -->
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
                      <a href="RespaldoProsecar" class="nav-link bg-gradient-navy">
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





         </li> <br><br> 
         </ul><!--final del item menu principal-->

      </nav>
      <!-- /.sidebar-menu -->
     
    </div>
    <!-- /.sidebar -->
    
</aside>
