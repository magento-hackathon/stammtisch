<?php
/**
 * Admin Add-ons
 *
 * @package     
 * @subpackage  Admin/Add-ons
 * @license     http://opensource.org/licenses/gpl-2.0.php GNU Public License
 * @since       1.0
 */

// Exit if accessed directly
if ( ! defined( 'ABSPATH' ) ) exit;

/**
 * Add-ons Page Init
 *
 * Hooks check feed to the page load action.
 *
 * @since 1.0
 * @global $amre_add_ons_page  Add-ons Pages
 * @return void
 */
function amre_add_ons_init() {
	global $amre_add_ons_page;
	add_action( 'load-' . $amre_add_ons_page, 'amre_add_ons_check_feed' );
}
add_action( 'admin_menu', 'amre_add_ons_init');

/**
 * Add-ons Page
 *
 * Renders the add-ons page content.
 *
 * @since 1.0
 * @return void
 */
function amre_add_ons_page() {
	$url = 'http://icalevents.com/plugins_downloads/'
	.'?utm_source=plugin-addons-page'
	.'&amp;utm_medium=plugin'
	.'&amp;utm_campaign=amr-events-plugin%20addons%20page'
	.'&amp;utm_content=All%20Addons';
	?>
	<div class="wrap" id="amru-add-ons">
		<h2>
			<?php _e( 'Add Ons for amr-events', 'amr-events' ); ?>
			&nbsp;&mdash;&nbsp;<a href="<?php echo $url; ?>" class="button-primary" title="<?php _e( 'Browse All Add-ons', 'amr-events' ); ?>" target="_blank"><?php _e( 'Browse All Add-ons', 'amr-events' ); ?></a>
		</h2>
	<?php echo amre_add_ons_get_feed(); ?>
	</div>
<?php
}

/**
 * Add-ons Get Feed
 *
 * Gets the add-ons page feed.
 *
 * @since 1.0
 * @return void
 */
function amre_add_ons_get_feed() {
	$feed_url = 'http://icalevents.com/?feed=addons';
	$transient_name = 'icalevents_add_ons_feed';
	
	if ( false === ( $cache = get_transient( $transient_name ) ) ) {
		$feed = wp_remote_get($feed_url);
		//var_dump($feed);
		if ( ! is_wp_error( $feed ) ) {
			if ( isset( $feed['body'] ) && strlen( $feed['body'] ) > 0 ) {
				$cache = wp_remote_retrieve_body( $feed );
				set_transient( $transient_name, $cache, 1 );
			}
		} else {
			$cache = '<div class="error"><p>' . __( 'There was an error retrieving the add-ons list from the server. Please try again later.', 'amr-events' ) . '</p></div>';
		}
	}
	return $cache;
}