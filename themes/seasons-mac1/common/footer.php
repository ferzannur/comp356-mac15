</div><!-- end content -->

<footer role="contentinfo">

        <div id="custom-footer-text">
            <?php if ( $footerText = get_theme_option('Footer Text') ): ?>
            <p><?php echo $footerText; ?></p>
            <?php endif; ?>
            <?php if ((get_theme_option('Display Footer Copyright') == 1) && $copyright = option('copyright')): ?>
                <p><?php echo $copyright; ?></p>
            <?php endif; ?>
        </div>

        <p><?php echo __('Proudly powered by <a href="http://omeka.org">Omeka</a>.'); ?></p>
        
                    
<!--
            <div id="follow-us">
            <a href="https://www.facebook.com"><img src="http://i.imgur.com/qucRDXG.png" alt="FacebookIcon" height="42" width="42"></a>
            <a href="https://www.linkedin.com"><img src="http://i.imgur.com/y0CDC2F.png" alt="LinkedinIcon" height="42" width="42"></a>
            <a href="https://www.twitter.com"><img src="http://i.imgur.com/uWC5ykR.png" alt="TwitterIcon" height="42" width="42"></a>
            </div>
-->

    <?php fire_plugin_hook('public_footer', array('view' => $this)); ?>

</footer>

</div><!--end wrap-->

<script type="text/javascript">
jQuery(document).ready(function () {
    Omeka.showAdvancedForm();
    Omeka.skipNav();
    Omeka.megaMenu("#top-nav");
    Seasons.mobileSelectNav();
});
</script>

</body>

</html>
