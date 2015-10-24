<?php
$januas_options = get_option('januas_theme_options');
$home_quick_search = empty($januas_options['home-quick-search']) ? 'category' : $januas_options['home-quick-search'];
?>
<div id="upcoming_search">
    <form method="get" action="<?php echo home_url('/'); ?>">
        <span class="upcoming_title"><?php _e('Upcoming events', 'januas'); ?></span>
        <input type="text" name="s" value="" class="search" /><span><?php _e('OR', 'januas'); ?></span>
        <?php
        if ($home_quick_search == 'category')
            wp_dropdown_categories(array('name' => 'event-category[]', 'taxonomy' => 'ja-event-category', 'selected' => 0, 'class' => 'category chosen', 'show_option_all' => __('By Category...', 'januas')));
        else if ($home_quick_search == 'time') {
            ?>
            <select name="event-time" class="chosen">
                <option value=""><?php _e('By time', 'januas'); ?></option>
                <option value="+1 day"><?php _e('Next 24 Hours', 'januas'); ?></option>
                <option value="+7 days"><?php _e('Next 7 Days', 'januas'); ?></option>
                <option value="+14 days"><?php _e('Next 14 Days', 'januas'); ?></option>
                <option value="+4 weeks"><?php _e('Next 4 Weeks', 'januas'); ?></option>
                <option value="+3 months"><?php _e('Next 3 Months', 'januas'); ?></option>
                <option value="+6 months"><?php _e('Next 6 Months', 'januas'); ?></option>
                <option value="+1 year"><?php _e('Next Year', 'januas'); ?></option>
            </select>
            <?php
        }
        ?>
        <input type="submit" value="<?php _e('Search', 'januas'); ?>" class="submit" />
    </form>
</div>