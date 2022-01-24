<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Prosecar</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../Plantilla/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="../Plantilla/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="../Plantilla/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="../Plantilla/plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../Plantilla/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="../Plantilla/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="../Plantilla/plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="../Plantilla/plugins/summernote/summernote-bs4.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="../Plantilla/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="index3.html" class="nav-link">Inicio</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
      <li class="nav-item">
        <a class="nav-link" data-widget="navbar-search" href="#" role="button">
          <i class="fas fa-search"></i>
        </a>
        <div class="navbar-search-block">
          <form class="form-inline">
            <div class="input-group input-group-sm">
              <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
              <div class="input-group-append">
                <button class="btn btn-navbar" type="submit">
                  <i class="fas fa-search"></i>
                </button>
                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                  <i class="fas fa-times"></i>
                </button>
              </div>
            </div>
          </form>
        </div>
      </li>


      <li class="dropdown user user-menu open" >
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
              <img src="../Plantilla/dist/img/avatar5.png"   alt="User Image" class="user-image" >

            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header" style="background-color: #3c8dbc;">
                <img src="../Plantilla/dist/img/avatar5.png"  class="img-circle elevation-1" alt="Imagen de usuario">

                <p>
                   
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body" > 
                <div class="row">
                 
                  <div class="col-xs-4 text-center">
                    <a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Amigos</font></font></a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="float-left">
                  <a href="#" class="btn btn-default btn-flat"><font style="vertical-align: inherit;"><font >Perfil</font></font></a>
                </div>
                <div class="float-right">
                  <a href="../Login/index.php" class="btn btn-default btn-flat"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">salir</font></font></a>
                </div>
              </li>
            </ul>
        
          </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-controlsidebar-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="../Plantilla/dist/img/logoparroquia.jpg" alt="Parroquia Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">PROSECAR</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="../Plantilla/dist/img/avatar5.png" class="img-circle elevation-2" alt="User Image">
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
                  <a onclick="cargar_contenido('contenido_principal','usuario/registrar_personas.php')" class="nav-link" >
                    <i class="far fa-circle nav-icon"></i>
                    <p>Personas</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a onclick="cargar_contenido('contenido_principal','usuario/registrar_estudiante.php')" class="nav-link">
                    <i class="far fa-circle nav-icon"></i>
                    <p>Estudiantes</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a onclick="cargar_contenido('contenido_principal','usuario/registrar_familiares.php')" class="nav-link">
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
                  <a onclick="cargar_contenido('contenido_principal','esta../Plantilla/disticas/grafica1.php')"class="nav-link">
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

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Administrador</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Admnistrador</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Contenido general de pagina -->
    <section class="content">
      <div class="container-fluid">
        
        <div class="row" id="contenido_principal">

        <div class="col-md-10">
            <div class="card card-default">
              <div class="card-header">
                <h3 class="card-title">
                  <i class="fas fa-bullhorn"></i>
                  PROSECAR
                </h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="callout callout-danger">
                  <h5>MISION </h5>

                  <p></p>
                </div>
                <div class="callout callout-info">
                  <h5>VISION</h5>

                  <p></p>
                </div>
                <div class="callout callout-warning">
                  <h5>VALORES</h5>

                  <p></p>
                </div>
                <div class="callout callout-success">
                  <h5>HISTORIA</h5>

                  <p></p>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>



        </div>
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


  <footer class="main-footer">
    <strong>Copyright &copy; 2022-2023 <a href="">Infomatica Administrativa UNAH</a>.</strong>
    All rights reserved.
    
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="../Plantilla/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="../Plantilla/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  function cargar_contenido(contenedor,contenido){
      $("#"+contenedor).load(contenido);
   }
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="../Plantilla/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="../Plantilla/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="../Plantilla/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="../Plantilla/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="../Plantilla/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="../Plantilla/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="../Plantilla/plugins/moment/moment.min.js"></script>
<script src="../Plantilla/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="../Plantilla/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="../Plantilla/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="../Plantilla/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="../Plantilla/dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../Plantilla/dist/js/demo.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../Plantilla/dist/js/pages/dashboard.js"></script>
</body>
</html>
