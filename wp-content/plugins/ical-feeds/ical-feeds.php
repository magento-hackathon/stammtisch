<?php
/*
Plugin Name: iCal Feeds
Plugin URI: http://maxime.sh/ical-feeds
Description: Generate a customizable iCal feed of your present and future blog posts.
Author: Maxime VALETTE
Author URI: http://maxime.sh
Version: 1.2.4
*/

define('ICALFEEDS_TEXTDOMAIN', 'icalfeeds');
define('ICALFEEDS_SLUG', 'icalfeeds');

if (function_exists('load_plugin_textdomain')) {
	load_plugin_textdomain(ICALFEEDS_TEXTDOMAIN, false, dirname(plugin_basename(__FILE__)).'/languages' );
}

add_action('admin_menu', 'icalfeeds_config_page');

function icalfeeds_config_page() {

	if (function_exists('add_submenu_page')) {

        add_submenu_page('options-general.php',
            __('iCal Feeds', ICALFEEDS_TEXTDOMAIN),
            __('iCal Feeds', ICALFEEDS_TEXTDOMAIN),
            'manage_options', ICALFEEDS_SLUG, 'icalfeeds_conf');

    }

}

function icalfeeds_conf() {

	$options = get_option('icalfeeds');

    if (!isset($options['icalfeeds_minutes'])) $options['icalfeeds_minutes'] = 60;	
    if (!isset($options['icalfeeds_secret'])) $options['icalfeeds_secret'] = 'changeme';
    if (!isset($options['icalfeeds_senable'])) $options['icalfeeds_senable'] = 0;

	$updated = false;

	if (isset($_POST['submit'])) {

		check_admin_referer('icalfeeds', 'icalfeeds-admin');

        if (isset($_POST['icalfeeds_minutes'])) {
            $icalfeeds_minutes = (int) $_POST['icalfeeds_minutes'];
        } else {
            $icalfeeds_minutes = 60;
        }

        if (isset($_POST['icalfeeds_secret'])) {
            $icalfeeds_secret = $_POST['icalfeeds_secret'];
        } else {
            $icalfeeds_secret = 'changeme';
        }

        if (isset($_POST['icalfeeds_senable'])) {
            $icalfeeds_senable = $_POST['icalfeeds_senable'];
        } else {
            $icalfeeds_senable = 0;
        }

		$options['icalfeeds_minutes'] = $icalfeeds_minutes;
		$options['icalfeeds_secret'] = $icalfeeds_secret;
        $options['icalfeeds_senable'] = $icalfeeds_senable;

		update_option('icalfeeds', $options);

		$updated = true;

	}

    echo '<div class="wrap">';

    if ($updated) {

        echo '<div id="message" class="updated fade"><p>';
        _e('Configuration updated.', ICALFEEDS_TEXTDOMAIN);
        echo '</p></div>';

    }

    $timezone = get_option('timezone_string');

    if (empty($timezone)) {

        echo '<div id="message" class="error"><p>';
        _e('You have to define your current timezone (specify a city) in', ICALFEEDS_TEXTDOMAIN);
        echo ' <a href="options-general.php">'.__('Settings > General', ICALFEEDS_TEXTDOMAIN).'</a>';
        echo ".</p></div>";

    }

    echo '<h2>'.__('iCal Feeds Configuration', ICALFEEDS_TEXTDOMAIN).'</h2>';

    echo '<p>'.__('', ICALFEEDS_TEXTDOMAIN).'</p>';

    echo '<form action="'.admin_url('options-general.php?page=' . ICALFEEDS_SLUG).'" method="post" id="feeds-conf">';

    echo '<h3>'.__('Advanced Options', ICALFEEDS_TEXTDOMAIN).'</h3>';

    echo '<p><input id="icalfeeds_senable" name="icalfeeds_senable" type="checkbox" value="1"';
    if ($options['icalfeeds_senable'] == 1) echo ' checked';
    echo '/> <label for="icalfeeds_senable">'.__('Enable a secret parameter to view future posts.', ICALFEEDS_TEXTDOMAIN).'</label></p>';

    echo '<h3><label for="icalfeeds_secret">'.__('Secret parameter value:', ICALFEEDS_TEXTDOMAIN).'</label></h3>';
    echo '<p><input type="text" id="icalfeeds_secret" name="icalfeeds_secret" value="'.$options['icalfeeds_secret'].'" style="width: 200px;" /></p>';

    echo '<h3><label for="icalfeeds_minutes">'.__('Time interval per post:', ICALFEEDS_TEXTDOMAIN).'</label></h3>';
    echo '<p><input type="text" id="icalfeeds_minutes" name="icalfeeds_minutes" value="'.$options['icalfeeds_minutes'].'" style="width: 50px; text-align: center;" /> '.__('minutes', ICALFEEDS_TEXTDOMAIN).'</p>';

    echo '<p class="submit" style="text-align: left">';
    wp_nonce_field('icalfeeds', 'icalfeeds-admin');
    echo '<input type="submit" name="submit" value="'.__('Save', ICALFEEDS_TEXTDOMAIN).' &raquo;" /></p></form>';

    echo '<h2>'.__('Main iCal feeds', ICALFEEDS_TEXTDOMAIN).'</h2>';

    echo '<p>'.__('You can use the below addresses to add in your iCal software:', ICALFEEDS_TEXTDOMAIN).'</p>';

    echo '<ul>';

    echo '<li><a href="'.site_url().'/?ical" target="_blank">'.site_url().'/?ical</a> — '.__('Public iCal feed', ICALFEEDS_TEXTDOMAIN).'</li>';

    if ($options['icalfeeds_senable'] == '1') {
        echo '<li><a href="'.site_url().'/?ical='.$options['icalfeeds_secret'].'" target="_blank">'.site_url().'/?ical='.$options['icalfeeds_secret'].'</a> — '.__('Private iCal feed', ICALFEEDS_TEXTDOMAIN).'</li>';
    }

    echo '</ul>';

    echo '<h2>'.__('Categories iCal feeds', ICALFEEDS_TEXTDOMAIN).'</h2>';

    echo '<ul>';

    $categories = get_categories();

    foreach ($categories as $category) {

        echo '<li><a href="'.site_url().'/?ical&category='.$category->category_nicename.'" target="_blank">'.site_url().'/?ical&category='.$category->category_nicename.'</a> — '.__('Public iCal feed for', ICALFEEDS_TEXTDOMAIN).' '.$category->cat_name.'</li>';

    }

	echo '</ul>';

	echo '<h2>'.__('Multiple categories iCal feeds', ICALFEEDS_TEXTDOMAIN).'</h2>';

	echo '<p>'.__('You can add multiple categories in only one URL. Just check the categories you want below:', ICALFEEDS_TEXTDOMAIN).'</p>';

	echo '<ul id="categoriesList">';

	foreach ($categories as $category) {

		echo '<li><input type="checkbox" id="' . $category->category_nicename . '"> <label for="' . $category->category_nicename . '">' . $category->cat_name . '</label>';

	}

	echo '</ul>';

	echo '<p id="categoriesUrl" style="display: none;">'.__('URL:', ICALFEEDS_TEXTDOMAIN).' <a href="'.site_url().'/?ical&category=" data-baseUrl="'.site_url().'/?ical&category=" target="_blank">'.site_url().'/?ical&category=</a></p>';

    echo '</div>';

	echo <<<HTML
<script>
jQuery(document).ready(function() {
	jQuery('#categoriesList li input').bind('change', function() {
		var url = jQuery('#categoriesUrl a').attr('data-baseUrl');
		var i = 0;
		jQuery('#categoriesList li input:checked').each(function() {
			if (i > 0) {
				url += ',';
			}
			url += jQuery(this).attr('id');
			i++;
		});
		if (i == 0) {
			jQuery('#categoriesUrl').hide();
		} else {
			jQuery('#categoriesUrl a').attr('href', url).html(url);
			jQuery('#categoriesUrl').show();
		}
	});
});
</script>
HTML;

}

