<footer class="footer" role="contentinfo">
    <?php if (!is_home()) { ?>
        <a id="back" href="#" onclick="history.back();return false;">
            <img alt="<?php _e('Search button', 'januas'); ?>" src="<?php echo get_stylesheet_directory_uri(); ?>/lib/images/arrow_back.png" />
        </a>
    <?php } ?>
    <?php if (is_singular('ja-event')) { ?>
        <a id="mobile_share" href="#social_container">
            <img alt="<?php _e('Search', 'januas'); ?>" src="<?php echo get_stylesheet_directory_uri(); ?>/lib/images/share_mobile.png" />
        </a>

        <a id="register_footer" href="#registration_hook">
            <?php _e('Register', 'januas'); ?>
        </a>
    <?php } ?>
    <div id="inner-footer" class="wrap clearfix">
        <?php get_template_part('section', 'footer-top'); ?>
        <?php get_template_part('section', 'footer-middle'); ?>
        <?php get_template_part('section', 'footer-bottom'); ?>
    </div> <!-- end #inner-footer -->
    <div id="section_copyright">
        <p class="source-org copyright">
            <?php $januas_options = get_option('januas_theme_options'); ?>
            <span class="powered"><?php echo nl2br($januas_options['footer-left']); ?></span>
            <span class="copy"><?php echo nl2br($januas_options['footer-right']); ?></span>
        </p>
    </div>
</footer> <!-- end footer -->
</div> <!-- end #container -->
<?php wp_footer(); ?>
</body>
</html>