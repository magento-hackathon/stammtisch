<?php get_header(); ?>

<?php if (have_posts()) : while (have_posts()) : the_post(); ?>

        <?php get_template_part('section', 'menu_top_event'); ?>
        <?php get_template_part('section', 'top_event'); ?>

        <div id="content">
            <div id="inner-content" class="wrap clearfix">
                <div id="main" class="eightcol first clearfix" role="main">
                    <article id="post-<?php the_ID(); ?>" <?php post_class('clearfix'); ?> role="article">

                        <?php Januas_Rendering::render_section('description'); ?>
                        <?php Januas_Rendering::render_position('main', get_the_ID()); ?>

                    </article> <!-- end article -->

                <?php endwhile; ?>

            <?php else : ?>

                <article id="post-not-found" class="hentry clearfix">
                    <header class="article-header">
                        <h1><?php _e("Post Not Found!", "januas"); ?></h1>
                    </header>
                    <section class="entry-content">
                        <p><?php _e("Something is missing. Try double checking things.", "januas"); ?></p>
                    </section>
                </article>

            <?php endif; ?>

        </div> <!-- end #main -->

        <?php get_sidebar('ja-event'); ?>

    </div> <!-- end #inner-content -->

</div> <!-- end #content -->

<?php get_template_part('section', 'related-events'); ?>

<?php get_footer(); ?>