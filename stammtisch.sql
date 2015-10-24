-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Erstellungszeit: 24. Okt 2015 um 13:43
-- Server Version: 5.5.37
-- PHP-Version: 5.4.45-1~dotdeb+7.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `db-7`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_bp_activity`
--

CREATE TABLE IF NOT EXISTS `wp_bp_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `component` varchar(75) NOT NULL,
  `type` varchar(75) NOT NULL,
  `action` text NOT NULL,
  `content` longtext NOT NULL,
  `primary_link` text NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `secondary_item_id` bigint(20) DEFAULT NULL,
  `date_recorded` datetime NOT NULL,
  `hide_sitewide` tinyint(1) DEFAULT '0',
  `mptt_left` int(11) NOT NULL DEFAULT '0',
  `mptt_right` int(11) NOT NULL DEFAULT '0',
  `is_spam` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_recorded` (`date_recorded`),
  KEY `user_id` (`user_id`),
  KEY `item_id` (`item_id`),
  KEY `secondary_item_id` (`secondary_item_id`),
  KEY `component` (`component`),
  KEY `type` (`type`),
  KEY `mptt_left` (`mptt_left`),
  KEY `mptt_right` (`mptt_right`),
  KEY `hide_sitewide` (`hide_sitewide`),
  KEY `is_spam` (`is_spam`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=10 ;

--
-- Daten für Tabelle `wp_bp_activity`
--

INSERT INTO `wp_bp_activity` (`id`, `user_id`, `component`, `type`, `action`, `content`, `primary_link`, `item_id`, `secondary_item_id`, `date_recorded`, `hide_sitewide`, `mptt_left`, `mptt_right`, `is_spam`) VALUES
(1, 1, 'members', 'last_activity', '', '', '', 0, NULL, '2015-10-24 11:36:17', 0, 0, 0, 0),
(2, 1, 'events-manager', 'new_event', '<a href=''http://stammtisch.localhost/members/admin/''>admin</a> hat die Veranstaltung <a href="http://stammtisch.localhost/events/24-magento-stammtisch-in-hamburg-24-juni-19-uhr/" title="24. Magento-Stammtisch in Hamburg - 24. Juni - 19 Uhr">24. Magento-Stammtisch in Hamburg - 24. Juni - 19 Uhr</a> hinzugefügt', '', 'http://stammtisch.localhost/events/24-magento-stammtisch-in-hamburg-24-juni-19-uhr/', 2, 0, '2015-05-09 13:03:24', 0, 0, 0, 0),
(3, 1, 'events-manager', 'new_event', '<a href=''http://stammtisch.localhost/members/admin/''>admin</a> hat die Veranstaltung <a href="http://stammtisch.localhost/?event=99-stammtisch-hamburg" title="99. Stammtisch Hamburg">99. Stammtisch Hamburg</a> hinzugefügt', '', 'http://stammtisch.localhost/?event=99-stammtisch-hamburg', 3, 0, '2015-05-09 13:33:14', 0, 0, 0, 0),
(4, 1, 'events-manager', 'new_event', '<a href=''http://stammtisch.localhost/members/admin/''>admin</a> hat die Veranstaltung <a href="http://stammtisch.localhost/?event=15-magento-stammtisch-in-zuerich" title="15. Magento-Stammtisch in Zürich">15. Magento-Stammtisch in Zürich</a> hinzugefügt', '', 'http://stammtisch.localhost/?event=15-magento-stammtisch-in-zuerich', 4, 0, '2015-05-09 14:01:47', 0, 0, 0, 0),
(5, 1, 'events-manager', 'new_event', '<a href=''http://stammtisch.localhost/members/admin/''>admin</a> hat die Veranstaltung <a href="http://stammtisch.localhost/?event=7-magento-stammtisch-in-nuernberg" title="7. Magento Stammtisch in Nürnberg">7. Magento Stammtisch in Nürnberg</a> hinzugefügt', '', 'http://stammtisch.localhost/?event=7-magento-stammtisch-in-nuernberg', 5, 0, '2015-05-09 14:11:21', 0, 0, 0, 0),
(6, 1, 'events-manager', 'new_event', '<a href=''http://stammtisch.localhost/members/admin/''>admin</a> hat die Veranstaltung <a href="http://stammtisch.localhost/?event=7-magento-stammtisch-in-paderborn" title="7. Magento Stammtisch in Paderborn">7. Magento Stammtisch in Paderborn</a> hinzugefügt', '', 'http://stammtisch.localhost/?event=7-magento-stammtisch-in-paderborn', 6, 0, '2015-05-09 14:21:39', 0, 0, 0, 0),
(7, 1, 'events-manager', 'new_event', '<a href=''http://stammtisch.localhost/members/admin/''>admin</a> hat die Veranstaltung <a href="http://stammtisch.localhost/?event=18-magento-stammtisch-in-aachen" title="18. Magento-Stammtisch in Aachen">18. Magento-Stammtisch in Aachen</a> hinzugefügt', '', 'http://stammtisch.localhost/?event=18-magento-stammtisch-in-aachen', 7, 0, '2015-05-09 14:28:26', 0, 0, 0, 0),
(8, 1, 'events-manager', 'new_event', '<a href=''http://stammtisch.localhost/members/admin/''>admin</a> hat die Veranstaltung <a href="http://stammtisch.localhost/?event=13-magento-stammtisch-in-wien" title="13. Magento-Stammtisch in Wien">13. Magento-Stammtisch in Wien</a> hinzugefügt', '', 'http://stammtisch.localhost/?event=13-magento-stammtisch-in-wien', 8, 0, '2015-05-09 14:34:41', 0, 0, 0, 0),
(9, 1, 'events-manager', 'new_event', '<a href=''http://beta.magento-stammtisch.de/members/admin/''>admin</a> hat die Veranstaltung <a href="http://beta.magento-stammtisch.de/events/test-paderborn/" title="Test Paderborn">Test Paderborn</a> hinzugefügt', '', 'http://beta.magento-stammtisch.de/events/test-paderborn/', 1, 0, '2015-10-24 11:42:13', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_bp_activity_meta`
--

CREATE TABLE IF NOT EXISTS `wp_bp_activity_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_bp_notifications`
--

CREATE TABLE IF NOT EXISTS `wp_bp_notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `secondary_item_id` bigint(20) DEFAULT NULL,
  `component_name` varchar(75) NOT NULL,
  `component_action` varchar(75) NOT NULL,
  `date_notified` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `secondary_item_id` (`secondary_item_id`),
  KEY `user_id` (`user_id`),
  KEY `is_new` (`is_new`),
  KEY `component_name` (`component_name`),
  KEY `component_action` (`component_action`),
  KEY `useritem` (`user_id`,`is_new`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_bp_notifications_meta`
--

CREATE TABLE IF NOT EXISTS `wp_bp_notifications_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notification_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `notification_id` (`notification_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_bp_xprofile_data`
--

CREATE TABLE IF NOT EXISTS `wp_bp_xprofile_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `value` longtext NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `wp_bp_xprofile_data`
--

INSERT INTO `wp_bp_xprofile_data` (`id`, `field_id`, `user_id`, `value`, `last_updated`) VALUES
(1, 1, 1, 'admin', '2015-10-24 10:24:51');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_bp_xprofile_fields`
--

CREATE TABLE IF NOT EXISTS `wp_bp_xprofile_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL,
  `type` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_default_option` tinyint(1) NOT NULL DEFAULT '0',
  `field_order` bigint(20) NOT NULL DEFAULT '0',
  `option_order` bigint(20) NOT NULL DEFAULT '0',
  `order_by` varchar(15) NOT NULL DEFAULT '',
  `can_delete` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `parent_id` (`parent_id`),
  KEY `field_order` (`field_order`),
  KEY `can_delete` (`can_delete`),
  KEY `is_required` (`is_required`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `wp_bp_xprofile_fields`
--

INSERT INTO `wp_bp_xprofile_fields` (`id`, `group_id`, `parent_id`, `type`, `name`, `description`, `is_required`, `is_default_option`, `field_order`, `option_order`, `order_by`, `can_delete`) VALUES
(1, 1, 0, 'textbox', 'Name', '', 1, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_bp_xprofile_groups`
--

