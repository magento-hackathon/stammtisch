<?php
global $post;
global $januas_allowed_file_types;

$args = array(
    'post_type' => 'attachment',
    'post_status' => 'inherit',
    'post_parent' => $post->ID,
    'post_mime_type' => $januas_allowed_file_types,
    'posts_per_page' => -1,
    'order' => 'ASC',
    'orderby' => 'menu_order',
);

$files = get_posts($args);
?>
<div class="event_element files">
    <a id="files_hook" class="hook"></a>
    <?php if (get_post_meta($post->ID, 'januas_files_showtitle', true) == 'y') { ?>
        <header class="article-header">					
            <h4><?php _e('Downloads', 'januas'); ?></h4>					
        </header> <!-- end article header -->
    <?php } ?>
    <section class="entry-content clearfix">
        <?php
        if (count($files) > 0)
            foreach ($files as $file) {
                $link = wp_get_attachment_link($file->ID);
                $extension = pathinfo(wp_get_attachment_url($file->ID), PATHINFO_EXTENSION);
                echo $link, '<span class="file_type">(', $extension, ')</span>';
            }
        ?>
    </section>
</div>