function icalfeeds_feed() {

    global $wpdb;

    $options = get_option('icalfeeds');
    if (!isset($options['icalfeeds_minutes'])) $options['icalfeeds_minutes'] = 60;	

    if (isset($_GET['category'])) {

        $categories = get_categories();
        $categoryIds = array(0);
	    $niceNames = explode(',', $_GET['category']);

        foreach ($categories as $category) {

            if (in_array($category->category_nicename, $niceNames)) {

	            $categoryIds[] = $category->cat_ID;

            }

        }

    }

	$limit = null;

    if (isset($_GET['limit']) && is_numeric($_GET['limit'])) {

        $limit = 'LIMIT ' . $_GET['limit'];

    }


    $postCond = "post_status = 'publish'";


    // Get posts

    if (isset($_GET['category'])) {

	    $posts = $wpdb->get_results("SELECT $wpdb->posts.ID, $wpdb->posts.post_content, UNIX_TIMESTAMP($wpdb->posts.post_date) AS post_date, $wpdb->posts.post_title FROM $wpdb->posts
			LEFT JOIN $wpdb->term_relationships ON ($wpdb->posts.ID = $wpdb->term_relationships.object_id)
			LEFT JOIN $wpdb->term_taxonomy ON ($wpdb->term_relationships.term_taxonomy_id = $wpdb->term_taxonomy.term_taxonomy_id)
			WHERE (".$postCond.") AND $wpdb->posts.post_type = 'post' AND $wpdb->term_taxonomy.taxonomy = 'category' AND $wpdb->term_taxonomy.term_id IN (".implode(',', $categoryIds).")
			ORDER BY post_date DESC $limit");

    } else {

        $posts = $wpdb->get_results("SELECT $wpdb->posts.ID, $wpdb->posts.post_content, UNIX_TIMESTAMP($wpdb->posts.post_date) AS post_date, $wpdb->posts.post_title
            FROM $wpdb->posts
            WHERE (".$postCond.") AND $wpdb->posts.post_type = 'ja-event'
            ORDER BY post_date DESC $limit");

    }

    $events = null;

    foreach ($posts as $post) {

        // crazy french guy
        $strTime = get_post_meta($post->ID, 'januas_eventdata_starttime', true);
        $strTime = explode('-',$strTime);
        $strTimeFirst = explode(':',$strTime[0])[0];
        $strTimeSecond = explode(':',$strTime[1])[0];

        $start_time = new DateTime();
        $start_time->setTimestamp(get_post_meta($post->ID, 'januas_eventdata_startdate', true));
        $start_time->modify('+'.$strTimeFirst.' hour');
        $start_time = $start_time->format('Ymd\THis');

        $end_time = new DateTime();
        $end_time->setTimestamp(get_post_meta($post->ID, 'januas_eventdata_startdate', true));
        $end_time->modify('+'.$strTimeSecond.' hour');
        $end_time = $end_time->format('Ymd\THis');


        $summary = $post->post_title;
        $permalink = get_permalink($post->ID);
        $timezone = get_option('timezone_string');

        $events .= <<<EVENT
BEGIN:VEVENT
DTSTART;TZID=$timezone:$start_time
DTEND;TZID=$timezone:$end_time
SUMMARY:$summary
URL;VALUE=URI:$permalink
END:VEVENT

EVENT;

    }

    $blog_name = get_bloginfo('name');
    $blog_url = get_bloginfo('home');

    header('Content-type: text/calendar');
    header('Content-Disposition: attachment; filename="blog_posts.ics"');

    $content = <<<CONTENT
BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//$blog_name//NONSGML v1.0//EN
X-WR-CALNAME:{$blog_name}
X-ORIGINAL-URL:{$blog_url}
X-WR-CALDESC:Blog posts from {$blog_name}
CALSCALE:GREGORIAN
METHOD:PUBLISH
{$events}END:VCALENDAR
CONTENT;

    echo $content;

    exit;

}

// Init or not

if (isset($_REQUEST['ical'])) {

    add_action('init', 'icalfeeds_feed');

}
