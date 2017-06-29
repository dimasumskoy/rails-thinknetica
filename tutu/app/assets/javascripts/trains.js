$(document).on('turbolinks:load', function() {
    $('a.edit-train').click(function(e) {
        e.preventDefault();
        var edit = $(this);
        var trainId = edit.data('trainId');
        var form = $('#edit_train_' + trainId);
        var number = $('#number-train-' + trainId);
        var text = edit.hasClass('cancel') ? 'Редактировать' : 'Отмена';

        edit.html(text);
        edit.toggleClass('cancel');
        form.toggle();
        number.toggle();
    });
});