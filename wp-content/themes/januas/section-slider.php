<?php

$januas_options = get_option('januas_theme_options');

$theme_color = empty($januas_options['theme-color']) ? '' : '_' . $januas_options['theme-color'];

$args = array(

    'post_type' => 'ja-event',

    'numberposts' => '1',

    'orderby' => 'rand',

    'meta_query' => array(

        'relation' => 'AND',

        array(

            'key' => 'januas_eventdata_state',

            'value' => 'active',

        ),

        array(

            'key' => 'januas_eventdata_featured',

            'value' => 'y',

        )

    )

);

$featured_query = new WP_Query($args);

?>

<div id="slider">
<ul class="bxslider">	
    <?php

    if ($featured_query->have_posts()):

        while ($featured_query->have_posts()) : $featured_query->the_post();

            ?>
			<li class="featured-slider-item">
            <div id="info-main-event">



                <h2><a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>"><?php the_title(); ?></a></h2>

                <div id="image_home">

                    <a href="<?php the_permalink(); ?>">

                        <?php

                        if (has_post_thumbnail())

                            the_post_thumbnail('januas-large', array('class' => 'img_slider'))

                            ?>

                        <img src="<?php echo get_stylesheet_directory_uri(); ?>/lib/images/featured<?php echo $theme_color; ?>.png" class="featured_ribbon" alt="Featured" />

                    </a>

                </div>            

                <div id="slider_home_content"><?php the_excerpt(); ?>

                    <a href="<?php the_permalink(); ?>" class="goto"><?php _e('&raquo; View Event', 'januas'); ?></a></div>

            </div> 

            <div id="sub-info-main-event">

                <div class="container">

                    <div class="informazioni date">

                        <h4>

                            <?php

                            $start_date = get_post_meta($post->ID, 'januas_eventdata_startdate', true);

                            if ($start_date)

                                echo date_i18n(get_option('date_format'), $start_date);

                            ?>

                        </h4>

                        <p><?php echo get_post_meta($post->ID, 'januas_eventdata_starttime', true); ?></p>

                    </div>

                    <div class="informazioni where">

                        <h4><?php echo get_post_meta($post->ID, 'januas_eventdata_city', true); ?></h4>

                        <p><?php echo get_post_meta($post->ID, 'januas_eventdata_address', true); ?></p>

                    </div>

                    <div class="informazioni register">

                        <h5><?php echo get_post_meta($post->ID, 'januas_eventdata_ticketinfo', true); ?></h5>

                        <h4><a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>"><?php _e('Register today &gt;', 'januas'); ?></a></h4>

                    </div>

                </div>

            </div> 
			</li>
            <?php

        endwhile;

        wp_reset_postdata();

    else:

        ?>

        <div id="no_featured_event_message">

            Insert your featured event

        </div>

    <?php

    endif;

    ?>

</ul>
</div>
<script>
$('.bxslider').bxSlider({
  mode: 'horizontal',
  captions: false,
  speed:800,
  controls:true,
  pager:false,
  prevText: '<i class="fa fa-chevron-left bxArrow"></i>',
  nextText: '<i class="fa fa-chevron-right bxArrow"></i>'
});
</script>