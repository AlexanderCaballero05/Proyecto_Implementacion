window.addEventListener("beforeunload", function(e) {
    var confirmationMessage = "\o/";

    (e || window.event).returnValue = confirmationMessage; //Gecko + IE
    return confirmationMessage; //Webkit, Safari, Chrome
});


function window_mouseout(obj, evt, fn) {

    if (obj.addEventListener) {

        obj.addEventListener(evt, fn, false);
    } else if (obj.attachEvent) {

        obj.attachEvent('on' + evt, fn);
    }
}

window_mouseout(document, 'mouseout', event => {

    event = event ? event : window.event;

    var from = event.relatedTarget || event.toElement;

    // Si quieres que solo salga una vez el mensaje borra lo comentado
    // y así se guarda en localStorage

    // let leftWindow   = localStorage.getItem( 'leftWindow' ) || false;

    if ( /* !leftWindow  && */ (!from || from.nodeName === 'HTML')) {

        // Haz lo que quieras aquí
        alert('¿Quieres abandonar mi página?');
        // localStorage.setItem( 'leftWindow', true );
    }
});