$(document).on('turbolinks:load', function() {
    $('.search-form').submit(function() {
        var depart_station = $(this).find('#stations_first_station_id')
        var arrive_station = $(this).find('#stations_last_station_id')

        if (depart_station.val() == arrive_station.val()) {
            alert('Выберите конечную станцию');
            return false;
        }
    });
});