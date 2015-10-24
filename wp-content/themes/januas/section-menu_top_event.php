<div id="menu_top_event">
    <div class="container">

        <ul class="menu_choice_top_event">
            <?php if (get_post_meta($post->ID, 'januas_eventdata_showinmenu', true) == 'y') { ?>
                <li><a href="#description_hook"><?php _e('Description', 'januas'); ?></a></li>
            <?php } ?>
            <?php if (get_post_meta($post->ID, 'januas_schedule_visible', true) == 'y' && get_post_meta($post->ID, 'januas_schedule_showinmenu', true) == 'y') { ?>
                <li><a href="#schedule_hook"><?php _e('Schedule', 'januas'); ?></a></li>
            <?php } ?>
            <?php if (get_post_meta($post->ID, 'januas_video_visible', true) == 'y' && get_post_meta($post->ID, 'januas_video_showinmenu', true) == 'y') { ?>
                <li><a href="#video_hook"><?php _e('Videos', 'januas'); ?></a></li>
            <?php } ?>
            <?php if (get_post_meta($post->ID, 'januas_sponsor_visible', true) == 'y' && get_post_meta($post->ID, 'januas_sponsor_showinmenu', true) == 'y') { ?>
                <li><a href="#sponsor_hook"><?php _e('Sponsor', 'januas'); ?></a></li>
            <?php } ?>
            <?php if (get_post_meta($post->ID, 'januas_map_visible', true) == 'y' && get_post_meta($post->ID, 'januas_map_showinmenu', true) == 'y') { ?>
                <li><a href="#map_hook"><?php _e('Map', 'januas'); ?></a></li>
            <?php } ?>
            <?php if (get_post_meta($post->ID, 'januas_images_visible', true) == 'y' && get_post_meta($post->ID, 'januas_images_showinmenu', true) == 'y') { ?>
                <li><a href="#images_hook"><?php _e('Pictures', 'januas'); ?></a></li>
            <?php } ?>
            <?php if (get_post_meta($post->ID, 'januas_files_visible', true) == 'y' && get_post_meta($post->ID, 'januas_files_showinmenu', true) == 'y') { ?>
                <li><a href="#files_hook"><?php _e('Downloads', 'januas'); ?></a></li>
            <?php } ?>
            <?php if (get_post_meta($post->ID, 'januas_social_visible', true) == 'y' && get_post_meta($post->ID, 'januas_social_showinmenu', true) == 'y') { ?>
                <li><a href="#social_hook"><?php _e('Facebook', 'januas'); ?></a></li>
            <?php } ?>
            <?php if (get_post_meta($post->ID, 'januas_otherinfo_visible', true) == 'y' && get_post_meta($post->ID, 'januas_otherinfo_showinmenu', true) == 'y') { ?>
                <li><a href="#otherinfo_hook"><?php _e('More', 'januas'); ?></a></li>
            <?php } ?>
            <?php if (get_post_meta($post->ID, 'januas_speakers_visible', true) == 'y' && get_post_meta($post->ID, 'januas_speakers_showinmenu', true) == 'y') { ?>
                <li><a href="#speakers_hook"><?php _e('Speakers', 'januas'); ?></a></li>
            <?php } ?>
            <?php if (get_post_meta($post->ID, 'januas_registration_visible', true) == 'y' && get_post_meta($post->ID, 'januas_registration_showinmenu', true) == 'y') { ?>
                <li><a href="#registration_hook" class="button_go"><?php _e('Register', 'januas'); ?></a></li>
            <?php } ?>
        </ul>

    </div>
</div>