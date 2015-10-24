<?php

function januas_get_random_words($str, $count) {
    $words = str_word_count($str, 1);
    shuffle($words);
    return implode(' ', array_slice($words, 0, $count - 1));
}

function januas_move_images_to_upload_dir() {
    $upload_info = wp_upload_dir();
    $upload_dir = $upload_info['basedir'];
    if (file_exists($upload_dir)) {
        if (!file_exists($upload_dir . DIRECTORY_SEPARATOR . 'dummy'))
            mkdir($upload_dir . DIRECTORY_SEPARATOR . 'dummy');

        if (file_exists($upload_dir . DIRECTORY_SEPARATOR . 'dummy')) {
            $src_path = get_stylesheet_directory() . DIRECTORY_SEPARATOR . 'lib' . DIRECTORY_SEPARATOR . 'images' . DIRECTORY_SEPARATOR . 'dummy';
            $dst_path = $upload_dir . DIRECTORY_SEPARATOR . 'dummy';
            $files = array('speaker1.jpg', 'speaker2.jpg', 'speaker3.jpg', 'speaker4.jpg', 'speaker5.jpg', 'event1.jpg', 'event2.jpg', 'event3.jpg', 'event4.jpg', 'event5.jpg');
            foreach ($files as $file)
                copy($src_path . DIRECTORY_SEPARATOR . $file, $dst_path . DIRECTORY_SEPARATOR . $file);
        }
    }
}

function januas_import_dummy_thumbnail($filename, $post_id, $featured) {
    $upload_info = wp_upload_dir();
    $upload_dir = $upload_info['basedir'];
    $filename = $upload_dir . '/dummy/' . $filename;
    $wp_filetype = wp_check_filetype(basename($filename), null);
    $attachment = array(
        'guid' => $upload_info['url'] . '/' . basename($filename),
        'post_mime_type' => $wp_filetype['type'],
        'post_title' => preg_replace('/\.[^.]+$/', '', basename($filename)),
        'post_content' => '',
        'post_status' => 'inherit'
    );
    $attach_id = wp_insert_attachment($attachment, $filename, $post_id);
    $attach_data = wp_generate_attachment_metadata($attach_id, $filename);
    wp_update_attachment_metadata($attach_id, $attach_data);
    if ($featured)
        if (!is_wp_error($attach_id))
            set_post_thumbnail($post_id, $attach_id);

    return $attach_id;
}

