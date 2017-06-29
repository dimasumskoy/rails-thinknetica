$(document).on('turbolinks:load', function() {
    $('a.edit-route').click(function(e) {
        e.preventDefault();
        var edit = $(this);
        var routeId = edit.data('routeId');
        var form = $('#edit_route_' + routeId);
        var text = edit.hasClass('cancel') ? 'Редактировать' : 'Отмена';
        form.find('.name-field').hide();

        edit.html(text);
        edit.toggleClass('cancel');
        form.toggle();
    });
});