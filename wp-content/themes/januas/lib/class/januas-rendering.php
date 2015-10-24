<?php



class Januas_Rendering {



    public static $januas_sections = array('description', 'schedule', 'video', 'sponsor', 'map', 'files', 'images', 'social', 'otherinfo', 'speakers');



    public static function render_position($position, $post_id = null) {

        global $post;

        $ordered_sections = array();

        $post_id == null ? $post->ID : $post_id;



        foreach (Januas_Rendering::$januas_sections as $section) {

            if (get_post_meta($post_id, "januas_{$section}_visible", true) == 'y' && get_post_meta($post_id, "januas_{$section}_position", true) == $position)

                $ordered_sections[] = array(get_post_meta($post_id, "januas_{$section}_order", true), $section);

        }

        // custom

        if ($position == 'main')

            if (get_post_meta($post_id, "januas_registration_visible", true) == 'y')

                $ordered_sections[] = array(get_post_meta($post_id, "januas_registration_order", true), 'registration');



        usort($ordered_sections, array('Januas_Rendering', 'sort_position_array'));

        foreach ($ordered_sections as $section)

            Januas_Rendering::render_section($section[1], $post_id);

    }



    public static function render_section($section, $post_id = null) {

        include(dirname(__FILE__) . "/../metaboxes/metabox-$section.php");

    }



    private static function sort_position_array($p1, $p2) {

        $order1 = intval($p1[0]);

        $order2 = intval($p2[0]);



        if ($order1 == $order2)

            return 0;

        return ($order1 < $order2) ? -1 : 1;

    }



}