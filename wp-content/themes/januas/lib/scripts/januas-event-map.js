jQuery(function(){
    var geocoder = new google.maps.Geocoder();
    var options = {
        backgroundColor: '#EAEAEA',
        mapTypeControl: false,
        zoom: 11,
        streetViewControl: false,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map(document.getElementById('map'), options);
        
    geocoder.geocode({
        'address': januas_map_address
    }, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
                map: map, 
                position: results[0].geometry.location
            });
        }
    });
});