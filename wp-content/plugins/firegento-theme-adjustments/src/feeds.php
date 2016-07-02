<?php

function _firegento_get_locations()
{
    global $wpdb;
    return $wpdb->get_results("SELECT DISTINCT meta_value AS location, COUNT(*) AS qty
      FROM {$wpdb->posts} AS p
      INNER JOIN {$wpdb->postmeta} AS pm ON (p.ID = pm.post_id)
      WHERE p.post_type = 'ja-event'
        AND p.post_status = 'publish'
        AND meta_key = 'januas_eventdata_city'
        GROUP BY meta_value
        ORDER BY location ASC");
}

function firegento_shortcode_stammtische()
{
    $output = '';
    foreach (_firegento_get_locations() as $location) {
        $url = add_query_arg(array(
            'taxonomy'  => 'ja-event-category',
            'post_type' => 'ja-event',
            'location'  => $location->location,
        ), home_url('feed/'));
        $output .= sprintf('<li><a href="%s" target="_blank">%s</a></li>', esc_url($url), esc_html($location->location));
    }
    return '<ul>' . $output . '</ul>';
}

function firegento_rewrite_tag()
{
    add_rewrite_tag('%location%', '([^&]+)');
}

function firegento_filter_locations($where)
{
    if (is_feed() && is_main_query() && get_query_var('location')) {
        $where->set('meta_query', array(
            array(
                'key'   => 'januas_eventdata_city',
                'value' => get_query_var('location'),
            )
        ));
    }
}

// Actions
add_action('init', 'firegento_rewrite_tag', 10, 0);

// Filters
add_filter('pre_get_posts', 'firegento_filter_locations');

// Shortcodes
add_shortcode('firegento_stammtische', 'firegento_shortcode_stammtische');
