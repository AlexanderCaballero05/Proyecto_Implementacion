<?php

class ControladorObjetos
{

    /*=============================================
=            INGRESO DE PERSONAS              =
=============================================*/

    static public function ctrIngresoObjeto()
    {

        if (isset($_POST["ADD_OBJETO"])) {

            include "conn.php";

            $nombre = $_POST["nombre"];
            $descripcion = $_POST["descripcion"];

            $fechaactual = strtotime(date("d-m-Y H:i:00", time()));
            $queryregistrarp = "INSERT INTO tbl_objetos(NOMBRE,DESCRIPCION,CREADO_POR_USUARIO,FECHA_CREACION) VALUES('$nombre','$descripcion','any',NOW())";
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

    static function ctrEditarObjeto()
    {

        //EDITAR PERSONA
        if (isset($_POST["EDIT_OBJETO"])) {

            include "conn.php";

            $cod = $_POST['cod_objeto'];
            $nombre = $_POST["nombre"];
            $descripcion = $_POST["descripcion"];
      

            $queryregistrarp = "UPDATE tbl_objetos SET NOMBRE='$nombre',DESCRIPCION = '$descripcion',MODIFICADO_POR = 'any' ,FECHA_MODIFICACION = NOW() WHERE CODIGO_OBJETO = '$cod'";
            $resultado = mysqli_query($conn, $queryregistrarp);

            echo '<script>
   
   Swal.fire({
       type: "success",
       title: "!Editado correctamente!",
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


    static function ctrEliminarObjeto()
    {

        //EDITAR PERSONA
        if (isset($_POST["ELIMINAR_OBJETO"])) {

            include "conn.php";

            $cod = $_POST['cod_objeto'];

            $queryregistrarp = "DELETE FROM tbl_objetos WHERE CODIGO_OBJETO = '$cod'";
            $resultado = mysqli_query($conn, $queryregistrarp);

            echo '<script>
   
    Swal.fire(
        "Good job!",
        "YEliminado correctamente!",
        "danger"
      )
      </script>';
        }
    }
}
