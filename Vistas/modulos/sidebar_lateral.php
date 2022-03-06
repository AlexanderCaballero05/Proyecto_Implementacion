
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
                <a href="#" class="d-block"><?php $usuario =$_SESSION['vario']; echo $usuario; ?></a>
            </div>
        </div>

     <!-- Sidebar Menu -->
     <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item menu-open">
            <a href="index" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Administrador
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
          </li>
            <!-- Menu de usuarios del sistema -->
            <li class="nav-item">
              <a href="" class="nav-link">
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
                   <i class="far fa-circle nav-icon"></i>
                    <p>Registrar Personas/usuarios</p>
                  </a>
                </li>

                <li class="nav-item">
                  <a href="ediusuarios" class="nav-link" > <!--modifique acuerdate -->
                    <i class="far fa-circle nav-icon"></i>
                    <p>Editar Usuarios</p>
                  </a>
                </li>

                <li class="nav-item">
                  <a href="estado" class="nav-link" > <!--modifique acuerdate -->
                    <i class="far fa-circle nav-icon"></i>
                    <p>Mantenimiento Estado</p>
                  </a>
                </li>
              
                
                <li class="nav-item">
                  <a href="Formbitacora" class="nav-link">
                  
                    <i class="far fa-circle nav-icon"></i>
                    <p>Bitacora Universal</p>
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
         

            <!-- Menu de graficas del sistema -->
            <li class="nav-item">
              <a href="#" class="nav-link">
                <i class="nav-icon fas fa-chart-pie"></i>
                <p>
                  Gestion de Estudiantes
                  <i class="right fas fa-angle-left"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="procesoRegistrarEstudiante"class="nav-link">
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
        
           <!-- Menu de matricula -->
           <li class="nav-item">
            <a href="#" class="nav-link">
            <i class="nav-icon fas fa-edit"></i>
              <p>
                Matricula
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="crudTutorias" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Registrar Tutorias</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="procesoCargaAcademica" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Carga academica</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Matricular Catequesis</p>
                </a>
              </li>
            </ul>
          </li>
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
              <a href=" " class="nav-link">
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
          <li class="nav-header">Otros</li>
          <li class="nav-item">
            <a href=" " class="nav-link">
              <i class="nav-icon far fa-calendar-alt"></i>
              <p>
                Calendarario
                <span class="badge badge-info right"></span>
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class=" nav-icon fas fa-shield-alt"></i>
              <p>
                Seguridad
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="crudPermisos" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
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
              <a href="crudParametros" class="nav-link" > <!--hace referencia al archivo para editar parametros-->
                  <i class="far fa-circle nav-icon"></i>
                  <p>Parametros</p>
              </a>
              </li>
              <li class="nav-item">
                <a href="objetos" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Objetos</p>
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
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fa-security"></i>
              <p>
                Estado
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href=""class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Estado</p>
                </a>
              </li>
              
              
            </ul>
          </li>

          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fa-security"></i>
              <p>
              Sobre el sistema
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href=""class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Bitacora</p>
                  <a href="formGestion_bitacora" class="nav-link" >
                </a>
              </li>

                  
        </ul>
      </nav>
      <!-- /.sidebar-menu -->

    </div>
    <!-- /.sidebar -->
</aside>
