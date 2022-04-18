var isSubmitting = false

$(document).ready(function() {
    $('form').submit(function() {
        isSubmitting = true
    })

    $('form').data('initial-state', $('form').serialize());

    $(window).on('beforeunload', function() {
        if (!isSubmitting && $('form').serialize() != $('form').data('initial-state')) {
            return 'You have unsaved changes which will not be saved.'
        }
    });
})