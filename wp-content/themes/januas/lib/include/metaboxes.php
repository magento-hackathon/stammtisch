<?php

add_filter('cmb_render_metaboxmenu', 'januas_register_metaboxmenu_field_type', 10, 2);



function januas_register_metaboxmenu_field_type($field, $meta) {

    ?>

    <ul>

        <li><a href="#januas_speakers"><?php _e('Speakers', 'januas'); ?></a></li>

        <li><a href="#januas_otherinfo"><?php _e('More', 'januas'); ?></a></li>

        <li><a href="#januas_eventdata"><?php _e('Event information', 'januas'); ?></a></li>

        <li><a href="#januas_schedule"><?php _e('Schedule', 'januas'); ?></a></li>

        <li><a href="#januas_registration"><?php _e('Register', 'januas'); ?></a></li>

        <li><a href="#januas_video"><?php _e('Video', 'januas'); ?></a></li>

        <li><a href="#januas_sponsor"><?php _e('Sponsor', 'januas'); ?></a></li>

        <li><a href="#januas_map"><?php _e('Map', 'januas'); ?></a></li>

        <li><a href="#januas_files"><?php _e('Files', 'januas'); ?></a></li>

        <li><a href="#januas_images"><?php _e('Pictures', 'januas'); ?></a></li>        

        <li><a href="#januas_social"><?php _e('Social Box', 'januas'); ?></a></li>

    </ul>

    <?php

}



add_filter('cmb_render_backtotop', 'januas_register_backtotop_field_type', 10, 2);



function januas_register_backtotop_field_type($field, $meta) {

    echo '<a href="#januas_metaboxesmenu">' . __('Back to top', 'januas') . '</a>';

}



add_filter('cmb_render_event_speakers', 'januas_register_event_speakers_field_type', 10, 2);



function januas_register_event_speakers_field_type($field, $meta) {

    global $post;

    $speakers_order = get_post_meta($post->ID, 'januas_speakers_speakersorder', true);

    $speakers_ids = array();

    $sessions = get_posts(

            array(

                'post_type' => 'ja-session',

                'post_status' => array('publish'),

                'nopaging' => true,

                'meta_key' => 'januas_session_date',

                'orderby' => 'meta_value',

                'order' => 'ASC',

                'meta_query' => array(

                    array(

                        'key' => 'januas_session_event',

                        'value' => $post->ID

                    )

                )

            ));

    foreach ($sessions as $session)

        $speakers_ids = array_merge($speakers_ids, get_post_meta($session->ID, 'januas_speakers_list'));

    if (count($speakers_ids) > 0) {

        echo('<ul>');

        $speakers_array = get_posts(array('post_type' => 'ja-speaker', 'post_status' => 'publish', 'post__in' => $speakers_ids, 'nopaging' => true));

        foreach ($speakers_array as $speaker_item) {

            $speaker_order = isset($speakers_order[$speaker_item->ID]) ? $speakers_order[$speaker_item->ID]['order'] : 0;

            $speaker_hide = isset($speakers_order[$speaker_item->ID]) && isset($speakers_order[$speaker_item->ID]['hide']) ? 'checked="checked"' : '';

            ?>

            <li>

                <span style="display:inline-block;width:150px;">

                    <?php echo get_the_title($speaker_item->ID); ?>

                </span>

                <input type="text" name="januas_speakers_speakersorder[<?php echo $speaker_item->ID; ?>][order]" style="width:50px;" value="<?php echo $speaker_order; ?>" />

                <input type="checkbox" name="januas_speakers_speakersorder[<?php echo $speaker_item->ID; ?>][hide]" value="1" <?php echo $speaker_hide; ?> /><label><?php _e('Hide', 'januas'); ?></label>

            </li>

            <?php

        }

        echo('</ul>');

    }

}



add_filter('cmb_render_sessions', 'januas_register_sessions_field_type', 10, 2);



function januas_register_sessions_field_type($field, $meta) {

    global $post;



    $selected = get_post_meta($post->ID, 'januas_schedule_sessions', true);

    wp_dropdown_categories(array('taxonomy' => 'ja-session-category', 'hide_empty' => false, 'show_option_none' => __('Select grouping', 'januas'), 'hierarchical' => 1, 'name' => 'januas_schedule_sessions', 'selected' => $selected));

}



add_filter('cmb_render_text_video_url', 'januas_register_text_video_url_field_type', 10, 2);



function januas_register_text_video_url_field_type($field, $meta) {

    if ($meta && trim($meta) != '')

        $embed = wp_oembed_get($meta, array('width' => 320, 'height' => 195));

    if ($embed === false)

        $embed = '';

    echo '<input type="text" class="cmb_text_medium" name="', $field['id'], '" id="', $field['id'], '" value="', $meta ? $meta : $field['std'], '" />', '<p class="cmb_metabox_description">', $field['desc'], '</p>', '<div class="cmb_metabox_video_preview">', $embed, '</div>';

}