function januas_install_dummy_content() {

    $events = array();
    $sessions = array();
    $speakers = array();
    $locations = array();
    $tracks = array();
    $categories = array();

    $dummy_content = 'Sed a elementum sed tincidunt cursus nisi ridiculus, nascetur turpis est placerat, enim nunc, proin, tortor. Est augue mid porta aenean amet, tempor, lundium, est tortor turpis. Magna! Augue dignissim, in dictumst, dapibus eu magna arcu. Mid sit mauris montes augue magna. Lectus urna mattis! Sociis cursus sit porttitor aenean risus nisi ac in. Turpis placerat mattis. Vut pid amet, integer nascetur dapibus ut integer vut ut egestas est urna augue tempor quis nunc placerat! Elit enim, magnis duis parturient, velit vel massa! Et, amet placerat scelerisque rhoncus et placerat. Hac et ac turpis duis ultricies parturient augue phasellus non, vel ultrices, diam platea arcu lorem et lorem quis adipiscing sed nec eros nunc hac massa parturient dis, turpis ultrices.Dis porta pulvinar, diam in, cursus sit natoque proin, sociis turpis. A turpis mattis nec risus. Risus pid magna augue montes purus lundium vel tristique nec nec elementum nascetur diam et eros, platea odio est. Nec natoque, risus parturient. Auctor, cum, dolor auctor egestas. Rhoncus arcu augue, eu etiam? Nisi pulvinar. Pulvinar risus nunc integer amet nunc adipiscing lundium, vel ac natoque? Enim aliquam risus turpis magnis natoque, eros in enim! Elementum rhoncus! Elementum tristique egestas cursus purus scelerisque egestas, ultricies tincidunt risus, placerat proin? Eu dapibus? Augue, montes, et integer pulvinar in, urna proin, in? Porta vel, ultrices sit massa, parturient proin, ut amet non amet ultricies ac? Egestas ridiculus? Elementum et, tempor ac placerat! Rhoncus? Dictumst adipiscing.';
    $dummy_locations = array('Plenary Room', 'Pavilion Room', 'Auditorium', 'Faculty Lounge', 'Room A');
    $dummy_tracks = array('Social Media', 'Marketing', 'Technology', 'Creativity', 'Mobile Development');
    $dummy_categories = array('Music', 'Sport', 'Business', 'Food', 'Management');
    $speakers_names = array('Robert', 'John', 'Sean', 'Mark');
    $speakers_surnames = array('Harris', 'Martin', 'Robinson', 'Scott');
    $dummy_cities = array('New York', 'San Francisco', 'Boston', 'Seattle', 'Dallas');
    $dummy_event_images = array('event1.jpg', 'event2.jpg', 'event3.jpg', 'event4.jpg', 'event5.jpg');
    $dummy_speaker_images = array('speaker1.jpg', 'speaker2.jpg', 'speaker3.jpg', 'speaker4.jpg', 'speaker5.jpg');

    januas_move_images_to_upload_dir();
    $dummy_sponsor_image_id = januas_import_dummy_thumbnail('sponsor.png', 0, false);

    // Locations
    foreach ($dummy_locations as $location) {
        $ret = wp_insert_term($location, 'ja-session-location');
        if (!is_wp_error($ret))
            $locations[] = $ret['term_id'];
    }

    // Tracks
    foreach ($dummy_tracks as $track) {
        $ret = wp_insert_term($track, 'ja-session-track');
        if (!is_wp_error($ret))
            $tracks[] = $ret['term_id'];
    }

    // Categories
    foreach ($dummy_categories as $category) {
        $ret = wp_insert_term($category, 'ja-event-category');
        if (!is_wp_error($ret))
            $categories[] = $ret['term_id'];
    }

    // Speakers
    for ($i = 1; $i <= 10; $i++) {
        $speaker_id = wp_insert_post(array(
            'post_content' => ucfirst(strtolower(januas_get_random_words($dummy_content, 50))),
            'post_title' => $speakers_names[array_rand($speakers_names)] . ' ' . $speakers_surnames[array_rand($speakers_surnames)],
            'post_status' => 'publish',
            'post_type' => 'ja-speaker'));
        januas_import_dummy_thumbnail($dummy_speaker_images[array_rand($dummy_speaker_images)], $speaker_id, true);
        $speakers[] = $speaker_id;
        update_post_meta($speaker_id, 'januas_speaker_company', "Company $i");
        update_post_meta($speaker_id, 'januas_speaker_qualification', "Owner");
        update_post_meta($speaker_id, 'januas_speaker_website', "http://www.eventmanagerblog.com");
        update_post_meta($speaker_id, 'januas_speaker_twitter', "@EventMB");
    }

    // Events
    for ($i = 1; $i <= 10; $i++) {
        $event_id = wp_insert_post(array(
            'post_content' => ucfirst(strtolower(januas_get_random_words($dummy_content, 50))),
            'post_title' => ucfirst(strtolower(januas_get_random_words($dummy_content, 5))),
            'post_status' => 'publish',
            'post_type' => 'ja-event'
                ));
        wp_set_object_terms($event_id, $categories[array_rand($categories)], 'ja-event-category');
        januas_import_dummy_thumbnail($dummy_event_images[array_rand($dummy_event_images)], $event_id, true);
        $events[] = $event_id;
        $city = $dummy_cities[array_rand($dummy_cities)];
        update_post_meta($event_id, 'januas_speakers_visible', 'y');
        update_post_meta($event_id, 'januas_speakers_position', 'main');
        update_post_meta($event_id, 'januas_speakers_order', '4');
        update_post_meta($event_id, 'januas_speakers_showtitle', 'y');
        update_post_meta($event_id, 'januas_speakers_showinmenu', 'y');
        update_post_meta($event_id, 'januas_otherinfo_visible', 'n');
        update_post_meta($event_id, 'januas_otherinfo_position', 'main');
        update_post_meta($event_id, 'januas_otherinfo_order', '8');
        update_post_meta($event_id, 'januas_otherinfo_showtitle', 'n');
        update_post_meta($event_id, 'januas_otherinfo_showinmenu', 'y');
        update_post_meta($event_id, 'januas_otherinfo_text', '');
        update_post_meta($event_id, 'januas_eventdata_startdate', strtotime("+" . rand(2, 30) . ' days'));
        update_post_meta($event_id, 'januas_eventdata_starttime', date('H:i', strtotime("+" . rand(2, 1440) . ' minutes')));
        update_post_meta($event_id, 'januas_eventdata_city', $city);
        update_post_meta($event_id, 'januas_eventdata_address', ucfirst(strtolower(januas_get_random_words($dummy_content, 3))));
        update_post_meta($event_id, 'januas_eventdata_ticketinfo', 'tickets from ' . rand(50, 120) . ' $');
        update_post_meta($event_id, 'januas_eventdata_state', 'active');
        update_post_meta($event_id, 'januas_eventdata_featured', 'n');
        update_post_meta($event_id, 'januas_eventdata_showtitle', 'y');
        update_post_meta($event_id, 'januas_eventdata_showinmenu', 'y');
        update_post_meta($event_id, 'januas_eventdata_showrelated', 'y');
        update_post_meta($event_id, 'januas_schedule_visible', 'y');
        update_post_meta($event_id, 'januas_schedule_position', 'main');
        update_post_meta($event_id, 'januas_schedule_order', '3');
        update_post_meta($event_id, 'januas_schedule_showtitle', 'y');
        update_post_meta($event_id, 'januas_schedule_showinmenu', 'y');
        update_post_meta($event_id, 'januas_registration_visible', 'y');
        update_post_meta($event_id, 'januas_registration_order', '2');
        update_post_meta($event_id, 'januas_registration_showtitle', 'y');
        update_post_meta($event_id, 'januas_registration_showinmenu', 'y');
        update_post_meta($event_id, 'januas_registration_script', '<div style="width:100%; text-align:left;" ><iframe  src="http://www.eventbrite.com/tickets-external?eid=2804433135&ref=etckt&v=2" frameborder="0" height="306" width="100%" vspace="0" hspace="0" marginheight="5" marginwidth="5" scrolling="auto" allowtransparency="true"></iframe></div>');
        update_post_meta($event_id, 'januas_video_visible', 'y');
        update_post_meta($event_id, 'januas_video_position', 'main');
        update_post_meta($event_id, 'januas_video_order', '5');
        update_post_meta($event_id, 'januas_video_showtitle', 'y');
        update_post_meta($event_id, 'januas_video_showinmenu', 'y');
        update_post_meta($event_id, 'januas_video_1', 'http://www.youtube.com/watch?v=nrerVdQj6t4');
        update_post_meta($event_id, 'januas_video_2', 'http://www.youtube.com/watch?v=KKhX_iywF_Y');
        update_post_meta($event_id, 'januas_eventdata_videochannel_url', 'http://www.youtube.com/user/bournemouthuni');
        update_post_meta($event_id, 'januas_eventdata_videochannel_text', 'More videos');
        update_post_meta($event_id, 'januas_sponsor_visible', 'n');
        update_post_meta($event_id, 'januas_sponsor_position', 'sidebar');
        update_post_meta($event_id, 'januas_sponsor_order', '1');
        update_post_meta($event_id, 'januas_sponsor_showtitle', 'y');
        update_post_meta($event_id, 'januas_sponsor_showinmenu', 'n');
        update_post_meta($event_id, 'januas_sponsor_image', '');
        update_post_meta($event_id, 'januas_sponsor_image_id', '');
        update_post_meta($event_id, 'januas_sponsor_url', '');
        update_post_meta($event_id, 'januas_map_visible', 'y');
        update_post_meta($event_id, 'januas_map_position', 'sidebar');
        update_post_meta($event_id, 'januas_map_order', '2');
        update_post_meta($event_id, 'januas_map_showtitle', 'y');
        update_post_meta($event_id, 'januas_map_showinmenu', 'y');
        update_post_meta($event_id, 'januas_map_address', $city);
        update_post_meta($event_id, 'januas_map_label', $city);
        update_post_meta($event_id, 'januas_files_visible', 'n');
        update_post_meta($event_id, 'januas_files_position', '');
        update_post_meta($event_id, 'januas_files_order', '');
        update_post_meta($event_id, 'januas_files_showtitle', '');
        update_post_meta($event_id, 'januas_files_showinmenu', '');
        update_post_meta($event_id, 'januas_images_visible', 'n');
        update_post_meta($event_id, 'januas_images_position', '');
        update_post_meta($event_id, 'januas_images_order', '');
        update_post_meta($event_id, 'januas_images_showtitle', '');
        update_post_meta($event_id, 'januas_images_showinmenu', '');
        update_post_meta($event_id, 'januas_social_visible', 'y');
        update_post_meta($event_id, 'januas_social_position', 'sidebar');
        update_post_meta($event_id, 'januas_social_order', '3');
        update_post_meta($event_id, 'januas_social_showtitle', 'y');
        update_post_meta($event_id, 'januas_social_showinmenu', 'y');
        update_post_meta($event_id, 'januas_social_pageurl', 'http://www.facebook.com/platform');
        update_post_meta($event_id, 'januas_social_faces', 'true');
        update_post_meta($event_id, 'januas_social_colorscheme', 'light');
        update_post_meta($event_id, 'januas_social_stream', 'true');
        update_post_meta($event_id, 'januas_social_bordercolor', '');
        update_post_meta($event_id, 'januas_social_header', 'true');
    }

    // -- Featured
    update_post_meta($events[array_rand($events)], 'januas_eventdata_featured', 'y');

    // Sessions
    for ($i = 1; $i <= 30; $i++) {
        $session_id = wp_insert_post(array(
            'post_content' => ucfirst(strtolower(januas_get_random_words($dummy_content, 50))),
            'post_title' => ucfirst(strtolower(januas_get_random_words($dummy_content, 8))),
            'post_status' => 'publish',
            'post_type' => 'ja-session'
                ));
        wp_set_object_terms($session_id, $locations[array_rand($locations)], 'ja-session-location');
        wp_set_object_terms($session_id, $dummy_tracks[array_rand($dummy_tracks)], 'ja-session-track');
        $sessions[] = $session_id;
        update_post_meta($session_id, 'januas_session_date', strtotime("+" . rand(2, 30) . ' days'));
        update_post_meta($session_id, 'januas_session_time', date('H:i', strtotime("+" . rand(2, 1440) . ' minutes')));
        update_post_meta($session_id, 'januas_session_event', $events[array_rand($events)]);
        update_post_meta($session_id, 'januas_speakers_list', $speakers[array_rand($speakers)]);
    }
}

?>