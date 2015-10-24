<?php

$januas_options = get_option('januas_theme_options');

$theme_color = empty($januas_options['theme-color']) ? '' : $januas_options['theme-color'];

?>

<!doctype html>

<!--[if lt IE 7]><html <?php language_attributes(); ?> class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->

<!--[if (IE 7)&!(IEMobile)]><html <?php language_attributes(); ?> class="no-js lt-ie9 lt-ie8"><![endif]-->

<!--[if (IE 8)&!(IEMobile)]><html <?php language_attributes(); ?> class="no-js lt-ie9"><![endif]-->

<!--[if gt IE 8]><!--> <html <?php language_attributes(); ?> class="no-js"><!--<![endif]-->

    <head>

        <meta charset="utf-8">

        <title><?php wp_title('&raquo;', true, 'right'); ?></title>

        <meta name="HandheldFriendly" content="True">

        <meta name="MobileOptimized" content="320">

        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

        <link rel="shortcut icon" href="<?php echo get_template_directory_uri(); ?>/favicon.ico">

        <link rel="pingback" href="<?php bloginfo('pingback_url'); ?>">

        <link href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>

        <link href='<?php echo get_stylesheet_directory_uri(); ?>/lib/styles/style.css' rel='stylesheet' type='text/css'>

        <link href='<?php echo get_stylesheet_directory_uri(); ?>/style.css' rel='stylesheet' type='text/css'>

        <?php

        if (!empty($theme_color))

            wp_enqueue_style('januas-theme-color', get_stylesheet_directory_uri() . "/lib/styles/colors/$theme_color.css");

		else
			
			wp_enqueue_style('januas-theme-color', get_stylesheet_directory_uri() . "/lib/styles/colors/default.css");
        ?>

        <?php wp_head(); ?>

        <script type="text/javascript">

            // google plus

            window.___gcfg = {lang: '<?php echo januas_get_language_code(); ?>'};

            (function() {

                var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;

                po.src = 'https://apis.google.com/js/plusone.js';

                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);

            })();

            // twitter

                !function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");

            // misc

            var wp_date_format = '<?php echo januas_wp_date_format_to_jquery_ui_date_format(get_option('date_format')); ?>';

            jQuery(function(){

                jQuery('.chosen').chosen();

                jQuery('#upcoming_search .search').watermark('<?php echo addslashes(__('Search For More Great Events...', 'januas')); ?>');

                jQuery('a.share').toggle(

                function(){

                    jQuery(this).parent().next('.share_panel').show();

                }, function(){

                    jQuery(this).parent().next('.share_panel').hide();

                }

            );

                jQuery('#mobile_search').toggle(function(){

                    jQuery('body').addClass('mobile_search_enabled');

                    return false;

                }, function(){

                    jQuery('body').removeClass('mobile_search_enabled');

                    return false;

                });

                

                jQuery('#header_search').toggle(function(){

                    jQuery('body').addClass('mobile_advancedsearch_enabled');

                    return false;

                }, function(){

                    jQuery('body').removeClass('mobile_advancedsearch_enabled');

                    return false;

                });

                

                jQuery('#advanced_schedule_search select').change(function(){

                    jQuery(this).closest('form').submit();

                });

            });

        </script>

        <?php if (is_singular('ja-event')): ?>

            <script type="text/javascript">

                var januas_map_address = "<?php echo get_post_meta($post->ID, 'januas_map_address', true); ?>";

                var template_url = '<?php echo get_stylesheet_directory_uri(); ?>';

                jQuery(function(){

                    jQuery('.event_element.images a.lightbox').lightBox({

                        imageLoading: template_url + '/lib/images/lightbox-loading.gif',

                        imageBtnClose: template_url + '/lib/images/lightbox-close.gif',

                        imageBtnPrev: template_url + '/lib/images/lightbox-prev.gif',

                        imageBtnNext: template_url + '/lib/images/lightbox-next.gif'

                    });

                });

            </script>

        <?php endif; ?>

        <?php if (is_search()): ?>

            <script type="text/javascript">

                jQuery(function(){

                    jQuery('#advanced_search input[type=radio], #advanced_search input[type=checkbox]').change(function(){

                        jQuery(this).closest('form').submit();

                    });

                });

            </script>

        <?php endif; ?>

    </head>

    <?php

    $home_layout = empty($januas_options['home-layout']) ? 'three-columns' : $januas_options['home-layout'];

    ?>

    <body <?php body_class(); ?>>

        <a id="header_search" href="#">

            <img alt="<?php _e('Search button', 'januas'); ?>" src="<?php echo get_stylesheet_directory_uri(); ?>/lib/images/search_mobile.png" />

        </a>

        <a id="mobile_search" href="#">

            <img alt="<?php _e('Search', 'januas'); ?>" src="<?php echo get_stylesheet_directory_uri(); ?>/lib/images/open_close.png" />

        </a>

        <div id="mobile_search_form">

            <form method="get" action="<?php echo home_url('/'); ?>">

                <?php wp_dropdown_categories(array('name' => 'event-category[]', 'taxonomy' => 'ja-event-category', 'selected' => '', 'class' => 'category', 'show_option_all' => __('Category', 'januas'))); ?>

                <select name="event-time">

                    <option value=""><?php _e('By time', 'januas'); ?></option>

                    <option value="+1 day"><?php _e('Next 24 Hours', 'januas'); ?></option>

                    <option value="+7 days"><?php _e('Next 7 Days', 'januas'); ?></option>

                    <option value="+14 days"><?php _e('Next 14 Days', 'januas'); ?></option>

                    <option value="+4 weeks"><?php _e('Next 4 Weeks', 'januas'); ?></option>

                    <option value="+3 months"><?php _e('Next 3 Months', 'januas'); ?></option>

                    <option value="+6 months"><?php _e('Next 6 Months', 'januas'); ?></option>

                    <option value="+1 year"><?php _e('Next Year', 'januas'); ?></option>

                </select>

                <input type="hidden" name="s" value="" />

                <input type="submit" value="<?php _e('Search', 'januas'); ?>" class="submit" />

            </form>

        </div>

        <div id="container" class="<?php echo $home_layout; ?>">

            <header class="header" role="banner">

                <div id="inner-header" class="wrap clearfix">

                    <p id="logo" class="h1">

                        <?php

                        $header_image = get_header_image();

                        if ($header_image) :

                            ?>

                            <a href="<?php echo esc_url(home_url('/')); ?>">

                                <img src = "<?php echo $header_image; ?>" width = "<?php echo get_theme_support('custom-header', 'width'); ?>" height = "<?php echo get_theme_support('custom-header', 'height'); ?>" alt="<?php bloginfo('name'); ?>" />

                            </a>

                            <?php

                        endif;

                        ?>

                    </p>

                    <?php

                    if (is_active_sidebar('header-right'))

                        dynamic_sidebar('header-right');

                    ?>

                    <nav role="navigation">

                        <?php januas_primary_nav(); ?>

                    </nav>

                </div>

            </header>