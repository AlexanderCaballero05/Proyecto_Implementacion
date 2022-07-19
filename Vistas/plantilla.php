<!-- <?php 
session_start();
?> -->
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Administrar Sistema| Inicio </title>

    <link rel="shortcut icon" href="vistas/assets/dist/img/logoparroquia.jpg" type="image/x-icon">
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!--select2 -->
    <link rel="stylesheet" href="vistas/plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="vistas/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">

    

  

    <!-- CSS STYLES -->
    <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
        <!-- Font Awesome -->
        
        <link rel="stylesheet" href="vistas/assets/plugins/fontawesome-free/css/all.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="vistas/assets/dist/css/adminlte.css">

        <link rel="stylesheet" href="vistas/assets/dist/css/index.css">

        <!-- DataTabes CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">

        <!-- SweetAlert2 -->
        <link rel="stylesheet" href="vistas/assets/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
         
        <link rel="stylesheet" href="vistas/plugins/icheck-bootstrap/icheck-bootstrap.min.css">

              <!-- DataTables -->
  <link rel="stylesheet" href="vistas/assets/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="vistas/assets/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="vistas/assets/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
        
    <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->

    <!-- SCRIPT -->
    <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->

        <!-- jQuery -->
        <script src="vistas/assets/plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="vistas/assets/plugins/bootstrap/js/bootstrap.bundle.js"></script>
        <!-- AdminLTE App -->
        <script src="vistas/assets/dist/js/adminlte.js"></script>
        
        <!-- Datatable js -->
        <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>    
        <!-- SweetAlert2 -->
        <script src="vistas/assets/plugins/sweetalert2/sweetalert2.min.js"></script> 
        <!-- SweetAlert2 version reciente :v -->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

     
        

        <!-- Select2 -->
        
       
    <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->


</head>


