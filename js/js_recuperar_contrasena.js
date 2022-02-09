$(document).ready(function() {
    $('#form_recuperar').submit(e => {
        let email = $('#email_recuperar').val();
        let usuario = $('#usuario_recuperar').val();

        if (email == '' || usuario == '') {


        } else {
            let funcion = 'verificar';
            $.post('../controlador/recuperacion_correo.php', { funcion, email, usuario }, (response) => {
                console.log(response);
            })


        }
        e.preventDefault(); //al tocarse el boton no va refrescar la pagina

    })
})