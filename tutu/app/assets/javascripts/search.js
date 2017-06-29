$(document).on('turbolinks:load', function() {
    $('.search-form').submit(function() {
        var departStation = $(this).find('#stations_first_station_id')
        var arriveStation = $(this).find('#stations_last_station_id')

        if (departStation.val() == arriveStation.val()) {
            alert('Выберите конечную станцию');
            return false;
        }
    });
});