add_filter('cmb_render_empty_div', 'januas_register_empty_div_field_type', 10, 2);



function januas_register_empty_div_field_type($field, $meta) {

    echo "<div id='{$field['id']}'></div>";

}



add_filter('cmb_render_text_check_map', 'januas_register_text_check_map_field_type', 10, 2);



function januas_register_text_check_map_field_type($field, $meta) {

    echo '<input type="text" class="cmb_text_medium" name="', $field['id'], '" id="', $field['id'], '" value="', $meta ? $meta : $field['std'], '" />', '<a id="januas-check-address" class="button">', __('Check address', 'januas'), '</a>', '<p class="cmb_metabox_description">', $field['desc'], '</p>';

}



add_filter('cmb_render_image_gallery', 'januas_register_image_gallery_field_type', 10, 2);



function januas_register_image_gallery_field_type($field, $meta) {

    global $post;



    $original_post = $post;

    $return = '';



    $intro = '<p class="metabox-links">';

    $intro .= __('Warning! If you add a file that is not an image, it will be shown in the "Files" section', 'januas') . '<br/>';

    $intro .= '<a href="media-upload.php?post_id=' . $post->ID . '&amp;type=image&amp;TB_iframe=1&amp;width=640&amp;height=715" id="add_image" class="button thickbox button-secondary" title="' . __('Add Image', 'januas') . '">' . __('Upload Images', 'januas') . '</a>';

    $intro .= '<a href="media-upload.php?post_id=' . $post->ID . '&amp;type=image&amp;tab=gallery&amp;TB_iframe=1&amp;width=640&amp;height=715" id="manage_gallery" class="thickbox button button-secondary" title="' . __('Manage Gallery', 'januas') . '">' . __('Manage Gallery', 'januas') . '</a>';

    $intro .= '<input id="update-gallery" class="button button-secondary button-update" type="button" value="' . __('Update Gallery', 'januas') . '" rel="image" /></p>';

    $return .= $intro;

    $loop = januas_gallery_items($post->ID, 'image');

    if (empty($loop))

        $return .= '<p>' . __('No images.', 'januas') . '</p>';

    $return .= januas_gallery_display($loop, 'image');

    $post = $original_post;



    echo $return;

}



add_filter('cmb_render_file_gallery', 'januas_register_file_gallery_field_type', 10, 2);



function januas_register_file_gallery_field_type($field, $meta) {

    global $post;

    $original_post = $post;

    $return = '';



    $intro = '<p class="metabox-links">';

    $intro .= __('Warning! If you add an image file, it will be shown in the "Pictures" section', 'januas') . '<br/>';

    $intro .= '<a href="media-upload.php?post_id=' . $post->ID . '&amp;type=file&amp;TB_iframe=1&amp;width=640&amp;height=715" id="add_file" class="button thickbox button-secondary" title="' . __('Add File', 'januas') . '">' . __('Upload File', 'januas') . '</a>';

    $intro .= '<a href="media-upload.php?post_id=' . $post->ID . '&amp;type=file&amp;tab=gallery&amp;TB_iframe=1&amp;width=640&amp;height=715" id="manage_files" class="thickbox button button-secondary" title="' . __('Manage Files', 'januas') . '">' . __('Manage Files', 'januas') . '</a>';

    $intro .= '<input id="update-files" class="button button-secondary button-update" type="button" value="' . __('Update Files', 'januas') . '" rel="file" />';

    $intro .= '<small>' . __('(doc, pdf, zip, rar, xls, txt)', 'januas') . '</small>';

    $intro .= '</p>';

    $return .= $intro;

    $loop = januas_gallery_items($post->ID, 'file');

    if (empty($loop))

        $return .= '<p>' . __('No files.', 'januas') . '</p>';

    $return .= januas_gallery_display($loop, 'file');

    $post = $original_post;



    echo $return;

}



add_filter('cmb_render_featured', 'januas_register_featured_field_type', 10, 2);



function januas_register_featured_field_type($field, $meta) {

    global $post;

    $disabled = '';

    $message = '';



    /*$featured_id = januas_get_featured_event();

    if ($featured_id !== 0 && $featured_id != $post->ID) {

        $disabled = 'disabled="disabled"';

        $message = sprintf(__('Warning! You cannot set this event as featured because there is <a href="%s">another event</a> with this status.', 'januas'), get_edit_post_link($featured_id));

    }*/



    echo '<select name="', $field['id'], '" id="', $field['id'], '"', $disabled, '>';

    foreach ($field['options'] as $option) {

        echo '<option value="', $option['value'], '"', $meta == $option['value'] ? ' selected="selected"' : '', '>', $option['name'], '</option>';

    }

    echo '</select>';

    echo '<p class="cmb_metabox_description">', $field['desc'], '<br/>', $message, '</p>';

}



add_filter('cmb_meta_boxes', 'januas_register_metaboxes');



