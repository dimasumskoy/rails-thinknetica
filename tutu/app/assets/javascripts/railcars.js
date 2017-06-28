$(document).on('turbolinks:load', function() {
    $('.field').hide();
    $('select').change(function() {
        var type = $(this).val().toLowerCase();
        $('.field').hide();
        $('div.' + type).show();
    });
});