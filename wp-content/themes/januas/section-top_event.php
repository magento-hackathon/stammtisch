<div id="top_event">						
    <h1 class="entry-title single-title"><?php the_title(); ?></h1>
    <section class="entry-content clearfix">
        <a href="#" class="frame" ><?php the_post_thumbnail('januas-large'); ?></a>
        <div class="data when">
            <h3>
                <?php
                $date = get_post_meta($post->ID, 'januas_eventdata_startdate', true);
                if ($date && !empty($date))
                    echo date_i18n(get_option('date_format'), $date);
                ?>
            </h3>
            <p>
                <?php echo get_post_meta($post->ID, 'januas_eventdata_starttime', true); ?>
            </p>
        </div>
        <div class="data where">
            <h3><?php echo get_post_meta($post->ID, 'januas_eventdata_city', true); ?></h3>
            <p><?php echo get_post_meta($post->ID, 'januas_eventdata_address', true); ?></p>
        </div>
        <div class="data social" id="social_container">
            <?php januas_social_sharing($post->ID); ?>
        </div>
    </section> <!-- end article section -->
</div>