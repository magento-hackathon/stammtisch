jQuery(document).ready(function() {
    jQuery('#add_speaker').click(function(){
        var id = jQuery('select#ja_speakers').val();
        var text = jQuery('select#ja_speakers option:selected').text();
        if(jQuery('#associated_speakers input[type=hidden][value=' + id + ']').size() == 0)
            jQuery('#associated_speakers').append(
                '<div><span>' + text + '</span><input type="hidden" name="associated_speakers[]" value="' + id + '" /><input type="button" class="remove_speaker" value=" - " /></div>'
                );
    });
    
    jQuery('.remove_speaker').live('click', function(){
        jQuery(this).parent().remove();
    });
});