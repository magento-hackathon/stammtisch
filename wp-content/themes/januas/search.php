<?php
wp_enqueue_script('jquery-ui');
wp_enqueue_script('jquery-ui-i18n');
wp_enqueue_style('jquery-ui-januas-theme', get_stylesheet_directory_uri() . '/lib/styles/blitzer/jquery-ui-1.9.2.custom.min.css');
wp_enqueue_script('januas-search-page', get_stylesheet_directory_uri() . '/lib/scripts/januas-search-page.js', array('jquery', 'jquery-ui'));

$januas_options = get_option('januas_theme_options');
$theme_color = empty($januas_options['theme-color']) ? '' : '_' . $januas_options['theme-color'];
$wp_date_format = get_option('date_format');
$text_s = isset($_GET['s']) ? $_GET['s'] : '';
$event_category_s = isset($_GET['event-category']) ? $_GET['event-category'] : array();
$event_location_s = isset($_GET['event-location']) ? $_GET['event-location'] : array();
$event_time_s = isset($_GET['event-time']) ? $_GET['event-time'] : '';
$start_timestamp_s = isset($_GET['event-date-start']) ? $_GET['event-date-start'] : '';
$end_timestamp_s = isset($_GET['event-date-end']) ? $_GET['event-date-end'] : '';
$start_date_s = $start_timestamp_s != '' ? date($wp_date_format, $start_timestamp_s) : '';
$end_date_s = $end_timestamp_s != '' ? date($wp_date_format, $end_timestamp_s) : '';
$paged_s = isset($_GET['paged']) ? intval($_GET['paged']) : 0;

if (count($event_category_s) == 1 && $event_category_s[0] == 0)
    $event_category_s = array();
?>

<?php get_header(); ?>
<?php get_template_part('section', 'menu_search'); ?>

<div id="content">

    <div id="inner-content" class="wrap clearfix">

        <?php get_sidebar('search'); ?>

        <div id="main" class="eightcol first clearfix" role="main">
            <?php
            $args = array(
                's' => $text_s,
                'post_type' => 'ja-event',
                'paged' => $paged_s,
                'orderby' => 'meta_value',
                'order' => 'ASC',
                'meta_key' => 'januas_eventdata_startdate'
            );
            if (!empty($event_category_s) && !in_array('', $event_category_s))
                $args['tax_query'][] = array(
                    'taxonomy' => 'ja-event-category',
                    'field' => 'id',
                    'terms' => $event_category_s
                );
            if (!empty($event_location_s) && !in_array('', $event_location_s))
                $args['meta_query'][] = array(
                    'key' => 'januas_eventdata_city',
                    'value' => $event_location_s,
                );
            if (!empty($event_time_s))
                $args['meta_query'][] = array(
                    'key' => 'januas_eventdata_startdate',
                    'value' => array(strtotime('now'), strtotime($event_time_s)),
                    'compare' => 'BETWEEN'
                );
            if (!empty($start_timestamp_s))
                $args['meta_query'][] = array(
                    'key' => 'januas_eventdata_startdate',
                    'value' => $start_timestamp_s,
                    'compare' => '>='
                );
            if (!empty($end_timestamp_s))
                $args['meta_query'][] = array(
                    'key' => 'januas_eventdata_startdate',
                    'value' => $end_timestamp_s,
                    'compare' => '<='
                );
            query_posts($args);
            ?>

            <?php if (have_posts()) : while (have_posts()) : the_post(); ?>
                    <?php
                    $event_categories = wp_get_post_terms(get_the_ID(), 'ja-event-category');
                    $event_state = get_post_meta(get_the_ID(), 'januas_eventdata_state', true);
                    $event_date = get_post_meta($post->ID, 'januas_eventdata_startdate', true);
                    ?>
                    <article id="post-<?php the_ID(); ?>" class="clearfix post <?php echo $event_state; ?>" role="article"> 
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
                            <p class="byline vcard"><?php _e('When:', 'januas'); ?> <time class="updated" datetime="<?php the_time(get_option('c')); ?>"><?php echo!empty($event_date) ? date_i18n($wp_date_format, get_post_meta($post->ID, 'januas_eventdata_startdate', true)) : ''; ?></time> 
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
                        <img src="<?php echo get_stylesheet_directory_uri(); ?>/lib/images/sold_out_three-columns<?php echo $theme_color; ?>.png" class="soldout overlay" alt="<?php _e('Sold Out', 'januas'); ?>" />
                        <img src="<?php echo get_stylesheet_directory_uri(); ?>/lib/images/ended_three-columns.png" class="ended overlay" alt="<?php _e('Ended', 'januas'); ?>" />
                    </article> <!-- end article -->

                <?php endwhile; ?>	

                <?php if (function_exists('januas_page_navi')) { ?>
                    <?php januas_page_navi(); ?>
                <?php } else { ?>
                    <nav class="wp-prev-next">
                        <ul class="clearfix">
                            <li class="prev-link"><?php next_posts_link(__('&laquo; Older Entries', "januas")) ?></li>
                            <li class="next-link"><?php previous_posts_link(__('Newer Entries &raquo;', "januas")) ?></li>
                        </ul>
                    </nav>
                <?php } ?>		

            <?php else : ?>

                <article id="post-not-found" class="hentry clearfix">
                    <header class="article-header">
                        <h1><?php _e("Sorry, No Results.", "januas"); ?></h1>
                    </header>
                    <section class="entry-content">
                        <p><?php _e("Try your search again.", "januas"); ?></p>
                    </section>
                    <footer class="article-footer">
                    </footer>
                </article>

            <?php endif; ?>

        </div> <!-- end #main -->

    </div> <!-- end #inner-content -->

</div> <!-- end #content -->

<?php get_footer(); ?>