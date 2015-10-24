<?php global $post; ?>
<?php
$ext_sched_page_url = januas_get_ext_schedule_url();
$wp_time_format = get_option("time_format");
$wp_date_format = get_option("date_format");

function sessions_posts_fields($sql) {
    global $wpdb;
    return $sql . ", $wpdb->postmeta.meta_value as januas_session_date, mt2.meta_value as januas_session_time";
}

function sessions_posts_orderby($sql) {
    return $sql . ", mt2.meta_value ASC";
}
?>
<div class="event_element schedule">
    <a id="schedule_hook" class="hook"></a>
    <?php if (get_post_meta($post->ID, 'januas_schedule_showtitle', true) == 'y') { ?>
        <header class="article-header">					
            <h4><?php _e('Schedule', 'januas'); ?></h4>					
        </header>
    <?php } ?>
    <section class="entry-content clearfix">
        <?php
        add_filter('posts_fields', 'sessions_posts_fields');
        add_filter('posts_orderby', 'sessions_posts_orderby');
        /* add_filter('query', 'my_query');
          function my_query($s){
          echo $s;
          } */
        $sessions_loop = new WP_Query(
                        array(
                            'post_type' => 'ja-session',
                            'post_status' => array('publish'),
                            'nopaging' => true,
                            'meta_query' => array(
                                array(
                                    'key' => 'januas_session_date',
                                    'compare' => 'EXISTS',
                                ),
                                array(
                                    'key' => 'januas_session_time',
                                    'compare' => 'EXISTS',
                                ),
                                array(
                                    'key' => 'januas_session_event',
                                    'compare' => '=',
                                    'value' => $post->ID
                                ),
                            ),
                            'meta_key' => 'januas_session_date',
                            'orderby' => 'meta_value',
                            'order' => 'ASC'
                        )
        );

        remove_filter('posts_fields', 'sessions_posts_fields');
        remove_filter('posts_orderby', 'sessions_posts_orderby');

        $current_date = 0;
        $current_time = '';
        $session_counter = 0;
        if ($sessions_loop->have_posts()): while ($sessions_loop->have_posts()): $sessions_loop->the_post();
                global $post;
                $color = '';
                ++$session_counter;

                $time = $post->januas_session_time;
                if (!empty($time)) {
                    $time_parts = explode(':', $time);
                    if (count($time_parts) == 2) {
                        $time = mktime($time_parts[0], $time_parts[1], 0);
                        $time = date($wp_time_format, $time);
                    }
                }

                $tracks = wp_get_post_terms($post->ID, 'ja-session-track', array('fields' => 'ids', 'count' => 1));
                if ($tracks && count($tracks) > 0)
                    $color = 'style="background-color:' . januas_get_term_meta('ja-session-track-metas', $tracks[0], 'session_track_color') . ';"';
                if ($post->januas_session_date != $current_date) {
                    $current_date = $post->januas_session_date;
                    if ($session_counter > 1)
                        echo('<div class="schedule_separator"></div>');
                    echo "<div class='schedule_date'>" . date_i18n($wp_date_format, $post->januas_session_date) . "</div>";
                }
                if ($post->januas_session_time != $current_time) {
                    $current_time = $post->januas_session_time;
                    if ($session_counter > 1)
                        echo('<div class="schedule_time_separator"></div>');
                    echo "<div class='schedule_time'>$time</div>";
                }
                echo sprintf("<div class='schedule_title'><a href='%s' title='%s' %s>%s</a></div>", get_permalink($post->ID), get_the_title(), $color, get_the_title());
            endwhile;
        endif;
        wp_reset_query();
        ?>
        <?php if (!empty($ext_sched_page_url)): ?>
            <a class="advanced_schedule_link" title="<?php _e('View the Full Schedule', 'januas'); ?>" href="<?php echo $ext_sched_page_url; ?>?event_id=<?php echo $post->ID; ?>"><?php _e('View the Full Schedule', 'januas'); ?></a>
        <?php endif; ?>
    </section>
</div>