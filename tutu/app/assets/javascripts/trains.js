$(document).on('turbolinks:load', function() {
    $('.edit-train').click(function(e) {
        e.preventDefault();
        var edit = $(this);
        var train_id = edit.data('trainId');
        var form = $('#edit_train_' + train_id);
        var number = $('#number-train-' + train_id);

        if (!edit.hasClass('cancel')) {
            edit.html('Отмена');
            edit.addClass('cancel');
        } else {
            edit.html('Редактировать');
            edit.removeClass('cancel');
        }

        form.toggle();
        number.toggle();
    });
});