<?php global $post; ?>
<?php
global $speakers_order, $speakers_ids;
$speakers_order = get_post_meta($post->ID, 'januas_speakers_speakersorder', true);

function order_speakers_ids($a, $b) {
    $speakers_order = $GLOBALS['speakers_order'];
    $order_a = isset($speakers_order[$a]) && isset($speakers_order[$a]['order']) && $speakers_order[$a]['order'] > 0 ? $speakers_order[$a]['order'] : 99999;
    $order_b = isset($speakers_order[$b]) && isset($speakers_order[$b]['order']) && $speakers_order[$b]['order'] > 0 ? $speakers_order[$b]['order'] : 99999;
    if ($order_a == $order_b)
        return 0;

    return ($order_a < $order_b) ? 1 : -1;
}
?>
<div class="event_element speakers">
    <a id="speakers_hook" class="hook"></a>
    <?php if (get_post_meta($post->ID, 'januas_speakers_showtitle', true) == 'y') { ?>
        <header class="article-header">					
            <h4><?php _e('Speakers', 'januas'); ?></h4>					
        </header> <!-- end article header -->
    <?php } ?>
    <section class="entry-content clearfix">
        <?php
        $speakers_ids = array();
        $sessions = get_posts(
                array(
                    'post_type' => 'ja-session',
                    'post_status' => array('publish'),
                    'nopaging' => true,
                    'meta_key' => 'januas_session_date',
                    'orderby' => 'meta_value',
                    'order' => 'ASC',
                    'meta_query' => array(
                        array(
                            'key' => 'januas_session_event',
                            'value' => $post->ID
                        )
                    )
                ));
        foreach ($sessions as $session)
            $speakers_ids = array_merge($speakers_ids, get_post_meta($session->ID, 'januas_speakers_list'));
        // speaker order
        usort($speakers_ids, 'order_speakers_ids');
        if (count($speakers_ids) > 0) {

            function speakers_posts_orderby($sql) {
                global $speakers_ids;
                $ret = '';
                foreach ($speakers_ids as $id)
                    $ret .= "ID=$id,";
                if (strlen($ret) > 0)
                    $ret = substr($ret, 0, -1);
                return $ret;
            }

            add_filter('posts_orderby', 'speakers_posts_orderby');

            $speakers_loop = new WP_Query(array(
                        'post_type' => 'ja-speaker',
                        'post_status' => 'publish',
                        'post__in' => $speakers_ids,
                        'orderby' => 'post__in'
                    ));

            remove_filter('posts_orderby', 'speakers_posts_orderby');

            if ($speakers_loop->have_posts()) : while ($speakers_loop->have_posts()) : $speakers_loop->the_post();
                    $hide_speaker = isset($speakers_order[$post->ID]) && isset($speakers_order[$post->ID]['hide']) && $speakers_order[$post->ID]['hide'] == 1 ? true : false;
                    if (!$hide_speaker) {
                        $company = get_post_meta($post->ID, 'januas_speaker_company', true);
                        $qualification = get_post_meta($post->ID, 'januas_speaker_qualification', true);
                        ?>
                        <article id="post-<?php the_ID(); ?>" class="speakers clearfix post <?php if ($i == 1) echo 'central'; ?>" role="article">						
                            <header class="article-header">
                                <a href="<?php the_permalink(); ?>" class="speaker_image">
                                    <?php the_post_thumbnail('thumbnail'); ?>
                                </a>
                                <h1 class="h2"><a href="<?php the_permalink() ?>" rel="bookmark" title="<?php the_title_attribute(); ?>"><?php the_title(); ?></a></h1>
                                <ul class="speaker_info">
                                    <?php if (!empty($company)): ?>
                                        <li class="company"><span class="value"><?php echo $company; ?></span></li>
                                    <?php endif; ?>
                                    <?php if (!empty($qualification)): ?>
                                        <li class="qualification"><span class="value"><?php echo $qualification; ?></span></li>
                                    <?php endif; ?>
                                </ul>
                            </header> <!-- end article header -->
                        </article> <!-- end article -->
                        <?php
                        $i++;
                    }
                endwhile;
            endif;
            wp_reset_query();
        }
        ?>
    </section>
</div>