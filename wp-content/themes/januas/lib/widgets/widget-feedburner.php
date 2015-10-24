<?php
add_action('widgets_init', 'januas_register_feedburner_widget');

function januas_register_feedburner_widget() {
    register_widget('Januas_Feedburner_Widget');
}

class Januas_Feedburner_Widget extends WP_Widget {

    protected $defaults;

    function Januas_Feedburner_Widget() {
        $this->defaults = array('title' => __('Subscribe to our future Events', 'januas'), 'uri' => '', 'submit_text' => __('Subscribe', 'januas'), 'email_watermark' => __('Enter Your Email Address...', 'januas'));

        $widget_ops = array('classname' => 'widget_feedburner', 'description' => __('Adds a Feedburner email subscription form', 'januas'));
        $control_ops = array('id_base' => 'feedburner-widget');
        $this->WP_Widget('feedburner-widget', __('Januas Feedburner Email Widget', 'januas'), $widget_ops, $control_ops);
    }

    function widget($args, $instance) {
        extract($args);
        $title = apply_filters('widget_title', $instance['title']);
        $uri = empty($instance['uri']) ? false : $instance['uri'];
        $submit_text = empty($instance['submit_text']) ? $this->defaults['submit_text'] : trim($instance['submit_text']);
        $email_watermark = empty($instance['email_watermark']) ? $this->defaults['email_watermark'] : htmlentities(trim($instance['email_watermark']));
        $uri = parse_url($uri);
        if ($uri['host'] == 'feedburner.google.com' && !empty($uri['query'])) {
            $uri = $uri['query'];
            parse_str($uri, $queryParams);
        } else if ($uri['host'] == 'feeds.feedburner.com' && !empty($uri['path'])) {
            $uri = substr($uri['path'], 1, (strlen($uri['path']) - 1));
            $queryParams = array(
                'uri' => $uri,
                'loc' =>get_bloginfo('language')
            );
            $uri = 'uri=' . $uri;
        } else if (!isset($uri['host']) && isset($uri['path'])) {
            $queryParams = array(
                'uri' => $uri['path'],
                'loc' => get_bloginfo('language')
            );
            $uri = 'uri=' . $uri['path'];
        } else {
            $uri = false;
            $queryParams = array();
        }

        echo $before_widget;
        if ($title)
            echo $before_title . $title . $after_title;

        if ($uri && count($queryParams) > 0) {
            $email_value = !empty($email_watermark) ? $email_watermark : '';
            $email_extra_attrs = "onclick=\"javascript:if(this.value=='$email_watermark'){this.value= '';}\" onblur=\"javascript:if(this.value==''){this.value='$email_watermark'}\" ";
            ?>
            <form id="januas_feedburner_subscription_form" action="http://feedburner.google.com/fb/a/mailverify" method="post" onsubmit="window.open('http://feedburner.google.com/fb/a/mailverify?<?php echo $uri; ?>', 'popupwindow', 'scrollbars=yes,width=550,height=520');return true;" target="popupwindow">
                <input id="januas_feedburner_subscription_form_email" name="email" type="text" value="<?php echo $email_value; ?>" <?php echo $email_extra_attrs; ?> class="subscribe" />
                <?php foreach ($queryParams as $index => $queryParam) { ?>
                    <input type="hidden" value="<?php echo $queryParam; ?>" name="<?php echo $index; ?>" />
                <?php } ?>
                <input id="januas_feedburner_subscription_form_submit" type="submit" value="<?php echo $submit_text; ?>" class="submit" />
            </form>
            <?php
        }
        echo $html . $after_widget;
    }

    function update($new_instance, $old_instance) {
        $instance = $old_instance;
        $instance['title'] = strip_tags($new_instance['title']);
        $instance['uri'] = esc_url($new_instance['uri']);
        $instance['submit_text'] = strip_tags($new_instance['submit_text']);
        $instance['email_watermark'] = strip_tags($new_instance['email_watermark']);
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
            <label for="<?php echo $this->get_field_id('uri'); ?>"><?php _e('Feed URL:', 'januas'); ?></label>
            <input id="<?php echo $this->get_field_id('uri'); ?>" name="<?php echo $this->get_field_name('uri'); ?>" value="<?php echo $instance['uri']; ?>" />
        </p>
        <p>
            <label for="<?php echo $this->get_field_id('submit_text'); ?>"><?php _e('Submit Text:', 'januas'); ?></label>
            <input id="<?php echo $this->get_field_id('submit_text'); ?>" name="<?php echo $this->get_field_name('submit_text'); ?>" value="<?php echo $instance['submit_text']; ?>" />
        </p>
        <p>
            <label for="<?php echo $this->get_field_id('email_watermark'); ?>"><?php _e('Email Watermark:', 'januas'); ?></label>
            <input id="<?php echo $this->get_field_id('email_watermark'); ?>" name="<?php echo $this->get_field_name('email_watermark'); ?>" value="<?php echo $instance['email_watermark']; ?>" />
        </p>
        <?php
    }

}