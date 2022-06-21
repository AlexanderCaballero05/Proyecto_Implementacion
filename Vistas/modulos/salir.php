<?php


                $codigoObjeto = 54;
                $accion = 'CERRAR SESIÓN';
                $descripcion = 'USUARIO CERRÓ SESIÓN';
                bitacora($codigoObjeto, $accion, $descripcion);

session_destroy();
echo '<script> 
window.location = "login";
</script>'; 
?>