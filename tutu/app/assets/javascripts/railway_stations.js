$(document).on('turbolinks:load', function() {
    $('a.edit-station').click(function(e) {
        e.preventDefault();
        var edit = $(this);
        var stationId = edit.data('stationId');
        var form = $('#edit_railway_station_' + stationId);
        var title = $('#station-title-' + stationId);
        var text = edit.hasClass('cancel') ? 'Редактировать' : 'Отмена';

        edit.html(text);
        edit.toggleClass('cancel');
        form.toggle();
        title.toggle();
    });
});