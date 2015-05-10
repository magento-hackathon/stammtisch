<?php
/**
 * The template for displaying the footer.
 *
 * Contains the closing of the #content div and all content after
 *
 * @package firegento_stammtisch
 */
?>

        </div><!-- #content -->
    </div><!-- div.row (header.php)-->
	<footer id="colophon" class="site-footer container" role="contentinfo">
		<div class="site-info">
			<a href="<?php echo esc_url( __( 'http://firegento.com/', 'firegento_stammtisch' ) ); ?>"><?php printf( esc_html__( 'Proudly powered by %s', 'firegento_stammtisch' ), 'FireGento' ); ?></a>
		</div><!-- .site-info -->
	</footer><!-- #colophon -->
</div><!-- #page -->

<?php wp_footer(); ?>

</body>
</html>