function januas_register_metaboxes($meta_boxes) {



    $speakers_list_tmp = get_posts(array('post_type' => 'ja-speaker', 'post_status' => 'publish', 'suppress_filters' => false, 'posts_per_page' => -1, 'orderby' => 'title', 'order' => 'ASC'));

    $speakers_list = array();

    foreach ($speakers_list_tmp as $speaker) {

        $speakers_list[$speaker->ID] = $speaker->post_title;

    }

    $events_list_tmp = get_posts(array('post_type' => 'ja-event', 'post_status' => 'publish', 'suppress_filters' => false, 'posts_per_page' => -1, 'orderby' => 'title', 'order' => 'ASC'));

    $events_list = array();

    foreach ($events_list_tmp as $event) {

        $events_list[] = array('name' => $event->post_title, 'value' => $event->ID);

    }



    // menu

    $meta_boxes[] = array(

        'id' => 'januas_metaboxesmenu',

        'title' => __('Navigation', 'januas'),

        'pages' => array('ja-event'),

        'context' => 'normal',

        'priority' => 'high',

        'show_names' => false,

        'fields' => array(

            array(

                'name' => '',

                'desc' => '',

                'id' => 'januas_metaboxesmenu_menu',

                'type' => 'metaboxmenu'

            )

        ),

    );



    // event data

    $meta_boxes[] = array(

        'id' => 'januas_eventdata',

        'title' => __('Event information', 'januas'),

        'pages' => array('ja-event'),

        'context' => 'normal',

        'priority' => 'high',

        'show_names' => true,

        'fields' => array(

            array(

                'name' => __('Date', 'januas'),

                'desc' => __('Insert the event date', 'januas'),

                'id' => 'januas_eventdata_startdate',

                'type' => 'text_date_timestamp'

            ),

            array(

                'name' => __('Time', 'januas'),

                'desc' => __('Insert the event time (format: hh:mm, ex: 08:00)', 'januas'),

                'id' => 'januas_eventdata_starttime',

                'type' => 'text_small'

            ),

            array(

                'name' => __('City', 'januas'),

                'desc' => __('Insert the event\'s city name (ex: San Francisco)', 'januas'),

                'id' => 'januas_eventdata_city',

                'type' => 'text'

            ),

            array(

                'name' => __('Address', 'januas'),

                'desc' => __('Insert the event\'s address (ex: Moscone Center, 603 Red River St)', 'januas'),

                'id' => 'januas_eventdata_address',

                'type' => 'text'

            ),

            array(

                'name' => __('Price', 'januas'),

                'desc' => __('Insert a short information about ticket price (ex: tickets from $ 120)', 'januas'),

                'id' => 'januas_eventdata_ticketinfo',

                'type' => 'text'

            ),

            array(

                'name' => __('Status', 'januas'),

                'desc' => __('Select the event status', 'januas'),

                'id' => 'januas_eventdata_state',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Active', 'januas'), 'value' => 'active'),

                    array('name' => __('Sold Out', 'januas'), 'value' => 'soldout'),

                    array('name' => __('Ended', 'januas'), 'value' => 'ended'),

                )

            ),

            array(

                'name' => __('Featured', 'januas'),

                'desc' => __('Check to mark the event as featured. It will be shown in the top section of the home page.', 'januas'),

                'id' => 'januas_eventdata_featured',

                'type' => 'featured',

                'options' => array(

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                )

            ),

            array(

                'name' => __('Home Page', 'januas'),

                'desc' => __('Add this event to Home Page', 'januas'),

                'id' => 'januas_eventdata_homepage',

                'type' => 'select',

                'options' => array(

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                )

            ),

            array(

                'name' => __('Show Item Title', 'januas'),

                'desc' => __('Select Yes to show the "Description" box title, No to hide it.', 'januas'),

                'id' => 'januas_eventdata_showtitle',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Show in Top Menu', 'januas'),

                'desc' => __('Select Yes to show the "Description" menu item in the event page top menu, No to hide it.', 'januas'),

                'id' => 'januas_eventdata_showinmenu',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Show Related Events', 'januas'),

                'desc' => '',

                'id' => 'januas_eventdata_showrelated',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => '',

                'desc' => '',

                'id' => 'januas_eventdata_backtotop',

                'type' => 'backtotop'

            ),

        ),

    );



    // speakers

    $meta_boxes[] = array(

        'id' => 'januas_speakers',

        'title' => __('Speakers', 'januas'),

        'pages' => array('ja-event'),

        'context' => 'normal',

        'priority' => 'high',

        'show_names' => true,

        'fields' => array(

            array(

                'name' => __('Visible', 'januas'),

                'desc' => __('Select Yes to show the box in the event page, No to hide it.', 'januas'),

                'id' => 'januas_speakers_visible',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Position', 'januas'),

                'desc' => __('Select the preferred position for the box.', 'januas'),

                'id' => 'januas_speakers_position',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Main', 'januas'), 'value' => 'main'),

                    array('name' => __('Sidebar', 'januas'), 'value' => 'sidebar'),

                )

            ),

            array(

                'name' => __('Order', 'januas'),

                'desc' => __('Insert the box order (ex: 1).', 'januas'),

                'id' => 'januas_speakers_order',

                'std' => 1,

                'type' => 'text_small'

            ),

            array(

                'name' => __('Show Title', 'januas'),

                'desc' => __('Select Yes to show the box title, No to hide it.', 'januas'),

                'id' => 'januas_speakers_showtitle',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Show in Top menu', 'januas'),

                'desc' => __('Select Yes to show the menu item in the event page top menu, No to hide it.', 'januas'),

                'id' => 'januas_speakers_showinmenu',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Display order', 'januas'),

                'desc' => '',

                'id' => 'januas_speakers_speakersorder',

                'type' => 'event_speakers'

            ),

            array(

                'name' => '',

                'desc' => '',

                'id' => 'januas_speakers_backtotop',

                'type' => 'backtotop'

            )

        ),

    );



    // registration

    $meta_boxes[] = array(

        'id' => 'januas_registration',

        'title' => __('Register', 'januas'),

        'pages' => array('ja-event'),

        'context' => 'normal',

        'priority' => 'high',

        'show_names' => true,

        'fields' => array(

            array(

                'name' => __('Visible', 'januas'),

                'desc' => __('Select Yes to show the box in the event page, No to hide it.', 'januas'),

                'id' => 'januas_registration_visible',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Order', 'januas'),

                'desc' => __('Insert the box order (ex: 1).', 'januas'),

                'id' => 'januas_registration_order',

                'std' => 1,

                'type' => 'text_small'

            ),

            array(

                'name' => __('Show Title', 'januas'),

                'desc' => __('Select Yes to show the box title, No to hide it.', 'januas'),

                'id' => 'januas_registration_showtitle',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Show in Top menu', 'januas'),

                'desc' => __('Select Yes to show the menu item in the event page top menu, No to hide it.', 'januas'),

                'id' => 'januas_registration_showinmenu',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Registration script', 'januas'),

                'desc' => __('Drop an iframe from your registration service (ex: EventBrite).', 'januas'),

                'id' => 'januas_registration_script',

                'type' => 'textarea'

            ),

            array(

                'name' => '',

                'desc' => '',

                'id' => 'januas_registration_backtotop',

                'type' => 'backtotop'

            )

        ),

    );



    // schedule

    $meta_boxes[] = array(

        'id' => 'januas_schedule',

        'title' => __('Schedule', 'januas'),

        'pages' => array('ja-event'),

        'context' => 'normal',

        'priority' => 'high',

        'show_names' => true,

        'fields' => array(

            array(

                'name' => __('Visible', 'januas'),

                'desc' => __('Select Yes to show the box in the event page, No to hide it.', 'januas'),

                'id' => 'januas_schedule_visible',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Position', 'januas'),

                'desc' => __('Select the preferred position for the box.', 'januas'),

                'id' => 'januas_schedule_position',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Main', 'januas'), 'value' => 'main'),

                    array('name' => __('Sidebar', 'januas'), 'value' => 'sidebar'),

                )

            ),

            array(

                'name' => __('Order', 'januas'),

                'desc' => __('Insert the box order (ex: 1).', 'januas'),

                'id' => 'januas_schedule_order',

                'std' => 2,

                'type' => 'text_small'

            ),

            array(

                'name' => __('Show Title', 'januas'),

                'desc' => __('Select Yes to show the box title, No to hide it.', 'januas'),

                'id' => 'januas_schedule_showtitle',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Show in Top menu', 'januas'),

                'desc' => __('Select Yes to show the menu item in the event page top menu, No to hide it.', 'januas'),

                'id' => 'januas_schedule_showinmenu',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => '',

                'desc' => '',

                'id' => 'januas_schedule_backtotop',

                'type' => 'backtotop'

            )

        ),

    );



    // video

    $meta_boxes[] = array(

        'id' => 'januas_video',

        'title' => __('Videos', 'januas'),

        'pages' => array('ja-event'),

        'context' => 'normal',

        'priority' => 'high',

        'show_names' => true,

        'fields' => array(

            array(

                'name' => __('Visible', 'januas'),

                'desc' => __('Select Yes to show the box in the event page, No to hide it.', 'januas'),

                'id' => 'januas_video_visible',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Position', 'januas'),

                'desc' => __('Select the preferred position for the box.', 'januas'),

                'id' => 'januas_video_position',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Main', 'januas'), 'value' => 'main'),

                    array('name' => __('Sidebar', 'januas'), 'value' => 'sidebar'),

                )

            ),

            array(

                'name' => __('Order', 'januas'),

                'desc' => __('Insert the box order (ex: 1).', 'januas'),

                'id' => 'januas_video_order',

                'std' => 3,

                'type' => 'text_small'

            ),

            array(

                'name' => __('Show Title', 'januas'),

                'desc' => __('Select Yes to show the box title, No to hide it.', 'januas'),

                'id' => 'januas_video_showtitle',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Show in Top menu', 'januas'),

                'desc' => __('Select Yes to show the menu item in the event page top menu, No to hide it.', 'januas'),

                'id' => 'januas_video_showinmenu',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Video URL', 'januas'),

                'desc' => __('Insert the video url (ex: http://www.youtube.com/XXXXXXXXXXX).', 'januas'),

                'id' => 'januas_video_1',

                'type' => 'text_video_url'

            ),

            array(

                'name' => __('Video URL', 'januas'),

                'desc' => __('Insert the video url (ex: http://www.youtube.com/XXXXXXXXXXX).', 'januas'),

                'id' => 'januas_video_2',

                'type' => 'text_video_url'

            ),

            array(

                'name' => __('Video channel url', 'januas'),

                'desc' => __('Insert the url of your video channel (ex: http://www.youtube.com/user/XXXXXXXXXXX)', 'januas'),

                'id' => 'januas_eventdata_videochannel_url',

                'type' => 'text'

            ),

            array(

                'name' => __('Video channel url text', 'januas'),

                'desc' => __('Insert the text of your video channel url (ex: More videos)', 'januas'),

                'id' => 'januas_eventdata_videochannel_text',

                'type' => 'text'

            ),

            array(

                'name' => '',

                'desc' => '',

                'id' => 'januas_video_backtotop',

                'type' => 'backtotop'

            )

        )

    );



    // sponsor

    $meta_boxes[] = array(

        'id' => 'januas_sponsor',

        'title' => 'Sponsor',

        'pages' => array('ja-event'),

        'context' => 'normal',

        'priority' => 'high',

        'show_names' => true,

        'fields' => array(

            array(

                'name' => __('Visible', 'januas'),

                'desc' => __('Select Yes to show the box in the event page, No to hide it.', 'januas'),

                'id' => 'januas_sponsor_visible',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Position', 'januas'),

                'desc' => __('Select the preferred position for the box.', 'januas'),

                'id' => 'januas_sponsor_position',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Sidebar', 'januas'), 'value' => 'sidebar'),

                    array('name' => __('Main', 'januas'), 'value' => 'main'),

                )

            ),

            array(

                'name' => __('Order', 'januas'),

                'desc' => __('Insert the box order (ex: 1).', 'januas'),

                'id' => 'januas_sponsor_order',

                'std' => 1,

                'type' => 'text_small'

            ),

            array(

                'name' => __('Show Title', 'januas'),

                'desc' => __('Select Yes to show the box title, No to hide it.', 'januas'),

                'id' => 'januas_sponsor_showtitle',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Show in Top menu', 'januas'),

                'desc' => __('Select Yes to show the menu item in the event page top menu, No to hide it.', 'januas'),

                'id' => 'januas_sponsor_showinmenu',

                'type' => 'select',

                'options' => array(

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                )

            ),

            array(

                'name' => __('Image', 'januas'),

                'desc' => __('Upload an image or enter an URL.', 'januas'),

                'id' => 'januas_sponsor_image',

                'type' => 'file'

            ),

            array(

                'name' => 'Url',

                'desc' => __('Image link URL', 'januas'),

                'id' => 'januas_sponsor_url',

                'type' => 'text'

            ),

            array(

                'name' => '',

                'desc' => '',

                'id' => 'januas_sponsor_backtotop',

                'type' => 'backtotop'

            )

        )

    );



    // map

    $meta_boxes[] = array(

        'id' => 'januas_map',

        'title' => __('Map', 'januas'),

        'pages' => array('ja-event'),

        'context' => 'normal',

        'priority' => 'high',

        'show_names' => true,

        'fields' => array(

            array(

                'name' => __('Visible', 'januas'),

                'desc' => __('Select Yes to show the box in the event page, No to hide it.', 'januas'),

                'id' => 'januas_map_visible',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Position', 'januas'),

                'desc' => __('Select the preferred position for the box.', 'januas'),

                'id' => 'januas_map_position',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Sidebar', 'januas'), 'value' => 'sidebar'),

                    array('name' => __('Main', 'januas'), 'value' => 'main'),

                )

            ),

            array(

                'name' => __('Order', 'januas'),

                'desc' => __('Insert the box order (ex: 1).', 'januas'),

                'id' => 'januas_map_order',

                'std' => 2,

                'type' => 'text_small'

            ),

            array(

                'name' => __('Show Title', 'januas'),

                'desc' => __('Select Yes to show the box title, No to hide it.', 'januas'),

                'id' => 'januas_map_showtitle',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Show in Top menu', 'januas'),

                'desc' => __('Select Yes to show the menu item in the event page top menu, No to hide it.', 'januas'),

                'id' => 'januas_map_showinmenu',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Address', 'januas'),

                'desc' => __('Insert an address (with street number) and click to check it on the map.', 'januas'),

                'id' => 'januas_map_address',

                'type' => 'text_check_map'

            ),

            array(

                'name' => __('Map preview', 'januas'),

                'desc' => '',

                'id' => 'januas_map_preview',

                'type' => 'empty_div'

            ),

            array(

                'name' => __('Map Information', 'januas'),

                'desc' => __('Information text showing below the map.', 'januas'),

                'id' => 'januas_map_label',

                'type' => 'wysiwyg'

            ),

            array(

                'name' => '',

                'desc' => '',

                'id' => 'januas_map_backtotop',

                'type' => 'backtotop'

            )

        )

    );



    // file gallery

    $meta_boxes[] = array(

        'id' => 'januas_files',

        'title' => __('Files', 'januas'),

        'pages' => array('ja-event'),

        'context' => 'normal',

        'priority' => 'high',

        'show_names' => true,

        'fields' => array(

            array(

                'name' => __('Visible', 'januas'),

                'desc' => __('Select Yes to show the box in the event page, No to hide it.', 'januas'),

                'id' => 'januas_files_visible',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Position', 'januas'),

                'desc' => __('Select the preferred position for the box.', 'januas'),

                'id' => 'januas_files_position',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Sidebar', 'januas'), 'value' => 'sidebar'),

                    array('name' => __('Main', 'januas'), 'value' => 'main'),

                )

            ),

            array(

                'name' => __('Order', 'januas'),

                'desc' => __('Insert the box order (ex: 1).', 'januas'),

                'id' => 'januas_files_order',

                'std' => 3,

                'type' => 'text_small'

            ),

            array(

                'name' => __('Show Title', 'januas'),

                'desc' => __('Select Yes to show the box title, No to hide it.', 'januas'),

                'id' => 'januas_files_showtitle',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Show in Top menu', 'januas'),

                'desc' => __('Select Yes to show the menu item in the event page top menu, No to hide it.', 'januas'),

                'id' => 'januas_files_showinmenu',

                'type' => 'select',

                'options' => array(

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                )

            ),

            array(

                'name' => 'Add files',

                'desc' => '',

                'id' => 'januas_files_gallery',

                'type' => 'file_gallery'

            ),

            array(

                'name' => '',

                'desc' => '',

                'id' => 'januas_files_backtotop',

                'type' => 'backtotop'

            )

        )

    );



    // image gallery

    $meta_boxes[] = array(

        'id' => 'januas_images',

        'title' => __('Pictures', 'januas'),

        'pages' => array('ja-event'),

        'context' => 'normal',

        'priority' => 'high',

        'show_names' => true,

        'fields' => array(

            array(

                'name' => __('Visible', 'januas'),

                'desc' => __('Select Yes to show the box in the event page, No to hide it.', 'januas'),

                'id' => 'januas_images_visible',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Position', 'januas'),

                'desc' => __('Select the preferred position for the box.', 'januas'),

                'id' => 'januas_images_position',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Sidebar', 'januas'), 'value' => 'sidebar'),

                    array('name' => __('Main', 'januas'), 'value' => 'main'),

                )

            ),

            array(

                'name' => __('Order', 'januas'),

                'desc' => __('Insert the box order (ex: 1).', 'januas'),

                'id' => 'januas_images_order',

                'std' => 4,

                'type' => 'text_small'

            ),

            array(

                'name' => __('Show Title', 'januas'),

                'desc' => __('Select Yes to show the box title, No to hide it.', 'januas'),

                'id' => 'januas_images_showtitle',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Show in Top menu', 'januas'),

                'desc' => __('Select Yes to show the menu item in the event page top menu, No to hide it.', 'januas'),

                'id' => 'januas_images_showinmenu',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => '',

                'desc' => '',

                'id' => 'januas_images_gallery',

                'type' => 'image_gallery'

            ),

            array(

                'name' => '',

                'desc' => '',

                'id' => 'januas_images_backtotop',

                'type' => 'backtotop'

            )

        )

    );



    // social

    $meta_boxes[] = array(

        'id' => 'januas_social',

        'title' => __('Social Box', 'januas'),

        'pages' => array('ja-event'),

        'context' => 'normal',

        'priority' => 'high',

        'show_names' => true,

        'fields' => array(

            array(

                'name' => __('Visible', 'januas'),

                'desc' => __('Select Yes to show the box in the event page, No to hide it.', 'januas'),

                'id' => 'januas_social_visible',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Position', 'januas'),

                'desc' => __('Select the preferred position for the box.', 'januas'),

                'id' => 'januas_social_position',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Sidebar', 'januas'), 'value' => 'sidebar'),

                    array('name' => __('Main', 'januas'), 'value' => 'main'),

                )

            ),

            array(

                'name' => __('Order', 'januas'),

                'desc' => __('Insert the box order (ex: 1).', 'januas'),

                'id' => 'januas_social_order',

                'std' => 5,

                'type' => 'text_small'

            ),

            array(

                'name' => __('Show Title', 'januas'),

                'desc' => __('Select Yes to show the box title, No to hide it.', 'januas'),

                'id' => 'januas_social_showtitle',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Show in Top menu', 'januas'),

                'desc' => __('Select Yes to show the menu item in the event page top menu, No to hide it.', 'januas'),

                'id' => 'januas_social_showinmenu',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Facebook page url', 'januas'),

                'desc' => __('Ex.: http://www.facebook.com/platform', 'januas'),

                'id' => 'januas_social_pageurl',

                'type' => 'text'

            ),

            array(

                'name' => __('Show faces', 'januas'),

                'desc' => __('Show profile photos.', 'januas'),

                'id' => 'januas_social_faces',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'true'),

                    array('name' => __('No', 'januas'), 'value' => 'false'),

                )

            ),

            array(

                'name' => __('Color scheme', 'januas'),

                'desc' => __('Select the preferred color scheme.', 'januas'),

                'id' => 'januas_social_colorscheme',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Light', 'januas'), 'value' => 'light'),

                    array('name' => __('Dark', 'januas'), 'value' => 'dark'),

                )

            ),

            array(

                'name' => __('Show stream', 'januas'),

                'desc' => __('Show the profile stream for the public profile.', 'januas'),

                'id' => 'januas_social_stream',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'true'),

                    array('name' => __('No', 'januas'), 'value' => 'false'),

                )

            ),

            array(

                'name' => __('Border color', 'januas'),

                'desc' => __('The box border color', 'januas'),

                'id' => 'januas_social_bordercolor',

                'type' => 'text_small'

            ),

            array(

                'name' => __('Show header', 'januas'),

                'desc' => __('Show the \'Find us on Facebook\' bar at top. Only shown when either stream or faces are present.', 'januas'),

                'id' => 'januas_social_header',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'true'),

                    array('name' => __('No', 'januas'), 'value' => 'false'),

                )

            ),

            array(

                'name' => '',

                'desc' => '',

                'id' => 'januas_social_backtotop',

                'type' => 'backtotop'

            )

        )

    );



    // otherinfo

    $meta_boxes[] = array(

        'id' => 'januas_otherinfo',

        'title' => __('More', 'januas'),

        'pages' => array('ja-event'),

        'context' => 'normal',

        'priority' => 'high',

        'show_names' => true,

        'fields' => array(

            array(

                'name' => __('Visible', 'januas'),

                'desc' => __('Select Yes to show the box in the event page, No to hide it.', 'januas'),

                'id' => 'januas_otherinfo_visible',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Position', 'januas'),

                'desc' => __('Select the preferred position for the box.', 'januas'),

                'id' => 'januas_otherinfo_position',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Main', 'januas'), 'value' => 'main'),

                    array('name' => __('Sidebar', 'januas'), 'value' => 'sidebar'),

                )

            ),

            array(

                'name' => __('Order', 'januas'),

                'desc' => __('Insert the box order (ex: 1).', 'januas'),

                'id' => 'januas_otherinfo_order',

                'std' => 6,

                'type' => 'text_small'

            ),

            array(

                'name' => __('Show Title', 'januas'),

                'desc' => __('Select Yes to show the box title, No to hide it.', 'januas'),

                'id' => 'januas_otherinfo_showtitle',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Show in Top menu', 'januas'),

                'desc' => __('Select Yes to show the menu item in the event page top menu, No to hide it.', 'januas'),

                'id' => 'januas_otherinfo_showinmenu',

                'type' => 'select',

                'options' => array(

                    array('name' => __('Yes', 'januas'), 'value' => 'y'),

                    array('name' => __('No', 'januas'), 'value' => 'n'),

                )

            ),

            array(

                'name' => __('Content', 'januas'),

                'desc' => __('Arbitrary text or HTML.', 'januas'),

                'id' => 'januas_otherinfo_text',

                'type' => 'wysiwyg'

            ),

            array(

                'name' => '',

                'desc' => '',

                'id' => 'januas_otherinfo_backtotop',

                'type' => 'backtotop'

            )

        )

    );



    // ## Speakers##

    // details

    $meta_boxes[] = array(

        'id' => 'januas_speaker_details',

        'title' => __('Speaker Details', 'januas'),

        'pages' => array('ja-speaker'),

        'context' => 'normal',

        'priority' => 'high',

        'show_names' => true,

        'fields' => array(

            array(

                'name' => __('Company', 'januas'),

                'id' => 'januas_speaker_company',

                'type' => 'text'

            ),

            array(

                'name' => __('Short Bio', 'januas'),

                'id' => 'januas_speaker_qualification',

                'type' => 'text'

            ),

            array(

                'name' => __('Website Url', 'januas'),

                'id' => 'januas_speaker_website',

                'type' => 'text'

            ),

            array(

                'name' => __('Twitter Username', 'januas'),

                'id' => 'januas_speaker_twitter',

                'type' => 'text'

            ),

        )

    );



    // ## Sessions ##

    // details

    $meta_boxes[] = array(

        'id' => 'januas_session_details',

        'title' => __('Session Details', 'januas'),

        'pages' => array('ja-session'),

        'context' => 'normal',

        'priority' => 'high',

        'show_names' => true,

        'fields' => array(

            array(

                'name' => __('Date', 'januas'),

                'id' => 'januas_session_date',

                'type' => 'text_date_timestamp'

            ),

            array(

                'name' => __('Time', 'januas'),

                'id' => 'januas_session_time',

                'type' => 'text_small',

                'desc' => __('Format hh:mm', 'januas'),

            ),

            array(

                'name' => __('Event', 'januas'),

                'desc' => __('Select the event to associate to this session.', 'januas'),

                'id' => 'januas_session_event',

                'type' => 'select',

                'options' => $events_list

            )

        )

    );



    // speakers

    $meta_boxes[] = array(

        'id' => 'januas_speakers',

        'title' => __('Speakers', 'januas'),

        'pages' => array('ja-session'),

        'context' => 'normal',

        'priority' => 'high',

        'show_names' => false,

        'fields' => array(

            array(

                'name' => '',

                'desc' => count($speakers_list) > 0 ? '' : __('Add Speakers in the Speakers Section', 'januas'),

                'id' => 'januas_speakers_list',

                'type' => 'multicheck',

                'options' => $speakers_list

            ),

        ),

    );



    return $meta_boxes;

}



