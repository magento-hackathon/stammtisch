<?php get_header(); ?>
<?php get_template_part('section', 'slider'); ?>
<?php get_template_part('section', 'upcoming_search'); ?>
<?php get_template_part('section', 'sponsor-top'); ?>

<div id="content">
    <div id="inner-content" class="wrap clearfix">
        <div id="main" class="eightcol first clearfix" role="main">
            <?php
            query_posts(array(
                'post_type' => 'ja-event',
                'orderby' => 'meta_value',
                'order' => 'ASC',
                'meta_key' => 'januas_eventdata_startdate',
                'meta_query' => array(
                    array(
                        'key' => 'januas_eventdata_homepage',
                        'value' => 'y',
                        'compare' => '='
                    )
                )
            ));
            $i = 0;
            if (have_posts()) : while (have_posts()) : the_post();
                    if (get_post_meta($post->ID, 'januas_eventdata_featured', true) == 'y')
                        continue;
                    $event_categories = wp_get_post_terms($post->ID, 'ja-event-category');
                    $event_state = get_post_meta($post->ID, 'januas_eventdata_state', true);
                    $event_date = get_post_meta($post->ID, 'januas_eventdata_startdate', true);
                    ?>
                    <article id="post-<?php the_ID(); ?>" class="clearfix post <?php if ($i % 3 == 1) echo 'central'; ?> <?php echo $event_state; ?>" role="article"> 
                        <ul class="post-categories">
                            <?php
                            if (count($event_categories) > 0)
                                foreach ($event_categories as $event_category) {
                                    $color = januas_get_term_meta('ja-event-category-metas', $event_category->term_id, 'event_color');
                                    ?>
                                    <li <?php if (!empty($color)) echo "style='background-color:$color;'"; ?>><a href="<?php echo home_url() . '/?s=&amp;event-category[]=' . $event_category->term_id; ?>" <?php if (!empty($color)) echo "style='background-color:$color;'"; ?>><?php echo $event_category->name; ?></a></li>
                                    <?php
                                }
                            ?>
                            <li class="shadow"></li>
                        </ul>
                        <header class="article-header">
                            <h1 class="h2"><a href="<?php the_permalink() ?>" rel="bookmark" title="<?php the_title_attribute(); ?>"><?php echo januas_get_reduced_title(get_the_title()); ?></a></h1>
                            <p class="byline vcard"><?php _e('When:', 'januas'); ?> <time class="updated" datetime="<?php the_time('c'); ?>"><?php echo !empty($event_date) ? date_i18n(get_option('date_format'), get_post_meta($post->ID, 'januas_eventdata_startdate', true)) : ''; ?></time> 
                            </p>
                        </header> <!-- end article header -->
                        <section class="entry-content clearfix">
                            <a href="<?php the_permalink(); ?>">
                                <?php the_post_thumbnail('januas-medium'); ?>
                            </a>
                        </section> <!-- end article section -->
                        <footer class="article-footer">
                            <p class="tags">
                                <a href="#" class="share"><?php _e('SHARE', 'januas'); ?></a>
                                <a href="<?php the_permalink(); ?>" class="more"><?php _e('MORE', 'januas'); ?></a>
                            </p>
                            <div class="share_panel" style="display: none;"><?php januas_social_sharing($post->ID); ?></div>
                        </footer> <!-- end article footer -->
                        <?php
                        $januas_options = get_option('januas_theme_options');
                        $home_layout = empty($januas_options['home-layout']) ? 'three-columns' : $januas_options['home-layout'];
                        $theme_color = empty($januas_options['theme-color']) ? '' : '_' . $januas_options['theme-color'];
                        ?>
                        <img src="<?php echo get_stylesheet_directory_uri(); ?>/lib/images/sold_out_<?php echo $home_layout . $theme_color; ?>.png" class="soldout overlay" alt="<?php _e('Sold Out', 'januas'); ?>" />
                        <img src="<?php echo get_stylesheet_directory_uri(); ?>/lib/images/ended_<?php echo $home_layout; ?>.png" class="ended overlay" alt="<?php _e('Ended', 'januas'); ?>" />
                    </article> <!-- end article -->
                    <?php
                    $i++;
                endwhile;
                ?>	
            <?php else : ?>
                <article id="post-not-found" class="hentry clearfix">
                    <header class="article-header">
                        <h1><?php _e("Create your first event", "januas"); ?></h1>
                    </header>
                </article>
            <?php endif; ?>
        </div> <!-- end #main -->
    </div> <!-- end #inner-content -->
</div> <!-- end #content -->

<?php get_template_part('section', 'latest-news'); ?>
<?php get_footer(); ?>