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
