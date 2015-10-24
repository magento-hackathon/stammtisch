<?php
/*
Plugin Name: amr events calendar or lists with ical files
Author: anmari
Author URI: http://anmari.com/
Plugin URI: http://icalevents.com
Version: 4.30
Text Domain: amr-ical-events-list
Domain Path: /lang

Description: Display simple or highly customisable and styleable list of events.  Handles all types of recurring events, notes, journals, freebusy etc. Offers links to add events to viewers calendar or subscribe to whole calendar.  Write Calendar Page</a>  and put [iCal http://yoururl.ics ] where you want the list of events of an ics file and [events] to get internal events.      To tweak: <a href="admin.php?page=manage_amr_ical">Manage Settings Page</a>,  <a href="widgets.php">Manage Widget</a>.

/*  Copyright 2009  AmR iCal Events List  (email : anmari@anmari.com)
    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License see <http://www.gnu.org/licenses/>.
    for more details.
*/
//  NB Change version in code too define('AMR_ICAL_LIST_VERSION', '3.0.1');

define('AMR_ICAL_LIST_VERSION', '4.30');
define('AMR_PHPVERSION_REQUIRED', '5.2.0');
/*  these are  globals that we do not want easily changed -others are in the config file */
define( 'AMR_BASENAME', plugin_basename( __FILE__ ) );

	require_once('includes/amr-ical-groupings.php'); // must be before shortcode function
	require_once('includes/amr-ical-config.php');
	require_once('includes/amr-upcoming-events-widget.php');
	require_once('includes/amr-ical-events-list-main.php');
	require_once('includes/amr-import-ical.php');
	require_once('includes/amr-rrule.php');

	require_once('includes/amr_date_i18n.php');
	require_once('includes/amr-ical-calendar.php');
	require_once('includes/amr-ical-pretty-print.php');
	require_once('includes/functions.php');
	require_once('includes/amr-ical-plugin-form-html.php');
//	require_once('includes/amr-ical-post-type.php');

if (is_admin()	) {  // are we in admin territory
	require_once('includes/amr-ical-list-admin.php');
	require_once('includes/amr-ical-fields-admin.php');
	include('admin/add-ons.php');
	include('admin/updates-page.php');
	include('admin/class-amr-license-handler.php');
}
/*----------------------------------------------------------------------------------------*/
function amr_ical_updates_menu($parent_slug) {
//$parent_slug, $page_title, $menu_title, $capability, $menu_slug, $function
	$amr_pluginpage['add-ons'] = add_submenu_page($parent_slug, 
			__('Add ons','amr-events'), 
			__('Add ons','amr-events'), 
			'manage_options',
			'add-ons', 'amre_add_ons_page');
			
	$page = add_submenu_page($parent_slug,        // parent slug
	'amr events add-on licensed updates'          // page title
	,'+ updates'     			// menu title
	,'manage_options'				//capability required
	,'amr_events_updates_page'             // menu slug
	,'amr_events_license_page' );   // function
	
}
/*--------------------------------------------------------------------------------------------------*/
function amr_ical_load_text() { 
// allows for a custom language file in WP_LANG_DIR as per prior versions
// note NOT in WP_LANG_DIR/plugins as that will be used by wp language pack feature

    $domain = 'amr-ical-events-list';
    // The "plugin_locale" filter is also used in load_plugin_textdomain()
    $locale = apply_filters('plugin_locale', get_locale(), $domain);
	//var_dump($locale);
	// if custom language file allowed for in prior versions exists, then load it first
    $result = load_textdomain($domain, WP_LANG_DIR.'/'.$domain.'-'.$locale.'.mo');

// wp (see l10n.php) will check wp-content/languages/plugins if nothing found in plugin dir

	//default is languages, maybe change in future?
	$result = load_plugin_textdomain( $domain, false, dirname( plugin_basename( __FILE__ ) ) . '/lang/' );
	//var_dump($result);
}

	add_action('plugins_loaded'         , 'amr_ical_load_text' );
?>