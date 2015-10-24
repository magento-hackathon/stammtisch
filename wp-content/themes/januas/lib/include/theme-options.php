<?php
add_action('admin_init', 'januas_register_settings');
add_action('admin_print_styles-appearance_page_januas-options-page', 'januas_enqueue_settings_scripts');
add_action('admin_menu', 'januas_register_settings_menu');

function januas_register_settings() {
    register_setting('januas_options', 'januas_theme_options', 'januas_theme_options_validate');
    add_settings_section('general', '', '__return_false', 'januas_theme_options');
    add_settings_field('theme-color', __('Theme Color', 'januas'), 'januas_settings_field_theme_color', 'januas_theme_options', 'general');
    add_settings_field('home-layout', __('Home Layout', 'januas'), 'januas_settings_field_home_layout', 'januas_theme_options', 'general');
    add_settings_field('search-layout', __('Search Layout', 'januas'), 'januas_settings_field_search_layout', 'januas_theme_options', 'general');
    add_settings_field('home-quick-search', __('Home Quick Search', 'januas'), 'januas_settings_field_home_quick_search', 'januas_theme_options', 'general');
    add_settings_field('footer-left', __('Footer Left Text', 'januas'), 'januas_settings_field_footer_left', 'januas_theme_options', 'general');
    add_settings_field('footer-right', __('Footer Right Text', 'januas'), 'januas_settings_field_footer_right', 'januas_theme_options', 'general');
    add_settings_field('dummy-content', __('Dummy Content', 'januas'), 'januas_settings_field_dummy_content', 'januas_theme_options', 'general');
}

function januas_enqueue_settings_scripts($hook_suffix) {
    wp_enqueue_style('januas-theme-options', get_template_directory_uri() . '/lib/styles/januas-theme-options.css');
}

function januas_register_settings_menu() {
    add_theme_page('Januas Options', 'Januas Options', 'edit_theme_options', 'januas-options-page', 'januas_options_page');
}

function januas_default_options() {
    $default_theme_options = array(
        'home-layout' => 'two-columns',
        'theme-color' => '',
        'search-layout' => 'fixed-range',
        'home-quick-search' => 'category',
        'footer-left' => __('Powered by <strong><a href="http://www.showthemes.com">Showthemes</a></strong>', 'januas'),
        'footer-right' => __('&copy; 2013 Showthemes. All rights reserved.', 'januas'),
        'dummy-content' => 0
    );

    return $default_theme_options;
}

function januas_get_theme_options() {
    return get_option('januas_theme_options', januas_default_options());
}

function januas_options_page() {
    ?>
    <div class="wrap">
        <?php screen_icon(); ?>
        <h2><?php _e('Januas Options', 'januas'); ?></h2>
        <form method="post" action="options.php">
            <?php
            settings_fields('januas_options');
            do_settings_sections('januas_theme_options');
            submit_button();
            ?>
        </form>
    </div>
    <?php
}

function januas_settings_field_theme_color() {
    $options = januas_get_theme_options();
    ?>
    <div class="layout radio-option theme-color">
        <label class="description">
            <input type="radio" name="januas_theme_options[theme-color]" value="" <?php checked($options['theme-color'], ''); ?> />
            <span>
                <?php _e('Default', 'januas'); ?>
            </span>
        </label>
    </div>
    <div class="layout radio-option theme-color">
        <label class="description">
            <input type="radio" name="januas_theme_options[theme-color]" value="ruby" <?php checked($options['theme-color'], 'ruby'); ?> />
            <span>
                <?php _e('Red', 'januas'); ?>
            </span>
        </label>
    </div>
    <div class="layout radio-option theme-color">
        <label class="description">
            <input type="radio" name="januas_theme_options[theme-color]" value="emerald" <?php checked($options['theme-color'], 'emerald'); ?> />
            <span>
                <?php _e('Green', 'januas'); ?>
            </span>
        </label>
    </div>
    <div class="layout radio-option theme-color">
        <label class="description">
            <input type="radio" name="januas_theme_options[theme-color]" value="blue" <?php checked($options['theme-color'], 'blue'); ?> />
            <span>
                <?php _e('Blue', 'januas'); ?>
            </span>
        </label>
    </div>
    <div class="layout radio-option theme-color">
        <label class="description">
            <input type="radio" name="januas_theme_options[theme-color]" value="orange" <?php checked($options['theme-color'], 'orange'); ?> />
            <span>
                <?php _e('Orange', 'januas'); ?>
            </span>
        </label>
    </div>
    <div class="layout radio-option theme-color">
        <label class="description">
            <input type="radio" name="januas_theme_options[theme-color]" value="lemon" <?php checked($options['theme-color'], 'lemon'); ?> />
            <span>
                <?php _e('Yellow', 'januas'); ?>
            </span>
        </label>
    </div>
    <?php
}

