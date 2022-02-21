 <!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">

    <!-- Left navbar links -->
    <ul class="navbar-nav">

        <li class="nav-item">

            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>

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
                        
                        <input class="form-control form-control-navbar" type="search" placeholder="Busca lo que necesitas..." aria-label="Busqueda">
                        
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

        <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
    <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="fas fa-user mr-2"></i>
          <span class="badge badge-danger navbar-badge"></span>
        </a>
        <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
          <a class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
            <img src="iconos/cerrar.png" width="40" height="40" class="img-circle elevation-2" alt="User Image">
              <div class="media-body">
              <form class="form-horizontal" method="POST">
              <center>
              <button type="button" onclick="location.href='salir'" id="salir" name="salir" class="btn btn-link">Cerrar Sesión</button> 
              </center>
            </form>
            </div>
            </div>
            <!-- Message End -->
          </a>
      </li>
    </ul>
  </nav>

</nav>
<!-- /.navbar -->