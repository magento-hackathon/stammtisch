<?php get_header(); ?>

<div id="content">

    <div id="inner-content" class="wrap clearfix">

        <div id="main" class="eightcol first clearfix" role="main">

            <?php if (have_posts()) : while (have_posts()) : the_post(); ?>
                    <?php
                    $company = get_post_meta($post->ID, 'januas_speaker_company', true);
                    $qualification = get_post_meta($post->ID, 'januas_speaker_qualification', true);
                    $website = get_post_meta($post->ID, 'januas_speaker_website', true);
                    $twitter = get_post_meta($post->ID, 'januas_speaker_twitter', true);
                    ?>
                    <article id="post-<?php the_ID(); ?>" <?php post_class('clearfix'); ?> role="article">

                        <header class="article-header">

                            <?php the_post_thumbnail('large'); ?>

                            <h1 class="page-title"><?php the_title(); ?></h1>

                        </header> <!-- end article header -->

                        <section class="entry-content clearfix">
                            <?php the_content(); ?>
                            <ul class="speaker_info">
                                <?php if (!empty($company)): ?>
                                    <li class="company"><span class="key"><?php _e('Company:', 'januas'); ?></span><span class="value"><?php echo $company; ?></span></li>
                                <?php endif; ?>
                                <?php if (!empty($qualification)): ?>
                                    <li class="qualification"><span class="key"><?php _e('Short Bio:', 'januas'); ?></span><span class="value"><?php echo $qualification; ?></span></li>
                                <?php endif; ?>
                                <?php if (!empty($website)): ?>
                                    <li class="website"><span class="value"><a href="<?php echo $website; ?>" title="<?php the_title(); ?>"><?php echo $website; ?></a></span></li>
                                <?php endif; ?>
                                <?php if (!empty($twitter)): ?>
                                    <li class="twitter"><span class="key"><?php _e('Twitter:', 'januas'); ?></span><span class="value"><a href="http://www.twitter.com/<?php echo $twitter; ?>"><?php echo $twitter; ?></a></span></li>
                                <?php endif; ?>
                            </ul>
                            <a href="#" onclick="history.back();return false;" class="goback"><?php _e('Go back', 'januas'); ?></a>
                            <h3><?php _e('Sessions', 'januas'); ?></h3>
                            <ul class="speaker_sessions">
                                <?php
                                $speaker_id = get_the_ID();

                                function sessions_posts_fields($sql) {
                                    global $wpdb;
                                    return $sql . ", $wpdb->postmeta.meta_value as januas_session_date, mt2.meta_value as januas_session_time";
                                }

                                function sessions_posts_orderby($sql) {
                                    return $sql . ", mt2.meta_value DESC";
                                }

                                add_filter('posts_fields', 'sessions_posts_fields');
                                add_filter('posts_orderby', 'sessions_posts_orderby');

                                $sessions_loop = new WP_Query(
                                                array(
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
                                                    ),
                                                    'meta_key' => 'januas_session_date',
                                                    'orderby' => 'meta_value',
                                                    'order' => 'DESC'
                                                )
                                );

                                remove_filter('posts_fields', 'sessions_posts_fields');
                                remove_filter('posts_orderby', 'sessions_posts_orderby');

                                $i = 0;
                                if ($sessions_loop->have_posts()):
                                    while ($sessions_loop->have_posts()):
                                        $sessions_loop->the_post();
                                        if (in_array($speaker_id, get_post_meta(get_the_ID(), 'januas_speakers_list', false))) {
                                            $date = get_post_meta(get_the_ID(), 'januas_session_date', true);
                                            $time = get_post_meta(get_the_ID(), 'januas_session_time', true);
                                            $event_id = get_post_meta(get_the_ID(), 'januas_session_event', true);
                                            ++$i;
                                            ?>
                                            <li class="speaker_session">
                                                <span class="speaker_session_info"><?php echo date_i18n(get_option('date_format'), $date); ?>, <?php echo $time; ?></span>
                                                <h4><a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>"><?php the_title(); ?></a></h4>
                                                <a href="<?php echo get_permalink($event_id); ?>" title="<?php echo get_the_title($event_id); ?>" class="speaker_session_event"><?php echo get_the_title($event_id); ?></a>
                                            </li>
                                            <?php
                                        }
                                    endwhile;
                                    wp_reset_query();
                                endif;
                                if ($i == 0) {
                                    ?>
                                    <li><?php _e('No sessions found', 'januas'); ?></li>
                                    <?php
                                }
                                ?>
                            </ul>
                        </section> <!-- end article section -->

                    </article> <!-- end article -->

                    <?php
                endwhile;
            else :
                ?>

                <article id="post-not-found" class="hentry clearfix">
                    <header class="article-header">
                        <h1><?php _e("Post Not Found!", "januas"); ?></h1>
                    </header>
                    <section class="entry-content">
                        <p><?php _e("Something is missing. Try double checking things.", "januas"); ?></p>
                    </section>
                </article>

            <?php endif; ?>

        </div> <!-- end #main -->

        <?php //get_sidebar(); ?>

    </div> <!-- end #inner-content -->

</div> <!-- end #content -->

<?php get_footer(); ?>