function januas_settings_field_home_layout() {
    $options = januas_get_theme_options();
    ?>
    <div class="layout image-radio-option theme-layout">
        <label class="description">
            <input type="radio" name="januas_theme_options[home-layout]" value="two-columns" <?php checked($options['home-layout'], 'two-columns'); ?> />
            <span>
                <img src="<?php echo esc_url(get_template_directory_uri() . '/lib/images/content-two-columns.png'); ?>" width="136" height="122" alt="two columns" />
                <?php _e('Two Columns', 'januas'); ?>
            </span>
        </label>
    </div>
    <div class="layout image-radio-option theme-layout">
        <label class="description">
            <input type="radio" name="januas_theme_options[home-layout]" value="three-columns" <?php checked($options['home-layout'], 'three-columns'); ?> />
            <span>
                <img src="<?php echo esc_url(get_template_directory_uri() . '/lib/images/content-three-columns.png'); ?>" width="136" height="122" alt="three columns" />
                <?php _e('Three Columns', 'januas'); ?>
            </span>
        </label>
    </div>
    <?php
}

function januas_settings_field_search_layout() {
    $options = januas_get_theme_options();
    ?>
    <div class="layout radio-option search-layout">
        <input type="radio" name="januas_theme_options[search-layout]" value="fixed-range" <?php checked($options['search-layout'], 'fixed-range'); ?> id="search-layout-fixed" />
        <label class="description" for="search-layout-fixed"><?php _e('Fixed time ranges (ex. Next 24 Hours, Next 7 Days, etc.)', 'januas'); ?></label>
    </div>
    <div class="layout radio-option search-layout">
        <input type="radio" name="januas_theme_options[search-layout]" value="custom-range" <?php checked($options['search-layout'], 'custom-range'); ?> id="search-layout-custom" />
        <label class="description" for="search-layout-custom"><?php _e('Custom time range (allows to select the search start/end date)', 'januas'); ?></label>
    </div>
    <?php
}

function januas_settings_field_home_quick_search() {
    $options = januas_get_theme_options();
    ?>
    <div class="layout radio-option home-quick-search">
        <input type="radio" name="januas_theme_options[home-quick-search]" value="category" <?php checked($options['home-quick-search'], 'category'); ?> id="home-quick-search-fixed" />
        <label class="description" for="home-quick-search-fixed"><?php _e('Show categories', 'januas'); ?></label>
    </div>
    <div class="layout radio-option home-quick-search">
        <input type="radio" name="januas_theme_options[home-quick-search]" value="time" <?php checked($options['home-quick-search'], 'time'); ?> id="home-quick-search-custom" />
        <label class="description" for="home-quick-search-custom"><?php _e('Show time ranges', 'januas'); ?></label>
    </div>
    <?php
}

function januas_settings_field_footer_left() {
    $options = januas_get_theme_options();
    $args = array(
        'textarea_name' => 'januas_theme_options[footer-left]',
        'textarea_rows' => 2,
        'media_buttons' => false
    );
    wp_editor($options['footer-left'], 'januas_field_footer_left', $args);
}

function januas_settings_field_footer_right() {
    $options = januas_get_theme_options();
    $args = array(
        'textarea_name' => 'januas_theme_options[footer-right]',
        'textarea_rows' => 2,
        'media_buttons' => false
    );
    wp_editor($options['footer-right'], 'januas_field_footer_right', $args);
}

function januas_settings_field_dummy_content() {
    $options = januas_get_theme_options();
    ?>
    <label><?php _e('If you check the checkbox and save this page the theme will import dummy data', 'januas'); ?>&nbsp;&nbsp;</label>
    <input type="checkbox" name="januas_theme_options[dummy-content]" value="1" id="dummy-content" />
    <?php
}

