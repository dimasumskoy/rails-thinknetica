$(document).on('turbolinks:load', function() {
    $('a.edit-station').click(function(e) {
        e.preventDefault();
        var edit = $(this);
        var station_id = edit.data('stationId');
        var form = $('#edit_railway_station_' + station_id);
        var title = $('#station_title_' + station_id);

        if (!edit.hasClass('cancel')) {
            edit.html('Отмена');
            edit.addClass('cancel');
        } else {
            edit.html('Редактировать');
            edit.removeClass('cancel');
        }

        form.toggle();
        title.toggle();
    });
});