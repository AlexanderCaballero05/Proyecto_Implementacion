const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('#formulario input');

const expresiones = {
	clave_nueva: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]/
}

const campos = {
	clave_nueva: false,
}
const validarFormulario = (e) => {
	switch (e.target.name) {
		case "clave_nueva":
			validarCampo(expresiones.clave_nueva, e.target, 'clave_nueva');
			validarPassword2();
		break;
		case "confirmar_clave":
			validarPassword2();
		break;
	}
}
const validarCampo = (expresion, input, campo) => {
	if(expresion.test(input.value)){
		document.getElementById(`grupo__${campo}`).classList.remove('formulario__grupo-incorrecto');
		document.getElementById(`grupo__${campo}`).classList.add('formulario__grupo-correcto');
		document.querySelector(`#grupo__${campo} .formulario__input-error`).classList.remove('formulario__input-error-activo');
		campos[campo] = true;
	} else {
		document.getElementById(`grupo__${campo}`).classList.add('formulario__grupo-incorrecto');
		document.getElementById(`grupo__${campo}`).classList.remove('formulario__grupo-correcto');
		document.querySelector(`#grupo__${campo} .formulario__input-error`).classList.add('formulario__input-error-activo');
		campos[campo] = false;
	}
}

const validarPassword2 = () => {
	const inputPassword1 = document.getElementById('clave_nueva');
	const inputPassword2 = document.getElementById('confirmar_clave');

	if(inputPassword1.value !== inputPassword2.value){
		document.getElementById(`grupo__confirmar_clave`).classList.add('formulario__grupo-incorrecto');
		document.getElementById(`grupo__confirmar_clave`).classList.remove('formulario__grupo-correcto');
		document.querySelector(`#grupo__confirmar_clave .formulario__input-error`).classList.add('formulario__input-error-activo');
		campos['clave_nueva'] = false;
	} else {
		document.getElementById(`grupo__confirmar_clave`).classList.remove('formulario__grupo-incorrecto');
		document.getElementById(`grupo__confirmar_clave`).classList.add('formulario__grupo-correcto');
		document.querySelector(`#grupo__confirmar_clave .formulario__input-error`).classList.remove('formulario__input-error-activo');
		campos['clave_nueva'] = true;
	}
}

inputs.forEach((input) => {
	input.addEventListener('keyup', validarFormulario);
	input.addEventListener('blur', validarFormulario);
});





