<?php
/**
 * @package Firegento_Theme_Adjustments
 * @version 1.0
 */
/*
Plugin Name: Firegento Theme Adjustments
Plugin URI: http://www.magento-stammtisch.de/
Description: Adjustments for Januas Theme because the Lack of Child-Theme Support
Author: Benno Lippert
Version: 1.0
License:      GNU General Public License v2 or later
License URI:  http://www.gnu.org/licenses/gpl-2.0.html
Tags:         magento, hackathon
Author URI: http://www.mash2.com/
*/
//defined( 'ABSPATH' ) or die( 'No script kiddies please!' );

function adjustments_enqueue_styles()
{
    wp_enqueue_style('firegento-januas-child',
        plugins_url( '/css/style.css', __FILE__ )
    );
}

add_action('wp_enqueue_scripts', 'adjustments_enqueue_styles');

function firegento_organizer() {

    $labels = array(
        'name'                       => _x( 'Organizers', 'Taxonomy General Name', 'text_domain' ),
        'singular_name'              => _x( 'Organizer', 'Taxonomy Singular Name', 'text_domain' ),
        'menu_name'                  => __( 'Organizer', 'text_domain' ),
        'all_items'                  => __( 'All Items', 'text_domain' ),
        'parent_item'                => __( 'Parent Item', 'text_domain' ),
        'parent_item_colon'          => __( 'Parent Item:', 'text_domain' ),
        'new_item_name'              => __( 'New Organizer', 'text_domain' ),
        'add_new_item'               => __( 'Add New Item', 'text_domain' ),
        'edit_item'                  => __( 'Edit Item', 'text_domain' ),
        'update_item'                => __( 'Update Item', 'text_domain' ),
        'view_item'                  => __( 'View Organizer', 'text_domain' ),
        'separate_items_with_commas' => __( 'Separate items with commas', 'text_domain' ),
        'add_or_remove_items'        => __( 'Add or remove items', 'text_domain' ),
        'choose_from_most_used'      => __( 'Choose from the most used', 'text_domain' ),
        'popular_items'              => __( 'Popular Items', 'text_domain' ),
        'search_items'               => __( 'Search Items', 'text_domain' ),
        'not_found'                  => __( 'Not Found', 'text_domain' ),
    );
    $rewrite = array(
        'slug'                       => 'organizer',
        'with_front'                 => true,
        'hierarchical'               => false,
    );
    $args = array(
        'labels'                     => $labels,
        'hierarchical'               => true,
        'public'                     => true,
        'show_ui'                    => true,
        'show_admin_column'          => true,
        'show_in_nav_menus'          => false,
        'show_tagcloud'              => false,
        'query_var'                  => 'organizer',
        'rewrite'                    => $rewrite,
    );
    register_taxonomy( 'organizer', array( 'post', 'ja-event' ), $args );

}
add_action( 'init', 'firegento_organizer', 0 );
