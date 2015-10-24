
<?php global $post; ?>
<div class="event_element otherinfo">
    <a id="otherinfo_hook" class="hook"></a>
    <?php if (get_post_meta($post->ID, 'januas_otherinfo_showtitle', true) == 'y') { ?>
    <header class="article-header">					
        <h4><?php _e('More', 'januas'); ?></h4>					
    </header> <!-- end article header -->
    <?php } ?>
    <section class="entry-content clearfix">

        <?php
        echo get_post_meta($post->ID, 'januas_otherinfo_text', true);
        ?>
    </section>
</div>