<?php global $post; ?>
<div class="event_element video">
    <a id="video_hook" class="hook"></a>
    <?php if (get_post_meta($post->ID, 'januas_video_showtitle', true) == 'y') { ?>
        <header class="article-header">
            <h4><?php _e('Videos', 'januas'); ?></h4>					
        </header> <!-- end article header -->
    <?php } ?>
    <section class="entry-content clearfix">
        <div class="video_miniature"><?php echo wp_oembed_get(get_post_meta($post->ID, 'januas_video_1', true), array('width' => 276, 'height' => 155)) ?></div>
        <div class="video_miniature"><?php echo wp_oembed_get(get_post_meta($post->ID, 'januas_video_2', true), array('width' => 276, 'height' => 155)) ?></div>
        <?php
        $channel_url = get_post_meta($post->ID, 'januas_eventdata_videochannel_url', true);
        $channel_text = get_post_meta($post->ID, 'januas_eventdata_videochannel_text', true);
        if (!empty($channel_url) && !empty($channel_text)) {
            ?>
            <div class="more_videos">
                <a class="video_channel" href="<?php echo $channel_url; ?>" target="_blank"><?php echo $channel_text; ?></a>
            </div>
        <?php } ?>
    </section> <!-- end article section -->
</div>