<?php
      if (isset($_SESSION["iniciarSesion"]) && $_SESSION["iniciarSesion"] == "ok"){
 ?>


<body class="hold-transition sidebar-mini">
 <?php
    echo '<div class="wrapper">'; 
   /*=============================================
  =            encabezado                        =
  =============================================*/
  include "modulos/header_navbar.php";
   /*=============================================
  =            menu                        =
  =============================================*/
  include "modulos/menuGeneral.php";
  /*=============================================
  =            CONTENIDO                        =
  =============================================*/
  if (isset($_GET["ruta"])){
    if ( $_GET["ruta"] == "inicio" ||
         $_GET["ruta"] == "login" ||     
         $_GET["ruta"] == "salir" ||
         $_GET["ruta"] == "perfilUsuario" ||
         $_GET["ruta"] == "ediusuarios" ||
         $_GET["ruta"] == "ediusuariosestudiantes" ||
         $_GET["ruta"] == "roles" ||
         $_GET["ruta"] == "registrar_personas" ||
         $_GET["ruta"] == "crudespecialidad" ||
         $_GET["ruta"] == "Formbitacora" ||
         $_GET["ruta"] == "crudpersonas" ||
         $_GET["ruta"] == "crudobjetos" ||
         $_GET["ruta"] == "crudtiposocioeconomico" ||
         $_GET["ruta"] == "historialmatriculaestudiante" ||
         $_GET["ruta"] == "citasespiritualesestudiante" ||
         $_GET["ruta"] == "citaspsicologicaestudiante" ||
         $_GET["ruta"] == "estado" ||
         $_GET["ruta"] == "crudfamiliares" ||
         $_GET["ruta"] == "crudcitasgenerales" ||
         $_GET["ruta"] == "crudEstudiante" ||
         $_GET["ruta"] == "crudContenidoEconoEstudiante" ||
         $_GET["ruta"] == "crudRoles" ||
         $_GET["ruta"] == "objetos" ||
         $_GET["ruta"] == "procesoCargaAcademica" ||
         $_GET["ruta"] == "procesoBuscarCarga" ||
         $_GET["ruta"] == "procesoRegistrarEstudiante" ||
         $_GET["ruta"] == "procesoRegistrarFamiliares" ||
         $_GET["ruta"] == "crudFamiliaresEstudiantes" ||
         $_GET["ruta"] == "crudParentesco" ||
         $_GET["ruta"] == "Formbitacora" ||
         $_GET["ruta"] == "crudparametrosusuario" ||
         $_GET["ruta"] == "crudTutorias" ||
         $_GET["ruta"] == "crudTutoriasTutor" ||
         $_GET["ruta"] == "crudTutorEspiritual" ||
         $_GET["ruta"] == "inicioTutor" ||
         $_GET["ruta"] == "area" ||
         $_GET["ruta"] == "procesoPreClinica" ||
         $_GET["ruta"] == "crudPreClinica" ||
         $_GET["ruta"] == "procesoRecetaMedica" ||
         $_GET["ruta"] == "procesoExpedienteMedico" ||
         $_GET["ruta"] == "crudPacientesMedicos" ||
         $_GET["ruta"] == "crudPacientesPsicologicos" ||
         $_GET["ruta"] == "crudPacientesEspirituales" ||
         $_GET["ruta"] == "procesoExpedientePsicologico" ||
         $_GET["ruta"] == "procesoExpedienteEspiritual" ||
         $_GET["ruta"] == "Respaldo" ||
         $_GET["ruta"] == "RespaldoProsecar" ||
         $_GET["ruta"] == "RestauracionProsecar" ||
         $_GET["ruta"] == "crudmodalidad" ||
         $_GET["ruta"] == "crudtiposangre" ||
         $_GET["ruta"] == "procesoCitaspPreclinica" ||
         $_GET["ruta"] == "ProcesoCitasMedicos" ||
         $_GET["ruta"] == "ProcesoCitasPsicologicas" ||
         $_GET["ruta"] == "procesoCitasEspirituales" ||
         $_GET["ruta"] == "crudAlergias" ||
         $_GET["ruta"] == "crudmedicamento" ||
         $_GET["ruta"] == "crudrecetamedica" ||
         $_GET["ruta"] == "crudSacramentos" ||
         $_GET["ruta"] == "crudSeccion" ||
         $_GET["ruta"] == "expedienteMedico" ||
         $_GET["ruta"] == "expedientePsicologico" ||
         $_GET["ruta"] == "expedienteEspiritual" ||
         $_GET["ruta"] == "listadoTutoriasMatriculadas" ||
         $_GET["ruta"] == "crudCitasPsicologicas" ||
         $_GET["ruta"] == "crudPruebapsicometrica" ||
         $_GET["ruta"] == "mostrarPreguntasUsuarios" ||
         $_GET["ruta"] == "categoria" ||
         $_GET["ruta"] == "crudPreguntasUsuarios" ||
         $_GET["ruta"] == "crudPermisos" ||
         $_GET["ruta"] == "crudpreguntas" ||
         $_GET["ruta"] == "procesoMatricula" ||
         $_GET["ruta"] == "procesoMatriculaEspiritual" ||
         $_GET["ruta"] == "crudMatricula" ||
         $_GET["ruta"] == "crudAlumnosMatricula" ||
         $_GET["ruta"] == "crudAlumnosCatequesis" ||
         $_GET["ruta"] == "crudtipopersona" ||
         $_GET["ruta"] == "crudParametros" ||
         $_GET["ruta"] == "crudCargaAcademica" ||

         $_GET["ruta"] == "matriculaestudiantes" ||

         $_GET["ruta"] == "crudCargaEspiritual" ||
         

         $_GET["ruta"] == "crudTranstornos" ||
         $_GET["ruta"] == "crudPersonaEspecialidad" ||
         $_GET["ruta"] == "crudExpedientePsicoUnico" ||
         $_GET["ruta"] == "crudContenidoEconomico" ||
         $_GET["ruta"] == "procesoPlanTerapeutico" ||
         $_GET["ruta"] == "procesoPlanTerapeuticoInforme" ||
         $_GET["ruta"] == "procesoconsultapsicologia" ||
         $_GET["ruta"] == "procesoConsultaEspiritual" ||
         $_GET["ruta"] == "crudinscripcioncita" ||
         $_GET["ruta"] == "procesocita" ||
         $_GET["ruta"] == "crudConsulta" ||
         $_GET["ruta"] == "procesoConsulta" ||
         $_GET["ruta"] == "crudconsultashistoricas" ||
         $_GET["ruta"] == "crudAparienciaFisica" ||
         $_GET["ruta"] == "citasestudiantes" ||
         $_GET["ruta"] == "crudExamenesMedicos" ||
         $_GET["ruta"] == "crudsintomasneuroticos" ||
         $_GET["ruta"] == "crudPermisos"){

      include_once "modulos/".$_GET["ruta"].".php";

    }else {
      include "modulos/inicioadmin.php";
    }

  }else{
    include "modulos/inicioadmin.php";
  }
  echo '</div>';
  /*=============================================
  =           FOOTER                     =
  =============================================*/
  include "modulos/footer.php";
}else{
 ?>

 <body class="hold-transition sidebar-mini layout-fixed login-page register-page" >
 <?php
  include "Modulos/login.php";
}
?>

    </div>

    <!-- ./wrapper -->
    <script src="vistas/assets/dist/js/demo.js"></script>

    <script>
      function cargarContenido(contenedor,contenido){
        $("."+contenedor).load(contenido);
      }
  </script>
 
 

