<?php
/**
 * Jetpack Compatibility File
 * See: https://jetpack.me/
 *
 * @package firegento_stammtisch
 */

/**
 * Add theme support for Infinite Scroll.
 * See: https://jetpack.me/support/infinite-scroll/
 */
function firegento_stammtisch_jetpack_setup() {
	add_theme_support( 'infinite-scroll', array(
		'container' => 'main',
		'render'    => 'firegento_stammtisch_infinite_scroll_render',
		'footer'    => 'page',
	) );
} // end function firegento_stammtisch_jetpack_setup
add_action( 'after_setup_theme', 'firegento_stammtisch_jetpack_setup' );

function firegento_stammtisch_infinite_scroll_render() {
	while ( have_posts() ) {
		the_post();
		get_template_part( 'template-parts/content', get_post_format() );
	}
} // end function firegento_stammtisch_infinite_scroll_render