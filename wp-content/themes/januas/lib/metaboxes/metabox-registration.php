<?php global $post; ?>
<div class="event_element registration_event">
    <a id="registration_hook" class="hook"></a>
    <?php if (get_post_meta($post->ID, 'januas_registration_showtitle', true) == 'y') { ?>
    <header class="article-header">			
        <h4><?php _e('Register', 'januas'); ?></h4>					
    </header> <!-- end article header -->
    <?php } ?>
    <section class="entry-content clearfix">
        <?php
        echo do_shortcode(htmlspecialchars_decode(get_post_meta($post->ID, 'januas_registration_script', true)));
        ?>
    </section>
</div>