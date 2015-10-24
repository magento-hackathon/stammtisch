<?php get_header(); ?>

<div id="content">

    <div id="inner-content" class="wrap clearfix">

        <div id="main" class="eightcol first clearfix" role="main">

            <?php if (is_category()) { ?>
                <h1 class="archive-title h2">
                    <?php single_cat_title(); ?>
                </h1>

            <?php } elseif (is_tag()) { ?> 
                <h1 class="archive-title h2">
                    <?php single_tag_title(); ?>
                </h1>

                <?php
            } elseif (is_author()) {
                global $post;
                $author_id = $post->post_author;
                ?>
                <h1 class="archive-title h2">

                    <span><?php _e("Posts By:", "januas"); ?></span> <?php echo get_the_author_meta('display_name', $author_id); ?>

                </h1>
            <?php } elseif (is_day()) { ?>
                <h1 class="archive-title h2">
                    <span><?php _e("Daily Archives:", "januas"); ?></span> <?php the_time(get_option('date_format')); ?>
                </h1>

            <?php } elseif (is_month()) { ?>
                <h1 class="archive-title h2">
                    <span><?php _e("Monthly Archives:", "januas"); ?></span> <?php the_time('F Y'); ?>
                </h1>

            <?php } elseif (is_year()) { ?>
                <h1 class="archive-title h2">
                    <span><?php _e("Yearly Archives:", "januas"); ?></span> <?php the_time('Y'); ?>
                </h1>
            <?php } ?>

            <?php if (have_posts()) : while (have_posts()) : the_post(); ?>

                    <article id="post-<?php the_ID(); ?>" <?php post_class('clearfix'); ?> role="article">

                        <a href="<?php the_permalink() ?>" rel="bookmark" title="<?php the_title_attribute(); ?>" class="immagine_archive"><?php the_post_thumbnail('medium'); ?></a>


                        <header class="article-header">

                            <h3 class="h2"><a href="<?php the_permalink() ?>" rel="bookmark" title="<?php the_title_attribute(); ?>"><?php the_title(); ?></a></h3>

                            <p class="byline vcard"><?php _e("Posted", "januas"); ?> <time class="updated" datetime="<?php echo the_time('c'); ?>"><?php the_time(get_option('date_format')); ?></time> <?php _e("by", "januas"); ?> <span class="author"><?php the_author_posts_link(); ?></span> <span class="amp">&</span> <?php _e("filed under", "januas"); ?> <?php the_category(', '); ?>.</p>
                            <?php the_excerpt(); ?>

                        </header> <!-- end article header -->



                    </article> <!-- end article -->

                <?php endwhile; ?>	
taxonomy-ja-session-location
                <?php if (function_exists('januas_page_navi')) { ?>
                    <?php januas_page_navi(); ?>
                <?php } else { ?>
                    <nav class="wp-prev-next">
                        <ul class="clearfix">
                            <li class="prev-link"><?php next_posts_link(__('&laquo; Older Entries', "januas")) ?></li>
                            <li class="next-link"><?php previous_posts_link(__('Newer Entries &raquo;', "januas")) ?></li>
                        </ul>
                    </nav>
                <?php } ?>

            <?php else : ?>

                <article id="post-not-found" class="hentry clearfix">
                    <header class="article-header">
                        <h1><?php _e("Post Not Found!", "januas"); ?></h1>
                    </header>
                    <section class="entry-content">
                        <p><?php _e("Something is missing. Try double checking things.", "januas"); ?></p>
                    </section>
                    <footer class="article-footer">
                        <p><?php _e("This is the error message in the archive.php template.", "januas"); ?></p>
                    </footer>
                </article>

            <?php endif; ?>

        </div> <!-- end #main -->

        <?php get_sidebar(); ?>

    </div> <!-- end #inner-content -->

</div> <!-- end #content -->

<?php get_footer(); ?>