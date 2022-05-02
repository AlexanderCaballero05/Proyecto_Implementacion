
<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 $codigoObjeto=4;
 $accion='Ingreso a mantenimiento de Familiar';
 $descripcion='Aqui se visualiza los familiares que se han registrado';
bitacora($codigoObjeto,$accion,$descripcion);
?>




<body oncopy="return false" onpaste="return false">
 
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
                       
  <section class="content">
    <div class="container-fluid">
    <section class="content-header text-xl-center mb-3 btn-light">
          <h1>
              <h4>RESTAURACION</h4>
          </h1>     
      </section>
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
            <ul class="nav nav-tabs card-header-tabs">
              <li class="nav-item">
                <a class="nav-link" style="color:#000000;" aria-current="true" href="RespaldoProsecar">Respaldo</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active"  style="color:#000000;" href="RestauracionProsecar">Restauracion</a>
              </li>
            </ul>
          </div><!--FIN DEL CARD HEADER -->
          <div class="card-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                  


          <div class="card-body">
          <div class="row">
            <div class="col-md-12">
          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style=""><!-- TITULO ENCABEZADO DATOS PERSONALES -->
            <h4>Restauracion de datos Prosecar</h4>
            </div>
            <form  method="POST" action="./vistas/modulos/Restore.php" class="needs-validation" novalidate><!-- form start -->
              <div class="card-body">
                  <div class="">
                  <p>Cuando se está recuperando de una falla de base de datos,
                      un administrador necesita restaurar un conjunto 
                      de copias de seguridad en una secuencia correcta y significativa.
                      Con esto en mente, el objetivo es tener un punto de recuperación ante
                      desastres, creando un plan de copias de seguridad, así como un plan 
                      apropiado de restauración de bases de datos.</p>
                    <br>

                  </div>

	
	<br>
  <div class="row mb-3">
    <div class="col-sm-12">
      <div class="form-group">
      <label>Selecciona un Punto de Restauración:</label>
  
		<select class="form-control" name="restorePoint" required>
			<option Selected disabled value="">Selecciona un punto...</option>
			<?php
				include_once 'Connet.php';
				$ruta="C:/xampp/htdocs/Proyecto_Implementacion/vistas/modulos/Backup/" ;
				if(is_dir($ruta)){
				    if($aux=opendir($ruta)){
				        while(($archivo = readdir($aux)) !== false){
				            if($archivo!="."&&$archivo!=".."){
				                $nombrearchivo=str_replace(".sql", "", $archivo);
				                $nombrearchivo=str_replace("-", ":", $nombrearchivo);
				                $ruta_completa=$ruta.$archivo;
				                if(is_dir($ruta_completa)){
				                }else{
				                    echo '<option value="'.$ruta_completa.'">'.$nombrearchivo.'</option>';
				                }
				            }
				        }
				        closedir($aux);
				    }
				}else{
				    echo $ruta." No es ruta válida";
				}
			?>
		</select>
    <div class="invalid-feedback">
              Eliga una opción.
       </div>
    </div>
		</div>
    </div>
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
                                $evaluar_permiso = $db->prepare("CALL Sp_permiso_insertar(?,?);");
                                $evaluar_permiso->execute(array($usuariomo, '10'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->

                    <?php 
                    if ($permiso_registrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?>      
                  <footer class="footer">
                <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-repeat"></span>  Restaurar Copia de Seguridad</button>
                  </div>
                
                              <?php
                              }
                              ?> 	
                <br>

       
                </div><!--fin del div de responsivi -->
              </div> <!-- /.card-body -->
            </form>
          </div><!-- fINAL DEL card PRIMARY -->
        </div><!--FINAL DE COL-M12-->
      </div><!-- FINAL ROW PADRE -->
    </div><!-- FINAL CONTAINER FLUID --> 
                      </div>
                      </div>
  </section><!-- FINAL SECTION -->

 

  </section>
<!-- Modal -->
</body>            
<script>
    function Descargar() {
      window.open('Reportes_Prosecar/reportefamiliar.php','_blank');;
      window.open(this.href,'_self');
    }
  </script>


<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_familiar').DataTable({

        language: {
        "decimal": "",
        "emptyTable": "No hay información",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
        "infoEmpty": "Mostrando 0 a 0 de 0 Entradas",
        "infoFiltered": "(Filtrado de _MAX_ total entradas)",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Mostrar _MENU_ Entradas",
        "loadingRecords": "Cargando...",
        "processing": "Procesando...",
        "search": "Buscar Familiar:",
        "zeroRecords": "Sin resultados encontrados",
        "paginate": {
            "first": "Primero",
            "last": "Ultimo",
            "next": "Siguiente",
            "previous": "Anterior"
        }
      },
        
      })
  } );
</script>

<script>
    
    var edifa=document.getElementById("edifa"); //el nombre del id del campo
    edifa.addEventListener('keydown', function(keyboardEvent){
  
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
});
var edini=document.getElementById("edini"); //el nombre del id del campo
    edini.addEventListener('keydown', function(keyboardEvent) {
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
});
var ediingre=document.getElementById("ediingre"); //el nombre del id del campo
    ediingre.addEventListener('keydown', function(keyboardEvent) {
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
});
var ediglesia=document.getElementById("ediglesia"); //el nombre del id del campo
    ediglesia.addEventListener('keydown', function(keyboardEvent) {
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
});
  </script>
 <script>
function soloLetras(e){
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
   especiales = ["8-37-39-46"];
   tecla_especial = false
   for(var i in especiales){
    if(key == especiales[i]){
      tecla_especial = true;
      break;
    }
  }
  if(letras.indexOf(tecla)==-1 && !tecla_especial){
    return false;
  }
 }
 //funcion para solu numeros ingresar en el campo
 function soloNumeros_tel(e){
   var teclaPulsada=window.event ? window.event.keyCode:e.which;
    // capturamos el contenido del input
    var valor=document.getElementById("tele").value;
    if(valor.length<9){
      if(teclaPulsada==9){
        return true;
      }
    // devolvemos true o false dependiendo de si es numerico o no
    return /\d/.test(String.fromCharCode(teclaPulsada));
    }else{
    return false;
    }
  }
   //funcion para quitar espacios
  function quitarespacios(e) {
    var cadena =  e.value;
    cadena = cadena.trim();
    e.value = cadena;
  };
  //funcion para poner mayusculas
  function mayus(e) {
    e.value = e.value.toUpperCase();
  }
   //funcion sin espacios 
  function sinespacio(e) {
    var cadena =  e.value;
    var limpia = "";
    var parts = cadena.split(" ");
    var length = parts.length;
    for (var i = 0; i < length; i++) {
     nuevacadena = parts[i];
     subcadena = nuevacadena.trim();
     if(subcadena != "") {
       limpia += subcadena + " ";
      }
    }
   limpia = limpia.trim();
   e.value = limpia;
  };
  //otra funcion para quitar espacios :V
  function quitarespacios(e) {
    var cadena =  e.value;
    cadena = cadena.trim();
    e.value = cadena;
  };
</script>
<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  var forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.prototype.slice.call(forms)
    .forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }

        form.classList.add('was-validated')
      }, false)
    })
})()

</script>