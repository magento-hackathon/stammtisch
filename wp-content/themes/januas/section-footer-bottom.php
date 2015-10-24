<div class="widget_third">
    <div class="widget_left">
        <?php
        if (is_active_sidebar('footer-bottom-left'))
            dynamic_sidebar('footer-bottom-left');
        ?>
    </div>
    <div class="widget_center">
        <?php
        if (is_active_sidebar('footer-bottom-center'))
            dynamic_sidebar('footer-bottom-center');
        ?>
    </div>
    <div class="widget_right">
        <?php
        if (is_active_sidebar('footer-bottom-right'))
            dynamic_sidebar('footer-bottom-right');
        ?>
    </div>
</div>