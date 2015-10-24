<?php
$januas_options = get_option('januas_theme_options');
$search_layout = empty($januas_options['search-layout']) ? 'fixed-range' : $januas_options['search-layout'];
$event_categories = get_terms('ja-event-category', array('orderby' => 'count', 'order' => 'DESC'));
$events_count = wp_count_posts('ja-event');
$locations = $wpdb->get_results("SELECT DISTINCT meta_value, count(*) count
                                                                                FROM $wpdb->posts p INNER JOIN $wpdb->postmeta pm ON p.ID = pm.post_id
                                                                                WHERE p.post_type = 'ja-event' AND p.post_status = 'publish' AND meta_key = 'januas_eventdata_city'
                                                                                GROUP BY meta_value
                                                                                ORDER BY count DESC, meta_value ASC");
$count_location = 0;
foreach ($locations as $location)
    $count_location += $location->count;

global $text_s, $event_category_s, $event_location_s, $event_time_s, $start_date_s, $end_date_s, $start_timestamp_s, $end_timestamp_s;
?>
<div id="sidebar1" class="sidebar fourcol last clearfix" role="complementary">
    <form method="get" action="<?php echo home_url('/'); ?>">
        <div id="search_box">
            <input type="text" value="<?php echo $text_s; ?>" name="s" class="text" />
            <input type="image" class="submit" src="<?php bloginfo('template_directory') ?>/lib/images/lens.png" alt="<?php _e('Search', 'januas'); ?>" />
        </div>
        <div id="advanced_search">
            <h4><?php _e('Categories', 'januas'); ?></h4>
            <ul>
                <?php
                if ($event_categories)
                    foreach ($event_categories as $event_category) {
                        ?>
                        <li>
                            <input type="checkbox" name="event-category[]" value="<?php echo $event_category->term_id; ?>" <?php echo in_array($event_category->term_id, $event_category_s) ? 'checked="checked"' : ''; ?> /><label><?php echo $event_category->name; ?> (<?php echo $event_category->count; ?>)</label>
                        </li>
                        <?php
                    }
                ?>
            </ul>
            <h4><?php _e('Locations', 'januas'); ?></h4>
            <ul>
                <?php
                if ($locations) {
                    foreach ($locations as $location) {
                        ?>
                        <li>
                            <input type="checkbox" name="event-location[]" value="<?php echo $location->meta_value; ?>" <?php echo in_array($location->meta_value, $event_location_s) ? 'checked="checked"' : ''; ?> /><label><?php echo $location->meta_value; ?> (<?php echo $location->count; ?>)</label>
                        </li>
                        <?php
                    }
                }
                ?>
            </ul>
            <h4><?php _e('Time', 'januas'); ?></h4>
            <?php if ($search_layout == 'fixed-range') { ?>
                <ul>
                    <li>
                        <input type="radio" name="event-time" value="" <?php echo $event_time_s == '' ? 'checked="checked"' : ''; ?> /><label><?php _e('All', 'januas'); ?> (<?php echo $events_count->publish; ?>)</label>
                    </li>
                    <?php
                    $times = array(
                        '+1 day' => __('Next 24 Hours', 'januas'),
                        '+7 days' => __('Next 7 Days', 'januas'),
                        '+14 days' => __('Next 14 Days', 'januas'),
                        '+4 weeks' => __('Next 4 Weeks', 'januas'),
                        '+3 months' => __('Next 3 Months', 'januas'),
                        '+6 months' => __('Next 6 Months', 'januas'),
                        '+1 year' => __('Next Year', 'januas'),
                    );
                    foreach ($times as $key => $value) {
                        $count = januas_get_count_by_time($key);
                        if ($count > 0) {
                            ?>
                            <li>
                                <input type="radio" name="event-time" value="<?php echo $key; ?>" <?php echo $event_time_s == $key ? 'checked="checked"' : ''; ?> /><label><?php echo $value; ?> (<?php echo $count; ?>)</label>
                            </li>
                            <?php
                        }
                    }
                    ?>
                </ul>
            <?php } else if ($search_layout == 'custom-range') { ?>
                <ul class="custom_date_search">
                    <li><label for="event-date-start"><?php _e('From', 'januas'); ?></label><input type="text" id="event-date-start" value="<?php echo $start_date_s; ?>" /></li>
                    <li>
                        <label for="event-date-end"><?php _e('To', 'januas'); ?></label><input type="text" id="event-date-end" value="<?php echo $end_date_s; ?>" />
                        <input type="hidden" id="event-timestamp-start" name="event-date-start" value="<?php echo $start_timestamp_s; ?>" />
                        <input type="hidden" id="event-timestamp-end" name="event-date-end" value="<?php echo $end_timestamp_s; ?>" />
                        <input type="image" class="submit" src="<?php bloginfo('template_directory') ?>/lib/images/lens.png" alt="<?php _e('Search', 'januas'); ?>" />
                    </li>
                </ul>
            <?php } ?>
        </div>
    </form>
</div>