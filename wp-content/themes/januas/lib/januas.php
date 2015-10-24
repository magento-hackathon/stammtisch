<?php

/*

  Developed by: Simone Bolognini

  URL: http://www.simonebolognini.it

 */



$januas_allowed_file_types = array();



add_action('after_setup_theme', 'januas_after_setup_theme');

function januas_after_setup_theme() {

    global $januas_allowed_file_types;



    require(get_template_directory() . '/lib/include/functions.php');

    require(get_template_directory() . '/lib/include/post-types.php');

    require(get_template_directory() . '/lib/include/metaboxes.php');

    require(get_template_directory() . '/lib/class/taxonomy-meta.php');

    require(get_template_directory() . '/lib/include/taxonomies.php');

    require(get_template_directory() . '/lib/include/sidebars.php');

    require(get_template_directory() . '/lib/include/menus.php');

    require(get_template_directory() . '/lib/include/theme-options.php');

    require(get_template_directory() . '/lib/widgets/widget-latest-news.php');

    require(get_template_directory() . '/lib/widgets/widget-connect.php');

    require(get_template_directory() . '/lib/widgets/widget-feedburner.php');

    require(get_template_directory() . '/lib/widgets/widget-twitter.php');

    require(get_template_directory() . '/lib/widgets/widget-linkedin.php');

    require(get_template_directory() . '/event-framework/lib/api/functions.php');

    load_theme_textdomain('januas', get_template_directory() . '/lib/languages');



    $header_config = array(
        'default-image' => get_bloginfo('template_url') . '/lib/images/januas_logo.png',
        'random-default' => false,
        'width' => 306,
        'height' => 87,
        'default-text-color' => '',
        'header-text' => false,
        'uploads' => true,
        'wp-head-callback' => '',
        'admin-head-callback' => '',
        'admin-preview-callback' => '',
    );



    add_theme_support('custom-header', $header_config);

    add_theme_support('post-thumbnails');

    add_theme_support('automatic-feed-links');



    add_image_size('januas-medium', 306, 306, true);

    add_image_size('januas-large', 642, 360, true);



    $januas_allowed_file_types = apply_filters('januas_allowed_file_types', array('application/doc', 'application/pdf', 'application/zip', 'application/rar', 'application/xls', 'text/plain', 'application/msword', 'application/vnd.ms-excel'));



    require(get_template_directory() . '/lib/class/custom-metaboxes/init.php');



    add_filter('style_loader_tag', 'januas_style_loader_tag', 10, 2);

    add_action('admin_enqueue_scripts', 'januas_admin_event_enqueue_scripts');

    add_action('admin_enqueue_scripts', 'januas_admin_session_enqueue_scripts');

    add_action('wp_enqueue_scripts', 'januas_enqueue_scripts');

    add_filter('the_content', 'januas_filter_ptags_on_images');
    
    add_action('admin_menu', 'januas_admin_menu');
}

function januas_admin_menu() {
    add_theme_page(__('Other Themes', 'dxef'), __('More Themes', 'dxef'), 'manage_options', 'ef-other-themes', 'theme_otherthemes_callback');
}

function theme_otherthemes_callback() {
    $current_theme = wp_get_theme();
    include_once( get_template_directory() . '/event-framework/inc/event-other-themes.php' );
}

function januas_style_loader_tag($tag, $handle) {

    if ('januas-ie-only' == $handle)
        $tag = '<!--[if lt IE 9]>' . "\n" . $tag . '<![endif]-->' . "\n";

    return $tag;
}

function januas_admin_event_enqueue_scripts($hook) {

    global $post_type;


    if ($hook === 'appearance_page_ef-other-themes') {
        wp_enqueue_style('ef-theme-other-themes', get_template_directory_uri() . '/event-framework/assets/css/otherthemes.css');
    }

    if (!in_array($hook, array('post.php', 'post-new.php')) || $post_type != 'ja-event')
        return;

    wp_enqueue_script('januas-google-maps', 'http://maps.google.com/maps/api/js?sensor=false');

    wp_enqueue_script('januas-admin-scripts', get_template_directory_uri() . '/lib/scripts/januas-admin-scripts.js', array('jquery'), null, true);

    wp_enqueue_style('januas-admin-styles', get_template_directory_uri() . '/lib/styles/januas-admin-styles.css');

    wp_enqueue_script('thickbox');

    wp_enqueue_style('thickbox');
}

function januas_admin_session_enqueue_scripts($hook) {

    global $post_type;



    if (!in_array($hook, array('post.php', 'post-new.php')) || $post_type != 'ja-session')
        return;

    wp_enqueue_script('januas-admin-session-scripts', get_template_directory_uri() . '/lib/scripts/januas-admin-session-scripts.js', array('jquery'), null, true);
}

