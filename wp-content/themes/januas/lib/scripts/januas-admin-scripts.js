jQuery(document).ready(function() {
    
    jQuery('#januas-check-address').bind('click', function(){
        var address = jQuery('input[name="januas_map_address"]').val();
        if(jQuery.trim(address) != ''){
            var geocoder = new google.maps.Geocoder();
            var options = {
                backgroundColor: '#EAEAEA',
                mapTypeControl: false,
                zoom: 11,
                streetViewControl: false,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            }
            var map = new google.maps.Map(document.getElementById('januas_map_preview'), options);
        
            geocoder.geocode({
                'address': address
            }, function(results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    map.setCenter(results[0].geometry.location);
                    var marker = new google.maps.Marker({
                        map: map, 
                        position: results[0].geometry.location
                    });
                } else {
                    alert("Geocode was not successful for the following reason: " + status);
                }
            });
        }
    });
    
    jQuery('#januas_images .button-update, #januas_files .button-update').on('click', function(event) {
        bindUpdate(jQuery(this));
    });
    
    jQuery('span.button-remove').on('click', function(event) {	
        bindDelete(jQuery(this));
    });
        
    jQuery('#januas-check-address').click();
    
});

function bindUpdate(ctl){
    var parent = jQuery('form#post input#post_ID').prop('value');
    var gallery_type = jQuery(ctl).attr('rel');
    var data = {
        action: 'refresh_gallery',
        parent: parent,
        type:  gallery_type
    };

    jQuery.post(ajaxurl, data, function(response) {
        var obj;
        try {
            obj = jQuery.parseJSON(response);
        }
        catch(e) {
        }

        if(obj.success === true) {
            var parentDiv = gallery_type == 'image' ? 'januas_images' : 'januas_files';
            jQuery('div#' + parentDiv).find('div.gallery-wrapper').replaceWith(obj.gallery);
            jQuery('div#' + parentDiv).find('div.gallery-wrapper').find('span.button-remove').on('click', function(){
                bindDelete(jQuery(this));
            });
        }
    });
}
    
function bindDelete(ctl){
    var image = jQuery(ctl).attr('rel');
    var parent = jQuery('form#post input#post_ID').prop('value');
    var gallery_type = jQuery(ctl).hasClass('file-remove') ? 'file' : 'image';
    var data = {
        action: 'gallery_item_remove',
        image: image,
        parent: parent,
        type: gallery_type
    };

    jQuery.post(ajaxurl, data, function(response) {
        var obj;
        try {
            obj = jQuery.parseJSON(response);
        }
        catch(e) {
        }
        if(obj.success === true) {
            var parentDiv = gallery_type == 'image' ? 'januas_images' : 'januas_files';
            jQuery('div#' + parentDiv).find('div.gallery-wrapper').replaceWith(obj.gallery);
            jQuery('div#' + parentDiv).find('div.gallery-wrapper').find('span.button-remove').on('click', function(){
                bindDelete(jQuery(this));
            });
        }
    });
}