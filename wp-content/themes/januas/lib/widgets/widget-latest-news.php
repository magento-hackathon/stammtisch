<?php
add_action('widgets_init', 'januas_register_latest_posts_widget');

function januas_register_latest_posts_widget() {
    register_widget('Januas_Latest_Posts_Widget');
}

class Januas_Latest_Posts_Widget extends WP_Widget {

    protected $defaults;

    function Januas_Latest_Posts_Widget() {

        $this->defaults = array(
            'title' => __('Latest News', 'januas'),
            'posts_cat' => '',
            'posts_num' => 3,
            'orderby' => '',
            'order' => '',
            'show_image' => 1,
            'image_size' => '',
            'show_date' => 1,
                /* 'show_content' => 'excerpt',
                  'more_text' => __('[Read More...]', 'januas') */
        );

        $widget_ops = array(
            'classname' => 'widget_latest_news',
            'description' => __('Displays latest news with thumbnails', 'januas'),
        );

        $control_ops = array(
            'id_base' => 'latest-news',
            'width' => 505,
            'height' => 350,
        );

        $this->WP_Widget('latest-news', __('Januas Latest News', 'januas'), $widget_ops, $control_ops);
    }

    function widget($args, $instance) {

        extract($args);
        $instance = wp_parse_args((array) $instance, $this->defaults);

        echo $before_widget;

        if (!empty($instance['title']))
            echo $before_title . apply_filters('widget_title', $instance['title'], $instance, $this->id_base) . $after_title;

        $query_args = array(
            'post_type' => 'post',
            'cat' => $instance['posts_cat'],
            'showposts' => $instance['posts_num'],
            'orderby' => $instance['orderby'],
            'order' => $instance['order'],
        );

        $featured_posts = new WP_Query($query_args);

        $i = 0;
        if ($featured_posts->have_posts()) : while ($featured_posts->have_posts()) : $featured_posts->the_post();
                ?>
                <article id="post-<?php the_ID(); ?>" class="latest-news clearfix post <?php if ($i % 3 == 1) echo 'central'; ?>" role="article"> 
                    <header class="article-header">
                        <?php
                        if (!empty($instance['show_image']) && has_post_thumbnail()) {
                            echo '<a href="' . get_permalink() . '">' . wp_get_attachment_image(get_post_thumbnail_id(), $instance['image_size']) . '</a>';
                        }
                        ?>
                        <h1 class="h2"><a href="<?php the_permalink() ?>" rel="bookmark" title="<?php the_title_attribute(); ?>"><?php the_title(); ?></a></h1>
                        <?php if (!empty($instance['show_date'])) { ?>
                            <p class="byline vcard">
                                <time class="updated" datetime="<?php the_time('c'); ?>"><?php the_time(get_option('date_format')); ?></time> 
                            </p>
                        <?php } ?>
                    </header>
                </article>
                <?php
                ++$i;
            endwhile;
        endif;

        echo $after_widget;
        wp_reset_query();
    }

    function update($new_instance, $old_instance) {

        $new_instance['title'] = strip_tags($new_instance['title']);
        $new_instance['more_text'] = strip_tags($new_instance['more_text']);
        return $new_instance;
    }

