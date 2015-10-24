<?php
add_action('widgets_init', 'januas_register_twitter_widget');

function januas_register_twitter_widget() {
    register_widget('Januas_Twitter_Widget');
}

class Januas_Twitter_Widget extends WP_Widget {

    protected $defaults;

    function Januas_Twitter_Widget() {
        $this->defaults = array('title' => __('Tweet our hashtag', 'januas'), 'hashtag' => '', 'size' => '', 'url' => get_bloginfo('url'));

        $widget_ops = array('classname' => 'widget_twitter', 'description' => __('Add button to help your visitors share content on Twitter', 'januas'));
        $control_ops = array('id_base' => 'twitter-widget');
        $this->WP_Widget('twitter-widget', __('Januas Twitter Widget', 'januas'), $widget_ops, $control_ops);
    }

    function widget($args, $instance) {
        extract($args);
        $title = apply_filters('widget_title', $instance['title']);
        echo $before_widget;
        if ($title)
            echo $before_title . $title . $after_title;
        ?>
        <a href="https://twitter.com/intent/tweet?button_hashtag=<?php echo $instance['hashtag']; ?>" class="twitter-hashtag-button" data-lang="<?php bloginfo('language'); ?>" <?php if ($instance['size'] == 1) echo("data-size=\"large\""); ?> data-url="<?php echo $instance['url']; ?>">Tweet #<?php echo $instance['hashtag']; ?></a>
        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
        <?php
        echo $after_widget;
    }

    function update($new_instance, $old_instance) {
        $instance = $old_instance;
        $instance['title'] = strip_tags($new_instance['title']);
        $instance['hashtag'] = strip_tags($new_instance['hashtag']);
        $instance['size'] = isset($new_instance['size']) ? 1 : 0;
        $instance['url'] = esc_url($new_instance['url']);
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
            <label for="<?php echo $this->get_field_id('hashtag'); ?>"><?php _e('Hashtag:', 'januas'); ?></label>
            <input id="<?php echo $this->get_field_id('hashtag'); ?>" name="<?php echo $this->get_field_name('hashtag'); ?>" value="<?php echo $instance['hashtag']; ?>" />
        </p>
        <p>
            <label for="<?php echo $this->get_field_id('size'); ?>"><?php _e('Large Button:', 'januas'); ?></label>
            <input type="checkbox" id="<?php echo $this->get_field_id('size'); ?>" name="<?php echo $this->get_field_name('size'); ?>" value="1" <?php if ($instance['size'] == 1) echo('checked="checked"'); ?> />
        </p>
        <p>
            <label for="<?php echo $this->get_field_id('url'); ?>"><?php _e('URL:', 'januas'); ?></label>
            <input id="<?php echo $this->get_field_id('url'); ?>" name="<?php echo $this->get_field_name('url'); ?>" value="<?php echo $instance['url']; ?>" />
        </p>
        <?php
    }

}