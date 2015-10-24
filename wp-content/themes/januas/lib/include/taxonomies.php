<?php

add_action('init', 'januas_register_event_taxonomy');

function januas_register_event_taxonomy() {
    $labels = array(
        'name' => __('Event Categories', 'januas'),
        'singular_name' => __('Event Category', 'januas'),
        'search_items' => __('Search Event Categories', 'januas'),
        'all_items' => __('All Event Categories', 'januas'),
        'parent_item' => __('Parent Event Category', 'januas'),
        'parent_item_colon' => __('Parent Event Category:', 'januas'),
        'edit_item' => __('Edit Event Category', 'januas'),
        'update_item' => __('Update Event Category', 'januas'),
        'add_new_item' => __('Add New Event Category', 'januas'),
        'new_item_name' => __('New Event Category', 'januas'),
        'menu_name' => __('Categories', 'januas'),
    );

    register_taxonomy('ja-event-category', array('ja-event'), array(
        'hierarchical' => true,
        'labels' => $labels,
        'show_ui' => true,
        'query_var' => true,
        'rewrite' => array('slug' => 'event-category'),
    ));

    $meta_section = array(
        'id' => 'ja-event-category-metas',
        'taxonomies' => array('ja-event-category'),
        'fields' => array(
            array(
                'name' => __('Color', 'januas'),
                'id' => 'event_color',
                'type' => 'color'
            )
        )
    );

    new RW_Taxonomy_Meta($meta_section);
}

add_action('init', 'januas_register_session_tracks');

function januas_register_session_tracks() {
    $labels = array(
        'name' => __('Session Tracks', 'januas'),
        'singular_name' => __('Session Track', 'januas'),
        'search_items' => __('Search Session Tracks', 'januas'),
        'all_items' => __('All Session Tracks', 'januas'),
        'parent_item' => __('Parent Session Track', 'januas'),
        'parent_item_colon' => __('Parent Session Track:', 'januas'),
        'edit_item' => __('Edit Session Track', 'januas'),
        'update_item' => __('Update Session Track', 'januas'),
        'add_new_item' => __('Add New Session Track', 'januas'),
        'new_item_name' => __('New Session Track', 'januas'),
        'menu_name' => __('Tracks', 'januas'),
    );

    register_taxonomy('ja-session-track', array('ja-session'), array(
        'hierarchical' => false,
        'labels' => $labels,
        'show_ui' => true,
        'query_var' => true,
        //'rewrite' => array('slug' => 'session-track'),
    ));

    $meta_section = array(
        'id' => 'ja-session-track-metas',
        'taxonomies' => array('ja-session-track'),
        'fields' => array(
            array(
                'name' => __('Color', 'januas'),
                'id' => 'session_track_color',
                'type' => 'color'
            )
        )
    );

    new RW_Taxonomy_Meta($meta_section);
}

add_action('init', 'januas_register_session_locations');

function januas_register_session_locations() {
    $labels = array(
        'name' => __('Session Locations', 'januas'),
        'singular_name' => __('Session Location', 'januas'),
        'search_items' => __('Search Session Locations', 'januas'),
        'all_items' => __('All Session Locations', 'januas'),
        'parent_item' => __('Parent Session Location', 'januas'),
        'parent_item_colon' => __('Parent Session Location:', 'januas'),
        'edit_item' => __('Edit Session Location', 'januas'),
        'update_item' => __('Update Session Location', 'januas'),
        'add_new_item' => __('Add New Session Location', 'januas'),
        'new_item_name' => __('New Session Location', 'januas'),
        'menu_name' => __('Locations', 'januas'),
    );

    register_taxonomy('ja-session-location', array('ja-session'), array(
        'hierarchical' => false,
        'labels' => $labels,
        'show_ui' => true,
        'query_var' => true,
       // 'rewrite' => array('slug' => 'session-location'),
    ));

    $meta_section = array(
        'id' => 'ja-session-location-metas',
        'taxonomies' => array('ja-session-location'),
        'fields' => array(
            array(
                'name' => __('Color', 'januas'),
                'id' => 'session_location_color',
                'type' => 'color'
            )
        )
    );

    new RW_Taxonomy_Meta($meta_section);
}
?>