add_action('wp_ajax_refresh_gallery', 'januas_refresh_gallery');

add_action('wp_ajax_gallery_item_remove', 'januas_gallery_item_remove');



function januas_refresh_gallery() {

    $parent = $_POST['parent'];

    $loop = januas_gallery_items($parent, $_POST['type']);

    $items = januas_gallery_display($loop, $_POST['type']);

    $ret = array();



    if (!empty($parent)) {

        $ret['success'] = true;

        $ret['gallery'] = $items;

    } else {

        $ret['success'] = false;

    }



    echo json_encode($ret);

    die();

}



function januas_gallery_item_remove() {

    $item = $_POST['image'];

    $parent = $_POST['parent'];



    if (empty($item)) {

        $ret['success'] = false;

        echo json_encode($ret);

        die();

    }

    $remove = array();

    $remove['ID'] = $item;

    $remove['post_parent'] = 0;

    $update = wp_update_post($remove);

    $ret = array();

    if ($update !== 0) {

        $loop = januas_gallery_items($parent, $_POST['type']);

        $items = januas_gallery_display($loop, $_POST['type']);

        $ret['success'] = true;

        $ret['gallery'] = $items;

    } else {

        $ret['success'] = false;

    }



    echo json_encode($ret);

    die();

}



function januas_gallery_items($post_id, $type) {

    global $januas_allowed_file_types;



    if ($type == 'image')

        $args = array(

            'post_type' => 'attachment',

            'post_status' => 'inherit',

            'post_parent' => $post_id,

            'post_mime_type' => 'image',

            'posts_per_page' => -1,

            'order' => 'ASC',

            'orderby' => 'menu_order',

        );

    else if ($type == 'file')

        $args = array(

            'post_type' => 'attachment',

            'post_status' => 'inherit',

            'post_parent' => $post_id,

            'post_mime_type' => $januas_allowed_file_types,

            'posts_per_page' => -1,

            'order' => 'ASC',

            'orderby' => 'menu_order',

        );



    return get_posts($args);

}



