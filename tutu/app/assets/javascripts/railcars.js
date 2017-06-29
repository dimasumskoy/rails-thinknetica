$(document).on('turbolinks:load', function() {
    $('select').change(function() {
        var type = $(this).val().toLowerCase();
        $('form > div.field').not('.' + type).hide();
        $('div.' + type).show();
    });
});