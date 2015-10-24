<?php

add_action('init', 'januas_register_event_post_type');
add_action('init', 'januas_register_speaker_post_type');
add_action('init', 'januas_register_session_post_type');

function januas_register_event_post_type() {
    $labels = array(
        'name' => __('Events', 'januas'),
        'singular_name' => __('Event', 'januas'),
        'add_new' => __('Add New', 'januas'),
        'add_new_item' => __('Add New Event', 'januas'),
        'edit_item' => __('Edit Event', 'januas'),
        'new_item' => __('New Event', 'januas'),
        'view_item' => __('View Event', 'januas'),
        'search_items' => __('Search Events', 'januas'),
        'not_found' => __('No Events found', 'januas'),
        'not_found_in_trash' => __('No Events found in trash', 'januas'),
        'menu_name' => __('Events', 'januas'),
    );

    $args = array(
        'labels' => $labels,
        'public' => true,
        'publicly_queryable' => true,
        'show_ui' => true,
        'show_in_menu' => true,
        'query_var' => true,
        'rewrite' => array('slug' => 'events'),
        'capability_type' => 'post',
        'has_archive' => false,
        'hierarchical' => false,
        'menu_position' => 5,
        'supports' => array('title', 'editor', 'thumbnail', 'page-attributes')
    );

    register_post_type('ja-event', $args);
}

function januas_register_speaker_post_type() {
    $labels = array(
        'name' => __('Speakers', 'januas'),
        'singular_name' => __('Speaker', 'januas'),
        'add_new' => __('Add New', 'januas'),
        'add_new_item' => __('Add New Speaker', 'januas'),
        'edit_item' => __('Edit Speaker', 'januas'),
        'new_item' => __('New Speaker', 'januas'),
        'view_item' => __('View Speaker', 'januas'),
        'search_items' => __('Search Speakers', 'januas'),
        'not_found' => __('No Speakers found', 'januas'),
        'not_found_in_trash' => __('No Speakers found in trash', 'januas'),
        'menu_name' => __('Speakers', 'januas'),
    );

    $args = array(
        'labels' => $labels,
        'public' => true,
        'publicly_queryable' => true,
        'show_ui' => true,
        'show_in_menu' => true,
        'query_var' => true,
        'rewrite' => array('slug' => 'speakers'),
        'capability_type' => 'post',
        'has_archive' => false,
        'hierarchical' => false,
        'menu_position' => 5,
        'supports' => array('title', 'editor', 'thumbnail')
    );

    register_post_type('ja-speaker', $args);
}

function januas_register_session_post_type() {
    $labels = array(
        'name' => __('Sessions', 'januas'),
        'singular_name' => __('Session', 'januas'),
        'add_new' => __('Add New', 'januas'),
        'add_new_item' => __('Add New Session', 'januas'),
        'edit_item' => __('Edit Session', 'januas'),
        'new_item' => __('New Session', 'januas'),
        'view_item' => __('View Session', 'januas'),
        'search_items' => __('Search Sessions', 'januas'),
        'not_found' => __('No Sessions found', 'januas'),
        'not_found_in_trash' => __('No Sessions found in trash', 'januas'),
        'menu_name' => __('Sessions', 'januas'),
    );

    $args = array(
        'labels' => $labels,
        'public' => true,
        'publicly_queryable' => true,
        'show_ui' => true,
        'show_in_menu' => true,
        'query_var' => true,
        'rewrite' => array('slug' => 'sessions'),
        'capability_type' => 'post',
        'has_archive' => false,
        'hierarchical' => false,
        'menu_position' => 5,
        'supports' => array('title', 'editor', 'thumbnail')
    );

    register_post_type('ja-session', $args);
}
?>