function januas_theme_options_validate($input) {
    $output = januas_default_options();

    if (isset($input['theme-color']) && in_array($input['theme-color'], array('', 'ruby', 'emerald', 'blue', 'orange', 'lemon')))
        $output['theme-color'] = $input['theme-color'];
    if (isset($input['home-layout']) && in_array($input['home-layout'], array('two-columns', 'three-columns')))
        $output['home-layout'] = $input['home-layout'];
    if (isset($input['search-layout']) && in_array($input['search-layout'], array('fixed-range', 'custom-range')))
        $output['search-layout'] = $input['search-layout'];
    if (isset($input['home-quick-search']) && in_array($input['home-quick-search'], array('category', 'time')))
        $output['home-quick-search'] = $input['home-quick-search'];
    $output['footer-left'] = $input['footer-left'];
    $output['footer-right'] = $input['footer-right'];
    if (isset($input['dummy-content']) && $input['dummy-content'] == 1) {
        include 'dummy-content.php';
        januas_install_dummy_content();
    }

    return $output;
}

add_action('customize_register', 'januas_customize_register');

function januas_customize_register($wp_customize) {
    $wp_customize->get_setting('blogname')->transport = 'postMessage';
    $wp_customize->get_setting('blogdescription')->transport = 'postMessage';

    $options = januas_get_theme_options();
    $defaults = januas_default_options();

    $wp_customize->add_section('januas-theme-color', array(
        'title' => __('Theme Color', 'januas'),
        'priority' => 40,
    ));

    $wp_customize->add_section('januas-home-layout', array(
        'title' => __('Home Layout', 'januas'),
        'priority' => 50,
    ));

    $wp_customize->add_section('januas-search-layout', array(
        'title' => __('Search Layout', 'januas'),
        'priority' => 60,
    ));

    $wp_customize->add_section('januas-home-quick-search', array(
        'title' => __('Home Quick Search', 'januas'),
        'priority' => 70,
    ));

    $wp_customize->add_section('januas-footer-text', array(
        'title' => __('Footer Text', 'januas'),
        'priority' => 80,
    ));

    $wp_customize->add_setting('januas_theme_options[theme-color]', array(
        'type' => 'option',
        'default' => $defaults['theme-color'],
    ));

    $wp_customize->add_setting('januas_theme_options[home-layout]', array(
        'type' => 'option',
        'default' => $defaults['home-layout'],
    ));

    $wp_customize->add_setting('januas_theme_options[search-layout]', array(
        'type' => 'option',
        'default' => $defaults['search-layout'],
    ));

    $wp_customize->add_setting('januas_theme_options[home-quick-search]', array(
        'type' => 'option',
        'default' => $defaults['home-quick-search'],
    ));

    $wp_customize->add_setting('januas_theme_options[footer-left]', array(
        'type' => 'option',
        'default' => $defaults['footer-left'],
    ));

    $wp_customize->add_setting('januas_theme_options[footer-right]', array(
        'type' => 'option',
        'default' => $defaults['footer-right'],
    ));

    $wp_customize->add_control('januas_theme_options[theme-color]', array(
        'section' => 'januas-theme-color',
        'type' => 'radio',
        'choices' => array('' => __('Default', 'januas'), 'ruby' => __('Red', 'januas'), 'emerald' => __('Green', 'januas'), 'blue' => __('Blue', 'januas'), 'orange' => __('Orange', 'januas'), 'lemon' => __('Yellow', 'januas')),
        'label' => __('Home Layout', 'januas')
    ));

    $wp_customize->add_control('januas_theme_options[home-layout]', array(
        'section' => 'januas-home-layout',
        'type' => 'radio',
        'choices' => array('two-columns' => __('Two Columns', 'januas'), 'three-columns' => __('Three Columns', 'januas')),
        'label' => __('Home Layout', 'januas')
    ));

    $wp_customize->add_control('januas_theme_options[search-layout]', array(
        'section' => 'januas-search-layout',
        'type' => 'radio',
        'choices' => array('fixed-range' => __('Fixed time ranges', 'januas'), 'custom-range' => __('Custom range', 'januas')),
        'label' => __('Search Layout', 'januas')
    ));

    $wp_customize->add_control('januas_theme_options[home-quick-search]', array(
        'section' => 'januas-home-quick-search',
        'type' => 'radio',
        'choices' => array('category' => __('Show categories', 'januas'), 'time' => __('Show time ranges', 'januas')),
        'label' => __('Home Quick Search', 'januas')
    ));

    $wp_customize->add_control('januas_theme_options[footer-left]', array(
        'section' => 'januas-footer-text',
        'type' => 'text',
        'label' => __('Footer Left Text', 'januas')
    ));

    $wp_customize->add_control('januas_theme_options[footer-right]', array(
        'section' => 'januas-footer-text',
        'type' => 'text',
        'label' => __('Footer Right Text', 'januas')
    ));
}
?>