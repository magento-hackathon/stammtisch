<?php
/**
 * Template Name: Event Schedule
 *
 */
?>
<?php
$event_id = 0;
$session_location = 0;
$session_track = 0;
if (isset($_GET) && !empty($_GET['event_id']) && ctype_digit($_GET['event_id']))
    $event_id = intval($_GET['event_id']);
if (isset($_GET) && !empty($_GET['session-location']) && ctype_digit($_GET['session-location']) && $_GET['session-location'] > 0)
    $session_location = intval($_GET['session-location']);
if (isset($_GET) && !empty($_GET['session-track']) && ctype_digit($_GET['session-track']) && $_GET['session-track'] > 0)
    $session_track = intval($_GET['session-track']);
$ext_sched_page_url = januas_get_ext_schedule_url();
$event_loop = new WP_Query(array('post_type' => 'ja-event', 'post__in' => array($event_id)));
$wp_time_format = get_option("time_format");
$wp_date_format = get_option("date_format");
$event_tracks = januas_get_event_linked_terms($event_id, 'ja-session-track');
$event_locations = januas_get_event_linked_terms($event_id, 'ja-session-location');
?>
<?php get_header(); ?>

<div id="content">

    <div id="inner-content" class="wrap clearfix">

        <div id="main" class="eightcol first clearfix" role="main">

            <?php if ($event_loop->have_posts()) : while ($event_loop->have_posts()) : $event_loop->the_post(); ?>

                    <article id="post-<?php the_ID(); ?>" <?php post_class('clearfix'); ?> role="article" itemscope itemtype="http://schema.org/BlogPosting">

                        <header class="article-header">

                            <h1 class="page-title"><a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>"><?php the_title(); ?></a></h1>

                        </header> <!-- end article header -->

                        <section class="entry-content clearfix" id="advanced_schedule">
                            <form id="advanced_schedule_search" action="<?php echo $ext_sched_page_url; ?>">
                                <select name="session-track" class="chosen">
                                    <option value="0"><?php _e('Filter by track', 'januas'); ?></option>
                                    <option value="-1"><?php _e('No Filter', 'januas'); ?></option>
                                    <?php
                                    foreach ($event_tracks as $key => $track) {
                                        $selected = selected($session_track, $key, false);
                                        echo("<option value='$key' $selected>$track->name</option>");
                                    }
                                    ?>
                                </select>
                                <select name="session-location" class="chosen">
                                    <option value="0"><?php _e('Filter by location', 'januas'); ?></option>
                                    <option value="-1"><?php _e('No Filter', 'januas'); ?></option>
                                    <?php
                                    foreach ($event_locations as $key => $location) {
                                        $selected = selected($session_location, $key, false);
                                        echo("<option value='$key' $selected>$location->name</option>");
                                    }
                                    ?>
                                </select>
                                <input type="hidden" name="event_id" value="<?php the_ID(); ?>" />
                            </form>
                            <div id="event_schedule_begin_hook"></div>
                            <?php

                            function sessions_posts_fields($sql) {
                                global $wpdb;
                                return $sql . ", $wpdb->postmeta.meta_value as januas_session_date, mt2.meta_value as januas_session_time";
                            }

                            function sessions_posts_orderby($sql) {
                                return $sql . ", mt2.meta_value ASC";
                            }

                            add_filter('posts_fields', 'sessions_posts_fields');
                            add_filter('posts_orderby', 'sessions_posts_orderby');

                            $session_loop_args = array(
                                'post_type' => 'ja-session',
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
                                        'value' => get_the_ID()
                                    ),
                                ),
                                'meta_key' => 'januas_session_date',
                                'orderby' => 'meta_value',
                                'order' => 'ASC',
                                'tax_query' => array(
                                )
                            );

                            if (!empty($session_location))
                                $session_loop_args['tax_query'][] = array(
                                    'taxonomy' => 'ja-session-location',
                                    'field' => 'id',
                                    'terms' => $session_location
                                );
                            if (!empty($session_track))
                                $session_loop_args['tax_query'][] = array(
                                    'taxonomy' => 'ja-session-track',
                                    'field' => 'id',
                                    'terms' => $session_track
                                );

                            $sessions_loop = new WP_Query($session_loop_args);

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
                                    $locations = wp_get_post_terms($post->ID, 'ja-session-location');
                                    $speakers_loop_args = array('post_type' => 'ja-speaker');
                                    $speakers_list = get_post_meta($post->ID, 'januas_speakers_list', false);
                                    if (!empty($speakers_list))
                                        $speakers_loop_args['post__in'] = $speakers_list;
                                    $speakers_loop = new WP_Query($speakers_loop_args);
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
                                        ?>
                                        <div class='schedule_time'>
                                            <?php echo $time; ?>
                                            <div class="back_to_top">
                                                <a href="#event_schedule_begin_hook" title="<?php _e('Back to top', 'januas'); ?>"><?php _e('Back to top', 'januas'); ?></a>
                                            </div>
                                        </div>
                                        <?php
                                    }

                                    $str_locations = array();
                                    foreach ($locations as $location)
                                        $str_locations[] = sprintf("<a href='%s?event_id=%d&amp;session-location=%d' title='%s'>%s</a>", $ext_sched_page_url, $event_id, $location->term_id, $location->name, $location->name);
                                    ?>
                                    <div class='session_item'>
                                        <div class="session_locations">
                                            <?php echo implode(', ', $str_locations); ?>
                                        </div>
                                        <div class='session_title' <?php echo $color; ?>>
                                            <a href='<?php the_permalink(); ?>' title='<?php the_title(); ?>'><?php the_title(); ?></a>
                                        </div>
                                        <div class="session_speakers">
                                            <?php
                                            if (!empty($speakers_list))
                                                if ($speakers_loop->have_posts()): while ($speakers_loop->have_posts()): $speakers_loop->the_post();
                                                        ?>
                                                        <div class="session_speaker">
                                                            <a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>"><?php if (has_post_thumbnail()) the_post_thumbnail(array(50, 50), array('class' => 'speaker_thumbnail', 'alt' => get_the_title(), 'title' => get_the_title())); ?></a>
                                                            <a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>"><?php the_title(); ?></a>
                                                        </div>
                                                        <?php
                                                    endwhile;
                                            endif;
                                            wp_reset_query();
                                            ?>
                                        </div>
                                    </div>
                                    <?php
                                endwhile;
                            endif;
                            wp_reset_query();
                            ?>
                        </section> <!-- end article section -->

                    </article> <!-- end article -->

                    <?php
                endwhile;
            else :
                ?>

                <article id="post-not-found" class="hentry clearfix">
                    <header class="article-header">
                        <h1><?php _e("Event Not Found!", "januas"); ?></h1>
                    </header>
                    <section class="entry-content">
                        <p><?php _e("Something is missing. Try double checking things.", "januas"); ?></p>
                    </section>
                </article>

            <?php endif; ?>

        </div> <!-- end #main -->

        <?php //get_sidebar();  ?>

    </div> <!-- end #inner-content -->

</div> <!-- end #content -->

<?php get_footer(); ?>