<script>
  
  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": true, "autoWidth": false,
      "buttons": [                    
        {
            extend: 'excelHtml5',
            exportOptions: {
            columns: [ 1, 2, 3, 4, 5, 6]
                }
        },  
        {
            extend: 'pdfHtml5',
            exportOptions: {
            columns: [ 1, 2, 3, 4, 5, 6 ]
                }
        },          
        {
            extend: 'print',
            exportOptions: {
            columns: [ 1, 2, 3, 4, 5, 6  ]
                }
        }
      ]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
  });
</script>








<script>
  $('.editbtn').on('click',function(){
    $tr = $(this).closest('tr');
    var datos  = $tr.children('td').map(function(){
    return $(this).text();  
    });

    $('#edit_id').val(datos[1]);
    $('#nombre_edit').val(datos[2]);
    $('#descripcion_edit').val(datos[4]);
  });
</script>

<script>
  $('.deletebtn').on('click',function(){
    $tr = $(this).closest('tr');
    var datos  = $tr.children('td').map(function(){
    return $(this).text();  
    });

    $('#delete_id').val(datos[1]);
  });
</script>

<script>
  $('.incrementbtn').on('click',function(){
    $tr = $(this).closest('tr');
    var datos  = $tr.children('td').map(function(){
    return $(this).text();  
    });
    $('#increment_id').val(datos[1]);
    $('#nombre_increment').val(datos[2]);
  });
</script>
<script type="text/javascript">
  
  $( function() {
    $("#cbx_persona").change( function() {
        if ($(this).val() === "2") {
           document.getElementById("c").style.display="block";
        } else {
            document.getElementById("c").style.display="none";
        }
    });
});
</script>


