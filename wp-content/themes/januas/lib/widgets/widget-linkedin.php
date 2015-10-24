<?php
add_action('widgets_init', 'januas_register_linkedin_widget');

function januas_register_linkedin_widget() {
    register_widget('Januas_Linkedin_Widget');
}

class Januas_Linkedin_Widget extends WP_Widget {

    protected $defaults;

    function Januas_Linkedin_Widget() {
        $this->defaults = array('title' => __('Share on Linkedin', 'januas'), 'url' => get_bloginfo('url'), 'counter' => '');

        $widget_ops = array('classname' => 'widget_linkedin', 'description' => __('Enable users to share your website with LinkedIn\'s professional audience, and drive traffic back to your site.', 'januas'));
        $control_ops = array('id_base' => 'linkedin-widget');
        $this->WP_Widget('linkedin-widget', __('Januas Linkedin Widget', 'januas'), $widget_ops, $control_ops);
    }

    function widget($args, $instance) {
        extract($args);
        $title = apply_filters('widget_title', $instance['title']);
        echo $before_widget;
        if ($title)
            echo $before_title . $title . $after_title;
        ?>
        <script src="//platform.linkedin.com/in.js" type="text/javascript"></script>
        <script type="IN/Share" <?php if (!empty($instance['url'])) echo("data-url=\"{$instance['url']}\""); ?> <?php if (!empty($instance['counter'])) echo("data-counter=\"{$instance['counter']}\""); ?>></script>
        <?php
        echo $after_widget;
    }

    function update($new_instance, $old_instance) {
        $instance = $old_instance;
        $instance['title'] = strip_tags($new_instance['title']);
        $instance['url'] = esc_url($new_instance['url']);
        $instance['counter'] = strip_tags($new_instance['counter']);
        return $instance;
    }

    function form($instance) {
        $instance = wp_parse_args((array) $instance, $this->defaults);
        ?>
        <p>
            <label for="<?php echo $this->get_field_id('title'); ?>"><?php _e('Title:', 'januas'); ?></label>
            <input id="<?php echo $this->get_field_id('title'); ?>" name="<?php echo $this->get_field_name('title'); ?>" value="<?php echo $instance['title']; ?>" />
        </p>
        <p>
            <label for="<?php echo $this->get_field_id('url'); ?>"><?php _e('URL:', 'januas'); ?></label>
            <input id="<?php echo $this->get_field_id('url'); ?>" name="<?php echo $this->get_field_name('url'); ?>" value="<?php echo $instance['url']; ?>" />
        </p>
        <p>
            <label for="<?php echo $this->get_field_id('counter'); ?>"><?php _e('Counter:', 'januas'); ?></label>
            <select id="<?php echo $this->get_field_id('counter'); ?>" name="<?php echo $this->get_field_name('counter'); ?>">
                <option value="" <?php if($instance['counter'] == '') echo('selected="selected"'); ?>>No Count</option>
                <option value="right" <?php if($instance['counter'] == 'right') echo('selected="selected"'); ?>>Horizontal</option>
                <option value="top" <?php if($instance['counter'] == 'top') echo('selected="selected"'); ?>>Vertical</option>
            </select>
        </p>
        <?php
    }

}