CREATE TABLE IF NOT EXISTS `wp_bp_xprofile_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` mediumtext NOT NULL,
  `group_order` bigint(20) NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `can_delete` (`can_delete`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `wp_bp_xprofile_groups`
--

INSERT INTO `wp_bp_xprofile_groups` (`id`, `name`, `description`, `group_order`, `can_delete`) VALUES
(1, 'Base', '', 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_bp_xprofile_meta`
--

CREATE TABLE IF NOT EXISTS `wp_bp_xprofile_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) NOT NULL,
  `object_type` varchar(150) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'https://wordpress.org/', '', '2015-05-09 09:44:22', '2015-05-09 09:44:22', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_em_bookings`
--

CREATE TABLE IF NOT EXISTS `wp_em_bookings` (
  `booking_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` bigint(20) unsigned NOT NULL,
  `person_id` bigint(20) unsigned NOT NULL,
  `booking_spaces` int(5) NOT NULL,
  `booking_comment` text,
  `booking_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `booking_status` tinyint(1) NOT NULL DEFAULT '1',
  `booking_price` decimal(14,4) unsigned NOT NULL DEFAULT '0.0000',
  `booking_tax_rate` decimal(7,4) DEFAULT NULL,
  `booking_taxes` decimal(14,4) DEFAULT NULL,
  `booking_meta` longtext,
  PRIMARY KEY (`booking_id`),
  KEY `event_id` (`event_id`),
  KEY `person_id` (`person_id`),
  KEY `booking_status` (`booking_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_em_events`
--

CREATE TABLE IF NOT EXISTS `wp_em_events` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `event_slug` varchar(200) DEFAULT NULL,
  `event_owner` bigint(20) unsigned DEFAULT NULL,
  `event_status` int(1) DEFAULT NULL,
  `event_name` text,
  `event_start_time` time DEFAULT NULL,
  `event_end_time` time DEFAULT NULL,
  `event_all_day` int(1) DEFAULT NULL,
  `event_start_date` date DEFAULT NULL,
  `event_end_date` date DEFAULT NULL,
  `post_content` longtext,
  `event_rsvp` tinyint(1) NOT NULL DEFAULT '0',
  `event_rsvp_date` date DEFAULT NULL,
  `event_rsvp_time` time DEFAULT NULL,
  `event_rsvp_spaces` int(5) DEFAULT NULL,
  `event_spaces` int(5) DEFAULT '0',
  `event_private` tinyint(1) NOT NULL DEFAULT '0',
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `recurrence_id` bigint(20) unsigned DEFAULT NULL,
  `event_category_id` bigint(20) unsigned DEFAULT NULL,
  `event_attributes` text,
  `event_date_created` datetime DEFAULT NULL,
  `event_date_modified` datetime DEFAULT NULL,
  `recurrence` tinyint(1) NOT NULL DEFAULT '0',
  `recurrence_interval` int(4) DEFAULT NULL,
  `recurrence_freq` tinytext,
  `recurrence_byday` tinytext,
  `recurrence_byweekno` int(4) DEFAULT NULL,
  `recurrence_days` int(4) DEFAULT NULL,
  `recurrence_rsvp_days` int(3) DEFAULT NULL,
  `blog_id` bigint(20) unsigned DEFAULT NULL,
  `group_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `event_status` (`event_status`),
  KEY `post_id` (`post_id`),
  KEY `blog_id` (`blog_id`),
  KEY `group_id` (`group_id`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `wp_em_events`
--

INSERT INTO `wp_em_events` (`event_id`, `post_id`, `event_slug`, `event_owner`, `event_status`, `event_name`, `event_start_time`, `event_end_time`, `event_all_day`, `event_start_date`, `event_end_date`, `post_content`, `event_rsvp`, `event_rsvp_date`, `event_rsvp_time`, `event_rsvp_spaces`, `event_spaces`, `event_private`, `location_id`, `recurrence_id`, `event_category_id`, `event_attributes`, `event_date_created`, `event_date_modified`, `recurrence`, `recurrence_interval`, `recurrence_freq`, `recurrence_byday`, `recurrence_byweekno`, `recurrence_days`, `recurrence_rsvp_days`, `blog_id`, `group_id`) VALUES
(1, 42, 'test-paderborn', 1, 1, 'Test Paderborn', '19:00:00', '20:00:00', 0, '2015-10-30', '2015-10-31', 'test', 0, NULL, '00:00:00', NULL, 0, 0, 3, NULL, NULL, 'a:4:{s:17:"snap_isAutoPosted";s:1:"1";s:10:"snap_MYURL";s:0:"";s:8:"snapEdIT";s:1:"1";s:6:"snapTW";s:150:"s:141:"a:1:{i:0;a:5:{s:10:"SNAPformat";s:15:"%TITLE% - %URL%";s:8:"attchImg";s:1:"0";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:4:"doTW";i:0;}}";";}', '2015-10-24 13:42:13', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_em_locations`
--

CREATE TABLE IF NOT EXISTS `wp_em_locations` (
  `location_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `blog_id` bigint(20) unsigned DEFAULT NULL,
  `location_slug` varchar(200) DEFAULT NULL,
  `location_name` text,
  `location_owner` bigint(20) unsigned NOT NULL DEFAULT '0',
  `location_address` varchar(200) DEFAULT NULL,
  `location_town` varchar(200) DEFAULT NULL,
  `location_state` varchar(200) DEFAULT NULL,
  `location_postcode` varchar(10) DEFAULT NULL,
  `location_region` varchar(200) DEFAULT NULL,
  `location_country` char(2) DEFAULT NULL,
  `location_latitude` float(10,6) DEFAULT NULL,
  `location_longitude` float(10,6) DEFAULT NULL,
  `post_content` longtext,
  `location_status` int(1) DEFAULT NULL,
  `location_private` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`location_id`),
  KEY `location_state` (`location_state`),
  KEY `location_region` (`location_region`),
  KEY `location_country` (`location_country`),
  KEY `post_id` (`post_id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Daten für Tabelle `wp_em_locations`
--

INSERT INTO `wp_em_locations` (`location_id`, `post_id`, `blog_id`, `location_slug`, `location_name`, `location_owner`, `location_address`, `location_town`, `location_state`, `location_postcode`, `location_region`, `location_country`, `location_latitude`, `location_longitude`, `post_content`, `location_status`, `location_private`) VALUES
(1, 13, 0, 'hamburg', 'Shopwerft GmbH', 1, 'Mattentwiete 8', 'Hamburg', 'Hamburg', '20457', NULL, 'DE', 53.545151, 9.988800, NULL, 1, 0),
(2, 28, 0, 'netzkollektiv', 'Netzkollektiv', 1, 'Frauentormauer 18', 'Nürnberg', NULL, '90402', NULL, 'DE', 49.447048, 11.078500, NULL, 1, 0),
(3, 30, 0, 'technologiepark-bistro-raum-a', 'Technologiepark, Bistro Raum A', 1, 'Technologiepark 13', 'Paderborn', NULL, '33100', NULL, 'DE', 51.701405, 8.763189, NULL, 1, 0),
(4, 32, 0, 'gebrueder-otto-gourmet-gmbh', 'Gebrüder Otto Gourmet GmbH', 1, 'Boos-Fremery-Straße 62', 'Heinsberg', NULL, '52525', NULL, 'DE', 51.058746, 6.141278, NULL, 1, 0),
(5, 34, 0, 'stockwerk', 'StockWerk', 1, 'Pater-Schwartz-Gasse 11A', 'Wien', 'Wien', '1150', 'Wien', 'AT', 48.192005, 16.335951, NULL, 1, 0),
(6, 43, 0, 'citizen-space', 'Citizen Space', 1, 'Heinrichstrasse 267a', 'Zürich', NULL, '8005', NULL, 'CH', 47.388969, 8.521826, 'In charaktervollen Räumen des Industriezeitalters arbeiten, via W-Lan weltweit kommunizieren, am Nebentisch Ideen diskutieren. Und das heisst auch: Pause machen – Ideen finden.\r\n\r\nMehr Infos über die Location unter <a href="http://citizen-space.ch" target="_blank">citizen-space.ch</a>', 1, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_em_meta`
--

CREATE TABLE IF NOT EXISTS `wp_em_meta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  `meta_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`meta_id`),
  KEY `object_id` (`object_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `wp_em_meta`
--

INSERT INTO `wp_em_meta` (`meta_id`, `object_id`, `meta_key`, `meta_value`, `meta_date`) VALUES
(1, 3, 'category-bgcolor', '#FFFFFF', '2015-05-09 10:08:43'),
(2, 4, 'category-bgcolor', '#FFFFFF', '2015-05-09 13:47:59'),
(3, 5, 'category-bgcolor', '#FFFFFF', '2015-05-09 13:49:19');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_em_tickets`
--

CREATE TABLE IF NOT EXISTS `wp_em_tickets` (
  `ticket_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` bigint(20) unsigned NOT NULL,
  `ticket_name` tinytext NOT NULL,
  `ticket_description` text,
  `ticket_price` decimal(14,4) DEFAULT NULL,
  `ticket_start` datetime DEFAULT NULL,
  `ticket_end` datetime DEFAULT NULL,
  `ticket_min` int(10) DEFAULT NULL,
  `ticket_max` int(10) DEFAULT NULL,
  `ticket_spaces` int(11) DEFAULT NULL,
  `ticket_members` int(1) DEFAULT NULL,
  `ticket_members_roles` longtext,
  `ticket_guests` int(1) DEFAULT NULL,
  `ticket_required` int(1) DEFAULT NULL,
  `ticket_meta` longtext,
  PRIMARY KEY (`ticket_id`),
  KEY `event_id` (`event_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `wp_em_tickets`
--

INSERT INTO `wp_em_tickets` (`ticket_id`, `event_id`, `ticket_name`, `ticket_description`, `ticket_price`, `ticket_start`, `ticket_end`, `ticket_min`, `ticket_max`, `ticket_spaces`, `ticket_members`, `ticket_members_roles`, `ticket_guests`, `ticket_required`, `ticket_meta`) VALUES
(1, 1, 'Standard-Ticket', NULL, 0.0000, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_em_tickets_bookings`
--

CREATE TABLE IF NOT EXISTS `wp_em_tickets_bookings` (
  `ticket_booking_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint(20) unsigned NOT NULL,
  `ticket_id` bigint(20) unsigned NOT NULL,
  `ticket_booking_spaces` int(6) NOT NULL,
  `ticket_booking_price` decimal(14,4) NOT NULL,
  PRIMARY KEY (`ticket_booking_id`),
  KEY `booking_id` (`booking_id`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_nxs_log`
--

CREATE TABLE IF NOT EXISTS `wp_nxs_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `act` varchar(255) NOT NULL DEFAULT '',
  `nt` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `msg` text NOT NULL,
  `extInfo` text NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Daten für Tabelle `wp_nxs_log`
--

INSERT INTO `wp_nxs_log` (`id`, `date`, `act`, `nt`, `type`, `msg`, `extInfo`) VALUES
(1, '2015-10-24 13:42:13', '*** ID: 42, Type: event', '', 'BG', ' Status Changed: draft_to_publish. Autopost requested.', ''),
(2, '2015-10-24 13:42:13', 'Start =- ', '', 'BG', '------=========#### NEW AUTO-POST REQUEST  PostID:(42) Scheduled +4 ####=========------', ''),
(3, '2015-10-24 13:42:13', 'Skipped', 'Twitter (MagentoHamburg)', 'GR', '-=[Unchecked Account]=- - PostID:42', ''),
(4, '2015-10-24 13:42:20', '*** ID: 43, Type: location', '', 'BG', ' Status Changed: draft_to_publish. Autopost requested.', ''),
(5, '2015-10-24 13:42:20', 'Start =- ', '', 'BG', '------=========#### NEW AUTO-POST REQUEST  PostID:(43) Scheduled +5 ####=========------', ''),
(6, '2015-10-24 13:42:20', 'Skipped', 'Twitter (MagentoHamburg)', 'GR', '-=[Unchecked Account]=- - PostID:43', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=893 ;

--
-- Daten für Tabelle `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://beta.magento-stammtisch.de', 'yes'),
(2, 'home', 'http://beta.magento-stammtisch.de', 'yes'),
(3, 'blogname', 'Magento Stammtisch', 'yes'),
(4, 'blogdescription', 'NEU! Alle Magento-Termine - jetzt hier und aktuell!', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'daim1985@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'closed', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j. F Y', 'yes'),
(24, 'time_format', 'G:i', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'gzipcompression', '0', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:3:{i:0;s:24:"buddypress/bp-loader.php";i:1;s:33:"events-manager/events-manager.php";i:2;s:67:"social-networks-auto-poster-facebook-twitter-g/NextScripts_SNAP.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'advanced_edit', '0', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '2', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', '', 'no'),
(41, 'template', 'firegento_stammtisch', 'yes'),
(42, 'stylesheet', 'firegento_stammtisch', 'yes'),
(43, 'comment_whitelist', '1', 'yes'),
(44, 'blacklist_keys', '', 'no'),
(45, 'comment_registration', '', 'yes'),
(46, 'html_type', 'text/html', 'yes'),
(47, 'use_trackback', '0', 'yes'),
(48, 'default_role', 'subscriber', 'yes'),
(49, 'db_version', '33056', 'yes'),
(50, 'uploads_use_yearmonth_folders', '1', 'yes'),
(51, 'upload_path', '', 'yes'),
(52, 'blog_public', '1', 'yes'),
(53, 'default_link_category', '2', 'yes'),
(54, 'show_on_front', 'posts', 'yes'),
(55, 'tag_base', '', 'yes'),
(56, 'show_avatars', '1', 'yes'),
(57, 'avatar_rating', 'G', 'yes'),
(58, 'upload_url_path', '', 'yes'),
(59, 'thumbnail_size_w', '150', 'yes'),
(60, 'thumbnail_size_h', '150', 'yes'),
(61, 'thumbnail_crop', '1', 'yes'),
(62, 'medium_size_w', '300', 'yes'),
(63, 'medium_size_h', '300', 'yes'),
(64, 'avatar_default', 'mystery', 'yes'),
(65, 'large_size_w', '1024', 'yes'),
(66, 'large_size_h', '1024', 'yes'),
(67, 'image_default_link_type', 'file', 'yes'),
(68, 'image_default_size', '', 'yes'),
(69, 'image_default_align', '', 'yes'),
(70, 'close_comments_for_old_posts', '', 'yes'),
(71, 'close_comments_days_old', '14', 'yes'),
(72, 'thread_comments', '1', 'yes'),
(73, 'thread_comments_depth', '5', 'yes'),
(74, 'page_comments', '', 'yes'),
(75, 'comments_per_page', '50', 'yes'),
(76, 'default_comments_page', 'newest', 'yes'),
(77, 'comment_order', 'asc', 'yes'),
(78, 'sticky_posts', 'a:0:{}', 'yes'),
(79, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(82, 'uninstall_plugins', 'a:0:{}', 'no'),
(83, 'timezone_string', '', 'yes'),
(84, 'page_for_posts', '0', 'yes'),
(85, 'page_on_front', '0', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'initial_db_version', '31535', 'yes'),
(89, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:94:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:14:"publish_events";b:1;s:20:"delete_others_events";b:1;s:18:"edit_others_events";b:1;s:22:"manage_others_bookings";b:1;s:24:"publish_recurring_events";b:1;s:30:"delete_others_recurring_events";b:1;s:28:"edit_others_recurring_events";b:1;s:17:"publish_locations";b:1;s:23:"delete_others_locations";b:1;s:16:"delete_locations";b:1;s:21:"edit_others_locations";b:1;s:23:"delete_event_categories";b:1;s:21:"edit_event_categories";b:1;s:15:"manage_bookings";b:1;s:19:"upload_event_images";b:1;s:13:"delete_events";b:1;s:11:"edit_events";b:1;s:19:"read_private_events";b:1;s:23:"delete_recurring_events";b:1;s:21:"edit_recurring_events";b:1;s:14:"edit_locations";b:1;s:22:"read_private_locations";b:1;s:21:"read_others_locations";b:1;s:14:"ure_edit_roles";b:1;s:16:"ure_create_roles";b:1;s:16:"ure_delete_roles";b:1;s:23:"ure_create_capabilities";b:1;s:23:"ure_delete_capabilities";b:1;s:18:"ure_manage_options";b:1;s:15:"ure_reset_roles";b:1;s:12:"see_snap_box";b:1;s:15:"make_snap_posts";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:57:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:14:"publish_events";b:1;s:20:"delete_others_events";b:1;s:18:"edit_others_events";b:1;s:22:"manage_others_bookings";b:1;s:24:"publish_recurring_events";b:1;s:30:"delete_others_recurring_events";b:1;s:28:"edit_others_recurring_events";b:1;s:17:"publish_locations";b:1;s:23:"delete_others_locations";b:1;s:16:"delete_locations";b:1;s:21:"edit_others_locations";b:1;s:23:"delete_event_categories";b:1;s:21:"edit_event_categories";b:1;s:15:"manage_bookings";b:1;s:19:"upload_event_images";b:1;s:13:"delete_events";b:1;s:11:"edit_events";b:1;s:19:"read_private_events";b:1;s:23:"delete_recurring_events";b:1;s:21:"edit_recurring_events";b:1;s:14:"edit_locations";b:1;s:22:"read_private_locations";b:1;s:21:"read_others_locations";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:20:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;s:15:"manage_bookings";b:1;s:19:"upload_event_images";b:1;s:13:"delete_events";b:1;s:11:"edit_events";b:1;s:19:"read_private_events";b:1;s:23:"delete_recurring_events";b:1;s:21:"edit_recurring_events";b:1;s:14:"edit_locations";b:1;s:22:"read_private_locations";b:1;s:21:"read_others_locations";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:15:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:15:"manage_bookings";b:1;s:19:"upload_event_images";b:1;s:13:"delete_events";b:1;s:11:"edit_events";b:1;s:19:"read_private_events";b:1;s:23:"delete_recurring_events";b:1;s:21:"edit_recurring_events";b:1;s:14:"edit_locations";b:1;s:22:"read_private_locations";b:1;s:21:"read_others_locations";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:12:{s:4:"read";b:1;s:7:"level_0";b:1;s:15:"manage_bookings";b:1;s:19:"upload_event_images";b:1;s:13:"delete_events";b:1;s:11:"edit_events";b:1;s:19:"read_private_events";b:1;s:23:"delete_recurring_events";b:1;s:21:"edit_recurring_events";b:1;s:14:"edit_locations";b:1;s:22:"read_private_locations";b:1;s:21:"read_others_locations";b:1;}}}', 'yes'),
(90, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(91, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(92, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'sidebars_widgets', 'a:3:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes'),
(97, 'cron', 'a:7:{i:1445686998;a:1:{s:19:"nxs_querypost_event";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:11:"nxsreposter";s:4:"args";a:0:{}s:8:"interval";i:90;}}}i:1445687448;a:1:{s:16:"nxs_hourly_event";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1445713800;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1445723062;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1445766280;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1445766832;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(107, '_transient_random_seed', 'a2860155f33f8aafab2847e65537c9ba', 'yes'),
(128, 'recently_activated', 'a:0:{}', 'yes'),
(130, 'dbem_events_page', '4', 'yes'),
(131, 'dbem_locations_page', '5', 'yes'),
(132, 'dbem_categories_page', '6', 'yes'),
(133, 'dbem_tags_page', '7', 'yes'),
(134, 'dbem_my_bookings_page', '8', 'yes'),
(135, 'dbem_hello_to_user', '0', 'yes'),
(136, 'dbem_time_format', 'G:i', 'yes'),
(137, 'dbem_date_format', 'd.m.Y', 'yes'),
(138, 'dbem_date_format_js', 'dd.mm.yy', 'yes'),
(139, 'dbem_dates_separator', ' - ', 'yes'),
(140, 'dbem_times_separator', ' - ', 'yes'),
(141, 'dbem_default_category', '-1', 'yes'),
(142, 'dbem_default_location', '0', 'yes'),
(143, 'dbem_events_default_orderby', 'event_start_date,event_start_time,event_name', 'yes'),
(144, 'dbem_events_default_order', 'ASC', 'yes'),
(145, 'dbem_events_default_limit', '10', 'yes'),
(146, 'dbem_search_form_submit', 'Search', 'yes'),
(147, 'dbem_search_form_advanced', '1', 'yes'),
(148, 'dbem_search_form_advanced_hidden', '1', 'yes'),
(149, 'dbem_search_form_advanced_show', 'Show Advanced Search', 'yes'),
(150, 'dbem_search_form_advanced_hide', 'Hide Advanced Search', 'yes'),
(151, 'dbem_search_form_text', '1', 'yes'),
(152, 'dbem_search_form_text_label', 'Search', 'yes'),
(153, 'dbem_search_form_geo', '1', 'yes'),
(154, 'dbem_search_form_geo_label', 'Near...', 'yes'),
(155, 'dbem_search_form_geo_units', '1', 'yes'),
(156, 'dbem_search_form_geo_units_label', 'Within', 'yes'),
(157, 'dbem_search_form_geo_unit_default', 'mi', 'yes'),
(158, 'dbem_search_form_geo_distance_default', '25', 'yes'),
(159, 'dbem_search_form_geo_distance_options', '5,10,25,50,100', 'yes'),
(160, 'dbem_search_form_dates', '1', 'yes'),
(161, 'dbem_search_form_dates_label', 'Dates', 'yes'),
(162, 'dbem_search_form_dates_separator', 'and', 'yes'),
(163, 'dbem_search_form_categories', '1', 'yes'),
(164, 'dbem_search_form_categories_label', 'All Categories', 'yes'),
(165, 'dbem_search_form_category_label', 'Category', 'yes'),
(166, 'dbem_search_form_countries', '1', 'yes'),
(167, 'dbem_search_form_default_country', '0', 'yes'),
(168, 'dbem_search_form_countries_label', 'All Countries', 'yes'),
(169, 'dbem_search_form_country_label', 'Country', 'yes'),
(170, 'dbem_search_form_regions', '1', 'yes'),
(171, 'dbem_search_form_regions_label', 'All Regions', 'yes'),
(172, 'dbem_search_form_region_label', 'Region', 'yes'),
(173, 'dbem_search_form_states', '1', 'yes'),
(174, 'dbem_search_form_states_label', 'All States', 'yes'),
(175, 'dbem_search_form_state_label', 'State/County', 'yes'),
(176, 'dbem_search_form_towns', '0', 'yes'),
(177, 'dbem_search_form_towns_label', 'All Cities/Towns', 'yes'),
(178, 'dbem_search_form_town_label', 'City/Town', 'yes'),
(179, 'dbem_events_form_editor', '1', 'yes'),
(180, 'dbem_events_form_reshow', '1', 'yes'),
(181, 'dbem_events_form_result_success', 'You have successfully submitted your event, which will be published pending approval.', 'yes'),
(182, 'dbem_events_form_result_success_updated', 'You have successfully updated your event, which will be republished pending approval.', 'yes'),
(183, 'dbem_events_anonymous_submissions', '0', 'yes'),
(184, 'dbem_events_anonymous_user', '1', 'yes'),
(185, 'dbem_events_anonymous_result_success', 'You have successfully submitted your event, which will be published pending approval.', 'yes'),
(186, 'dbem_event_submitted_email_admin', '', 'yes'),
(187, 'dbem_event_submitted_email_subject', 'Submitted Event Awaiting Approval', 'yes'),
(188, 'dbem_event_submitted_email_body', 'A new event has been submitted by #_CONTACTNAME.\r\n\r\nName : #_EVENTNAME \r\n\r\nDate : #_EVENTDATES \r\n\r\nTime : #_EVENTTIMES \r\n\r\nPlease visit http://stammtisch.localhost/wp-admin/post.php?action=edit&post=#_EVENTPOSTID to review this event for approval.\r\n\r\n\r\n-------------------------------\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(189, 'dbem_event_resubmitted_email_subject', 'Re-Submitted Event Awaiting Approval', 'yes'),
(190, 'dbem_event_resubmitted_email_body', 'A previously published event has been modified by #_CONTACTNAME, and this event is now unpublished and pending your approval.\r\n\r\nName : #_EVENTNAME \r\n\r\nDate : #_EVENTDATES \r\n\r\nTime : #_EVENTTIMES \r\n\r\nPlease visit http://stammtisch.localhost/wp-admin/post.php?action=edit&post=#_EVENTPOSTID to review this event for approval.\r\n\r\n\r\n-------------------------------\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(191, 'dbem_event_published_email_subject', 'Published Event - #_EVENTNAME', 'yes'),
(192, 'dbem_event_published_email_body', 'A new event has been published by #_CONTACTNAME.\r\n\r\nName : #_EVENTNAME \r\n\r\nDate : #_EVENTDATES \r\n\r\nTime : #_EVENTTIMES \r\n\r\nEdit this event - http://stammtisch.localhost/wp-admin/post.php?action=edit&post=#_EVENTPOSTID \r\n\r\n View this event - #_EVENTURL\r\n\r\n\r\n-------------------------------\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(193, 'dbem_event_approved_email_subject', 'Event Approved - #_EVENTNAME', 'yes'),
(194, 'dbem_event_approved_email_body', 'Dear #_CONTACTNAME, \r\n\r\nYour event #_EVENTNAME on #_EVENTDATES has been approved.\r\n\r\nYou can view your event here: #_EVENTURL\r\n\r\n\r\n-------------------------------\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(195, 'dbem_event_reapproved_email_subject', 'Event Approved - #_EVENTNAME', 'yes'),
(196, 'dbem_event_reapproved_email_body', 'Dear #_CONTACTNAME, \r\n\r\nYour event #_EVENTNAME on #_EVENTDATES has been approved.\r\n\r\nYou can view your event here: #_EVENTURL\r\n\r\n\r\n-------------------------------\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(197, 'dbem_events_page_title', 'Events', 'yes'),
(198, 'dbem_events_page_scope', 'future', 'yes'),
(199, 'dbem_events_page_search_form', '1', 'yes'),
(200, 'dbem_event_list_item_format_header', '<table cellpadding="0" cellspacing="0" class="events-table" >\r\n    <thead>\r\n        <tr>\r\n			<th class="event-time" width="150">Date/Time</th>\r\n			<th class="event-description" width="*">Event</th>\r\n		</tr>\r\n   	</thead>\r\n    <tbody>', 'yes'),
(201, 'dbem_event_list_item_format', '<tr>\r\n			<td>\r\n                #_EVENTDATES<br/>\r\n                #_EVENTTIMES\r\n            </td>\r\n            <td>\r\n                #_EVENTLINK\r\n                {has_location}<br/><i>#_LOCATIONNAME, #_LOCATIONTOWN #_LOCATIONSTATE</i>{/has_location}\r\n            </td>\r\n        </tr>', 'yes'),
(202, 'dbem_event_list_item_format_footer', '</tbody></table>', 'yes'),
(203, 'dbem_event_list_groupby', '0', 'yes'),
(204, 'dbem_event_list_groupby_format', '', 'yes'),
(205, 'dbem_event_list_groupby_header_format', '<h2>#s</h2>', 'yes'),
(206, 'dbem_display_calendar_in_events_page', '0', 'yes'),
(207, 'dbem_single_event_format', '<div style="float:right; margin:0px 0px 15px 15px;">#_LOCATIONMAP</div>\r\n<p>\r\n	<strong>Date/Time</strong><br/>\r\n	Date(s) - #_EVENTDATES<br /><i>#_EVENTTIMES</i>\r\n</p>\r\n{has_location}\r\n<p>\r\n	<strong>Location</strong><br/>\r\n	#_LOCATIONLINK\r\n</p>\r\n{/has_location}\r\n<p>\r\n	<strong>Categories</strong>\r\n	#_CATEGORIES\r\n</p>\r\n<br style="clear:both" />\r\n#_EVENTNOTES\r\n{has_bookings}\r\n<h3>Bookings</h3>\r\n#_BOOKINGFORM\r\n{/has_bookings}', 'yes'),
(208, 'dbem_event_excerpt_format', '#_EVENTDATES @ #_EVENTTIMES - #_EVENTEXCERPT', 'yes'),
(209, 'dbem_event_excerpt_alt_format', '#_EVENTDATES @ #_EVENTTIMES - #_EVENTEXCERPT{55}', 'yes'),
(210, 'dbem_event_page_title_format', '#_EVENTNAME', 'yes'),
(211, 'dbem_event_all_day_message', 'ganztägig', 'yes'),
(212, 'dbem_no_events_message', 'No Events', 'yes'),
(213, 'dbem_locations_default_orderby', 'location_name', 'yes'),
(214, 'dbem_locations_default_order', 'ASC', 'yes'),
(215, 'dbem_locations_default_limit', '10', 'yes'),
(216, 'dbem_locations_page_title', 'Event Locations', 'yes'),
(217, 'dbem_locations_page_search_form', '1', 'yes'),
(218, 'dbem_no_locations_message', 'Keine Veranstaltungsorte', 'yes'),
(219, 'dbem_location_default_country', 'DE', 'yes'),
(220, 'dbem_location_list_item_format_header', '<ul class="em-locations-list">', 'yes'),
(221, 'dbem_location_list_item_format', '<li>#_LOCATIONLINK<ul><li>#_LOCATIONFULLLINE</li></ul></li>', 'yes'),
(222, 'dbem_location_list_item_format_footer', '</ul>', 'yes'),
(223, 'dbem_location_page_title_format', '#_LOCATIONNAME', 'yes'),
(224, 'dbem_single_location_format', '<div style="float:right; margin:0px 0px 15px 15px;">#_LOCATIONMAP</div>\r\n<p>\r\n	<strong>Adresse</strong><br/>\r\n	#_LOCATIONADDRESS<br/>\r\n	#_LOCATIONPOSTCODE #_LOCATIONTOWN<br/>\r\n	#_LOCATIONCOUNTRY\r\n</p>\r\n<br style="clear:both" />\r\n#_LOCATIONNOTES\r\n\r\n<h3>Nächste Veranstaltungen</h3>\r\n<p>#_LOCATIONNEXTEVENTS</p>', 'yes'),
(225, 'dbem_location_excerpt_format', '#_LOCATIONEXCERPT', 'yes'),
(226, 'dbem_location_excerpt_alt_format', '#_LOCATIONEXCERPT{55}', 'yes'),
(227, 'dbem_location_no_events_message', '<li>Keine Veranstaltungen in dieser Stadt</li>', 'yes'),
(228, 'dbem_location_event_list_item_header_format', '<ul>', 'yes'),
(229, 'dbem_location_event_list_item_format', '<li>#_EVENTLINK - #_EVENTDATES - #_EVENTTIMES</li>', 'yes'),
(230, 'dbem_location_event_list_item_footer_format', '</ul>', 'yes'),
(231, 'dbem_location_event_list_limit', '20', 'yes'),
(232, 'dbem_location_event_single_format', '#_EVENTLINK - #_EVENTDATES - #_EVENTTIMES', 'yes'),
(233, 'dbem_location_no_event_message', 'Keine Veranstaltungen in dieser Stadt', 'yes'),
(234, 'dbem_categories_default_limit', '', 'yes'),
(235, 'dbem_categories_default_orderby', 'name', 'yes'),
(236, 'dbem_categories_default_order', 'ASC', 'yes'),
(237, 'dbem_categories_list_item_format_header', '<ul class="em-categories-list">', 'yes'),
(238, 'dbem_categories_list_item_format', '<li>#_CATEGORYLINK</li>', 'yes'),
(239, 'dbem_categories_list_item_format_footer', '</ul>', 'yes'),
(240, 'dbem_no_categories_message', 'No Categories', 'yes'),
(241, 'dbem_category_page_title_format', '#_CATEGORYNAME', 'yes'),
(242, 'dbem_category_page_format', '#_CATEGORYNOTES<h3>Upcoming Events</h3>#_CATEGORYNEXTEVENTS', 'yes'),
(243, 'dbem_category_no_events_message', '<li>No events in this category</li>', 'yes'),
(244, 'dbem_category_event_list_item_header_format', '<ul>', 'yes'),
(245, 'dbem_category_event_list_item_format', '<li>#_EVENTLINK - #_EVENTDATES - #_EVENTTIMES</li>', 'yes'),
(246, 'dbem_category_event_list_item_footer_format', '</ul>', 'yes'),
(247, 'dbem_category_event_list_limit', '', 'yes'),
(248, 'dbem_category_event_single_format', '#_EVENTLINK - #_EVENTDATES - #_EVENTTIMES', 'yes'),
(249, 'dbem_category_no_event_message', 'No events in this category', 'yes'),
(250, 'dbem_category_default_color', '#a8d144', 'yes'),
(251, 'dbem_tags_default_limit', '10', 'yes'),
(252, 'dbem_tags_default_orderby', 'name', 'yes'),
(253, 'dbem_tags_default_order', 'ASC', 'yes'),
(254, 'dbem_tags_list_item_format_header', '<ul class="em-tags-list">', 'yes'),
(255, 'dbem_tags_list_item_format', '<li>#_TAGLINK</li>', 'yes'),
(256, 'dbem_tags_list_item_format_footer', '</ul>', 'yes'),
(257, 'dbem_no_tags_message', 'No Tags', 'yes'),
(258, 'dbem_tag_page_title_format', '#_TAGNAME', 'yes'),
(259, 'dbem_tag_page_format', '<h3>Upcoming Events</h3>#_TAGNEXTEVENTS', 'yes'),
(260, 'dbem_tag_no_events_message', '<li>No events with this tag</li>', 'yes'),
(261, 'dbem_tag_event_list_item_header_format', '<ul>', 'yes'),
(262, 'dbem_tag_event_list_item_format', '<li>#_EVENTLINK - #_EVENTDATES - #_EVENTTIMES</li>', 'yes'),
(263, 'dbem_tag_event_list_item_footer_format', '</ul>', 'yes'),
(264, 'dbem_tag_event_single_format', '#_EVENTLINK - #_EVENTDATES - #_EVENTTIMES', 'yes'),
(265, 'dbem_tag_no_event_message', 'No events with this tag', 'yes'),
(266, 'dbem_tag_event_list_limit', '20', 'yes'),
(267, 'dbem_rss_limit', '0', 'yes'),
(268, 'dbem_rss_scope', 'future', 'yes'),
(269, 'dbem_rss_main_title', 'Magento Stammtisch - Events', 'yes'),
(270, 'dbem_rss_main_description', 'Just another WordPress site - Events', 'yes'),
(271, 'dbem_rss_description_format', '#_EVENTDATES - #_EVENTTIMES <br/>#_LOCATIONNAME <br/>#_LOCATIONADDRESS <br/>#_LOCATIONTOWN', 'yes'),
(272, 'dbem_rss_title_format', '#_EVENTNAME', 'yes'),
(273, 'dbem_rss_order', 'ASC', 'yes'),
(274, 'dbem_rss_orderby', 'event_start_date,event_start_time,event_name', 'yes'),
(275, 'em_rss_pubdate', 'Sat, 09 May 2015 09:44:51 +0000', 'yes'),
(276, 'dbem_ical_limit', '0', 'yes'),
(277, 'dbem_ical_scope', 'future', 'yes'),
(278, 'dbem_ical_description_format', '#_EVENTNAME - #_LOCATIONNAME - #_EVENTDATES - #_EVENTTIMES', 'yes'),
(279, 'dbem_ical_real_description_format', '#_EVENTEXCERPT', 'yes'),
(280, 'dbem_ical_location_format', '#_LOCATION', 'yes'),
(281, 'dbem_gmap_is_active', '1', 'yes'),
(282, 'dbem_map_default_width', '400px', 'yes'),
(283, 'dbem_map_default_height', '300px', 'yes'),
(284, 'dbem_location_baloon_format', '<strong>#_LOCATIONNAME</strong><br/>#_LOCATIONADDRESS - #_LOCATIONTOWN<br/><a href="#_LOCATIONPAGEURL">Events</a>', 'yes'),
(285, 'dbem_map_text_format', '<strong>#_LOCATIONNAME</strong><p>#_LOCATIONADDRESS</p><p>#_LOCATIONTOWN</p>', 'yes'),
(286, 'dbem_email_disable_registration', '0', 'yes'),
(287, 'dbem_rsvp_mail_port', '465', 'yes'),
(288, 'dbem_smtp_host', 'localhost', 'yes'),
(289, 'dbem_mail_sender_name', '', 'yes'),
(290, 'dbem_rsvp_mail_send_method', 'wp_mail', 'yes'),
(291, 'dbem_rsvp_mail_SMTPAuth', '1', 'yes'),
(292, 'dbem_smtp_html', '1', 'yes'),
(293, 'dbem_smtp_html_br', '1', 'yes'),
(294, 'dbem_image_max_width', '700', 'yes'),
(295, 'dbem_image_max_height', '700', 'yes'),
(296, 'dbem_image_min_width', '50', 'yes'),
(297, 'dbem_image_min_height', '50', 'yes'),
(298, 'dbem_image_max_size', '204800', 'yes'),
(299, 'dbem_list_date_title', 'Events - #j #M #y', 'yes'),
(300, 'dbem_full_calendar_month_format', 'M Y', 'yes'),
(301, 'dbem_full_calendar_event_format', '<li>#_EVENTLINK</li>', 'yes'),
(302, 'dbem_full_calendar_long_events', '0', 'yes'),
(303, 'dbem_full_calendar_initials_length', '0', 'yes'),
(304, 'dbem_full_calendar_abbreviated_weekdays', '1', 'yes'),
(305, 'dbem_display_calendar_day_single_yes', '1', 'yes'),
(306, 'dbem_small_calendar_month_format', 'M Y', 'yes'),
(307, 'dbem_small_calendar_event_title_format', '#_EVENTNAME', 'yes'),
(308, 'dbem_small_calendar_event_title_separator', ', ', 'yes'),
(309, 'dbem_small_calendar_initials_length', '1', 'yes'),
(310, 'dbem_small_calendar_abbreviated_weekdays', '1', 'yes'),
(311, 'dbem_display_calendar_order', 'ASC', 'yes'),
(312, 'dbem_display_calendar_orderby', 'event_name,event_start_time', 'yes'),
(313, 'dbem_display_calendar_events_limit', '', 'yes'),
(314, 'dbem_display_calendar_events_limit_msg', 'mehr...', 'yes'),
(315, 'dbem_calendar_direct_links', '1', 'yes'),
(316, 'dbem_require_location', '0', 'yes'),
(317, 'dbem_locations_enabled', '1', 'yes'),
(318, 'dbem_use_select_for_locations', '0', 'yes'),
(319, 'dbem_attributes_enabled', '1', 'yes'),
(320, 'dbem_recurrence_enabled', '1', 'yes'),
(321, 'dbem_rsvp_enabled', '1', 'yes'),
(322, 'dbem_categories_enabled', '1', 'yes'),
(323, 'dbem_tags_enabled', '1', 'yes'),
(324, 'dbem_placeholders_custom', '', 'yes'),
(325, 'dbem_location_attributes_enabled', '1', 'yes'),
(326, 'dbem_location_placeholders_custom', '', 'yes'),
(327, 'dbem_bookings_registration_disable', '0', 'yes'),
(328, 'dbem_bookings_registration_disable_user_emails', '0', 'yes'),
(329, 'dbem_bookings_registration_user', '', 'yes'),
(330, 'dbem_bookings_approval', '0', 'yes'),
(331, 'dbem_bookings_approval_reserved', '0', 'yes'),
(332, 'dbem_bookings_approval_overbooking', '0', 'yes'),
(333, 'dbem_bookings_double', '0', 'yes'),
(334, 'dbem_bookings_user_cancellation', '1', 'yes'),
(335, 'dbem_bookings_currency', 'USD', 'yes'),
(336, 'dbem_bookings_currency_decimal_point', '.', 'yes'),
(337, 'dbem_bookings_currency_thousands_sep', ',', 'yes'),
(338, 'dbem_bookings_currency_format', '@#', 'yes'),
(339, 'dbem_bookings_tax', '0', 'yes'),
(340, 'dbem_bookings_tax_auto_add', '0', 'yes'),
(341, 'dbem_bookings_submit_button', 'Send your booking', 'yes'),
(342, 'dbem_bookings_login_form', '0', 'yes'),
(343, 'dbem_bookings_anonymous', '1', 'yes'),
(344, 'dbem_bookings_form_max', '20', 'yes'),
(345, 'dbem_bookings_form_msg_disabled', 'Online bookings are not available for this event.', 'yes'),
(346, 'dbem_bookings_form_msg_closed', 'Bookings are closed for this event.', 'yes'),
(347, 'dbem_bookings_form_msg_full', 'This event is fully booked.', 'yes'),
(348, 'dbem_bookings_form_msg_attending', 'You are currently attending this event.', 'yes'),
(349, 'dbem_bookings_form_msg_bookings_link', 'Manage my bookings', 'yes'),
(350, 'dbem_booking_warning_cancel', 'Are you sure you want to cancel your booking?', 'yes'),
(351, 'dbem_booking_feedback_cancelled', 'Booking Cancelled', 'yes'),
(352, 'dbem_booking_feedback_pending', 'Booking successful, pending confirmation (you will also receive an email once confirmed).', 'yes'),
(353, 'dbem_booking_feedback', 'Booking successful.', 'yes'),
(354, 'dbem_booking_feedback_full', 'Booking cannot be made, not enough spaces available!', 'yes'),
(355, 'dbem_booking_feedback_log_in', 'You must log in or register to make a booking.', 'yes'),
(356, 'dbem_booking_feedback_nomail', 'However, there were some problems whilst sending confirmation emails to you and/or the event contact person. You may want to contact them directly and letting them know of this error.', 'yes'),
(357, 'dbem_booking_feedback_error', 'Booking could not be created:', 'yes'),
(358, 'dbem_booking_feedback_email_exists', 'This email already exists in our system, please log in to register to proceed with your booking.', 'yes'),
(359, 'dbem_booking_feedback_new_user', 'A new user account has been created for you. Please check your email for access details.', 'yes'),
(360, 'dbem_booking_feedback_reg_error', 'There was a problem creating a user account, please contact a website administrator.', 'yes'),
(361, 'dbem_booking_feedback_already_booked', 'You already have booked a seat at this event.', 'yes'),
(362, 'dbem_booking_feedback_min_space', 'You must request at least one space to book an event.', 'yes'),
(363, 'dbem_booking_feedback_spaces_limit', 'You cannot book more than %d spaces for this event.', 'yes'),
(364, 'dbem_booking_button_msg_book', 'Book Now', 'yes'),
(365, 'dbem_booking_button_msg_booking', 'Booking...', 'yes'),
(366, 'dbem_booking_button_msg_booked', 'Booking Submitted', 'yes'),
(367, 'dbem_booking_button_msg_already_booked', 'Already Booked', 'yes'),
(368, 'dbem_booking_button_msg_error', 'Booking Error. Try again?', 'yes'),
(369, 'dbem_booking_button_msg_full', 'Sold Out', 'yes'),
(370, 'dbem_booking_button_msg_cancel', 'Cancel', 'yes'),
(371, 'dbem_booking_button_msg_canceling', 'Canceling...', 'yes'),
(372, 'dbem_booking_button_msg_cancelled', 'Cancelled', 'yes'),
(373, 'dbem_booking_button_msg_cancel_error', 'Cancellation Error. Try again?', 'yes'),
(374, 'dbem_bookings_notify_admin', '0', 'yes'),
(375, 'dbem_bookings_contact_email', '1', 'yes'),
(376, 'dbem_bookings_contact_email_pending_subject', 'Booking Pending', 'yes'),
(377, 'dbem_bookings_contact_email_pending_body', 'The following booking is pending :\r\n\r\n#_EVENTNAME - #_EVENTDATES @ #_EVENTTIMES\r\n\r\nNow there are #_BOOKEDSPACES spaces reserved, #_AVAILABLESPACES are still available.\r\n\r\nBOOKING DETAILS\r\n\r\nName : #_BOOKINGNAME\r\nEmail : #_BOOKINGEMAIL\r\n\r\n#_BOOKINGSUMMARY\r\n\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(378, 'dbem_bookings_contact_email_confirmed_subject', 'Booking Confirmed', 'yes'),
(379, 'dbem_bookings_contact_email_confirmed_body', 'The following booking is confirmed :\r\n\r\n#_EVENTNAME - #_EVENTDATES @ #_EVENTTIMES\r\n\r\nNow there are #_BOOKEDSPACES spaces reserved, #_AVAILABLESPACES are still available.\r\n\r\nBOOKING DETAILS\r\n\r\nName : #_BOOKINGNAME\r\nEmail : #_BOOKINGEMAIL\r\n\r\n#_BOOKINGSUMMARY\r\n\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(380, 'dbem_bookings_contact_email_rejected_subject', 'Booking Rejected', 'yes'),
(381, 'dbem_bookings_contact_email_rejected_body', 'The following booking is rejected :\r\n\r\n#_EVENTNAME - #_EVENTDATES @ #_EVENTTIMES\r\n\r\nNow there are #_BOOKEDSPACES spaces reserved, #_AVAILABLESPACES are still available.\r\n\r\nBOOKING DETAILS\r\n\r\nName : #_BOOKINGNAME\r\nEmail : #_BOOKINGEMAIL\r\n\r\n#_BOOKINGSUMMARY\r\n\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(382, 'dbem_bookings_contact_email_cancelled_subject', 'Booking Cancelled', 'yes'),
(383, 'dbem_bookings_contact_email_cancelled_body', 'The following booking is cancelled :\r\n\r\n#_EVENTNAME - #_EVENTDATES @ #_EVENTTIMES\r\n\r\nNow there are #_BOOKEDSPACES spaces reserved, #_AVAILABLESPACES are still available.\r\n\r\nBOOKING DETAILS\r\n\r\nName : #_BOOKINGNAME\r\nEmail : #_BOOKINGEMAIL\r\n\r\n#_BOOKINGSUMMARY\r\n\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(384, 'dbem_bookings_email_pending_subject', 'Booking Pending', 'yes'),
(385, 'dbem_bookings_email_pending_body', 'Dear #_BOOKINGNAME, \r\n\r\nYou have requested #_BOOKINGSPACES space/spaces for #_EVENTNAME.\r\n\r\nWhen : #_EVENTDATES @ #_EVENTTIMES\r\n\r\nWhere : #_LOCATIONNAME - #_LOCATIONFULLLINE\r\n\r\nYour booking is currently pending approval by our administrators. Once approved you will receive an automatic confirmation.\r\n\r\nYours faithfully,\r\n\r\n#_CONTACTNAME\r\n\r\n\r\n-------------------------------\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(386, 'dbem_bookings_email_rejected_subject', 'Booking Rejected', 'yes'),
(387, 'dbem_bookings_email_rejected_body', 'Dear #_BOOKINGNAME, \r\n\r\nYour requested booking for #_BOOKINGSPACES spaces at #_EVENTNAME on #_EVENTDATES has been rejected.\r\n\r\nYours faithfully,\r\n\r\n#_CONTACTNAME\r\n\r\n\r\n-------------------------------\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(388, 'dbem_bookings_email_confirmed_subject', 'Booking Confirmed', 'yes'),
(389, 'dbem_bookings_email_confirmed_body', 'Dear #_BOOKINGNAME, \r\n\r\nYou have successfully reserved #_BOOKINGSPACES space/spaces for #_EVENTNAME.\r\n\r\nWhen : #_EVENTDATES @ #_EVENTTIMES\r\n\r\nWhere : #_LOCATIONNAME - #_LOCATIONFULLLINE\r\n\r\nYours faithfully,\r\n\r\n#_CONTACTNAME\r\n\r\n\r\n-------------------------------\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(390, 'dbem_bookings_email_cancelled_subject', 'Booking Cancelled', 'yes'),
(391, 'dbem_bookings_email_cancelled_body', 'Dear #_BOOKINGNAME, \r\n\r\nYour requested booking for #_BOOKINGSPACES spaces at #_EVENTNAME on #_EVENTDATES has been cancelled.\r\n\r\nYours faithfully,\r\n\r\n#_CONTACTNAME\r\n\r\n\r\n-------------------------------\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(392, 'dbem_bookings_email_registration_subject', '[Magento Stammtisch] Your username and password', 'yes'),
(393, 'dbem_bookings_email_registration_body', 'You have successfully created an account at Magento Stammtisch\r\n\r\nYou can log into our site here : http://stammtisch.localhost/wp-login.php\r\n\r\nUsername : %username%\r\n\r\nPassword : %password%\r\n\r\nTo view your bookings, please visit http://stammtisch.localhost/events/my-bookings/ after logging in.', 'yes'),
(394, 'dbem_bookings_tickets_orderby', 'ticket_price DESC, ticket_name ASC', 'yes'),
(395, 'dbem_bookings_tickets_priority', '0', 'yes'),
(396, 'dbem_bookings_tickets_show_unavailable', '0', 'yes'),
(397, 'dbem_bookings_tickets_show_loggedout', '1', 'yes'),
(398, 'dbem_bookings_tickets_single', '0', 'yes'),
(399, 'dbem_bookings_tickets_single_form', '0', 'yes'),
(400, 'dbem_bookings_my_title_format', 'My Bookings', 'yes'),
(401, 'dbem_bp_events_list_format_header', '<ul class="em-events-list">', 'yes'),
(402, 'dbem_bp_events_list_format', '<li>#_EVENTLINK - #_EVENTDATES - #_EVENTTIMES<ul><li>#_LOCATIONLINK - #_LOCATIONADDRESS, #_LOCATIONTOWN</li></ul></li>', 'yes'),
(403, 'dbem_bp_events_list_format_footer', '</ul>', 'yes'),
(404, 'dbem_bp_events_list_none_format', '<p class="em-events-list">No Events</p>', 'yes'),
(405, 'dbem_css_editors', '1', 'yes'),
(406, 'dbem_css_rsvp', '1', 'yes'),
(407, 'dbem_css_rsvpadmin', '1', 'yes'),
(408, 'dbem_css_evlist', '1', 'yes'),
(409, 'dbem_css_search', '1', 'yes'),
(410, 'dbem_css_loclist', '1', 'yes'),
(411, 'dbem_css_catlist', '1', 'yes'),
(412, 'dbem_css_taglist', '1', 'yes'),
(413, 'dbem_cp_events_slug', 'events', 'yes'),
(414, 'dbem_cp_locations_slug', 'locations', 'yes'),
(415, 'dbem_taxonomy_category_slug', 'events/categories', 'yes'),
(416, 'dbem_taxonomy_tag_slug', 'events/tags', 'yes'),
(417, 'dbem_cp_events_template', '', 'yes'),
(418, 'dbem_cp_events_body_class', '', 'yes'),
(419, 'dbem_cp_events_post_class', '', 'yes'),
(420, 'dbem_cp_events_formats', '1', 'yes'),
(421, 'dbem_cp_events_has_archive', '1', 'yes'),
(422, 'dbem_events_default_archive_orderby', '_start_ts', 'yes'),
(423, 'dbem_events_default_archive_order', 'ASC', 'yes'),
(424, 'dbem_events_archive_scope', 'past', 'yes'),
(425, 'dbem_cp_events_archive_formats', '1', 'yes'),
(426, 'dbem_cp_events_excerpt_formats', '1', 'yes'),
(427, 'dbem_cp_events_search_results', '0', 'yes'),
(428, 'dbem_cp_events_custom_fields', '0', 'yes'),
(429, 'dbem_cp_events_comments', '1', 'yes'),
(430, 'dbem_cp_locations_template', '', 'yes'),
(431, 'dbem_cp_locations_body_class', '', 'yes'),
(432, 'dbem_cp_locations_post_class', '', 'yes'),
(433, 'dbem_cp_locations_formats', '1', 'yes'),
(434, 'dbem_cp_locations_has_archive', '1', 'yes'),
(435, 'dbem_locations_default_archive_orderby', 'title', 'yes'),
(436, 'dbem_locations_default_archive_order', 'ASC', 'yes'),
(437, 'dbem_cp_locations_archive_formats', '1', 'yes'),
(438, 'dbem_cp_locations_excerpt_formats', '1', 'yes'),
(439, 'dbem_cp_locations_search_results', '0', 'yes'),
(440, 'dbem_cp_locations_custom_fields', '0', 'yes'),
(441, 'dbem_cp_locations_comments', '1', 'yes'),
(442, 'dbem_cp_categories_formats', '1', 'yes'),
(443, 'dbem_categories_default_archive_orderby', '_start_ts', 'yes'),
(444, 'dbem_categories_default_archive_order', 'ASC', 'yes'),
(445, 'dbem_cp_tags_formats', '1', 'yes'),
(446, 'dbem_tags_default_archive_orderby', '_start_ts', 'yes'),
(447, 'dbem_tags_default_archive_order', 'ASC', 'yes'),
(448, 'dbem_disable_thumbnails', '0', 'yes'),
(449, 'dbem_feedback_reminder', '1431164691', 'yes'),
(450, 'dbem_credits', '0', 'yes'),
(451, 'dbem_version', '5.61', 'yes'),
(456, 'theme_mods_twentyfifteen', 'a:2:{s:18:"nav_menu_locations";a:1:{s:7:"primary";i:2;}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1431185785;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(457, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(461, 'em_last_modified', '1445686940', 'yes'),
(467, 'WPLANG', 'de_DE', 'yes'),
(472, 'dbem_thumbnails_enabled', '0', 'yes'),
(473, 'dbem_js_limit', '0', 'yes'),
(474, 'dbem_js_limit_general', '0', 'yes'),
(475, 'dbem_js_limit_search', '', 'yes'),
(476, 'dbem_js_limit_events_form', '', 'yes'),
(477, 'dbem_js_limit_edit_bookings', '', 'yes'),
(478, 'dbem_css_limit', '0', 'yes'),
(479, 'dbem_css_limit_include', '0', 'yes'),
(480, 'dbem_css_limit_exclude', '0', 'yes'),
(481, 'dbem_pro_dev_updates', '0', 'yes'),
(482, 'dbem_disable_title_rewrites', '0', 'yes'),
(483, 'dbem_title_html', '', 'yes'),
(484, 'dbem_events_current_are_past', '0', 'yes'),
(485, 'dbem_bookings_default_orderby', 'event_name', 'yes'),
(486, 'dbem_bookings_default_order', 'ASC', 'yes'),
(487, 'dbem_edit_events_page', '', 'yes'),
(488, 'dbem_edit_locations_page', '', 'yes'),
(489, 'dbem_edit_bookings_page', '', 'yes'),
(490, 'dbem_time_24h', '1', 'yes'),
(491, 'dbem_display_calendar_day_single', '0', 'yes'),
(492, 'dbem_bookings_tickets_show_member_tickets', '0', 'yes'),
(493, 'dbem_mail_sender_address', '', 'yes'),
(494, 'dbem_smtp_username', 'admin', 'yes'),
(495, 'dbem_smtp_password', 'admin', 'yes'),
(509, 'bp-deactivated-components', 'a:0:{}', 'yes'),
(510, 'bb-config-location', '/home/daim2k5/www/stammtisch/bb-config.php', 'yes'),
(511, 'bp-xprofile-base-group-name', 'Base', 'yes'),
(512, 'bp-xprofile-fullname-field-name', 'Name', 'yes'),
(513, 'bp-blogs-first-install', '', 'yes'),
(514, 'bp-disable-profile-sync', '', 'yes'),
(515, 'hide-loggedout-adminbar', '', 'yes'),
(516, 'bp-disable-avatar-uploads', '', 'yes'),
(517, 'bp-disable-account-deletion', '', 'yes'),
(518, 'bp-disable-blogforum-comments', '1', 'yes'),
(519, '_bp_theme_package_id', 'legacy', 'yes'),
(520, 'bp_restrict_group_creation', '', 'yes'),
(521, '_bp_enable_akismet', '1', 'yes'),
(522, '_bp_enable_heartbeat_refresh', '1', 'yes'),
(523, '_bp_force_buddybar', '', 'yes'),
(524, '_bp_retain_bp_default', '', 'yes'),
(525, 'widget_bp_core_login_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(526, 'widget_bp_core_members_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(527, 'widget_bp_core_whos_online_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(528, 'widget_bp_core_recently_active_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(529, 'widget_bp_groups_widget', '', 'yes'),
(530, 'widget_bp_messages_sitewide_notices_widget', '', 'yes'),
(535, 'registration', '0', 'yes'),
(536, 'bp-active-components', 'a:5:{s:8:"activity";i:1;s:7:"members";i:1;s:8:"settings";i:1;s:8:"xprofile";i:1;s:13:"notifications";i:1;}', 'yes'),
(537, 'bp-pages', 'a:2:{s:8:"activity";i:15;s:7:"members";i:16;}', 'yes'),
(538, '_bp_db_version', '10071', 'yes'),
(541, 'user_role_editor', 'a:4:{s:11:"ure_version";s:6:"4.18.4";s:17:"ure_caps_readable";i:0;s:24:"ure_show_deprecated_caps";i:0;s:19:"ure_hide_pro_banner";i:0;}', 'yes'),
(542, 'wp_backup_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:92:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:14:"publish_events";b:1;s:20:"delete_others_events";b:1;s:18:"edit_others_events";b:1;s:22:"manage_others_bookings";b:1;s:24:"publish_recurring_events";b:1;s:30:"delete_others_recurring_events";b:1;s:28:"edit_others_recurring_events";b:1;s:17:"publish_locations";b:1;s:23:"delete_others_locations";b:1;s:16:"delete_locations";b:1;s:21:"edit_others_locations";b:1;s:23:"delete_event_categories";b:1;s:21:"edit_event_categories";b:1;s:15:"manage_bookings";b:1;s:19:"upload_event_images";b:1;s:13:"delete_events";b:1;s:11:"edit_events";b:1;s:19:"read_private_events";b:1;s:23:"delete_recurring_events";b:1;s:21:"edit_recurring_events";b:1;s:14:"edit_locations";b:1;s:22:"read_private_locations";b:1;s:21:"read_others_locations";b:1;s:14:"ure_edit_roles";b:1;s:16:"ure_create_roles";b:1;s:16:"ure_delete_roles";b:1;s:23:"ure_create_capabilities";b:1;s:23:"ure_delete_capabilities";b:1;s:18:"ure_manage_options";b:1;s:15:"ure_reset_roles";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:57:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:14:"publish_events";b:1;s:20:"delete_others_events";b:1;s:18:"edit_others_events";b:1;s:22:"manage_others_bookings";b:1;s:24:"publish_recurring_events";b:1;s:30:"delete_others_recurring_events";b:1;s:28:"edit_others_recurring_events";b:1;s:17:"publish_locations";b:1;s:23:"delete_others_locations";b:1;s:16:"delete_locations";b:1;s:21:"edit_others_locations";b:1;s:23:"delete_event_categories";b:1;s:21:"edit_event_categories";b:1;s:15:"manage_bookings";b:1;s:19:"upload_event_images";b:1;s:13:"delete_events";b:1;s:11:"edit_events";b:1;s:19:"read_private_events";b:1;s:23:"delete_recurring_events";b:1;s:21:"edit_recurring_events";b:1;s:14:"edit_locations";b:1;s:22:"read_private_locations";b:1;s:21:"read_others_locations";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:20:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;s:15:"manage_bookings";b:1;s:19:"upload_event_images";b:1;s:13:"delete_events";b:1;s:11:"edit_events";b:1;s:19:"read_private_events";b:1;s:23:"delete_recurring_events";b:1;s:21:"edit_recurring_events";b:1;s:14:"edit_locations";b:1;s:22:"read_private_locations";b:1;s:21:"read_others_locations";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:15:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:15:"manage_bookings";b:1;s:19:"upload_event_images";b:1;s:13:"delete_events";b:1;s:11:"edit_events";b:1;s:19:"read_private_events";b:1;s:23:"delete_recurring_events";b:1;s:21:"edit_recurring_events";b:1;s:14:"edit_locations";b:1;s:22:"read_private_locations";b:1;s:21:"read_others_locations";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:12:{s:4:"read";b:1;s:7:"level_0";b:1;s:15:"manage_bookings";b:1;s:19:"upload_event_images";b:1;s:13:"delete_events";b:1;s:11:"edit_events";b:1;s:19:"read_private_events";b:1;s:23:"delete_recurring_events";b:1;s:21:"edit_recurring_events";b:1;s:14:"edit_locations";b:1;s:22:"read_private_locations";b:1;s:21:"read_others_locations";b:1;}}}', 'no'),
(545, 'auth_key', '^x(A9w7|FDo>6(kj1z]GM/zoks5`kE3_`{<p!3u/MK8?_D+uTm{;X**3{FWC6Q!6', 'yes'),
(546, 'auth_salt', ')o`P1Vw+V6b%(F]AN/ {mCxQV^v ,/;Cf-MdDtLz,E YvNc!eE%4~QX0RB;iWeJp', 'yes'),
(547, 'logged_in_key', 'ZEx`9hi-OE%~fKqC0?Uv,]prd -f~H.*hD#<MX5,J/3w^XQIen5H&,Iwkh:EJOyv', 'yes'),
(548, 'logged_in_salt', '=6/wVJiPHX9ZJtn2;M*J]d=&SXuC9:= jS5Rar `#RS[EhB2J)skuhLAFLc&vCXw', 'yes'),
(549, 'nonce_key', '%YL>*E%_P7hIB>5OZRp-p?UGl}{=*e9O*$a,qT48sNgHak9Uo26!N& [e<Xf Kd?', 'yes'),
(550, 'nonce_salt', 'U$`l.4Fp>,=z/`C?f?(>UH0K=<|tK74+0SkxwzGuI}RD?;B@TJb&WM*<.>od[V3f', 'yes'),
(551, 'nxs_log_db_table_version', '1.1', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(553, 'NS_SNAutoPoster', 'a:76:{s:3:"ver";i:306;s:4:"isMA";b:0;s:4:"isMU";b:0;s:5:"isMUx";b:0;s:10:"useSSLCert";s:18:"http://www.fbi.gov";s:10:"skipSSLSec";b:0;s:2:"ap";a:0:{}s:2:"bg";a:0:{}s:2:"da";a:0:{}s:2:"di";a:0:{}s:2:"dl";a:0:{}s:2:"fb";a:0:{}s:2:"fl";a:0:{}s:2:"ip";a:0:{}s:2:"kt";a:0:{}s:2:"li";a:0:{}s:2:"lj";a:0:{}s:2:"pk";a:0:{}s:2:"sc";a:0:{}s:2:"st";a:0:{}s:2:"su";a:0:{}s:2:"tr";a:0:{}s:2:"tw";a:1:{i:0;a:33:{s:4:"doTW";s:1:"0";s:5:"nName";s:14:"MagentoHamburg";s:5:"twURL";s:35:"https://twitter.com/MagentoHamburg/";s:9:"twConsKey";s:25:"Xx1Hpt7czTS21KxFiNv8KnRGN";s:9:"twConsSec";s:50:"XZ6rDVuaT4GT1JEfSEgwHC0bxvpRelsg1p1kTBE2TfZxmrOP8Q";s:10:"twAccToken";s:50:"191758166-F3v98X9BfyX8PXB9O5swZnfrhBRzVauNo7NeyHIr";s:6:"catSel";s:1:"0";s:8:"catSelEd";s:0:"";s:10:"riComments";i:0;s:11:"riCommentsM";i:0;s:12:"riCommentsAA";i:0;s:8:"rpstDays";s:1:"0";s:7:"rpstHrs";s:1:"0";s:8:"rpstMins";s:1:"0";s:6:"rpstOn";i:0;s:8:"rpstStop";s:1:"O";s:11:"rpstOnlyPUP";i:0;s:7:"fltrsOn";i:0;s:11:"rpstBtwDays";a:0:{}s:13:"twAccTokenSec";s:45:"VoZdPwPy2RjPE7tLGK7DE9Nvmq00bKoln0ccK5Igai3qO";s:11:"twMsgFormat";s:15:"%TITLE% - %URL%";s:8:"attchImg";i:0;s:11:"rpstRndMins";i:0;s:12:"rpstPostIncl";s:1:"0";s:8:"rpstType";s:1:"2";s:12:"rpstTimeType";s:1:"A";s:12:"rpstFromTime";s:0:"";s:10:"rpstToTime";s:0:"";s:10:"rpstOLDays";s:2:"30";s:10:"rpstNWDays";s:3:"365";s:10:"nxsCPTSeld";s:21:"a:1:{i:0;s:4:"post";}";s:7:"tagsSel";s:0:"";s:8:"tagsSelX";s:0:"";}}s:2:"vb";a:0:{}s:2:"vk";a:0:{}s:2:"wp";a:0:{}s:2:"xi";a:0:{}s:7:"nxsHTDP";s:1:"S";s:8:"ogImgDef";s:0:"";s:10:"featImgLoc";s:0:"";s:13:"anounTagLimit";s:3:"300";s:10:"nxsHTSpace";s:0:"";s:16:"featImgLocPrefix";s:0:"";s:17:"featImgLocArrPath";s:0:"";s:16:"featImgLocRemTxt";s:0:"";s:8:"extDebug";s:1:"0";s:10:"numLogRows";s:3:"250";s:15:"errNotifEmailCB";i:0;s:13:"errNotifEmail";s:0:"";s:15:"forceBrokenCron";i:0;s:12:"nxsURLShrtnr";s:1:"O";s:10:"bitlyUname";s:0:"";s:11:"bitlyAPIKey";s:0:"";s:10:"adflyUname";s:0:"";s:11:"adflyAPIKey";s:0:"";s:11:"adflyDomain";s:6:"adf.ly";s:9:"YOURLSKey";s:0:"";s:9:"YOURLSURL";s:0:"";s:9:"xcoAPIKey";s:0:"";s:11:"clkimAPIKey";s:0:"";s:10:"postAPIKey";s:0:"";s:9:"gglAPIKey";s:0:"";s:9:"forceSURL";i:0;s:16:"brokenCntFilters";i:0;s:11:"nsOpenGraph";i:0;s:10:"imgNoCheck";i:0;s:11:"useForPages";i:0;s:10:"showPrxTab";i:0;s:11:"useRndProxy";i:0;s:12:"addURLParams";s:0:"";s:8:"riActive";i:0;s:21:"riHowManyPostsToTrack";s:2:"10";s:9:"useUnProc";i:0;s:10:"nxsCPTSeld";s:53:"a:3:{i:0;s:1:"0";i:1;s:8:"location";i:2;s:5:"event";}";s:8:"exclCats";s:6:"a:0:{}";s:16:"whoCanSeeSNAPBox";a:1:{i:0;s:13:"administrator";}s:15:"whoCanMakePosts";a:1:{i:0;s:13:"administrator";}s:12:"skipSecurity";i:0;s:7:"quLimit";i:0;s:12:"nxsOverLimit";s:1:"D";s:14:"quLimitRndMins";s:1:"2";s:6:"quDays";s:1:"0";s:5:"quHrs";s:1:"0";s:6:"quMins";s:1:"3";s:8:"quNxTime";i:1431182341;s:10:"rpstActive";i:0;}', 'yes'),
(555, 'NXS_cronCheck', 'a:3:{s:18:"cronCheckStartTime";i:1431175851;s:10:"cronChecks";a:10:{i:0;s:100:"[2015-05-09 14:50:50] - WP Cron called from 127.0.0.1 (WordPress/4.2.2; http://stammtisch.localhost)";i:1;s:100:"[2015-05-09 14:52:58] - WP Cron called from 127.0.0.1 (WordPress/4.2.2; http://stammtisch.localhost)";i:2;s:100:"[2015-05-09 14:53:51] - WP Cron called from 127.0.0.1 (WordPress/4.2.2; http://stammtisch.localhost)";i:3;s:100:"[2015-05-09 14:55:52] - WP Cron called from 127.0.0.1 (WordPress/4.2.2; http://stammtisch.localhost)";i:4;s:100:"[2015-05-09 14:56:50] - WP Cron called from 127.0.0.1 (WordPress/4.2.2; http://stammtisch.localhost)";i:5;s:100:"[2015-05-09 14:58:22] - WP Cron called from 127.0.0.1 (WordPress/4.2.2; http://stammtisch.localhost)";i:6;s:100:"[2015-05-09 14:59:51] - WP Cron called from 127.0.0.1 (WordPress/4.2.2; http://stammtisch.localhost)";i:7;s:100:"[2015-05-09 15:01:45] - WP Cron called from 127.0.0.1 (WordPress/4.2.2; http://stammtisch.localhost)";i:8;s:100:"[2015-05-09 15:02:56] - WP Cron called from 127.0.0.1 (WordPress/4.2.2; http://stammtisch.localhost)";i:9;s:100:"[2015-05-09 15:04:29] - WP Cron called from 127.0.0.1 (WordPress/4.2.2; http://stammtisch.localhost)";}s:6:"status";i:1;}', 'yes'),
(566, 'NS_SNriPosts', 'a:2:{i:0;i:26;i:1;i:18;}', 'yes'),
(600, 'NSX_LastTChecked', '1431179196', 'yes'),
(626, 'event-categories_children', 'a:0:{}', 'yes'),
(688, 'current_theme', 'firegento_stammtisch', 'yes'),
(689, 'theme_mods_firegento_stammtisch', 'a:4:{i:0;b:0;s:12:"header_image";s:84:"http://beta.magento-stammtisch.de/wp-content/uploads/2015/05/magento-stammtisch1.png";s:17:"header_image_data";O:8:"stdClass":5:{s:13:"attachment_id";i:38;s:3:"url";s:84:"http://beta.magento-stammtisch.de/wp-content/uploads/2015/05/magento-stammtisch1.png";s:13:"thumbnail_url";s:84:"http://beta.magento-stammtisch.de/wp-content/uploads/2015/05/magento-stammtisch1.png";s:6:"height";i:120;s:5:"width";i:338;}s:18:"nav_menu_locations";a:1:{s:6:"header";i:2;}}', 'yes'),
(690, 'theme_switched', '', 'yes'),
(694, '_transient_twentyfifteen_categories', '1', 'yes'),
(737, 'widget_em_locations_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(738, 'widget_em_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(739, 'widget_nav_menu', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(740, 'widget_calendar', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(742, 'widget_tag_cloud', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(743, 'widget_pages', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(745, 'widget_em_calendar', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(825, '_site_transient_timeout_theme_roots', '1445683661', 'yes'),
(826, '_site_transient_theme_roots', 'a:4:{s:20:"firegento_stammtisch";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";}', 'yes'),
(837, 'finished_splitting_shared_terms', '1', 'yes'),
(838, 'db_upgraded', '', 'yes'),
(840, 'dbem_small_calendar_long_events', '0', 'yes'),
(844, '_site_transient_timeout_browser_77b45dcaefecbab45f8c1f7956a11f60', '1446286907', 'yes'),
(845, '_site_transient_browser_77b45dcaefecbab45f8c1f7956a11f60', 'a:9:{s:8:"platform";s:5:"Linux";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"41.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(848, 'can_compress_scripts', '0', 'yes'),
(849, '_transient_timeout_feed_e5132d2944a7be60661ee809629a6d9c', '1445725311', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(850, '_transient_feed_e5132d2944a7be60661ee809629a6d9c', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:49:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"Releases – Deutsch";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:24:"https://de.wordpress.org";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:21:"WordPress auf Deutsch";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 23 Oct 2015 09:23:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"de-DE";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:34:"https://wordpress.org/?v=4.4-beta1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:27:"WordPress 4.4 Beta 1 ist da";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://de.wordpress.org/2015/10/23/wordpress-4-4-beta-1-ist-da/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:72:"https://de.wordpress.org/2015/10/23/wordpress-4-4-beta-1-ist-da/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 23 Oct 2015 09:23:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Entwicklung";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://de.wordpress.org/?p=1341";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:417:"Die erste Beta-Version des 4.4-Release von WordPress ist verfügbar. Die neue Version bringt unter anderem das nächste Standard-Theme sowie die Unterstützung für Responsive Images mit. Die neue Version wird mit Twenty Sixteen ein neues Standard-Theme mitbringen. Ihr könnt es bereits im Directory herunterladen, es funktioniert aber nur mit 4.4-Entwicklerversionen – nicht mit WordPress 4.3. Ebenfalls [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Florian Brinkmann";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3742:"<p>Die erste Beta-Version des 4.4-Release von WordPress ist verfügbar. Die neue Version bringt unter anderem das nächste Standard-Theme sowie die Unterstützung für Responsive Images mit.</p>\n<p><span id="more-1341"></span></p>\n<p>Die neue Version wird mit Twenty Sixteen ein neues Standard-Theme mitbringen. Ihr könnt es bereits <a href="https://de.wordpress.org/themes/twentysixteen">im Directory</a> herunterladen, es funktioniert aber nur mit 4.4-Entwicklerversionen – nicht mit WordPress 4.3. Ebenfalls mit dem neuen Release kommt die Unterstützung für Responsive Images. Damit wird dem Nutzer immer das optimale Bild für sein Nutzungsumfeld ausgegeben.</p>\n<p>Zudem ist WordPress in der neuen Version selbst ein oEmbed-Provider. Ihr könnt durch diese Funktion andere Seiten oder Beiträge einfach durch Einfügen eines Links in eure Seite einbetten. Angezeigt wird dabei der Titel, gegebenenfalls das Beitragsbild, der Teaser und die Anzahl der Kommentare. Diese Funktion lässt sich <a href="https://github.com/swissspidy/disable-embeds">auch deaktivieren</a>.</p>\n<p>Diese Funktionen könnt ihr problemlos testen, indem ihr euch die Beta-Version installiert (mit dem <a href="https://wordpress.org/plugins/wordpress-beta-tester/">Beta-Tester-Plugin</a> oder per <a href="https://wordpress.org/wordpress-4.4-beta1.zip">ZIP</a>).</p>\n<p>Auch für Entwickler gibt es einige Neuerungen:</p>\n<ul>\n<li>Die grundlegende Infrastruktur des REST-API-Plugins wurde <a href="https://make.wordpress.org/core/2015/09/21/wp-rest-api-merge-proposal/">in WordPress 4.4 integriert</a> (erste Phase der Integration des kompletten Plugins). So können Plugin-Autoren damit eigene Endpunkte entwickeln.</li>\n<li>Metadaten für Taxonomie-Terme sind <a href="https://make.wordpress.org/core/2015/09/04/taxonomy-term-metadata-proposal/">nun Teil</a> von WordPress. Wenn ihr bereits ein Plugin nutzt, das dies ermöglicht, solltet ihr euch <a href="https://make.wordpress.org/core/2015/09/22/preparing-your-plugins-and-your-client-sites-for-termmeta/">diesen Beitrag</a> durchlesen. Daneben wurde durch die dahinterstehende <code>WP_Term</code>-Klasse das Caching bei der Arbeit mit Termen verbessert (<a href="https://core.trac.wordpress.org/ticket/14162">#14162</a>).</li>\n<li>Die Ausgabe des <code>title</code>-Elements wurde verbessert. <code>wp_title()</code> ist nun veraltet. WordPress kann <a href="https://make.wordpress.org/core/2015/10/20/document-title-in-4-4/">den Titel automatisch ausgeben</a>.</li>\n<li>Kommentar-Abfragen sind nun wegen der besseren Performance aufgeteilt. Zudem verbessert die WP_Comment-Klasse das Caching und führt starke Typisierung ein (<a href="https://core.trac.wordpress.org/ticket/8071">#8071</a>, <a href="https://core.trac.wordpress.org/ticket/32619">#32619</a>).</li>\n</ul>\n<p>Wenn ihr genauere Infos möchtet, was es Neues gibt, schaut euch die Beiträge dazu <a href="https://make.wordpress.org/core/tag/4-4/">auf dem Entwicklungs-Blog</a> an. <a href="https://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=4.4">Im Trac</a> findet ihr dann eine noch detailliertere Liste mit Änderungen.</p>\n<p><strong>Testet die Version, um den Entwicklern dabei zu helfen, den Release gut über die Bühne zu bringen</strong>. Wenn ihr einen Bug gefunden habt, könnt ihr das in dem <a href="https://wordpress.org/support/forum/alphabeta">Alpha/Beta-Bereich des Support-Forums</a> melden. Wenn ihr euch mit dem Melden von Bugs im Trac auskennt, könnt ihr natürlich auch <a href="https://make.wordpress.org/core/reports/">direkt dort ein Ticket erstellen</a>. Da findet ihr auch eine <a href="https://core.trac.wordpress.org/tickets/major">Liste der bereits bekannten Bugs</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:69:"https://de.wordpress.org/2015/10/23/wordpress-4-4-beta-1-ist-da/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:65:"WordPress 4.3.1 Sicherheits- und Wartungs-Release veröffentlicht";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:101:"https://de.wordpress.org/2015/09/15/wordpress-4-3-1-sicherheits-und-wartungs-release-veroeffentlicht/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:110:"https://de.wordpress.org/2015/09/15/wordpress-4-3-1-sicherheits-und-wartungs-release-veroeffentlicht/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 15 Sep 2015 16:08:29 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:10:"Sicherheit";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://de.wordpress.org/?p=1299";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:403:"Seit Kurzem ist WordPress 4.3.1 verfügbar. Dabei handelt es sich um einen Sicherheits-Release und ein Update auf die neue Version sollte dringend vorgenommen werden. Die neue Version schließt drei Sicherheitslücken. So sind WordPress 4.3 und frühere Versionen anfällig durch eine XSS-Lücke bei der Verarbeitung von Shortcode-Tags. Gemeldet wurde diese Lücke durch Shahar Tal und Netanel [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Florian Brinkmann";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4282:"<p>Seit Kurzem ist WordPress 4.3.1 verfügbar. Dabei handelt es sich um einen Sicherheits-Release und ein Update auf die neue Version sollte dringend vorgenommen werden.</p>\n<p><span id="more-1299"></span></p>\n<p>Die neue Version schließt drei Sicherheitslücken. So sind WordPress 4.3 und frühere Versionen anfällig durch eine XSS-Lücke bei der Verarbeitung von Shortcode-Tags. Gemeldet wurde diese Lücke durch Shahar Tal und Netanel Rubin von <a href="http://checkpoint.com/">Check Point</a>. Eine weitere Cross-Site-Scripting-Lücke wurde von Ben Bidner aus dem WordPress-Security-Team gefunden. Sie betrifft die Benutzerliste im Backend.</p>\n<p>Die dritte Sicherheitslücke, die geschlossen wurde, kann es Benutzern ohne notwendige Berechtigung ermöglichen, private Beiträge zu veröffentlichen und sie auf den Status „Sticky“ zu setzen. Auch diese Lücke wurde von Shahar Tal und Netanel Rubin gefunden und gemeldet.</p>\n<p>Vielen Dank an die Finder der Sicherheitslücken, dass sie <a href="https://make.wordpress.org/core/handbook/testing/reporting-security-vulnerabilities//">verantwortungsvoll damit umgegangen sind</a>. Neben diesen Sicherheitslücken behebt WordPress 4.3.1 noch 26 Bugs. Genauere Informationen dazu findet ihr in der <a href="https://core.trac.wordpress.org/log/branches/4.3/?rev=34199&amp;stop_rev=33647">Liste der Änderungen</a> oder in den <a href="https://codex.wordpress.org/Version_4.3.1">Release-Notes</a>.</p>\n<p>Wenn ihr automatische Updates deaktiviert habt, müsst ihr wie gewohnt das Update über euer WordPress-Dashboard vornehmen. Wenn automatische Updates aktiv sind, dann braucht ihr nichts weiter zu unternehmen, siehe dazu auch „<a href="https://de.wordpress.org/2015/04/27/die-hintergrund-updates-von-wordpress-was-genau-passiert-da-eigentlich/">diesen Artikel</a>“. </p>\n<p>Ebenfalls veröffentlicht wurden die Sicherheits-Updates: 4.2.5, 4.1.8, 4.0.8, 3.9.9, 3.8.11 und 3.7.11.</p>\n<p>Danke an alle, die an WordPress 4.3.1 mitgewirkt haben:</p>\n<p><a href="https://profiles.wordpress.org/adamsilverstein">Adam Silverstein</a>, <a href="https://profiles.wordpress.org/afercia">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="https://profiles.wordpress.org/boonebgorges">Boone Gorges</a>, <a href="https://profiles.wordpress.org/kraftbj">Brandon Kraft</a>, <a href="https://profiles.wordpress.org/chriscct7">chriscct7</a>, <a href="https://profiles.wordpress.org/extendwings">Daisuke Takahashi</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/DrewAPicture">Drew Jaynes</a>, <a href="https://profiles.wordpress.org/dustinbolton">dustinbolton</a>, <a href="https://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="https://profiles.wordpress.org/hauvong">hauvong</a>, <a href="https://profiles.wordpress.org/macmanx">James Huff</a>, <a href="https://profiles.wordpress.org/jeremyfelt">Jeremy Felt</a>, <a href="https://profiles.wordpress.org/jobst">jobst</a>, <a href="https://profiles.wordpress.org/tyxla">Marin Atanasov</a>, <a href="https://profiles.wordpress.org/celloexpressions">Nick Halsey</a>, <a href="https://profiles.wordpress.org/nikeo">nikeo</a>, <a href="https://profiles.wordpress.org/nbachiyski">Nikolay Bachiyski</a>, <a href="https://profiles.wordpress.org/swissspidy">Pascal Birchler</a>, <a href="https://profiles.wordpress.org/figureone">Paul Ryan</a>, <a href="https://profiles.wordpress.org/peterwilsoncc">Peter Wilson</a>, <a href="https://profiles.wordpress.org/miqrogroove">Robert Chapin</a>, <a href="https://profiles.wordpress.org/otto42">Samuel Wood</a>, <a href="https://profiles.wordpress.org/wonderboymusic">Scott Taylor</a>, <a href="https://profiles.wordpress.org/SergeyBiryukov">Sergey Biryukov</a>, <a href="https://profiles.wordpress.org/tmatsuur">tmatsuur</a>, <a href="https://profiles.wordpress.org/liljimmi">Tracy Levesque</a>, <a href="https://profiles.wordpress.org/umeshnevase">Umesh Nevase</a>, <a href="https://profiles.wordpress.org/vortfu">vortfu</a>, <a href="https://profiles.wordpress.org/welcher">welcher</a>, <a href="https://profiles.wordpress.org/westonruter">Weston Ruter</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:106:"https://de.wordpress.org/2015/09/15/wordpress-4-3-1-sicherheits-und-wartungs-release-veroeffentlicht/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:78:"WordPress 4.3 „Billie“: Bessere Passwörter, Menüs im Customizer und mehr";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:107:"https://de.wordpress.org/2015/08/18/wordpress-4-3-billie-bessere-passwoerter-menues-im-customizer-und-mehr/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:116:"https://de.wordpress.org/2015/08/18/wordpress-4-3-billie-bessere-passwoerter-menues-im-customizer-und-mehr/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 18 Aug 2015 19:14:43 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://de.wordpress.org/?p=1221";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:425:"Heute wurde WordPress 4.3 „Billie“ veröffentlicht. Die neue Version bringt einige Neuerungen mit, unter anderem kann jetzt ein Website-Icon festgelegt sowie Markdown-ähnliche Syntax im Editor verwendet werden. Benannt ist die neue Version nach der Jazz-Sängerin Billie Holiday. Sicherere Seiten durch bessere Passwörter Ab WordPress 4.3 hilft euch WordPress beim Festlegen eines sicheren Passworts. Wenn ihr [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Florian Brinkmann";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:27281:"<p>Heute wurde WordPress 4.3 „Billie“ veröffentlicht. Die neue Version bringt einige Neuerungen mit, unter anderem kann jetzt ein Website-Icon festgelegt sowie Markdown-ähnliche Syntax im Editor verwendet werden. Benannt ist die neue Version nach der Jazz-Sängerin Billie Holiday.</p>\n<p><span id="more-1221"></span></p>\n<p><iframe width=''692'' height=''389'' src=''https://videopress.com/embed/T54Iy7Tw?hd=1'' frameborder=''0'' allowfullscreen></iframe><script src=''https://v0.wordpress.com/js/next/videopress-iframe.js?m=1435166243''></script></p>\n<h2>Sicherere Seiten durch bessere Passwörter</h2>\n<p>Ab WordPress 4.3 hilft euch WordPress beim Festlegen eines sicheren Passworts. Wenn ihr bei der Installation zu der Wahl des Passworts kommt, findet ihr eine Schaltfläche zur Generierung eines Passworts vor. Danach könnt ihr das gegebenenfalls noch weiter anpassen aber so wird die Hürde für ein unsicheres Passwort jedenfalls erst mal höher.</p>\n<p>Diese Funktion beschränkt sich aber nicht auf die Installation sondern findet sich auch bei der Bearbeitung von Benutzern. Des Weiteren werden Passwörter nicht mehr per E-Mail verschickt und der Link zum Zurücksetzen eines Passworts hat nur noch eine begrenzte Haltbarkeit.</p>\n<figure id="attachment_1222" style="width: 632px" class="wp-caption alignnone"><img class="wp-image-1222" src="https://de.wordpress.org/files/2015/08/better-passwords.png" alt="Bessere Passwörter sind ab WordPress 4.3 Standard. (Screenshot: About-Seite von WordPress 4.3)" width="632" height="355" srcset="https://de.wordpress.org/files/2015/08/better-passwords-300x169.png 300w, https://de.wordpress.org/files/2015/08/better-passwords.png 1010w" sizes="(max-width: 632px) 100vw, 632px" /><figcaption class="wp-caption-text">Bessere Passwörter sind ab WordPress 4.3 Standard. (Screenshot: About-Seite von WordPress 4.3)</figcaption></figure>\n<h2>Der Customizer wird mächtiger: Menü-Verwaltung und Website-Icon</h2>\n<p>Der Customizer nimmt eine immer wichtigere Rolle ein – ab sofort könnt ihr auch die komplette Verwaltung eurer Menüs darüber erledigen (den Customizer findet ihr unter „Design“ &gt; „Anpassen“). Dabei bekommt ihr – wie von den übrigen Funktionen des Customizers gewohnt – eine Vorschau eurer Änderungen angezeigt.</p>\n<figure id="attachment_1223" style="width: 632px" class="wp-caption alignnone"><img class="wp-image-1223" src="https://de.wordpress.org/files/2015/08/menu-customizer.png" alt="Menüs mit Live-Vorschau bearbeiten ist jetzt auch möglich. (Screenshot: About-Seite von WordPress 4.3)" width="632" height="355" srcset="https://de.wordpress.org/files/2015/08/menu-customizer-300x169.png 300w, https://de.wordpress.org/files/2015/08/menu-customizer.png 1010w" sizes="(max-width: 632px) 100vw, 632px" /><figcaption class="wp-caption-text">Menüs mit Live-Vorschau bearbeiten ist jetzt auch möglich. (Screenshot: About-Seite von WordPress 4.3)</figcaption></figure>\n<p>Als komplett neue Funktion könnt ihr nun ein Website-Icon festlegen. Das wird anschließend als Favicon sowie App-Icon genutzt. Auch diese Funktion findet ihr im Customizer.</p>\n<h2>Schnellere Formatierungen im Editor und kleinere Neuerungen</h2>\n<p>WordPress 4.3 führt für den visuellen Editor Formatierungs-Kürzel ein. Damit könnt ihr beispielsweise einfacher ungeordnete Listen erstellen, indem ihr einfach einen <code>*</code> für einen Listenpunkt eingebt. Überschriften könnt ihr mit Rauten erstellen: <code>##</code> ergibt eine Überschrift zweiter Ordnung.</p>\n<div style="width: 640px; " class="wp-video"><!--[if lt IE 9]><script>document.createElement(''video'');</script><![endif]-->\n<video class="wp-video-shortcode" id="video-1221-1" width="640" height="360" loop="1" autoplay="1" preload="metadata" controls="controls"><source type="video/mp4" src="//s.w.org/images/core/4.3/formatting.mp4?_=1" /><source type="video/webm" src="//s.w.org/images/core/4.3/formatting.webm?_=1" /><source type="video/ogg" src="//s.w.org/images/core/4.3/formatting.ogv?_=1" /><a href="//s.w.org/images/core/4.3/formatting.mp4">//s.w.org/images/core/4.3/formatting.mp4</a></video></div>\n<p>Daneben wurden die Listen-Ansichten verbessert, sodass ihr jetzt auch in kleineren Viewports alle wichtigen Informationen erreichen könnt, ohne einen Eintrag öffnen zu müssen. Außerdem sind Kommentare auf neu angelegten Seiten nun standardmäßig deaktiviert und in der Admin-Toolbar findet sich jetzt ein Link direkt zum Customizer.</p>\n<p>Ein kleines Detail, das viele aber schon länger herbeigesehnt haben: Mit der neuen Version kann die formale Sprachdatei für die deutsche Sprache direkt im Backend installiert und ausgewählt werden.</p>\n<h2>Änderungen unter der Haube</h2>\n<p>Gleichnamige Terme unterschiedlicher Taxonomien haben bisher ein und dieselbe Zeile in der <code>wp_terms</code>-Spalte genutzt. Bei der Aktualisierung kam es bis WordPress 4.2 in diesen Fällen zu Problemen. Mit dem Update auf WordPress 4.3 wurden diese Terme geteilt.</p>\n<p>Es gibt eine neue Theme-Datei: Die <code>singular.php</code>. Diese greift als Fallback für die <code>single.php</code>&#8211; und <code>page.php</code>-Datei. Sie ist damit das Äquivalent zu der <code>archive.php</code>, die als Fallback für <code>category.php</code>, <code>author.php</code> et cetera fungiert.</p>\n<p>Des Weiteren kann und sollte für Listen-Tabellen (gemeint ist beispielsweise die Übersichtsseite der Beiträge) nun eine primäre Spalte festgelegt werden. Das ist die Spalte, die in kleineren Viewports direkt angezeigt wird. Genauere Informationen über alle Änderungen findet ihr im <a href="https://codex.wordpress.org/Version_4.3">WordPress-Codex</a>.</p>\n<h2>Danke!</h2>\n<p>Danke an alle, die bei der neuen Version mitgewirkt haben – sei es direkt am Code oder an der Übersetzung.</p>\n<h3>Projektleiter</h3>\n<p><a href="https://profiles.wordpress.org/matt">Matt Mullenweg</a> (Mitgründer, Projektleitung), <a href="https://profiles.wordpress.org/azaozz">Andrew Ozz</a> (Leitender Entwickler), <a href="https://profiles.wordpress.org/helen">Helen Hou-Sandí</a> (Leitende Entwicklerin), <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a> (Leitender Entwickler), <a href="https://profiles.wordpress.org/markjaquith">Mark Jaquith</a> (Leitender Entwickler) und <a href="https://profiles.wordpress.org/nacin">Andrew Nacin</a> (Leitender Entwickler).</p>\n<h3>Mitwirkende Entwickler</h3>\n<p><a href="https://profiles.wordpress.org/obenland">Konstantin Obenland</a> (Release-Leitung), <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a> (Entwickler), <a href="https://profiles.wordpress.org/wonderboymusic">Scott Taylor</a> (Entwickler), <a href="https://profiles.wordpress.org/SergeyBiryukov">Sergey Biryukov</a> (Entwickler), <a href="https://profiles.wordpress.org/boonebgorges">Boone B. Gorges</a> (Entwickler), <a href="https://profiles.wordpress.org/pento">Gary Pendergast</a> (Entwickler), <a href="https://profiles.wordpress.org/johnbillion">John Blackbourn</a> (Entwickler), <a href="https://profiles.wordpress.org/DrewAPicture">Drew Jaynes</a> (Docs Committer), <a href="https://profiles.wordpress.org/lancewillett">Lance Willett</a>, <a href="https://profiles.wordpress.org/jeremyfelt">Jeremy Felt</a>, <a href="https://profiles.wordpress.org/ryan">Ryan Boren</a>, <a href="https://profiles.wordpress.org/westonruter">Weston Ruter</a>, <a href="https://profiles.wordpress.org/afercia">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="https://profiles.wordpress.org/iseulde">Ella Iseulde Van Dorpe</a>, <a href="https://profiles.wordpress.org/valendesigns">Derek Herman</a>, <a href="https://profiles.wordpress.org/designsimply">Sheri Bigelow</a>, <a href="https://profiles.wordpress.org/adamsilverstein">Adam Silverstein</a>, <a href="https://profiles.wordpress.org/rianrietveld">Rian Rietveld</a>, <a href="https://profiles.wordpress.org/celloexpressions">Nick Halsey</a> und <a href="https://profiles.wordpress.org/voldemortensen">Garth Mortensen</a>.</p>\n<h3>Mitwirkende am Code von WordPress 4.3</h3>\n<p><a href="https://profiles.wordpress.org/mercime">@mercime</a>, <a href="https://profiles.wordpress.org/aaroncampbell">Aaron D. Campbell</a>, <a href="https://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="https://profiles.wordpress.org/adamkheckler">Adam Heckler</a>, <a href="https://profiles.wordpress.org/adamsilverstein">Adam Silverstein</a>, <a href="https://profiles.wordpress.org/akibjorklund">Aki Bjorklund</a>, <a href="https://profiles.wordpress.org/akirk">Alex Kirk</a>, <a href="https://profiles.wordpress.org/viper007bond">Alex Mills (Viper007Bond)</a>, <a href="https://profiles.wordpress.org/tellyworth">Alex Shiels</a>, <a href="https://profiles.wordpress.org/deconf">Alin Marcu</a>, <a href="https://profiles.wordpress.org/andfinally">andfinally</a>, <a href="https://profiles.wordpress.org/afercia">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/andg">Andrea Gandino</a>, <a href="https://profiles.wordpress.org/nacin">Andrew Nacin</a>, <a href="https://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="https://profiles.wordpress.org/afragen">Andy Fragen</a>, <a href="https://profiles.wordpress.org/ankit-k-gupta">Ankit K Gupta</a>, <a href="https://profiles.wordpress.org/antpb">Anthony Burchell</a>, <a href="https://profiles.wordpress.org/anubisthejackle">anubisthejackle</a>, <a href="https://profiles.wordpress.org/aramzs">Aram Zucker-Scharff</a>, <a href="https://profiles.wordpress.org/arjunskumar">Arjun S Kumar</a>, <a href="https://profiles.wordpress.org/avnarun">avnarun</a>, <a href="https://profiles.wordpress.org/brad2dabone">Bad Feather</a>, <a href="https://profiles.wordpress.org/bcole808">Ben Cole</a>, <a href="https://profiles.wordpress.org/empireoflight">Ben Dunkle</a>, <a href="https://profiles.wordpress.org/binarykitten">BinaryKitten</a>, <a href="https://profiles.wordpress.org/birgire">Birgir Erlendsson (birgire)</a>, <a href="https://profiles.wordpress.org/bjornjohansen">Bjorn Johansen</a>, <a href="https://profiles.wordpress.org/bolo1988">bolo1988</a>, <a href="https://profiles.wordpress.org/boonebgorges">Boone B. Gorges</a>, <a href="https://profiles.wordpress.org/bradt">Brad Touesnard</a>, <a href="https://profiles.wordpress.org/bramd">Bram Duvigneau</a>, <a href="https://profiles.wordpress.org/kraftbj">Brandon Kraft</a>, <a href="https://profiles.wordpress.org/krogsgard">Brian Krogsgard</a>, <a href="https://profiles.wordpress.org/brianlayman">Brian Layman</a>, <a href="https://profiles.wordpress.org/icaleb">Caleb Burks</a>, <a href="https://profiles.wordpress.org/calevans">CalEvans</a>, <a href="https://profiles.wordpress.org/chasewiseman">Chase Wiseman</a>, <a href="https://profiles.wordpress.org/chipbennett">Chip Bennett</a>, <a href="https://profiles.wordpress.org/chouby">Chouby</a>, <a href="https://profiles.wordpress.org/c3mdigital">Chris Olbekson</a>, <a href="https://profiles.wordpress.org/chriscct7">chriscct7</a>, <a href="https://profiles.wordpress.org/posykrat">Clement Biron</a>, <a href="https://profiles.wordpress.org/craig-ralston">Craig Ralston</a>, <a href="https://profiles.wordpress.org/danielbachhuber">Daniel Bachhuber</a>, <a href="https://profiles.wordpress.org/redsweater">Daniel Jalkut (Red Sweater)</a>, <a href="https://profiles.wordpress.org/mte90">Daniele Mte90 Scasciafratte</a>, <a href="https://profiles.wordpress.org/daniluk4000">daniluk4000</a>, <a href="https://profiles.wordpress.org/dmchale">Dave McHale</a>, <a href="https://profiles.wordpress.org/daveal">DaveAl</a>, <a href="https://profiles.wordpress.org/davidakennedy">David A. Kennedy</a>, <a href="https://profiles.wordpress.org/dlh">David Herrera</a>, <a href="https://profiles.wordpress.org/daxelrod">daxelrod</a>, <a href="https://profiles.wordpress.org/denis-de-bernardy">Denis de Bernardy</a>, <a href="https://profiles.wordpress.org/realloc">Dennis Ploetner</a>, <a href="https://profiles.wordpress.org/valendesigns">Derek Herman</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/dipeshkakadiya">dipesh.kakadiya</a>, <a href="https://profiles.wordpress.org/dmsnell">dmsnell</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/drewapicture">Drew Jaynes</a>, <a href="https://profiles.wordpress.org/kucrut">Dzikri Aziz</a>, <a href="https://profiles.wordpress.org/eclev91">eclev91</a>, <a href="https://profiles.wordpress.org/eligijus">eligijus</a>, <a href="https://profiles.wordpress.org/eliorivero">Elio Rivero</a>, <a href="https://profiles.wordpress.org/iseulde">Ella Iseulde Van Dorpe</a>, <a href="https://profiles.wordpress.org/ericlewis">Eric Andrew Lewis</a>, <a href="https://profiles.wordpress.org/ebinnion">Eric Binnion</a>, <a href="https://profiles.wordpress.org/ericmann">Eric Mann</a>, <a href="https://profiles.wordpress.org/fab1en">Fabien Quatravaux</a>, <a href="https://profiles.wordpress.org/flixos90">Felix Arntz</a>, <a href="https://profiles.wordpress.org/francoeurdavid">francoeurdavid</a>, <a href="https://profiles.wordpress.org/frank-klein">Frank Klein</a>, <a href="https://profiles.wordpress.org/gabrielperezs">gabrielperezs</a>, <a href="https://profiles.wordpress.org/voldemortensen">Garth Mortensen</a>, <a href="https://profiles.wordpress.org/garyj">Gary Jones</a>, <a href="https://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="https://profiles.wordpress.org/georgestephanis">George Stephanis</a>, <a href="https://profiles.wordpress.org/glennm">glennm</a>, <a href="https://profiles.wordpress.org/gtuk">gtuk</a>, <a href="https://profiles.wordpress.org/hailin">hailin</a>, <a href="https://profiles.wordpress.org/hauvong">hauvong</a>, <a href="https://profiles.wordpress.org/helen">Helen Hou-Sandí</a>, <a href="https://profiles.wordpress.org/henrikakselsen">henrikakselsen</a>, <a href="https://profiles.wordpress.org/hnle">Hinaloe</a>, <a href="https://profiles.wordpress.org/hrishiv90">Hrishikesh Vaipurkar</a>, <a href="https://profiles.wordpress.org/hugobaeta">Hugo Baeta</a>, <a href="https://profiles.wordpress.org/imath">imath</a>, <a href="https://profiles.wordpress.org/ipstenu">Ipstenu (Mika Epstein)</a>, <a href="https://profiles.wordpress.org/isaacchapman">isaacchapman</a>, <a href="https://profiles.wordpress.org/izem">izem</a>, <a href="https://profiles.wordpress.org/jdgrimes">J.D. Grimes</a>, <a href="https://profiles.wordpress.org/jacklenox">Jack Lenox</a>, <a href="https://profiles.wordpress.org/jadpm">jadpm</a>, <a href="https://profiles.wordpress.org/jamesgol">jamesgol</a>, <a href="https://profiles.wordpress.org/jancbeck">jancbeck</a>, <a href="https://profiles.wordpress.org/jfarthing84">Jeff Farthing</a>, <a href="https://profiles.wordpress.org/jeremyfelt">Jeremy Felt</a>, <a href="https://profiles.wordpress.org/jpry">Jeremy Pry</a>, <a href="https://profiles.wordpress.org/jmichaelward">Jeremy Ward</a>, <a href="https://profiles.wordpress.org/jesin">Jesin A</a>, <a href="https://profiles.wordpress.org/jipmoors">jipmoors</a>, <a href="https://profiles.wordpress.org/joedolson">Joe Dolson</a>, <a href="https://profiles.wordpress.org/joehoyle">Joe Hoyle</a>, <a href="https://profiles.wordpress.org/joemcgill">Joe McGill</a>, <a href="https://profiles.wordpress.org/jkudish">Joey Kudish</a>, <a href="https://profiles.wordpress.org/johnbillion">John Blackbourn</a>, <a href="https://profiles.wordpress.org/johnjamesjacoby">John James Jacoby</a>, <a href="https://profiles.wordpress.org/picard102">John Leschinski</a>, <a href="https://profiles.wordpress.org/joostdevalk">Joost de Valk</a>, <a href="https://profiles.wordpress.org/jpyper">Jpyper</a>, <a href="https://profiles.wordpress.org/jrf">jrf</a>, <a href="https://profiles.wordpress.org/juliobox">Julio Potier</a>, <a href="https://profiles.wordpress.org/jtsternberg">Justin Sternberg</a>, <a href="https://profiles.wordpress.org/ungestaltbar">Kai</a>, <a href="https://profiles.wordpress.org/karinchristen">karinchristen</a>, <a href="https://profiles.wordpress.org/karpstrucking">karpstrucking</a>, <a href="https://profiles.wordpress.org/ryelle">Kelly Dwan</a>, <a href="https://profiles.wordpress.org/kevkoeh">kevkoeh</a>, <a href="https://profiles.wordpress.org/kitchin">kitchin</a>, <a href="https://profiles.wordpress.org/ixkaito">Kite</a>, <a href="https://profiles.wordpress.org/kovshenin">Konstantin Kovshenin</a>, <a href="https://profiles.wordpress.org/lancewillett">Lance Willett</a>, <a href="https://profiles.wordpress.org/leewillis77">Lee Willis</a>, <a href="https://profiles.wordpress.org/leogopal">Leo Gopal</a>, <a href="https://profiles.wordpress.org/loushou">loushou</a>, <a href="https://profiles.wordpress.org/lumaraf">Lumaraf</a>, <a href="https://profiles.wordpress.org/tyxla">Marin Atanasov</a>, <a href="https://profiles.wordpress.org/nofearinc">Mario Peshev</a>, <a href="https://profiles.wordpress.org/clorith">Marius (Clorith)</a>, <a href="https://profiles.wordpress.org/markjaquith">Mark Jaquith</a>, <a href="https://profiles.wordpress.org/markoheijnen">Marko Heijnen</a>, <a href="https://profiles.wordpress.org/marsjaninzmarsa">marsjaninzmarsa</a>, <a href="https://profiles.wordpress.org/martinsachse">martinsachse</a>, <a href="https://profiles.wordpress.org/matt">Matt Mullenweg</a>, <a href="https://profiles.wordpress.org/veraxus">Matt van Andel</a>, <a href="https://profiles.wordpress.org/mattwiebe">Matt Wiebe</a>, <a href="https://profiles.wordpress.org/mattyrob">mattyrob</a>, <a href="https://profiles.wordpress.org/maxxsnake">maxxsnake</a>, <a href="https://profiles.wordpress.org/melchoyce">Mel Choyce</a>, <a href="https://profiles.wordpress.org/nikonratm">Michael</a>, <a href="https://profiles.wordpress.org/mdawaffe">Michael Adams (mdawaffe)</a>, <a href="https://profiles.wordpress.org/michael-arestad">Michael Arestad</a>, <a href="https://profiles.wordpress.org/michaelryanmcneill">michaelryanmcneill</a>, <a href="https://profiles.wordpress.org/mcguive7">Mickey Kay</a>, <a href="https://profiles.wordpress.org/mihai">mihai</a>, <a href="https://profiles.wordpress.org/mikehansenme">Mike Hansen</a>, <a href="https://profiles.wordpress.org/mnelson4">Mike Nelson</a>, <a href="https://profiles.wordpress.org/dh-shredder">Mike Schroder</a>, <a href="https://profiles.wordpress.org/dimadin">Milan Dinic</a>, <a href="https://profiles.wordpress.org/morganestes">Morgan Estes</a>, <a href="https://profiles.wordpress.org/mrutz">mrutz</a>, <a href="https://profiles.wordpress.org/nabil_kadimi">nabil_kadimi</a>, <a href="https://profiles.wordpress.org/Nao">Naoko Takano</a>, <a href="https://profiles.wordpress.org/nazmulhossainnihal">Nazmul Hossain Nihal</a>, <a href="https://profiles.wordpress.org/nicholas_io">nicholas_io</a>, <a href="https://profiles.wordpress.org/celloexpressions">Nick Halsey</a>, <a href="https://profiles.wordpress.org/nickmomrik">Nick Momrik</a>, <a href="https://profiles.wordpress.org/nbachiyski">Nikolay Bachiyski</a>, <a href="https://profiles.wordpress.org/rabmalin">Nilambar Sharma</a>, <a href="https://profiles.wordpress.org/ohryan">ohryan</a>, <a href="https://profiles.wordpress.org/onnimonni">Onni Hakala</a>, <a href="https://profiles.wordpress.org/ozh">Ozh</a>, <a href="https://profiles.wordpress.org/pareshradadiya-1">Paresh Radadiya</a>, <a href="https://profiles.wordpress.org/swissspidy">Pascal Birchler</a>, <a href="https://profiles.wordpress.org/djpaul">Paul Gibbs</a>, <a href="https://profiles.wordpress.org/paulwilde">Paul Wilde</a>, <a href="https://profiles.wordpress.org/pavelevap">pavelevap</a>, <a href="https://profiles.wordpress.org/gungeekatx">Pete Nelson</a>, <a href="https://profiles.wordpress.org/peterwilsoncc">Peter Wilson</a>, <a href="https://profiles.wordpress.org/peterrknight">PeterRKnight</a>, <a href="https://profiles.wordpress.org/philiparthurmoore">Philip Arthur Moore</a>, <a href="https://profiles.wordpress.org/mordauk">Pippin Williamson</a>, <a href="https://profiles.wordpress.org/polevaultweb">polevaultweb</a>, <a href="https://profiles.wordpress.org/pragunbhutani">pragunbhutani</a>, <a href="https://profiles.wordpress.org/rachelbaker">Rachel Baker</a>, <a href="https://profiles.wordpress.org/ramiy">Rami Yushuvaev</a>, <a href="https://profiles.wordpress.org/rarylson">rarylson</a>, <a href="https://profiles.wordpress.org/lamosty">Rastislav Lamos</a>, <a href="https://profiles.wordpress.org/rauchg">rauchg</a>, <a href="https://profiles.wordpress.org/ravinderk">Ravinder Kumar</a>, <a href="https://profiles.wordpress.org/rclations">RC Lations</a>, <a href="https://profiles.wordpress.org/greuben">Reuben Gunday</a>, <a href="https://profiles.wordpress.org/rianrietveld">Rian Rietveld</a>, <a href="https://profiles.wordpress.org/ritteshpatel">Ritesh Patel</a>, <a href="https://profiles.wordpress.org/miqrogroove">Robert Chapin</a>, <a href="https://profiles.wordpress.org/rdall">Robert Dall</a>, <a href="https://profiles.wordpress.org/rodrigosprimo">Rodrigo Primo</a>, <a href="https://profiles.wordpress.org/rommelxcastro">Rommel Castro</a>, <a href="https://profiles.wordpress.org/magicroundabout">Ross Wintle</a>, <a href="https://profiles.wordpress.org/rhurling">Rouven Hurling</a>, <a href="https://profiles.wordpress.org/ryan">Ryan Boren</a>, <a href="https://profiles.wordpress.org/rmarks">Ryan Marks</a>, <a href="https://profiles.wordpress.org/rmccue">Ryan McCue</a>, <a href="https://profiles.wordpress.org/welcher">Ryan Welcher</a>, <a href="https://profiles.wordpress.org/sagarjadhav">Sagar Jadhav</a>, <a href="https://profiles.wordpress.org/salcode">Sal Ferrarello</a>, <a href="https://profiles.wordpress.org/solarissmoke">Samir Shah</a>, <a href="https://profiles.wordpress.org/santagada">santagada</a>, <a href="https://profiles.wordpress.org/sc0ttkclark">Scott Kingsley Clark</a>, <a href="https://profiles.wordpress.org/coffee2code">Scott Reilly</a>, <a href="https://profiles.wordpress.org/wonderboymusic">Scott Taylor</a>, <a href="https://profiles.wordpress.org/scribu">scribu</a>, <a href="https://profiles.wordpress.org/scruffian">scruffian</a>, <a href="https://profiles.wordpress.org/seanchayes">Sean Hayes</a>, <a href="https://profiles.wordpress.org/sebastiantiede">sebastiantiede</a>, <a href="https://profiles.wordpress.org/sergeybiryukov">Sergey Biryukov</a>, <a href="https://profiles.wordpress.org/shooper">Shawn Hooper</a>, <a href="https://profiles.wordpress.org/designsimply">Sheri Bigelow</a>, <a href="https://profiles.wordpress.org/simonwheatley">Simon Wheatley</a>, <a href="https://profiles.wordpress.org/siobhan">Siobhan</a>, <a href="https://profiles.wordpress.org/metodiew">Stanko Metodiev</a>, <a href="https://profiles.wordpress.org/stephdau">Stephane Daury (stephdau)</a>, <a href="https://profiles.wordpress.org/netweb">Stephen Edgar</a>, <a href="https://profiles.wordpress.org/stevegrunwell">Steve Grunwell</a>, <a href="https://profiles.wordpress.org/stevenkword">Steven Word</a>, <a href="https://profiles.wordpress.org/stuartshields">stuartshields</a>, <a href="https://profiles.wordpress.org/sudar">Sudar</a>, <a href="https://profiles.wordpress.org/sunnyratilal">Sunny Ratilal</a>, <a href="https://profiles.wordpress.org/taka2">taka2</a>, <a href="https://profiles.wordpress.org/tharsheblows">tharsheblows</a>, <a href="https://profiles.wordpress.org/thorbrink">Thor Brink</a>, <a href="https://profiles.wordpress.org/creativeinfusion">Tim Smith</a>, <a href="https://profiles.wordpress.org/tlexcellent">tlexcellent</a>, <a href="https://profiles.wordpress.org/tmatsuur">tmatsuur</a>, <a href="https://profiles.wordpress.org/tobiasbg">TobiasBg</a>, <a href="https://profiles.wordpress.org/tomasm">Tomas Mackevicius</a>, <a href="https://profiles.wordpress.org/tomharrigan">TomHarrigan</a>, <a href="https://profiles.wordpress.org/toro_unit">Toro_Unit (Hiroshi Urabe)</a>, <a href="https://profiles.wordpress.org/toru">Toru Miki</a>, <a href="https://profiles.wordpress.org/liljimmi">Tracy Levesque</a>, <a href="https://profiles.wordpress.org/tryon">Tryon Eggleston</a>, <a href="https://profiles.wordpress.org/tywayne">Ty Carlson</a>, <a href="https://profiles.wordpress.org/desaiuditd">Udit Desai</a>, <a href="https://profiles.wordpress.org/vivekbhusal">vivekbhusal</a>, <a href="https://profiles.wordpress.org/westonruter">Weston Ruter</a>, <a href="https://profiles.wordpress.org/willnorris">Will Norris</a>, <a href="https://profiles.wordpress.org/willgladstone">willgladstone</a>, <a href="https://profiles.wordpress.org/earnjam">William Earnhardt</a>, <a href="https://profiles.wordpress.org/willstedt">willstedt</a>, <a href="https://profiles.wordpress.org/eltobiano">WPMU DEV Jose</a>, <a href="https://profiles.wordpress.org/yoavf">Yoav Farhi</a>, <a href="https://profiles.wordpress.org/ysalame">Yuri Salame</a>, <a href="https://profiles.wordpress.org/oxymoron">Zach Wills</a>, <a href="https://profiles.wordpress.org/katzwebdesign">Zack Katz</a> und <a href="https://profiles.wordpress.org/tollmanz">Zack Tollman</a>.</p>\n<h3>Übersetzer ins Deutsche</h3>\n<p><strong>Translation Editors (schalten die Übersetzungen frei):</strong> <a href="https://profiles.wordpress.org/fstaude">Frank Staude</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/arkonisus">Christian Rüggeberg</a> und <a href="https://profiles.wordpress.org/zodiac1978">Torsten Landsiedel</a>.</p>\n<p><a href="https://profiles.wordpress.org/agadj">AgaDj</a>, <a href="https://profiles.wordpress.org/la-geek">Angelika Reisiger</a>, <a href="https://profiles.wordpress.org/pixolin">Bego Mario Garde</a>, <a href="https://profiles.wordpress.org/coachbirgit">Birgit Olzem</a>, <a href="https://profiles.wordpress.org/friendlyghost">Caspar</a>, <a href="https://profiles.wordpress.org/danielhuesken">Daniel Hüsken</a>, <a href="https://profiles.wordpress.org/kungtiger">Daniel Schneider</a>, <a href="https://profiles.wordpress.org/drivingralle">Drivingralle</a>, <a href="https://profiles.wordpress.org/florianbrinkmann">Florian Brinkmann</a>, <a href="https://profiles.wordpress.org/bueltge">Frank Bültge</a>, <a href="https://profiles.wordpress.org/obstschale">Hans-Helge Bürger</a>, <a href="https://profiles.wordpress.org/janreim">Jan Reimers</a>, <a href="https://profiles.wordpress.org/jozze_w">jozze_w</a>, <a href="https://profiles.wordpress.org/swissky">Kevin Kyburz (@swissky)</a>, <a href="https://profiles.wordpress.org/maxloewdev">maxloewdev</a>, <a href="https://profiles.wordpress.org/olikami">olikami</a>, <a href="https://profiles.wordpress.org/patloq">patloq</a>, <a href="https://profiles.wordpress.org/krafit">Simon Kraft</a>, <a href="https://profiles.wordpress.org/soean">soean</a>, <a href="https://profiles.wordpress.org/stk_jj">Stefan Kremer (stk_jj)</a>, <a href="https://profiles.wordpress.org/elbmedien">Stephanie Wiermann</a>, <a href="https://profiles.wordpress.org/thomas_u">Thomas_U</a>, <a href="https://profiles.wordpress.org/ipm-frommen">Thorsten Frommen</a>, <a href="https://profiles.wordpress.org/transl8or">transl8or</a> und <a href="https://profiles.wordpress.org/ww_hoax">ww_hoax</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:112:"https://de.wordpress.org/2015/08/18/wordpress-4-3-billie-bessere-passwoerter-menues-im-customizer-und-mehr/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:49:"WordPress 4.2.4 Sicherheits- und Wartungs-Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:85:"https://de.wordpress.org/2015/08/04/wordpress-4-2-4-sicherheits-und-wartungs-release/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:94:"https://de.wordpress.org/2015/08/04/wordpress-4-2-4-sicherheits-und-wartungs-release/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 04 Aug 2015 13:06:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:10:"Sicherheit";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://de.wordpress.org/?p=1205";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:473:"Vor Kurzem wurde WordPress 4.2.4 veröffentlicht. Es handelt sich dabei um einen Sicherheits-Release dessen Installation dringend empfohlen wird. Der Release behebt sechs Probleme, darunter drei Cross-Site-Scripting-Lücken und eine potenzielle SQL-Injection. Die Sicherheitslücken wurden von Marc-Alexandre Montpas (Sucuri), Helen Hou-Sandí vom WordPress-Security-Team, Netanel Rubin von Check Point und Ivan Grigorov gefunden. Die neue Version beinhaltet auch [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Florian Brinkmann";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2075:"<p>Vor Kurzem wurde WordPress 4.2.4 veröffentlicht. Es handelt sich dabei um einen Sicherheits-Release dessen Installation <strong>dringend empfohlen</strong> wird.</p>\n<p><span id="more-1205"></span></p>\n<p>Der Release behebt sechs Probleme, darunter drei Cross-Site-Scripting-Lücken und eine potenzielle SQL-Injection. Die Sicherheitslücken wurden von <a href="https://sucuri.net/">Marc-Alexandre Montpas</a> (Sucuri), <a href="http://helenhousandi.com/">Helen Hou-Sandí</a> vom WordPress-Security-Team, <a href="http://www.checkpoint.com/">Netanel Rubin</a> von Check Point und <a href="https://hackerone.com/reactors08">Ivan Grigorov</a> gefunden.</p>\n<p>Die neue Version beinhaltet auch die Behebung einer potenziellen <a href="https://de.wikipedia.org/wiki/Seitenkanalattacke">Rechenzeitangriff-Seitenkanal-Attacke</a>, entdeckt von <a href="http://www.scrutinizer-ci.com/">Johannes Schmitt</a> (Scruntinizer) und verhindert, dass Angreifer einen Beitrag vor der Bearbeitung sperren, gefunden von <a href="https://www.linkedin.com/in/symbiansymoh">Mohamed A. Baset</a>.</p>\n<p>Unser Dank geht an die, die <a href="https://make.wordpress.org/core/handbook/testing/reporting-security-vulnerabilities/">verantwortungsvoll mit Sicherheitslücken umgehen</a> und diese nicht öffentlich melden.</p>\n<p>Daneben werden in der neuen Version vier Bugs behoben – <a href="https://codex.wordpress.org/Version_4.2.4">unter anderem</a> das fehlerhafte Verhalten mit Shortcodes in Spitzklammern.</p>\n<p>Wenn ihr automatische Updates aktiv habt, solltet ihr die neue Version bereits erhalten haben oder bald bekommen. Wenn ihr automatische Updates deaktiviert habt, geht wie gewohnt in den Aktualisierungsbereich des Dashboards.</p>\n<p><em>Habt ihr schon WordPress 4.3 getestet? Der zweite Release Candidate ist jetzt veröffentlicht (<a href="https://wordpress.org/wordpress-4.3-RC2.zip">ZIP</a>). Für mehr Informationen schaut euch den Beitrag über den <a href="https://de.wordpress.org/2015/07/30/wordpress-4-3-release-candidate/">ersten Release Candidate</a> an.</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:90:"https://de.wordpress.org/2015/08/04/wordpress-4-2-4-sicherheits-und-wartungs-release/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"WordPress 4.2.4 Release Candidate 1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:72:"https://de.wordpress.org/2015/07/31/wordpress-4-2-4-release-candidate-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:80:"https://de.wordpress.org/2015/07/31/wordpress-4-2-4-release-candidate-1/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 31 Jul 2015 10:03:46 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Entwicklung";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://de.wordpress.org/?p=1175";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:395:"Seit Kurzem steht der erste Release Candidate für WordPress 4.2.4 zum Download bereit. Die neue Version behebt ein Problem mit Inline-Skripten und Shortcodes. Eine Änderung in WordPress 4.2.3 hatte den Effekt, dass einige Inline-Skripte mit dem CDATA-Block nicht mehr funktioniert haben. Das Skript wurde durch den Fehler auskommentiert und wurde so nicht ausgeführt. Dieses Problem [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Florian Brinkmann";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1421:"<p>Seit Kurzem steht der erste Release Candidate für WordPress 4.2.4 zum Download bereit. Die neue Version behebt ein Problem mit Inline-Skripten und Shortcodes.</p>\n<p><span id="more-1175"></span></p>\n<p>Eine Änderung in WordPress 4.2.3 hatte den Effekt, dass einige Inline-Skripte mit dem CDATA-Block nicht mehr funktioniert haben. Das Skript wurde durch <a href="https://core.trac.wordpress.org/ticket/33106">den Fehler</a> auskommentiert und wurde so nicht ausgeführt.</p>\n<p>Dieses Problem wird mit WordPress 4.2.4 behoben. Des Weiteren hat es nach dem Update auf WordPress 4.2.3 auf vielen Seiten <a href="https://core.trac.wordpress.org/ticket/33116">Probleme mit Shortcodes</a> gegeben, die in Spitzklammern genutzt werden, also so:</p>\n<pre>&lt;[shortcode]&gt;</pre>\n<p>Auch wenn von dieser Nutzung von Shortcodes abgeraten wird und Plugin-Entwickler dazu aufgerufen sind, solche Shortcodes nicht mehr zu verwenden, war dieses Verhalten unbeabsichtigt. Mit WordPress 4.2.4 soll der Einsatz solcher Shortcodes wieder funktionieren.</p>\n<p>Ihr könnt euch den Release Candidate als <a href="https://wordpress.org/wordpress-4.2.4-RC1.zip">ZIP-Archiv</a> herunterladen und testen. Probleme könnt ihr im <a href="https://core.trac.wordpress.org/">Core Trac</a> oder unter dem <a href="https://make.wordpress.org/core/2015/07/30/wordpress-4-2-4-release-candidate-1/">Beitrag auf make.WordPress.org</a> melden.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:77:"https://de.wordpress.org/2015/07/31/wordpress-4-2-4-release-candidate-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"WordPress 4.3 Release Candidate";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://de.wordpress.org/2015/07/30/wordpress-4-3-release-candidate/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://de.wordpress.org/2015/07/30/wordpress-4-3-release-candidate/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 30 Jul 2015 07:43:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Entwicklung";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://de.wordpress.org/?p=1173";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:398:"Gestern wurde der Release Candidate von WordPress 4.3 veröffentlicht. Die finale Version von 4.3 soll voraussichtlich am Dienstag, den 18. August, veröffentlicht werden. Wenn ihr WordPress 4.3 noch nicht getestet habt, dann tut es jetzt! Vor allem Entwickler von Themes oder Plugins sollten ihre Produkte auf der neuen Version ausprobieren. Plugin-Autoren sollen zusätzlich ihre Tested [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Florian Brinkmann";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2038:"<p>Gestern wurde der Release Candidate von WordPress 4.3 veröffentlicht. Die finale Version von 4.3 soll voraussichtlich am Dienstag, den 18. August, veröffentlicht werden.</p>\n<p><span id="more-1173"></span></p>\n<p>Wenn ihr WordPress 4.3 noch nicht getestet habt, dann tut es jetzt! Vor allem Entwickler von Themes oder Plugins sollten ihre Produkte auf der neuen Version ausprobieren. Plugin-Autoren sollen zusätzlich ihre Tested up to Version vor der nächsten Woche auf 4.3 aktualisieren.</p>\n<p>Wenn ihr als Entwickler Kompatibilitätsprobleme findet, dann schreibt das in die Support-Foren, sodass sie vor dem finalen Release begutachtet werden können.</p>\n<p>Wenn ihr umfangreichere Infos über die Neuerungen von WordPress 4.3 haben möchtet, schaut euch die Artikel zu <a href="https://de.wordpress.org/2015/07/02/wordpress-4-3-beta-1/">Beta 1</a>, <a href="https://de.wordpress.org/2015/07/09/wordpress-4-3-beta-2/">Beta 2</a>, <a href="https://de.wordpress.org/2015/07/16/wordpress-4-3-beta-3/">Beta 3</a> und <a href="https://de.wordpress.org/2015/07/23/wordpress-4-3-beta-4/">Beta 4</a> an.</p>\n<p>Wenn ihr den Release Candidate testen möchtet, könnt ihr ihn beispielsweise bequem über das <a href="https://wordpress.org/plugins/wordpress-beta-tester/">Beta-Tester-Plugin</a> installieren. Oder ihr ladet euch die <a href="https://wordpress.org/wordpress-4.3-RC1.zip">ZIP-Datei herunter</a>. Ihr solltet den Release Candidate nicht auf einer Live-Website einsetzen sondern nur in einer Testumgebung!</p>\n<p>Wenn ihr einen Fehler gefunden habt, könnt ihr den in dem <a href="https://wordpress.org/support/forum/alphabeta">Alpha/Beta-Bereich des Support-Forums melden</a>. Wenn Probleme aufkommen, <a href="https://core.trac.wordpress.org/report/5">könnt ihr sie hier finden</a>.</p>\n<p>Auf dem <a href="https://make.wordpress.org/core/">Entwickler-Blog</a> werden weitere <a href="https://make.wordpress.org/core/tag/dev-notes+4-3/">4.3-Infos für Entwickler gepostet werden</a>, behaltet das Blog also im Blick.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://de.wordpress.org/2015/07/30/wordpress-4-3-release-candidate/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:49:"WordPress 4.2.3 Sicherheits- und Wartungs-Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:85:"https://de.wordpress.org/2015/07/23/wordpress-4-2-3-sicherheits-und-wartungs-release/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:94:"https://de.wordpress.org/2015/07/23/wordpress-4-2-3-sicherheits-und-wartungs-release/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 23 Jul 2015 13:14:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:10:"Sicherheit";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://de.wordpress.org/?p=1155";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:427:"Vor Kurzem wurde mit WordPress 4.2.3 ein kritisches Sicherheits-Release veröffentlicht. Ein sofortiges Update wird dringend empfohlen! WordPress 4.2.2 und früher sind von einer kritischen Cross-Site-Scripting-Lücke betroffen. Diese kann es anonymen Nutzern erlauben, die Website zu kompromittieren. Die Lücke wurde von Jon Cave gefunden und von Robert Chapin behoben. Außerdem wurde das Problem behoben, dass ein [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Florian Brinkmann";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2856:"<p>Vor Kurzem wurde mit WordPress 4.2.3 ein kritisches Sicherheits-Release veröffentlicht. <strong>Ein sofortiges Update wird dringend empfohlen!</strong></p>\n<p><span id="more-1155"></span></p>\n<p>WordPress 4.2.2 und früher sind von einer kritischen Cross-Site-Scripting-Lücke betroffen. Diese kann es anonymen Nutzern erlauben, die Website zu kompromittieren. Die Lücke wurde von <a href="https://profiles.wordpress.org/duck_">Jon Cave</a> gefunden und von <a href="http://www.miqrogroove.com/">Robert Chapin</a> behoben.</p>\n<p>Außerdem wurde das Problem behoben, dass ein Nutzer mit Abonnenten-Rolle einen Entwurf mittels der Funktion „Schneller Entwurf“ erstellen konnte. Dieses Problem wurde von Netanel Rubin gemeldet und von <a href="https://www.checkpoint.com/">Check Point Software Technologies</a> behoben.</p>\n<p>Vielen Dank an alle, die Sicherheitslücken <a href="//make.wordpress.org/core/handbook/reporting-security-vulnerabilities/”">nicht öffentlich melden</a>.</p>\n<p>WordPress 4.2.3 behebt außerdem 20 Bugs von 4.2. Für mehr Informationen könnt ihr euch die <a href="https://codex.wordpress.org/Version_4.2.3">Release-Notes</a> oder die <a href="https://core.trac.wordpress.org/log/branches/4.2?rev=33382&amp;stop_rev=32430">Liste an Änderungen</a> anschauen.</p>\n<p>Auch für die anderen Versions-Zweige gibt es Updates: 4.1.6, 4.0.6, 3.9.7, 3.8.9 sowie 3.7.9.</p>\n<p>Ein Update könnt ihr über das Dashboard ausführen. Wenn ihr automatische Updates aktiv habt, sollte es bereits aktualisiert sein oder in Kürze aktualisiert werden. Wenn ihr euch die neue Version herunterladen möchtet, könnt ihr das <a href="https://de.wordpress.org/txt-download/">auf der Download-Seite tun</a>.</p>\n<p>Danke an alle, die an WordPress 4.2.3 mitgeholfen haben:</p>\n<p><a href="https://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="https://profiles.wordpress.org/nacin">Andrew Nacin</a>, <a href="https://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="https://profiles.wordpress.org/boonebgorges">Boone Gorges</a>, <a href="https://profiles.wordpress.org/chriscct7">Chris Christoff</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/iseulde">Ella Iseulde Van Dorpe</a>, <a href="https://profiles.wordpress.org/gabrielperezs">Gabriel Pérez</a>, <a href="https://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="https://profiles.wordpress.org/mdawaffe">Mike Adams</a>, <a href="https://profiles.wordpress.org/miqrogroove">Robert Chapin</a>, <a href="https://profiles.wordpress.org/nbachiyski">Nikolay Bachiyski</a>, <a href="https://profiles.wordpress.org/magicroundabout">Ross Wintle</a> und <a href="https://profiles.wordpress.org/wonderboymusic">Scott Taylor</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:90:"https://de.wordpress.org/2015/07/23/wordpress-4-2-3-sicherheits-und-wartungs-release/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 4.3 Beta 4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"https://de.wordpress.org/2015/07/23/wordpress-4-3-beta-4/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:65:"https://de.wordpress.org/2015/07/23/wordpress-4-3-beta-4/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 23 Jul 2015 11:50:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Entwicklung";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://de.wordpress.org/?p=1150";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:395:"Gestern ist die nächste Beta-Version für WordPress 4.3 veröffentlicht worden und hat neben einigen Verbesserungen sogar noch eine kleine neue Funktion mitgebracht. In der neuen Beta wurden diverse Fehler in der Box für die Veröffentlichung eines Beitrags in der Bearbeitungsansicht behoben. Daneben haben sich die Entwickler um ein paar Sonderfälle beim Zählen der Wörter eines [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Florian Brinkmann";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3052:"<p>Gestern ist die nächste Beta-Version für WordPress 4.3 veröffentlicht worden und hat neben einigen Verbesserungen sogar noch eine kleine neue Funktion mitgebracht.</p>\n<p><span id="more-1150"></span></p>\n<p>In der neuen Beta wurden diverse Fehler in der Box für die Veröffentlichung eines Beitrags in der Bearbeitungsansicht behoben. Daneben haben sich die Entwickler um ein paar Sonderfälle beim Zählen der Wörter eines Artikels gekümmert.</p>\n<p>Als neue Funktion gibt es nun direkt im Customizer eine Vorschau für das Website-Icon. Die Funktion für das Festlegen eines Icons wurde aus den allgemeinen Einstellungen entfernt und ist damit nur noch über den Customizer zugänglich.</p>\n<figure id="attachment_1151" style="width: 339px" class="wp-caption aligncenter"><img src="https://de.wordpress.org/files/2015/07/site-icon-vorschau.png" alt="Beim Zuschneiden eines Site-Icons im Customizer bekommt ihr rechts eine Vorschau angezeigt." width="339" height="294" class="size-full wp-image-1151" srcset="https://de.wordpress.org/files/2015/07/site-icon-vorschau-300x260.png 300w, https://de.wordpress.org/files/2015/07/site-icon-vorschau.png 339w" sizes="(max-width: 339px) 100vw, 339px" /><figcaption class="wp-caption-text">Beim Zuschneiden eines Site-Icons im Customizer bekommt ihr rechts eine Vorschau angezeigt.</figcaption></figure>\n<p>Darüber hinaus wurden wieder einige Bugs behoben.</p>\n<p>Wenn ihr umfangreichere Infos über die Neuerungen von WordPress 4.3 haben möchtet, schaut euch die Artikel zu <a href="https://de.wordpress.org/2015/07/02/wordpress-4-3-beta-1/">Beta 1</a>, <a href="https://de.wordpress.org/2015/07/09/wordpress-4-3-beta-2/">Beta 2</a> und <a href="https://de.wordpress.org/2015/07/16/wordpress-4-3-beta-3/">Beta 3</a> an.</p>\n<p>Wenn ihr die Beta-Version testen möchtet, könnt ihr sie dir beispielsweise bequem über das <a href="https://wordpress.org/plugins/wordpress-beta-tester/">Beta-Tester-Plugin</a> installieren. Oder ihr ladet euch die <a href="https://wordpress.org/wordpress-4.3-beta4.zip">ZIP-Datei herunter</a>. Ihr solltet die Beta-Version nicht auf einer Live-Website einsetzen sondern nur in einer Testumgebung!</p>\n<p>Wenn ihr einen Fehler gefunden habt, könnt ihr den in dem <a href="https://wordpress.org/support/forum/alphabeta">Alpha/Beta-Bereich des Support-Forums melden</a>. Oder, wenn ihr damit vertraut seid einen Bug-Report zu schreiben, <a href="//core.trac.wordpress.org/">könnt ihr das im WordPress Trac machen</a>. Da könnt ihr auch <a href="//core.trac.wordpress.org/tickets/major">eine Liste aller bekannten Bugs</a> sowie <a href="//core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=4.3">alle behobenen Probleme finden</a>.</p>\n<p>Da in einer Beta-Version immer noch Sprach-Strings verändert werden können, kann es sein, dass die deutsche Übersetzung von WordPress 4.3 während der Beta-Phase noch Lücken aufweist. <a href="https://translate.wordpress.org/locale/de">Ihr könnt dabei helfen, sie komplett zu übersetzen</a>!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:62:"https://de.wordpress.org/2015/07/23/wordpress-4-3-beta-4/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:48:"\n		\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 4.3 Beta 3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"https://de.wordpress.org/2015/07/16/wordpress-4-3-beta-3/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:66:"https://de.wordpress.org/2015/07/16/wordpress-4-3-beta-3/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 16 Jul 2015 10:14:16 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:11:"Entwicklung";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:4:"Beta";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://de.wordpress.org/?p=1126";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:382:"Seit Kurzem ist die dritte Beta zu der neuen WordPress-Version 4.3 verfügbar. Sie bringt einige weitere kleine Verbesserungen sowie ein paar neue Features mit. In der neuen Beta wurde weiter am Menu Customizer geschraubt. Die Performance wurde gesteigert, es wurden Bugs behoben und visuelle Verbesserungen vorgenommen. Seit dieser Version ist im Customizer die Option zu [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Florian Brinkmann";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3304:"<p>Seit Kurzem ist die dritte Beta zu der neuen WordPress-Version 4.3 verfügbar. Sie bringt einige weitere kleine Verbesserungen sowie ein paar neue Features mit.</p>\n<p><span id="more-1126"></span></p>\n<p>In der neuen Beta wurde weiter am Menu Customizer geschraubt. Die Performance wurde gesteigert, es wurden Bugs behoben und visuelle Verbesserungen vorgenommen. Seit dieser Version ist im Customizer die Option zu finden , ein Icon für die Seite festzulegen. Dieses wird dann als Favicon und App-Icon genutzt. <strong>Dieses Feature muss noch getestet werden. Helft also mit und überprüft, ob es sowohl in den Einstellungen als auch im Customizer funktioniert</strong>!</p>\n<p>Des Weiteren wurden Verbesserungen beim Thema Passwörter vorgenommen. Bei der Installation einer WordPress-Site wird dem Admin von nun an ein starkes Passwort vorgeschlagen. <strong>Auch dieses neue Feature muss noch ausgiebig getestet werden</strong>. Außerdem wurden Verbesserungen bei der Zugänglichkeit von Kommentar- und Medien-Tabellen integriert. Nutzer von Screenreadern sind dazu aufgerufen, eventuell noch vorhandene Probleme zu melden. Daneben gab es viele Verbesserungen der Code-Dokumentation und verschiedene andere Bug-Fixes.</p>\n<p>Und zu guter Letzt ist es seit dieser Beta möglich, direkt über das Backend die formale „Sie“-Version des deutschen Sprachpakts zu installieren!</p>\n<blockquote class="twitter-tweet" width="550"><p lang="en" dir="ltr">HA! Formal German has landed in core! <a href="https://twitter.com/hashtag/wordpress?src=hash">#wordpress</a> <a href="https://twitter.com/hashtag/sitelanguage?src=hash">#sitelanguage</a> <a href="https://twitter.com/hashtag/polyglots?src=hash">#polyglots</a> <a href="http://t.co/WbiwYaKkwq">pic.twitter.com/WbiwYaKkwq</a></p>\n<p>&mdash; Caspar Hübinger (@glueckpress) <a href="https://twitter.com/glueckpress/status/620866636384309249">July 14, 2015</a></p></blockquote>\n<p><script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script></p>\n<p>Wenn ihr die Beta-Version testen möchtet, könnt ihr sie dir beispielsweise bequem über das <a href="https://wordpress.org/plugins/wordpress-beta-tester/">Beta-Tester-Plugin</a> installieren. Oder ihr ladet euch die <a href="https://wordpress.org/wordpress-4.3-beta3.zip">ZIP-Datei herunter</a>. Ihr solltet die Beta-Version nicht auf einer Live-Website einsetzen sondern nur in einer Testumgebung!</p>\n<p>Wenn ihr einen Fehler gefunden habt, könnt ihr den in dem <a href="https://wordpress.org/support/forum/alphabeta">Alpha/Beta-Bereich des Support-Forums melden</a>. Oder, wenn ihr damit vertraut seid einen Bug-Report zu schreiben, <a href="//core.trac.wordpress.org/”">könnt ihr das im WordPress Trac machen</a>. Da könnt ihr auch <a href="//core.trac.wordpress.org/tickets/major”">eine Liste aller bekannten Bugs</a> sowie <a href="//core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=4.3”">alle behobenen Probleme finden</a>.</p>\n<p>Da in einer Beta-Version immer noch Sprach-Strings verändert werden können, kann es sein, dass die deutsche Übersetzung von WordPress 4.3 während der Beta-Phase noch Lücken aufweist. <a href="https://translate.wordpress.org/locale/de">Ihr könnt dabei helfen, sie komplett zu übersetzen</a>!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:62:"https://de.wordpress.org/2015/07/16/wordpress-4-3-beta-3/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:48:"\n		\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 4.3 Beta 2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"https://de.wordpress.org/2015/07/09/wordpress-4-3-beta-2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:65:"https://de.wordpress.org/2015/07/09/wordpress-4-3-beta-2/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 09 Jul 2015 16:36:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:11:"Entwicklung";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:4:"Beta";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://de.wordpress.org/?p=1090";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:364:"Keine ganze Woche nach der ersten Beta-Version wurde gestern bereits die zweite Beta für WordPress 4.3 veröffentlicht. WordPress 4.3 lässt nicht mehr allzu lange auf sich warten, am 18. August soll es soweit sein. Was es für Neuerungen geben wird, beziehungsweise in den Beta-Versionen schon gibt, könnt ihr in dem Beitrag zur ersten Beta nachlesen. [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Florian Brinkmann";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1710:"<p>Keine ganze Woche nach der ersten Beta-Version wurde gestern bereits die zweite Beta für WordPress 4.3 veröffentlicht.<span id="more-1090"></span></p>\n<p>WordPress 4.3 lässt nicht mehr allzu lange auf sich warten, am 18. August soll es soweit sein. Was es für Neuerungen geben wird, beziehungsweise in den Beta-Versionen schon gibt, könnt ihr <a href="https://de.wordpress.org/2015/07/02/wordpress-4-3-beta-1/">in dem Beitrag zur ersten Beta nachlesen</a>.</p>\n<p>Im Vergleich zu Beta 1 wurden einige weitere Verbesserungen an dem Customizer vorgenommen sowie die Ansicht von Tabellenlisten in kleineren Viewports verbessert.</p>\n<p>Außerdem gibt es nun in der Admin-Toolbar einen direkten Link zum Customizer. Des Weiteren wurden viele Bugs behoben – fast 100 Änderungen sind in der letzten Woche vorgenommen worden. Genauere Informationen zu der zweiten Beta findet ihr <a href="https://wordpress.org/news/2015/07/wordpress-4-3-beta-2/">in dem Blogpost auf WordPress.org</a>.</p>\n<p>Wenn ihr die Beta-Version testen möchtet, könnt ihr sie dir beispielsweise bequem über das <a href="https://wordpress.org/plugins/wordpress-beta-tester/">Beta-Tester-Plugin</a> installieren. Oder ihr ladet euch die <a href="https://wordpress.org/wordpress-4.3-beta2.zip">ZIP-Datei herunter</a>. Ihr solltet die Beta-Version nicht auf einer Live-Website einsetzen sondern nur in einer Testumgebung!</p>\n<p>Da in einer Beta-Version immer noch Sprach-Strings verändert werden können, kann es sein, dass die deutsche Übersetzung von WordPress 4.3 während der Beta-Phase noch Lücken aufweist. <a href="https://translate.wordpress.org/languages/de">Ihr könnt dabei helfen, sie komplett zu übersetzen</a>!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:62:"https://de.wordpress.org/2015/07/09/wordpress-4-3-beta-2/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:47:"https://de.wordpress.org/category/release/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:8:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Sat, 24 Oct 2015 10:21:50 GMT";s:12:"content-type";s:34:"application/rss+xml; charset=UTF-8";s:10:"connection";s:5:"close";s:13:"last-modified";s:29:"Fri, 23 Oct 2015 09:23:53 GMT";s:4:"link";s:75:"<https://de.wordpress.org/wp-json/>; rel="https://github.com/WP-API/WP-API"";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 250";}s:5:"build";s:14:"20151024100836";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(851, '_transient_timeout_feed_mod_e5132d2944a7be60661ee809629a6d9c', '1445725311', 'no'),
(852, '_transient_feed_mod_e5132d2944a7be60661ee809629a6d9c', '1445682111', 'no'),
(853, '_transient_timeout_feed_96c7dc9bec0a68fc131c26d6c304d150', '1445725311', 'no'),
(854, '_transient_feed_96c7dc9bec0a68fc131c26d6c304d150', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:2:"\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:4:"0.92";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:37:"\n	\n	\n	\n	\n	\n	\n\n	\n\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:45:"Planet WordPress » Deutschsprachiger Channel";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:22:"http://planet.wpde.org";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:103:"Der Planet listet Inhalte ausgewählter Blogs auf, die regelmäßig Beiträge zu WordPress publizieren.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 23 Oct 2015 18:14:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"docs";a:1:{i:0;a:5:{s:4:"data";s:34:"http://backend.userland.com/rss092";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"de-DE";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:13:"\n		\n		\n		\n			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:27:"WordPress 4.4 Beta 1 ist da";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://de.wordpress.org/2015/10/23/wordpress-4-4-beta-1-ist-da/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:13:"\n		\n		\n		\n			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"WordPress: PHP-Code im Widget";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:61:"http://www.perun.net/2015/10/20/wordpress-php-code-im-widget/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:13:"\n		\n		\n		\n			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:48:"WordPress News #149 / Backups bei Amazon ablegen";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:32:"https://wpletter.de/archive/149/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:13:"\n		\n		\n		\n			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"WordPress: deutschsprachige Meetups";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"http://www.perun.net/2015/10/14/wordpress-deutschsprachige-meetups/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:13:"\n		\n		\n		\n			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:61:"Neu: Unser E-Book zu WooCommerce – Onlineshop mit WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"https://marketpress.de/2015/woocommerce-ebook/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:13:"\n		\n		\n		\n			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:56:"WordPress News #148 / Attacken auf XML-RPC Schnittstelle";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:32:"https://wpletter.de/archive/148/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:13:"\n		\n		\n		\n			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:49:"WordPress: Angaben im Header und Footer einfügen";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:81:"http://www.perun.net/2015/10/08/wordpress-angaben-im-header-und-footer-einfuegen/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:13:"\n		\n		\n		\n			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:49:"WordPress News #147 / Start in den Backup-Oktober";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:32:"https://wpletter.de/archive/147/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:13:"\n		\n		\n		\n			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:49:"WordPress News #146 / Child Themes aktuell halten";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:32:"https://wpletter.de/archive/146/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:13:"\n		\n		\n		\n			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:42:"WordPress News #145 / WordCamp Switzerland";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:32:"https://wpletter.de/archive/145/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}}}}}s:4:"type";i:8;s:7:"headers";a:10:{s:4:"date";s:29:"Sat, 24 Oct 2015 10:21:51 GMT";s:6:"server";s:6:"Apache";s:4:"vary";s:26:"Accept-Encoding,User-Agent";s:12:"x-powered-by";s:14:"PHP/5.5.21-pl0";s:10:"x-pingback";s:33:"http://planet.wpde.org/xmlrpc.php";s:13:"last-modified";s:29:"Fri, 23 Oct 2015 18:14:00 GMT";s:4:"etag";s:34:""85450ade084d31176afb15982ad5d1c8"";s:14:"content-length";s:4:"2377";s:10:"connection";s:5:"close";s:12:"content-type";s:34:"application/rss+xml; charset=UTF-8";}s:5:"build";s:14:"20151024100836";}', 'no'),
(855, '_transient_timeout_feed_mod_96c7dc9bec0a68fc131c26d6c304d150', '1445725311', 'no'),
(856, '_transient_feed_mod_96c7dc9bec0a68fc131c26d6c304d150', '1445682111', 'no'),
(857, '_transient_timeout_feed_b9388c83948825c1edaef0d856b7b109', '1445725312', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(858, '_transient_feed_b9388c83948825c1edaef0d856b7b109', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n	\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:117:"\n		\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"WordPress Plugins » View: Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"https://wordpress.org/plugins/browse/popular/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:34:"WordPress Plugins » View: Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 24 Oct 2015 10:00:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:30:{i:0;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:9:"Yoast SEO";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"https://wordpress.org/plugins/wordpress-seo/#post-8321";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 Jan 2009 20:34:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"8321@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:114:"Improve your WordPress SEO: Write better content and have a fully optimized WordPress site using Yoast SEO plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WP Super Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/wp-super-cache/#post-2572";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Nov 2007 11:40:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2572@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:73:"A very fast caching engine for WordPress that produces static html files.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Donncha O Caoimh";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"Wordfence Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wordfence/#post-29832";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 04 Sep 2011 03:13:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"29832@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:138:"The Wordfence WordPress security plugin provides free enterprise-class WordPress security, protecting your website from hacks and malware.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Wordfence";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Jetpack by WordPress.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://wordpress.org/plugins/jetpack/#post-23862";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Jan 2011 02:21:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"23862@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:28:"Your WordPress, Streamlined.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Tim Moore";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Regenerate Thumbnails";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"https://wordpress.org/plugins/regenerate-thumbnails/#post-6743";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 23 Aug 2008 14:38:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"6743@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:76:"Allows you to regenerate your thumbnails after changing the thumbnail sizes.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:25:"Alex Mills (Viper007Bond)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"NextGEN Gallery";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/nextgen-gallery/#post-1169";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Apr 2007 20:08:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"1169@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:121:"The most popular WordPress gallery plugin and one of the most popular plugins of all time with over 13 million downloads.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Alex Rabe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"TinyMCE Advanced";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"https://wordpress.org/plugins/tinymce-advanced/#post-2082";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 27 Jun 2007 15:00:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2082@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Enables the advanced features of TinyMCE, the WordPress WYSIWYG editor.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Andrew Ozz";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Google XML Sitemaps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/google-sitemap-generator/#post-132";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:31:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"132@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:105:"This plugin will generate a special XML sitemap which will help search engines to better index your blog.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Arne Brachhold";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"Google Analytics by Yoast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"https://wordpress.org/plugins/google-analytics-for-wordpress/#post-2316";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 14 Sep 2007 12:15:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2316@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:124:"Track your WordPress site easily with the latest tracking codes and lots added data for search result pages and error pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"All in One SEO Pack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/all-in-one-seo-pack/#post-753";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 30 Mar 2007 20:08:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"753@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:126:"All in One SEO Pack is a WordPress SEO plugin to automatically optimize your WordPress blog for Search Engines such as Google.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"uberdose";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Hello Dolly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/hello-dolly/#post-5790";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 29 May 2008 22:11:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"5790@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"This is not just a plugin, it symbolizes the hope and enthusiasm of an entire generation summed up in two words sung most famously by Louis Armstrong.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WordPress Importer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wordpress-importer/#post-18101";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 May 2010 17:42:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"18101@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:101:"Import posts, pages, comments, custom fields, categories, tags and more from a WordPress export file.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Brian Colinger";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Really Simple CAPTCHA";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"https://wordpress.org/plugins/really-simple-captcha/#post-9542";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 09 Mar 2009 02:17:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"9542@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:138:"Really Simple CAPTCHA is a CAPTCHA module intended to be called from other plugins. It is originally created for my Contact Form 7 plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WooCommerce - excelling eCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/woocommerce/#post-29860";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Sep 2011 08:13:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"29860@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:97:"WooCommerce is a powerful, extendable eCommerce plugin that helps you sell anything. Beautifully.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"WooThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"Advanced Custom Fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/advanced-custom-fields/#post-25254";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 17 Mar 2011 04:07:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"25254@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:68:"Customise WordPress with powerful, professional and intuitive fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"elliotcondon";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Contact Form 7";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/contact-form-7/#post-2141";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 02 Aug 2007 12:45:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2141@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:54:"Just another contact form plugin. Simple but flexible.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:16;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"W3 Total Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/w3-total-cache/#post-12073";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 29 Jul 2009 18:46:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"12073@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:132:"Easy Web Performance Optimization (WPO) using caching: browser, page, object, database, minify and content delivery network support.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Frederick Townes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:17;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Akismet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"https://wordpress.org/plugins/akismet/#post-15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:11:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"15@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:98:"Akismet checks your comments against the Akismet Web service to see if they look like spam or not.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:18;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"WP-PageNavi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wp-pagenavi/#post-363";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 23:17:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"363@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:49:"Adds a more advanced paging navigation interface.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Lester Chan";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:19;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Duplicate Post";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/duplicate-post/#post-2646";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 05 Dec 2007 17:40:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2646@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:22:"Clone posts and pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Lopo";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:20;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"Disable Comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wordpress.org/plugins/disable-comments/#post-26907";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 27 May 2011 04:42:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"26907@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:134:"Allows administrators to globally disable comments on their site. Comments can be disabled according to post type. Multisite friendly.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Samir Shah";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:21;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WP Multibyte Patch";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wp-multibyte-patch/#post-28395";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Jul 2011 12:22:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"28395@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Multibyte functionality enhancement for the WordPress Japanese package.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"plugin-master";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:22;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:27:"Black Studio TinyMCE Widget";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://wordpress.org/plugins/black-studio-tinymce-widget/#post-31973";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Nov 2011 15:06:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"31973@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:39:"The visual editor widget for Wordpress.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Marco Chiesi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:23;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:46:"iThemes Security (formerly Better WP Security)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/better-wp-security/#post-21738";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 22 Oct 2010 22:06:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"21738@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"Protect your WordPress site by hiding vital areas of your site, protecting access to important files, preventing brute-force login attempts, detecting";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Chris Wiegman";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:24;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Page Builder by SiteOrigin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/siteorigin-panels/#post-51888";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 11 Apr 2013 10:36:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"51888@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:111:"Build responsive page layouts using the widgets you know and love using this simple drag and drop page builder.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Greg Priday";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:25;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"Google Analytics Dashboard for WP";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"https://wordpress.org/plugins/google-analytics-dashboard-for-wp/#post-50539";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 10 Mar 2013 17:07:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"50539@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:127:"Displays Google Analytics reports in your WordPress Dashboard. Inserts the latest Google Analytics tracking code in your pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Alin Marcu";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:26;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Meta Slider";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/ml-slider/#post-49521";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Feb 2013 16:56:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"49521@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:145:"Easy to use WordPress slider plugin. Create SEO optimised responsive slideshows with Nivo Slider, Flex Slider, Coin Slider and Responsive Slides.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Matcha Labs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:27;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:10:"Duplicator";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/duplicator/#post-26607";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 16 May 2011 12:15:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"26607@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:88:"Duplicate, clone, backup, move and transfer an entire site from one location to another.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Cory Lamle";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:28;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"UpdraftPlus Backup and Restoration";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/updraftplus/#post-38058";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 21 May 2012 15:14:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"38058@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:148:"Backup and restoration made easy. Complete backups; manual or scheduled (backup to S3, Dropbox, Google Drive, Rackspace, FTP, SFTP, email + others).";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"David Anderson";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:29;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Clef Two-Factor Authentication";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"https://wordpress.org/plugins/wpclef/#post-47509";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 27 Dec 2012 01:25:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"47509@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:138:"Modern two-factor that people love to use: strong authentication without passwords or tokens; single sign on/off; magical user experience.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Dave Ross";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:46:"https://wordpress.org/plugins/rss/view/popular";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:12:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Sat, 24 Oct 2015 10:21:52 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:25:"strict-transport-security";s:11:"max-age=360";s:7:"expires";s:29:"Sat, 24 Oct 2015 10:35:57 GMT";s:13:"cache-control";s:0:"";s:6:"pragma";s:0:"";s:13:"last-modified";s:31:"Sat, 24 Oct 2015 10:00:57 +0000";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 250";}s:5:"build";s:14:"20151024100836";}', 'no'),
(859, '_transient_timeout_feed_mod_b9388c83948825c1edaef0d856b7b109', '1445725312', 'no'),
(860, '_transient_feed_mod_b9388c83948825c1edaef0d856b7b109', '1445682112', 'no'),
(861, '_transient_timeout_plugin_slugs', '1445773068', 'no'),
(862, '_transient_plugin_slugs', 'a:6:{i:0;s:19:"akismet/akismet.php";i:1;s:24:"buddypress/bp-loader.php";i:2;s:33:"events-manager/events-manager.php";i:3;s:9:"hello.php";i:4;s:17:"mycred/mycred.php";i:5;s:67:"social-networks-auto-poster-facebook-twitter-g/NextScripts_SNAP.php";}', 'no'),
(863, '_transient_timeout_dash_898c881de4a92ca37616885905bba3b7', '1445725312', 'no'),
(864, '_transient_dash_898c881de4a92ca37616885905bba3b7', '<div class="rss-widget"><ul><li><a class=''rsswidget'' href=''https://de.wordpress.org/2015/10/23/wordpress-4-4-beta-1-ist-da/''>WordPress 4.4 Beta 1 ist da</a> <span class="rss-date">23. Oktober 2015</span><div class="rssSummary">Die erste Beta-Version des 4.4-Release von WordPress ist verfügbar. Die neue Version bringt unter anderem das nächste Standard-Theme sowie die Unterstützung für Responsive Images mit. Die neue Version wird mit Twenty Sixteen ein neues Standard-Theme mitbringen. Ihr könnt es bereits im Directory herunterladen, es funktioniert aber nur mit 4.4-Entwicklerversionen – nicht mit WordPress 4.3. Ebenfalls [&hellip;]</div></li></ul></div><div class="rss-widget"><ul><li><a class=''rsswidget'' href=''https://de.wordpress.org/2015/10/23/wordpress-4-4-beta-1-ist-da/''>WordPress 4.4 Beta 1 ist da</a></li><li><a class=''rsswidget'' href=''http://www.perun.net/2015/10/20/wordpress-php-code-im-widget/''>WordPress: PHP-Code im Widget</a></li><li><a class=''rsswidget'' href=''https://wpletter.de/archive/149/''>WordPress News #149 / Backups bei Amazon ablegen</a></li></ul></div><div class="rss-widget"><ul><li class=''dashboard-news-plugin''><span>Beliebtes Plugin:</span> <a href=''https://wordpress.org/plugins/ml-slider/'' class=''dashboard-news-plugin-link''>Meta Slider</a>&nbsp;<span>(<a href=''plugin-install.php?tab=plugin-information&amp;plugin=ml-slider&amp;_wpnonce=10047f1ac4&amp;TB_iframe=true&amp;width=600&amp;height=800'' class=''thickbox'' title=''Meta Slider''>Installieren</a>)</span></li></ul></div>', 'no'),
(869, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:65:"https://downloads.wordpress.org/release/de_DE/wordpress-4.3.1.zip";s:6:"locale";s:5:"de_DE";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:65:"https://downloads.wordpress.org/release/de_DE/wordpress-4.3.1.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.3.1";s:7:"version";s:5:"4.3.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1445682256;s:15:"version_checked";s:5:"4.3.1";s:12:"translations";a:0:{}}', 'yes'),
(870, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1445686664;s:7:"checked";a:6:{s:19:"akismet/akismet.php";s:5:"3.1.5";s:24:"buddypress/bp-loader.php";s:5:"2.3.4";s:33:"events-manager/events-manager.php";s:5:"5.6.1";s:9:"hello.php";s:3:"1.6";s:17:"mycred/mycred.php";s:5:"1.6.6";s:67:"social-networks-auto-poster-facebook-twitter-g/NextScripts_SNAP.php";s:6:"3.4.26";}s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:6:{s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"3.1.5";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.3.1.5.zip";}s:24:"buddypress/bp-loader.php";O:8:"stdClass":7:{s:2:"id";s:4:"7756";s:4:"slug";s:10:"buddypress";s:6:"plugin";s:24:"buddypress/bp-loader.php";s:11:"new_version";s:5:"2.3.4";s:3:"url";s:41:"https://wordpress.org/plugins/buddypress/";s:7:"package";s:59:"https://downloads.wordpress.org/plugin/buddypress.2.3.4.zip";s:14:"upgrade_notice";s:57:"See: https://codex.buddypress.org/releases/version-2-3-4/";}s:33:"events-manager/events-manager.php";O:8:"stdClass":6:{s:2:"id";s:4:"4075";s:4:"slug";s:14:"events-manager";s:6:"plugin";s:33:"events-manager/events-manager.php";s:11:"new_version";s:5:"5.6.1";s:3:"url";s:45:"https://wordpress.org/plugins/events-manager/";s:7:"package";s:63:"https://downloads.wordpress.org/plugin/events-manager.5.6.1.zip";}s:9:"hello.php";O:8:"stdClass":6:{s:2:"id";s:4:"3564";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";}s:17:"mycred/mycred.php";O:8:"stdClass":7:{s:2:"id";s:5:"40289";s:4:"slug";s:6:"mycred";s:6:"plugin";s:17:"mycred/mycred.php";s:11:"new_version";s:5:"1.6.6";s:3:"url";s:37:"https://wordpress.org/plugins/mycred/";s:7:"package";s:55:"https://downloads.wordpress.org/plugin/mycred.1.6.6.zip";s:14:"upgrade_notice";s:19:"Critical bug fixes.";}s:67:"social-networks-auto-poster-facebook-twitter-g/NextScripts_SNAP.php";O:8:"stdClass":6:{s:2:"id";s:5:"29712";s:4:"slug";s:46:"social-networks-auto-poster-facebook-twitter-g";s:6:"plugin";s:67:"social-networks-auto-poster-facebook-twitter-g/NextScripts_SNAP.php";s:11:"new_version";s:6:"3.4.26";s:3:"url";s:77:"https://wordpress.org/plugins/social-networks-auto-poster-facebook-twitter-g/";s:7:"package";s:89:"https://downloads.wordpress.org/plugin/social-networks-auto-poster-facebook-twitter-g.zip";}}}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(871, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1445682257;s:7:"checked";a:4:{s:20:"firegento_stammtisch";s:5:"1.0.0";s:13:"twentyfifteen";s:3:"1.3";s:14:"twentyfourteen";s:3:"1.5";s:14:"twentythirteen";s:3:"1.6";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'yes'),
(875, 'rewrite_rules', 'a:152:{s:27:"events/(\\d{4}-\\d{2}-\\d{2})$";s:51:"index.php?pagename=events/&calendar_day=$matches[1]";s:13:"events/rss/?$";s:35:"index.php?post_type=event&feed=feed";s:14:"events/feed/?$";s:35:"index.php?post_type=event&feed=feed";s:19:"events/locations/?$";s:19:"index.php?page_id=5";s:20:"events/categories/?$";s:19:"index.php?page_id=6";s:14:"events/tags/?$";s:19:"index.php?page_id=7";s:21:"events/my-bookings/?$";s:19:"index.php?page_id=8";s:18:"events/event/(.+)$";s:63:"index.php?pagename=events/&em_redirect=1&event_slug=$matches[1]";s:21:"events/location/(.+)$";s:66:"index.php?pagename=events/&em_redirect=1&location_slug=$matches[1]";s:21:"events/category/(.+)$";s:66:"index.php?pagename=events/&em_redirect=1&category_slug=$matches[1]";s:9:"events/?$";s:25:"index.php?pagename=events";s:22:"events/([^/]+)/ical/?$";s:34:"index.php?event=$matches[1]&ical=1";s:25:"locations/([^/]+)/ical/?$";s:37:"index.php?location=$matches[1]&ical=1";s:33:"events/categories/([^/]+)/ical/?$";s:45:"index.php?event-categories=$matches[1]&ical=1";s:27:"events/tags/([^/]+)/ical/?$";s:39:"index.php?event-tags=$matches[1]&ical=1";s:24:"locations/([^/]+)/rss/?$";s:36:"index.php?location=$matches[1]&rss=1";s:12:"locations/?$";s:28:"index.php?post_type=location";s:42:"locations/feed/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?post_type=location&feed=$matches[1]";s:37:"locations/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?post_type=location&feed=$matches[1]";s:29:"locations/page/([0-9]{1,})/?$";s:46:"index.php?post_type=location&paged=$matches[1]";s:39:"events/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?post_type=event&feed=$matches[1]";s:34:"events/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?post_type=event&feed=$matches[1]";s:26:"events/page/([0-9]{1,})/?$";s:43:"index.php?post_type=event&paged=$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:52:"events/tags/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?event-tags=$matches[1]&feed=$matches[2]";s:47:"events/tags/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?event-tags=$matches[1]&feed=$matches[2]";s:40:"events/tags/([^/]+)/page/?([0-9]{1,})/?$";s:50:"index.php?event-tags=$matches[1]&paged=$matches[2]";s:22:"events/tags/([^/]+)/?$";s:32:"index.php?event-tags=$matches[1]";s:56:"events/categories/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:55:"index.php?event-categories=$matches[1]&feed=$matches[2]";s:51:"events/categories/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:55:"index.php?event-categories=$matches[1]&feed=$matches[2]";s:44:"events/categories/(.+?)/page/?([0-9]{1,})/?$";s:56:"index.php?event-categories=$matches[1]&paged=$matches[2]";s:26:"events/categories/(.+?)/?$";s:38:"index.php?event-categories=$matches[1]";s:37:"locations/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"locations/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:67:"locations/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"locations/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"locations/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"locations/([^/]+)/trackback/?$";s:35:"index.php?location=$matches[1]&tb=1";s:50:"locations/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?location=$matches[1]&feed=$matches[2]";s:45:"locations/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?location=$matches[1]&feed=$matches[2]";s:38:"locations/([^/]+)/page/?([0-9]{1,})/?$";s:48:"index.php?location=$matches[1]&paged=$matches[2]";s:45:"locations/([^/]+)/comment-page-([0-9]{1,})/?$";s:48:"index.php?location=$matches[1]&cpage=$matches[2]";s:30:"locations/([^/]+)(/[0-9]+)?/?$";s:47:"index.php?location=$matches[1]&page=$matches[2]";s:26:"locations/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:36:"locations/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:56:"locations/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"locations/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"locations/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:34:"events/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:44:"events/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:64:"events/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"events/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"events/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:27:"events/([^/]+)/trackback/?$";s:32:"index.php?event=$matches[1]&tb=1";s:47:"events/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?event=$matches[1]&feed=$matches[2]";s:42:"events/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?event=$matches[1]&feed=$matches[2]";s:35:"events/([^/]+)/page/?([0-9]{1,})/?$";s:45:"index.php?event=$matches[1]&paged=$matches[2]";s:42:"events/([^/]+)/comment-page-([0-9]{1,})/?$";s:45:"index.php?event=$matches[1]&cpage=$matches[2]";s:27:"events/([^/]+)(/[0-9]+)?/?$";s:44:"index.php?event=$matches[1]&page=$matches[2]";s:23:"events/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:33:"events/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:53:"events/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:48:"events/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:48:"events/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:44:"events-recurring/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:54:"events-recurring/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:74:"events-recurring/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:69:"events-recurring/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:69:"events-recurring/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:37:"events-recurring/([^/]+)/trackback/?$";s:42:"index.php?event-recurring=$matches[1]&tb=1";s:45:"events-recurring/([^/]+)/page/?([0-9]{1,})/?$";s:55:"index.php?event-recurring=$matches[1]&paged=$matches[2]";s:52:"events-recurring/([^/]+)/comment-page-([0-9]{1,})/?$";s:55:"index.php?event-recurring=$matches[1]&cpage=$matches[2]";s:37:"events-recurring/([^/]+)(/[0-9]+)?/?$";s:54:"index.php?event-recurring=$matches[1]&page=$matches[2]";s:33:"events-recurring/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:43:"events-recurring/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:63:"events-recurring/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"events-recurring/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"events-recurring/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:55:"bp_member_type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:53:"index.php?bp_member_type=$matches[1]&feed=$matches[2]";s:50:"bp_member_type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:53:"index.php?bp_member_type=$matches[1]&feed=$matches[2]";s:43:"bp_member_type/([^/]+)/page/?([0-9]{1,})/?$";s:54:"index.php?bp_member_type=$matches[1]&paged=$matches[2]";s:25:"bp_member_type/([^/]+)/?$";s:36:"index.php?bp_member_type=$matches[1]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:58:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:68:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:88:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1";s:77:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:65:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(/[0-9]+)?/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]";s:47:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]";s:51:"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:38:"([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes'),
(879, '_site_transient_timeout_browser_a3867c5757dc4b9c202e5a86d846c14f', '1446287461', 'yes'),
(880, '_site_transient_browser_a3867c5757dc4b9c202e5a86d846c14f', 'a:9:{s:8:"platform";s:9:"Macintosh";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"46.0.2490.80";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(881, '_site_transient_timeout_browser_e84f96126d2b7e6a88d15f3b973a3779', '1446287475', 'yes'),
(882, '_site_transient_browser_e84f96126d2b7e6a88d15f3b973a3779', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"46.0.2490.71";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(888, '_site_transient_timeout_available_translations', '1445697480', 'yes'),
(889, '_site_transient_available_translations', 'a:66:{s:2:"ar";a:8:{s:8:"language";s:2:"ar";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-18 00:32:07";s:12:"english_name";s:6:"Arabic";s:11:"native_name";s:14:"العربية";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/ar.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:2;s:3:"ara";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:3:"ary";a:8:{s:8:"language";s:3:"ary";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-20 07:06:05";s:12:"english_name";s:15:"Moroccan Arabic";s:11:"native_name";s:31:"العربية المغربية";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.3.1/ary.zip";s:3:"iso";a:2:{i:1;s:5:"ar_MA";i:3;s:3:"ary";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:2:"az";a:8:{s:8:"language";s:2:"az";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-22 14:16:17";s:12:"english_name";s:11:"Azerbaijani";s:11:"native_name";s:16:"Azərbaycan dili";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/az.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:2;s:3:"aze";}s:7:"strings";a:1:{s:8:"continue";s:5:"Davam";}}s:5:"bg_BG";a:8:{s:8:"language";s:5:"bg_BG";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-17 10:33:13";s:12:"english_name";s:9:"Bulgarian";s:11:"native_name";s:18:"Български";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/bg_BG.zip";s:3:"iso";a:2:{i:1;s:2:"bg";i:2;s:3:"bul";}s:7:"strings";a:1:{s:8:"continue";s:22:"Продължение";}}s:5:"bn_BD";a:8:{s:8:"language";s:5:"bn_BD";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-16 05:09:40";s:12:"english_name";s:7:"Bengali";s:11:"native_name";s:15:"বাংলা";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/bn_BD.zip";s:3:"iso";a:1:{i:1;s:2:"bn";}s:7:"strings";a:1:{s:8:"continue";s:23:"এগিয়ে চল.";}}s:5:"bs_BA";a:8:{s:8:"language";s:5:"bs_BA";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-18 21:20:44";s:12:"english_name";s:7:"Bosnian";s:11:"native_name";s:8:"Bosanski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/bs_BA.zip";s:3:"iso";a:2:{i:1;s:2:"bs";i:2;s:3:"bos";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:2:"ca";a:8:{s:8:"language";s:2:"ca";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-07 03:25:59";s:12:"english_name";s:7:"Catalan";s:11:"native_name";s:7:"Català";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/ca.zip";s:3:"iso";a:2:{i:1;s:2:"ca";i:2;s:3:"cat";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"cy";a:8:{s:8:"language";s:2:"cy";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-19 09:17:13";s:12:"english_name";s:5:"Welsh";s:11:"native_name";s:7:"Cymraeg";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/cy.zip";s:3:"iso";a:2:{i:1;s:2:"cy";i:2;s:3:"cym";}s:7:"strings";a:1:{s:8:"continue";s:6:"Parhau";}}s:5:"da_DK";a:8:{s:8:"language";s:5:"da_DK";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-18 19:34:34";s:12:"english_name";s:6:"Danish";s:11:"native_name";s:5:"Dansk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/da_DK.zip";s:3:"iso";a:2:{i:1;s:2:"da";i:2;s:3:"dan";}s:7:"strings";a:1:{s:8:"continue";s:12:"Forts&#230;t";}}s:12:"de_DE_formal";a:8:{s:8:"language";s:12:"de_DE_formal";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-14 15:24:20";s:12:"english_name";s:15:"German (Formal)";s:11:"native_name";s:13:"Deutsch (Sie)";s:7:"package";s:71:"https://downloads.wordpress.org/translation/core/4.3.1/de_DE_formal.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:5:"de_DE";a:8:{s:8:"language";s:5:"de_DE";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-30 07:30:55";s:12:"english_name";s:6:"German";s:11:"native_name";s:7:"Deutsch";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/de_DE.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:5:"de_CH";a:8:{s:8:"language";s:5:"de_CH";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-02 05:19:03";s:12:"english_name";s:20:"German (Switzerland)";s:11:"native_name";s:17:"Deutsch (Schweiz)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/de_CH.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:2:"el";a:8:{s:8:"language";s:2:"el";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-22 08:30:00";s:12:"english_name";s:5:"Greek";s:11:"native_name";s:16:"Ελληνικά";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/el.zip";s:3:"iso";a:2:{i:1;s:2:"el";i:2;s:3:"ell";}s:7:"strings";a:1:{s:8:"continue";s:16:"Συνέχεια";}}s:5:"en_GB";a:8:{s:8:"language";s:5:"en_GB";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-17 20:57:21";s:12:"english_name";s:12:"English (UK)";s:11:"native_name";s:12:"English (UK)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/en_GB.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_AU";a:8:{s:8:"language";s:5:"en_AU";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-13 23:56:05";s:12:"english_name";s:19:"English (Australia)";s:11:"native_name";s:19:"English (Australia)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/en_AU.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_CA";a:8:{s:8:"language";s:5:"en_CA";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-14 00:38:16";s:12:"english_name";s:16:"English (Canada)";s:11:"native_name";s:16:"English (Canada)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/en_CA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_NZ";a:8:{s:8:"language";s:5:"en_NZ";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-17 22:20:50";s:12:"english_name";s:21:"English (New Zealand)";s:11:"native_name";s:21:"English (New Zealand)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/en_NZ.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"eo";a:8:{s:8:"language";s:2:"eo";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-16 10:50:33";s:12:"english_name";s:9:"Esperanto";s:11:"native_name";s:9:"Esperanto";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/eo.zip";s:3:"iso";a:2:{i:1;s:2:"eo";i:2;s:3:"epo";}s:7:"strings";a:1:{s:8:"continue";s:8:"Daŭrigi";}}s:5:"es_PE";a:8:{s:8:"language";s:5:"es_PE";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-19 14:33:57";s:12:"english_name";s:14:"Spanish (Peru)";s:11:"native_name";s:17:"Español de Perú";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/es_PE.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CO";a:8:{s:8:"language";s:5:"es_CO";s:7:"version";s:6:"4.3-RC";s:7:"updated";s:19:"2015-08-04 06:10:33";s:12:"english_name";s:18:"Spanish (Colombia)";s:11:"native_name";s:20:"Español de Colombia";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/4.3-RC/es_CO.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_ES";a:8:{s:8:"language";s:5:"es_ES";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-26 22:31:40";s:12:"english_name";s:15:"Spanish (Spain)";s:11:"native_name";s:8:"Español";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/es_ES.zip";s:3:"iso";a:1:{i:1;s:2:"es";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CL";a:8:{s:8:"language";s:5:"es_CL";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-21 19:03:32";s:12:"english_name";s:15:"Spanish (Chile)";s:11:"native_name";s:17:"Español de Chile";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/es_CL.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_MX";a:8:{s:8:"language";s:5:"es_MX";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-30 19:20:19";s:12:"english_name";s:16:"Spanish (Mexico)";s:11:"native_name";s:19:"Español de México";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/es_MX.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"et";a:8:{s:8:"language";s:2:"et";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-05 16:34:02";s:12:"english_name";s:8:"Estonian";s:11:"native_name";s:5:"Eesti";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/et.zip";s:3:"iso";a:2:{i:1;s:2:"et";i:2;s:3:"est";}s:7:"strings";a:1:{s:8:"continue";s:6:"Jätka";}}s:2:"eu";a:8:{s:8:"language";s:2:"eu";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-12 17:21:08";s:12:"english_name";s:6:"Basque";s:11:"native_name";s:7:"Euskara";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/eu.zip";s:3:"iso";a:2:{i:1;s:2:"eu";i:2;s:3:"eus";}s:7:"strings";a:1:{s:8:"continue";s:8:"Jarraitu";}}s:5:"fa_IR";a:8:{s:8:"language";s:5:"fa_IR";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-20 13:36:08";s:12:"english_name";s:7:"Persian";s:11:"native_name";s:10:"فارسی";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/fa_IR.zip";s:3:"iso";a:2:{i:1;s:2:"fa";i:2;s:3:"fas";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:2:"fi";a:8:{s:8:"language";s:2:"fi";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-15 15:41:04";s:12:"english_name";s:7:"Finnish";s:11:"native_name";s:5:"Suomi";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/fi.zip";s:3:"iso";a:2:{i:1;s:2:"fi";i:2;s:3:"fin";}s:7:"strings";a:1:{s:8:"continue";s:5:"Jatka";}}s:5:"fr_BE";a:8:{s:8:"language";s:5:"fr_BE";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-06 20:37:24";s:12:"english_name";s:16:"French (Belgium)";s:11:"native_name";s:21:"Français de Belgique";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/fr_BE.zip";s:3:"iso";a:2:{i:1;s:2:"fr";i:2;s:3:"fra";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:5:"fr_FR";a:8:{s:8:"language";s:5:"fr_FR";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-14 11:44:29";s:12:"english_name";s:15:"French (France)";s:11:"native_name";s:9:"Français";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/fr_FR.zip";s:3:"iso";a:1:{i:1;s:2:"fr";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:2:"gd";a:8:{s:8:"language";s:2:"gd";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-24 15:25:30";s:12:"english_name";s:15:"Scottish Gaelic";s:11:"native_name";s:9:"Gàidhlig";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/gd.zip";s:3:"iso";a:3:{i:1;s:2:"gd";i:2;s:3:"gla";i:3;s:3:"gla";}s:7:"strings";a:1:{s:8:"continue";s:15:"Lean air adhart";}}s:5:"gl_ES";a:8:{s:8:"language";s:5:"gl_ES";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-18 23:34:00";s:12:"english_name";s:8:"Galician";s:11:"native_name";s:6:"Galego";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/gl_ES.zip";s:3:"iso";a:2:{i:1;s:2:"gl";i:2;s:3:"glg";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:3:"haz";a:8:{s:8:"language";s:3:"haz";s:7:"version";s:5:"4.1.8";s:7:"updated";s:19:"2015-03-26 15:20:27";s:12:"english_name";s:8:"Hazaragi";s:11:"native_name";s:15:"هزاره گی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1.8/haz.zip";s:3:"iso";a:1:{i:3;s:3:"haz";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:5:"he_IL";a:8:{s:8:"language";s:5:"he_IL";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-22 08:59:41";s:12:"english_name";s:6:"Hebrew";s:11:"native_name";s:16:"עִבְרִית";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/he_IL.zip";s:3:"iso";a:1:{i:1;s:2:"he";}s:7:"strings";a:1:{s:8:"continue";s:12:"להמשיך";}}s:2:"hr";a:8:{s:8:"language";s:2:"hr";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-01 20:42:02";s:12:"english_name";s:8:"Croatian";s:11:"native_name";s:8:"Hrvatski";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/hr.zip";s:3:"iso";a:2:{i:1;s:2:"hr";i:2;s:3:"hrv";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:5:"hu_HU";a:8:{s:8:"language";s:5:"hu_HU";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-23 07:34:16";s:12:"english_name";s:9:"Hungarian";s:11:"native_name";s:6:"Magyar";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/hu_HU.zip";s:3:"iso";a:2:{i:1;s:2:"hu";i:2;s:3:"hun";}s:7:"strings";a:1:{s:8:"continue";s:7:"Tovább";}}s:2:"hy";a:8:{s:8:"language";s:2:"hy";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-17 13:36:47";s:12:"english_name";s:8:"Armenian";s:11:"native_name";s:14:"Հայերեն";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/hy.zip";s:3:"iso";a:2:{i:1;s:2:"hy";i:2;s:3:"hye";}s:7:"strings";a:1:{s:8:"continue";s:20:"Շարունակել";}}s:5:"id_ID";a:8:{s:8:"language";s:5:"id_ID";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-08 17:47:38";s:12:"english_name";s:10:"Indonesian";s:11:"native_name";s:16:"Bahasa Indonesia";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/id_ID.zip";s:3:"iso";a:2:{i:1;s:2:"id";i:2;s:3:"ind";}s:7:"strings";a:1:{s:8:"continue";s:9:"Lanjutkan";}}s:5:"is_IS";a:8:{s:8:"language";s:5:"is_IS";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-22 13:47:37";s:12:"english_name";s:9:"Icelandic";s:11:"native_name";s:9:"Íslenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/is_IS.zip";s:3:"iso";a:2:{i:1;s:2:"is";i:2;s:3:"isl";}s:7:"strings";a:1:{s:8:"continue";s:6:"Áfram";}}s:5:"it_IT";a:8:{s:8:"language";s:5:"it_IT";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-06 06:16:37";s:12:"english_name";s:7:"Italian";s:11:"native_name";s:8:"Italiano";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/it_IT.zip";s:3:"iso";a:2:{i:1;s:2:"it";i:2;s:3:"ita";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"ja";a:8:{s:8:"language";s:2:"ja";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-30 16:23:05";s:12:"english_name";s:8:"Japanese";s:11:"native_name";s:9:"日本語";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/ja.zip";s:3:"iso";a:1:{i:1;s:2:"ja";}s:7:"strings";a:1:{s:8:"continue";s:9:"続ける";}}s:5:"ko_KR";a:8:{s:8:"language";s:5:"ko_KR";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-13 04:26:36";s:12:"english_name";s:6:"Korean";s:11:"native_name";s:9:"한국어";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/ko_KR.zip";s:3:"iso";a:2:{i:1;s:2:"ko";i:2;s:3:"kor";}s:7:"strings";a:1:{s:8:"continue";s:6:"계속";}}s:5:"lt_LT";a:8:{s:8:"language";s:5:"lt_LT";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-18 07:48:28";s:12:"english_name";s:10:"Lithuanian";s:11:"native_name";s:15:"Lietuvių kalba";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/lt_LT.zip";s:3:"iso";a:2:{i:1;s:2:"lt";i:2;s:3:"lit";}s:7:"strings";a:1:{s:8:"continue";s:6:"Tęsti";}}s:5:"my_MM";a:8:{s:8:"language";s:5:"my_MM";s:7:"version";s:5:"4.1.8";s:7:"updated";s:19:"2015-03-26 15:57:42";s:12:"english_name";s:17:"Myanmar (Burmese)";s:11:"native_name";s:15:"ဗမာစာ";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.8/my_MM.zip";s:3:"iso";a:2:{i:1;s:2:"my";i:2;s:3:"mya";}s:7:"strings";a:1:{s:8:"continue";s:54:"ဆက်လက်လုပ်ေဆာင်ပါ။";}}s:5:"nb_NO";a:8:{s:8:"language";s:5:"nb_NO";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-23 10:49:34";s:12:"english_name";s:19:"Norwegian (Bokmål)";s:11:"native_name";s:13:"Norsk bokmål";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/nb_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nb";i:2;s:3:"nob";}s:7:"strings";a:1:{s:8:"continue";s:8:"Fortsett";}}s:5:"nl_NL";a:8:{s:8:"language";s:5:"nl_NL";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-14 19:32:52";s:12:"english_name";s:5:"Dutch";s:11:"native_name";s:10:"Nederlands";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/nl_NL.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nn_NO";a:8:{s:8:"language";s:5:"nn_NO";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-17 18:56:13";s:12:"english_name";s:19:"Norwegian (Nynorsk)";s:11:"native_name";s:13:"Norsk nynorsk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/nn_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nn";i:2;s:3:"nno";}s:7:"strings";a:1:{s:8:"continue";s:9:"Hald fram";}}s:3:"oci";a:8:{s:8:"language";s:3:"oci";s:7:"version";s:6:"4.3-RC";s:7:"updated";s:19:"2015-08-02 07:53:33";s:12:"english_name";s:7:"Occitan";s:11:"native_name";s:7:"Occitan";s:7:"package";s:63:"https://downloads.wordpress.org/translation/core/4.3-RC/oci.zip";s:3:"iso";a:2:{i:1;s:2:"oc";i:2;s:3:"oci";}s:7:"strings";a:1:{s:8:"continue";s:9:"Contunhar";}}s:5:"pl_PL";a:8:{s:8:"language";s:5:"pl_PL";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-27 13:38:57";s:12:"english_name";s:6:"Polish";s:11:"native_name";s:6:"Polski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/pl_PL.zip";s:3:"iso";a:2:{i:1;s:2:"pl";i:2;s:3:"pol";}s:7:"strings";a:1:{s:8:"continue";s:9:"Kontynuuj";}}s:2:"ps";a:8:{s:8:"language";s:2:"ps";s:7:"version";s:5:"4.1.8";s:7:"updated";s:19:"2015-03-29 22:19:48";s:12:"english_name";s:6:"Pashto";s:11:"native_name";s:8:"پښتو";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.8/ps.zip";s:3:"iso";a:2:{i:1;s:2:"ps";i:2;s:3:"pus";}s:7:"strings";a:1:{s:8:"continue";s:8:"دوام";}}s:5:"pt_BR";a:8:{s:8:"language";s:5:"pt_BR";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-16 14:15:14";s:12:"english_name";s:19:"Portuguese (Brazil)";s:11:"native_name";s:20:"Português do Brasil";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/pt_BR.zip";s:3:"iso";a:2:{i:1;s:2:"pt";i:2;s:3:"por";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"pt_PT";a:8:{s:8:"language";s:5:"pt_PT";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-16 17:39:04";s:12:"english_name";s:21:"Portuguese (Portugal)";s:11:"native_name";s:10:"Português";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/pt_PT.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"ro_RO";a:8:{s:8:"language";s:5:"ro_RO";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-18 16:44:05";s:12:"english_name";s:8:"Romanian";s:11:"native_name";s:8:"Română";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/ro_RO.zip";s:3:"iso";a:2:{i:1;s:2:"ro";i:2;s:3:"ron";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuă";}}s:5:"ru_RU";a:8:{s:8:"language";s:5:"ru_RU";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-03 10:08:50";s:12:"english_name";s:7:"Russian";s:11:"native_name";s:14:"Русский";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/ru_RU.zip";s:3:"iso";a:2:{i:1;s:2:"ru";i:2;s:3:"rus";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продолжить";}}s:5:"sk_SK";a:8:{s:8:"language";s:5:"sk_SK";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-20 09:27:40";s:12:"english_name";s:6:"Slovak";s:11:"native_name";s:11:"Slovenčina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/sk_SK.zip";s:3:"iso";a:2:{i:1;s:2:"sk";i:2;s:3:"slk";}s:7:"strings";a:1:{s:8:"continue";s:12:"Pokračovať";}}s:5:"sl_SI";a:8:{s:8:"language";s:5:"sl_SI";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-06 16:10:24";s:12:"english_name";s:9:"Slovenian";s:11:"native_name";s:13:"Slovenščina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/sl_SI.zip";s:3:"iso";a:2:{i:1;s:2:"sl";i:2;s:3:"slv";}s:7:"strings";a:1:{s:8:"continue";s:10:"Nadaljujte";}}s:2:"sq";a:8:{s:8:"language";s:2:"sq";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-18 17:16:31";s:12:"english_name";s:8:"Albanian";s:11:"native_name";s:5:"Shqip";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/sq.zip";s:3:"iso";a:2:{i:1;s:2:"sq";i:2;s:3:"sqi";}s:7:"strings";a:1:{s:8:"continue";s:6:"Vazhdo";}}s:5:"sr_RS";a:8:{s:8:"language";s:5:"sr_RS";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-17 18:31:56";s:12:"english_name";s:7:"Serbian";s:11:"native_name";s:23:"Српски језик";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/sr_RS.zip";s:3:"iso";a:2:{i:1;s:2:"sr";i:2;s:3:"srp";}s:7:"strings";a:1:{s:8:"continue";s:14:"Настави";}}s:5:"sv_SE";a:8:{s:8:"language";s:5:"sv_SE";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-19 10:43:45";s:12:"english_name";s:7:"Swedish";s:11:"native_name";s:7:"Svenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/sv_SE.zip";s:3:"iso";a:2:{i:1;s:2:"sv";i:2;s:3:"swe";}s:7:"strings";a:1:{s:8:"continue";s:9:"Fortsätt";}}s:2:"th";a:8:{s:8:"language";s:2:"th";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-19 16:06:20";s:12:"english_name";s:4:"Thai";s:11:"native_name";s:9:"ไทย";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/th.zip";s:3:"iso";a:2:{i:1;s:2:"th";i:2;s:3:"tha";}s:7:"strings";a:1:{s:8:"continue";s:15:"ต่อไป";}}s:2:"tl";a:8:{s:8:"language";s:2:"tl";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-20 03:52:15";s:12:"english_name";s:7:"Tagalog";s:11:"native_name";s:7:"Tagalog";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/tl.zip";s:3:"iso";a:2:{i:1;s:2:"tl";i:2;s:3:"tgl";}s:7:"strings";a:1:{s:8:"continue";s:10:"Magpatuloy";}}s:5:"tr_TR";a:8:{s:8:"language";s:5:"tr_TR";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-19 13:55:59";s:12:"english_name";s:7:"Turkish";s:11:"native_name";s:8:"Türkçe";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/tr_TR.zip";s:3:"iso";a:2:{i:1;s:2:"tr";i:2;s:3:"tur";}s:7:"strings";a:1:{s:8:"continue";s:5:"Devam";}}s:5:"ug_CN";a:8:{s:8:"language";s:5:"ug_CN";s:7:"version";s:5:"4.1.8";s:7:"updated";s:19:"2015-03-26 16:45:38";s:12:"english_name";s:6:"Uighur";s:11:"native_name";s:9:"Uyƣurqə";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.8/ug_CN.zip";s:3:"iso";a:2:{i:1;s:2:"ug";i:2;s:3:"uig";}s:7:"strings";a:1:{s:8:"continue";s:26:"داۋاملاشتۇرۇش";}}s:2:"uk";a:8:{s:8:"language";s:2:"uk";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-08 09:34:14";s:12:"english_name";s:9:"Ukrainian";s:11:"native_name";s:20:"Українська";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/uk.zip";s:3:"iso";a:2:{i:1;s:2:"uk";i:2;s:3:"ukr";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продовжити";}}s:2:"vi";a:8:{s:8:"language";s:2:"vi";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-23 15:20:41";s:12:"english_name";s:10:"Vietnamese";s:11:"native_name";s:14:"Tiếng Việt";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/vi.zip";s:3:"iso";a:2:{i:1;s:2:"vi";i:2;s:3:"vie";}s:7:"strings";a:1:{s:8:"continue";s:12:"Tiếp tục";}}s:5:"zh_TW";a:8:{s:8:"language";s:5:"zh_TW";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-21 11:18:12";s:12:"english_name";s:16:"Chinese (Taiwan)";s:11:"native_name";s:12:"繁體中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/zh_TW.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}s:5:"zh_CN";a:8:{s:8:"language";s:5:"zh_CN";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-20 19:10:20";s:12:"english_name";s:15:"Chinese (China)";s:11:"native_name";s:12:"简体中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/zh_CN.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"继续";}}}', 'yes');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=561 ;

--
-- Daten für Tabelle `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 9, '_menu_item_type', 'post_type'),
(3, 9, '_menu_item_menu_item_parent', '0'),
(4, 9, '_menu_item_object_id', '4'),
(5, 9, '_menu_item_object', 'page'),
(6, 9, '_menu_item_target', ''),
(7, 9, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(8, 9, '_menu_item_xfn', ''),
(9, 9, '_menu_item_url', ''),
(11, 10, '_menu_item_type', 'post_type'),
(12, 10, '_menu_item_menu_item_parent', '0'),
(13, 10, '_menu_item_object_id', '6'),
(14, 10, '_menu_item_object', 'page'),
(15, 10, '_menu_item_target', ''),
(16, 10, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(17, 10, '_menu_item_xfn', ''),
(18, 10, '_menu_item_url', ''),
(31, 13, '_location_id', '1'),
(32, 13, '_blog_id', ''),
(33, 13, '_location_address', 'Mattentwiete 8'),
(34, 13, '_location_town', 'Hamburg'),
(35, 13, '_location_state', ''),
(36, 13, '_location_postcode', '20457'),
(37, 13, '_location_region', ''),
(38, 13, '_location_country', 'DE'),
(39, 13, '_location_latitude', '53.54515'),
(40, 13, '_location_longitude', '9.98879999999997'),
(41, 13, '_location_status', '1'),
(70, 13, '_edit_lock', '1431176258:1'),
(71, 13, '_edit_last', '1'),
(88, 17, '_edit_last', '1'),
(89, 17, '_edit_lock', '1431176296:1'),
(94, 13, '_snap_forceSURL', '2'),
(95, 13, 'snap_MYURL', ''),
(96, 13, 'snapEdIT', '1'),
(97, 13, 'snapTW', 's:145:"a:1:{i:0;a:5:{s:4:"doTW";s:1:"1";s:10:"SNAPformat";s:15:"%TITLE% - %URL%";s:8:"attchImg";s:1:"0";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";}}";'),
(98, 18, '_edit_last', '1'),
(99, 18, '_edit_lock', '1431180044:1'),
(104, 18, '_event_id', '2'),
(105, 18, '_event_start_time', '19:00:00'),
(106, 18, '_event_end_time', '22:00:00'),
(107, 18, '_event_all_day', '0'),
(108, 18, '_event_start_date', '2015-06-24'),
(109, 18, '_event_end_date', '2015-06-24'),
(110, 18, '_event_rsvp', '0'),
(111, 18, '_event_rsvp_date', ''),
(112, 18, '_event_rsvp_time', '00:00:00'),
(113, 18, '_event_rsvp_spaces', ''),
(114, 18, '_event_spaces', ''),
(115, 18, '_location_id', '1'),
(116, 18, '_recurrence_id', ''),
(117, 18, '_event_status', '1'),
(118, 18, '_event_private', '0'),
(119, 18, '_event_date_created', ''),
(120, 18, '_event_date_modified', ''),
(121, 18, '_blog_id', ''),
(122, 18, '_group_id', '0'),
(123, 18, '_recurrence', '0'),
(124, 18, '_recurrence_interval', ''),
(125, 18, '_recurrence_freq', ''),
(126, 18, '_recurrence_days', '0'),
(127, 18, '_recurrence_byday', ''),
(128, 18, '_recurrence_byweekno', ''),
(129, 18, '_recurrence_rsvp_days', ''),
(130, 18, '_start_ts', '1435172400'),
(131, 18, '_end_ts', '1435183200'),
(140, 18, 'snap_isAutoPosted', '1'),
(141, 18, '_nxs_snap_sh_TW0_1431176609', 'a:37:{s:4:"doTW";i:1;s:5:"nName";s:14:"MagentoHamburg";s:5:"twURL";s:35:"https://twitter.com/MagentoHamburg/";s:9:"twConsKey";s:25:"Xx1Hpt7czTS21KxFiNv8KnRGN";s:9:"twConsSec";s:50:"XZ6rDVuaT4GT1JEfSEgwHC0bxvpRelsg1p1kTBE2TfZxmrOP8Q";s:10:"twAccToken";s:50:"191758166-F3v98X9BfyX8PXB9O5swZnfrhBRzVauNo7NeyHIr";s:6:"catSel";s:1:"0";s:8:"catSelEd";s:0:"";s:10:"riComments";i:0;s:11:"riCommentsM";i:0;s:12:"riCommentsAA";i:0;s:8:"rpstDays";s:1:"0";s:7:"rpstHrs";s:1:"0";s:8:"rpstMins";s:1:"0";s:6:"rpstOn";i:0;s:8:"rpstStop";s:1:"O";s:11:"rpstOnlyPUP";i:0;s:7:"fltrsOn";i:0;s:11:"rpstBtwDays";a:0:{}s:13:"twAccTokenSec";s:45:"VoZdPwPy2RjPE7tLGK7DE9Nvmq00bKoln0ccK5Igai3qO";s:11:"twMsgFormat";s:15:"%TITLE% - %URL%";s:8:"attchImg";i:0;s:11:"rpstRndMins";i:0;s:12:"rpstPostIncl";s:1:"0";s:8:"rpstType";s:1:"2";s:12:"rpstTimeType";s:1:"A";s:12:"rpstFromTime";s:0:"";s:10:"rpstToTime";s:0:"";s:10:"rpstOLDays";s:2:"30";s:10:"rpstNWDays";s:3:"365";s:10:"nxsCPTSeld";s:21:"a:1:{i:0;s:4:"post";}";s:7:"tagsSel";s:0:"";s:8:"tagsSelX";s:0:"";s:8:"isPosted";s:0:"";s:8:"imgToUse";b:0;s:2:"ii";i:0;s:9:"timeToRun";i:1431176609;}'),
(152, 20, '_edit_last', '1'),
(153, 20, '_edit_lock', '1431182041:1'),
(184, 6, '_edit_lock', '1445686660:1'),
(185, 6, '_edit_last', '1'),
(186, 4, '_edit_lock', '1445686457:1'),
(187, 4, '_edit_last', '1'),
(192, 26, '_edit_last', '1'),
(193, 26, '_edit_lock', '1431179970:1'),
(198, 26, 'snap_isAutoPosted', '1'),
(199, 26, '_nxs_snap_sh_TW0_1431180111', 'a:37:{s:4:"doTW";i:1;s:5:"nName";s:14:"MagentoHamburg";s:5:"twURL";s:35:"https://twitter.com/MagentoHamburg/";s:9:"twConsKey";s:25:"Xx1Hpt7czTS21KxFiNv8KnRGN";s:9:"twConsSec";s:50:"XZ6rDVuaT4GT1JEfSEgwHC0bxvpRelsg1p1kTBE2TfZxmrOP8Q";s:10:"twAccToken";s:50:"191758166-F3v98X9BfyX8PXB9O5swZnfrhBRzVauNo7NeyHIr";s:6:"catSel";s:1:"0";s:8:"catSelEd";s:0:"";s:10:"riComments";i:0;s:11:"riCommentsM";i:0;s:12:"riCommentsAA";i:0;s:8:"rpstDays";s:1:"0";s:7:"rpstHrs";s:1:"0";s:8:"rpstMins";s:1:"0";s:6:"rpstOn";i:0;s:8:"rpstStop";s:1:"O";s:11:"rpstOnlyPUP";i:0;s:7:"fltrsOn";i:0;s:11:"rpstBtwDays";a:0:{}s:13:"twAccTokenSec";s:45:"VoZdPwPy2RjPE7tLGK7DE9Nvmq00bKoln0ccK5Igai3qO";s:11:"twMsgFormat";s:15:"%TITLE% - %URL%";s:8:"attchImg";i:0;s:11:"rpstRndMins";i:0;s:12:"rpstPostIncl";s:1:"0";s:8:"rpstType";s:1:"2";s:12:"rpstTimeType";s:1:"A";s:12:"rpstFromTime";s:0:"";s:10:"rpstToTime";s:0:"";s:10:"rpstOLDays";s:2:"30";s:10:"rpstNWDays";s:3:"365";s:10:"nxsCPTSeld";s:21:"a:1:{i:0;s:4:"post";}";s:7:"tagsSel";s:0:"";s:8:"tagsSelX";s:0:"";s:8:"isPosted";s:0:"";s:8:"imgToUse";b:0;s:2:"ii";i:0;s:9:"timeToRun";i:1431180111;}'),
(204, 26, '_event_id', '4'),
(205, 26, '_event_start_time', '18:30:00'),
(206, 26, '_event_end_time', '20:00:00'),
(207, 26, '_event_all_day', '0'),
(208, 26, '_event_start_date', '2015-05-20'),
(209, 26, '_event_end_date', '2015-05-20'),
(210, 26, '_event_rsvp', '0'),
(211, 26, '_event_rsvp_date', ''),
(212, 26, '_event_rsvp_time', '00:00:00'),
(213, 26, '_event_rsvp_spaces', ''),
(214, 26, '_event_spaces', ''),
(215, 26, '_location_id', '0'),
(216, 26, '_recurrence_id', ''),
(217, 26, '_event_status', '1'),
(218, 26, '_event_private', '0'),
(219, 26, '_event_date_created', ''),
(220, 26, '_event_date_modified', ''),
(221, 26, '_blog_id', ''),
(222, 26, '_group_id', '0'),
(223, 26, '_recurrence', '0'),
(224, 26, '_recurrence_interval', ''),
(225, 26, '_recurrence_freq', ''),
(226, 26, '_recurrence_days', '0'),
(227, 26, '_recurrence_byday', ''),
(228, 26, '_recurrence_byweekno', ''),
(229, 26, '_recurrence_rsvp_days', ''),
(230, 26, '_start_ts', '1432146600'),
(231, 26, '_end_ts', '1432152000'),
(232, 26, '_snap_forceSURL', '2'),
(233, 26, 'snap_MYURL', ''),
(234, 26, 'snapEdIT', '1'),
(237, 26, 'snapTW', 's:271:"a:1:{i:0;a:9:{s:4:"doTW";s:1:"1";s:10:"SNAPformat";s:15:"%TITLE% - %URL%";s:8:"attchImg";s:1:"0";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:11:"isPrePosted";s:1:"1";s:8:"isPosted";s:1:"1";s:4:"pgID";s:18:"597038788058177536";s:5:"pDate";s:19:"2015-05-09 14:01:54";}}";'),
(242, 18, '_snap_forceSURL', '2'),
(243, 18, 'snap_MYURL', ''),
(244, 18, 'snapEdIT', '1'),
(245, 18, 'snapTW', 's:145:"a:1:{i:0;a:5:{s:4:"doTW";s:1:"1";s:10:"SNAPformat";s:15:"%TITLE% - %URL%";s:8:"attchImg";s:1:"0";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";}}";'),
(246, 27, '_edit_last', '1'),
(247, 27, '_edit_lock', '1431180554:1'),
(252, 27, 'snap_isAutoPosted', '1'),
(253, 27, '_snap_forceSURL', '2'),
(255, 27, 'snapEdIT', '1'),
(256, 27, 'snapTW', 's:150:"s:141:"a:1:{i:0;a:5:{s:10:"SNAPformat";s:15:"%TITLE% - %URL%";s:8:"attchImg";s:1:"0";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:4:"doTW";i:0;}}";";'),
(261, 28, 'snap_isAutoPosted', '1'),
(262, 28, '_snap_forceSURL', '2'),
(263, 28, 'snap_MYURL', ''),
(264, 28, 'snapEdIT', '1'),
(265, 28, 'snapTW', 's:141:"a:1:{i:0;a:5:{s:10:"SNAPformat";s:15:"%TITLE% - %URL%";s:8:"attchImg";s:1:"0";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:4:"doTW";i:0;}}";'),
(266, 28, '_location_id', '2'),
(267, 28, '_blog_id', ''),
(268, 28, '_location_address', 'Frauentormauer 18'),
(269, 28, '_location_town', 'Nürnberg'),
(270, 28, '_location_state', ''),
(271, 28, '_location_postcode', '90402'),
(272, 28, '_location_region', ''),
(273, 28, '_location_country', 'DE'),
(274, 28, '_location_latitude', '49.4470491'),
(275, 28, '_location_longitude', '11.078499999999963'),
(276, 28, '_location_status', '1'),
(277, 27, '_event_id', '5'),
(278, 27, '_event_start_time', '19:30:00'),
(279, 27, '_event_end_time', '22:00:00'),
(280, 27, '_event_all_day', '0'),
(281, 27, '_event_start_date', '2015-05-21'),
(282, 27, '_event_end_date', '2015-05-21'),
(283, 27, '_event_rsvp', '0'),
(284, 27, '_event_rsvp_date', ''),
(285, 27, '_event_rsvp_time', '00:00:00'),
(286, 27, '_event_rsvp_spaces', ''),
(287, 27, '_event_spaces', ''),
(288, 27, '_location_id', '2'),
(289, 27, '_recurrence_id', ''),
(290, 27, '_event_status', '1'),
(291, 27, '_event_private', '0'),
(292, 27, '_event_date_created', ''),
(293, 27, '_event_date_modified', ''),
(294, 27, '_blog_id', ''),
(295, 27, '_group_id', '0'),
(296, 27, '_recurrence', '0'),
(297, 27, '_recurrence_interval', ''),
(298, 27, '_recurrence_freq', ''),
(299, 27, '_recurrence_days', '0'),
(300, 27, '_recurrence_byday', ''),
(301, 27, '_recurrence_byweekno', ''),
(302, 27, '_recurrence_rsvp_days', ''),
(303, 27, '_start_ts', '1432236600'),
(304, 27, '_end_ts', '1432245600'),
(305, 29, '_edit_last', '1'),
(306, 29, '_edit_lock', '1431181340:1'),
(311, 29, 'snap_isAutoPosted', '1'),
(320, 30, 'snap_isAutoPosted', '1'),
(321, 30, '_snap_forceSURL', '2'),
(322, 30, 'snap_MYURL', ''),
(323, 30, 'snapEdIT', '1'),
(324, 30, 'snapTW', 's:141:"a:1:{i:0;a:5:{s:10:"SNAPformat";s:15:"%TITLE% - %URL%";s:8:"attchImg";s:1:"0";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:4:"doTW";i:0;}}";'),
(325, 30, '_location_id', '3'),
(326, 30, '_blog_id', ''),
(327, 30, '_location_address', 'Technologiepark 13'),
(328, 30, '_location_town', 'Paderborn'),
(329, 30, '_location_state', ''),
(330, 30, '_location_postcode', '33100'),
(331, 30, '_location_region', ''),
(332, 30, '_location_country', 'DE'),
(333, 30, '_location_latitude', '51.7014045'),
(334, 30, '_location_longitude', '8.763189000000011'),
(335, 30, '_location_status', '1'),
(336, 29, '_event_id', '6'),
(337, 29, '_event_start_time', '19:00:00'),
(338, 29, '_event_end_time', '22:00:00'),
(339, 29, '_event_all_day', '0'),
(340, 29, '_event_start_date', '2015-08-19'),
(341, 29, '_event_end_date', '2015-08-19'),
(342, 29, '_event_rsvp', '0'),
(343, 29, '_event_rsvp_date', ''),
(344, 29, '_event_rsvp_time', '00:00:00'),
(345, 29, '_event_rsvp_spaces', ''),
(346, 29, '_event_spaces', ''),
(347, 29, '_location_id', '3'),
(348, 29, '_recurrence_id', ''),
(349, 29, '_event_status', '1'),
(350, 29, '_event_private', '0'),
(351, 29, '_event_date_created', ''),
(352, 29, '_event_date_modified', ''),
(353, 29, '_blog_id', ''),
(354, 29, '_group_id', '0'),
(355, 29, '_recurrence', '0'),
(356, 29, '_recurrence_interval', ''),
(357, 29, '_recurrence_freq', ''),
(358, 29, '_recurrence_days', '0'),
(359, 29, '_recurrence_byday', ''),
(360, 29, '_recurrence_byweekno', ''),
(361, 29, '_recurrence_rsvp_days', ''),
(362, 29, '_start_ts', '1440010800'),
(363, 29, '_end_ts', '1440021600'),
(368, 29, '_snap_forceSURL', '2'),
(369, 29, 'snap_MYURL', ''),
(370, 29, 'snapEdIT', '1'),
(371, 29, 'snapTW', 's:145:"a:1:{i:0;a:5:{s:4:"doTW";s:1:"1";s:10:"SNAPformat";s:15:"%TITLE% - %URL%";s:8:"attchImg";s:1:"0";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";}}";'),
(372, 31, '_edit_last', '1'),
(373, 31, '_edit_lock', '1431181680:1'),
(378, 31, 'snap_isAutoPosted', '1'),
(379, 31, '_snap_forceSURL', '2'),
(381, 31, 'snapEdIT', '1'),
(382, 31, 'snapTW', 's:150:"s:141:"a:1:{i:0;a:5:{s:10:"SNAPformat";s:15:"%TITLE% - %URL%";s:8:"attchImg";s:1:"0";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:4:"doTW";i:0;}}";";'),
(387, 32, 'snap_isAutoPosted', '1'),
(388, 32, '_snap_forceSURL', '2'),
(389, 32, 'snap_MYURL', ''),
(390, 32, 'snapEdIT', '1'),
(391, 32, 'snapTW', 's:141:"a:1:{i:0;a:5:{s:10:"SNAPformat";s:15:"%TITLE% - %URL%";s:8:"attchImg";s:1:"0";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:4:"doTW";i:0;}}";'),
(392, 32, '_location_id', '4'),
(393, 32, '_blog_id', ''),
(394, 32, '_location_address', 'Boos-Fremery-Straße 62'),
(395, 32, '_location_town', 'Heinsberg'),
(396, 32, '_location_state', ''),
(397, 32, '_location_postcode', '52525'),
(398, 32, '_location_region', ''),
(399, 32, '_location_country', 'DE'),
(400, 32, '_location_latitude', '51.0587469'),
(401, 32, '_location_longitude', '6.141277899999977'),
(402, 32, '_location_status', '1'),
(403, 31, '_event_id', '7'),
(404, 31, '_event_start_time', '19:00:00'),
(405, 31, '_event_end_time', '22:00:00'),
(406, 31, '_event_all_day', '0'),
(407, 31, '_event_start_date', '2015-06-23'),
(408, 31, '_event_end_date', '2015-06-23'),
(409, 31, '_event_rsvp', '0'),
(410, 31, '_event_rsvp_date', ''),
(411, 31, '_event_rsvp_time', '00:00:00'),
(412, 31, '_event_rsvp_spaces', ''),
(413, 31, '_event_spaces', ''),
(414, 31, '_location_id', '4'),
(415, 31, '_recurrence_id', ''),
(416, 31, '_event_status', '1'),
(417, 31, '_event_private', '0'),
(418, 31, '_event_date_created', ''),
(419, 31, '_event_date_modified', ''),
(420, 31, '_blog_id', ''),
(421, 31, '_group_id', '0'),
(422, 31, '_recurrence', '0'),
(423, 31, '_recurrence_interval', ''),
(424, 31, '_recurrence_freq', ''),
(425, 31, '_recurrence_days', '0'),
(426, 31, '_recurrence_byday', ''),
(427, 31, '_recurrence_byweekno', ''),
(428, 31, '_recurrence_rsvp_days', ''),
(429, 31, '_start_ts', '1435086000'),
(430, 31, '_end_ts', '1435096800'),
(431, 33, 'snap_isAutoPosted', '1'),
(432, 34, 'snap_isAutoPosted', '1'),
(433, 34, '_location_id', '5'),
(434, 34, '_blog_id', ''),
(435, 34, '_location_address', 'Pater-Schwartz-Gasse 11A'),
(436, 34, '_location_town', 'Wien'),
(437, 34, '_location_state', 'Wien'),
(438, 34, '_location_postcode', '1150'),
(439, 34, '_location_region', 'Wien'),
(440, 34, '_location_country', 'AT'),
(441, 34, '_location_latitude', '48.1920067'),
(442, 34, '_location_longitude', '16.335951300000033'),
(443, 34, '_location_status', '1'),
(444, 33, '_event_id', '8'),
(445, 33, '_event_start_time', '18:30:00'),
(446, 33, '_event_end_time', '22:00:00'),
(447, 33, '_event_all_day', '0'),
(448, 33, '_event_start_date', '2015-05-18'),
(449, 33, '_event_end_date', '2015-05-18'),
(450, 33, '_event_rsvp', '0'),
(451, 33, '_event_rsvp_date', ''),
(452, 33, '_event_rsvp_time', '00:00:00'),
(453, 33, '_event_rsvp_spaces', ''),
(454, 33, '_event_spaces', ''),
(455, 33, '_location_id', '5'),
(456, 33, '_recurrence_id', ''),
(457, 33, '_event_status', '1'),
(458, 33, '_event_private', '0'),
(459, 33, '_event_date_created', ''),
(460, 33, '_event_date_modified', ''),
(461, 33, '_blog_id', ''),
(462, 33, '_group_id', '0'),
(463, 33, '_recurrence', '0'),
(464, 33, '_recurrence_interval', ''),
(465, 33, '_recurrence_freq', ''),
(466, 33, '_recurrence_days', '0'),
(467, 33, '_recurrence_byday', ''),
(468, 33, '_recurrence_byweekno', ''),
(469, 33, '_recurrence_rsvp_days', ''),
(470, 33, '_start_ts', '1431973800'),
(471, 33, '_end_ts', '1431986400'),
(472, 5, '_edit_lock', '1431183425:1'),
(473, 5, '_edit_last', '1'),
(474, 8, '_edit_lock', '1431183471:1'),
(475, 8, '_edit_last', '1'),
(476, 30, '_edit_lock', '1431183747:1'),
(477, 38, '_wp_attached_file', '2015/05/magento-stammtisch1.png'),
(478, 38, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:338;s:6:"height";i:120;s:4:"file";s:31:"2015/05/magento-stammtisch1.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:31:"magento-stammtisch1-150x120.png";s:5:"width";i:150;s:6:"height";i:120;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:31:"magento-stammtisch1-300x107.png";s:5:"width";i:300;s:6:"height";i:107;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(479, 38, '_wp_attachment_custom_header_last_used_firegento_stammtisch', '1431187468'),
(480, 38, '_wp_attachment_is_custom_header', 'firegento_stammtisch'),
(481, 41, '_edit_last', '1'),
(486, 41, '_snap_forceSURL', '2'),
(487, 41, 'snap_MYURL', ''),
(488, 41, 'snapEdIT', '1'),
(489, 41, 'snapTW', 's:141:"a:1:{i:0;a:5:{s:10:"SNAPformat";s:15:"%TITLE% - %URL%";s:8:"attchImg";s:1:"0";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:4:"doTW";i:0;}}";'),
(490, 41, '_edit_lock', '1445686631:1'),
(491, 43, '_edit_last', '1'),
(492, 43, '_edit_lock', '1445686827:1'),
(493, 42, '_edit_last', '1'),
(494, 42, '_edit_lock', '1445686794:1'),
(495, 43, '_oembed_44a3a56fee749404563a4e935c655933', '{{unknown}}'),
(500, 42, 'snap_isAutoPosted', '1'),
(505, 42, '_event_id', '1'),
(506, 42, '_event_start_time', '19:00:00'),
(507, 42, '_event_end_time', '20:00:00'),
(508, 42, '_event_all_day', '0'),
(509, 42, '_event_start_date', '2015-10-30'),
(510, 42, '_event_end_date', '2015-10-31'),
(511, 42, '_event_rsvp', '0'),
(512, 42, '_event_rsvp_date', ''),
(513, 42, '_event_rsvp_time', '00:00:00'),
(514, 42, '_event_rsvp_spaces', ''),
(515, 42, '_event_spaces', ''),
(516, 42, '_location_id', '3'),
(517, 42, '_recurrence_id', ''),
(518, 42, '_event_status', '1'),
(519, 42, '_event_private', '0'),
(520, 42, '_event_date_created', ''),
(521, 42, '_event_date_modified', ''),
(522, 42, '_blog_id', ''),
(523, 42, '_group_id', '0'),
(524, 42, '_recurrence', '0'),
(525, 42, '_recurrence_interval', ''),
(526, 42, '_recurrence_freq', ''),
(527, 42, '_recurrence_days', '0'),
(528, 42, '_recurrence_byday', ''),
(529, 42, '_recurrence_byweekno', ''),
(530, 42, '_recurrence_rsvp_days', ''),
(531, 42, '_start_ts', '1446231600'),
(532, 42, '_end_ts', '1446321600'),
(533, 42, '_snap_forceSURL', '2'),
(534, 42, 'snap_MYURL', ''),
(535, 42, 'snapEdIT', '1'),
(536, 42, 'snapTW', 's:141:"a:1:{i:0;a:5:{s:10:"SNAPformat";s:15:"%TITLE% - %URL%";s:8:"attchImg";s:1:"0";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:4:"doTW";i:0;}}";'),
(541, 43, 'snap_isAutoPosted', '1'),
(546, 43, '_location_id', '6'),
(547, 43, '_blog_id', ''),
(548, 43, '_location_address', 'Heinrichstrasse 267a'),
(549, 43, '_location_town', 'Zürich'),
(550, 43, '_location_state', ''),
(551, 43, '_location_postcode', '8005'),
(552, 43, '_location_region', ''),
(553, 43, '_location_country', 'CH'),
(554, 43, '_location_latitude', '47.3889691'),
(555, 43, '_location_longitude', '8.521826099999998'),
(556, 43, '_location_status', '1'),
(557, 43, '_snap_forceSURL', '2'),
(558, 43, 'snap_MYURL', ''),
(559, 43, 'snapEdIT', '1'),
(560, 43, 'snapTW', 's:141:"a:1:{i:0;a:5:{s:10:"SNAPformat";s:15:"%TITLE% - %URL%";s:8:"attchImg";s:1:"0";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:4:"doTW";i:0;}}";');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=44 ;

--
-- Daten für Tabelle `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2015-05-09 09:44:22', '2015-05-09 09:44:22', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2015-05-09 09:44:22', '2015-05-09 09:44:22', '', 0, 'http://stammtisch.localhost/?p=1', 0, 'post', '', 1),
(2, 1, '2015-05-09 09:44:22', '2015-05-09 09:44:22', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin'' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://stammtisch.localhost/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'publish', 'open', 'open', '', 'sample-page', '', '', '2015-05-09 09:44:22', '2015-05-09 09:44:22', '', 0, 'http://stammtisch.localhost/?page_id=2', 0, 'page', '', 0),
(4, 1, '2015-05-09 09:44:50', '2015-05-09 09:44:50', 'CONTENTS', 'Alle Termine', 'CONTENTS', 'publish', 'closed', 'open', '', 'events', '', '', '2015-05-09 16:58:36', '2015-05-09 14:58:36', '', 0, 'http://stammtisch.localhost/events/', 0, 'page', '', 0),
(5, 1, '2015-05-09 09:44:50', '2015-05-09 09:44:50', 'CONTENTS', 'Locations', '', 'publish', 'closed', 'open', '', 'locations', '', '', '2015-05-09 16:59:11', '2015-05-09 14:59:11', '', 4, 'http://stammtisch.localhost/events/locations/', 0, 'page', '', 0),
(6, 1, '2015-05-09 09:44:50', '2015-05-09 09:44:50', 'CONTENTS', 'Magento Stammtische', '', 'publish', 'closed', 'open', '', 'categories', '', '', '2015-05-09 16:57:12', '2015-05-09 14:57:12', '', 4, 'http://stammtisch.localhost/events/categories/', 0, 'page', '', 0),
(7, 1, '2015-05-09 09:44:50', '2015-05-09 09:44:50', 'CONTENTS', 'Tags', '', 'publish', 'open', 'open', '', 'tags', '', '', '2015-05-09 09:44:50', '2015-05-09 09:44:50', '', 4, 'http://stammtisch.localhost/events/tags/', 0, 'page', '', 0),
(8, 1, '2015-05-09 09:44:50', '2015-05-09 09:44:50', 'CONTENTS', 'My Bookings', '', 'publish', 'closed', 'open', '', 'my-bookings', '', '', '2015-05-09 16:59:47', '2015-05-09 14:59:47', '', 4, 'http://stammtisch.localhost/events/my-bookings/', 0, 'page', '', 0),
(9, 1, '2015-05-09 09:50:10', '2015-05-09 09:50:10', ' ', '', '', 'publish', 'open', 'open', '', '9', '', '', '2015-05-09 18:35:46', '2015-05-09 16:35:46', '', 0, 'http://stammtisch.localhost/?p=9', 1, 'nav_menu_item', '', 0),
(10, 1, '2015-05-09 09:50:10', '2015-05-09 09:50:10', ' ', '', '', 'publish', 'open', 'open', '', '10', '', '', '2015-05-09 18:35:46', '2015-05-09 16:35:46', '', 4, 'http://stammtisch.localhost/?p=10', 2, 'nav_menu_item', '', 0),
(13, 1, '2015-05-09 09:56:33', '2015-05-09 09:56:33', '', 'Shopwerft GmbH', '', 'publish', 'open', 'open', '', 'hamburg', '', '', '2015-05-09 14:59:46', '2015-05-09 12:59:46', '', 0, 'http://stammtisch.localhost/locations/hamburg/', 0, 'location', '', 0),
(14, 1, '2015-05-09 09:58:37', '2015-05-09 09:58:37', '', 'Shopwerft A', '', 'inherit', 'open', 'open', '', '13-autosave-v1', '', '', '2015-05-09 09:58:37', '2015-05-09 09:58:37', '', 13, 'http://stammtisch.localhost/2015/05/09/13-autosave-v1/', 0, 'revision', '', 0),
(15, 1, '2015-05-09 12:17:55', '2015-05-09 10:17:55', '', 'Activity', '', 'publish', 'closed', 'closed', '', 'activity', '', '', '2015-05-09 12:17:55', '2015-05-09 10:17:55', '', 0, 'http://stammtisch.localhost/activity/', 0, 'page', '', 0),
(16, 1, '2015-05-09 12:17:55', '2015-05-09 10:17:55', '', 'Members', '', 'publish', 'closed', 'closed', '', 'members', '', '', '2015-05-09 12:17:55', '2015-05-09 10:17:55', '', 0, 'http://stammtisch.localhost/members/', 0, 'page', '', 0),
(20, 1, '2015-05-09 15:27:10', '2015-05-09 13:27:10', ' [event_form]', 'Stammtisch melden', '', 'publish', 'open', 'open', '', 'stammtisch-melden', '', '', '2015-05-09 15:27:10', '2015-05-09 13:27:10', '', 0, 'http://stammtisch.localhost/?page_id=20', 0, 'page', '', 0),
(21, 1, '2015-05-09 15:27:10', '2015-05-09 13:27:10', ' [event_form]', 'Stammtisch melden', '', 'inherit', 'open', 'open', '', '20-revision-v1', '', '', '2015-05-09 15:27:10', '2015-05-09 13:27:10', '', 20, 'http://stammtisch.localhost/2015/05/09/20-revision-v1/', 0, 'revision', '', 0),
(23, 1, '2015-05-09 15:36:10', '2015-05-09 13:36:10', 'CONTENTS', 'Magento Stammtische', '', 'inherit', 'open', 'open', '', '6-revision-v1', '', '', '2015-05-09 15:36:10', '2015-05-09 13:36:10', '', 6, 'http://stammtisch.localhost/?p=23', 0, 'revision', '', 0),
(24, 1, '2015-05-09 15:38:25', '2015-05-09 13:38:25', 'CONTENTS', 'Magento Stammtische in', '', 'inherit', 'open', 'open', '', '6-revision-v1', '', '', '2015-05-09 15:38:25', '2015-05-09 13:38:25', '', 6, 'http://stammtisch.localhost/?p=24', 0, 'revision', '', 0),
(25, 1, '2015-05-09 15:40:05', '2015-05-09 13:40:05', 'CONTENTS', 'Alle Termine', 'CONTENTS', 'inherit', 'open', 'open', '', '4-revision-v1', '', '', '2015-05-09 15:40:05', '2015-05-09 13:40:05', '', 4, 'http://stammtisch.localhost/?p=25', 0, 'revision', '', 0),
(28, 1, '2015-05-09 16:11:20', '2015-05-09 14:11:20', '', 'Netzkollektiv', '', 'publish', 'open', 'open', '', 'netzkollektiv', '', '', '2015-05-09 16:11:20', '2015-05-09 14:11:20', '', 0, 'http://stammtisch.localhost/?location=netzkollektiv', 0, 'location', '', 0),
(30, 1, '2015-05-09 16:21:38', '2015-05-09 14:21:38', '', 'Technologiepark, Bistro Raum A', '', 'publish', 'open', 'open', '', 'technologiepark-bistro-raum-a', '', '', '2015-05-09 16:21:38', '2015-05-09 14:21:38', '', 0, 'http://stammtisch.localhost/?location=technologiepark-bistro-raum-a', 0, 'location', '', 0),
(32, 1, '2015-05-09 16:28:25', '2015-05-09 14:28:25', '', 'Gebrüder Otto Gourmet GmbH', '', 'publish', 'open', 'open', '', 'gebrueder-otto-gourmet-gmbh', '', '', '2015-05-09 16:28:25', '2015-05-09 14:28:25', '', 0, 'http://stammtisch.localhost/?location=gebrueder-otto-gourmet-gmbh', 0, 'location', '', 0),
(34, 1, '2015-05-09 16:34:40', '2015-05-09 14:34:40', '', 'StockWerk', '', 'publish', 'open', 'open', '', 'stockwerk', '', '', '2015-05-09 16:34:40', '2015-05-09 14:34:40', '', 0, 'http://stammtisch.localhost/?location=stockwerk', 0, 'location', '', 0),
(35, 1, '2015-05-09 16:51:45', '2015-05-09 14:51:45', 'CONTENTS', 'Magento Stammtische', '', 'inherit', 'open', 'open', '', '6-revision-v1', '', '', '2015-05-09 16:51:45', '2015-05-09 14:51:45', '', 6, 'http://stammtisch.localhost/?p=35', 0, 'revision', '', 0),
(36, 1, '2015-05-09 16:59:11', '2015-05-09 14:59:11', 'CONTENTS', 'Locations', '', 'inherit', 'closed', 'open', '', '5-revision-v1', '', '', '2015-05-09 16:59:11', '2015-05-09 14:59:11', '', 5, 'http://stammtisch.localhost/?p=36', 0, 'revision', '', 0),
(37, 1, '2015-05-09 16:59:47', '2015-05-09 14:59:47', 'CONTENTS', 'My Bookings', '', 'inherit', 'closed', 'open', '', '8-revision-v1', '', '', '2015-05-09 16:59:47', '2015-05-09 14:59:47', '', 8, 'http://stammtisch.localhost/?p=37', 0, 'revision', '', 0),
(38, 1, '2015-05-09 18:04:04', '2015-05-09 16:04:04', '', 'magento-stammtisch', '', 'inherit', 'closed', 'open', '', 'magento-stammtisch', '', '', '2015-05-09 18:04:04', '2015-05-09 16:04:04', '', 0, 'http://beta.magento-stammtisch.de/wp-content/uploads/2015/05/magento-stammtisch1.png', 0, 'attachment', 'image/png', 0),
(39, 1, '2015-10-24 12:21:47', '0000-00-00 00:00:00', '', 'Automatisch gespeicherter Entwurf', '', 'auto-draft', 'closed', 'open', '', '', '', '', '2015-10-24 12:21:47', '0000-00-00 00:00:00', '', 0, 'http://beta.magento-stammtisch.de/?p=39', 0, 'post', '', 0),
(42, 1, '2015-10-24 13:42:13', '2015-10-24 11:42:13', 'test', 'Test Paderborn', '', 'publish', 'closed', 'closed', '', 'test-paderborn', '', '', '2015-10-24 13:42:13', '2015-10-24 11:42:13', '', 0, 'http://beta.magento-stammtisch.de/?post_type=event&#038;p=42', 0, 'event', '', 0),
(43, 1, '2015-10-24 13:42:20', '2015-10-24 11:42:20', 'In charaktervollen Räumen des Industriezeitalters arbeiten, via W-Lan weltweit kommunizieren, am Nebentisch Ideen diskutieren. Und das heisst auch: Pause machen – Ideen finden.\r\n\r\nMehr Infos über die Location unter <a href="http://citizen-space.ch" target="_blank">citizen-space.ch</a>', 'Citizen Space', '', 'publish', 'closed', 'closed', '', 'citizen-space', '', '', '2015-10-24 13:42:20', '2015-10-24 11:42:20', '', 0, 'http://beta.magento-stammtisch.de/?post_type=location&#038;p=43', 0, 'location', '', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_signups`
--

CREATE TABLE IF NOT EXISTS `wp_signups` (
  `signup_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `activation_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `meta` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`signup_id`),
  KEY `activation_key` (`activation_key`),
  KEY `user_email` (`user_email`),
  KEY `user_login_email` (`user_login`,`user_email`),
  KEY `domain_path` (`domain`(140),`path`(51))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=22 ;

--
-- Daten für Tabelle `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Navigation', 'navigation', 0),
(3, 'Hamburg', 'magento-stammtisch-hamburg', 0),
(4, 'Aachen', 'magento-stammtisch-aachen', 0),
(5, 'Berlin', 'magento-stammtisch-berlin', 0),
(6, 'Bern', 'magento-stammtisch-bern', 0),
(7, 'Paderborn', 'magento-stammtisch-paderborn', 0),
(8, 'Bielefeld', 'magento-stammtisch-bielefeld', 0),
(9, 'Frankfurt am Main', 'magento-stammtisch-frankfurt-am-main', 0),
(10, 'Hannover', 'magento-stammtisch-hannover', 0),
(11, 'Kiel', 'magento-stammtisch-kiel', 0),
(12, 'Köln', 'magento-stammtisch-koeln', 0),
(13, 'Leipzig', 'magento-stammtisch-leipzig', 0),
(14, 'Mainz', 'magento-stammtisch-mainz', 0),
(15, 'München', 'magento-stammtisch-muenchen', 0),
(16, 'Münster', 'magento-stammtisch-muenster', 0),
(17, 'Nürnberg', 'magento-stammtisch-nuernberg', 0),
(18, 'Wien', 'magento-stammtisch-wien', 0),
(19, 'Wiesbaden', 'magento-stammtisch-wiesbaden', 0),
(20, 'Würzburg', 'magento-stammtisch-wuerzburg', 0),
(21, 'Zürich', 'magento-stammtisch-zuerich', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(9, 2, 0),
(10, 2, 0),
(18, 3, 0),
(27, 17, 0),
(29, 7, 0),
(31, 4, 0),
(33, 18, 0),
(42, 7, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=22 ;

--
-- Daten für Tabelle `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 2),
(3, 3, 'event-categories', '', 0, 1),
(4, 4, 'event-categories', '', 0, 1),
(5, 5, 'event-categories', '', 0, 0),
(6, 6, 'event-categories', '', 0, 0),
(7, 7, 'event-categories', '', 0, 1),
(8, 8, 'event-categories', '', 0, 0),
(9, 9, 'event-categories', '', 0, 0),
(10, 10, 'event-categories', '', 0, 0),
(11, 11, 'event-categories', '', 0, 0),
(12, 12, 'event-categories', '', 0, 0),
(13, 13, 'event-categories', '', 0, 0),
(14, 14, 'event-categories', '', 0, 0),
(15, 15, 'event-categories', '', 0, 0),
(16, 16, 'event-categories', '', 0, 0),
(17, 17, 'event-categories', '', 0, 1),
(18, 18, 'event-categories', '', 0, 1),
(19, 19, 'event-categories', '', 0, 0),
(20, 20, 'event-categories', '', 0, 0),
(21, 21, 'event-categories', '', 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=28 ;

--
-- Daten für Tabelle `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'false'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp360_locks,wp390_widgets,wp410_dfw'),
(13, 1, 'show_welcome_panel', '1'),
(15, 1, 'wp_dashboard_quick_press_last_post_id', '39'),
(16, 1, 'manageedit-eventcolumnshidden', 'a:1:{i:0;s:8:"event-id";}'),
(17, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(18, 1, 'metaboxhidden_nav-menus', 'a:7:{i:0;s:8:"add-post";i:1;s:12:"add-location";i:2;s:9:"add-event";i:3;s:12:"add-post_tag";i:4;s:15:"add-post_format";i:5;s:14:"add-event-tags";i:6;s:20:"add-event-categories";}'),
(19, 1, 'manageedit-locationcolumnshidden', 'a:1:{i:0;s:11:"location-id";}'),
(20, 1, 'session_tokens', 'a:4:{s:64:"6f61f09721bda316e7194f33af60201398b42e19b2f20f2e30df310991706afb";a:4:{s:10:"expiration";i:1445854904;s:2:"ip";s:12:"80.87.117.90";s:2:"ua";s:76:"Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:41.0) Gecko/20100101 Firefox/41.0";s:5:"login";i:1445682104;}s:64:"df96ac685a40c2486073a358f9a0891365587569999e5c22e47e9b9699604132";a:4:{s:10:"expiration";i:1445855092;s:2:"ip";s:12:"80.87.117.90";s:2:"ua";s:76:"Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:41.0) Gecko/20100101 Firefox/41.0";s:5:"login";i:1445682292;}s:64:"bc3fde6f005607b8d3f1b3c54021eb6873e32f70fd3d7f546ffdd7d6b46340e7";a:4:{s:10:"expiration";i:1445855460;s:2:"ip";s:15:"195.191.132.191";s:2:"ua";s:120:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36";s:5:"login";i:1445682660;}s:64:"2c15f438b2a1681a39422a24f0f378cfc2d198555ee2d11090fa159309d9a004";a:4:{s:10:"expiration";i:1445855474;s:2:"ip";s:15:"195.191.132.191";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36";s:5:"login";i:1445682674;}}'),
(21, 1, 'last_activity', '2015-10-24 11:36:17'),
(22, 1, 'wp_user-settings', 'editor=tinymce&libraryContent=browse&posts_list_mode=list'),
(23, 1, 'wp_user-settings-time', '1445686517'),
(24, 1, 'nav_menu_recently_edited', '2'),
(25, 1, 'closedpostboxes_page', 'a:0:{}'),
(26, 1, 'metaboxhidden_page', 'a:4:{i:0;s:12:"revisionsdiv";i:1;s:10:"postcustom";i:2;s:7:"slugdiv";i:3;s:9:"authordiv";}'),
(27, 1, 'dbem_phone', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BwYMVFMOtK869yEmtBYbTHoDDRENvz1', 'admin', 'daim1985@gmail.com', '', '2015-05-09 09:44:21', '', 0, 'admin');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
