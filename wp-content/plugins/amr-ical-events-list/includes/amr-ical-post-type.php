<?php

/* ------------------------------------------------------------------------------------------------ */
if (!function_exists('amr_ical_register_post_type')) {  // let the amr-events one override 
	function amr_ical_register_post_type() {
	global $amr_event_post_type, $amr_event_post_type_plural;

	$amr_event_post_type 		= 'event';
	$amr_event_post_type_plural = 'events';
			
		$labels = array( // dummy for translation string pickup 
			'name' 				=> _x('Events', 'post type general name','amr-events'),
			'singular_name' 	=> _x('Event', 'post type singular name','amr-events'),
			'add_new' 			=> _x('Add New', 'event','amr-events'),
			'add_new_item' 		=> __('Add New Event', 'amr-events'),
			'edit_item' 		=> __('Edit Event', 'amr-events'),
			'new_item' 			=> __('New Event', 'amr-events'),
			'view' 				=> __('View Event', 'amr-events'),
			'view_item' 		=> __('View Event', 'amr-events'),
			'search_items' 		=> __('Search Events', 'amr-events'),
			'not_found' 		=>  __('No events found', 'amr-events'),
			'not_found_in_trash' => __('No events found in trash', 'amr-events'),
			'parent' 			=> __('Related Event','amr-events' ));
			
		// now overwrite	
		$elabel = 'Event'; //ucfirst($amr_event_post_type);
		$elabelplural = 'Events'; //ucfirst($amr_event_post_type_plural);
		$labels = array(
			'name' 				=> _x($elabelplural, 'post type general name','amr-events'),
			'singular_name' 	=> _x($elabel, 'post type singular name','amr-events'),
			'add_new' 			=> _x('Add New ', $elabel,'amr-events'),
			'add_new_item' 		=> __('Add New ').__( $elabel, 'amr-events'),
			'edit_item' 		=> __('Edit ').__( $elabel, 'amr-events'),
			'new_item' 			=> __('New ').__($elabel, 'amr-events'),
			'view' 				=> __('View ').__( $elabelplural, 'amr-events'),
			'view_item' 		=> __('View ').__( $elabel, 'amr-events'),
			'search_items' 		=> __('Search ').__( $elabelplural, 'amr-events'),
			'not_found' 		=>  __('No events found', 'amr-events'),
			'not_found_in_trash' => __('No events found in trash', 'amr-events'),
			'parent' 			=> sprintf(__('Related %s', 'amr-events'),__( $elabel, 'amr-events')));
			
			
		$args = array(
				'label'		=> $amr_event_post_type,
				'labels' 	=> $labels,
				'singular_label' => __('Event','amr-events'),  // keep as dummy for translation, then overwrite
				'public' => true,
				'publicly_queryable' => true,
				'show_ui' => true,
				'capability_type' => 'post',  // special capabilities only in amr-events
				//'hierarchical' => true,
				'supports' => array('title', 'editor', 'author',
					//'revisions', 'thumbnail',
					//	'excerpt','page-attributes','custom-fields','wpgeo','comments', 'trackbacks','sticky'
					),
				//'taxonomies' => array( 'post_tag',	'category'),
				'show_in_menu' => true,
				'show_in_nav_menus' => true,
				'menu_position' => 4, /* so will come after posts */
				'has_archive' => true,
	//			'menu_icon' =>  WP_PLUGIN. '/article16.png'
				'_builtin' =>  false, // It's a custom post type, not built in!
				'query_var' => true,
				'capability_type' => 'post', // only need array if plural is different
				'map_meta_cap' => true,   // bad news for editing in menu?
				'rewrite' => array("slug" => $amr_event_post_type /*,'with_front' => true*/ ) // Permalinks format
				
				);
				
		$args['singular_label'] = __($amr_event_post_type,'amr-events');// overwrite with chosen name
		register_post_type($amr_event_post_type,$args );
	}
}	
/* -------------------------------------------------------------------------*/

	add_action('init', 					'amr_ical_register_post_type',1);  // only in init not before
