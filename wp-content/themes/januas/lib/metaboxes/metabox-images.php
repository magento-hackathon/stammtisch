<?php
global $post;

$args = array(
    'post_type' => 'attachment',
    'post_status' => 'inherit',
    'post_parent' => $post->ID,
    'post_mime_type' => array('image'),
    'posts_per_page' => -1,
    'order' => 'ASC',
    'orderby' => 'menu_order',
);

$images = get_posts($args);
?>
<div class="event_element images">
    <a id="images_hook" class="hook"></a>
    <?php if (get_post_meta($post->ID, 'januas_images_showtitle', true) == 'y') { ?>
    <header class="article-header">					
        <h4><?php _e('Pictures', 'januas'); ?></h4>					
    </header> <!-- end article header -->
    <?php } ?>
    <section class="entry-content clearfix">
        <?php
        if (count($images) > 0)
            foreach ($images as $image) {
                $thumbnail = wp_get_attachment_image_src($image->ID, 'thumbnail');
                $large = wp_get_attachment_image_src($image->ID, 'large');
                ?>
                <a href="<?php echo $large[0]; ?>" title="" class="lightbox"><img src="<?php echo $thumbnail[0]; ?>" alt="" /></a>
                    <?php
                }
            ?>
    </section>
</div>

