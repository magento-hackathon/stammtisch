<?php
/**
 * The header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="content">
 *
 * @package firegento_stammtisch
 */
?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="profile" href="http://gmpg.org/xfn/11">
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">

<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
<div id="page" class="hfeed site container">
	<a class="skip-link screen-reader-text" href="#content"><?php esc_html_e( 'Skip to content', 'firegento_stammtisch' ); ?></a>
	<header id="masthead" class="site-header" role="banner">
        <nav class="navbar navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <div class="container">
                        <div class="row">
                            <?php if (get_header_image()):?>
                                <div class="header-image col-xs-12 col-md-4">
                                    <a href="<?php echo home_url();?>" title="<?php bloginfo( 'name' ); ?>">
                                        <img src="<?php echo get_header_image(); ?>" alt="<?php bloginfo( 'description' ); ?>" />
                                    </a>
                                </div>
                            <?php else : ?>
                                <h1 class="site-title col-xs-12 col-md-8"><a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home"><?php bloginfo( 'name' ); ?></a></h1>
                                <h2 class="site-description col-xs-12 col-md-8"><?php bloginfo( 'description' ); ?></h2>
                            <?php endif;?>
                                <nav class="header-navigation col-md-8" role="navigation">
                                    <button class="menu-toggle" aria-controls="header-menu" aria-expanded="false"><?php esc_html_e( 'Header Menu', 'firegento_stammtisch' ); ?></button>
                                    <?php wp_nav_menu( array( 'theme_location' => 'header', 'menu_id' => 'header-menu' ) ); ?>
                                </nav>
                        </div>
                    </div>

                </div>

            </div>
        </nav>


        <!-- #site-navigation -->
	</header><!-- #masthead -->

    <!-- /.carousel -->
        <div id="Firegento_Stammtisch_Carousel" class="carousel slide">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="item active">
                    <img src="http://images.magento-stammtisch-hamburg.de/files/slideshow/hamburg.jpg" style="width:100%" class="img-responsive">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>Magento Stammtisch in Hamburg</h1>
                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>
                            <p><a class="btn btn-lg btn-primary" href="http://getbootstrap.com">In Hamburg einchecken</a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="http://images.magento-stammtisch-hamburg.de/files/slideshow/Location.jpg" class="img-responsive">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>Magento Stammtisch veröffentlichen</h1>
                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>
                            <p><a class="btn btn-large btn-primary" href="#">Learn more</a></p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="http://images.magento-stammtisch-hamburg.de/files/slideshow/People.jpg" class="img-responsive">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>All Magento Events</h1>
                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>
                            <p><a class="btn btn-large btn-primary" href="#">Browse gallery</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Controls -->
            <a class="left carousel-control" href="#Firegento_Stammtisch_Carousel" data-slide="prev">
                <span class="icon-prev"></span>
            </a>
            <a class="right carousel-control" href="#Firegento_Stammtisch_Carousel" data-slide="next">
                <span class="icon-next"></span>
            </a>
        </div>
    <!-- /.carousel -->



	<div id="content" class="site-content">
        <div class="row">
