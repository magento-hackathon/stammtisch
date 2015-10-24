jQuery(function() {
    jQuery("#event-date-start").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: wp_date_format,
        altFormat: '@',
        onSelect: function(dateText, inst) {
            var epoch = (jQuery.datepicker.formatDate('@', jQuery(this).datepicker('getDate')) / 1000) + (60 * 60 * 24);
            jQuery('#event-timestamp-start').val(epoch);
        }
    }).blur(function(){
        var epoch = '';
        var date =  jQuery(this).datepicker('getDate');
        if(date)
            epoch = jQuery.datepicker.formatDate('@', epoch) / 1000 + (60 * 60 * 24);
        jQuery('#event-timestamp-start').val(epoch);
    });
    
    jQuery("#event-date-end").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: wp_date_format,
        altFormat: '@',
        onSelect: function(dateText, inst) {
            var epoch = (jQuery.datepicker.formatDate('@', jQuery(this).datepicker('getDate')) / 1000) + (60 * 60 * 24);
            jQuery('#event-timestamp-end').val(epoch);
        }
    }).blur(function(){
        var epoch = '';
        var date =  jQuery(this).datepicker('getDate');
        if(date)
            epoch = jQuery.datepicker.formatDate('@', epoch) / 1000 + (60 * 60 * 24);
        jQuery('#event-timestamp-end').val(epoch);
    });;
    
    jQuery('#advanced_search h4').toggle(function(){
        jQuery(this).next().slideUp('slow');
    }, function(){
        jQuery(this).next().slideDown('slow');
    });
});