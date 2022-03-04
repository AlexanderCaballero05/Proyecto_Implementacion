<?php

class ControladorPersonas
{

    /*=============================================
=            INGRESO DE PERSONAS              =
=============================================*/

    static public function ctrIngresoPersona()
    {

        if (isset($_POST["ADD_PERSONA"])) {

            include "conn.php";

            $p_nombre = $_POST["p_nombre"];
            $s_nombre = $_POST["s_nombre"];
            $p_apellido = $_POST["p_apellido"];
            $s_apellido = $_POST["s_apellido"];
            $dni = $_POST["dni"];
            $sexo = $_POST["sexo"];
            $f_nacimiento = $_POST["f_nacimiento"];
            $lugar_n = $_POST["lugar_n"];
            $fechaactual = strtotime(date("d-m-Y H:i:00", time()));


            //  $queryregistrarp = "INSERT INTO tbl_persona(PRIMER_NOMBRE,SEGUNDO_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,DNI, FECHA_NACIMIENTO,LUGAR_NACIMIENTO, FECHA_INSCRIPCION, CODIGO_TIPO_PERSONA, CREADO_POR_USUARIO, FECHA_CREACION, FECHA_MODIFICACION, SEXO)
            //  VALUES('$primer_nombre','$segundo_nombre','$primer_apellido','$segundo_apellido','$identidad','$fecha_nacimiento','$lugar_nacimiento', '$fechaActual','$tipo_persona','NO DEFINIDO', '$fechaActual','NO DEFINIDO','$sexo')";
            //  $resultado=$conn->query($queryregistrarp);


            $queryregistrarp = "INSERT INTO tbl_persona(PRIMER_NOMBRE,SEGUNDO_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,DNI, FECHA_NACIMIENTO,LUGAR_NACIMIENTO,SEXO,CODIGO_TIPO_PERSONA)
        VALUES('$p_nombre','$s_nombre','$p_apellido','$s_apellido','$dni','$f_nacimiento','$lugar_n','$sexo',1)";
            $resultado = mysqli_query($conn, $queryregistrarp);
            if ($resultado) {
                echo '<script>
       
        Swal.fire({
            position: "top-end",
            icon: "success",
            title: "Creado correctamente",
            showConfirmButton: false,
            timer: 1500
          })
               </script>';
            } else {
                echo '<script>
       
        Swal.fire({
            position: "top-end",
            icon: "danger",
            title: "Ocurrio un error comuniquese con el administrador",
            showConfirmButton: false,
            timer: 1500
          })
               </script>';
            }
        }
    }

    /*=============================================
=            EDICION DE PERSONA              =
=============================================*/

    static function ctrEditarPersona()
    {

        //EDITAR PERSONA
        if (isset($_POST["EDIT_PERSONA"])) {

            include "conn.php";

            $cod = $_POST['cod_persona'];
            $p_nombre = $_POST["p_nombre"];
            $s_nombre = $_POST["s_nombre"];
            $p_apellido = $_POST["p_apellido"];
            $s_apellido = $_POST["s_apellido"];
            $dni = $_POST["dni"];
            $sexo = $_POST["sexo"];
            $f_nacimiento = $_POST["f_nacimiento"];
            $lugar_n = $_POST["lugar_n"];
            $fechaactual = strtotime(date("d-m-Y H:i:00", time()));

            $queryregistrarp = "UPDATE tbl_persona 
     SET PRIMER_NOMBRE ='$p_nombre',SEGUNDO_NOMBRE='$s_nombre',PRIMER_APELLIDO ='$p_apellido',SEGUNDO_APELLIDO='$s_apellido',DNI='$dni',
     FECHA_NACIMIENTO = '$f_nacimiento',LUGAR_NACIMIENTO='$lugar_n',SEXO='$sexo',CODIGO_TIPO_PERSONA = 1 WHERE CODIGO_PERSONA = '$cod'";
            $resultado = mysqli_query($conn, $queryregistrarp);

            echo '<script>
   
   Swal.fire({
       type: "success",
       title: "!Persona editada correctamente!",
       showConfirmButton: "true",
       confirmButtonText: "cerrar",
       closeOnConfirm: "false",
       background:"rgb(245, 245, 245)"
   
       }).then((result)=>{});
      </script>';
        }
    }

    /*--=====================================
  =            ELIMINAR PERSONA             =
  ======================================--*/


    static function ctrEliminarPersona()
    {

        //EDITAR PERSONA
        if (isset($_POST["ELIMINAR_PERSONA"])) {

            include "conn.php";

            $cod = $_POST['cod_persona'];

            $queryregistrarp = "DELETE FROM tbl_persona WHERE CODIGO_PERSONA = '$cod'";
            $resultado = mysqli_query($conn, $queryregistrarp);

            echo '<script>
   
    Swal.fire(
        "Good job!",
        "You clicked the button!",
        "success"
      )
      </script>';
        }
    }
}
