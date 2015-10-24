<?php

function januas_page_navi($before = '', $after = '') {
    global $wpdb, $wp_query;
    $request = $wp_query->request;
    $posts_per_page = intval(get_query_var('posts_per_page'));
    $paged = intval(get_query_var('paged'));
    $numposts = $wp_query->found_posts;
    $max_page = $wp_query->max_num_pages;
    if ($numposts <= $posts_per_page) {
        return;
    }
    if (empty($paged) || $paged == 0) {
        $paged = 1;
    }
    $pages_to_show = 7;
    $pages_to_show_minus_1 = $pages_to_show - 1;
    $half_page_start = floor($pages_to_show_minus_1 / 2);
    $half_page_end = ceil($pages_to_show_minus_1 / 2);
    $start_page = $paged - $half_page_start;
    if ($start_page <= 0) {
        $start_page = 1;
    }
    $end_page = $paged + $half_page_end;
    if (($end_page - $start_page) != $pages_to_show_minus_1) {
        $end_page = $start_page + $pages_to_show_minus_1;
    }
    if ($end_page > $max_page) {
        $start_page = $max_page - $pages_to_show_minus_1;
        $end_page = $max_page;
    }
    if ($start_page <= 0) {
        $start_page = 1;
    }
    echo $before . '<nav class="page-navigation"><ol class="januas_page_navi clearfix">' . "";
    if ($start_page >= 2 && $pages_to_show < $max_page) {
        $first_page_text = "First";
        echo '<li class="bpn-first-page-link"><a href="' . get_pagenum_link() . '" title="' . $first_page_text . '">' . $first_page_text . '</a></li>';
    }
    echo '<li class="bpn-prev-link">';
    previous_posts_link('<<');
    echo '</li>';
    for ($i = $start_page; $i <= $end_page; $i++) {
        if ($i == $paged) {
            echo '<li class="bpn-current">' . $i . '</li>';
        } else {
            echo '<li><a href="' . get_pagenum_link($i) . '">' . $i . '</a></li>';
        }
    }
    echo '<li class="bpn-next-link">';
    next_posts_link('>>');
    echo '</li>';
    if ($end_page < $max_page) {
        $last_page_text = "Last";
        echo '<li class="bpn-last-page-link"><a href="' . get_pagenum_link($max_page) . '" title="' . $last_page_text . '">' . $last_page_text . '</a></li>';
    }
    echo '</ol></nav>' . $after . "";
}

function januas_wp_date_format_to_jquery_ui_date_format($dateFormat) {
    $chars = array(
        // Day
        'd' => 'dd', 'j' => 'd', 'l' => 'DD', 'D' => 'D',
        // Month 
        'm' => 'mm', 'n' => 'm', 'F' => 'MM', 'M' => 'M',
        // Year 
        'Y' => 'yy', 'y' => 'y',
    );
    return strtr((string) $dateFormat, $chars);
}

function januas_get_count_by_time($time) {
    $args = array(
        'post_type' => 'ja-event',
        'meta_query' => array(
            array(
                'key' => 'januas_eventdata_startdate',
                'value' => array(strtotime('now'), strtotime($time)),
                'compare' => 'BETWEEN'
            )
        )
    );
    $tmp_query = new WP_Query($args);
    return $tmp_query->found_posts;
}

function januas_get_term_meta($option, $term_id, $field_id) {
    $meta = get_option($option);
    if (empty($meta))
        $meta = array();
    if (!is_array($meta))
        $meta = (array) $meta;
    $meta = isset($meta[$term_id]) ? $meta[$term_id] : array();
    $value = $meta[$field_id];

    return $value;
}

