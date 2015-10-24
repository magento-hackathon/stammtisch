<?php global $post; ?>
<div class="event_element map">
    <a id="map_hook" class="hook"></a>
    <?php if (get_post_meta($post->ID, 'januas_map_showtitle', true) == 'y') { ?>
        <header class="article-header">					
            <h4><?php _e('Map', 'januas'); ?></h4>					
        </header> <!-- end article header -->
    <?php } ?>
    <section class="entry-content clearfix">
        <div id="map"></div>
        <div id="map_label">
            <?php
            echo nl2br(get_post_meta($post->ID, 'januas_map_label', true));
            $map_address_link = '';
            $map_address = get_post_meta($post->ID, 'januas_map_address', true);
            if ($map_address)
                $map_address_link = urlencode($map_address);
            if (!empty($map_address_link)) {
                ?>
                <br/>
                <a href="https://maps.google.com/maps?q=<?php echo $map_address_link; ?>" target="_blank"><?php _e('Show on Google Maps', 'januas'); ?></a>
            <?php } ?>
        </div>
    </section>
</div>