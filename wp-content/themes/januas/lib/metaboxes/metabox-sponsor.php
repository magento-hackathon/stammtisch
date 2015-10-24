<?php global $post; ?>
<div id="widget_banner" class="event_element">
    <a id="sponsor_hook" class="hook"></a>
    <?php if (get_post_meta($post->ID, 'januas_sponsor_showtitle', true) == 'y') { ?>
        <header class="article-header">					
            <h4><?php _e('Sponsor', 'januas'); ?></h4>					
        </header> <!-- end article header -->
    <?php } ?>

            <section class="entry-content clearfix">
    <a href="<?php echo get_post_meta($post->ID, 'januas_sponsor_url', true); ?>"><img src="<?php echo get_post_meta($post->ID, 'januas_sponsor_image', true); ?>" width="306" height="138" alt="sponsor" /></a>
        </section>
</div>