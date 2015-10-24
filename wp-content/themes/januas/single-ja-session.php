<?php get_header(); ?>

<div id="content">

    <div id="inner-content" class="wrap clearfix">

        <div id="main" class="eightcol first clearfix" role="main">

            <?php if (have_posts()) : while (have_posts()) : the_post(); ?>
                    <?php
                    $date = get_post_meta($post->ID, 'januas_session_date', true);
                    $time = get_post_meta($post->ID, 'januas_session_time', true);
                    if (!empty($time)) {
                        $time_parts = explode(':', $time);
                        if (count($time_parts) == 2) {
                            $time = mktime($time_parts[0], $time_parts[1], 0);
                            $time = date(get_option("time_format"), $time);
                        }
                    }
                    $event_id = get_post_meta($post->ID, 'januas_session_event', true);
                    $tracks = wp_get_post_terms($post->ID, 'ja-session-track', array('fields' => 'all'));
                    $locations = wp_get_post_terms($post->ID, 'ja-session-location', array('fields' => 'all'));
                    $ext_sched_page_url = januas_get_ext_schedule_url();
                    $speakers_list = get_post_meta($post->ID, 'januas_speakers_list', false);
                    $speakers_loop_args = array('post_type' => 'ja-speaker');
                    if (!empty($speakers_list))
                        $speakers_loop_args['post__in'] = $speakers_list;
                    $speakers_loop = new WP_Query($speakers_loop_args);
                    ?>
                    <article id="post-<?php the_ID(); ?>" <?php post_class('clearfix'); ?> role="article">

                        <header class="article-header">

                            <?php the_post_thumbnail('large'); ?>

                            <h1 class="page-title"><?php the_title(); ?></h1>

                        </header> <!-- end article header -->

                        <section class="entry-content clearfix">
                            <?php the_content(); ?>
                            <ul class="session_info">
                                <?php if (!empty($tracks)): ?>
                                    <li class="tracks">
                                        <?php
                                        foreach ($tracks as $track) {
                                            $color = januas_get_term_meta('ja-session-track-metas', $track->term_id, 'session_track_color');
                                            if ($color && !empty($color))
                                                $color = "style='background-color:$color;'";
                                            else
                                                $color = '';
                                            if (!empty($ext_sched_page_url))
                                                $track_url = "$ext_sched_page_url/?event_id=$event_id&session-track=$track->term_id";
                                            else
                                                $track_url = '';
                                            echo "<a href='$track_url' class='track' title='$track->name' $color>$track->name</a>";
                                        }
                                        ?>
                                    </li>
                                <?php endif; ?>
                                <?php if (!empty($locations)): ?>
                                    <li class="locations">
                                        <?php
                                        foreach ($locations as $location) {
                                            if (!empty($ext_sched_page_url))
                                                $location_url = "$ext_sched_page_url?event_id=$event_id&session-location=$location->term_id";
                                            else
                                                $location_url = '';
                                            echo "<a href='$location_url' class='location' title='$location->name'>$location->name</a>";
                                        }
                                        ?>
                                    </li>
                                <?php endif; ?>
                                <?php if (!empty($date)): ?>
                                    <li class="date"><span class="key"><?php _e('Date:', 'januas'); ?></span><span class="value"><?php echo date_i18n(get_option('date_format'), $date); ?></span></li>
                                <?php endif; ?>
                                <?php if (!empty($time)): ?>
                                    <li class="time"><span class="key"><?php _e('Time:', 'januas'); ?></span><span class="value"><?php echo $time; ?></span></li>
                                <?php endif; ?>
                                <?php if (!empty($event_id)): ?>
                                    <li class="associated_event"><span class="key"><?php _e('Event:', 'januas'); ?></span><span class="value"><a href="<?php echo get_permalink($event_id); ?>" title="<?php the_title(); ?>"><?php echo get_the_title($event_id); ?></a></li>
                                <?php endif; ?>
                            </ul>
                            <div class="session_speakers">
                                <?php
                                if (!empty($speakers_list)) {
                                    if ($speakers_loop->have_posts()) {
                                        while ($speakers_loop->have_posts()): $speakers_loop->the_post();
                                            ?>
                                            <div class="session_speaker">
                                                <a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>"><?php if (has_post_thumbnail()) the_post_thumbnail(array(50, 50), array('class' => 'speaker_thumbnail', 'alt' => get_the_title(), 'title' => get_the_title())); ?></a>
                                                <a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>"><?php the_title(); ?></a>
                                            </div>
                                            <?php
                                        endwhile;
                                        wp_reset_query();
                                    }
                                }
                                ?>
                            </div>
                        </section> <!-- end article section -->

                    </article> <!-- end article -->

                    <?php
                endwhile;
            else :
                ?>

                <article id="post-not-found" class="hentry clearfix">
                    <header class="article-header">
                        <h1><?php _e("Session Not Found!", "januas"); ?></h1>
                    </header>
                </article>

            <?php endif; ?>

        </div> <!-- end #main -->

        <?php //get_sidebar(); ?>

    </div> <!-- end #inner-content -->

</div> <!-- end #content -->

<?php get_footer(); ?>