    function form($instance) {

        $instance = wp_parse_args((array) $instance, $this->defaults);
        ?>
        <p>
            <label for="<?php echo $this->get_field_id('title'); ?>"><?php _e('Title', 'januas'); ?>:</label>
            <input type="text" id="<?php echo $this->get_field_id('title'); ?>" name="<?php echo $this->get_field_name('title'); ?>" value="<?php echo esc_attr($instance['title']); ?>" class="widefat" />
        </p>
        <p>
            <label for="<?php echo $this->get_field_id('posts_cat'); ?>"><?php _e('Category', 'januas'); ?>:</label>
            <?php
            $categories_args = array(
                'name' => $this->get_field_name('posts_cat'),
                'selected' => $instance['posts_cat'],
                'orderby' => 'Name',
                'hierarchical' => 1,
                'show_option_all' => __('All Categories', 'januas'),
                'hide_empty' => '0'
            );
            wp_dropdown_categories($categories_args);
            ?>
        </p>
        <p>
            <label for="<?php echo $this->get_field_id('posts_num'); ?>"><?php _e('Number of Posts to Show', 'januas'); ?>:</label>
            <input type="text" id="<?php echo $this->get_field_id('posts_num'); ?>" name="<?php echo $this->get_field_name('posts_num'); ?>" value="<?php echo esc_attr($instance['posts_num']); ?>" size="2" />
        </p>
        <p>
            <label for="<?php echo $this->get_field_id('orderby'); ?>"><?php _e('Order By', 'januas'); ?>:</label>
            <select id="<?php echo $this->get_field_id('orderby'); ?>" name="<?php echo $this->get_field_name('orderby'); ?>">
                <option value="date" <?php selected('date', $instance['orderby']); ?>><?php _e('Date', 'januas'); ?></option>
                <option value="title" <?php selected('title', $instance['orderby']); ?>><?php _e('Title', 'januas'); ?></option>
                <option value="parent" <?php selected('parent', $instance['orderby']); ?>><?php _e('Parent', 'januas'); ?></option>
                <option value="ID" <?php selected('ID', $instance['orderby']); ?>><?php _e('ID', 'januas'); ?></option>
                <option value="comment_count" <?php selected('comment_count', $instance['orderby']); ?>><?php _e('Comment Count', 'januas'); ?></option>
                <option value="rand" <?php selected('rand', $instance['orderby']); ?>><?php _e('Random', 'januas'); ?></option>
            </select>
        </p>
        <p>
            <label for="<?php echo $this->get_field_id('order'); ?>"><?php _e('Sort Order', 'januas'); ?>:</label>
            <select id="<?php echo $this->get_field_id('order'); ?>" name="<?php echo $this->get_field_name('order'); ?>">
                <option value="DESC" <?php selected('DESC', $instance['order']); ?>><?php _e('Descending', 'januas'); ?></option>
                <option value="ASC" <?php selected('ASC', $instance['order']); ?>><?php _e('Ascending', 'januas'); ?></option>
            </select>
        </p>
        <p>
            <input id="<?php echo $this->get_field_id('show_image'); ?>" type="checkbox" name="<?php echo $this->get_field_name('show_image'); ?>" value="1" <?php checked($instance['show_image']); ?>/>
            <label for="<?php echo $this->get_field_id('show_image'); ?>"><?php _e('Show Featured Image', 'januas'); ?></label>
        </p>
        <p>
            <label for="<?php echo $this->get_field_id('image_size'); ?>"><?php _e('Image Size', 'januas'); ?>:</label>
            <select id="<?php echo $this->get_field_id('image_size'); ?>" name="<?php echo $this->get_field_name('image_size'); ?>">
                <option value="thumbnail">thumbnail (<?php echo get_option('thumbnail_size_w'); ?>x<?php echo get_option('thumbnail_size_h'); ?>)</option>
                <?php
                global $_wp_additional_image_sizes;
                if ($_wp_additional_image_sizes) {
                    foreach ($_wp_additional_image_sizes as $name => $size)
                        echo '<option value="' . esc_attr($name) . '" ' . selected($name, $instance['image_size'], FALSE) . '>' . esc_html($name) . ' ( ' . $size['width'] . 'x' . $size['height'] . ' )</option>';
                }
                ?>
            </select>
        </p>
        <p>
            <input id="<?php echo $this->get_field_id('show_date'); ?>" type="checkbox" name="<?php echo $this->get_field_name('show_date'); ?>" value="1" <?php checked($instance['show_date']); ?>/>
            <label for="<?php echo $this->get_field_id('show_date'); ?>"><?php _e('Show Date', 'januas'); ?></label>
        </p>
        <?php /*
          <p>
          <label for="<?php echo $this->get_field_id('show_content'); ?>"><?php _e('Content Type', 'januas'); ?>:</label>
          <select id="<?php echo $this->get_field_id('show_content'); ?>" name="<?php echo $this->get_field_name('show_content'); ?>">
          <option value="content" <?php selected('content', $instance['show_content']); ?>><?php _e('Show Content', 'januas'); ?></option>
          <option value="excerpt" <?php selected('excerpt', $instance['show_content']); ?>><?php _e('Show Excerpt', 'januas'); ?></option>
          <option value="" <?php selected('', $instance['show_content']); ?>><?php _e('No Content', 'januas'); ?></option>
          </select>
          </p>
          <p>
          <label for="<?php echo $this->get_field_id('more_text'); ?>"><?php _e('More Text (if applicable)', 'januas'); ?>:</label>
          <input type="text" id="<?php echo $this->get_field_id('more_text'); ?>" name="<?php echo $this->get_field_name('more_text'); ?>" value="<?php echo esc_attr($instance['more_text']); ?>" />
          </p>
         */ ?>
        <?php
    }

}
