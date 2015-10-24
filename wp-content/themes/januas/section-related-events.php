<?php
global $post;

$januas_options = get_option('januas_theme_options');
$theme_color = empty($januas_options['theme-color']) ? '' : '_' . $januas_options['theme-color'];
$show_related = get_post_meta($post->ID, 'januas_eventdata_showrelated', true);
if ($show_related == 'y') {
    ?>
    <div id="related_events_section">
        <div id="related_events_container">
            <?php
            $cat_array = array();
            $categories = get_the_terms($post->ID, 'ja-event-category');
            if ($categories && count($categories) > 0)
                foreach ($categories as $category) {
                    array_push($cat_array, $category->term_id);
                }
            $args = array(
                'orderby' => 'date',
                'order' => 'DESC',
                'post_type' => 'ja-event',
                'posts_per_page' => 3,
                'post__not_in' => array($post->ID),
                'tax_query' => array(
                    array(
                        'taxonomy' => 'ja-event-category',
                        'field' => 'id',
                        'terms' => $cat_array
                    ),
                ),
                'meta_query' => array(
                    array(
                        'key' => 'januas_eventdata_state',
                        'compare' => '=',
                        'value' => 'active'
                    )
                )
            );
            $my_query = new WP_Query($args);
            if ($my_query->have_posts()) :
                ?>
                <h2 class="section_title"><?php _e('RELATED EVENTS', 'januas'); ?></h2>
                <?php
                while ($my_query->have_posts()) : $my_query->the_post();
                    $event_date = get_post_meta($post->ID, 'januas_eventdata_startdate', true);
                    ?>
                    <article id="post-<?php the_ID(); ?>" class="latest-news clearfix post <?php if ($i == 1) echo 'central'; ?>" role="article"> 
                        <ul class="post-categories">
                            <?php
                            $event_categories = wp_get_post_terms($post->ID, 'ja-event-category');
                            if (count($event_categories) > 0)
                                foreach ($event_categories as $event_category) {
                                    $color = januas_get_term_meta('ja-event-category-metas', $event_category->term_id, 'event_color');
                                    ?>
                                    <li <?php if (!empty($color)) echo "style='background-color:$color;'"; ?>><a href="<?php echo home_url() . '/?s=&event-category[]=' . $event_category->term_id; ?>"><?php echo $event_category->name; ?></a></li>
                                    <?php
                                }
                            ?>
                        </ul>						
                        <header class="article-header">
                            <a href="<?php the_permalink(); ?>">
                                <?php the_post_thumbnail('thumbnail'); ?>
                            </a>
                            <h1 class="h2"><a href="<?php the_permalink() ?>" rel="bookmark" title="<?php the_title_attribute(); ?>"><?php echo januas_get_reduced_title(get_the_title()); ?></a></h1>
                            <p class="byline vcard"><time class="updated" datetime="<?php echo the_time('c'); ?>"><?php echo !empty($event_date) ? date_i18n(get_option('date_format'), $event_date) : ''; ?></time> 
                            </p>
                        </header> <!-- end article header -->
                    </article> <!-- end article -->
                    <?php
                    $i++;
                endwhile;
            endif;
            ?>
        </div>
    </div>
    <?php
}
?>