function januas_gallery_display($loop, $type) {

    if ($type == 'image') {

        $gallery = '<div class="gallery-wrapper">';

        foreach ($loop as $image):

            $thumbnail = wp_get_attachment_image_src($image->ID, 'thumbnail');

            $gallery .= '<img src="' . $thumbnail[0] . '" alt="' . $image->post_title . '" rel="' . $image->ID . '" title="' . $image->post_content . '" /> ';

            $gallery .= '<span class="button-remove image-remove" rel="' . $image->ID . '"><img src="' . get_template_directory_uri() . '/lib/images/cross-circle.png" alt="' . __('Remove Image', 'januas') . '" title="' . __('Remove Image', 'januas') . '"></span>';

        endforeach;

        $gallery .= '</div>';

    } else if ($type == 'file') {

        $gallery = '<div class="gallery-wrapper">';

        foreach ($loop as $file):

            $thumb = wp_get_attachment_image($file->ID, 'thumbnail', true);

            $gallery .= "<span><a href='$file->guid' target='_self' title='$file->post_title'>$thumb</a></span>";

            $gallery .= '<span class="button-remove file-remove" rel="' . $file->ID . '"><img src="' . get_template_directory_uri() . '/lib/images/cross-circle.png" alt="' . __('Remove File', 'januas') . '" title="' . __('Remove File', 'januas') . '"></span>';

        endforeach;

        $gallery .= '</div>';

    }

    return $gallery;

}

?>