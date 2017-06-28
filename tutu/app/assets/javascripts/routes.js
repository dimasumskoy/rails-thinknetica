$(document).on('turbolinks:load', function() {
    $('.edit-route').click(function(e) {
        e.preventDefault();
        var edit = $(this);
        var route_id = edit.data('routeId');
        var form = $('#edit_route_' + route_id);
        form.find('.name-field').hide();

        if (!edit.hasClass('cancel')) {
            edit.html('Отмена');
            edit.addClass('cancel');
        } else {
            edit.html('Редактировать');
            edit.removeClass('cancel');
        }

        form.toggle();
    });
});