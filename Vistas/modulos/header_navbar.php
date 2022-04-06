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
      <li class="dropdown no-arrow nav-item">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                                <img class="img-profile rounded-circle" width="44 px" src="vistas/assets/dist/img/user8-128x128.jpg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div  class="dropdown-menu dropdown-menu-right  bg-gradient-blue"
                                aria-labelledby="userDropdown">
                              <div  class="dropdown-item">
                                  <div class="dropdown-author" style="color:white"><?php echo $_SESSION['vario']; ?>

                                  </div>
                              </div>
                             
                                                            
                                <div class="dropdown-divider"></div>

                                <a class="dropdown-item menu-action" onclick="location.href='perfilUsuario'" >

                                <i class="fas fa-user"></i>
                                    <span class="menu-action-text pr-2" style="color:white">Perfil</span>
                                    </a>

                                <div class="dropdown-divider"></div>
                                
                                <a class="dropdown-item menu-action" onclick="location.href='salir'" >

                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    <span class="menu-action-text pr-2" style="color:white">Cerrar sesion</span>
                                </a>

                               
                            </div>
   </li>
    </ul>
  </nav>

</nav>
<!-- /.navbar -->
              <!--INICIO DEL MODAL DE EDITAR -->
        