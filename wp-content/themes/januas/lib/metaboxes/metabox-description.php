<?php global $post; ?>
<div class="event_element description">
    <a id="description_hook" class="hook"></a>
    <?php if (get_post_meta($post->ID, 'januas_eventdata_showtitle', true) == 'y') { ?>
        <header class="article-header">	
            <h4><?php _e('Event description', 'januas'); ?></h4>					
        </header>
    <?php } ?>
    <section class="entry-content clearfix">
        <?php the_content(); ?>
    </section>
</div>