function januas_comments($comment, $args, $depth) {
    $GLOBALS['comment'] = $comment;
    ?>
    <li <?php comment_class(); ?>>
        <article id="comment-<?php comment_ID(); ?>" class="clearfix">
            <header class="comment-author vcard">
                <?php
                /*
                  this is the new responsive optimized comment image. It used the new HTML5 data-attribute to display comment gravatars on larger screens only. What this means is that on larger posts, mobile sites don't have a ton of requests for comment images. This makes load time incredibly fast! If you'd like to change it back, just replace it with the regular wordpress gravatar call:
                  echo get_avatar($comment,$size='32',$default='<path_to_url>' );
                 */
                ?>
                <!-- custom gravatar call -->
                <?php
                // create variable
                $bgauthemail = get_comment_author_email();
                ?>
                <img src="http://www.gravatar.com/avatar/<?php echo md5($bgauthemail); ?>?s=32" class="load-gravatar avatar avatar-48 photo" height="32" width="32" alt="gravatar" />
                <!-- end custom gravatar call -->
                <?php printf(__('<cite class="fn">%s</cite>'), get_comment_author_link()) ?>
                <time datetime="<?php echo comment_time('c'); ?>"><a href="<?php echo htmlspecialchars(get_comment_link($comment->comment_ID)) ?>"><?php comment_time(get_option('date_format')); ?> </a></time>
                <?php edit_comment_link(__('(Edit)', 'januas'), '  ', '') ?>
            </header>
            <?php if ($comment->comment_approved == '0') : ?>
                <div class="alert info">
                    <p><?php _e('Your comment is awaiting moderation.', 'januas') ?></p>
                </div>
            <?php endif; ?>
            <section class="comment_content clearfix">
                <?php comment_text() ?>
            </section>
            <?php comment_reply_link(array_merge($args, array('depth' => $depth, 'max_depth' => $args['max_depth']))) ?>
        </article>
        <!-- </li> is added by WordPress automatically -->
        <?php
    }

    function januas_primary_nav() {
        wp_nav_menu(array(
            'container' => 'div',
            'container_class' => 'menu',
            'menu' => 'The Main Menu',
            'menu_class' => false,
            'theme_location' => 'primary',
            'before' => '',
            'after' => '',
            'link_before' => '',
            'link_after' => '',
            'depth' => 0,
            'fallback_cb' => 'januas_primary_nav_fallback'
        ));
    }

    function januas_primary_nav_fallback() {
        wp_page_menu('show_home=Home');
    }

    function januas_sample_widget_content($position) {
        switch ($position) {
            case 'home-top-left':
            case 'home-top-right':
            case 'footer-middle-left':
            case 'footer-middle-right':
                echo '<a href="' . home_url('/') . '"><img src="' . get_stylesheet_directory_uri() . '/lib/images/home_banner_top.jpg" width="474" height="101" alt="Sponsor" /></a>';
                break;
            case 'footer-top':
                echo '<p>';
                echo sprintf(__('Go to <a href="%s">Widgets</a> %s %s to add widgets to this area.', 'januas'), admin_url('widgets.php'), '&raquo;', ucwords(str_replace('-', ' ', $position)));
                echo '</p>';
            default:
                echo '';
        }
    }

    function januas_social_sharing($post_id) {
        $url = esc_url(get_permalink($post_id));
        ?>
        <iframe src="//www.facebook.com/plugins/like.php?locale=<?php echo januas_get_language_code(); ?>&amp;href=<?php echo $url; ?>&amp;send=false&amp;layout=button_count&amp;width=95&amp;show_faces=false&amp;font&amp;colorscheme=light&amp;action=like&amp;height=21" frameborder="0" style="border:none; overflow:hidden; width:95px; height:21px;" allowTransparency="true"></iframe>
        <a href="https://twitter.com/share" class="twitter-share-button" data-url="<?php echo $url; ?>" data-lang="<?php echo januas_get_language_code(); ?>">Tweet</a>
        <div class="g-plusone" data-size="medium" data-href="<?php echo $url; ?>"></div>
        <?php
    }

    function januas_related_posts($post_id) {
        $tags = wp_get_post_terms($post_id, 'ja-event-tag', array('orderby' => 'none'));
        if ($tags) {
            $tag_ids = array();
            foreach ($tags as $individual_tag)
                $tag_ids[] = $individual_tag->term_id;
            $args = array(
                'tax_query' => array(
                    array(
                        'taxonomy' => 'ja-event-tag',
                        'terms' => $tag_ids,
                        'operator' => 'IN'
                    )
                ),
                'post__not_in' => array($post_id),
                'posts_per_page' => 3,
            );
            $my_query = new WP_Query($args);
            if ($my_query->have_posts()):
                while ($my_query->have_posts()) : $my_query->the_post();
                    echo the_title();
                endwhile;
            endif;
        }
    }

    function januas_get_language_code() {
        return str_replace('-', '_', get_bloginfo('language'));
    }

    function januas_get_featured_event() {
        $ret = 0;
        $featured_posts = get_posts('numberposts=1&meta_key=januas_eventdata_featured&meta_value=y&post_type=ja-event');
        if ($featured_posts && count($featured_posts) > 0)
            $ret = $featured_posts[0]->ID;
        return $ret;
    }

    add_filter('pre_get_posts', 'januas_pre_get_posts');

    function januas_pre_get_posts($query) {
        if (isset($_GET['s']) && empty($_GET['s']) && $query->is_main_query()) {
            $query->is_search = true;
            $query->is_home = false;
        }
        return $query;
    }

    add_filter('the_category', 'januas_remove_category_rel_tag');

    function januas_remove_category_rel_tag($text) {
        $text = str_replace('rel="category tag"', '', $text);
        return $text;
    }

    function januas_get_ext_schedule_url() {
        $ext_sched_page_url = '';
        $ext_sched_pages = get_posts(array(
            'post_type' => 'page',
            'meta_key' => '_wp_page_template',
            'meta_value' => 'page-event-schedule.php'
                ));
        if ($ext_sched_pages && count($ext_sched_pages) > 0)
            $ext_sched_page_url = get_permalink($ext_sched_pages[0]->ID);
        return $ext_sched_page_url;
    }

    function januas_remove_media_buttons() {
        global $current_screen;
        if ($current_screen->post_type == 'ja-event')
            add_action('media_buttons_context', create_function('', 'return;'));
    }

    add_action('admin_head', 'januas_remove_media_buttons');

    function januas_excerpt_more($more) {
        return '';
    }

    add_filter('excerpt_more', 'januas_excerpt_more');

    function januas_body_class($classes) {
        $januas_options = get_option('januas_theme_options');
        $theme_color = empty($januas_options['theme-color']) ? '' : $januas_options['theme-color'];
        if (!empty($theme_color))
            $classes[] = $theme_color;
        return $classes;
    }

    add_filter('body_class', 'januas_body_class');

    function januas_get_pagenum_link($url) {
        if (count($_GET) > 0) {
            $matches = array();
            $page_match = preg_match("/\/page\/(\d+)/", $url, $matches);
            if ($page_match !== false && $page_match == 1 && count($matches) >= 2) {
                $url = preg_replace("/\/page\/(\d+)/", '', $url);
                $url .= "&paged={$matches[1]}";
            }
        }
        return $url;
    }

    add_filter('get_pagenum_link', 'januas_get_pagenum_link');

    function januas_embed_oembed_html($html, $url, $attr) {
        if (strpos($html, "<embed src=") !== false)
            return str_replace('</param><embed', '</param><param name="wmode" value="opaque"></param><embed wmode="opaque" ', $html);
        elseif (strpos($html, 'feature=oembed') !== false)
            return str_replace('feature=oembed', 'feature=oembed&wmode=opaque', $html);
        else
            return $html;
    }

    add_filter('oembed_result', 'januas_embed_oembed_html', 10, 3);

    function januas_wp_title($title, $sep) {
        global $paged, $page;

        if (is_feed())
            return $title;
        $title .= get_bloginfo('name');
        $site_description = get_bloginfo('description', 'display');
        if ($site_description && ( is_home() || is_front_page() ))
            $title = "$title $sep $site_description";
        if ($paged >= 2 || $page >= 2)
            $title = "$title $sep " . sprintf(__('Page %s', 'januas'), max($paged, $page));

        return $title;
    }

    add_filter('wp_title', 'januas_wp_title', 10, 2);

    function januas_get_reduced_title($title, $count = 65, $end = '[...]') {
        if (strlen($title) <= $count)
            $end = '';
        return substr($title, 0, $count) . $end;
    }

    add_action('restrict_manage_posts', 'januas_restrict_manage_posts');

    function januas_restrict_manage_posts() {
        global $typenow;

        if ($typenow == 'ja-session') {
            $all_events = get_posts(array('post_type' => 'ja-event', 'numberposts' => -1));
            echo('<select name="event_filter">');
            echo('<option value="">' . __('All Events', 'januas') . '</option>');
            foreach ($all_events as $event) {
                $title = get_the_title($event->ID);
                if (strlen($title) > 30)
                    $title = substr($title, 0, 30) . '...';
                $selected = isset($_GET['event_filter']) && $_GET['event_filter'] == $event->ID ? 'selected="selected"' : '';
                echo("<option value='$event->ID' $selected>$title</option>");
            }
            echo('</select>');
        }
    }

    add_filter('parse_query', 'januas_parse_query');

    function januas_parse_query($query) {
        global $pagenow;
        global $typenow;

        if ($pagenow == 'edit.php' && $typenow == 'ja-session') {
            $meta_query = $query->get('meta_query');
            if (empty($meta_query))
                $meta_query = array();
            if (isset($_GET['event_filter']) && $_GET['event_filter'] != '' && $query->get('post_type') != 'ja-event') {
                $meta_query[] = array('key' => 'januas_session_event', 'value' => $_GET['event_filter'], 'compare' => '=');
                $query->query_vars['meta_query'] = $meta_query;
            }
        }
        return $query;
    }

    function januas_get_event_linked_terms($event_id, $taxonomy) {
        $terms = array();
        $linked_sessions = get_posts(array(
            'post_type' => 'ja-session',
            'numberposts' => -1,
            'meta_query' => array(
                array(
                    'key' => 'januas_session_event',
                    'compare' => '=',
                    'value' => $event_id
            ))));
        foreach ($linked_sessions as $session) {
            $linked_terms = wp_get_post_terms($session->ID, $taxonomy);
            foreach ($linked_terms as $term)
                if (!array_key_exists($term->term_id, $terms))
                    $terms[$term->term_id] = $term;
        }
        return $terms;
    }
    ?>