</script>
<script type="text/javascript"> function solonumeros(e) {
       tecla = (document.all) ? e.keyCode : e.which;
       if (tecla==8) return true;
       else if (tecla==0||tecla==9)  return true;
          // patron =/[0-9\s]/;// -> solo letras
          patron =/[0-9\s]/;// -> solo numeros
          te = String.fromCharCode(tecla);
          return patron.test(te);
        }
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
function soloNumeros_tel(e)
{
        // capturamos la tecla pulsada
        var teclaPulsada=window.event ? window.event.keyCode:e.which;
        // capturamos el contenido del input
        var valor=document.getElementById("tele").value;

        if(valor.length<9)
        {
            // 13 = tecla enter
            // Si el usuario pulsa la tecla enter o el punto y no hay ningun otro
            // punto
            if(teclaPulsada==9)
            {
              return true;
            }

            // devolvemos true o false dependiendo de si es numerico o no
            return /\d/.test(String.fromCharCode(teclaPulsada));
          }else{
            return false;
          }
        }
      </script>
      <script type="text/javascript">

        function quitarespacios(e) {

          var cadena =  e.value;
          cadena = cadena.trim();

          e.value = cadena;

        };

      </script>
      <script type="text/javascript">
  
  function mayus(e) {
    e.value = e.value.toUpperCase();
}
</script>
  <script type="text/javascript">

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

  </script>

  <script type="text/javascript">

    function quitarespacios(e) {

      var cadena =  e.value;
      cadena = cadena.trim();

      e.value = cadena;

    };

  </script>
  <script>
    function mostrarpassword (){
      var cambio = document.getElementById("ingPassword");
      if(cambio.type == "password"){
        cambio.type = "text";
        $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
      }else{
        cambio.type = "password";
        $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
      }        
    }

  </script> 
  <script>
  $(function () {
    //Initialize Select2 Elements
     $('.select2').select2()

    //Initialize Select2 Elements
    $('.select2bs4').select2({
      theme: 'bootstrap4'
    })   

    

    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
    //Datemask2 mm/dd/yyyy
    $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
    //Money Euro
    $('[data-mask]').inputmask()

    //Date picker
    $('#reservationdate').datetimepicker({
        format: 'L'
    });

    //Date and time picker
    $('#reservationdatetime').datetimepicker({ icons: { time: 'far fa-clock' } });

    //Date range picker
    $('#reservation').daterangepicker()
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({
      timePicker: true,
      timePickerIncrement: 30,
      locale: {
        format: 'MM/DD/YYYY hh:mm A'
      }
    })
    //Date range as a button
    $('#daterange-btn').daterangepicker(
      {
        ranges   : {
          'Today'       : [moment(), moment()],
          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        startDate: moment().subtract(29, 'days'),
        endDate  : moment()
      },
      function (start, end) {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
      }
    )

    //Timepicker
    $('#timepicker').datetimepicker({
      format: 'LT'
    })

    //Bootstrap Duallistbox
    $('.duallistbox').bootstrapDualListbox()

    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    //color picker with addon
    $('.my-colorpicker2').colorpicker()

    $('.my-colorpicker2').on('colorpickerChange', function(event) {
      $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
    })

    $("input[data-bootstrap-switch]").each(function(){
      $(this).bootstrapSwitch('state', $(this).prop('checked'));
    })

  })
  // BS-Stepper Init
  document.addEventListener('DOMContentLoaded', function () {
    window.stepper = new Stepper(document.querySelector('.bs-stepper'))
  })

  // DropzoneJS Demo Code Start
  Dropzone.autoDiscover = false

  // Get the template HTML and remove it from the doumenthe template HTML and remove it from the doument
  var previewNode = document.querySelector("#template")
  previewNode.id = ""
  var previewTemplate = previewNode.parentNode.innerHTML
  previewNode.parentNode.removeChild(previewNode)

  var myDropzone = new Dropzone(document.body, { // Make the whole body a dropzone
    url: "/target-url", // Set the url
    thumbnailWidth: 80,
    thumbnailHeight: 80,
    parallelUploads: 20,
    previewTemplate: previewTemplate,
    autoQueue: false, // Make sure the files aren't queued until manually added
    previewsContainer: "#previews", // Define the container to display the previews
    clickable: ".fileinput-button" // Define the element that should be used as click trigger to select files.
  })

  myDropzone.on("addedfile", function(file) {
    // Hookup the start button
    file.previewElement.querySelector(".start").onclick = function() { myDropzone.enqueueFile(file) }
  })

  // Update the total progress bar
  myDropzone.on("totaluploadprogress", function(progress) {
    document.querySelector("#total-progress .progress-bar").style.width = progress + "%"
  })

  myDropzone.on("sending", function(file) {
    // Show the total progress bar when upload starts
    document.querySelector("#total-progress").style.opacity = "1"
    // And disable the start button
    file.previewElement.querySelector(".start").setAttribute("disabled", "disabled")
  })

  // Hide the total progress bar when nothing's uploading anymore
  myDropzone.on("queuecomplete", function(progress) {
    document.querySelector("#total-progress").style.opacity = "0"
  })

  // Setup the buttons for all transfers
  // The "add files" button doesn't need to be setup because the config
  // `clickable` has already been specified.
  document.querySelector("#actions .start").onclick = function() {
    myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED))
  }
  document.querySelector("#actions .cancel").onclick = function() {
    myDropzone.removeAllFiles(true)
  }
  // DropzoneJS Demo Code End
</script>

</body>
</html>