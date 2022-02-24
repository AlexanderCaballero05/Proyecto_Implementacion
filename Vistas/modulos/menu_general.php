<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="Vistas/dist/img/logoparroquia.jpg" alt="Parroquia Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">PROSECAR</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src=" Vistas/dist/img/avatar5.png" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Alexander</a>
        </div>
      </div>

     

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item menu-open">
            <a onclick="cargar_contenido('contenido_principal','Vistas/index.php')" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Adminsitrador
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
          </li>
            <!-- Menu de usuarios del sistema -->
            <li class="nav-item">
              <a href="#" class="nav-link">
                <i class="nav-icon fas fa-copy"></i>
                <p>
                  Usuarios
                  <i class="fas fa-angle-left right"></i>
                  <span class="badge badge-info right"></span>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a onclick="cargar_contenido('contenido_principal','forms_usuario/registrar_personas.php')" class="nav-link" >
                    <i class="far fa-circle nav-icon"></i>
                    <p>Personas</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a onclick="cargar_contenido('contenido_principal','forms_usuario/registrar_estudiante.php')" class="nav-link">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Estudiantes</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a onclick="cargar_contenido('contenido_principal','forms_usuario/registrar_familiares.php')" class="nav-link">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Familiares</p>
                  </a>
                </li>
              </ul>
            </li>
         

            <!-- Menu de graficas del sistema -->
            <li class="nav-item">
              <a href="#" class="nav-link">
                <i class="nav-icon fas fa-chart-pie"></i>
                <p>
                  Estadisticas
                  <i class="right fas fa-angle-left"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a oclass="nav-link">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Graficas de pastel</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="pages/charts/flot.html" class="nav-link">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Graficas lineal</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="pages/charts/inline.html" class="nav-link">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Otras graficas</p>
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
                <a onclick="cargar_contenido('contenido_principal','matricula/registrar_tutoria.php')" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Registrar Tutorias</p>
                </a>
              </li>
              <li class="nav-item">
                <a onclick="cargar_contenido('contenido_principal','matricula/matricular_tutoria.php')" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Matricular Tutorias</p>
                </a>
              </li>
              <li class="nav-item">
                <a onclick="cargar_contenido('contenido_principal','matricula/matricular_catequesis.php')" class="nav-link">
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
              <a href="pages/forms/general.html" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>Registar Cita</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="pages/forms/advanced.html" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>Medicamentos</p>
              </a>
            </li>
            
          </ul>
        </li>
       
         

          <li class="nav-header">Otros</li>
          <li class="nav-item">
            <a href="pages/calendar.html" class="nav-link">
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
                <a onclick="cargar_contenido('contenido_principal','seguridad/permisos.php')" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Permisos</p>
                </a>
              </li>
              <li class="nav-item">
                <a onclick="cargar_contenido('contenido_principal','seguridad/parametros.php')" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Paramentros</p>
                </a>
              </li>
              <li class="nav-item">
                <a onclick="cargar_contenido('contenido_principal','seguridad/recuperar_clave.php')" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Recuperar clave</p>
                </a>
              </li>
              <li class="nav-item">
                <a onclick="cargar_contenido('contenido_principal','seguridad/roles_participacion.php')" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Tipos usuario</p>
                </a>
              </li>
              <li class="nav-item">
                <a onclick="cargar_contenido('contenido_principal','seguridad/tipos_usuario.php')" class="nav-link">
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
                <a onclick="cargar_contenido('contenido_principal','estado/estado.php')" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Estado</p>
                </a>
              </li>
              

            </ul>
          </li>

          <li class="nav-header">Sobre el sistema</li>
            <li class="nav-item">
                <a href="" class="nav-link">
                <i class="nav-icon far fa-calendar-alt"></i>
                <p>
                    Bitacora
                    <span class="badge badge-info right"></span>
                </p>
                </a>
            </li>
          
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

 


     <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->


    <script>
  function cargar_contenido(contenedor,contenido){
      $("#"+contenedor).load(contenido);
   }
  $.widget.bridge('uibutton', $.ui.button)
</script>