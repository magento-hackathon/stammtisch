<?php
add_action('widgets_init', 'januas_register_connect_widget');

function januas_register_connect_widget() {
    register_widget('Januas_Connect_Widget');
}

class Januas_Connect_Widget extends WP_Widget {

    function Januas_Connect_Widget() {
        $widget_ops = array('classname' => 'widget_connect', 'description' => __('Displays icons for Email, RSS, Twitter, Facebook and LinkedIn', 'januas'));
        $control_ops = array('id_base' => 'connect-widget');
        $this->WP_Widget('connect-widget', __('Januas Connect Widget', 'januas'), $widget_ops, $control_ops);
    }

    function widget($args, $instance) {
        extract($args);
        $title = apply_filters('widget_title', $instance['title']);
        echo $before_widget;
        if ($title)
            echo $before_title . $title . $after_title;

        if (!empty($instance['email']))
            echo '<a href="mailto:' . $instance['email'] . '"><img src="' . get_stylesheet_directory_uri() . '/lib/images/mail.png" alt="Email" /></a> ';
        if (!empty($instance['rss']))
            echo '<a href="' . $instance['rss'] . '"><img src="' . get_stylesheet_directory_uri() . '/lib/images/rss.png" alt="RSS" /></a> ';
        if (!empty($instance['twitter']))
            echo '<a href="' . $instance['twitter'] . '"><img src="' . get_stylesheet_directory_uri() . '/lib/images/twitter.png" alt="Twitter" /></a> ';
        if (!empty($instance['facebook']))
            echo '<a href="' . $instance['facebook'] . '"><img src="' . get_stylesheet_directory_uri() . '/lib/images/facebook.png" alt="Facebook" /></a> ';
        if (!empty($instance['linkedin']))
            echo '<a href="' . $instance['linkedin'] . '"><img src="' . get_stylesheet_directory_uri() . '/lib/images/linkedin.png" alt="Linkedin" /></a> ';

        echo $after_widget;
    }

    function update($new_instance, $old_instance) {
        $instance = $old_instance;
        $instance['title'] = strip_tags($new_instance['title']);
        $instance['email'] = trim($new_instance['email']) != '' ? (is_email($new_instance['email']) ? $new_instance['email'] : $old_instance['email']) : '';
        $instance['twitter'] = esc_url($new_instance['twitter']);
        $instance['facebook'] = esc_url($new_instance['facebook']);
        $instance['linkedin'] = esc_url($new_instance['linkedin']);
        $instance['rss'] = esc_url($new_instance['rss']);
        return $instance;
    }

    function form($instance) {

        $defaults = array('title' => __('Connect With Us', 'januas'), 'email' => '', 'rss' => '', 'twitter' => '', 'facebook' => '', 'linkedin' => '');
        $instance = wp_parse_args((array) $instance, $defaults);
        ?>
        <p>
            <label for="<?php echo $this->get_field_id('title'); ?>"><?php _e('Title:', 'januas'); ?></label>
            <input id="<?php echo $this->get_field_id('title'); ?>" name="<?php echo $this->get_field_name('title'); ?>" value="<?php echo $instance['title']; ?>" />
        </p>
        <p>
            <label for="<?php echo $this->get_field_id('email'); ?>"><?php _e('Email:', 'januas'); ?></label>
            <input id="<?php echo $this->get_field_id('email'); ?>" name="<?php echo $this->get_field_name('email'); ?>" value="<?php echo $instance['email']; ?>" />
        </p>
        <p>
            <label for="<?php echo $this->get_field_id('rss'); ?>"><?php _e('RSS URL:', 'januas'); ?></label>
            <input id="<?php echo $this->get_field_id('rss'); ?>" name="<?php echo $this->get_field_name('rss'); ?>" value="<?php echo $instance['rss']; ?>" />
        </p>
        <p>
            <label for="<?php echo $this->get_field_id('twitter'); ?>"><?php _e('Twitter URL:', 'januas'); ?></label>
            <input id="<?php echo $this->get_field_id('twitter'); ?>" name="<?php echo $this->get_field_name('twitter'); ?>" value="<?php echo $instance['twitter']; ?>" />
        </p>
        <p>
            <label for="<?php echo $this->get_field_id('facebook'); ?>"><?php _e('Facebook URL:', 'januas'); ?></label>
            <input id="<?php echo $this->get_field_id('facebook'); ?>" name="<?php echo $this->get_field_name('facebook'); ?>" value="<?php echo $instance['facebook']; ?>" />
        </p>
        <p>
            <label for="<?php echo $this->get_field_id('linkedin'); ?>"><?php _e('LinkedIn URL:', 'januas'); ?></label>
            <input id="<?php echo $this->get_field_id('linkedin'); ?>" name="<?php echo $this->get_field_name('linkedin'); ?>" value="<?php echo $instance['linkedin']; ?>" />
        </p>
        <?php
    }

}