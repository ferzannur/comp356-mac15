<?php

class ShortcodeHomesliderPlugin extends Omeka_Plugin_AbstractPlugin
{
    protected $_hooks = array('public_head');

    public function setUp()
    {
        add_shortcode('homeslider', array('ShortcodeHomesliderPlugin', 'homeslider'));
        add_shortcode('featured_homeslider', array('ShortcodeHomesliderPlugin', 'featuredHomeslider'));
        add_shortcode('recent_homeslider', array('ShortcodeHomesliderPlugin', 'recentHomeslider'));
        parent::setUp();
    }

    public function hookPublicHead($args)
    {
        queue_css_file('jhomeslider.responsive');
        queue_css_file('homeslider');
        queue_js_file('jhomeslider.responsive');
        queue_js_file('jquery.jhomeslider.min');
    }

    /**
     * Easy shortcut for homeslider of featured items with [featured_homeslider]
     * @param array $args
     * @param Zend_View $view
     * @return string HTML to display
     */
    public static function featuredHomeslider($args, $view)
    {
        $args['is_featured'] = 1;
        return self::homeslider($args, $view);
    }

    /**
     * Easy shortcut for homeslider of recent items with [recent_homeslider]
     * @param array $args
     * @param Zend_View $view
     * @return string HTML to display
     */
    public static function recentHomeslider($args, $view)
    {
        $args['sort'] = 'added';
        $args['order'] = 'd';
        return self::homeslider($args, $view);
    }

    /**
     * Build HTML for the homeslider
     * @param array $args
     * @param Zend_View $view
     * @return string HTML to display
     */
    public static function homeslider($args, $view)
    {
        static $id_suffix = 0;
        if (isset($args['is_featured'])) {
            $params['featured'] = $args['is_featured'];
        }

        if (isset($args['tags'])) {
            $params['tags'] = $args['tags'];
        }

        if (isset($args['user'])) {
            $params['user'] = $args['user'];
        }

        if (isset($args['ids'])) {
            $params['range'] = $args['ids'];
        }

        if (isset($args['sort'])) {
            $params['sort_field'] = $args['sort'];
        }

        if (isset($args['order'])) {
            $params['sort_dir'] = $args['order'];
        }

        if (isset($args['num'])) {
            $limit = $args['num'];
        } else {
            $limit = 10;
        }
        $params['hasImage'] = 1;
        $items = get_records('Item', $params, $limit);

        //handle the configs for jCarousel
        $configs = array('homeslider' => array());

        //homeslider configs
        if(isset($args['speed'])) {
            if(is_numeric($args['speed'])) {
                $configs['homeslider']['animation'] = (int) $args['speed'];
            } else {
                $configs['homeslider']['animation'] = $args['speed'];
            }
        }
        if(isset($args['showtitles']) && $args['showtitles'] == 'true') {
            $configs['homeslider']['showTitles'] = true;
        }
        //autoscroll configs
        if(isset($args['autoscroll']) && $args['autoscroll'] == 'true') {
            $configs['autoscroll'] = array();
            if(isset($args['interval'])) {
                $configs['autoscroll']['interval'] = (int) $args['interval'];
            }
        }
        $html = $view->partial('homeslider.php', array('items' => $items, 'id_suffix' => $id_suffix, 'configs' => $configs));
        $id_suffix++;
        return $html;
    }
}