function januas_enqueue_scripts() {

    wp_deregister_script('jquery');

    wp_register_script('jquery', get_stylesheet_directory_uri() . '/lib/scripts/jquery-1.8.3.js');

    wp_register_script('jquery-ui', get_stylesheet_directory_uri() . '/lib/scripts/jquery-ui-1.9.2.custom.min.js');

    wp_register_style('januas-ie-only', get_stylesheet_directory_uri() . '/lib/styles/ie.css', array(), '');

    wp_enqueue_script('januas-modernizr', get_stylesheet_directory_uri() . '/lib/scripts/modernizr.custom.min.js', array(), '2.5.3', false);

    wp_enqueue_script('januas-chosen', get_stylesheet_directory_uri() . '/lib/scripts/chosen.jquery.min.js', array('jquery'));

    wp_enqueue_script('januas-watermark', get_stylesheet_directory_uri() . '/lib/scripts/jquery.watermark.min.js', array('jquery'));

    wp_register_script('januas-bx-jquery', get_stylesheet_directory_uri() . '/lib/scripts/jquery.bxslider.min.js');

    wp_enqueue_style('januas-bx-style', get_stylesheet_directory_uri() . '/lib/styles/jquery.bxslider.css');

    wp_enqueue_style('januas-fontawesome', get_template_directory_uri() . '/lib/styles/font-awesome.min.css');

    wp_enqueue_style('januas-bx-custom', get_stylesheet_directory_uri() . '/lib/styles/bx.custom.css');

    wp_enqueue_style('januas-chosen-style', get_stylesheet_directory_uri() . '/lib/styles/chosen.css');

    wp_enqueue_style('januas-ie-only');

    wp_enqueue_script('januas-bx-jquery');

    if (is_singular() && comments_open() && (get_option('thread_comments') == 1)) {

        wp_enqueue_script('comment-reply');
    }

    if (is_singular('ja-event')) {

        wp_enqueue_script('januas-google-maps', 'https://maps.google.com/maps/api/js?sensor=false');
		
		global $post;
		if(get_post_meta($post->ID, 'januas_map_visible', true) == 'y') {
        	wp_enqueue_script('januas-event-map', get_stylesheet_directory_uri() . '/lib/scripts/januas-event-map.js', false, true);
		}
        wp_enqueue_script('januas-lightbox', get_stylesheet_directory_uri() . '/lib/scripts/jquery.lightbox-0.5.min.js', array('jquery'));

        wp_enqueue_style('januas-lightbox', get_stylesheet_directory_uri() . '/lib/styles/jquery.lightbox-0.5.css');
    }
    wp_enqueue_script('januas-woocommerce', get_template_directory_uri() . '/lib/scripts/woocommerce.js', array('jquery'), false, false);
}

// remove the p from around imgs (http://css-tricks.com/snippets/wordpress/remove-paragraph-tags-from-around-images/)

function januas_filter_ptags_on_images($content) {

    return preg_replace('/<p>\s*(<a .*>)?\s*(<img .* \/>)\s*(<\/a>)?\s*<\/p>/iU', '\1\2\3', $content);
}

add_filter('FHEE__EE_Register_CPTs__register_CPT__rewrite', 'januas_ee_event_slug', 10, 2);

function januas_ee_event_slug($slug, $post_type) {
    if ($post_type == 'espresso_events') {
        $custom_slug = array('slug' => 'ee-event');
        return $custom_slug;
    }
    return $slug;
}

require(get_template_directory() . '/lib/class/januas-rendering.php');

/**
 *
 * Woocommerce Integration
 *
 */
add_action('after_setup_theme', 'khore_woocommerce_setup_theme');

function khore_woocommerce_setup_theme() {
    add_theme_support('woocommerce');
}

add_action('wp_head', 'khore_wp_head');

function khore_wp_head() {
    global $post;
    if (isset($post) && $post->post_type == 'ja-event' && in_array('woocommerce/woocommerce.php', apply_filters('active_plugins', get_option('active_plugins')))) {
        remove_action('woocommerce_before_shop_loop_item_title', 'woocommerce_template_loop_product_thumbnail', 10);
        remove_action('woocommerce_before_shop_loop_item_title', 'woocommerce_show_product_loop_sale_flash', 10);
        remove_action('woocommerce_after_shop_loop_item', 'woocommerce_template_loop_add_to_cart', 10);
        remove_action('woocommerce_after_shop_loop_item_title', 'woocommerce_template_loop_price', 10);
        remove_action('woocommerce_after_shop_loop_item_title', 'woocommerce_template_loop_rating', 10);
        add_action('woocommerce_before_shop_loop_item', 'khore_woocommerce_before_shop_loop_item', 10);
        add_filter('woocommerce_locate_template', 'khore_woocommerce_locate_template', 10, 3);
    }
}

function khore_woocommerce_before_shop_loop_item() {
    global $post;

    echo '<td class="title">';
    do_action('woocommerce_before_shop_loop_item_title');
    echo '<h3>' . get_the_title() . '</h3>';
    do_action('woocommerce_after_shop_loop_item_title');
    echo '</td>';
    echo '<td class="description">';
    echo '<span class="short-description">' . $post->post_excerpt . '</span>';
    echo '</td>';
    echo '<td class="price">';
    woocommerce_template_loop_price();
    echo '</td>';
    echo '<td class="quantity">';
    woocommerce_quantity_input();
    echo '<input type="hidden" name="product_id" value="' . $post->ID . '" />';
    echo '</td>';
}

function khore_woocommerce_locate_template($template, $template_name, $template_path) {
    return $template;
}

/* ----------------------------- */
?>