<?php
function theme_enqueue_styles() {

$parent_style = 'januas';

wp_enqueue_style( $parent_style, get_template_directory_uri() . '/style.css' );
wp_enqueue_style( 'firegento_januaschild',
get_stylesheet_directory_uri() . '/style.css',
array( $parent_style )
);
}