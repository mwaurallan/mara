-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 04, 2023 at 07:57 AM
-- Server version: 8.0.32-0ubuntu0.20.04.2
-- PHP Version: 7.4.3-4ubuntu2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `marapos`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type_id` int DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` int UNSIGNED NOT NULL,
  `account_id` int NOT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int NOT NULL,
  `transaction_id` int DEFAULT NULL,
  `transaction_payment_id` int DEFAULT NULL,
  `transfer_transaction_id` int DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_account_type_id` int DEFAULT NULL,
  `business_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_continuous` tinyint(1) NOT NULL DEFAULT '0',
  `stickers_in_one_sheet` int DEFAULT NULL,
  `business_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `description`, `width`, `height`, `paper_width`, `paper_height`, `top_margin`, `left_margin`, `row_distance`, `col_distance`, `stickers_in_one_row`, `is_default`, `is_continuous`, `stickers_in_one_sheet`, `business_id`, `created_at`, `updated_at`) VALUES
(1, '20 Labels per Sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 4\" x 1\"\\r\\nLabels per sheet: 20', 3.7500, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.1562, 2, 0, 0, 20, NULL, '2017-12-18 06:13:44', '2017-12-18 06:13:44'),
(2, '30 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2.625\" x 1\"\\r\\nLabels per sheet: 30', 2.6250, 1.0000, 8.5000, 11.0000, 0.5000, 0.2198, 0.0000, 0.1400, 3, 0, 0, 30, NULL, '2017-12-18 06:04:39', '2017-12-18 06:10:40'),
(3, '32 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2\" x 1.25\"\\r\\nLabels per sheet: 32', 2.0000, 1.2500, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 32, NULL, '2017-12-18 05:55:40', '2017-12-18 05:55:40'),
(4, '40 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2\" x 1\"\\r\\nLabels per sheet: 40', 2.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 40, NULL, '2017-12-18 05:58:40', '2017-12-18 05:58:40'),
(5, '50 Labels per Sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 1.5\" x 1\"\\r\\nLabels per sheet: 50', 1.5000, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.0000, 5, 0, 0, 50, NULL, '2017-12-18 05:51:10', '2017-12-18 05:51:10'),
(6, 'Continuous Rolls - 31.75mm x 25.4mm', 'Label Size: 31.75mm x 25.4mm\\r\\nGap: 3.18mm', 1.2500, 1.0000, 1.2500, 0.0000, 0.1250, 0.0000, 0.1250, 0.0000, 1, 0, 1, NULL, NULL, '2017-12-18 05:51:10', '2017-12-18 05:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int UNSIGNED NOT NULL,
  `contact_id` int UNSIGNED NOT NULL,
  `waiter_id` int UNSIGNED DEFAULT NULL,
  `table_id` int UNSIGNED DEFAULT NULL,
  `correspondent_id` int DEFAULT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `booking_status` enum('booked','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_sales_tax` int UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT '0.00',
  `owner_id` int UNSIGNED NOT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint NOT NULL DEFAULT '1',
  `accounting_method` enum('fifo','lifo','avco') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'includes',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `expiry_type` enum('add_expiry','add_manufacturing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT '1',
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `transaction_edit_days` int UNSIGNED NOT NULL DEFAULT '30',
  `stock_expiry_alert_days` int UNSIGNED NOT NULL DEFAULT '30',
  `keyboard_shortcuts` text COLLATE utf8mb4_unicode_ci,
  `pos_settings` text COLLATE utf8mb4_unicode_ci,
  `weighing_scale_setting` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'used to store the configuration of weighing scale',
  `enable_brand` tinyint(1) NOT NULL DEFAULT '1',
  `enable_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT '1',
  `enable_purchase_status` tinyint(1) DEFAULT '1',
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT '0',
  `default_unit` int DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT '0',
  `enable_racks` tinyint(1) NOT NULL DEFAULT '0',
  `enable_row` tinyint(1) NOT NULL DEFAULT '0',
  `enable_position` tinyint(1) NOT NULL DEFAULT '0',
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT '1',
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT '1',
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT '1',
  `currency_symbol_placement` enum('before','after') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'before',
  `enabled_modules` text COLLATE utf8mb4_unicode_ci,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '24',
  `ref_no_prefixes` text COLLATE utf8mb4_unicode_ci,
  `theme_color` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text COLLATE utf8mb4_unicode_ci,
  `sms_settings` text COLLATE utf8mb4_unicode_ci,
  `custom_labels` text COLLATE utf8mb4_unicode_ci,
  `common_settings` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `currency_id`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `weighing_scale_setting`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_sub_units`, `enable_racks`, `enable_row`, `enable_position`, `enable_editing_product_from_purchase`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `ref_no_prefixes`, `theme_color`, `created_by`, `enable_rp`, `rp_name`, `amount_for_unit_rp`, `min_order_total_for_rp`, `max_rp_per_order`, `redeem_amount_per_unit_rp`, `min_order_total_for_redeem`, `min_redeem_point`, `max_redeem_point`, `rp_expiry_period`, `rp_expiry_type`, `email_settings`, `sms_settings`, `custom_labels`, `common_settings`, `is_active`, `created_at`, `updated_at`) VALUES
(7, 'AMG Kenya', 133, '2023-01-01', NULL, NULL, NULL, NULL, NULL, 25.00, 7, 'Asia/Kolkata', 1, 'fifo', NULL, 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, '1.000', 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"recent_product_quantity\":\"f2\",\"add_new_product\":\"f4\"}}', NULL, '', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\"]', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"business_location\":\"BL\"}', NULL, NULL, 0, NULL, '1.0000', '1.0000', NULL, '1.0000', '1.0000', NULL, NULL, NULL, 'year', NULL, NULL, NULL, NULL, 1, '2023-01-16 22:44:22', '2023-01-16 22:44:22'),
(8, 'Maarifa Tech', 133, '2023-01-01', NULL, NULL, NULL, NULL, NULL, 25.00, 8, 'Africa/Nairobi', 1, 'fifo', NULL, 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, '1.000', 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"recent_product_quantity\":\"f2\",\"add_new_product\":\"f4\"}}', NULL, '', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\"]', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"business_location\":\"BL\"}', NULL, NULL, 0, NULL, '1.0000', '1.0000', NULL, '1.0000', '1.0000', NULL, NULL, NULL, 'year', NULL, NULL, NULL, NULL, 1, '2023-01-16 22:46:09', '2023-01-16 22:46:09'),
(9, 'Outoffice Innovations Africa Limited', 133, '2023-01-16', NULL, NULL, NULL, NULL, NULL, 25.00, 9, 'Africa/Nairobi', 1, 'fifo', NULL, 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, '1.000', 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"recent_product_quantity\":\"f2\",\"add_new_product\":\"f4\"}}', NULL, '', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\"]', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"business_location\":\"BL\"}', NULL, NULL, 0, NULL, '1.0000', '1.0000', NULL, '1.0000', '1.0000', NULL, NULL, NULL, 'year', NULL, NULL, NULL, NULL, 1, '2023-01-16 23:33:05', '2023-01-16 23:33:05'),
(10, 'FAIR DEALS(K) BEUTY SHOP', 133, '2023-02-03', NULL, NULL, NULL, NULL, NULL, 25.00, 10, 'Africa/Nairobi', 1, 'fifo', '0.00', 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, '1.000', 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"amount_rounding_method\":null,\"show_credit_sale_button\":\"1\",\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\"]', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"purchase_return\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null}', NULL, NULL, 0, NULL, '1.0000', '1.0000', NULL, '1.0000', '1.0000', NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null}}', '{\"default_datatable_page_entries\":\"25\"}', 1, '2023-02-03 15:41:20', '2023-02-03 16:42:05');

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

CREATE TABLE `business_locations` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_scheme_id` int UNSIGNED NOT NULL,
  `invoice_layout_id` int UNSIGNED NOT NULL,
  `selling_price_group_id` int DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT '1',
  `receipt_printer_type` enum('browser','printer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'browser',
  `printer_id` int DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_products` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `default_payment_accounts` text COLLATE utf8mb4_unicode_ci,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `location_id`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `invoice_layout_id`, `selling_price_group_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `featured_products`, `is_active`, `default_payment_accounts`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 7, 'BL0001', 'AMG Kenya', 'fwefwef', 'sdsd', 'dsad', 'dd', '254', 1, 1, NULL, 1, 'browser', NULL, '', '', '', '', NULL, 1, '{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2023-01-16 22:44:22', '2023-01-16 22:44:22'),
(2, 8, 'BL0001', 'Maarifa Tech', 'nairobi', 'kenya', 'nairobi', 'kenya', '333', 2, 2, NULL, 1, 'browser', NULL, '', '', '', '', NULL, 1, '{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2023-01-16 22:46:09', '2023-01-16 22:46:09'),
(3, 9, 'BL0001', 'Outoffice Innovations Africa Limited', 'STrathmore Business School', 'Kenya', 'Nairobi', 'Nairobi', '254', 3, 3, NULL, 1, 'browser', NULL, '0722232418', '', '', 'https://www.outofficeinnovations.co', NULL, 1, '{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2023-01-16 23:33:06', '2023-01-16 23:33:06'),
(4, 10, 'BL0001', 'FAIR DEALS(K) BEUTY SHOP', 'BEE CENTRE', 'kenya', 'NAIROBI', 'Nairobi', '254', 4, 4, NULL, 1, 'browser', NULL, '0710871611', '', '', '', NULL, 1, '{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:41:21', '2023-02-03 15:41:21');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `status` enum('close','open') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `total_card_slips` int NOT NULL DEFAULT '0',
  `total_cheques` int NOT NULL DEFAULT '0',
  `closing_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `business_id`, `location_id`, `user_id`, `status`, `closed_at`, `closing_amount`, `total_card_slips`, `total_cheques`, `closing_note`, `created_at`, `updated_at`) VALUES
(1, 9, 3, 9, 'close', '2023-01-16 21:28:24', '30250.0000', 0, 0, NULL, '2023-01-16 21:04:00', '2023-01-16 21:28:24'),
(2, 8, 2, 8, 'open', NULL, '0.0000', 0, 0, NULL, '2023-02-02 18:55:00', '2023-02-02 18:55:52'),
(3, 10, 4, 10, 'open', NULL, '0.0000', 0, 0, NULL, '2023-02-03 16:34:00', '2023-02-03 16:34:10');

-- --------------------------------------------------------

--
-- Table structure for table `cash_register_transactions`
--

CREATE TABLE `cash_register_transactions` (
  `id` int UNSIGNED NOT NULL,
  `cash_register_id` int UNSIGNED NOT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `pay_method` enum('cash','card','cheque','bank_transfer','custom_pay_1','custom_pay_2','custom_pay_3','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` enum('initial','sell','transfer','refund') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_register_transactions`
--

INSERT INTO `cash_register_transactions` (`id`, `cash_register_id`, `amount`, `pay_method`, `type`, `transaction_type`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 1, '30000.0000', 'cash', 'credit', 'initial', NULL, '2023-01-16 21:04:51', '2023-01-16 21:04:51'),
(2, 1, '250.0000', 'cash', 'credit', 'sell', 2, '2023-01-16 21:24:40', '2023-01-16 21:24:40'),
(3, 1, '0.0000', 'cash', 'credit', 'sell', 2, '2023-01-16 21:24:40', '2023-01-16 21:24:40'),
(4, 2, '100.0000', 'cash', 'credit', 'initial', NULL, '2023-02-02 18:55:52', '2023-02-02 18:55:52'),
(5, 2, '230.0000', 'cash', 'credit', 'sell', 4, '2023-02-02 18:56:12', '2023-02-02 18:56:12'),
(6, 2, '0.0000', 'cash', 'credit', 'sell', 4, '2023-02-02 18:56:12', '2023-02-02 18:56:12'),
(7, 3, '0.0000', 'cash', 'credit', 'initial', NULL, '2023-02-03 16:34:10', '2023-02-03 16:34:10'),
(8, 3, '2470.0000', 'cash', 'credit', 'sell', 82, '2023-02-03 16:51:38', '2023-02-03 16:51:38'),
(9, 3, '0.0000', 'cash', 'credit', 'sell', 82, '2023-02-03 16:51:38', '2023-02-03 16:51:38');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `short_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `category_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `business_id`, `short_code`, `parent_id`, `created_by`, `category_type`, `description`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Weaves', 10, 'wv', 0, 10, 'product', NULL, NULL, NULL, '2023-02-03 13:12:25', '2023-02-03 13:12:25'),
(2, 'Braids', 10, 'BR', 0, 10, 'product', NULL, NULL, NULL, '2023-02-03 13:12:40', '2023-02-03 13:12:40'),
(3, 'Lotion', 10, 'Lt', 0, 10, 'product', NULL, NULL, NULL, '2023-02-03 22:07:10', '2023-02-03 22:07:10'),
(4, 'Cosmetics', 10, 'csm', 0, 10, 'product', NULL, NULL, NULL, '2023-02-03 22:14:40', '2023-02-03 22:14:40');

-- --------------------------------------------------------

--
-- Table structure for table `categorizables`
--

CREATE TABLE `categorizables` (
  `category_id` int NOT NULL,
  `categorizable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorizable_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_business_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_1` text COLLATE utf8mb4_unicode_ci,
  `address_line_2` text COLLATE utf8mb4_unicode_ci,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `total_rp` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_used` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `business_id`, `type`, `supplier_business_name`, `name`, `prefix`, `first_name`, `middle_name`, `last_name`, `email`, `contact_id`, `contact_status`, `tax_number`, `city`, `state`, `country`, `address_line_1`, `address_line_2`, `zip_code`, `dob`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `credit_limit`, `created_by`, `total_rp`, `total_rp_used`, `total_rp_expired`, `is_default`, `shipping_address`, `position`, `customer_group_id`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 7, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-16 22:44:22', '2023-01-16 22:44:22'),
(2, 8, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-16 22:46:09', '2023-01-16 22:46:09'),
(3, 9, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-16 23:33:06', '2023-01-16 23:33:06'),
(4, 10, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:41:21', '2023-02-03 15:41:21'),
(5, 10, 'customer', NULL, ' Mwaura Samuel ', NULL, 'Mwaura', 'Samuel', NULL, NULL, 'CO0002', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0725655565', NULL, NULL, NULL, NULL, '1000.0000', 10, 0, 0, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2023-02-03 17:47:58', '2023-02-03 17:47:58');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int UNSIGNED NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHC', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MXN', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NG', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL),
(137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL),
(138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL),
(139, 'Angola', 'Kwanza', 'AOA', 'Kz', ',', '.', NULL, NULL),
(140, 'Kuwait', 'Kuwaiti dinar', 'KWD', 'KD', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(5,2) NOT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `business_id`, `name`, `amount`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 10, 'Special', 10.00, 10, '2023-02-03 17:46:35', '2023-02-03 17:46:35');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_configurations`
--

CREATE TABLE `dashboard_configurations` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `created_by` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int NOT NULL,
  `brand_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `applicable_in_spg` tinyint(1) DEFAULT '0',
  `applicable_in_cg` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_and_notes`
--

CREATE TABLE `document_and_notes` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `notable_id` int NOT NULL,
  `notable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_sub_taxes`
--

CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int UNSIGNED NOT NULL,
  `tax_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_layouts`
--

CREATE TABLE `invoice_layouts` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_text` text COLLATE utf8mb4_unicode_ci,
  `invoice_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `round_off_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_due_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT '0',
  `client_id_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT '1',
  `show_brand` tinyint(1) NOT NULL DEFAULT '0',
  `show_sku` tinyint(1) NOT NULL DEFAULT '1',
  `show_cat_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `show_lot` tinyint(1) NOT NULL DEFAULT '0',
  `show_image` tinyint(1) NOT NULL DEFAULT '0',
  `show_sale_description` tinyint(1) NOT NULL DEFAULT '0',
  `sales_person_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT '0',
  `table_product_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_qty_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_unit_price_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_subtotal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_code_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT '0',
  `show_business_name` tinyint(1) NOT NULL DEFAULT '0',
  `show_location_name` tinyint(1) NOT NULL DEFAULT '1',
  `show_landmark` tinyint(1) NOT NULL DEFAULT '1',
  `show_city` tinyint(1) NOT NULL DEFAULT '1',
  `show_state` tinyint(1) NOT NULL DEFAULT '1',
  `show_zip_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_country` tinyint(1) NOT NULL DEFAULT '1',
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT '1',
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT '0',
  `show_email` tinyint(1) NOT NULL DEFAULT '0',
  `show_tax_1` tinyint(1) NOT NULL DEFAULT '1',
  `show_tax_2` tinyint(1) NOT NULL DEFAULT '0',
  `show_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `show_payments` tinyint(1) NOT NULL DEFAULT '0',
  `show_customer` tinyint(1) NOT NULL DEFAULT '0',
  `customer_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_reward_point` tinyint(1) NOT NULL DEFAULT '0',
  `highlight_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `module_info` text COLLATE utf8mb4_unicode_ci,
  `common_settings` text COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `business_id` int UNSIGNED NOT NULL,
  `design` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT 'classic',
  `cn_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cn_amount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_tax_headings` text COLLATE utf8mb4_unicode_ci,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT '0',
  `prev_bal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_return_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `contact_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `location_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `round_off_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `date_time_format`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_expiry`, `show_lot`, `show_image`, `show_sale_description`, `sales_person_label`, `show_sales_person`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `show_reward_point`, `highlight_color`, `footer_text`, `module_info`, `common_settings`, `is_default`, `business_id`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `table_tax_headings`, `show_previous_bal`, `prev_bal_label`, `change_return_label`, `product_custom_fields`, `contact_custom_fields`, `location_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', 0, '#000000', '', NULL, NULL, 1, 7, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2023-01-16 22:44:22', '2023-01-16 22:44:22'),
(2, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', 0, '#000000', '', NULL, NULL, 1, 8, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2023-01-16 22:46:09', '2023-01-16 22:46:09'),
(3, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', 0, '#000000', '', NULL, NULL, 1, 9, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2023-01-16 23:33:06', '2023-01-16 23:33:06'),
(4, 'Default', NULL, 'Invoice No.', NULL, 'Cash/Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 'Item', 'Qnty', '@', 'Subtotal', NULL, NULL, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', 0, '#000000', NULL, NULL, '{\"due_date_label\":null,\"total_quantity_label\":null}', 1, 10, 'slim', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:41:21', '2023-02-03 16:49:38');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_schemes`
--

CREATE TABLE `invoice_schemes` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme_type` enum('blank','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_number` int DEFAULT NULL,
  `invoice_count` int NOT NULL DEFAULT '0',
  `total_digits` int DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 7, 'Default', 'blank', '', 1, 0, 4, 1, '2023-01-16 22:44:22', '2023-01-16 22:44:22'),
(2, 8, 'Default', 'blank', '', 1, 4, 4, 1, '2023-01-16 22:46:09', '2023-02-03 17:06:25'),
(3, 9, 'Default', 'blank', '', 1, 1, 4, 1, '2023-01-16 23:33:06', '2023-01-16 21:24:40'),
(4, 10, 'Default', 'blank', '', 1, 3, 4, 1, '2023-02-03 15:41:21', '2023-02-03 16:51:38');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `uploaded_by` int DEFAULT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_07_05_071953_create_currencies_table', 1),
(4, '2017_07_05_073658_create_business_table', 1),
(5, '2017_07_22_075923_add_business_id_users_table', 1),
(6, '2017_07_23_113209_create_brands_table', 1),
(7, '2017_07_26_083429_create_permission_tables', 1),
(8, '2017_07_26_110000_create_tax_rates_table', 1),
(9, '2017_07_26_122313_create_units_table', 1),
(10, '2017_07_27_075706_create_contacts_table', 1),
(11, '2017_08_04_071038_create_categories_table', 1),
(12, '2017_08_08_115903_create_products_table', 1),
(13, '2017_08_09_061616_create_variation_templates_table', 1),
(14, '2017_08_09_061638_create_variation_value_templates_table', 1),
(15, '2017_08_10_061146_create_product_variations_table', 1),
(16, '2017_08_10_061216_create_variations_table', 1),
(17, '2017_08_19_054827_create_transactions_table', 1),
(18, '2017_08_31_073533_create_purchase_lines_table', 1),
(19, '2017_10_15_064638_create_transaction_payments_table', 1),
(20, '2017_10_31_065621_add_default_sales_tax_to_business_table', 1),
(21, '2017_11_20_051930_create_table_group_sub_taxes', 1),
(22, '2017_11_20_063603_create_transaction_sell_lines', 1),
(23, '2017_11_21_064540_create_barcodes_table', 1),
(24, '2017_11_23_181237_create_invoice_schemes_table', 1),
(25, '2017_12_25_122822_create_business_locations_table', 1),
(26, '2017_12_25_160253_add_location_id_to_transactions_table', 1),
(27, '2017_12_25_163227_create_variation_location_details_table', 1),
(28, '2018_01_04_115627_create_sessions_table', 1),
(29, '2018_01_05_112817_create_invoice_layouts_table', 1),
(30, '2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations', 1),
(31, '2018_01_08_104124_create_expense_categories_table', 1),
(32, '2018_01_08_123327_modify_transactions_table_for_expenses', 1),
(33, '2018_01_09_111005_modify_payment_status_in_transactions_table', 1),
(34, '2018_01_09_111109_add_paid_on_column_to_transaction_payments_table', 1),
(35, '2018_01_25_172439_add_printer_related_fields_to_business_locations_table', 1),
(36, '2018_01_27_184322_create_printers_table', 1),
(37, '2018_01_30_181442_create_cash_registers_table', 1),
(38, '2018_01_31_125836_create_cash_register_transactions_table', 1),
(39, '2018_02_07_173326_modify_business_table', 1),
(40, '2018_02_08_105425_add_enable_product_expiry_column_to_business_table', 1),
(41, '2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table', 1),
(42, '2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table', 1),
(43, '2018_02_08_155348_add_exchange_rate_to_transactions_table', 1),
(44, '2018_02_09_124945_modify_transaction_payments_table_for_contact_payments', 1),
(45, '2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table', 1),
(46, '2018_02_12_114605_add_quantity_sold_in_purchase_lines_table', 1),
(47, '2018_02_13_183323_alter_decimal_fields_size', 1),
(48, '2018_02_14_161928_add_transaction_edit_days_to_business_table', 1),
(49, '2018_02_15_161032_add_document_column_to_transactions_table', 1),
(50, '2018_02_17_124709_add_more_options_to_invoice_layouts', 1),
(51, '2018_02_19_111517_add_keyboard_shortcut_column_to_business_table', 1),
(52, '2018_02_19_121537_stock_adjustment_move_to_transaction_table', 1),
(53, '2018_02_20_165505_add_is_direct_sale_column_to_transactions_table', 1),
(54, '2018_02_21_105329_create_system_table', 1),
(55, '2018_02_23_100549_version_1_2', 1),
(56, '2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table', 1),
(57, '2018_02_26_103612_add_sales_commission_agent_column_to_business_table', 1),
(58, '2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt', 1),
(59, '2018_02_26_134500_add_commission_agent_to_transactions_table', 1),
(60, '2018_02_27_121422_add_item_addition_method_to_business_table', 1),
(61, '2018_02_27_170232_modify_transactions_table_for_stock_transfer', 1),
(62, '2018_03_05_153510_add_enable_inline_tax_column_to_business_table', 1),
(63, '2018_03_06_210206_modify_product_barcode_types', 1),
(64, '2018_03_13_181541_add_expiry_type_to_business_table', 1),
(65, '2018_03_16_113446_product_expiry_setting_for_business', 1),
(66, '2018_03_19_113601_add_business_settings_options', 1),
(67, '2018_03_26_125334_add_pos_settings_to_business_table', 1),
(68, '2018_03_26_165350_create_customer_groups_table', 1),
(69, '2018_03_27_122720_customer_group_related_changes_in_tables', 1),
(70, '2018_03_29_110138_change_tax_field_to_nullable_in_business_table', 1),
(71, '2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table', 1),
(72, '2018_03_29_134340_add_inline_discount_fields_in_purchase_lines', 1),
(73, '2018_03_31_140921_update_transactions_table_exchange_rate', 1),
(74, '2018_04_03_103037_add_contact_id_to_contacts_table', 1),
(75, '2018_04_03_122709_add_changes_to_invoice_layouts_table', 1),
(76, '2018_04_09_135320_change_exchage_rate_size_in_business_table', 1),
(77, '2018_04_17_123122_add_lot_number_to_business', 1),
(78, '2018_04_17_160845_add_product_racks_table', 1),
(79, '2018_04_20_182015_create_res_tables_table', 1),
(80, '2018_04_24_105246_restaurant_fields_in_transaction_table', 1),
(81, '2018_04_24_114149_add_enabled_modules_business_table', 1),
(82, '2018_04_24_133704_add_modules_fields_in_invoice_layout_table', 1),
(83, '2018_04_27_132653_quotation_related_change', 1),
(84, '2018_05_02_104439_add_date_format_and_time_format_to_business', 1),
(85, '2018_05_02_111939_add_sell_return_to_transaction_payments', 1),
(86, '2018_05_14_114027_add_rows_positions_for_products', 1),
(87, '2018_05_14_125223_add_weight_to_products_table', 1),
(88, '2018_05_14_164754_add_opening_stock_permission', 1),
(89, '2018_05_15_134729_add_design_to_invoice_layouts', 1),
(90, '2018_05_16_183307_add_tax_fields_invoice_layout', 1),
(91, '2018_05_18_191956_add_sell_return_to_transaction_table', 1),
(92, '2018_05_21_131349_add_custom_fileds_to_contacts_table', 1),
(93, '2018_05_21_131607_invoice_layout_fields_for_sell_return', 1),
(94, '2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table', 1),
(95, '2018_05_22_123527_create_reference_counts_table', 1),
(96, '2018_05_22_154540_add_ref_no_prefixes_column_to_business_table', 1),
(97, '2018_05_24_132620_add_ref_no_column_to_transaction_payments_table', 1),
(98, '2018_05_24_161026_add_location_id_column_to_business_location_table', 1),
(99, '2018_05_25_180603_create_modifiers_related_table', 1),
(100, '2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table', 1),
(101, '2018_05_31_114645_add_res_order_status_column_to_transactions_table', 1),
(102, '2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table', 1),
(103, '2018_06_05_111905_modify_products_table_for_modifiers', 1),
(104, '2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table', 1),
(105, '2018_06_07_152443_add_is_service_staff_to_roles_table', 1),
(106, '2018_06_07_182258_add_image_field_to_products_table', 1),
(107, '2018_06_13_133705_create_bookings_table', 1),
(108, '2018_06_15_173636_add_email_column_to_contacts_table', 1),
(109, '2018_06_27_182835_add_superadmin_related_fields_business', 1),
(110, '2018_07_10_101913_add_custom_fields_to_products_table', 1),
(111, '2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table', 1),
(112, '2018_07_17_163920_add_theme_skin_color_column_to_business_table', 1),
(113, '2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table', 1),
(114, '2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table', 1),
(115, '2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table', 1),
(116, '2018_07_26_124720_change_design_column_type_in_invoice_layouts_table', 1),
(117, '2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table', 1),
(118, '2018_07_28_103614_add_credit_limit_column_to_contacts_table', 1),
(119, '2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table', 1),
(120, '2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods', 1),
(121, '2018_08_14_104036_add_opening_balance_type_to_transactions_table', 1),
(122, '2018_09_04_155900_create_accounts_table', 1),
(123, '2018_09_06_114438_create_selling_price_groups_table', 1),
(124, '2018_09_06_154057_create_variation_group_prices_table', 1),
(125, '2018_09_07_102413_add_permission_to_access_default_selling_price', 1),
(126, '2018_09_07_134858_add_selling_price_group_id_to_transactions_table', 1),
(127, '2018_09_10_112448_update_product_type_to_single_if_null_in_products_table', 1),
(128, '2018_09_10_152703_create_account_transactions_table', 1),
(129, '2018_09_10_173656_add_account_id_column_to_transaction_payments_table', 1),
(130, '2018_09_19_123914_create_notification_templates_table', 1),
(131, '2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table', 1),
(132, '2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table', 1),
(133, '2018_09_26_105557_add_transaction_payments_for_existing_expenses', 1),
(134, '2018_09_27_111609_modify_transactions_table_for_purchase_return', 1),
(135, '2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table', 1),
(136, '2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table', 1),
(137, '2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table', 1),
(138, '2018_10_03_185947_add_default_notification_templates_to_database', 1),
(139, '2018_10_09_153105_add_business_id_to_transaction_payments_table', 1),
(140, '2018_10_16_135229_create_permission_for_sells_and_purchase', 1),
(141, '2018_10_22_114441_add_columns_for_variable_product_modifications', 1),
(142, '2018_10_22_134428_modify_variable_product_data', 1),
(143, '2018_10_30_181558_add_table_tax_headings_to_invoice_layout', 1),
(144, '2018_10_31_122619_add_pay_terms_field_transactions_table', 1),
(145, '2018_10_31_161328_add_new_permissions_for_pos_screen', 1),
(146, '2018_10_31_174752_add_access_selected_contacts_only_to_users_table', 1),
(147, '2018_10_31_175627_add_user_contact_access', 1),
(148, '2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table', 1),
(149, '2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table', 1),
(150, '2018_11_08_105621_add_role_permissions', 1),
(151, '2018_11_26_114135_add_is_suspend_column_to_transactions_table', 1),
(152, '2018_11_28_104410_modify_units_table_for_multi_unit', 1),
(153, '2018_11_28_170952_add_sub_unit_id_to_purchase_lines_and_sell_lines', 1),
(154, '2018_11_29_115918_add_primary_key_in_system_table', 1),
(155, '2018_12_03_185546_add_product_description_column_to_products_table', 1),
(156, '2018_12_06_114937_modify_system_table_and_users_table', 1),
(157, '2018_12_13_160007_add_custom_fields_display_options_to_invoice_layouts_table', 1),
(158, '2018_12_14_103307_modify_system_table', 1),
(159, '2018_12_18_133837_add_prev_balance_due_columns_to_invoice_layouts_table', 1),
(160, '2018_12_18_170656_add_invoice_token_column_to_transaction_table', 1),
(161, '2018_12_20_133639_add_date_time_format_column_to_invoice_layouts_table', 1),
(162, '2018_12_21_120659_add_recurring_invoice_fields_to_transactions_table', 1),
(163, '2018_12_24_154933_create_notifications_table', 1),
(164, '2019_01_08_112015_add_document_column_to_transaction_payments_table', 1),
(165, '2019_01_10_124645_add_account_permission', 1),
(166, '2019_01_16_125825_add_subscription_no_column_to_transactions_table', 1),
(167, '2019_01_28_111647_add_order_addresses_column_to_transactions_table', 1),
(168, '2019_02_13_173821_add_is_inactive_column_to_products_table', 1),
(169, '2019_02_19_103118_create_discounts_table', 1),
(170, '2019_02_21_120324_add_discount_id_column_to_transaction_sell_lines_table', 1),
(171, '2019_02_21_134324_add_permission_for_discount', 1),
(172, '2019_03_04_170832_add_service_staff_columns_to_transaction_sell_lines_table', 1),
(173, '2019_03_09_102425_add_sub_type_column_to_transactions_table', 1),
(174, '2019_03_09_124457_add_indexing_transaction_sell_lines_purchase_lines_table', 1),
(175, '2019_03_12_120336_create_activity_log_table', 1),
(176, '2019_03_15_132925_create_media_table', 1),
(177, '2019_05_08_130339_add_indexing_to_parent_id_in_transaction_payments_table', 1),
(178, '2019_05_10_132311_add_missing_column_indexing', 1),
(179, '2019_05_14_091812_add_show_image_column_to_invoice_layouts_table', 1),
(180, '2019_05_25_104922_add_view_purchase_price_permission', 1),
(181, '2019_06_17_103515_add_profile_informations_columns_to_users_table', 1),
(182, '2019_06_18_135524_add_permission_to_view_own_sales_only', 1),
(183, '2019_06_19_112058_add_database_changes_for_reward_points', 1),
(184, '2019_06_28_133732_change_type_column_to_string_in_transactions_table', 1),
(185, '2019_07_13_111420_add_is_created_from_api_column_to_transactions_table', 1),
(186, '2019_07_15_165136_add_fields_for_combo_product', 1),
(187, '2019_07_19_103446_add_mfg_quantity_used_column_to_purchase_lines_table', 1),
(188, '2019_07_22_152649_add_not_for_selling_in_product_table', 1),
(189, '2019_07_29_185351_add_show_reward_point_column_to_invoice_layouts_table', 1),
(190, '2019_08_08_162302_add_sub_units_related_fields', 1),
(191, '2019_08_26_133419_update_price_fields_decimal_point', 1),
(192, '2019_09_02_160054_remove_location_permissions_from_roles', 1),
(193, '2019_09_03_185259_add_permission_for_pos_screen', 1),
(194, '2019_09_04_163141_add_location_id_to_cash_registers_table', 1),
(195, '2019_09_04_184008_create_types_of_services_table', 1),
(196, '2019_09_06_131445_add_types_of_service_fields_to_transactions_table', 1),
(197, '2019_09_09_134810_add_default_selling_price_group_id_column_to_business_locations_table', 1),
(198, '2019_09_12_105616_create_product_locations_table', 1),
(199, '2019_09_17_122522_add_custom_labels_column_to_business_table', 1),
(200, '2019_09_18_164319_add_shipping_fields_to_transactions_table', 1),
(201, '2019_09_19_170927_close_all_active_registers', 1),
(202, '2019_09_23_161906_add_media_description_cloumn_to_media_table', 1),
(203, '2019_10_18_155633_create_account_types_table', 1),
(204, '2019_10_22_163335_add_common_settings_column_to_business_table', 1),
(205, '2019_10_29_132521_add_update_purchase_status_permission', 1),
(206, '2019_11_09_110522_add_indexing_to_lot_number', 1),
(207, '2019_11_19_170824_add_is_active_column_to_business_locations_table', 1),
(208, '2019_11_21_162913_change_quantity_field_types_to_decimal', 1),
(209, '2019_11_25_160340_modify_categories_table_for_polymerphic_relationship', 1),
(210, '2019_12_02_105025_create_warranties_table', 1),
(211, '2019_12_03_180342_add_common_settings_field_to_invoice_layouts_table', 1),
(212, '2019_12_05_183955_add_more_fields_to_users_table', 1),
(213, '2019_12_06_174904_add_change_return_label_column_to_invoice_layouts_table', 1),
(214, '2019_12_11_121307_add_draft_and_quotation_list_permissions', 1),
(215, '2019_12_12_180126_copy_expense_total_to_total_before_tax', 1),
(216, '2019_12_19_181412_make_alert_quantity_field_nullable_on_products_table', 1),
(217, '2019_12_25_173413_create_dashboard_configurations_table', 1),
(218, '2020_01_08_133506_create_document_and_notes_table', 1),
(219, '2020_01_09_113252_add_cc_bcc_column_to_notification_templates_table', 1),
(220, '2020_01_16_174818_add_round_off_amount_field_to_transactions_table', 1),
(221, '2020_01_28_162345_add_weighing_scale_settings_in_business_settings_table', 1),
(222, '2020_02_18_172447_add_import_fields_to_transactions_table', 1),
(223, '2020_03_13_135844_add_is_active_column_to_selling_price_groups_table', 1),
(224, '2020_03_16_115449_add_contact_status_field_to_contacts_table', 1),
(225, '2020_03_26_124736_add_allow_login_column_in_users_table', 1),
(226, '2020_04_13_154150_add_feature_products_column_to_business_loactions', 1),
(227, '2020_04_15_151802_add_user_type_to_users_table', 1),
(228, '2020_04_22_153905_add_subscription_repeat_on_column_to_transactions_table', 1),
(229, '2020_04_28_111436_add_shipping_address_to_contacts_table', 1),
(230, '2020_06_01_094654_add_max_sale_discount_column_to_users_table', 1),
(231, '2020_06_12_162245_modify_contacts_table', 1),
(232, '2020_06_22_103104_change_recur_interval_default_to_one', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(13, 'App\\User', 7),
(15, 'App\\User', 8),
(17, 'App\\User', 9),
(19, 'App\\User', 10);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `template_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci,
  `sms_body` text COLLATE utf8mb4_unicode_ci,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT '0',
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `business_id`, `template_for`, `email_body`, `sms_body`, `subject`, `cc`, `bcc`, `auto_send`, `auto_send_sms`, `created_at`, `updated_at`) VALUES
(1, 7, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', NULL, NULL, 0, 0, '2023-01-16 22:44:22', '2023-01-16 22:44:22'),
(2, 7, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', 'Payment Received, from {business_name}', NULL, NULL, 0, 0, '2023-01-16 22:44:22', '2023-01-16 22:44:22'),
(3, 7, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, '2023-01-16 22:44:22', '2023-01-16 22:44:22'),
(4, 7, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, '2023-01-16 22:44:22', '2023-01-16 22:44:22'),
(5, 7, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', 'New Order, from {business_name}', NULL, NULL, 0, 0, '2023-01-16 22:44:22', '2023-01-16 22:44:22'),
(6, 7, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, '2023-01-16 22:44:22', '2023-01-16 22:44:22'),
(7, 7, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', 'Items received, from {business_name}', NULL, NULL, 0, 0, '2023-01-16 22:44:22', '2023-01-16 22:44:22'),
(8, 7, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', 'Items Pending, from {business_name}', NULL, NULL, 0, 0, '2023-01-16 22:44:22', '2023-01-16 22:44:22'),
(9, 8, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', NULL, NULL, 0, 0, '2023-01-16 22:46:09', '2023-01-16 22:46:09'),
(10, 8, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', 'Payment Received, from {business_name}', NULL, NULL, 0, 0, '2023-01-16 22:46:09', '2023-01-16 22:46:09'),
(11, 8, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, '2023-01-16 22:46:09', '2023-01-16 22:46:09'),
(12, 8, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, '2023-01-16 22:46:09', '2023-01-16 22:46:09'),
(13, 8, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', 'New Order, from {business_name}', NULL, NULL, 0, 0, '2023-01-16 22:46:09', '2023-01-16 22:46:09'),
(14, 8, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, '2023-01-16 22:46:09', '2023-01-16 22:46:09'),
(15, 8, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', 'Items received, from {business_name}', NULL, NULL, 0, 0, '2023-01-16 22:46:09', '2023-01-16 22:46:09'),
(16, 8, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', 'Items Pending, from {business_name}', NULL, NULL, 0, 0, '2023-01-16 22:46:09', '2023-01-16 22:46:09'),
(17, 9, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', NULL, NULL, 0, 0, '2023-01-16 23:33:06', '2023-01-16 23:33:06'),
(18, 9, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', 'Payment Received, from {business_name}', NULL, NULL, 0, 0, '2023-01-16 23:33:06', '2023-01-16 23:33:06'),
(19, 9, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, '2023-01-16 23:33:06', '2023-01-16 23:33:06'),
(20, 9, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, '2023-01-16 23:33:06', '2023-01-16 23:33:06'),
(21, 9, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', 'New Order, from {business_name}', NULL, NULL, 0, 0, '2023-01-16 23:33:06', '2023-01-16 23:33:06'),
(22, 9, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, '2023-01-16 23:33:06', '2023-01-16 23:33:06'),
(23, 9, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', 'Items received, from {business_name}', NULL, NULL, 0, 0, '2023-01-16 23:33:06', '2023-01-16 23:33:06'),
(24, 9, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', 'Items Pending, from {business_name}', NULL, NULL, 0, 0, '2023-01-16 23:33:06', '2023-01-16 23:33:06'),
(25, 10, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', NULL, NULL, 0, 0, '2023-02-03 15:41:21', '2023-02-03 15:41:21'),
(26, 10, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', 'Payment Received, from {business_name}', NULL, NULL, 0, 0, '2023-02-03 15:41:21', '2023-02-03 15:41:21'),
(27, 10, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, '2023-02-03 15:41:21', '2023-02-03 15:41:21'),
(28, 10, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, '2023-02-03 15:41:21', '2023-02-03 15:41:21'),
(29, 10, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', 'New Order, from {business_name}', NULL, NULL, 0, 0, '2023-02-03 15:41:21', '2023-02-03 15:41:21'),
(30, 10, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, '2023-02-03 15:41:21', '2023-02-03 15:41:21'),
(31, 10, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', 'Items received, from {business_name}', NULL, NULL, 0, 0, '2023-02-03 15:41:21', '2023-02-03 15:41:21'),
(32, 10, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', 'Items Pending, from {business_name}', NULL, NULL, 0, 0, '2023-02-03 15:41:21', '2023-02-03 15:41:21');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2023-01-16 16:50:34', NULL),
(2, 'direct_sell.access', 'web', '2023-01-16 16:50:34', NULL),
(3, 'product.opening_stock', 'web', '2023-01-16 16:50:38', '2023-01-16 16:50:38'),
(4, 'crud_all_bookings', 'web', '2023-01-16 16:50:39', '2023-01-16 16:50:39'),
(5, 'crud_own_bookings', 'web', '2023-01-16 16:50:39', '2023-01-16 16:50:39'),
(6, 'access_default_selling_price', 'web', '2023-01-16 16:50:41', '2023-01-16 16:50:41'),
(7, 'purchase.payments', 'web', '2023-01-16 16:50:42', '2023-01-16 16:50:42'),
(8, 'sell.payments', 'web', '2023-01-16 16:50:42', '2023-01-16 16:50:42'),
(9, 'edit_product_price_from_sale_screen', 'web', '2023-01-16 16:50:42', '2023-01-16 16:50:42'),
(10, 'edit_product_discount_from_sale_screen', 'web', '2023-01-16 16:50:42', '2023-01-16 16:50:42'),
(11, 'roles.view', 'web', '2023-01-16 16:50:43', '2023-01-16 16:50:43'),
(12, 'roles.create', 'web', '2023-01-16 16:50:43', '2023-01-16 16:50:43'),
(13, 'roles.update', 'web', '2023-01-16 16:50:43', '2023-01-16 16:50:43'),
(14, 'roles.delete', 'web', '2023-01-16 16:50:43', '2023-01-16 16:50:43'),
(15, 'account.access', 'web', '2023-01-16 16:50:44', '2023-01-16 16:50:44'),
(16, 'discount.access', 'web', '2023-01-16 16:50:44', '2023-01-16 16:50:44'),
(17, 'view_purchase_price', 'web', '2023-01-16 16:50:46', '2023-01-16 16:50:46'),
(18, 'view_own_sell_only', 'web', '2023-01-16 16:50:46', '2023-01-16 16:50:46'),
(19, 'edit_product_discount_from_pos_screen', 'web', '2023-01-16 16:50:48', '2023-01-16 16:50:48'),
(20, 'edit_product_price_from_pos_screen', 'web', '2023-01-16 16:50:48', '2023-01-16 16:50:48'),
(21, 'access_shipping', 'web', '2023-01-16 16:50:49', '2023-01-16 16:50:49'),
(22, 'purchase.update_status', 'web', '2023-01-16 16:50:49', '2023-01-16 16:50:49'),
(23, 'list_drafts', 'web', '2023-01-16 16:50:50', '2023-01-16 16:50:50'),
(24, 'list_quotations', 'web', '2023-01-16 16:50:50', '2023-01-16 16:50:50'),
(25, 'user.view', 'web', '2023-01-16 16:52:05', NULL),
(26, 'user.create', 'web', '2023-01-16 16:52:05', NULL),
(27, 'user.update', 'web', '2023-01-16 16:52:05', NULL),
(28, 'user.delete', 'web', '2023-01-16 16:52:05', NULL),
(29, 'supplier.view', 'web', '2023-01-16 16:52:05', NULL),
(30, 'supplier.create', 'web', '2023-01-16 16:52:05', NULL),
(31, 'supplier.update', 'web', '2023-01-16 16:52:05', NULL),
(32, 'supplier.delete', 'web', '2023-01-16 16:52:05', NULL),
(33, 'customer.view', 'web', '2023-01-16 16:52:05', NULL),
(34, 'customer.create', 'web', '2023-01-16 16:52:05', NULL),
(35, 'customer.update', 'web', '2023-01-16 16:52:05', NULL),
(36, 'customer.delete', 'web', '2023-01-16 16:52:05', NULL),
(37, 'product.view', 'web', '2023-01-16 16:52:05', NULL),
(38, 'product.create', 'web', '2023-01-16 16:52:05', NULL),
(39, 'product.update', 'web', '2023-01-16 16:52:05', NULL),
(40, 'product.delete', 'web', '2023-01-16 16:52:05', NULL),
(41, 'purchase.view', 'web', '2023-01-16 16:52:05', NULL),
(42, 'purchase.create', 'web', '2023-01-16 16:52:05', NULL),
(43, 'purchase.update', 'web', '2023-01-16 16:52:05', NULL),
(44, 'purchase.delete', 'web', '2023-01-16 16:52:05', NULL),
(45, 'sell.view', 'web', '2023-01-16 16:52:05', NULL),
(46, 'sell.create', 'web', '2023-01-16 16:52:05', NULL),
(47, 'sell.update', 'web', '2023-01-16 16:52:05', NULL),
(48, 'sell.delete', 'web', '2023-01-16 16:52:05', NULL),
(49, 'purchase_n_sell_report.view', 'web', '2023-01-16 16:52:05', NULL),
(50, 'contacts_report.view', 'web', '2023-01-16 16:52:05', NULL),
(51, 'stock_report.view', 'web', '2023-01-16 16:52:05', NULL),
(52, 'tax_report.view', 'web', '2023-01-16 16:52:05', NULL),
(53, 'trending_product_report.view', 'web', '2023-01-16 16:52:05', NULL),
(54, 'register_report.view', 'web', '2023-01-16 16:52:05', NULL),
(55, 'sales_representative.view', 'web', '2023-01-16 16:52:05', NULL),
(56, 'expense_report.view', 'web', '2023-01-16 16:52:05', NULL),
(57, 'business_settings.access', 'web', '2023-01-16 16:52:05', NULL),
(58, 'barcode_settings.access', 'web', '2023-01-16 16:52:05', NULL),
(59, 'invoice_settings.access', 'web', '2023-01-16 16:52:05', NULL),
(60, 'brand.view', 'web', '2023-01-16 16:52:05', NULL),
(61, 'brand.create', 'web', '2023-01-16 16:52:05', NULL),
(62, 'brand.update', 'web', '2023-01-16 16:52:05', NULL),
(63, 'brand.delete', 'web', '2023-01-16 16:52:05', NULL),
(64, 'tax_rate.view', 'web', '2023-01-16 16:52:05', NULL),
(65, 'tax_rate.create', 'web', '2023-01-16 16:52:05', NULL),
(66, 'tax_rate.update', 'web', '2023-01-16 16:52:05', NULL),
(67, 'tax_rate.delete', 'web', '2023-01-16 16:52:05', NULL),
(68, 'unit.view', 'web', '2023-01-16 16:52:05', NULL),
(69, 'unit.create', 'web', '2023-01-16 16:52:05', NULL),
(70, 'unit.update', 'web', '2023-01-16 16:52:05', NULL),
(71, 'unit.delete', 'web', '2023-01-16 16:52:05', NULL),
(72, 'category.view', 'web', '2023-01-16 16:52:05', NULL),
(73, 'category.create', 'web', '2023-01-16 16:52:05', NULL),
(74, 'category.update', 'web', '2023-01-16 16:52:05', NULL),
(75, 'category.delete', 'web', '2023-01-16 16:52:05', NULL),
(76, 'expense.access', 'web', '2023-01-16 16:52:05', NULL),
(77, 'access_all_locations', 'web', '2023-01-16 16:52:05', NULL),
(78, 'dashboard.data', 'web', '2023-01-16 16:52:05', NULL),
(79, 'location.1', 'web', '2023-01-16 22:44:22', '2023-01-16 22:44:22'),
(80, 'location.2', 'web', '2023-01-16 22:46:09', '2023-01-16 22:46:09'),
(81, 'location.3', 'web', '2023-01-16 23:33:06', '2023-01-16 23:33:06'),
(82, 'selling_price_group.1', 'web', '2023-02-02 18:54:53', '2023-02-02 18:54:53'),
(83, 'location.4', 'web', '2023-02-03 15:41:21', '2023-02-03 15:41:21'),
(84, 'selling_price_group.2', 'web', '2023-02-03 13:41:12', '2023-02-03 13:41:12');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` enum('network','windows','linux') COLLATE utf8mb4_unicode_ci NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier','combo') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int UNSIGNED DEFAULT NULL,
  `sub_unit_ids` text COLLATE utf8mb4_unicode_ci,
  `brand_id` int UNSIGNED DEFAULT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `sub_category_id` int UNSIGNED DEFAULT NULL,
  `tax` int UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT '0',
  `alert_quantity` decimal(22,4) DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT '0',
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int UNSIGNED NOT NULL,
  `warranty_id` int DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT '0',
  `not_for_selling` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `image`, `product_description`, `created_by`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(1, 'Kabras Sugar', 9, 'single', 3, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, '200.0000', '0001', 'C128', NULL, NULL, 0, '2kgs', NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, 0, 0, '2023-01-16 21:24:23', '2023-01-16 21:24:23'),
(2, 'Darling Fluffy Kinky -30', 8, 'single', 2, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, NULL, '0002', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, 0, 0, '2023-02-02 18:55:24', '2023-02-02 18:55:32'),
(3, 'Darling betty No 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0003', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 13:41:52', '2023-02-03 13:41:59'),
(4, 'Darling betty 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0004', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:04:36', '2023-02-03 14:04:58'),
(5, 'Darling betty 1/350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0005', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:07:07', '2023-02-03 14:07:28'),
(6, 'Darling blessing 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0006', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:11:22', '2023-02-03 14:11:42'),
(7, 'Darling blessing 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0007', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:13:44', '2023-02-03 14:14:00'),
(8, 'Darling blessing 1/350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0008', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:19:03', '2023-02-03 14:19:28'),
(9, 'Darling Brazillian VIP 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0009', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:24:46', '2023-02-03 14:28:15'),
(10, 'Darling Brazillian VIP 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0010', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:27:10', '2023-02-03 14:27:18'),
(11, 'Darling Croplazer 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0011', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:29:19', '2023-02-03 14:29:30'),
(12, 'Darling Diva w VIP 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0012', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:31:08', '2023-02-03 14:35:28'),
(13, 'Darling Mayfair Celebrity 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0013', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:32:23', '2023-02-03 14:32:36'),
(14, 'Darling Mayfair Celebrity 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0014', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:33:32', '2023-02-03 14:33:47'),
(15, 'Darling Mayfair Celebrity 1/350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0015', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:34:50', '2023-02-03 14:35:03'),
(16, 'Darling Pixie star 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0016', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:36:24', '2023-02-03 14:36:29'),
(17, 'Darling Pixie star 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0017', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:37:32', '2023-02-03 14:37:40'),
(18, 'Darling Pixie star 1/350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0018', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:38:28', '2023-02-03 14:38:35'),
(19, 'Darling Pixie star 1/900', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0019', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:40:24', '2023-02-03 14:40:38'),
(20, 'Darling Bobby braid 1', 10, 'single', 4, NULL, NULL, 2, NULL, NULL, 'exclusive', 1, NULL, '0020', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:41:27', '2023-02-03 14:58:25'),
(21, 'Darling Bobby braid 1/33', 10, 'single', 4, NULL, NULL, 2, NULL, NULL, 'exclusive', 1, NULL, '0021', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:42:32', '2023-02-03 14:57:03'),
(22, 'Darling Bobby braid 2/27', 10, 'single', 4, NULL, NULL, 2, NULL, NULL, 'exclusive', 1, NULL, '0022', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:43:38', '2023-02-03 14:57:52'),
(23, 'Darling Bobby braid 1/350', 10, 'single', 4, NULL, NULL, 2, NULL, NULL, 'exclusive', 1, NULL, '0023', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:45:03', '2023-02-03 14:57:24'),
(24, 'Darling Passion twist 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0024', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:45:57', '2023-02-03 14:46:05'),
(25, 'Darling Passion twist 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0025', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:46:46', '2023-02-03 14:46:52'),
(26, 'Darling Passion twist 2/30', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0026', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:47:44', '2023-02-03 14:47:50'),
(27, 'Darling Passion twist 2/27', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0027', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:49:15', '2023-02-03 14:49:23'),
(28, 'Darling Adara 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0028', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:50:14', '2023-02-03 14:50:24'),
(29, 'Darling Adara 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0029', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:51:05', '2023-02-03 14:51:14'),
(30, 'Darling Adara 1/900', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0030', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:52:07', '2023-02-03 14:52:15'),
(31, 'Darling Adara 2/27', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0031', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:52:58', '2023-02-03 14:53:07'),
(32, 'Darling Adara 1/350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0032', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:54:03', '2023-02-03 14:54:11'),
(33, 'Darling Fluffy kinky long 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0033', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:55:43', '2023-02-03 14:55:57'),
(34, 'Darling Fluffy kinky long 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0034', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 14:59:03', '2023-02-03 14:59:12'),
(35, 'Darling New viva 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0035', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:00:31', '2023-02-03 15:00:47'),
(36, 'Darling New viva 1/ 33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0036', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:01:33', '2023-02-03 15:01:41'),
(37, 'Darling New viva 1/350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0037', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:02:24', '2023-02-03 15:02:36'),
(38, 'Darling Ayana 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0038', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:03:12', '2023-02-03 15:03:19'),
(39, 'Darling Ayana 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0039', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:03:58', '2023-02-03 15:04:03'),
(40, 'Darling Ayana 1/350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0040', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:04:37', '2023-02-03 15:04:44'),
(41, 'Darling Sabina 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0041', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:05:34', '2023-02-03 15:05:40'),
(42, 'Darling Sabina 1/350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0042', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:07:14', '2023-02-03 15:07:20'),
(43, 'Darling Venetta 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0043', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:08:10', '2023-02-03 15:08:18'),
(45, 'Darling Venetta 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0045', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:10:15', '2023-02-03 15:10:21'),
(46, 'Darling Kinky Dread 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0046', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:11:11', '2023-02-03 15:11:24'),
(47, 'Darling Kinky Dread 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0047', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:12:20', '2023-02-03 15:12:28'),
(48, 'Darling Kinky Dread 1/350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0048', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:13:17', '2023-02-03 15:13:28'),
(49, 'Darling Elite 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0049', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:14:01', '2023-02-03 15:14:17'),
(50, 'Darling Elite 1/900', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0050', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:14:54', '2023-02-03 15:15:05'),
(51, 'Darling Elite 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0051', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:15:46', '2023-02-03 15:15:56'),
(52, 'Darling Sunny shade 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0052', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:16:57', '2023-02-03 15:17:10'),
(53, 'Darling Sunny shade 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0053', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:28:21', '2023-02-03 15:28:33'),
(54, 'Darling Ada 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0054', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:30:22', '2023-02-03 15:30:34'),
(55, 'Darling Ada 1/350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0055', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:31:28', '2023-02-03 15:31:41'),
(56, 'Darling Afro baby 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0056', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:32:25', '2023-02-03 15:32:35'),
(57, 'Darling Afro baby 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0057', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:33:24', '2023-02-03 15:33:32'),
(58, 'Darling Afro baby 1/350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0058', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:34:13', '2023-02-03 15:34:20'),
(59, 'Darling Afro baby 1/900', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0059', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:35:07', '2023-02-03 15:35:14'),
(60, 'Darling Afro baby 27', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0060', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:37:10', '2023-02-03 15:37:17'),
(61, 'Darling Natural Yaki Plus 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0061', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:38:06', '2023-02-03 15:38:14'),
(62, 'Darling Natural Yaki Plus 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0062', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:39:10', '2023-02-03 15:39:16'),
(63, 'Darling Fancy Curls 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0063', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:40:02', '2023-02-03 15:40:13'),
(64, 'Darling Fancy Curls 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0064', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:40:55', '2023-02-03 15:41:10'),
(65, 'Darling Fancy Curls 1/900', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0065', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:42:00', '2023-02-03 15:42:07'),
(66, 'Darling Fancy Curls 1/350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0066', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:43:10', '2023-02-03 15:43:17'),
(67, 'Darling Bella crotchet 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0067', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:44:13', '2023-02-03 15:44:23'),
(68, 'Darling no.1350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0068', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:45:06', '2023-02-03 15:45:18'),
(69, 'Darling MAMBO CURL NO.1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0069', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:46:27', '2023-02-03 15:46:27'),
(70, 'Darling MAMBO CURL NO.1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0070', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:46:50', '2023-02-03 15:47:00'),
(71, 'Darling no.133', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0071', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:47:49', '2023-02-03 15:48:02'),
(72, 'Darling no.1350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0072', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:48:40', '2023-02-03 15:48:50'),
(73, 'Darling SPRING TWIST no.1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0073', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:49:28', '2023-02-03 15:49:38'),
(74, 'Darling no.133', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0074', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:50:18', '2023-02-03 15:50:26'),
(75, 'Darling no.227', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0075', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:51:16', '2023-02-03 15:51:24'),
(76, 'Darling Afro twist bulk 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0076', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:52:38', '2023-02-03 15:52:48'),
(77, 'Darling Afro twist bulk  1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0077', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 15:53:55', '2023-02-03 15:54:02'),
(80, 'Sun cream Dr Rashel', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0080', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 22:49:07', '2023-02-03 22:49:22'),
(81, 'Sun cream 90+', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0081', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 22:50:27', '2023-02-03 22:50:35'),
(82, 'Eye lashes mac', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0082', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 22:51:47', '2023-02-03 22:51:56'),
(83, 'Rubber band black', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0083', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 22:52:50', '2023-02-03 22:52:59'),
(84, 'Rubber band strong (colours)', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0084', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 22:54:12', '2023-02-03 22:54:19'),
(85, 'Set brush in bag', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0085', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 22:55:19', '2023-02-03 22:55:29'),
(86, 'sleek lipstick', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0086', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 22:56:24', '2023-02-03 22:56:32'),
(87, '3 in 1 comb small', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0087', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:01:08', '2023-02-03 23:01:16'),
(88, 'Fit me foundation/fixer', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0088', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:02:54', '2023-02-03 23:03:03'),
(89, 'L.A Primer/ Setting spray', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0089', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:03:57', '2023-02-03 23:04:07'),
(90, 'L.A Girl fixer', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0090', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:04:55', '2023-02-03 23:05:01'),
(91, 'Fit me fixer', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0091', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:05:59', '2023-02-03 23:06:07'),
(92, 'Dose Lipstick', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0092', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:07:07', '2023-02-03 23:07:13'),
(93, 'Eyeliner matte kiss beauty', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0093', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:08:20', '2023-02-03 23:08:33'),
(94, 'Primer Karite flower', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0094', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:09:57', '2023-02-03 23:10:06'),
(95, 'Green tea foundation', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0095', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:11:01', '2023-02-03 23:11:08'),
(96, 'Primer aloe karite', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0096', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:12:02', '2023-02-03 23:12:11'),
(97, 'Primer fit me karite', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0097', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:13:08', '2023-02-03 23:15:22'),
(98, 'Collagen foundation', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0098', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:16:41', '2023-02-03 23:16:52'),
(99, 'Snail foundation kiss beauty', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0099', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:17:58', '2023-02-03 23:18:08'),
(100, 'Darling Afro twist bulk 2/30nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0100', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:18:46', '2023-02-03 23:18:46'),
(101, 'Primer camel milk', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0101', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:19:11', '2023-02-03 23:19:18'),
(102, 'Darling Afro twist bulk 2/3', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0102', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:19:19', '2023-02-03 23:19:30'),
(103, 'Super stay powder kiss beauty', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0103', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:21:03', '2023-02-03 23:21:09'),
(104, 'Huddah beality matte Lipstick', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0104', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:22:00', '2023-02-03 23:22:06'),
(105, 'Aloevera Primer', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0105', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:23:33', '2023-02-03 23:23:45'),
(106, 'Afro comb big', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0106', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:24:31', '2023-02-03 23:24:38'),
(107, 'Afro comb small', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0107', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:25:30', '2023-02-03 23:25:36'),
(108, 'Alice eyeliner', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0108', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:26:25', '2023-02-03 23:26:35'),
(109, 'Alice mascara', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0109', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:27:19', '2023-02-03 23:27:26'),
(110, 'Blackopal Primer', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0110', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:28:20', '2023-02-03 23:28:26'),
(111, 'Blackopal Foundation 38gm', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0111', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:29:15', '2023-02-03 23:29:26'),
(112, 'Blackopal powder', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0112', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:30:20', '2023-02-03 23:30:27'),
(113, 'Dear bodysplash 236ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0113', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:31:17', '2023-02-03 23:31:24'),
(114, 'Dear bodysplash 59ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0114', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:32:07', '2023-02-03 23:32:13'),
(115, 'Uniflame rollon', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0115', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:33:00', '2023-02-03 23:33:06'),
(116, 'Tail comb Crystal', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0116', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:34:00', '2023-02-03 23:34:07'),
(117, 'Micolor eyeshadow', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0117', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:35:18', '2023-02-03 23:35:25'),
(118, 'Essence mascara', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0118', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:36:15', '2023-02-03 23:36:21'),
(119, 'Blackopal matte foundation', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0119', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:36:58', '2023-02-03 23:37:04'),
(120, 'Final love foundation', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0120', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:37:41', '2023-02-03 23:37:47'),
(121, 'Darling Afro twist bulk 30', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0121', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:38:11', '2023-02-03 23:38:29'),
(122, 'Fit me primer infallible', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0122', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:38:29', '2023-02-03 23:38:34'),
(123, 'FOF eyeliner', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0123', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:39:28', '2023-02-03 23:39:34'),
(124, 'Darling Desire 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0124', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:39:52', '2023-02-03 23:40:06'),
(125, 'Green tea primer', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0125', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:40:18', '2023-02-03 23:40:26'),
(126, 'Handle comb', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0126', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:41:07', '2023-02-03 23:41:29'),
(127, 'Darling Desire 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0127', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:41:35', '2023-02-03 23:41:51'),
(128, 'Huddah Lipstick', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0128', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:42:06', '2023-02-03 23:42:12'),
(129, 'Jolly combs', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0129', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:42:53', '2023-02-03 23:42:58'),
(130, 'Darling Desire 1/350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0130', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:42:56', '2023-02-03 23:43:07'),
(131, 'BB Foundation kiss beauty', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0131', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:43:41', '2023-02-03 23:43:46'),
(132, 'Darling Desire 1/900', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0132', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:44:02', '2023-02-03 23:44:24'),
(133, 'Macc Lipstick', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0133', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:44:18', '2023-02-03 23:44:23'),
(134, 'Romantic may mascara 2in1 big', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0134', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:45:00', '2023-02-03 23:45:05'),
(135, 'Changxiao mascara 2in1 small', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0135', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:45:47', '2023-02-03 23:45:53'),
(136, 'Darling Nikita 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0136', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:45:54', '2023-02-03 23:46:02'),
(137, 'Pro- conceal milani diary', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0137', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:46:54', '2023-02-03 23:47:01'),
(138, 'Fluffy Kinky 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0138', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:47:51', '2023-02-03 23:48:13'),
(139, 'Mirror flip', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0139', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:47:51', '2023-02-03 23:47:56'),
(140, 'Monday to Sunday body splash', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0140', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:48:36', '2023-02-03 23:48:42'),
(141, 'Fluffy Kinky 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0141', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:49:06', '2023-02-03 23:49:23'),
(142, 'Make up blender Huda beauty  mix', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0142', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:49:45', '2023-02-03 23:49:52'),
(143, 'Fluffy Kinky 1/350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0143', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:50:28', '2023-02-03 23:50:33'),
(144, 'Ribia beauty eyeshadow', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0144', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:50:43', '2023-02-03 23:50:49'),
(145, 'Fluffy Kinky 2/30', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0145', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:51:22', '2023-02-03 23:51:34'),
(146, 'Muse style eyeshadow', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0146', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:51:33', '2023-02-03 23:51:40'),
(147, 'Fluffy Kinky 30', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0147', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:52:39', '2023-02-03 23:52:52'),
(148, 'Foot scrubber', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0148', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:52:41', '2023-02-03 23:52:48'),
(149, 'Foot scrubber with file', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0149', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:53:41', '2023-02-03 23:53:46'),
(150, 'Set brush with sponge electra', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0150', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:54:30', '2023-02-03 23:54:36'),
(151, 'Dear body shower gel 295ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0151', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:55:28', '2023-02-03 23:55:34'),
(152, 'Body Luxuries shower gel 350ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0152', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:56:33', '2023-02-03 23:56:47'),
(153, 'Fluffy Kinky 33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0153', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:57:17', '2023-02-03 23:57:28'),
(154, 'Sleek powder', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0154', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:58:34', '2023-02-03 23:58:54'),
(155, 'Fluffy Kinky 27', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0155', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:59:50', '2023-02-03 23:59:58'),
(156, 'Sleek matte foundation 38ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0156', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-03 23:59:57', '2023-02-04 00:00:06'),
(157, 'Sleek lip gloss 5.5g', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0157', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:00:50', '2023-02-04 00:00:56'),
(158, 'Darling Super natural locs 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0158', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:01:13', '2023-02-04 00:01:23'),
(159, 'Sleek primer', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0159', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:01:46', '2023-02-04 00:01:51'),
(160, 'Make up blender', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0160', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:02:30', '2023-02-04 00:02:40'),
(161, 'Darling Super natural locs 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0161', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:02:50', '2023-02-04 00:03:05'),
(162, 'Weaving cap cool mesh', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0162', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:03:33', '2023-02-04 00:03:39'),
(163, 'Darling Super natural locs 1/350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0163', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:03:57', '2023-02-04 00:04:05'),
(164, 'Jackelin naughty pallete eyeshadow', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0164', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:04:25', '2023-02-04 00:04:32'),
(165, 'Darling Super natural locs 2/30', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0165', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:05:06', '2023-02-04 00:05:13'),
(166, 'Fit me classic foundation', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0166', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:05:06', '2023-02-04 00:05:12'),
(167, 'Darling Abuja Long 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0167', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:06:18', '2023-02-04 00:06:28'),
(168, 'Hair pin big', 10, 'single', 5, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0168', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:06:55', '2023-02-04 00:07:20'),
(169, 'Darling Abuja Long 2', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0169', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:07:26', '2023-02-04 00:07:33'),
(170, 'Darling Abuja Long 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0170', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:08:37', '2023-02-04 00:08:44'),
(171, 'Dread sponge big', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0171', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:08:39', '2023-02-04 00:08:48'),
(172, 'Barber brush', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0172', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:09:32', '2023-02-04 00:09:38'),
(173, 'Darling Abuja Long 33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0173', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:09:40', '2023-02-04 00:09:46'),
(174, 'Separators', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0174', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:10:20', '2023-02-04 00:10:26'),
(175, 'Darling Abuja Long 30', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0175', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:10:59', '2023-02-04 00:11:10'),
(176, 'Bra straps glitters', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0176', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:11:31', '2023-02-04 00:11:36'),
(177, 'Bra straps fashion', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0177', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:12:18', '2023-02-04 00:12:22'),
(178, 'Darling Abuja Long 2/30', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0178', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:12:19', '2023-02-04 00:12:26'),
(179, 'Orange stick', 10, 'single', 5, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0179', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:13:08', '2023-02-04 00:14:09'),
(180, 'Buffer sunshine plain', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0180', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:14:56', '2023-02-04 00:15:00'),
(181, 'Wooden jollysmall', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0181', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:15:51', '2023-02-04 00:15:56'),
(182, 'Cutical remover', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0182', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:17:10', '2023-02-04 00:17:17'),
(183, 'Niper', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0183', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:18:15', '2023-02-04 00:18:20'),
(184, 'Kid fancy hairband', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0184', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:19:06', '2023-02-04 00:19:11'),
(185, 'Charmax small', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0185', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:19:54', '2023-02-04 00:19:59'),
(186, 'Moulding gel wax 125ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0186', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:21:38', '2023-02-04 00:21:45'),
(187, 'Wooden comb big', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0187', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:22:37', '2023-02-04 00:22:43'),
(188, 'Beads plastic small', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0188', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:23:24', '2023-02-04 00:23:29'),
(189, 'Oval clip', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0189', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:24:28', '2023-02-04 00:24:34'),
(190, 'Bathing gloves', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0190', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:25:14', '2023-02-04 00:25:22'),
(191, 'Pearl hairbands', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0191', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:25:59', '2023-02-04 00:26:05'),
(192, 'Neckroll', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0192', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:26:49', '2023-02-04 00:26:54'),
(193, 'Sponge pods', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0193', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:28:44', '2023-02-04 00:28:50'),
(194, 'Paradise remover 60ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0194', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:29:29', '2023-02-04 00:29:35'),
(195, 'Paradise remover 30ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0195', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:30:18', '2023-02-04 00:30:23'),
(196, 'Lip gloss vc', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0196', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:31:07', '2023-02-04 00:31:13'),
(197, 'Lip gloss may', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0197', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:31:50', '2023-02-04 00:31:55'),
(198, 'Bandana', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0198', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:32:44', '2023-02-04 00:32:49'),
(199, 'Darling Abuja Long 1/900', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0199', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:32:55', '2023-02-04 00:33:02'),
(200, 'Christina ornaments big', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0200', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:33:25', '2023-02-04 00:33:31'),
(201, 'Darling Abuja Long 1/350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0201', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:33:52', '2023-02-04 00:34:03'),
(202, 'Nail glue', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0202', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:34:17', '2023-02-04 00:34:22'),
(203, 'Darling Abuja Long 27', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0203', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:34:48', '2023-02-04 00:34:58'),
(204, 'G- nail', 10, 'single', 5, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0204', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:35:23', '2023-02-04 00:37:22'),
(205, 'Darling Abuja Long 9', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0205', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:35:51', '2023-02-04 00:36:01'),
(206, 'Darling Abuja Long 350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0206', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:36:44', '2023-02-04 00:38:37'),
(207, 'Foot scrubber', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0207', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:37:56', '2023-02-04 00:38:01'),
(208, '4in1 pedicure', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0208', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:38:41', '2023-02-04 00:38:46'),
(209, 'Wig cap', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0209', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:39:24', '2023-02-04 00:39:29'),
(210, 'Metal beads', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0210', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:40:07', '2023-02-04 00:40:11'),
(211, 'Darling Abuja Short 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0211', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:40:09', '2023-02-04 00:40:21'),
(212, 'Stretcher haiband Material', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0212', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:40:47', '2023-02-04 00:40:52'),
(213, 'Darling Abuja Short 2', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0213', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:41:13', '2023-02-04 00:41:19'),
(214, 'Bettar massage oil  300ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0214', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:41:34', '2023-02-04 00:41:39'),
(215, 'Bettar massage oil  500ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0215', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:42:17', '2023-02-04 00:42:22'),
(216, 'Darling Abuja Short 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0216', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:42:33', '2023-02-04 00:42:44'),
(217, 'Samrat blade', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0217', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:43:03', '2023-02-04 00:43:09'),
(218, 'Darling Abuja Short 33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0218', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:43:30', '2023-02-04 00:43:39');
INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `image`, `product_description`, `created_by`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(219, 'Beads plastic big pkt', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0219', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:43:54', '2023-02-04 00:45:00'),
(220, 'Darling Abuja Short 30', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0220', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:44:25', '2023-02-04 00:44:32'),
(221, 'Darling super meche 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0221', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:45:29', '2023-02-04 00:45:39'),
(222, 'Mode love small cutex', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0222', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:45:31', '2023-02-04 00:45:36'),
(223, 'Dexe hair shampoo', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0223', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:46:22', '2023-02-04 00:46:26'),
(224, 'Darling super meche 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0224', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:46:36', '2023-02-04 00:46:36'),
(225, 'Darling super meche 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0225', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:46:51', '2023-02-04 00:46:58'),
(226, 'Coconut oil sultana 150ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0226', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:47:07', '2023-02-04 00:47:14'),
(227, 'Darling super meche 27', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0227', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:47:43', '2023-02-04 00:47:51'),
(228, 'Coconut oil sultana 70ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0228', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:47:53', '2023-02-04 00:47:58'),
(229, 'Darling Jumbo braid 4in1) 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0229', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:48:38', '2023-02-04 00:48:51'),
(230, 'Braiding comb', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0230', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:48:43', '2023-02-04 00:48:47'),
(231, 'Shower cap eva', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0231', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:49:27', '2023-02-04 00:49:32'),
(232, 'Darling Jumbo braid 4in1) 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0232', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:49:43', '2023-02-04 00:49:50'),
(233, 'Kids head band accessories', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0233', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:50:13', '2023-02-04 00:50:18'),
(234, 'Darling Jumbo braid 4in1) 1/350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0234', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:51:23', '2023-02-04 00:51:34'),
(235, 'Stundents pony', 10, 'single', 6, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0235', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:52:24', '2023-02-04 00:52:31'),
(236, 'Baby care 500gm', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0236', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:53:16', '2023-02-04 00:53:21'),
(237, 'Baby care 200gm', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0237', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:53:57', '2023-02-04 00:54:02'),
(238, 'Darling Pamoja 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0238', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:54:39', '2023-02-04 00:54:44'),
(239, 'Robin single', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0239', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:54:55', '2023-02-04 00:55:00'),
(240, 'Acetone 500ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0240', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:55:43', '2023-02-04 00:55:49'),
(241, 'Darling Pamoja 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0241', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:55:45', '2023-02-04 00:55:53'),
(242, 'Moulding gel wax 500ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0242', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:56:36', '2023-02-04 00:56:47'),
(243, 'Darling Pamoja 33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0243', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:56:46', '2023-02-04 00:56:53'),
(244, 'Acetone 300ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0244', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:57:23', '2023-02-04 00:57:29'),
(245, 'Darling Pencil kinky 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0245', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:57:50', '2023-02-04 00:57:59'),
(246, 'Surgical spirit bettar 500ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0246', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:58:13', '2023-02-04 00:58:18'),
(247, 'Darling Ponytail star 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0247', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:58:48', '2023-02-04 00:58:48'),
(248, 'Darling Ponytail star 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0248', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:59:00', '2023-02-04 00:59:07'),
(249, 'Eco styling gel 236ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0249', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:59:17', '2023-02-04 00:59:23'),
(250, 'Darling Ponytail star 2/30', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0250', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 00:59:56', '2023-02-04 01:00:03'),
(251, 'Rake comb big', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0251', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:00:01', '2023-02-04 01:00:05'),
(252, 'Scissors creation', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0252', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:00:40', '2023-02-04 01:00:44'),
(253, 'Darling Ponytail star 1/350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0253', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:00:53', '2023-02-04 01:01:00'),
(254, 'Wooden beads', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0254', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:01:20', '2023-02-04 01:01:23'),
(255, 'Darling Ponytail star 1/900', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0255', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:01:48', '2023-02-04 01:02:01'),
(256, 'Scrubing stones', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0256', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:02:10', '2023-02-04 01:02:29'),
(257, 'Darling Twinkle braid 1/350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0257', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:02:44', '2023-02-04 01:02:54'),
(258, 'OPI Files', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0258', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:03:08', '2023-02-04 01:03:13'),
(259, 'Darling Twinkle braid 230', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0259', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:03:53', '2023-02-04 01:04:00'),
(260, 'Davis eyepencil', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0260', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:03:53', '2023-02-04 01:03:58'),
(261, 'Darling Twinkle braid 1 blue', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0261', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:04:45', '2023-02-04 01:04:57'),
(262, 'Buffer colours smiel', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0262', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:04:47', '2023-02-04 01:05:39'),
(263, 'Darling Ultra Expression 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0263', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:05:44', '2023-02-04 01:05:51'),
(264, 'Davis eyepencil short', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0264', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:06:20', '2023-02-04 01:06:26'),
(265, 'Darling Ultra Expression 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0265', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:06:39', '2023-02-04 01:06:47'),
(266, 'Crotchet', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0266', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:07:12', '2023-02-04 01:07:18'),
(267, 'Darling Curly kinky 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0267', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:07:59', '2023-02-04 01:08:08'),
(268, 'Crotchet', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0268', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:08:55', '2023-02-04 01:09:01'),
(269, 'Darling Curly kinky 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0269', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:09:04', '2023-02-04 01:09:14'),
(270, 'Darling Curly kinky 1/900', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0270', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:10:15', '2023-02-04 01:10:23'),
(271, 'Elastic plain hairband black/colour', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0271', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:11:07', '2023-02-04 01:11:59'),
(272, 'Hairbands flowers black', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0272', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:12:39', '2023-02-04 01:12:45'),
(273, 'Lip gloss clear sleek', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0273', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:13:26', '2023-02-04 01:13:31'),
(274, 'Darling Abuja Extra Long 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0274', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:13:44', '2023-02-04 01:13:51'),
(275, 'Hairclips', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0275', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:14:17', '2023-02-04 01:14:22'),
(276, 'Darling Abuja Extra Long 30', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0276', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:14:35', '2023-02-04 01:14:42'),
(277, 'Wooden comb medium', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0277', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:15:00', '2023-02-04 01:15:05'),
(278, 'Darling Abuja Extra Long 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0278', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:15:21', '2023-02-04 01:15:29'),
(279, 'Rollers 20mm', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0279', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:16:03', '2023-02-04 01:16:11'),
(280, 'Darling Abuja Extra Long 1/350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0280', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:16:13', '2023-02-04 01:16:25'),
(281, 'Rollers 15mm', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0281', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:17:05', '2023-02-04 01:17:10'),
(282, 'Darling Gypsy Locs 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0282', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:17:54', '2023-02-04 01:18:06'),
(283, 'Methylated spirit joypharm 500ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0283', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:17:57', '2023-02-04 01:18:04'),
(284, 'Methylated spirit joypharm 300ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0284', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:18:56', '2023-02-04 01:19:00'),
(285, 'Darling Gypsy Locs 1/33', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0285', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:19:15', '2023-02-04 01:19:24'),
(286, 'Subaru dye light copper brown', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0286', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:19:46', '2023-02-04 01:19:51'),
(287, 'Subaru dye gold copper brown', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0287', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:20:31', '2023-02-04 01:20:37'),
(288, 'Darling Asili locs 1', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0288', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:21:02', '2023-02-04 01:21:12'),
(289, 'Subaru dye grape red', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0289', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:21:37', '2023-02-04 01:21:43'),
(290, 'Darling Asili locs 1/900/white', 10, 'single', 4, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, NULL, '0290', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:22:23', '2023-02-04 01:22:33'),
(291, 'Subaru dye black', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0291', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:22:29', '2023-02-04 01:22:35'),
(292, 'Lorys 1000gms', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0292', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:23:27', '2023-02-04 01:23:33'),
(293, 'Darling Asili locs 1/900', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0293', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:23:27', '2023-02-04 01:23:38'),
(294, '3in1 comb big', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0294', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:24:14', '2023-02-04 01:24:20'),
(295, 'Darling Asili locs 1/350', 10, 'single', 4, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0295', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:24:40', '2023-02-04 01:24:49'),
(296, 'Luron day cream 50ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0296', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:25:09', '2023-02-04 01:25:15'),
(297, 'Luron night cream 50ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0297', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:25:53', '2023-02-04 01:25:59'),
(298, 'Always pink pads', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0298', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:26:27', '2023-02-04 01:26:35'),
(299, 'Charmax cutex big', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0299', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:26:41', '2023-02-04 01:26:47'),
(300, 'Always ultra pads', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0300', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:27:29', '2023-02-04 01:27:38'),
(301, 'Luron polish', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0301', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:27:50', '2023-02-04 01:27:55'),
(302, 'Always maxi pads', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0302', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:28:32', '2023-02-04 01:28:41'),
(303, 'Mixing bowl', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0303', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:28:51', '2023-02-04 01:28:56'),
(304, 'Sunny girl pads', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0304', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:29:33', '2023-02-04 01:29:42'),
(305, 'Luron Pimple cream', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0305', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:29:59', '2023-02-04 01:30:04'),
(306, 'Softcare pads', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0306', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:30:43', '2023-02-04 01:30:53'),
(307, 'N/Lovely sweet almond hairfood 60gm', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0307', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:30:44', '2023-02-04 01:30:49'),
(308, 'Arimis 50gms', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0308', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:32:03', '2023-02-04 01:32:12'),
(309, 'N/Lovely sweet almond hairfood 100gm', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0309', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:32:24', '2023-02-04 01:32:34'),
(310, 'Arimis 100gms', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0310', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:33:01', '2023-02-04 01:33:08'),
(311, 'N/Lovely sweet almond hairfood 300gm', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0311', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:33:18', '2023-02-04 01:33:32'),
(312, 'N/Lovely avocado hairfood 60gm', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0312', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:34:18', '2023-02-04 01:34:29'),
(313, 'Arimis 200gms', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0313', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:34:38', '2023-02-04 01:34:46'),
(314, 'N/Lovely avocado hairfood 100gm', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0314', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:35:10', '2023-02-04 01:35:20'),
(315, 'N/Lovely avocado hairfood 300gm', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0315', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:36:07', '2023-02-04 01:36:41'),
(316, 'Rexona shower clean rollon 25ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0316', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:36:56', '2023-02-04 01:37:05'),
(317, 'N/Lovely olive hairfood 60gm', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0317', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:37:20', '2023-02-04 01:37:28'),
(318, 'N/Lovely olive hairfood 100gm', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0318', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:38:03', '2023-02-04 01:38:16'),
(319, 'Rexona extra cool rollon 25ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0319', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:38:13', '2023-02-04 01:38:27'),
(320, 'N/Lovely olive hairfood 300gm', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0320', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:38:59', '2023-02-04 01:39:11'),
(321, 'Gold touch oily 25gm', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0321', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:39:58', '2023-02-04 01:40:08'),
(322, 'Gold touch oily 50gm', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0322', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:40:50', '2023-02-04 01:41:17'),
(323, 'Gold touch normal 25gm', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0323', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:41:58', '2023-02-04 01:44:45'),
(324, 'Gold touch normal 50gms', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0324', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:42:42', '2023-02-04 01:43:01'),
(325, 'Gold touch dry 25gm', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0325', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:45:27', '2023-02-04 01:45:52'),
(326, 'Gold touch dry 50gm', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0326', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:46:26', '2023-02-04 01:46:38'),
(327, 'Versman Sporty rollon 50ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0327', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:47:11', '2023-02-04 01:47:24'),
(328, 'Versman cool rollon 50ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0328', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:48:08', '2023-02-04 01:48:23'),
(329, 'Versman active rollon 50ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0329', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:48:56', '2023-02-04 01:49:07'),
(330, 'Versman cool lotion 100ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0330', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:49:47', '2023-02-04 01:50:21'),
(331, 'Versman cool lotion 200ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0331', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:51:00', '2023-02-04 01:51:10'),
(332, 'Versman cool lotion 400ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0332', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:51:42', '2023-02-04 01:51:54'),
(333, 'Versman sporty lotion 100ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0333', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:52:27', '2023-02-04 01:52:37'),
(334, 'Versman sporty lotion 200ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0334', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:53:12', '2023-02-04 01:53:24'),
(335, 'Versman sporty lotion 400ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0335', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:54:13', '2023-02-04 01:54:21'),
(336, 'Versman Luxurious lotion 100ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0336', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:55:30', '2023-02-04 01:55:44'),
(337, 'Rexona powder rollon 25ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0337', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:55:42', '2023-02-04 01:55:58'),
(338, 'Versman Luxurious lotion 200ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0338', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:56:24', '2023-02-04 01:56:32'),
(339, 'Rexona cotton rollon 25ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0339', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:57:00', '2023-02-04 01:57:08'),
(340, 'Versman Luxurious lotion 400ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0340', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:57:12', '2023-02-04 01:57:26'),
(341, 'Rexona cotton rollon 50ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0341', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:58:16', '2023-02-04 01:58:39'),
(342, 'N/Lovely styling gel 135gm', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0342', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:58:38', '2023-02-04 01:58:50'),
(343, 'N/Lovely styling gel 60g', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0343', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 01:59:28', '2023-02-04 01:59:39'),
(344, 'Rexona shower clean rollon 50ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0344', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:02:15', '2023-02-04 02:02:22'),
(345, 'Rexona powder rollon 50ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0345', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:03:48', '2023-02-04 02:03:57'),
(346, 'Rexona quantum rollon 25ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0346', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:04:55', '2023-02-04 02:06:55'),
(347, 'Rexona active rollon 25ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0347', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:09:32', '2023-02-04 02:09:40'),
(348, 'Rexona quantum rollon 50ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0348', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:12:30', '2023-02-04 02:12:40'),
(349, 'Rexona extra cool rollon 50ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0349', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:21:58', '2023-02-04 02:22:07'),
(350, 'Geisha black soap 90gms', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0350', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:24:16', '2023-02-04 02:24:24'),
(351, 'Geisha black soap 225gms', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0351', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:25:43', '2023-02-04 02:25:51'),
(352, 'Geisha moringa soap 225gms', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0352', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:32:37', '2023-02-04 02:32:51'),
(353, 'Geisha moringa soap 125gms', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0353', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:33:33', '2023-02-04 02:33:44'),
(354, 'Vaseline original 25ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0354', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:34:43', '2023-02-04 02:34:51'),
(355, 'Vaseline original 45ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0355', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:35:53', '2023-02-04 02:36:03'),
(356, 'Vaseline original 95ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0356', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:36:51', '2023-02-04 02:36:57'),
(357, 'Vaseline original 240ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0357', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:37:39', '2023-02-04 02:37:49'),
(358, 'Vaseline baby 45ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0358', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:39:42', '2023-02-04 02:39:49'),
(359, 'Vaseline baby 95ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0359', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:40:36', '2023-02-04 02:40:47'),
(360, 'Vaseline baby 240ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0360', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:41:59', '2023-02-04 02:42:10'),
(361, 'Vaseline men fresh 45ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0361', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:43:00', '2023-02-04 02:43:14'),
(362, 'Vaseline men fresh 95ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0362', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:44:08', '2023-02-04 02:44:17'),
(363, 'Vaseline men fresh 240ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0363', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:45:21', '2023-02-04 02:45:30'),
(364, 'Vaseline men cooling 45ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0364', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:46:13', '2023-02-04 02:46:20'),
(365, 'Vaseline men cool 95ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0365', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 02:49:19', '2023-02-04 02:49:37'),
(366, 'Vaseline men cooling 240ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0366', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:03:02', '2023-02-04 03:03:20'),
(367, 'Vaseline cocobutter 240ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0367', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:05:57', '2023-02-04 03:06:14'),
(368, 'Vaseline cocobutter 95ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0368', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:07:04', '2023-02-04 03:07:15'),
(369, 'Vaseline aloe fresh 95ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0369', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:08:13', '2023-02-04 03:08:24'),
(370, 'Vaseline men lotin cool 200ml', 10, 'single', 4, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0370', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:09:51', '2023-02-04 03:10:07'),
(371, 'Nice and lovely cocoa butter 100ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0371', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:11:06', '2023-02-04 03:11:15'),
(372, 'Nice and lovely cocoa butter 200ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0372', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:12:10', '2023-02-04 03:12:21'),
(373, 'Nice and lovely cocoa butter 400ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0373', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:13:20', '2023-02-04 03:13:27'),
(374, 'Nice and lovely cocoa butter 600ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0374', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:14:55', '2023-02-04 03:15:08'),
(375, 'Nice and lovely glycerine 100ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0375', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:16:22', '2023-02-04 03:16:29'),
(376, 'Nice and lovely glycerine 200ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0376', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:17:28', '2023-02-04 03:17:36'),
(377, 'Nice and lovely glycerine 400ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0377', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:18:33', '2023-02-04 03:18:43'),
(378, 'Nice and lovely glycerine 600ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0378', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:19:47', '2023-02-04 03:19:55'),
(379, 'Nice and lovely aloevera 100ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0379', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:21:06', '2023-02-04 03:21:18'),
(380, 'Nice and lovely aloevera 200ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0380', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:22:10', '2023-02-04 03:22:20'),
(381, 'Nice and lovely aloevera 400ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0381', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:23:02', '2023-02-04 03:23:11'),
(382, 'Nice and lovely aloevera 600ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0382', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:23:55', '2023-02-04 03:24:03'),
(384, 'Nice and lovely milk 100ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0384', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:28:01', '2023-02-04 03:28:10'),
(385, 'Nice and lovely milk 200ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0385', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:29:19', '2023-02-04 03:29:30'),
(386, 'Nice and lovely milk 400ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0386', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:31:59', '2023-02-04 03:32:06'),
(387, 'N/Lovely Pure glycerine 40ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0387', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:33:14', '2023-02-04 03:33:22'),
(388, 'N/Lovely Pure glycerine 65ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0388', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:34:19', '2023-02-04 03:34:28'),
(389, 'N/Lovely Pure glycerine 110ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0389', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:35:37', '2023-02-04 03:35:46'),
(390, 'N/Lovely Perfumed  glycerine 40ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0390', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:36:31', '2023-02-04 03:36:37'),
(391, 'N/Lovely Perfumed  glycerine 65ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0391', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:39:08', '2023-02-04 03:39:16'),
(392, 'N/Lovely Perfumed  glycerine 110ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0392', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:40:45', '2023-02-04 03:41:15'),
(393, 'N/Lovely Aloevra glycerine 40ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0393', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:42:32', '2023-02-04 03:42:49'),
(394, 'N/Lovely Aloevra glycerine 65ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0394', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:43:50', '2023-02-04 03:44:13'),
(395, 'N/Lovely Aloevra glycerine 110ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0395', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:45:58', '2023-02-04 03:46:10'),
(396, 'N/Lovely Cocoa glycerine 40ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0396', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:47:47', '2023-02-04 03:47:56'),
(397, 'N/Lovely Cocoa glycerine 65ml', 10, 'single', 4, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, 'N/Lovely Cocoa glycerine 65ml', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, 0, '2023-02-04 03:49:10', '2023-02-04 03:49:21');

-- --------------------------------------------------------

--
-- Table structure for table `product_locations`
--

CREATE TABLE `product_locations` (
  `product_id` int NOT NULL,
  `location_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_locations`
--

INSERT INTO `product_locations` (`product_id`, `location_id`) VALUES
(1, 3),
(2, 2),
(3, 4),
(4, 4),
(5, 4),
(6, 4),
(7, 4),
(8, 4),
(9, 4),
(10, 4),
(11, 4),
(12, 4),
(13, 4),
(14, 4),
(15, 4),
(16, 4),
(17, 4),
(18, 4),
(19, 4),
(20, 4),
(21, 4),
(22, 4),
(23, 4),
(24, 4),
(25, 4),
(26, 4),
(27, 4),
(28, 4),
(29, 4),
(30, 4),
(31, 4),
(32, 4),
(33, 4),
(34, 4),
(35, 4),
(36, 4),
(37, 4),
(38, 4),
(39, 4),
(40, 4),
(41, 4),
(42, 4),
(43, 4),
(44, 4),
(45, 4),
(46, 4),
(47, 4),
(48, 4),
(49, 4),
(50, 4),
(51, 4),
(52, 4),
(53, 4),
(54, 4),
(55, 4),
(56, 4),
(57, 4),
(58, 4),
(59, 4),
(60, 4),
(61, 4),
(62, 4),
(63, 4),
(64, 4),
(65, 4),
(66, 4),
(67, 4),
(68, 4),
(69, 4),
(70, 4),
(71, 4),
(72, 4),
(73, 4),
(74, 4),
(75, 4),
(76, 4),
(77, 4),
(78, 4),
(79, 4),
(80, 4),
(81, 4),
(82, 4),
(83, 4),
(84, 4),
(85, 4),
(86, 4),
(87, 4),
(88, 4),
(89, 4),
(90, 4),
(91, 4),
(92, 4),
(93, 4),
(94, 4),
(95, 4),
(96, 4),
(97, 4),
(98, 4),
(99, 4),
(100, 4),
(101, 4),
(102, 4),
(103, 4),
(104, 4),
(105, 4),
(106, 4),
(107, 4),
(108, 4),
(109, 4),
(110, 4),
(111, 4),
(112, 4),
(113, 4),
(114, 4),
(115, 4),
(116, 4),
(117, 4),
(118, 4),
(119, 4),
(120, 4),
(121, 4),
(122, 4),
(123, 4),
(124, 4),
(125, 4),
(126, 4),
(127, 4),
(128, 4),
(129, 4),
(130, 4),
(131, 4),
(132, 4),
(133, 4),
(134, 4),
(135, 4),
(136, 4),
(137, 4),
(138, 4),
(139, 4),
(140, 4),
(141, 4),
(142, 4),
(143, 4),
(144, 4),
(145, 4),
(146, 4),
(147, 4),
(148, 4),
(149, 4),
(150, 4),
(151, 4),
(152, 4),
(153, 4),
(154, 4),
(155, 4),
(156, 4),
(157, 4),
(158, 4),
(159, 4),
(160, 4),
(161, 4),
(162, 4),
(163, 4),
(164, 4),
(165, 4),
(166, 4),
(167, 4),
(168, 4),
(169, 4),
(170, 4),
(171, 4),
(172, 4),
(173, 4),
(174, 4),
(175, 4),
(176, 4),
(177, 4),
(178, 4),
(179, 4),
(180, 4),
(181, 4),
(182, 4),
(183, 4),
(184, 4),
(185, 4),
(186, 4),
(187, 4),
(188, 4),
(189, 4),
(190, 4),
(191, 4),
(192, 4),
(193, 4),
(194, 4),
(195, 4),
(196, 4),
(197, 4),
(198, 4),
(199, 4),
(200, 4),
(201, 4),
(202, 4),
(203, 4),
(204, 4),
(205, 4),
(206, 4),
(207, 4),
(208, 4),
(209, 4),
(210, 4),
(211, 4),
(212, 4),
(213, 4),
(214, 4),
(215, 4),
(216, 4),
(217, 4),
(218, 4),
(219, 4),
(220, 4),
(221, 4),
(222, 4),
(223, 4),
(224, 4),
(225, 4),
(226, 4),
(227, 4),
(228, 4),
(229, 4),
(230, 4),
(231, 4),
(232, 4),
(233, 4),
(234, 4),
(235, 4),
(236, 4),
(237, 4),
(238, 4),
(239, 4),
(240, 4),
(241, 4),
(242, 4),
(243, 4),
(244, 4),
(245, 4),
(246, 4),
(247, 4),
(248, 4),
(249, 4),
(250, 4),
(251, 4),
(252, 4),
(253, 4),
(254, 4),
(255, 4),
(256, 4),
(257, 4),
(258, 4),
(259, 4),
(260, 4),
(261, 4),
(262, 4),
(263, 4),
(264, 4),
(265, 4),
(266, 4),
(267, 4),
(268, 4),
(269, 4),
(270, 4),
(271, 4),
(272, 4),
(273, 4),
(274, 4),
(275, 4),
(276, 4),
(277, 4),
(278, 4),
(279, 4),
(280, 4),
(281, 4),
(282, 4),
(283, 4),
(284, 4),
(285, 4),
(286, 4),
(287, 4),
(288, 4),
(289, 4),
(290, 4),
(291, 4),
(292, 4),
(293, 4),
(294, 4),
(295, 4),
(296, 4),
(297, 4),
(298, 4),
(299, 4),
(300, 4),
(301, 4),
(302, 4),
(303, 4),
(304, 4),
(305, 4),
(306, 4),
(307, 4),
(308, 4),
(309, 4),
(310, 4),
(311, 4),
(312, 4),
(313, 4),
(314, 4),
(315, 4),
(316, 4),
(317, 4),
(318, 4),
(319, 4),
(320, 4),
(321, 4),
(322, 4),
(323, 4),
(324, 4),
(325, 4),
(326, 4),
(327, 4),
(328, 4),
(329, 4),
(330, 4),
(331, 4),
(332, 4),
(333, 4),
(334, 4),
(335, 4),
(336, 4),
(337, 4),
(338, 4),
(339, 4),
(340, 4),
(341, 4),
(342, 4),
(343, 4),
(344, 4),
(345, 4),
(346, 4),
(347, 4),
(348, 4),
(349, 4),
(350, 4),
(351, 4),
(352, 4),
(353, 4),
(354, 4),
(355, 4),
(356, 4),
(357, 4),
(358, 4),
(359, 4),
(360, 4),
(361, 4),
(362, 4),
(363, 4),
(364, 4),
(365, 4),
(366, 4),
(367, 4),
(368, 4),
(369, 4),
(370, 4),
(371, 4),
(372, 4),
(373, 4),
(374, 4),
(375, 4),
(376, 4),
(377, 4),
(378, 4),
(379, 4),
(380, 4),
(381, 4),
(382, 4),
(383, 4),
(384, 4),
(385, 4),
(386, 4),
(387, 4),
(388, 4),
(389, 4),
(390, 4),
(391, 4),
(392, 4),
(393, 4),
(394, 4),
(395, 4),
(396, 4),
(397, 4);

-- --------------------------------------------------------

--
-- Table structure for table `product_racks`
--

CREATE TABLE `product_racks` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `rack` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `row` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int UNSIGNED NOT NULL,
  `variation_template_id` int DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `variation_template_id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(1, NULL, 'DUMMY', 1, 1, '2023-01-16 21:24:23', '2023-01-16 21:24:23'),
(2, NULL, 'DUMMY', 2, 1, '2023-02-02 18:55:24', '2023-02-02 18:55:24'),
(3, NULL, 'DUMMY', 3, 1, '2023-02-03 13:41:52', '2023-02-03 13:41:52'),
(4, NULL, 'DUMMY', 4, 1, '2023-02-03 14:04:36', '2023-02-03 14:04:36'),
(5, NULL, 'DUMMY', 5, 1, '2023-02-03 14:07:07', '2023-02-03 14:07:07'),
(6, NULL, 'DUMMY', 6, 1, '2023-02-03 14:11:22', '2023-02-03 14:11:22'),
(7, NULL, 'DUMMY', 7, 1, '2023-02-03 14:13:44', '2023-02-03 14:13:44'),
(8, NULL, 'DUMMY', 8, 1, '2023-02-03 14:19:03', '2023-02-03 14:19:03'),
(9, NULL, 'DUMMY', 9, 1, '2023-02-03 14:24:46', '2023-02-03 14:24:46'),
(10, NULL, 'DUMMY', 10, 1, '2023-02-03 14:27:10', '2023-02-03 14:27:10'),
(11, NULL, 'DUMMY', 11, 1, '2023-02-03 14:29:19', '2023-02-03 14:29:19'),
(12, NULL, 'DUMMY', 12, 1, '2023-02-03 14:31:08', '2023-02-03 14:31:08'),
(13, NULL, 'DUMMY', 13, 1, '2023-02-03 14:32:23', '2023-02-03 14:32:23'),
(14, NULL, 'DUMMY', 14, 1, '2023-02-03 14:33:32', '2023-02-03 14:33:32'),
(15, NULL, 'DUMMY', 15, 1, '2023-02-03 14:34:50', '2023-02-03 14:34:50'),
(16, NULL, 'DUMMY', 16, 1, '2023-02-03 14:36:24', '2023-02-03 14:36:24'),
(17, NULL, 'DUMMY', 17, 1, '2023-02-03 14:37:32', '2023-02-03 14:37:32'),
(18, NULL, 'DUMMY', 18, 1, '2023-02-03 14:38:28', '2023-02-03 14:38:28'),
(19, NULL, 'DUMMY', 19, 1, '2023-02-03 14:40:24', '2023-02-03 14:40:24'),
(20, NULL, 'DUMMY', 20, 1, '2023-02-03 14:41:27', '2023-02-03 14:41:27'),
(21, NULL, 'DUMMY', 21, 1, '2023-02-03 14:42:32', '2023-02-03 14:42:32'),
(22, NULL, 'DUMMY', 22, 1, '2023-02-03 14:43:38', '2023-02-03 14:43:38'),
(23, NULL, 'DUMMY', 23, 1, '2023-02-03 14:45:03', '2023-02-03 14:45:03'),
(24, NULL, 'DUMMY', 24, 1, '2023-02-03 14:45:57', '2023-02-03 14:45:57'),
(25, NULL, 'DUMMY', 25, 1, '2023-02-03 14:46:46', '2023-02-03 14:46:46'),
(26, NULL, 'DUMMY', 26, 1, '2023-02-03 14:47:44', '2023-02-03 14:47:44'),
(27, NULL, 'DUMMY', 27, 1, '2023-02-03 14:49:15', '2023-02-03 14:49:15'),
(28, NULL, 'DUMMY', 28, 1, '2023-02-03 14:50:14', '2023-02-03 14:50:14'),
(29, NULL, 'DUMMY', 29, 1, '2023-02-03 14:51:05', '2023-02-03 14:51:05'),
(30, NULL, 'DUMMY', 30, 1, '2023-02-03 14:52:07', '2023-02-03 14:52:07'),
(31, NULL, 'DUMMY', 31, 1, '2023-02-03 14:52:58', '2023-02-03 14:52:58'),
(32, NULL, 'DUMMY', 32, 1, '2023-02-03 14:54:03', '2023-02-03 14:54:03'),
(33, NULL, 'DUMMY', 33, 1, '2023-02-03 14:55:43', '2023-02-03 14:55:43'),
(34, NULL, 'DUMMY', 34, 1, '2023-02-03 14:59:03', '2023-02-03 14:59:03'),
(35, NULL, 'DUMMY', 35, 1, '2023-02-03 15:00:31', '2023-02-03 15:00:31'),
(36, NULL, 'DUMMY', 36, 1, '2023-02-03 15:01:33', '2023-02-03 15:01:33'),
(37, NULL, 'DUMMY', 37, 1, '2023-02-03 15:02:24', '2023-02-03 15:02:24'),
(38, NULL, 'DUMMY', 38, 1, '2023-02-03 15:03:12', '2023-02-03 15:03:12'),
(39, NULL, 'DUMMY', 39, 1, '2023-02-03 15:03:58', '2023-02-03 15:03:58'),
(40, NULL, 'DUMMY', 40, 1, '2023-02-03 15:04:37', '2023-02-03 15:04:37'),
(41, NULL, 'DUMMY', 41, 1, '2023-02-03 15:05:34', '2023-02-03 15:05:34'),
(42, NULL, 'DUMMY', 42, 1, '2023-02-03 15:07:14', '2023-02-03 15:07:14'),
(43, NULL, 'DUMMY', 43, 1, '2023-02-03 15:08:10', '2023-02-03 15:08:10'),
(45, NULL, 'DUMMY', 45, 1, '2023-02-03 15:10:15', '2023-02-03 15:10:15'),
(46, NULL, 'DUMMY', 46, 1, '2023-02-03 15:11:11', '2023-02-03 15:11:11'),
(47, NULL, 'DUMMY', 47, 1, '2023-02-03 15:12:20', '2023-02-03 15:12:20'),
(48, NULL, 'DUMMY', 48, 1, '2023-02-03 15:13:17', '2023-02-03 15:13:17'),
(49, NULL, 'DUMMY', 49, 1, '2023-02-03 15:14:01', '2023-02-03 15:14:01'),
(50, NULL, 'DUMMY', 50, 1, '2023-02-03 15:14:54', '2023-02-03 15:14:54'),
(51, NULL, 'DUMMY', 51, 1, '2023-02-03 15:15:46', '2023-02-03 15:15:46'),
(52, NULL, 'DUMMY', 52, 1, '2023-02-03 15:16:57', '2023-02-03 15:16:57'),
(53, NULL, 'DUMMY', 53, 1, '2023-02-03 15:28:21', '2023-02-03 15:28:21'),
(54, NULL, 'DUMMY', 54, 1, '2023-02-03 15:30:22', '2023-02-03 15:30:22'),
(55, NULL, 'DUMMY', 55, 1, '2023-02-03 15:31:28', '2023-02-03 15:31:28'),
(56, NULL, 'DUMMY', 56, 1, '2023-02-03 15:32:25', '2023-02-03 15:32:25'),
(57, NULL, 'DUMMY', 57, 1, '2023-02-03 15:33:24', '2023-02-03 15:33:24'),
(58, NULL, 'DUMMY', 58, 1, '2023-02-03 15:34:13', '2023-02-03 15:34:13'),
(59, NULL, 'DUMMY', 59, 1, '2023-02-03 15:35:07', '2023-02-03 15:35:07'),
(60, NULL, 'DUMMY', 60, 1, '2023-02-03 15:37:10', '2023-02-03 15:37:10'),
(61, NULL, 'DUMMY', 61, 1, '2023-02-03 15:38:06', '2023-02-03 15:38:06'),
(62, NULL, 'DUMMY', 62, 1, '2023-02-03 15:39:10', '2023-02-03 15:39:10'),
(63, NULL, 'DUMMY', 63, 1, '2023-02-03 15:40:02', '2023-02-03 15:40:02'),
(64, NULL, 'DUMMY', 64, 1, '2023-02-03 15:40:55', '2023-02-03 15:40:55'),
(65, NULL, 'DUMMY', 65, 1, '2023-02-03 15:42:00', '2023-02-03 15:42:00'),
(66, NULL, 'DUMMY', 66, 1, '2023-02-03 15:43:10', '2023-02-03 15:43:10'),
(67, NULL, 'DUMMY', 67, 1, '2023-02-03 15:44:13', '2023-02-03 15:44:13'),
(68, NULL, 'DUMMY', 68, 1, '2023-02-03 15:45:06', '2023-02-03 15:45:06'),
(69, NULL, 'DUMMY', 69, 1, '2023-02-03 15:46:27', '2023-02-03 15:46:27'),
(70, NULL, 'DUMMY', 70, 1, '2023-02-03 15:46:50', '2023-02-03 15:46:50'),
(71, NULL, 'DUMMY', 71, 1, '2023-02-03 15:47:49', '2023-02-03 15:47:49'),
(72, NULL, 'DUMMY', 72, 1, '2023-02-03 15:48:40', '2023-02-03 15:48:40'),
(73, NULL, 'DUMMY', 73, 1, '2023-02-03 15:49:28', '2023-02-03 15:49:28'),
(74, NULL, 'DUMMY', 74, 1, '2023-02-03 15:50:18', '2023-02-03 15:50:18'),
(75, NULL, 'DUMMY', 75, 1, '2023-02-03 15:51:16', '2023-02-03 15:51:16'),
(76, NULL, 'DUMMY', 76, 1, '2023-02-03 15:52:38', '2023-02-03 15:52:38'),
(77, NULL, 'DUMMY', 77, 1, '2023-02-03 15:53:55', '2023-02-03 15:53:55'),
(80, NULL, 'DUMMY', 80, 1, '2023-02-03 22:49:07', '2023-02-03 22:49:07'),
(81, NULL, 'DUMMY', 81, 1, '2023-02-03 22:50:27', '2023-02-03 22:50:27'),
(82, NULL, 'DUMMY', 82, 1, '2023-02-03 22:51:47', '2023-02-03 22:51:47'),
(83, NULL, 'DUMMY', 83, 1, '2023-02-03 22:52:50', '2023-02-03 22:52:50'),
(84, NULL, 'DUMMY', 84, 1, '2023-02-03 22:54:12', '2023-02-03 22:54:12'),
(85, NULL, 'DUMMY', 85, 1, '2023-02-03 22:55:19', '2023-02-03 22:55:19'),
(86, NULL, 'DUMMY', 86, 1, '2023-02-03 22:56:24', '2023-02-03 22:56:24'),
(87, NULL, 'DUMMY', 87, 1, '2023-02-03 23:01:08', '2023-02-03 23:01:08'),
(88, NULL, 'DUMMY', 88, 1, '2023-02-03 23:02:54', '2023-02-03 23:02:54'),
(89, NULL, 'DUMMY', 89, 1, '2023-02-03 23:03:57', '2023-02-03 23:03:57'),
(90, NULL, 'DUMMY', 90, 1, '2023-02-03 23:04:55', '2023-02-03 23:04:55'),
(91, NULL, 'DUMMY', 91, 1, '2023-02-03 23:05:59', '2023-02-03 23:05:59'),
(92, NULL, 'DUMMY', 92, 1, '2023-02-03 23:07:07', '2023-02-03 23:07:07'),
(93, NULL, 'DUMMY', 93, 1, '2023-02-03 23:08:20', '2023-02-03 23:08:20'),
(94, NULL, 'DUMMY', 94, 1, '2023-02-03 23:09:57', '2023-02-03 23:09:57'),
(95, NULL, 'DUMMY', 95, 1, '2023-02-03 23:11:01', '2023-02-03 23:11:01'),
(96, NULL, 'DUMMY', 96, 1, '2023-02-03 23:12:02', '2023-02-03 23:12:02'),
(97, NULL, 'DUMMY', 97, 1, '2023-02-03 23:13:08', '2023-02-03 23:13:08'),
(98, NULL, 'DUMMY', 98, 1, '2023-02-03 23:16:41', '2023-02-03 23:16:41'),
(99, NULL, 'DUMMY', 99, 1, '2023-02-03 23:17:58', '2023-02-03 23:17:58'),
(100, NULL, 'DUMMY', 100, 1, '2023-02-03 23:18:46', '2023-02-03 23:18:46'),
(101, NULL, 'DUMMY', 101, 1, '2023-02-03 23:19:11', '2023-02-03 23:19:11'),
(102, NULL, 'DUMMY', 102, 1, '2023-02-03 23:19:19', '2023-02-03 23:19:19'),
(103, NULL, 'DUMMY', 103, 1, '2023-02-03 23:21:03', '2023-02-03 23:21:03'),
(104, NULL, 'DUMMY', 104, 1, '2023-02-03 23:22:00', '2023-02-03 23:22:00'),
(105, NULL, 'DUMMY', 105, 1, '2023-02-03 23:23:33', '2023-02-03 23:23:33'),
(106, NULL, 'DUMMY', 106, 1, '2023-02-03 23:24:31', '2023-02-03 23:24:31'),
(107, NULL, 'DUMMY', 107, 1, '2023-02-03 23:25:30', '2023-02-03 23:25:30'),
(108, NULL, 'DUMMY', 108, 1, '2023-02-03 23:26:25', '2023-02-03 23:26:25'),
(109, NULL, 'DUMMY', 109, 1, '2023-02-03 23:27:19', '2023-02-03 23:27:19'),
(110, NULL, 'DUMMY', 110, 1, '2023-02-03 23:28:20', '2023-02-03 23:28:20'),
(111, NULL, 'DUMMY', 111, 1, '2023-02-03 23:29:15', '2023-02-03 23:29:15'),
(112, NULL, 'DUMMY', 112, 1, '2023-02-03 23:30:20', '2023-02-03 23:30:20'),
(113, NULL, 'DUMMY', 113, 1, '2023-02-03 23:31:17', '2023-02-03 23:31:17'),
(114, NULL, 'DUMMY', 114, 1, '2023-02-03 23:32:07', '2023-02-03 23:32:07'),
(115, NULL, 'DUMMY', 115, 1, '2023-02-03 23:33:00', '2023-02-03 23:33:00'),
(116, NULL, 'DUMMY', 116, 1, '2023-02-03 23:34:00', '2023-02-03 23:34:00'),
(117, NULL, 'DUMMY', 117, 1, '2023-02-03 23:35:18', '2023-02-03 23:35:18'),
(118, NULL, 'DUMMY', 118, 1, '2023-02-03 23:36:15', '2023-02-03 23:36:15'),
(119, NULL, 'DUMMY', 119, 1, '2023-02-03 23:36:58', '2023-02-03 23:36:58'),
(120, NULL, 'DUMMY', 120, 1, '2023-02-03 23:37:41', '2023-02-03 23:37:41'),
(121, NULL, 'DUMMY', 121, 1, '2023-02-03 23:38:11', '2023-02-03 23:38:11'),
(122, NULL, 'DUMMY', 122, 1, '2023-02-03 23:38:29', '2023-02-03 23:38:29'),
(123, NULL, 'DUMMY', 123, 1, '2023-02-03 23:39:28', '2023-02-03 23:39:28'),
(124, NULL, 'DUMMY', 124, 1, '2023-02-03 23:39:52', '2023-02-03 23:39:52'),
(125, NULL, 'DUMMY', 125, 1, '2023-02-03 23:40:18', '2023-02-03 23:40:18'),
(126, NULL, 'DUMMY', 126, 1, '2023-02-03 23:41:07', '2023-02-03 23:41:07'),
(127, NULL, 'DUMMY', 127, 1, '2023-02-03 23:41:35', '2023-02-03 23:41:35'),
(128, NULL, 'DUMMY', 128, 1, '2023-02-03 23:42:06', '2023-02-03 23:42:06'),
(129, NULL, 'DUMMY', 129, 1, '2023-02-03 23:42:53', '2023-02-03 23:42:53'),
(130, NULL, 'DUMMY', 130, 1, '2023-02-03 23:42:56', '2023-02-03 23:42:56'),
(131, NULL, 'DUMMY', 131, 1, '2023-02-03 23:43:41', '2023-02-03 23:43:41'),
(132, NULL, 'DUMMY', 132, 1, '2023-02-03 23:44:02', '2023-02-03 23:44:02'),
(133, NULL, 'DUMMY', 133, 1, '2023-02-03 23:44:18', '2023-02-03 23:44:18'),
(134, NULL, 'DUMMY', 134, 1, '2023-02-03 23:45:00', '2023-02-03 23:45:00'),
(135, NULL, 'DUMMY', 135, 1, '2023-02-03 23:45:47', '2023-02-03 23:45:47'),
(136, NULL, 'DUMMY', 136, 1, '2023-02-03 23:45:54', '2023-02-03 23:45:54'),
(137, NULL, 'DUMMY', 137, 1, '2023-02-03 23:46:54', '2023-02-03 23:46:54'),
(138, NULL, 'DUMMY', 138, 1, '2023-02-03 23:47:51', '2023-02-03 23:47:51'),
(139, NULL, 'DUMMY', 139, 1, '2023-02-03 23:47:51', '2023-02-03 23:47:51'),
(140, NULL, 'DUMMY', 140, 1, '2023-02-03 23:48:36', '2023-02-03 23:48:36'),
(141, NULL, 'DUMMY', 141, 1, '2023-02-03 23:49:06', '2023-02-03 23:49:06'),
(142, NULL, 'DUMMY', 142, 1, '2023-02-03 23:49:45', '2023-02-03 23:49:45'),
(143, NULL, 'DUMMY', 143, 1, '2023-02-03 23:50:28', '2023-02-03 23:50:28'),
(144, NULL, 'DUMMY', 144, 1, '2023-02-03 23:50:43', '2023-02-03 23:50:43'),
(145, NULL, 'DUMMY', 145, 1, '2023-02-03 23:51:22', '2023-02-03 23:51:22'),
(146, NULL, 'DUMMY', 146, 1, '2023-02-03 23:51:33', '2023-02-03 23:51:33'),
(147, NULL, 'DUMMY', 147, 1, '2023-02-03 23:52:39', '2023-02-03 23:52:39'),
(148, NULL, 'DUMMY', 148, 1, '2023-02-03 23:52:41', '2023-02-03 23:52:41'),
(149, NULL, 'DUMMY', 149, 1, '2023-02-03 23:53:41', '2023-02-03 23:53:41'),
(150, NULL, 'DUMMY', 150, 1, '2023-02-03 23:54:30', '2023-02-03 23:54:30'),
(151, NULL, 'DUMMY', 151, 1, '2023-02-03 23:55:28', '2023-02-03 23:55:28'),
(152, NULL, 'DUMMY', 152, 1, '2023-02-03 23:56:33', '2023-02-03 23:56:33'),
(153, NULL, 'DUMMY', 153, 1, '2023-02-03 23:57:17', '2023-02-03 23:57:17'),
(154, NULL, 'DUMMY', 154, 1, '2023-02-03 23:58:34', '2023-02-03 23:58:34'),
(155, NULL, 'DUMMY', 155, 1, '2023-02-03 23:59:50', '2023-02-03 23:59:50'),
(156, NULL, 'DUMMY', 156, 1, '2023-02-03 23:59:57', '2023-02-03 23:59:57'),
(157, NULL, 'DUMMY', 157, 1, '2023-02-04 00:00:50', '2023-02-04 00:00:50'),
(158, NULL, 'DUMMY', 158, 1, '2023-02-04 00:01:13', '2023-02-04 00:01:13'),
(159, NULL, 'DUMMY', 159, 1, '2023-02-04 00:01:46', '2023-02-04 00:01:46'),
(160, NULL, 'DUMMY', 160, 1, '2023-02-04 00:02:30', '2023-02-04 00:02:30'),
(161, NULL, 'DUMMY', 161, 1, '2023-02-04 00:02:50', '2023-02-04 00:02:50'),
(162, NULL, 'DUMMY', 162, 1, '2023-02-04 00:03:33', '2023-02-04 00:03:33'),
(163, NULL, 'DUMMY', 163, 1, '2023-02-04 00:03:57', '2023-02-04 00:03:57'),
(164, NULL, 'DUMMY', 164, 1, '2023-02-04 00:04:25', '2023-02-04 00:04:25'),
(165, NULL, 'DUMMY', 165, 1, '2023-02-04 00:05:06', '2023-02-04 00:05:06'),
(166, NULL, 'DUMMY', 166, 1, '2023-02-04 00:05:06', '2023-02-04 00:05:06'),
(167, NULL, 'DUMMY', 167, 1, '2023-02-04 00:06:18', '2023-02-04 00:06:18'),
(168, NULL, 'DUMMY', 168, 1, '2023-02-04 00:06:55', '2023-02-04 00:06:55'),
(169, NULL, 'DUMMY', 169, 1, '2023-02-04 00:07:26', '2023-02-04 00:07:26'),
(170, NULL, 'DUMMY', 170, 1, '2023-02-04 00:08:37', '2023-02-04 00:08:37'),
(171, NULL, 'DUMMY', 171, 1, '2023-02-04 00:08:39', '2023-02-04 00:08:39'),
(172, NULL, 'DUMMY', 172, 1, '2023-02-04 00:09:32', '2023-02-04 00:09:32'),
(173, NULL, 'DUMMY', 173, 1, '2023-02-04 00:09:40', '2023-02-04 00:09:40'),
(174, NULL, 'DUMMY', 174, 1, '2023-02-04 00:10:20', '2023-02-04 00:10:20'),
(175, NULL, 'DUMMY', 175, 1, '2023-02-04 00:10:59', '2023-02-04 00:10:59'),
(176, NULL, 'DUMMY', 176, 1, '2023-02-04 00:11:31', '2023-02-04 00:11:31'),
(177, NULL, 'DUMMY', 177, 1, '2023-02-04 00:12:18', '2023-02-04 00:12:18'),
(178, NULL, 'DUMMY', 178, 1, '2023-02-04 00:12:19', '2023-02-04 00:12:19'),
(179, NULL, 'DUMMY', 179, 1, '2023-02-04 00:13:08', '2023-02-04 00:13:08'),
(180, NULL, 'DUMMY', 180, 1, '2023-02-04 00:14:56', '2023-02-04 00:14:56'),
(181, NULL, 'DUMMY', 181, 1, '2023-02-04 00:15:51', '2023-02-04 00:15:51'),
(182, NULL, 'DUMMY', 182, 1, '2023-02-04 00:17:10', '2023-02-04 00:17:10'),
(183, NULL, 'DUMMY', 183, 1, '2023-02-04 00:18:15', '2023-02-04 00:18:15'),
(184, NULL, 'DUMMY', 184, 1, '2023-02-04 00:19:06', '2023-02-04 00:19:06'),
(185, NULL, 'DUMMY', 185, 1, '2023-02-04 00:19:54', '2023-02-04 00:19:54'),
(186, NULL, 'DUMMY', 186, 1, '2023-02-04 00:21:38', '2023-02-04 00:21:38'),
(187, NULL, 'DUMMY', 187, 1, '2023-02-04 00:22:37', '2023-02-04 00:22:37'),
(188, NULL, 'DUMMY', 188, 1, '2023-02-04 00:23:24', '2023-02-04 00:23:24'),
(189, NULL, 'DUMMY', 189, 1, '2023-02-04 00:24:28', '2023-02-04 00:24:28'),
(190, NULL, 'DUMMY', 190, 1, '2023-02-04 00:25:14', '2023-02-04 00:25:14'),
(191, NULL, 'DUMMY', 191, 1, '2023-02-04 00:25:59', '2023-02-04 00:25:59'),
(192, NULL, 'DUMMY', 192, 1, '2023-02-04 00:26:49', '2023-02-04 00:26:49'),
(193, NULL, 'DUMMY', 193, 1, '2023-02-04 00:28:44', '2023-02-04 00:28:44'),
(194, NULL, 'DUMMY', 194, 1, '2023-02-04 00:29:29', '2023-02-04 00:29:29'),
(195, NULL, 'DUMMY', 195, 1, '2023-02-04 00:30:18', '2023-02-04 00:30:18'),
(196, NULL, 'DUMMY', 196, 1, '2023-02-04 00:31:07', '2023-02-04 00:31:07'),
(197, NULL, 'DUMMY', 197, 1, '2023-02-04 00:31:50', '2023-02-04 00:31:50'),
(198, NULL, 'DUMMY', 198, 1, '2023-02-04 00:32:44', '2023-02-04 00:32:44'),
(199, NULL, 'DUMMY', 199, 1, '2023-02-04 00:32:55', '2023-02-04 00:32:55'),
(200, NULL, 'DUMMY', 200, 1, '2023-02-04 00:33:25', '2023-02-04 00:33:25'),
(201, NULL, 'DUMMY', 201, 1, '2023-02-04 00:33:52', '2023-02-04 00:33:52'),
(202, NULL, 'DUMMY', 202, 1, '2023-02-04 00:34:17', '2023-02-04 00:34:17'),
(203, NULL, 'DUMMY', 203, 1, '2023-02-04 00:34:48', '2023-02-04 00:34:48'),
(204, NULL, 'DUMMY', 204, 1, '2023-02-04 00:35:23', '2023-02-04 00:35:23'),
(205, NULL, 'DUMMY', 205, 1, '2023-02-04 00:35:51', '2023-02-04 00:35:51'),
(206, NULL, 'DUMMY', 206, 1, '2023-02-04 00:36:44', '2023-02-04 00:36:44'),
(207, NULL, 'DUMMY', 207, 1, '2023-02-04 00:37:56', '2023-02-04 00:37:56'),
(208, NULL, 'DUMMY', 208, 1, '2023-02-04 00:38:41', '2023-02-04 00:38:41'),
(209, NULL, 'DUMMY', 209, 1, '2023-02-04 00:39:24', '2023-02-04 00:39:24'),
(210, NULL, 'DUMMY', 210, 1, '2023-02-04 00:40:07', '2023-02-04 00:40:07'),
(211, NULL, 'DUMMY', 211, 1, '2023-02-04 00:40:09', '2023-02-04 00:40:09'),
(212, NULL, 'DUMMY', 212, 1, '2023-02-04 00:40:47', '2023-02-04 00:40:47'),
(213, NULL, 'DUMMY', 213, 1, '2023-02-04 00:41:13', '2023-02-04 00:41:13'),
(214, NULL, 'DUMMY', 214, 1, '2023-02-04 00:41:34', '2023-02-04 00:41:34'),
(215, NULL, 'DUMMY', 215, 1, '2023-02-04 00:42:17', '2023-02-04 00:42:17'),
(216, NULL, 'DUMMY', 216, 1, '2023-02-04 00:42:33', '2023-02-04 00:42:33'),
(217, NULL, 'DUMMY', 217, 1, '2023-02-04 00:43:03', '2023-02-04 00:43:03'),
(218, NULL, 'DUMMY', 218, 1, '2023-02-04 00:43:30', '2023-02-04 00:43:30'),
(219, NULL, 'DUMMY', 219, 1, '2023-02-04 00:43:54', '2023-02-04 00:43:54'),
(220, NULL, 'DUMMY', 220, 1, '2023-02-04 00:44:25', '2023-02-04 00:44:25'),
(221, NULL, 'DUMMY', 221, 1, '2023-02-04 00:45:29', '2023-02-04 00:45:29'),
(222, NULL, 'DUMMY', 222, 1, '2023-02-04 00:45:31', '2023-02-04 00:45:31'),
(223, NULL, 'DUMMY', 223, 1, '2023-02-04 00:46:22', '2023-02-04 00:46:22'),
(224, NULL, 'DUMMY', 224, 1, '2023-02-04 00:46:36', '2023-02-04 00:46:36'),
(225, NULL, 'DUMMY', 225, 1, '2023-02-04 00:46:51', '2023-02-04 00:46:51'),
(226, NULL, 'DUMMY', 226, 1, '2023-02-04 00:47:07', '2023-02-04 00:47:07'),
(227, NULL, 'DUMMY', 227, 1, '2023-02-04 00:47:43', '2023-02-04 00:47:43'),
(228, NULL, 'DUMMY', 228, 1, '2023-02-04 00:47:53', '2023-02-04 00:47:53'),
(229, NULL, 'DUMMY', 229, 1, '2023-02-04 00:48:38', '2023-02-04 00:48:38'),
(230, NULL, 'DUMMY', 230, 1, '2023-02-04 00:48:43', '2023-02-04 00:48:43'),
(231, NULL, 'DUMMY', 231, 1, '2023-02-04 00:49:27', '2023-02-04 00:49:27'),
(232, NULL, 'DUMMY', 232, 1, '2023-02-04 00:49:43', '2023-02-04 00:49:43'),
(233, NULL, 'DUMMY', 233, 1, '2023-02-04 00:50:13', '2023-02-04 00:50:13'),
(234, NULL, 'DUMMY', 234, 1, '2023-02-04 00:51:23', '2023-02-04 00:51:23'),
(235, NULL, 'DUMMY', 235, 1, '2023-02-04 00:52:24', '2023-02-04 00:52:24'),
(236, NULL, 'DUMMY', 236, 1, '2023-02-04 00:53:16', '2023-02-04 00:53:16'),
(237, NULL, 'DUMMY', 237, 1, '2023-02-04 00:53:57', '2023-02-04 00:53:57'),
(238, NULL, 'DUMMY', 238, 1, '2023-02-04 00:54:39', '2023-02-04 00:54:39'),
(239, NULL, 'DUMMY', 239, 1, '2023-02-04 00:54:55', '2023-02-04 00:54:55'),
(240, NULL, 'DUMMY', 240, 1, '2023-02-04 00:55:43', '2023-02-04 00:55:43'),
(241, NULL, 'DUMMY', 241, 1, '2023-02-04 00:55:45', '2023-02-04 00:55:45'),
(242, NULL, 'DUMMY', 242, 1, '2023-02-04 00:56:36', '2023-02-04 00:56:36'),
(243, NULL, 'DUMMY', 243, 1, '2023-02-04 00:56:46', '2023-02-04 00:56:46'),
(244, NULL, 'DUMMY', 244, 1, '2023-02-04 00:57:23', '2023-02-04 00:57:23'),
(245, NULL, 'DUMMY', 245, 1, '2023-02-04 00:57:50', '2023-02-04 00:57:50'),
(246, NULL, 'DUMMY', 246, 1, '2023-02-04 00:58:13', '2023-02-04 00:58:13'),
(247, NULL, 'DUMMY', 247, 1, '2023-02-04 00:58:48', '2023-02-04 00:58:48'),
(248, NULL, 'DUMMY', 248, 1, '2023-02-04 00:59:00', '2023-02-04 00:59:00'),
(249, NULL, 'DUMMY', 249, 1, '2023-02-04 00:59:17', '2023-02-04 00:59:17'),
(250, NULL, 'DUMMY', 250, 1, '2023-02-04 00:59:56', '2023-02-04 00:59:56'),
(251, NULL, 'DUMMY', 251, 1, '2023-02-04 01:00:01', '2023-02-04 01:00:01'),
(252, NULL, 'DUMMY', 252, 1, '2023-02-04 01:00:40', '2023-02-04 01:00:40'),
(253, NULL, 'DUMMY', 253, 1, '2023-02-04 01:00:53', '2023-02-04 01:00:53'),
(254, NULL, 'DUMMY', 254, 1, '2023-02-04 01:01:20', '2023-02-04 01:01:20'),
(255, NULL, 'DUMMY', 255, 1, '2023-02-04 01:01:48', '2023-02-04 01:01:48'),
(256, NULL, 'DUMMY', 256, 1, '2023-02-04 01:02:10', '2023-02-04 01:02:10'),
(257, NULL, 'DUMMY', 257, 1, '2023-02-04 01:02:44', '2023-02-04 01:02:44'),
(258, NULL, 'DUMMY', 258, 1, '2023-02-04 01:03:08', '2023-02-04 01:03:08'),
(259, NULL, 'DUMMY', 259, 1, '2023-02-04 01:03:53', '2023-02-04 01:03:53'),
(260, NULL, 'DUMMY', 260, 1, '2023-02-04 01:03:53', '2023-02-04 01:03:53'),
(261, NULL, 'DUMMY', 261, 1, '2023-02-04 01:04:45', '2023-02-04 01:04:45'),
(262, NULL, 'DUMMY', 262, 1, '2023-02-04 01:04:47', '2023-02-04 01:04:47'),
(263, NULL, 'DUMMY', 263, 1, '2023-02-04 01:05:44', '2023-02-04 01:05:44'),
(264, NULL, 'DUMMY', 264, 1, '2023-02-04 01:06:20', '2023-02-04 01:06:20'),
(265, NULL, 'DUMMY', 265, 1, '2023-02-04 01:06:39', '2023-02-04 01:06:39'),
(266, NULL, 'DUMMY', 266, 1, '2023-02-04 01:07:12', '2023-02-04 01:07:12'),
(267, NULL, 'DUMMY', 267, 1, '2023-02-04 01:07:59', '2023-02-04 01:07:59'),
(268, NULL, 'DUMMY', 268, 1, '2023-02-04 01:08:55', '2023-02-04 01:08:55'),
(269, NULL, 'DUMMY', 269, 1, '2023-02-04 01:09:04', '2023-02-04 01:09:04'),
(270, NULL, 'DUMMY', 270, 1, '2023-02-04 01:10:15', '2023-02-04 01:10:15'),
(271, NULL, 'DUMMY', 271, 1, '2023-02-04 01:11:07', '2023-02-04 01:11:07'),
(272, NULL, 'DUMMY', 272, 1, '2023-02-04 01:12:39', '2023-02-04 01:12:39'),
(273, NULL, 'DUMMY', 273, 1, '2023-02-04 01:13:26', '2023-02-04 01:13:26'),
(274, NULL, 'DUMMY', 274, 1, '2023-02-04 01:13:44', '2023-02-04 01:13:44'),
(275, NULL, 'DUMMY', 275, 1, '2023-02-04 01:14:17', '2023-02-04 01:14:17'),
(276, NULL, 'DUMMY', 276, 1, '2023-02-04 01:14:35', '2023-02-04 01:14:35'),
(277, NULL, 'DUMMY', 277, 1, '2023-02-04 01:15:00', '2023-02-04 01:15:00'),
(278, NULL, 'DUMMY', 278, 1, '2023-02-04 01:15:21', '2023-02-04 01:15:21'),
(279, NULL, 'DUMMY', 279, 1, '2023-02-04 01:16:04', '2023-02-04 01:16:04'),
(280, NULL, 'DUMMY', 280, 1, '2023-02-04 01:16:13', '2023-02-04 01:16:13'),
(281, NULL, 'DUMMY', 281, 1, '2023-02-04 01:17:05', '2023-02-04 01:17:05'),
(282, NULL, 'DUMMY', 282, 1, '2023-02-04 01:17:54', '2023-02-04 01:17:54'),
(283, NULL, 'DUMMY', 283, 1, '2023-02-04 01:17:57', '2023-02-04 01:17:57'),
(284, NULL, 'DUMMY', 284, 1, '2023-02-04 01:18:56', '2023-02-04 01:18:56'),
(285, NULL, 'DUMMY', 285, 1, '2023-02-04 01:19:15', '2023-02-04 01:19:15'),
(286, NULL, 'DUMMY', 286, 1, '2023-02-04 01:19:46', '2023-02-04 01:19:46'),
(287, NULL, 'DUMMY', 287, 1, '2023-02-04 01:20:31', '2023-02-04 01:20:31'),
(288, NULL, 'DUMMY', 288, 1, '2023-02-04 01:21:02', '2023-02-04 01:21:02'),
(289, NULL, 'DUMMY', 289, 1, '2023-02-04 01:21:37', '2023-02-04 01:21:37'),
(290, NULL, 'DUMMY', 290, 1, '2023-02-04 01:22:23', '2023-02-04 01:22:23'),
(291, NULL, 'DUMMY', 291, 1, '2023-02-04 01:22:29', '2023-02-04 01:22:29'),
(292, NULL, 'DUMMY', 292, 1, '2023-02-04 01:23:27', '2023-02-04 01:23:27'),
(293, NULL, 'DUMMY', 293, 1, '2023-02-04 01:23:27', '2023-02-04 01:23:27'),
(294, NULL, 'DUMMY', 294, 1, '2023-02-04 01:24:14', '2023-02-04 01:24:14'),
(295, NULL, 'DUMMY', 295, 1, '2023-02-04 01:24:40', '2023-02-04 01:24:40'),
(296, NULL, 'DUMMY', 296, 1, '2023-02-04 01:25:09', '2023-02-04 01:25:09'),
(297, NULL, 'DUMMY', 297, 1, '2023-02-04 01:25:53', '2023-02-04 01:25:53'),
(298, NULL, 'DUMMY', 298, 1, '2023-02-04 01:26:27', '2023-02-04 01:26:27'),
(299, NULL, 'DUMMY', 299, 1, '2023-02-04 01:26:41', '2023-02-04 01:26:41'),
(300, NULL, 'DUMMY', 300, 1, '2023-02-04 01:27:29', '2023-02-04 01:27:29'),
(301, NULL, 'DUMMY', 301, 1, '2023-02-04 01:27:50', '2023-02-04 01:27:50'),
(302, NULL, 'DUMMY', 302, 1, '2023-02-04 01:28:32', '2023-02-04 01:28:32'),
(303, NULL, 'DUMMY', 303, 1, '2023-02-04 01:28:51', '2023-02-04 01:28:51'),
(304, NULL, 'DUMMY', 304, 1, '2023-02-04 01:29:33', '2023-02-04 01:29:33'),
(305, NULL, 'DUMMY', 305, 1, '2023-02-04 01:29:59', '2023-02-04 01:29:59'),
(306, NULL, 'DUMMY', 306, 1, '2023-02-04 01:30:43', '2023-02-04 01:30:43'),
(307, NULL, 'DUMMY', 307, 1, '2023-02-04 01:30:44', '2023-02-04 01:30:44'),
(308, NULL, 'DUMMY', 308, 1, '2023-02-04 01:32:03', '2023-02-04 01:32:03'),
(309, NULL, 'DUMMY', 309, 1, '2023-02-04 01:32:24', '2023-02-04 01:32:24'),
(310, NULL, 'DUMMY', 310, 1, '2023-02-04 01:33:01', '2023-02-04 01:33:01'),
(311, NULL, 'DUMMY', 311, 1, '2023-02-04 01:33:18', '2023-02-04 01:33:18'),
(312, NULL, 'DUMMY', 312, 1, '2023-02-04 01:34:18', '2023-02-04 01:34:18'),
(313, NULL, 'DUMMY', 313, 1, '2023-02-04 01:34:38', '2023-02-04 01:34:38'),
(314, NULL, 'DUMMY', 314, 1, '2023-02-04 01:35:10', '2023-02-04 01:35:10'),
(315, NULL, 'DUMMY', 315, 1, '2023-02-04 01:36:07', '2023-02-04 01:36:07'),
(316, NULL, 'DUMMY', 316, 1, '2023-02-04 01:36:56', '2023-02-04 01:36:56'),
(317, NULL, 'DUMMY', 317, 1, '2023-02-04 01:37:20', '2023-02-04 01:37:20'),
(318, NULL, 'DUMMY', 318, 1, '2023-02-04 01:38:03', '2023-02-04 01:38:03'),
(319, NULL, 'DUMMY', 319, 1, '2023-02-04 01:38:13', '2023-02-04 01:38:13'),
(320, NULL, 'DUMMY', 320, 1, '2023-02-04 01:38:59', '2023-02-04 01:38:59'),
(321, NULL, 'DUMMY', 321, 1, '2023-02-04 01:39:58', '2023-02-04 01:39:58'),
(322, NULL, 'DUMMY', 322, 1, '2023-02-04 01:40:50', '2023-02-04 01:40:50'),
(323, NULL, 'DUMMY', 323, 1, '2023-02-04 01:41:58', '2023-02-04 01:41:58'),
(324, NULL, 'DUMMY', 324, 1, '2023-02-04 01:42:42', '2023-02-04 01:42:42'),
(325, NULL, 'DUMMY', 325, 1, '2023-02-04 01:45:27', '2023-02-04 01:45:27'),
(326, NULL, 'DUMMY', 326, 1, '2023-02-04 01:46:26', '2023-02-04 01:46:26'),
(327, NULL, 'DUMMY', 327, 1, '2023-02-04 01:47:11', '2023-02-04 01:47:11'),
(328, NULL, 'DUMMY', 328, 1, '2023-02-04 01:48:08', '2023-02-04 01:48:08'),
(329, NULL, 'DUMMY', 329, 1, '2023-02-04 01:48:56', '2023-02-04 01:48:56'),
(330, NULL, 'DUMMY', 330, 1, '2023-02-04 01:49:47', '2023-02-04 01:49:47'),
(331, NULL, 'DUMMY', 331, 1, '2023-02-04 01:51:00', '2023-02-04 01:51:00'),
(332, NULL, 'DUMMY', 332, 1, '2023-02-04 01:51:42', '2023-02-04 01:51:42'),
(333, NULL, 'DUMMY', 333, 1, '2023-02-04 01:52:27', '2023-02-04 01:52:27'),
(334, NULL, 'DUMMY', 334, 1, '2023-02-04 01:53:12', '2023-02-04 01:53:12'),
(335, NULL, 'DUMMY', 335, 1, '2023-02-04 01:54:13', '2023-02-04 01:54:13'),
(336, NULL, 'DUMMY', 336, 1, '2023-02-04 01:55:30', '2023-02-04 01:55:30'),
(337, NULL, 'DUMMY', 337, 1, '2023-02-04 01:55:42', '2023-02-04 01:55:42'),
(338, NULL, 'DUMMY', 338, 1, '2023-02-04 01:56:24', '2023-02-04 01:56:24'),
(339, NULL, 'DUMMY', 339, 1, '2023-02-04 01:57:00', '2023-02-04 01:57:00'),
(340, NULL, 'DUMMY', 340, 1, '2023-02-04 01:57:12', '2023-02-04 01:57:12'),
(341, NULL, 'DUMMY', 341, 1, '2023-02-04 01:58:16', '2023-02-04 01:58:16'),
(342, NULL, 'DUMMY', 342, 1, '2023-02-04 01:58:38', '2023-02-04 01:58:38'),
(343, NULL, 'DUMMY', 343, 1, '2023-02-04 01:59:28', '2023-02-04 01:59:28'),
(344, NULL, 'DUMMY', 344, 1, '2023-02-04 02:02:15', '2023-02-04 02:02:15'),
(345, NULL, 'DUMMY', 345, 1, '2023-02-04 02:03:48', '2023-02-04 02:03:48'),
(346, NULL, 'DUMMY', 346, 1, '2023-02-04 02:04:55', '2023-02-04 02:04:55'),
(347, NULL, 'DUMMY', 347, 1, '2023-02-04 02:09:32', '2023-02-04 02:09:32'),
(348, NULL, 'DUMMY', 348, 1, '2023-02-04 02:12:30', '2023-02-04 02:12:30'),
(349, NULL, 'DUMMY', 349, 1, '2023-02-04 02:21:58', '2023-02-04 02:21:58'),
(350, NULL, 'DUMMY', 350, 1, '2023-02-04 02:24:16', '2023-02-04 02:24:16'),
(351, NULL, 'DUMMY', 351, 1, '2023-02-04 02:25:43', '2023-02-04 02:25:43'),
(352, NULL, 'DUMMY', 352, 1, '2023-02-04 02:32:37', '2023-02-04 02:32:37'),
(353, NULL, 'DUMMY', 353, 1, '2023-02-04 02:33:33', '2023-02-04 02:33:33'),
(354, NULL, 'DUMMY', 354, 1, '2023-02-04 02:34:43', '2023-02-04 02:34:43'),
(355, NULL, 'DUMMY', 355, 1, '2023-02-04 02:35:53', '2023-02-04 02:35:53'),
(356, NULL, 'DUMMY', 356, 1, '2023-02-04 02:36:51', '2023-02-04 02:36:51'),
(357, NULL, 'DUMMY', 357, 1, '2023-02-04 02:37:39', '2023-02-04 02:37:39'),
(358, NULL, 'DUMMY', 358, 1, '2023-02-04 02:39:42', '2023-02-04 02:39:42'),
(359, NULL, 'DUMMY', 359, 1, '2023-02-04 02:40:36', '2023-02-04 02:40:36'),
(360, NULL, 'DUMMY', 360, 1, '2023-02-04 02:41:59', '2023-02-04 02:41:59'),
(361, NULL, 'DUMMY', 361, 1, '2023-02-04 02:43:00', '2023-02-04 02:43:00'),
(362, NULL, 'DUMMY', 362, 1, '2023-02-04 02:44:08', '2023-02-04 02:44:08'),
(363, NULL, 'DUMMY', 363, 1, '2023-02-04 02:45:21', '2023-02-04 02:45:21'),
(364, NULL, 'DUMMY', 364, 1, '2023-02-04 02:46:13', '2023-02-04 02:46:13'),
(365, NULL, 'DUMMY', 365, 1, '2023-02-04 02:49:19', '2023-02-04 02:49:19'),
(366, NULL, 'DUMMY', 366, 1, '2023-02-04 03:03:02', '2023-02-04 03:03:02'),
(367, NULL, 'DUMMY', 367, 1, '2023-02-04 03:05:57', '2023-02-04 03:05:57'),
(368, NULL, 'DUMMY', 368, 1, '2023-02-04 03:07:04', '2023-02-04 03:07:04'),
(369, NULL, 'DUMMY', 369, 1, '2023-02-04 03:08:13', '2023-02-04 03:08:13'),
(370, NULL, 'DUMMY', 370, 1, '2023-02-04 03:09:51', '2023-02-04 03:09:51'),
(371, NULL, 'DUMMY', 371, 1, '2023-02-04 03:11:07', '2023-02-04 03:11:07'),
(372, NULL, 'DUMMY', 372, 1, '2023-02-04 03:12:10', '2023-02-04 03:12:10'),
(373, NULL, 'DUMMY', 373, 1, '2023-02-04 03:13:20', '2023-02-04 03:13:20'),
(374, NULL, 'DUMMY', 374, 1, '2023-02-04 03:14:55', '2023-02-04 03:14:55'),
(375, NULL, 'DUMMY', 375, 1, '2023-02-04 03:16:22', '2023-02-04 03:16:22'),
(376, NULL, 'DUMMY', 376, 1, '2023-02-04 03:17:28', '2023-02-04 03:17:28'),
(377, NULL, 'DUMMY', 377, 1, '2023-02-04 03:18:33', '2023-02-04 03:18:33'),
(378, NULL, 'DUMMY', 378, 1, '2023-02-04 03:19:47', '2023-02-04 03:19:47'),
(379, NULL, 'DUMMY', 379, 1, '2023-02-04 03:21:06', '2023-02-04 03:21:06'),
(380, NULL, 'DUMMY', 380, 1, '2023-02-04 03:22:10', '2023-02-04 03:22:10'),
(381, NULL, 'DUMMY', 381, 1, '2023-02-04 03:23:02', '2023-02-04 03:23:02'),
(382, NULL, 'DUMMY', 382, 1, '2023-02-04 03:23:55', '2023-02-04 03:23:55'),
(384, NULL, 'DUMMY', 384, 1, '2023-02-04 03:28:01', '2023-02-04 03:28:01'),
(385, NULL, 'DUMMY', 385, 1, '2023-02-04 03:29:19', '2023-02-04 03:29:19'),
(386, NULL, 'DUMMY', 386, 1, '2023-02-04 03:31:59', '2023-02-04 03:31:59'),
(387, NULL, 'DUMMY', 387, 1, '2023-02-04 03:33:14', '2023-02-04 03:33:14'),
(388, NULL, 'DUMMY', 388, 1, '2023-02-04 03:34:19', '2023-02-04 03:34:19'),
(389, NULL, 'DUMMY', 389, 1, '2023-02-04 03:35:37', '2023-02-04 03:35:37'),
(390, NULL, 'DUMMY', 390, 1, '2023-02-04 03:36:31', '2023-02-04 03:36:31'),
(391, NULL, 'DUMMY', 391, 1, '2023-02-04 03:39:08', '2023-02-04 03:39:08'),
(392, NULL, 'DUMMY', 392, 1, '2023-02-04 03:40:45', '2023-02-04 03:40:45'),
(393, NULL, 'DUMMY', 393, 1, '2023-02-04 03:42:32', '2023-02-04 03:42:32'),
(394, NULL, 'DUMMY', 394, 1, '2023-02-04 03:43:50', '2023-02-04 03:43:50'),
(395, NULL, 'DUMMY', 395, 1, '2023-02-04 03:45:58', '2023-02-04 03:45:58'),
(396, NULL, 'DUMMY', 396, 1, '2023-02-04 03:47:47', '2023-02-04 03:47:47'),
(397, NULL, 'DUMMY', 397, 1, '2023-02-04 03:49:10', '2023-02-04 03:49:10');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` int UNSIGNED NOT NULL,
  `transaction_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `variation_id` int UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `pp_without_discount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) NOT NULL,
  `purchase_price_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int UNSIGNED DEFAULT NULL,
  `quantity_sold` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_quantity_used` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_unit_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '1.0000', '180.0000', '0.00', '180.0000', '180.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-01-16 21:24:24', '2023-01-16 21:24:40'),
(2, 3, 2, 2, '20.0000', '180.0000', '0.00', '180.0000', '180.0000', '0.0000', NULL, '2.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-02 18:55:41', '2023-02-03 17:06:25'),
(3, 5, 3, 3, '6.0000', '412.0000', '0.00', '412.0000', '412.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 13:42:07', '2023-02-03 13:42:07'),
(4, 6, 4, 4, '4.0000', '412.0000', '0.00', '412.0000', '412.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:05:12', '2023-02-03 14:05:12'),
(5, 7, 5, 5, '3.0000', '412.0000', '0.00', '412.0000', '412.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:07:47', '2023-02-03 14:07:47'),
(6, 8, 6, 6, '5.0000', '486.0000', '0.00', '486.0000', '486.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:11:59', '2023-02-03 14:11:59'),
(7, 9, 7, 7, '5.0000', '486.0000', '0.00', '486.0000', '486.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:14:09', '2023-02-03 16:51:38'),
(8, 10, 8, 8, '3.0000', '486.0000', '0.00', '486.0000', '486.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:19:39', '2023-02-03 14:19:39'),
(9, 11, 9, 9, '5.0000', '683.0000', '0.00', '683.0000', '683.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:25:05', '2023-02-03 14:25:05'),
(10, 12, 10, 10, '5.0000', '683.0000', '0.00', '683.0000', '683.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:27:27', '2023-02-03 14:27:27'),
(11, 13, 11, 11, '5.0000', '407.0000', '0.00', '407.0000', '407.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:29:36', '2023-02-03 14:29:36'),
(12, 14, 12, 12, '2.0000', '746.0000', '0.00', '746.0000', '746.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:31:28', '2023-02-03 14:31:28'),
(13, 15, 13, 13, '3.0000', '570.0000', '0.00', '570.0000', '570.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:32:41', '2023-02-03 14:32:41'),
(14, 16, 14, 14, '2.0000', '570.0000', '0.00', '570.0000', '570.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:33:59', '2023-02-03 14:33:59'),
(15, 17, 15, 15, '3.0000', '570.0000', '0.00', '570.0000', '570.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:35:16', '2023-02-03 14:35:16'),
(16, 18, 16, 16, '5.0000', '378.0000', '0.00', '378.0000', '378.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:36:34', '2023-02-03 14:36:34'),
(17, 19, 17, 17, '5.0000', '378.0000', '0.00', '378.0000', '378.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:37:44', '2023-02-03 14:37:44'),
(18, 20, 18, 18, '5.0000', '378.0000', '0.00', '378.0000', '378.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:38:40', '2023-02-03 14:38:40'),
(19, 21, 19, 19, '5.0000', '378.0000', '0.00', '378.0000', '378.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:40:43', '2023-02-03 14:40:43'),
(20, 22, 20, 20, '3.0000', '339.0000', '0.00', '339.0000', '339.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:41:46', '2023-02-03 14:41:46'),
(21, 23, 21, 21, '3.0000', '339.0000', '0.00', '339.0000', '339.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:42:51', '2023-02-03 14:42:51'),
(22, 24, 22, 22, '3.0000', '339.0000', '0.00', '339.0000', '339.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:44:19', '2023-02-03 14:44:19'),
(23, 25, 23, 23, '3.0000', '339.0000', '0.00', '339.0000', '339.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:45:15', '2023-02-03 14:45:15'),
(24, 26, 24, 24, '5.0000', '486.0000', '0.00', '486.0000', '486.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:46:09', '2023-02-03 14:46:09'),
(25, 27, 25, 25, '5.0000', '486.0000', '0.00', '486.0000', '486.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:47:04', '2023-02-03 14:47:04'),
(26, 28, 26, 26, '3.0000', '486.0000', '0.00', '486.0000', '486.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:47:54', '2023-02-03 14:47:54'),
(27, 29, 27, 27, '3.0000', '486.0000', '0.00', '486.0000', '486.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:49:29', '2023-02-03 14:49:29'),
(28, 30, 28, 28, '5.0000', '545.0000', '0.00', '545.0000', '545.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:50:28', '2023-02-03 14:50:28'),
(29, 31, 29, 29, '3.0000', '545.0000', '0.00', '545.0000', '545.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:51:19', '2023-02-03 14:51:19'),
(30, 32, 30, 30, '3.0000', '545.0000', '0.00', '545.0000', '545.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:52:20', '2023-02-03 14:52:20'),
(31, 33, 31, 31, '3.0000', '545.0000', '0.00', '545.0000', '545.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:53:11', '2023-02-03 14:53:11'),
(32, 34, 32, 32, '3.0000', '545.0000', '0.00', '545.0000', '545.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:54:18', '2023-02-03 14:54:18'),
(33, 35, 33, 33, '10.0000', '324.0000', '0.00', '324.0000', '324.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:56:07', '2023-02-03 16:36:04'),
(34, 36, 34, 34, '5.0000', '324.0000', '0.00', '324.0000', '324.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 14:59:18', '2023-02-03 14:59:18'),
(35, 37, 35, 35, '5.0000', '520.0000', '0.00', '520.0000', '520.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:00:52', '2023-02-03 15:00:52'),
(36, 38, 36, 36, '3.0000', '520.0000', '0.00', '520.0000', '520.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:01:46', '2023-02-03 15:01:46'),
(37, 39, 37, 37, '3.0000', '520.0000', '0.00', '520.0000', '520.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:02:40', '2023-02-03 15:02:40'),
(38, 40, 38, 38, '3.0000', '575.0000', '0.00', '575.0000', '575.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:03:23', '2023-02-03 15:03:23'),
(39, 41, 39, 39, '3.0000', '575.0000', '0.00', '575.0000', '575.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:04:07', '2023-02-03 15:04:07'),
(40, 42, 40, 40, '3.0000', '575.0000', '0.00', '575.0000', '575.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:04:48', '2023-02-03 15:04:48'),
(41, 43, 41, 41, '3.0000', '525.0000', '0.00', '525.0000', '525.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:05:45', '2023-02-03 15:05:45'),
(42, 44, 42, 42, '2.0000', '525.0000', '0.00', '525.0000', '525.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:07:24', '2023-02-03 15:07:24'),
(43, 45, 43, 43, '5.0000', '550.0000', '0.00', '550.0000', '550.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:08:24', '2023-02-03 15:08:24'),
(44, 46, 45, 45, '1.0000', '550.0000', '0.00', '550.0000', '550.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:10:26', '2023-02-03 16:51:38'),
(45, 47, 46, 46, '3.0000', '270.0000', '0.00', '270.0000', '270.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:11:29', '2023-02-03 15:11:29'),
(46, 48, 47, 47, '4.0000', '270.0000', '0.00', '270.0000', '270.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:12:32', '2023-02-03 15:12:32'),
(47, 49, 48, 48, '4.0000', '270.0000', '0.00', '270.0000', '270.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:13:32', '2023-02-03 15:13:32'),
(48, 50, 49, 49, '6.0000', '358.0000', '0.00', '358.0000', '358.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:14:21', '2023-02-03 15:14:21'),
(49, 51, 50, 50, '4.0000', '358.0000', '0.00', '358.0000', '358.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:15:10', '2023-02-03 15:15:10'),
(50, 52, 51, 51, '4.0000', '358.0000', '0.00', '358.0000', '358.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:16:00', '2023-02-03 15:16:00'),
(51, 53, 52, 52, '5.0000', '486.0000', '0.00', '486.0000', '486.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:17:16', '2023-02-03 15:17:16'),
(52, 54, 53, 53, '5.0000', '486.0000', '0.00', '486.0000', '486.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:28:39', '2023-02-03 15:28:39'),
(53, 55, 54, 54, '3.0000', '452.0000', '0.00', '452.0000', '452.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:30:40', '2023-02-03 16:51:38'),
(54, 56, 55, 55, '3.0000', '452.0000', '0.00', '452.0000', '452.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:31:47', '2023-02-03 15:31:47'),
(55, 57, 56, 56, '6.0000', '570.0000', '0.00', '570.0000', '570.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:32:41', '2023-02-03 15:32:41'),
(56, 58, 57, 57, '4.0000', '570.0000', '0.00', '570.0000', '570.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:33:37', '2023-02-03 15:33:37'),
(57, 59, 58, 58, '4.0000', '570.0000', '0.00', '570.0000', '570.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:34:27', '2023-02-03 15:34:27'),
(58, 60, 59, 59, '4.0000', '570.0000', '0.00', '570.0000', '570.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:35:22', '2023-02-03 16:51:38'),
(59, 61, 60, 60, '4.0000', '570.0000', '0.00', '570.0000', '570.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:37:24', '2023-02-03 15:37:24'),
(60, 62, 61, 61, '5.0000', '466.0000', '0.00', '466.0000', '466.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:38:20', '2023-02-03 15:38:20'),
(61, 63, 62, 62, '3.0000', '466.0000', '0.00', '466.0000', '466.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:39:23', '2023-02-03 15:39:23'),
(62, 64, 63, 63, '5.0000', '584.0000', '0.00', '584.0000', '584.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:40:19', '2023-02-03 15:40:19'),
(63, 65, 64, 64, '3.0000', '584.0000', '0.00', '584.0000', '584.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:41:16', '2023-02-03 15:41:16'),
(64, 66, 65, 65, '3.0000', '584.0000', '0.00', '584.0000', '584.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:42:16', '2023-02-03 15:42:16'),
(65, 67, 66, 66, '3.0000', '584.0000', '0.00', '584.0000', '584.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:43:23', '2023-02-03 15:43:23'),
(66, 68, 67, 67, '3.0000', '520.0000', '0.00', '520.0000', '520.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:44:31', '2023-02-03 15:44:31'),
(67, 69, 68, 68, '3.0000', '520.0000', '0.00', '520.0000', '520.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:45:24', '2023-02-03 15:45:24'),
(68, 70, 70, 70, '6.0000', '402.0000', '0.00', '402.0000', '402.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:47:06', '2023-02-03 15:47:06'),
(69, 71, 71, 71, '3.0000', '402.0000', '0.00', '402.0000', '402.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:48:10', '2023-02-03 15:48:10'),
(70, 72, 72, 72, '3.0000', '402.0000', '0.00', '402.0000', '402.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:48:56', '2023-02-03 15:48:56'),
(71, 73, 73, 73, '5.0000', '407.0000', '0.00', '407.0000', '407.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:49:43', '2023-02-03 15:49:43'),
(72, 74, 74, 74, '3.0000', '407.0000', '0.00', '407.0000', '407.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:50:33', '2023-02-03 15:50:33'),
(73, 75, 75, 75, '3.0000', '407.0000', '0.00', '407.0000', '407.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:51:30', '2023-02-03 15:51:30'),
(74, 76, 76, 76, '6.0000', '353.0000', '0.00', '353.0000', '353.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:52:56', '2023-02-03 15:52:56'),
(75, 77, 77, 77, '6.0000', '353.0000', '0.00', '353.0000', '353.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 15:54:14', '2023-02-03 15:54:14'),
(77, 86, 80, 80, '3.0000', '220.0000', '0.00', '220.0000', '220.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 22:49:29', '2023-02-03 22:49:29'),
(78, 87, 81, 81, '3.0000', '190.0000', '0.00', '190.0000', '190.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 22:50:43', '2023-02-03 22:50:43'),
(79, 88, 82, 82, '10.0000', '26.0000', '0.00', '26.0000', '26.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 22:52:03', '2023-02-03 22:52:03'),
(80, 89, 83, 83, '12.0000', '10.0000', '0.00', '10.0000', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 22:53:13', '2023-02-03 22:53:13'),
(81, 90, 84, 84, '12.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 22:54:32', '2023-02-03 22:54:32'),
(82, 91, 85, 85, '3.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 22:55:46', '2023-02-03 22:55:46'),
(83, 92, 86, 86, '24.0000', '27.0000', '0.00', '27.0000', '27.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 22:56:43', '2023-02-03 22:56:43'),
(84, 93, 87, 87, '12.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:01:28', '2023-02-03 23:01:28'),
(85, 94, 88, 88, '3.0000', '240.0000', '0.00', '240.0000', '240.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:03:14', '2023-02-03 23:03:14'),
(86, 95, 89, 89, '3.0000', '180.0000', '0.00', '180.0000', '180.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:04:16', '2023-02-03 23:04:16'),
(87, 96, 90, 90, '6.0000', '80.0000', '0.00', '80.0000', '80.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:05:14', '2023-02-03 23:05:14'),
(88, 97, 91, 91, '6.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:06:25', '2023-02-03 23:06:25'),
(89, 98, 92, 92, '12.0000', '65.0000', '0.00', '65.0000', '65.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:07:21', '2023-02-03 23:07:21'),
(90, 99, 93, 93, '6.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:09:08', '2023-02-03 23:09:08'),
(91, 100, 94, 94, '3.0000', '210.0000', '0.00', '210.0000', '210.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:10:15', '2023-02-03 23:10:15'),
(92, 101, 95, 95, '3.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:11:17', '2023-02-03 23:11:17'),
(93, 102, 96, 96, '3.0000', '170.0000', '0.00', '170.0000', '170.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:12:22', '2023-02-03 23:12:22'),
(94, 103, 97, 97, '3.0000', '170.0000', '0.00', '170.0000', '170.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:15:27', '2023-02-03 23:15:27'),
(95, 104, 98, 98, '3.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:17:02', '2023-02-03 23:17:02'),
(96, 105, 99, 99, '3.0000', '220.0000', '0.00', '220.0000', '220.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:18:17', '2023-02-03 23:18:17'),
(97, 106, 101, 101, '3.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:19:32', '2023-02-03 23:19:32'),
(98, 107, 102, 102, '4.0000', '353.0000', '0.00', '353.0000', '353.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:19:36', '2023-02-03 23:19:36'),
(99, 108, 103, 103, '6.0000', '160.0000', '0.00', '160.0000', '160.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:21:22', '2023-02-03 23:21:22'),
(100, 109, 104, 104, '12.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:22:15', '2023-02-03 23:22:15'),
(101, 110, 105, 105, '3.0000', '220.0000', '0.00', '220.0000', '220.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:23:51', '2023-02-03 23:23:51'),
(102, 111, 106, 106, '15.0000', '24.0000', '0.00', '24.0000', '24.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:24:55', '2023-02-03 23:24:55'),
(103, 112, 107, 107, '8.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:25:46', '2023-02-03 23:25:46'),
(104, 113, 108, 108, '6.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:26:44', '2023-02-03 23:26:44'),
(105, 114, 109, 109, '12.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:27:39', '2023-02-03 23:27:39'),
(106, 115, 110, 110, '6.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:28:38', '2023-02-03 23:28:38'),
(107, 116, 111, 111, '12.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:29:38', '2023-02-03 23:29:38'),
(108, 117, 112, 112, '6.0000', '120.0000', '0.00', '120.0000', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:30:37', '2023-02-03 23:30:37'),
(109, 118, 113, 113, '12.0000', '210.0000', '0.00', '210.0000', '210.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:31:34', '2023-02-03 23:31:34'),
(110, 119, 114, 114, '12.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:32:20', '2023-02-03 23:32:20'),
(111, 120, 115, 115, '12.0000', '90.0000', '0.00', '90.0000', '90.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:33:16', '2023-02-03 23:33:16'),
(112, 121, 116, 116, '12.0000', '10.0000', '0.00', '10.0000', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:34:17', '2023-02-03 23:34:17'),
(113, 122, 117, 117, '2.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:35:37', '2023-02-03 23:35:37'),
(114, 123, 118, 118, '12.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:36:29', '2023-02-03 23:36:29'),
(115, 124, 119, 119, '6.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:37:11', '2023-02-03 23:37:11'),
(116, 125, 120, 120, '6.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:37:55', '2023-02-03 23:37:55'),
(117, 126, 121, 121, '4.0000', '353.0000', '0.00', '353.0000', '353.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:38:35', '2023-02-03 23:38:35'),
(118, 127, 122, 122, '6.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:38:45', '2023-02-03 23:38:45'),
(119, 128, 123, 123, '6.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:39:43', '2023-02-03 23:39:43'),
(120, 129, 124, 124, '5.0000', '614.0000', '0.00', '614.0000', '614.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:40:16', '2023-02-03 23:40:16'),
(121, 130, 125, 125, '6.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:40:34', '2023-02-03 23:40:34'),
(122, 131, 126, 126, '12.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:41:35', '2023-02-03 23:41:35'),
(123, 132, 127, 127, '3.0000', '614.0000', '0.00', '614.0000', '614.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:42:00', '2023-02-03 23:42:00'),
(124, 133, 128, 128, '12.0000', '55.0000', '0.00', '55.0000', '55.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:42:19', '2023-02-03 23:42:19'),
(125, 134, 129, 129, '12.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:43:06', '2023-02-03 23:43:06'),
(126, 135, 130, 130, '3.0000', '614.0000', '0.00', '614.0000', '614.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:43:14', '2023-02-03 23:43:14'),
(127, 136, 131, 131, '3.0000', '210.0000', '0.00', '210.0000', '210.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:43:53', '2023-02-03 23:43:53'),
(128, 137, 133, 133, '12.0000', '55.0000', '0.00', '55.0000', '55.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:44:31', '2023-02-03 23:44:31'),
(129, 138, 132, 132, '3.0000', '614.0000', '0.00', '614.0000', '614.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:44:31', '2023-02-03 23:44:31'),
(130, 139, 134, 134, '12.0000', '36.0000', '0.00', '36.0000', '36.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:45:13', '2023-02-03 23:45:13'),
(131, 140, 135, 135, '12.0000', '31.0000', '0.00', '31.0000', '31.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:46:01', '2023-02-03 23:46:01'),
(132, 141, 136, 136, '3.0000', '520.0000', '0.00', '520.0000', '520.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:46:09', '2023-02-03 23:46:09'),
(133, 142, 137, 137, '12.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:47:18', '2023-02-03 23:47:18'),
(134, 143, 139, 139, '6.0000', '41.0000', '0.00', '41.0000', '41.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:48:03', '2023-02-03 23:48:03'),
(135, 144, 138, 138, '12.0000', '285.0000', '0.00', '285.0000', '285.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:48:20', '2023-02-03 23:48:20'),
(136, 145, 140, 140, '7.0000', '280.0000', '0.00', '280.0000', '280.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:49:02', '2023-02-03 23:49:02'),
(137, 146, 141, 141, '6.0000', '285.0000', '0.00', '285.0000', '285.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:49:29', '2023-02-03 23:49:29'),
(138, 147, 142, 142, '3.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:50:01', '2023-02-03 23:50:01'),
(139, 148, 143, 143, '6.0000', '285.0000', '0.00', '285.0000', '285.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:50:38', '2023-02-03 23:50:38'),
(140, 149, 144, 144, '2.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:50:56', '2023-02-03 23:50:56'),
(141, 150, 145, 145, '6.0000', '285.0000', '0.00', '285.0000', '285.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:51:46', '2023-02-03 23:51:46'),
(142, 151, 146, 146, '3.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:51:58', '2023-02-03 23:51:58'),
(143, 152, 147, 147, '6.0000', '285.0000', '0.00', '285.0000', '285.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:52:58', '2023-02-03 23:52:58'),
(144, 153, 148, 148, '3.0000', '170.0000', '0.00', '170.0000', '170.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:53:06', '2023-02-03 23:53:06'),
(145, 154, 149, 149, '3.0000', '130.0000', '0.00', '130.0000', '130.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:53:53', '2023-02-03 23:53:53'),
(146, 155, 150, 150, '3.0000', '160.0000', '0.00', '160.0000', '160.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:54:42', '2023-02-03 23:54:42'),
(147, 156, 151, 151, '3.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:55:39', '2023-02-03 23:55:39'),
(148, 157, 152, 152, '3.0000', '230.0000', '0.00', '230.0000', '230.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:57:11', '2023-02-03 23:57:11'),
(149, 158, 153, 153, '6.0000', '285.0000', '0.00', '285.0000', '285.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:57:35', '2023-02-03 23:57:35'),
(150, 159, 154, 154, '6.0000', '120.0000', '0.00', '120.0000', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-03 23:59:23', '2023-02-03 23:59:23'),
(151, 160, 155, 155, '6.0000', '285.0000', '0.00', '285.0000', '285.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:00:07', '2023-02-04 00:00:07'),
(152, 161, 156, 156, '12.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:00:18', '2023-02-04 00:00:18'),
(153, 162, 157, 157, '12.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:01:07', '2023-02-04 00:01:07'),
(154, 163, 158, 158, '4.0000', '570.0000', '0.00', '570.0000', '570.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:01:29', '2023-02-04 00:01:29'),
(155, 164, 159, 159, '6.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:01:58', '2023-02-04 00:01:58'),
(156, 165, 160, 160, '24.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:02:49', '2023-02-04 00:02:49'),
(157, 166, 161, 161, '4.0000', '570.0000', '0.00', '570.0000', '570.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:03:16', '2023-02-04 00:03:16'),
(158, 167, 162, 162, '24.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:03:50', '2023-02-04 00:03:50'),
(159, 168, 163, 163, '4.0000', '570.0000', '0.00', '570.0000', '570.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:04:17', '2023-02-04 00:04:17'),
(160, 169, 164, 164, '2.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:04:38', '2023-02-04 00:04:38'),
(161, 170, 166, 166, '12.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:05:19', '2023-02-04 00:05:19'),
(162, 171, 165, 165, '4.0000', '570.0000', '0.00', '570.0000', '570.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:05:23', '2023-02-04 00:05:23'),
(163, 172, 167, 167, '200.0000', '64.0000', '0.00', '64.0000', '64.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:06:35', '2023-02-04 00:06:35'),
(164, 173, 168, 168, '864.0000', '0.4000', '0.00', '0.4000', '0.4000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:07:34', '2023-02-04 00:07:34'),
(165, 174, 169, 169, '50.0000', '64.0000', '0.00', '64.0000', '64.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:07:46', '2023-02-04 00:07:46'),
(166, 175, 170, 170, '70.0000', '64.0000', '0.00', '64.0000', '64.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:08:51', '2023-02-04 00:08:51'),
(167, 176, 171, 171, '3.0000', '210.0000', '0.00', '210.0000', '210.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:08:54', '2023-02-04 00:08:54'),
(168, 177, 172, 172, '3.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:09:48', '2023-02-04 00:09:48'),
(169, 178, 173, 173, '50.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:09:53', '2023-02-04 00:09:53'),
(170, 179, 174, 174, '12.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:10:39', '2023-02-04 00:10:39'),
(171, 180, 175, 175, '50.0000', '64.0000', '0.00', '64.0000', '64.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:11:16', '2023-02-04 00:11:16'),
(172, 181, 176, 176, '6.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:11:46', '2023-02-04 00:11:46'),
(173, 182, 177, 177, '6.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:12:33', '2023-02-04 00:12:33'),
(174, 183, 178, 178, '30.0000', '64.0000', '0.00', '64.0000', '64.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:12:33', '2023-02-04 00:12:33'),
(175, 184, 179, 179, '24.0000', '4.0000', '0.00', '4.0000', '4.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:14:15', '2023-02-04 00:14:15'),
(176, 185, 180, 180, '6.0000', '35.0000', '0.00', '35.0000', '35.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:15:07', '2023-02-04 00:15:07'),
(177, 186, 181, 181, '12.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:16:01', '2023-02-04 00:16:01'),
(178, 187, 182, 182, '36.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:17:32', '2023-02-04 00:17:32'),
(179, 188, 183, 183, '3.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:18:30', '2023-02-04 00:18:30'),
(180, 189, 184, 184, '12.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:19:24', '2023-02-04 00:19:24'),
(181, 190, 185, 185, '12.0000', '17.0000', '0.00', '17.0000', '17.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:20:10', '2023-02-04 00:20:10'),
(182, 191, 186, 186, '12.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:21:56', '2023-02-04 00:21:56'),
(183, 192, 187, 187, '12.0000', '90.0000', '0.00', '90.0000', '90.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:22:54', '2023-02-04 00:22:54'),
(184, 193, 188, 188, '8.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:23:57', '2023-02-04 00:23:57'),
(185, 194, 189, 189, '12.0000', '8.0000', '0.00', '8.0000', '8.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:24:46', '2023-02-04 00:24:46'),
(186, 195, 190, 190, '10.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:25:30', '2023-02-04 00:25:30'),
(187, 196, 191, 191, '24.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:26:11', '2023-02-04 00:26:11'),
(188, 197, 192, 192, '10.0000', '64.0000', '0.00', '64.0000', '64.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:27:08', '2023-02-04 00:27:08'),
(189, 198, 193, 193, '12.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:28:58', '2023-02-04 00:28:58'),
(190, 199, 194, 194, '24.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:29:43', '2023-02-04 00:29:43'),
(191, 200, 195, 195, '12.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:30:34', '2023-02-04 00:30:34'),
(192, 201, 196, 196, '24.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:31:23', '2023-02-04 00:31:23'),
(193, 202, 197, 197, '24.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:32:06', '2023-02-04 00:32:06'),
(194, 203, 198, 198, '36.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:32:58', '2023-02-04 00:32:58'),
(195, 204, 199, 199, '30.0000', '64.0000', '0.00', '64.0000', '64.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:33:08', '2023-02-04 00:33:08'),
(196, 205, 200, 200, '36.0000', '23.0000', '0.00', '23.0000', '23.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:33:44', '2023-02-04 00:33:44'),
(197, 206, 201, 201, '30.0000', '64.0000', '0.00', '64.0000', '64.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:34:10', '2023-02-04 00:34:10'),
(198, 207, 202, 202, '24.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:34:32', '2023-02-04 00:34:32'),
(199, 208, 203, 203, '30.0000', '64.0000', '0.00', '64.0000', '64.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:35:11', '2023-02-04 00:35:11'),
(200, 209, 205, 205, '10.0000', '64.0000', '0.00', '64.0000', '64.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:36:08', '2023-02-04 00:36:08'),
(201, 210, 204, 204, '48.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:36:39', '2023-02-04 00:36:39'),
(202, 211, 206, 206, '30.0000', '64.0000', '0.00', '64.0000', '64.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:37:10', '2023-02-04 00:38:44'),
(203, 212, 207, 207, '6.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:38:11', '2023-02-04 00:38:11'),
(204, 213, 208, 208, '6.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:38:56', '2023-02-04 00:38:56'),
(205, 214, 209, 209, '12.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:39:41', '2023-02-04 00:39:41'),
(206, 215, 210, 210, '36.0000', '17.0000', '0.00', '17.0000', '17.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:40:22', '2023-02-04 00:40:22'),
(207, 216, 211, 211, '200.0000', '64.0000', '0.00', '64.0000', '64.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:40:27', '2023-02-04 00:40:27'),
(208, 217, 212, 212, '12.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:41:06', '2023-02-04 00:41:06'),
(209, 218, 213, 213, '50.0000', '64.0000', '0.00', '64.0000', '64.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:41:27', '2023-02-04 00:41:27'),
(210, 219, 214, 214, '6.0000', '140.0000', '0.00', '140.0000', '140.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:41:47', '2023-02-04 00:41:47'),
(211, 220, 215, 215, '6.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:42:36', '2023-02-04 00:42:36'),
(212, 221, 216, 216, '50.0000', '64.0000', '0.00', '64.0000', '64.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:42:54', '2023-02-04 00:42:54'),
(213, 222, 217, 217, '40.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:43:19', '2023-02-04 00:43:19'),
(214, 223, 218, 218, '50.0000', '64.0000', '0.00', '64.0000', '64.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:43:45', '2023-02-04 00:43:45'),
(215, 224, 219, 219, '1.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:44:13', '2023-02-04 00:45:03'),
(216, 225, 220, 220, '50.0000', '64.0000', '0.00', '64.0000', '64.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:44:40', '2023-02-04 00:44:40'),
(217, 226, 222, 222, '12.0000', '17.0000', '0.00', '17.0000', '17.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:45:44', '2023-02-04 00:45:44'),
(218, 227, 221, 221, '30.0000', '90.0000', '0.00', '90.0000', '90.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:45:46', '2023-02-04 00:45:46'),
(219, 228, 223, 223, '60.0000', '18.0000', '0.00', '18.0000', '18.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:46:37', '2023-02-04 00:46:37'),
(220, 229, 225, 225, '20.0000', '90.0000', '0.00', '90.0000', '90.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:47:05', '2023-02-04 00:47:05'),
(221, 230, 226, 226, '12.0000', '65.0000', '0.00', '65.0000', '65.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:47:23', '2023-02-04 00:47:23'),
(222, 231, 227, 227, '10.0000', '90.0000', '0.00', '90.0000', '90.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:47:58', '2023-02-04 00:47:58'),
(223, 232, 228, 228, '12.0000', '35.0000', '0.00', '35.0000', '35.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:48:13', '2023-02-04 00:48:13'),
(224, 233, 230, 230, '24.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:48:56', '2023-02-04 00:48:56'),
(225, 234, 229, 229, '6.0000', '410.0000', '0.00', '410.0000', '410.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:48:58', '2023-02-04 00:48:58'),
(226, 235, 231, 231, '36.0000', '23.0000', '0.00', '23.0000', '23.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:49:42', '2023-02-04 00:49:42'),
(227, 236, 232, 232, '6.0000', '410.0000', '0.00', '410.0000', '410.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:49:58', '2023-02-04 00:49:58'),
(228, 237, 233, 233, '12.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:50:28', '2023-02-04 00:50:28'),
(229, 238, 234, 234, '6.0000', '410.0000', '0.00', '410.0000', '410.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:51:53', '2023-02-04 00:51:53'),
(230, 239, 235, 235, '144.0000', '2.0000', '0.00', '2.0000', '2.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:52:45', '2023-02-04 00:52:45'),
(231, 240, 236, 236, '3.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:53:28', '2023-02-04 00:53:28'),
(232, 241, 237, 237, '6.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:54:19', '2023-02-04 00:54:19'),
(233, 242, 238, 238, '50.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:54:51', '2023-02-04 00:54:51'),
(234, 243, 239, 239, '10.0000', '53.0000', '0.00', '53.0000', '53.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:55:10', '2023-02-04 00:55:10'),
(235, 244, 241, 241, '30.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:55:58', '2023-02-04 00:55:58'),
(236, 245, 240, 240, '6.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:56:00', '2023-02-04 00:56:00'),
(237, 246, 242, 242, '6.0000', '700.0000', '0.00', '700.0000', '700.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:56:53', '2023-02-04 00:56:53'),
(238, 247, 243, 243, '30.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:56:59', '2023-02-04 00:56:59'),
(239, 248, 244, 244, '6.0000', '120.0000', '0.00', '120.0000', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:57:37', '2023-02-04 00:57:37'),
(240, 249, 245, 245, '6.0000', '344.0000', '0.00', '344.0000', '344.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:58:05', '2023-02-04 00:58:05'),
(241, 250, 246, 246, '6.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:58:28', '2023-02-04 00:58:28'),
(242, 251, 248, 248, '4.0000', '175.0000', '0.00', '175.0000', '175.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:59:13', '2023-02-04 00:59:13'),
(243, 252, 249, 249, '15.0000', '230.0000', '0.00', '230.0000', '230.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 00:59:33', '2023-02-04 00:59:33'),
(244, 253, 250, 250, '4.0000', '175.0000', '0.00', '175.0000', '175.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:00:09', '2023-02-04 01:00:09'),
(245, 254, 251, 251, '6.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:00:14', '2023-02-04 01:00:14'),
(246, 255, 252, 252, '12.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:00:52', '2023-02-04 01:00:52'),
(247, 256, 253, 253, '4.0000', '175.0000', '0.00', '175.0000', '175.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:01:06', '2023-02-04 01:01:06'),
(248, 257, 254, 254, '4.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:01:37', '2023-02-04 01:01:37'),
(249, 258, 255, 255, '2.0000', '175.0000', '0.00', '175.0000', '175.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:02:09', '2023-02-04 01:02:09'),
(250, 259, 256, 256, '6.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:02:38', '2023-02-04 01:02:38'),
(251, 260, 257, 257, '20.0000', '51.0000', '0.00', '51.0000', '51.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:03:02', '2023-02-04 01:03:02'),
(252, 261, 258, 258, '25.0000', '24.0000', '0.00', '24.0000', '24.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:03:26', '2023-02-04 01:03:26');
INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(253, 262, 259, 259, '20.0000', '51.0000', '0.00', '51.0000', '51.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:04:05', '2023-02-04 01:04:05'),
(254, 263, 260, 260, '30.0000', '18.0000', '0.00', '18.0000', '18.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:04:13', '2023-02-04 01:04:13'),
(255, 264, 261, 261, '3.0000', '51.0000', '0.00', '51.0000', '51.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:05:02', '2023-02-04 01:05:02'),
(256, 265, 262, 262, '12.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:05:16', '2023-02-04 01:05:16'),
(257, 266, 263, 263, '5.0000', '326.0000', '0.00', '326.0000', '326.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:06:02', '2023-02-04 01:06:02'),
(258, 267, 264, 264, '12.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:06:38', '2023-02-04 01:06:38'),
(259, 268, 265, 265, '5.0000', '325.0000', '0.00', '325.0000', '325.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:06:53', '2023-02-04 01:06:53'),
(260, 269, 266, 266, '12.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:07:28', '2023-02-04 01:07:28'),
(261, 270, 267, 267, '6.0000', '476.0000', '0.00', '476.0000', '476.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:08:15', '2023-02-04 01:08:15'),
(262, 271, 268, 268, '12.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:09:11', '2023-02-04 01:09:11'),
(263, 272, 269, 269, '3.0000', '476.0000', '0.00', '476.0000', '476.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:09:20', '2023-02-04 01:09:20'),
(264, 273, 270, 270, '3.0000', '476.0000', '0.00', '476.0000', '476.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:10:28', '2023-02-04 01:10:28'),
(265, 274, 271, 271, '18.0000', '8.0000', '0.00', '8.0000', '8.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:11:26', '2023-02-04 01:11:26'),
(266, 275, 272, 272, '6.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:12:55', '2023-02-04 01:12:55'),
(267, 276, 273, 273, '12.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:13:39', '2023-02-04 01:13:39'),
(268, 277, 274, 274, '6.0000', '190.0000', '0.00', '190.0000', '190.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:13:57', '2023-02-04 01:13:57'),
(269, 278, 275, 275, '11.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:14:32', '2023-02-04 01:14:32'),
(270, 279, 276, 276, '6.0000', '190.0000', '0.00', '190.0000', '190.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:14:47', '2023-02-04 01:14:47'),
(271, 280, 277, 277, '6.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:15:15', '2023-02-04 01:15:15'),
(272, 281, 278, 278, '6.0000', '190.0000', '0.00', '190.0000', '190.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:15:36', '2023-02-04 01:15:36'),
(273, 282, 279, 279, '3.0000', '110.0000', '0.00', '110.0000', '110.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:16:23', '2023-02-04 01:16:23'),
(274, 283, 280, 280, '6.0000', '190.0000', '0.00', '190.0000', '190.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:16:34', '2023-02-04 01:16:34'),
(275, 284, 281, 281, '3.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:17:24', '2023-02-04 01:17:24'),
(276, 285, 282, 282, '6.0000', '422.0000', '0.00', '422.0000', '422.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:18:16', '2023-02-04 01:18:16'),
(277, 286, 283, 283, '6.0000', '80.0000', '0.00', '80.0000', '80.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:18:21', '2023-02-04 01:18:21'),
(278, 287, 284, 284, '6.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:19:14', '2023-02-04 01:19:14'),
(279, 288, 285, 285, '6.0000', '422.0000', '0.00', '422.0000', '422.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:19:32', '2023-02-04 01:19:32'),
(280, 289, 286, 286, '10.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:20:03', '2023-02-04 01:20:03'),
(281, 290, 287, 287, '10.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:20:51', '2023-02-04 01:20:51'),
(282, 291, 288, 288, '4.0000', '663.0000', '0.00', '663.0000', '663.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:21:19', '2023-02-04 01:21:19'),
(283, 292, 289, 289, '10.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:21:55', '2023-02-04 01:21:55'),
(284, 293, 290, 290, '4.0000', '663.0000', '0.00', '663.0000', '663.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:22:42', '2023-02-04 01:22:42'),
(285, 294, 291, 291, '10.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:22:47', '2023-02-04 01:22:47'),
(286, 295, 292, 292, '3.0000', '260.0000', '0.00', '260.0000', '260.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:23:43', '2023-02-04 01:23:43'),
(287, 296, 293, 293, '3.0000', '663.0000', '0.00', '663.0000', '663.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:23:44', '2023-02-04 01:23:44'),
(288, 297, 294, 294, '6.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:24:29', '2023-02-04 01:24:29'),
(289, 298, 295, 295, '4.0000', '663.0000', '0.00', '663.0000', '663.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:24:56', '2023-02-04 01:24:56'),
(290, 299, 296, 296, '3.0000', '135.0000', '0.00', '135.0000', '135.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:25:23', '2023-02-04 01:25:23'),
(291, 300, 297, 297, '3.0000', '135.0000', '0.00', '135.0000', '135.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:26:08', '2023-02-04 01:26:08'),
(292, 301, 298, 298, '16.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:26:42', '2023-02-04 01:26:42'),
(293, 302, 299, 299, '24.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:26:56', '2023-02-04 01:26:56'),
(294, 303, 300, 300, '16.0000', '88.0000', '0.00', '88.0000', '88.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:27:45', '2023-02-04 01:27:45'),
(295, 304, 301, 301, '85.0000', '105.0000', '0.00', '105.0000', '105.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:28:14', '2023-02-04 01:28:14'),
(296, 305, 302, 302, '16.0000', '90.0000', '0.00', '90.0000', '90.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:28:49', '2023-02-04 01:28:49'),
(297, 306, 303, 303, '3.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:29:06', '2023-02-04 01:29:06'),
(298, 307, 304, 304, '48.0000', '42.0000', '0.00', '42.0000', '42.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:29:50', '2023-02-04 01:29:50'),
(299, 308, 305, 305, '3.0000', '75.0000', '0.00', '75.0000', '75.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:30:12', '2023-02-04 01:30:12'),
(300, 309, 307, 307, '6.0000', '81.0000', '0.00', '81.0000', '81.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:30:56', '2023-02-04 01:30:56'),
(301, 310, 306, 306, '24.0000', '55.0000', '0.00', '55.0000', '55.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:31:04', '2023-02-04 01:31:04'),
(302, 311, 308, 308, '72.0000', '26.0000', '0.00', '26.0000', '26.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:32:21', '2023-02-04 01:32:21'),
(303, 312, 309, 309, '6.0000', '130.0000', '0.00', '130.0000', '130.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:32:41', '2023-02-04 01:32:41'),
(304, 313, 310, 310, '72.0000', '43.0000', '0.00', '43.0000', '43.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:33:18', '2023-02-04 01:33:18'),
(305, 314, 311, 311, '6.0000', '301.0000', '0.00', '301.0000', '301.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:33:37', '2023-02-04 01:33:37'),
(306, 315, 312, 312, '6.0000', '81.0000', '0.00', '81.0000', '81.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:34:34', '2023-02-04 01:34:34'),
(307, 316, 313, 313, '36.0000', '87.0000', '0.00', '87.0000', '87.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:34:56', '2023-02-04 01:34:56'),
(308, 317, 314, 314, '6.0000', '130.0000', '0.00', '130.0000', '130.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:35:24', '2023-02-04 01:35:24'),
(309, 318, 315, 315, '6.0000', '301.0000', '0.00', '301.0000', '301.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:36:46', '2023-02-04 01:36:46'),
(310, 319, 316, 316, '3.0000', '153.0000', '0.00', '153.0000', '153.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:37:17', '2023-02-04 01:37:17'),
(311, 320, 317, 317, '6.0000', '81.0000', '0.00', '81.0000', '81.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:37:32', '2023-02-04 01:37:32'),
(312, 321, 318, 318, '6.0000', '130.0000', '0.00', '130.0000', '130.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:38:22', '2023-02-04 01:38:22'),
(313, 322, 319, 319, '12.0000', '153.0000', '0.00', '153.0000', '153.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:38:34', '2023-02-04 01:38:34'),
(314, 323, 320, 320, '6.0000', '301.0000', '0.00', '301.0000', '301.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:39:16', '2023-02-04 01:39:16'),
(315, 324, 321, 321, '6.0000', '81.0000', '0.00', '81.0000', '81.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:40:14', '2023-02-04 01:40:14'),
(316, 325, 322, 322, '6.0000', '146.0000', '0.00', '146.0000', '146.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:41:22', '2023-02-04 01:41:22'),
(317, 326, 323, 323, '12.0000', '81.0000', '0.00', '81.0000', '81.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:42:14', '2023-02-04 01:42:14'),
(318, 327, 324, 324, '12.0000', '146.0000', '0.00', '146.0000', '146.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:43:06', '2023-02-04 01:43:06'),
(319, 328, 325, 325, '6.0000', '81.0000', '0.00', '81.0000', '81.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:45:57', '2023-02-04 01:45:57'),
(320, 329, 326, 326, '6.0000', '146.0000', '0.00', '146.0000', '146.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:46:42', '2023-02-04 01:46:42'),
(321, 330, 327, 327, '6.0000', '224.0000', '0.00', '224.0000', '224.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:47:30', '2023-02-04 01:47:30'),
(322, 331, 328, 328, '6.0000', '224.0000', '0.00', '224.0000', '224.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:48:28', '2023-02-04 01:48:28'),
(323, 332, 329, 329, '6.0000', '224.0000', '0.00', '224.0000', '224.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:49:11', '2023-02-04 01:49:11'),
(324, 333, 330, 330, '6.0000', '122.0000', '0.00', '122.0000', '122.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:50:26', '2023-02-04 01:50:26'),
(325, 334, 331, 331, '6.0000', '203.0000', '0.00', '203.0000', '203.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:51:13', '2023-02-04 01:51:13'),
(326, 335, 332, 332, '6.0000', '322.0000', '0.00', '322.0000', '322.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:51:58', '2023-02-04 01:51:58'),
(327, 336, 333, 333, '6.0000', '122.0000', '0.00', '122.0000', '122.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:52:41', '2023-02-04 01:52:41'),
(328, 337, 334, 334, '6.0000', '203.0000', '0.00', '203.0000', '203.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:53:28', '2023-02-04 01:53:28'),
(329, 338, 335, 335, '6.0000', '322.0000', '0.00', '322.0000', '322.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:54:28', '2023-02-04 01:54:28'),
(330, 339, 336, 336, '6.0000', '122.0000', '0.00', '122.0000', '122.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:55:51', '2023-02-04 01:55:51'),
(331, 340, 337, 337, '12.0000', '153.0000', '0.00', '153.0000', '153.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:56:09', '2023-02-04 01:56:09'),
(332, 341, 338, 338, '6.0000', '203.0000', '0.00', '203.0000', '203.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:56:37', '2023-02-04 01:56:37'),
(333, 342, 339, 339, '12.0000', '153.0000', '0.00', '153.0000', '153.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:57:21', '2023-02-04 01:57:21'),
(334, 343, 340, 340, '6.0000', '322.0000', '0.00', '322.0000', '322.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:57:35', '2023-02-04 01:57:35'),
(335, 344, 341, 341, '12.0000', '262.0000', '0.00', '262.0000', '262.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:58:49', '2023-02-04 01:58:49'),
(336, 345, 342, 342, '12.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:58:55', '2023-02-04 01:58:55'),
(337, 346, 343, 343, '6.0000', '77.0000', '0.00', '77.0000', '77.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 01:59:43', '2023-02-04 01:59:43'),
(338, 347, 344, 344, '3.0000', '262.0000', '0.00', '262.0000', '262.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:02:40', '2023-02-04 02:02:40'),
(339, 348, 345, 345, '12.0000', '262.0000', '0.00', '262.0000', '262.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:04:04', '2023-02-04 02:04:04'),
(340, 349, 346, 346, '3.0000', '153.0000', '0.00', '153.0000', '153.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:07:53', '2023-02-04 02:07:53'),
(341, 350, 347, 347, '12.0000', '153.0000', '0.00', '153.0000', '153.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:10:46', '2023-02-04 02:10:46'),
(342, 351, 348, 348, '3.0000', '262.0000', '0.00', '262.0000', '262.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:20:14', '2023-02-04 02:20:14'),
(343, 352, 349, 349, '12.0000', '262.0000', '0.00', '262.0000', '262.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:22:15', '2023-02-04 02:22:15'),
(344, 353, 350, 350, '7.0000', '56.0000', '0.00', '56.0000', '56.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:24:31', '2023-02-04 02:24:31'),
(345, 354, 351, 351, '140.0000', '136.0000', '0.00', '136.0000', '136.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:26:01', '2023-02-04 02:26:01'),
(346, 355, 352, 352, '3.0000', '136.0000', '0.00', '136.0000', '136.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:33:00', '2023-02-04 02:33:00'),
(347, 356, 353, 353, '7.0000', '82.0000', '0.00', '82.0000', '82.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:33:52', '2023-02-04 02:33:52'),
(348, 357, 354, 354, '13.0000', '22.0000', '0.00', '22.0000', '22.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:34:58', '2023-02-04 02:34:58'),
(349, 358, 355, 355, '12.0000', '68.0000', '0.00', '68.0000', '68.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:36:11', '2023-02-04 02:36:11'),
(350, 359, 356, 356, '12.0000', '109.0000', '0.00', '109.0000', '109.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:37:04', '2023-02-04 02:37:04'),
(351, 360, 357, 357, '6.0000', '234.0000', '0.00', '234.0000', '234.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:37:54', '2023-02-04 02:37:54'),
(352, 361, 358, 358, '12.0000', '68.0000', '0.00', '68.0000', '68.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:39:55', '2023-02-04 02:39:55'),
(353, 362, 359, 359, '12.0000', '113.0000', '0.00', '113.0000', '113.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:40:53', '2023-02-04 02:40:53'),
(354, 363, 360, 360, '6.0000', '242.0000', '0.00', '242.0000', '242.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:42:18', '2023-02-04 02:42:18'),
(355, 364, 361, 361, '16.0000', '54.0000', '0.00', '54.0000', '54.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:43:21', '2023-02-04 02:43:21'),
(356, 365, 362, 362, '16.0000', '84.0000', '0.00', '84.0000', '84.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:44:28', '2023-02-04 02:44:28'),
(357, 366, 363, 363, '3.0000', '242.0000', '0.00', '242.0000', '242.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:45:36', '2023-02-04 02:45:36'),
(358, 367, 364, 364, '12.0000', '72.0000', '0.00', '72.0000', '72.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:46:26', '2023-02-04 02:46:26'),
(359, 368, 365, 365, '12.0000', '113.0000', '0.00', '113.0000', '113.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 02:49:44', '2023-02-04 02:49:44'),
(360, 369, 366, 366, '3.0000', '242.0000', '0.00', '242.0000', '242.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:03:27', '2023-02-04 03:03:27'),
(361, 370, 367, 367, '3.0000', '242.0000', '0.00', '242.0000', '242.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:06:20', '2023-02-04 03:06:20'),
(362, 371, 368, 368, '3.0000', '113.0000', '0.00', '113.0000', '113.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:07:24', '2023-02-04 03:07:24'),
(363, 372, 369, 369, '3.0000', '113.0000', '0.00', '113.0000', '113.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:08:32', '2023-02-04 03:08:32'),
(364, 373, 370, 370, '3.0000', '219.0000', '0.00', '219.0000', '219.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:10:14', '2023-02-04 03:10:14'),
(365, 374, 371, 371, '6.0000', '73.0000', '0.00', '73.0000', '73.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:11:27', '2023-02-04 03:11:27'),
(366, 375, 372, 372, '12.0000', '114.0000', '0.00', '114.0000', '114.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:12:28', '2023-02-04 03:12:28'),
(367, 376, 373, 373, '12.0000', '203.0000', '0.00', '203.0000', '203.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:13:53', '2023-02-04 03:13:53'),
(368, 377, 374, 374, '6.0000', '297.0000', '0.00', '297.0000', '297.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:15:32', '2023-02-04 03:15:32'),
(369, 378, 375, 375, '6.0000', '73.0000', '0.00', '73.0000', '73.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:16:34', '2023-02-04 03:16:34'),
(370, 379, 376, 376, '6.0000', '114.0000', '0.00', '114.0000', '114.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:17:41', '2023-02-04 03:17:41'),
(371, 380, 377, 377, '6.0000', '204.0000', '0.00', '204.0000', '204.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:18:51', '2023-02-04 03:18:51'),
(372, 381, 378, 378, '6.0000', '297.0000', '0.00', '297.0000', '297.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:20:03', '2023-02-04 03:20:03'),
(373, 382, 379, 379, '6.0000', '73.0000', '0.00', '73.0000', '73.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:21:24', '2023-02-04 03:21:24'),
(374, 383, 380, 380, '6.0000', '114.0000', '0.00', '114.0000', '114.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:22:25', '2023-02-04 03:22:25'),
(375, 384, 381, 381, '6.0000', '203.0000', '0.00', '203.0000', '203.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:23:20', '2023-02-04 03:23:20'),
(376, 385, 382, 382, '6.0000', '297.0000', '0.00', '297.0000', '297.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:24:12', '2023-02-04 03:24:12'),
(378, 387, 384, 384, '6.0000', '114.0000', '0.00', '114.0000', '114.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:28:36', '2023-02-04 03:28:36'),
(379, 388, 385, 385, '6.0000', '203.0000', '0.00', '203.0000', '203.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:29:40', '2023-02-04 03:29:40'),
(381, 389, 386, 386, '6.0000', '203.0000', '0.00', '203.0000', '203.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:32:13', '2023-02-04 03:32:13'),
(383, 390, 387, 387, '12.0000', '53.0000', '0.00', '53.0000', '53.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:33:27', '2023-02-04 03:33:27'),
(384, 391, 388, 388, '12.0000', '69.0000', '0.00', '69.0000', '69.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:34:34', '2023-02-04 03:34:34'),
(385, 392, 389, 389, '6.0000', '118.0000', '0.00', '118.0000', '118.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:35:52', '2023-02-04 03:35:52'),
(386, 393, 390, 390, '6.0000', '65.0000', '0.00', '65.0000', '65.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:36:43', '2023-02-04 03:36:43'),
(387, 394, 391, 391, '6.0000', '93.0000', '0.00', '93.0000', '93.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:39:29', '2023-02-04 03:39:29'),
(388, 395, 392, 392, '6.0000', '146.0000', '0.00', '146.0000', '146.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:41:27', '2023-02-04 03:41:27'),
(389, 396, 393, 393, '6.0000', '65.0000', '0.00', '65.0000', '65.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:43:00', '2023-02-04 03:43:00'),
(390, 397, 394, 394, '6.0000', '93.0000', '0.00', '93.0000', '93.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:44:23', '2023-02-04 03:44:23'),
(391, 398, 395, 395, '6.0000', '146.0000', '0.00', '146.0000', '146.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:46:36', '2023-02-04 03:46:36'),
(392, 399, 396, 396, '6.0000', '65.0000', '0.00', '65.0000', '65.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:48:04', '2023-02-04 03:48:04'),
(393, 400, 397, 397, '6.0000', '93.0000', '0.00', '93.0000', '93.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-02-04 03:49:33', '2023-02-04 03:49:33');

-- --------------------------------------------------------

--
-- Table structure for table `reference_counts`
--

CREATE TABLE `reference_counts` (
  `id` int UNSIGNED NOT NULL,
  `ref_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_count` int NOT NULL,
  `business_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'contacts', 1, 7, '2023-01-16 22:44:22', '2023-01-16 22:44:22'),
(2, 'business_location', 1, 7, '2023-01-16 22:44:22', '2023-01-16 22:44:22'),
(3, 'contacts', 1, 8, '2023-01-16 22:46:09', '2023-01-16 22:46:09'),
(4, 'business_location', 1, 8, '2023-01-16 22:46:09', '2023-01-16 22:46:09'),
(5, 'contacts', 1, 9, '2023-01-16 23:33:06', '2023-01-16 23:33:06'),
(6, 'business_location', 1, 9, '2023-01-16 23:33:06', '2023-01-16 23:33:06'),
(7, 'sell_payment', 1, 9, '2023-01-16 21:24:40', '2023-01-16 21:24:40'),
(8, 'sell_payment', 1, 8, '2023-02-02 18:56:12', '2023-02-02 18:56:12'),
(9, 'contacts', 2, 10, '2023-02-03 15:41:21', '2023-02-03 17:47:58'),
(10, 'business_location', 1, 10, '2023-02-03 15:41:21', '2023-02-03 15:41:21'),
(11, 'sell_return', 1, 10, '2023-02-03 16:38:31', '2023-02-03 16:38:31'),
(12, 'sell_payment', 1, 10, '2023-02-03 16:51:38', '2023-02-03 16:51:38');

-- --------------------------------------------------------

--
-- Table structure for table `res_product_modifier_sets`
--

CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `res_tables`
--

CREATE TABLE `res_tables` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_service_staff` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `created_at`, `updated_at`) VALUES
(13, 'Admin#7', 'web', 7, 1, 0, '2023-01-16 22:44:22', '2023-01-16 22:44:22'),
(14, 'Cashier#7', 'web', 7, 0, 0, '2023-01-16 22:44:22', '2023-01-16 22:44:22'),
(15, 'Admin#8', 'web', 8, 1, 0, '2023-01-16 22:46:09', '2023-01-16 22:46:09'),
(16, 'Cashier#8', 'web', 8, 0, 0, '2023-01-16 22:46:09', '2023-01-16 22:46:09'),
(17, 'Admin#9', 'web', 9, 1, 0, '2023-01-16 23:33:05', '2023-01-16 23:33:05'),
(18, 'Cashier#9', 'web', 9, 0, 0, '2023-01-16 23:33:06', '2023-01-16 23:33:06'),
(19, 'Admin#10', 'web', 10, 1, 0, '2023-02-03 15:41:21', '2023-02-03 15:41:21'),
(20, 'Cashier#10', 'web', 10, 0, 0, '2023-02-03 15:41:21', '2023-02-03 15:41:21');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(45, 14),
(46, 14),
(47, 14),
(48, 14),
(77, 14),
(45, 16),
(46, 16),
(47, 16),
(48, 16),
(77, 16),
(45, 18),
(46, 18),
(47, 18),
(48, 18),
(77, 18),
(45, 20),
(46, 20),
(47, 20),
(48, 20),
(77, 20);

-- --------------------------------------------------------

--
-- Table structure for table `selling_price_groups`
--

CREATE TABLE `selling_price_groups` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `business_id` int UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `selling_price_groups`
--

INSERT INTO `selling_price_groups` (`id`, `name`, `description`, `business_id`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'wholesale', NULL, 8, 1, NULL, '2023-02-02 18:54:53', '2023-02-02 18:54:53'),
(2, 'Wholesale', NULL, 10, 1, NULL, '2023-02-03 13:41:12', '2023-02-03 13:41:12');

-- --------------------------------------------------------

--
-- Table structure for table `sell_line_warranties`
--

CREATE TABLE `sell_line_warranties` (
  `sell_line_id` int NOT NULL,
  `warranty_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments_temp`
--

CREATE TABLE `stock_adjustments_temp` (
  `id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_lines`
--

CREATE TABLE `stock_adjustment_lines` (
  `id` int UNSIGNED NOT NULL,
  `transaction_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `variation_id` int UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int DEFAULT NULL,
  `lot_no_line_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`id`, `key`, `value`) VALUES
(1, 'db_version', '3.4'),
(2, 'default_business_active_status', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED DEFAULT NULL,
  `res_table_id` int UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('received','pending','ordered','draft','final') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT '0',
  `payment_status` enum('paid','due','partial') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int UNSIGNED DEFAULT NULL,
  `customer_group_id` int DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_repeat_on` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) DEFAULT '0.0000',
  `rp_redeemed` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_charges` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `additional_notes` text COLLATE utf8mb4_unicode_ci,
  `staff_note` text COLLATE utf8mb4_unicode_ci,
  `round_off_amount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Difference of rounded total and actual total',
  `final_total` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `expense_category_id` int UNSIGNED DEFAULT NULL,
  `expense_for` int UNSIGNED DEFAULT NULL,
  `commission_agent` int DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspend` tinyint(1) NOT NULL DEFAULT '0',
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `total_amount_recovered` decimal(22,4) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int DEFAULT NULL,
  `return_parent_id` int DEFAULT NULL,
  `opening_stock_product_id` int DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `import_batch` int DEFAULT NULL,
  `import_time` datetime DEFAULT NULL,
  `types_of_service_id` int DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_1` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_2` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_3` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_4` text COLLATE utf8mb4_unicode_ci,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT '0',
  `rp_earned` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `order_addresses` text COLLATE utf8mb4_unicode_ci,
  `is_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recur_repetitions` int DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int DEFAULT NULL,
  `invoice_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price_group_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `round_off_amount`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(1, 9, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 21:24:24', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-16 21:24:24', '2023-01-16 21:24:24'),
(2, 9, 3, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 3, NULL, '0001', '', NULL, NULL, '2023-01-16 21:24:40', '250.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-01-16 21:24:40', '2023-01-16 21:24:40'),
(3, 8, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 18:55:41', '3600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 2, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-02 18:55:41', '2023-02-02 18:55:41'),
(4, 8, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0001', '', NULL, NULL, '2023-02-02 18:56:12', '230.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '230.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 1, '2023-02-02 18:56:12', '2023-02-02 18:56:12'),
(5, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:42:07', '2472.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2472.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 3, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 13:42:07', '2023-02-03 13:42:07'),
(6, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:05:12', '1648.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1648.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 4, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:05:12', '2023-02-03 14:05:12'),
(7, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:07:47', '1236.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1236.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 5, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:07:47', '2023-02-03 14:07:47'),
(8, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:11:59', '2430.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2430.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 6, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:11:59', '2023-02-03 14:11:59'),
(9, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:14:09', '2430.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2430.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 7, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:14:09', '2023-02-03 14:14:09'),
(10, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:19:39', '1458.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1458.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 8, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:19:39', '2023-02-03 14:19:39'),
(11, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:25:05', '3415.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3415.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 9, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:25:05', '2023-02-03 14:25:05'),
(12, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:27:27', '3415.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3415.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:27:27', '2023-02-03 14:27:27'),
(13, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:29:36', '2035.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2035.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 11, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:29:36', '2023-02-03 14:29:36'),
(14, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:31:28', '1492.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1492.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:31:28', '2023-02-03 14:31:28'),
(15, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:32:41', '1710.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1710.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 13, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:32:41', '2023-02-03 14:32:41'),
(16, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:33:59', '1140.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1140.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 14, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:33:59', '2023-02-03 14:33:59'),
(17, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:35:16', '1710.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1710.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 15, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:35:16', '2023-02-03 14:35:16'),
(18, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:36:34', '1890.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1890.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 16, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:36:34', '2023-02-03 14:36:34'),
(19, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:37:44', '1890.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1890.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 17, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:37:44', '2023-02-03 14:37:44'),
(20, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:38:40', '1890.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1890.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 18, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:38:40', '2023-02-03 14:38:40'),
(21, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:40:43', '1890.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1890.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 19, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:40:43', '2023-02-03 14:40:43'),
(22, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:41:46', '1017.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1017.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 20, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:41:46', '2023-02-03 14:41:46'),
(23, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:42:51', '1017.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1017.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 21, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:42:51', '2023-02-03 14:42:51'),
(24, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:44:19', '1017.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1017.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 22, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:44:19', '2023-02-03 14:44:19'),
(25, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:45:15', '1017.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1017.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 23, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:45:15', '2023-02-03 14:45:15'),
(26, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:46:09', '2430.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2430.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 24, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:46:09', '2023-02-03 14:46:09'),
(27, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:47:04', '2430.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2430.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 25, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:47:04', '2023-02-03 14:47:04'),
(28, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:47:54', '1458.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1458.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 26, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:47:54', '2023-02-03 14:47:54'),
(29, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:49:29', '1458.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1458.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 27, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:49:29', '2023-02-03 14:49:29'),
(30, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:50:28', '2725.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2725.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 28, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:50:28', '2023-02-03 14:50:28'),
(31, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:51:19', '1635.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1635.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 29, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:51:19', '2023-02-03 14:51:19'),
(32, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:52:20', '1635.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1635.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 30, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:52:20', '2023-02-03 14:52:20'),
(33, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:53:11', '1635.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1635.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 31, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:53:11', '2023-02-03 14:53:11'),
(34, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:54:18', '1635.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1635.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 32, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:54:18', '2023-02-03 14:54:18'),
(35, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:56:07', '3240.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3240.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 33, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:56:07', '2023-02-03 14:56:07'),
(36, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:59:18', '1620.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1620.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 34, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 14:59:18', '2023-02-03 14:59:18'),
(37, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:00:52', '2600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 35, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:00:52', '2023-02-03 15:00:52'),
(38, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:01:46', '1560.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1560.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 36, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:01:46', '2023-02-03 15:01:46'),
(39, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:02:40', '1560.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1560.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 37, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:02:40', '2023-02-03 15:02:40'),
(40, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:03:23', '1725.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1725.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 38, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:03:23', '2023-02-03 15:03:23'),
(41, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:04:07', '1725.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1725.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 39, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:04:07', '2023-02-03 15:04:07'),
(42, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:04:48', '1725.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1725.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 40, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:04:48', '2023-02-03 15:04:48'),
(43, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:05:45', '1575.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1575.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 41, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:05:45', '2023-02-03 15:05:45'),
(44, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:07:24', '1050.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1050.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 42, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:07:24', '2023-02-03 15:07:24'),
(45, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:08:24', '2750.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2750.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 43, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:08:24', '2023-02-03 15:08:24'),
(46, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:10:26', '550.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '550.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 45, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:10:26', '2023-02-03 15:10:26'),
(47, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:11:29', '810.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '810.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 46, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:11:29', '2023-02-03 15:11:29'),
(48, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:12:32', '1080.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1080.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 47, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:12:32', '2023-02-03 15:12:32'),
(49, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:13:32', '1080.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1080.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 48, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:13:32', '2023-02-03 15:13:32'),
(50, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:14:21', '2148.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2148.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 49, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:14:21', '2023-02-03 15:14:21'),
(51, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:15:10', '1432.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1432.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 50, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:15:10', '2023-02-03 15:15:10'),
(52, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:16:00', '1432.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1432.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 51, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:16:00', '2023-02-03 15:16:00'),
(53, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:17:16', '2430.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2430.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 52, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:17:16', '2023-02-03 15:17:16'),
(54, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:28:39', '2430.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2430.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 53, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:28:39', '2023-02-03 15:28:39'),
(55, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:30:40', '1356.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1356.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 54, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:30:40', '2023-02-03 15:30:40'),
(56, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:31:47', '1356.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1356.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 55, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:31:47', '2023-02-03 15:31:47'),
(57, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:32:41', '3420.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3420.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 56, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:32:41', '2023-02-03 15:32:41'),
(58, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:33:37', '2280.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2280.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 57, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:33:37', '2023-02-03 15:33:37'),
(59, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:34:27', '2280.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2280.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 58, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:34:27', '2023-02-03 15:34:27'),
(60, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:35:22', '2280.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2280.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 59, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:35:22', '2023-02-03 15:35:22'),
(61, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:37:24', '2280.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2280.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 60, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:37:24', '2023-02-03 15:37:24'),
(62, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:38:20', '2330.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2330.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 61, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:38:20', '2023-02-03 15:38:20'),
(63, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:39:23', '1398.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1398.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 62, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:39:23', '2023-02-03 15:39:23'),
(64, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:40:19', '2920.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2920.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 63, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:40:19', '2023-02-03 15:40:19'),
(65, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:41:16', '1752.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1752.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 64, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:41:16', '2023-02-03 15:41:16'),
(66, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:42:16', '1752.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1752.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 65, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:42:16', '2023-02-03 15:42:16'),
(67, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:43:23', '1752.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1752.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 66, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:43:23', '2023-02-03 15:43:23'),
(68, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:44:31', '1560.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1560.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 67, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:44:31', '2023-02-03 15:44:31'),
(69, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:45:24', '1560.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1560.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 68, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:45:24', '2023-02-03 15:45:24'),
(70, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:47:06', '2412.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2412.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 70, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:47:06', '2023-02-03 15:47:06'),
(71, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:48:10', '1206.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1206.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 71, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:48:10', '2023-02-03 15:48:10'),
(72, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:48:56', '1206.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1206.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 72, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:48:56', '2023-02-03 15:48:56'),
(73, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:49:43', '2035.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2035.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 73, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:49:43', '2023-02-03 15:49:43'),
(74, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:50:33', '1221.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1221.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 74, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:50:33', '2023-02-03 15:50:33'),
(75, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:51:30', '1221.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1221.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 75, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:51:30', '2023-02-03 15:51:30'),
(76, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:52:56', '2118.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2118.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 76, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:52:56', '2023-02-03 15:52:56'),
(77, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:54:14', '2118.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2118.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 77, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:54:14', '2023-02-03 15:54:14'),
(78, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:58:19', '1412.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1412.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 78, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:58:19', '2023-02-03 15:58:19'),
(79, 10, 4, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'due', NULL, 4, NULL, '0001', '', NULL, NULL, '2023-02-03 16:36:04', '350.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', 'ok', NULL, '0.0000', '350.0000', NULL, NULL, NULL, NULL, 0, 1, '1.000', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-02-03 16:36:04', '2023-02-03 16:36:04'),
(80, 10, 4, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'due', NULL, 4, NULL, '0002', '', NULL, NULL, '2023-02-03 16:36:42', '550.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', 'dfff', NULL, '0.0000', '550.0000', NULL, NULL, NULL, NULL, 0, 1, '1.000', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-02-03 16:36:42', '2023-02-03 16:36:42'),
(81, 10, 4, NULL, NULL, NULL, 'sell_return', NULL, 'final', 0, 'due', NULL, 4, NULL, 'CN2023/0001', NULL, NULL, NULL, '2023-02-03 00:00:00', '550.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '550.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, 80, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 16:38:31', '2023-02-03 16:38:31'),
(82, 10, 4, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 4, NULL, '0003', '', NULL, NULL, '2023-02-03 16:51:38', '2470.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2470.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-02-03 16:51:38', '2023-02-03 16:51:38'),
(85, 8, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'due', NULL, 2, NULL, '0004', '', NULL, NULL, '2023-02-03 17:06:25', '250.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', 's', NULL, '0.0000', '250.0000', NULL, NULL, NULL, NULL, 0, 1, '1.000', NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-02-03 17:06:25', '2023-02-03 17:06:25'),
(86, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 22:49:29', '660.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '660.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 80, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 22:49:29', '2023-02-03 22:49:29'),
(87, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 22:50:43', '570.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '570.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 81, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 22:50:43', '2023-02-03 22:50:43'),
(88, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 22:52:03', '260.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '260.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 82, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 22:52:03', '2023-02-03 22:52:03'),
(89, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 22:53:13', '120.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '120.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 83, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 22:53:13', '2023-02-03 22:53:13'),
(90, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 22:54:32', '144.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '144.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 84, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 22:54:32', '2023-02-03 22:54:32'),
(91, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 22:55:46', '750.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '750.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 85, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 22:55:46', '2023-02-03 22:55:46'),
(92, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 22:56:43', '648.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '648.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 86, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 22:56:43', '2023-02-03 22:56:43'),
(93, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:01:28', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 87, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:01:28', '2023-02-03 23:01:28'),
(94, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:03:14', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 88, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:03:14', '2023-02-03 23:03:14'),
(95, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:04:16', '540.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '540.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 89, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:04:16', '2023-02-03 23:04:16'),
(96, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:05:13', '480.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '480.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 90, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:05:14', '2023-02-03 23:05:14'),
(97, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:06:25', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 91, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:06:25', '2023-02-03 23:06:25'),
(98, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:07:21', '780.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '780.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 92, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:07:21', '2023-02-03 23:07:21'),
(99, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:09:08', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 93, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:09:08', '2023-02-03 23:09:08');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `round_off_amount`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(100, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:10:15', '630.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '630.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 94, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:10:15', '2023-02-03 23:10:15'),
(101, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:11:17', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 95, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:11:17', '2023-02-03 23:11:17'),
(102, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:12:22', '510.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '510.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 96, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:12:22', '2023-02-03 23:12:22'),
(103, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:15:27', '510.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '510.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 97, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:15:27', '2023-02-03 23:15:27'),
(104, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:17:02', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 98, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:17:02', '2023-02-03 23:17:02'),
(105, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:18:17', '660.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '660.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 99, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:18:17', '2023-02-03 23:18:17'),
(106, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:19:32', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 101, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:19:32', '2023-02-03 23:19:32'),
(107, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:19:36', '1412.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1412.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 102, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:19:36', '2023-02-03 23:19:36'),
(108, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:21:22', '960.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '960.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 103, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:21:22', '2023-02-03 23:21:22'),
(109, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:22:15', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 104, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:22:15', '2023-02-03 23:22:15'),
(110, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:23:51', '660.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '660.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 105, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:23:51', '2023-02-03 23:23:51'),
(111, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:24:55', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 106, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:24:55', '2023-02-03 23:24:55'),
(112, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:25:46', '96.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '96.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 107, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:25:46', '2023-02-03 23:25:46'),
(113, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:26:44', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 108, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:26:44', '2023-02-03 23:26:44'),
(114, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:27:39', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 109, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:27:39', '2023-02-03 23:27:39'),
(115, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:28:38', '270.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '270.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 110, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:28:38', '2023-02-03 23:28:38'),
(116, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:29:38', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 111, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:29:38', '2023-02-03 23:29:38'),
(117, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:30:37', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 112, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:30:37', '2023-02-03 23:30:37'),
(118, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:31:34', '2520.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2520.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 113, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:31:34', '2023-02-03 23:31:34'),
(119, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:32:20', '1200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 114, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:32:20', '2023-02-03 23:32:20'),
(120, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:33:16', '1080.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1080.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 115, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:33:16', '2023-02-03 23:33:16'),
(121, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:34:17', '120.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '120.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 116, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:34:17', '2023-02-03 23:34:17'),
(122, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:35:37', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 117, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:35:37', '2023-02-03 23:35:37'),
(123, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:36:29', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 118, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:36:29', '2023-02-03 23:36:29'),
(124, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:37:11', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 119, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:37:11', '2023-02-03 23:37:11'),
(125, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:37:55', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 120, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:37:55', '2023-02-03 23:37:55'),
(126, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:38:35', '1412.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1412.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 121, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:38:35', '2023-02-03 23:38:35'),
(127, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:38:45', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 122, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:38:45', '2023-02-03 23:38:45'),
(128, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:39:43', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 123, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:39:43', '2023-02-03 23:39:43'),
(129, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:40:16', '3070.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3070.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 124, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:40:16', '2023-02-03 23:40:16'),
(130, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:40:34', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 125, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:40:34', '2023-02-03 23:40:34'),
(131, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:41:35', '192.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '192.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 126, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:41:35', '2023-02-03 23:41:35'),
(132, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:41:59', '1842.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1842.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 127, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:42:00', '2023-02-03 23:42:00'),
(133, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:42:19', '660.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '660.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 128, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:42:19', '2023-02-03 23:42:19'),
(134, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:43:06', '192.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '192.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 129, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:43:06', '2023-02-03 23:43:06'),
(135, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:43:14', '1842.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1842.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 130, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:43:14', '2023-02-03 23:43:14'),
(136, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:43:53', '630.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '630.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 131, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:43:53', '2023-02-03 23:43:53'),
(137, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:44:31', '660.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '660.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 133, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:44:31', '2023-02-03 23:44:31'),
(138, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:44:31', '1842.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1842.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 132, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:44:31', '2023-02-03 23:44:31'),
(139, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:45:13', '432.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '432.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 134, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:45:13', '2023-02-03 23:45:13'),
(140, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:46:01', '372.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '372.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 135, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:46:01', '2023-02-03 23:46:01'),
(141, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:46:09', '1560.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1560.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 136, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:46:09', '2023-02-03 23:46:09'),
(142, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:47:18', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 137, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:47:18', '2023-02-03 23:47:18'),
(143, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:48:03', '246.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '246.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 139, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:48:03', '2023-02-03 23:48:03'),
(144, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:48:20', '3420.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3420.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 138, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:48:20', '2023-02-03 23:48:20'),
(145, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:49:02', '1960.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1960.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 140, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:49:02', '2023-02-03 23:49:02'),
(146, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:49:29', '1710.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1710.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 141, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:49:29', '2023-02-03 23:49:29'),
(147, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:50:01', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 142, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:50:01', '2023-02-03 23:50:01'),
(148, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:50:38', '1710.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1710.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 143, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:50:38', '2023-02-03 23:50:38'),
(149, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:50:56', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 144, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:50:56', '2023-02-03 23:50:56'),
(150, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:51:46', '1710.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1710.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 145, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:51:46', '2023-02-03 23:51:46'),
(151, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:51:58', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 146, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:51:58', '2023-02-03 23:51:58'),
(152, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:52:58', '1710.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1710.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 147, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:52:58', '2023-02-03 23:52:58'),
(153, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:53:06', '510.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '510.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 148, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:53:06', '2023-02-03 23:53:06'),
(154, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:53:53', '390.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '390.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 149, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:53:53', '2023-02-03 23:53:53'),
(155, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:54:42', '480.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '480.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 150, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:54:42', '2023-02-03 23:54:42'),
(156, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:55:39', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 151, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:55:39', '2023-02-03 23:55:39'),
(157, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:57:11', '690.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '690.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 152, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:57:11', '2023-02-03 23:57:11'),
(158, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:57:35', '1710.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1710.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 153, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:57:35', '2023-02-03 23:57:35'),
(159, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 23:59:23', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 154, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 23:59:23', '2023-02-03 23:59:23'),
(160, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:00:07', '1710.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1710.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 155, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:00:07', '2023-02-04 00:00:07'),
(161, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:00:18', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 156, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:00:18', '2023-02-04 00:00:18'),
(162, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:01:07', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 157, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:01:07', '2023-02-04 00:01:07'),
(163, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:01:29', '2280.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2280.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 158, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:01:29', '2023-02-04 00:01:29'),
(164, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:01:58', '270.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '270.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 159, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:01:58', '2023-02-04 00:01:58'),
(165, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:02:49', '1080.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1080.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 160, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:02:49', '2023-02-04 00:02:49'),
(166, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:03:16', '2280.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2280.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 161, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:03:16', '2023-02-04 00:03:16'),
(167, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:03:50', '480.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '480.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 162, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:03:50', '2023-02-04 00:03:50'),
(168, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:04:17', '2280.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2280.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 163, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:04:17', '2023-02-04 00:04:17'),
(169, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:04:38', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 164, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:04:38', '2023-02-04 00:04:38'),
(170, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:05:19', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 166, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:05:19', '2023-02-04 00:05:19'),
(171, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:05:23', '2280.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2280.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 165, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:05:23', '2023-02-04 00:05:23'),
(172, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:06:35', '12800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '12800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 167, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:06:35', '2023-02-04 00:06:35'),
(173, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:07:34', '345.6000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '345.6000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 168, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:07:34', '2023-02-04 00:07:34'),
(174, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:07:46', '3200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 169, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:07:46', '2023-02-04 00:07:46'),
(175, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:08:51', '4480.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '4480.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 170, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:08:51', '2023-02-04 00:08:51'),
(176, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:08:54', '630.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '630.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 171, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:08:54', '2023-02-04 00:08:54'),
(177, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:09:48', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 172, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:09:48', '2023-02-04 00:09:48'),
(178, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:09:53', '2500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 173, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:09:53', '2023-02-04 00:09:53'),
(179, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:10:39', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 174, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:10:39', '2023-02-04 00:10:39'),
(180, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:11:16', '3200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 175, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:11:16', '2023-02-04 00:11:16'),
(181, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:11:46', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 176, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:11:46', '2023-02-04 00:11:46'),
(182, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:12:33', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 177, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:12:33', '2023-02-04 00:12:33'),
(183, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:12:33', '1920.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1920.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 178, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:12:33', '2023-02-04 00:12:33'),
(184, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:14:15', '96.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '96.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 179, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:14:15', '2023-02-04 00:14:15'),
(185, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:15:07', '210.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '210.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 180, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:15:07', '2023-02-04 00:15:07'),
(186, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:16:01', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 181, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:16:01', '2023-02-04 00:16:01'),
(187, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:17:32', '432.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '432.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 182, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:17:32', '2023-02-04 00:17:32'),
(188, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:18:30', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 183, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:18:30', '2023-02-04 00:18:30'),
(189, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:19:24', '240.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '240.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 184, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:19:24', '2023-02-04 00:19:24'),
(190, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:20:10', '204.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '204.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 185, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:20:10', '2023-02-04 00:20:10'),
(191, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:21:56', '3000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 186, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:21:56', '2023-02-04 00:21:56'),
(192, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:22:54', '1080.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1080.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 187, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:22:54', '2023-02-04 00:22:54'),
(193, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:23:57', '800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 188, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:23:57', '2023-02-04 00:23:57'),
(194, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:24:46', '96.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '96.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 189, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:24:46', '2023-02-04 00:24:46'),
(195, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:25:30', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 190, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:25:30', '2023-02-04 00:25:30'),
(196, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:26:11', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 191, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:26:11', '2023-02-04 00:26:11');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `round_off_amount`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(197, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:27:08', '640.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '640.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 192, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:27:08', '2023-02-04 00:27:08'),
(198, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:28:58', '240.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '240.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 193, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:28:58', '2023-02-04 00:28:58'),
(199, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:29:43', '1080.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1080.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 194, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:29:43', '2023-02-04 00:29:43'),
(200, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:30:34', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 195, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:30:34', '2023-02-04 00:30:34'),
(201, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:31:23', '384.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '384.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 196, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:31:23', '2023-02-04 00:31:23'),
(202, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:32:06', '480.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '480.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 197, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:32:06', '2023-02-04 00:32:06'),
(203, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:32:58', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 198, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:32:58', '2023-02-04 00:32:58'),
(204, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:33:08', '1920.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1920.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 199, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:33:08', '2023-02-04 00:33:08'),
(205, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:33:44', '828.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '828.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 200, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:33:44', '2023-02-04 00:33:44'),
(206, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:34:10', '1920.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1920.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 201, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:34:10', '2023-02-04 00:34:10'),
(207, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:34:32', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 202, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:34:32', '2023-02-04 00:34:32'),
(208, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:35:11', '1920.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1920.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 203, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:35:11', '2023-02-04 00:35:11'),
(209, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:36:08', '640.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '640.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 205, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:36:08', '2023-02-04 00:36:08'),
(210, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:36:39', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 204, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:36:39', '2023-02-04 00:36:39'),
(211, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:37:10', '1920.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1920.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 206, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:37:10', '2023-02-04 00:38:44'),
(212, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:38:10', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 207, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:38:11', '2023-02-04 00:38:11'),
(213, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:38:56', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 208, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:38:56', '2023-02-04 00:38:56'),
(214, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:39:41', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 209, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:39:41', '2023-02-04 00:39:41'),
(215, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:40:22', '612.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '612.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 210, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:40:22', '2023-02-04 00:40:22'),
(216, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:40:27', '12800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '12800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 211, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:40:27', '2023-02-04 00:40:27'),
(217, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:41:06', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 212, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:41:06', '2023-02-04 00:41:06'),
(218, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:41:27', '3200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 213, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:41:27', '2023-02-04 00:41:27'),
(219, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:41:47', '840.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '840.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 214, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:41:47', '2023-02-04 00:41:47'),
(220, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:42:36', '1500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 215, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:42:36', '2023-02-04 00:42:36'),
(221, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:42:54', '3200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 216, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:42:54', '2023-02-04 00:42:54'),
(222, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:43:19', '520.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '520.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 217, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:43:19', '2023-02-04 00:43:19'),
(223, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:43:45', '3200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 218, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:43:45', '2023-02-04 00:43:45'),
(224, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:44:13', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 219, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:44:13', '2023-02-04 00:45:03'),
(225, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:44:40', '3200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 220, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:44:40', '2023-02-04 00:44:40'),
(226, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:45:44', '204.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '204.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 222, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:45:44', '2023-02-04 00:45:44'),
(227, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:45:46', '2700.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2700.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 221, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:45:46', '2023-02-04 00:45:46'),
(228, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:46:37', '1080.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1080.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 223, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:46:37', '2023-02-04 00:46:37'),
(229, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:47:05', '1800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 225, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:47:05', '2023-02-04 00:47:05'),
(230, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:47:23', '780.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '780.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 226, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:47:23', '2023-02-04 00:47:23'),
(231, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:47:58', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 227, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:47:58', '2023-02-04 00:47:58'),
(232, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:48:13', '420.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '420.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 228, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:48:13', '2023-02-04 00:48:13'),
(233, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:48:56', '288.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '288.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 230, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:48:56', '2023-02-04 00:48:56'),
(234, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:48:58', '2460.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2460.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 229, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:48:58', '2023-02-04 00:48:58'),
(235, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:49:42', '828.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '828.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 231, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:49:42', '2023-02-04 00:49:42'),
(236, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:49:58', '2460.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2460.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 232, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:49:58', '2023-02-04 00:49:58'),
(237, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:50:28', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 233, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:50:28', '2023-02-04 00:50:28'),
(238, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:51:53', '2460.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2460.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 234, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:51:53', '2023-02-04 00:51:53'),
(239, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:52:45', '288.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '288.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 235, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:52:45', '2023-02-04 00:52:45'),
(240, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:53:28', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 236, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:53:28', '2023-02-04 00:53:28'),
(241, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:54:19', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 237, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:54:19', '2023-02-04 00:54:19'),
(242, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:54:51', '2500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 238, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:54:51', '2023-02-04 00:54:51'),
(243, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:55:10', '530.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '530.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 239, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:55:10', '2023-02-04 00:55:10'),
(244, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:55:58', '1500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 241, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:55:58', '2023-02-04 00:55:58'),
(245, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:56:00', '1200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 240, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:56:00', '2023-02-04 00:56:00'),
(246, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:56:53', '4200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '4200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 242, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:56:53', '2023-02-04 00:56:53'),
(247, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:56:59', '1500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 243, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:56:59', '2023-02-04 00:56:59'),
(248, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:57:37', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 244, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:57:37', '2023-02-04 00:57:37'),
(249, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:58:05', '2064.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2064.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 245, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:58:05', '2023-02-04 00:58:05'),
(250, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:58:28', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 246, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:58:28', '2023-02-04 00:58:28'),
(251, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:59:13', '700.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '700.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 248, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:59:13', '2023-02-04 00:59:13'),
(252, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 00:59:33', '3450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 249, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 00:59:33', '2023-02-04 00:59:33'),
(253, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:00:09', '700.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '700.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 250, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:00:09', '2023-02-04 01:00:09'),
(254, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:00:14', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 251, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:00:14', '2023-02-04 01:00:14'),
(255, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:00:52', '480.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '480.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 252, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:00:52', '2023-02-04 01:00:52'),
(256, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:01:06', '700.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '700.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 253, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:01:06', '2023-02-04 01:01:06'),
(257, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:01:37', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 254, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:01:37', '2023-02-04 01:01:37'),
(258, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:02:09', '350.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '350.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 255, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:02:09', '2023-02-04 01:02:09'),
(259, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:02:38', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 256, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:02:38', '2023-02-04 01:02:38'),
(260, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:03:02', '1020.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1020.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 257, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:03:02', '2023-02-04 01:03:02'),
(261, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:03:26', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 258, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:03:26', '2023-02-04 01:03:26'),
(262, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:04:05', '1020.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1020.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 259, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:04:05', '2023-02-04 01:04:05'),
(263, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:04:13', '540.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '540.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 260, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:04:13', '2023-02-04 01:04:13'),
(264, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:05:02', '153.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '153.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 261, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:05:02', '2023-02-04 01:05:02'),
(265, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:05:16', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 262, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:05:16', '2023-02-04 01:05:16'),
(266, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:06:02', '1630.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1630.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 263, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:06:02', '2023-02-04 01:06:02'),
(267, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:06:38', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 264, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:06:38', '2023-02-04 01:06:38'),
(268, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:06:53', '1625.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1625.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 265, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:06:53', '2023-02-04 01:06:53'),
(269, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:07:28', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 266, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:07:28', '2023-02-04 01:07:28'),
(270, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:08:15', '2856.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2856.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 267, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:08:15', '2023-02-04 01:08:15'),
(271, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:09:11', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 268, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:09:11', '2023-02-04 01:09:11'),
(272, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:09:20', '1428.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1428.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 269, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:09:20', '2023-02-04 01:09:20'),
(273, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:10:28', '1428.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1428.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 270, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:10:28', '2023-02-04 01:10:28'),
(274, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:11:26', '144.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '144.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 271, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:11:26', '2023-02-04 01:11:26'),
(275, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:12:55', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 272, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:12:55', '2023-02-04 01:12:55'),
(276, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:13:39', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 273, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:13:39', '2023-02-04 01:13:39'),
(277, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:13:57', '1140.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1140.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 274, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:13:57', '2023-02-04 01:13:57'),
(278, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:14:32', '275.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '275.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 275, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:14:32', '2023-02-04 01:14:32'),
(279, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:14:47', '1140.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1140.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 276, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:14:47', '2023-02-04 01:14:47'),
(280, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:15:15', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 277, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:15:15', '2023-02-04 01:15:15'),
(281, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:15:36', '1140.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1140.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 278, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:15:36', '2023-02-04 01:15:36'),
(282, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:16:22', '330.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '330.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 279, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:16:22', '2023-02-04 01:16:22'),
(283, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:16:34', '1140.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1140.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 280, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:16:34', '2023-02-04 01:16:34'),
(284, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:17:24', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 281, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:17:24', '2023-02-04 01:17:24'),
(285, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:18:16', '2532.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2532.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 282, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:18:16', '2023-02-04 01:18:16'),
(286, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:18:21', '480.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '480.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 283, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:18:21', '2023-02-04 01:18:21'),
(287, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:19:14', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 284, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:19:14', '2023-02-04 01:19:14'),
(288, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:19:32', '2532.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2532.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 285, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:19:32', '2023-02-04 01:19:32'),
(289, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:20:03', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 286, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:20:03', '2023-02-04 01:20:03'),
(290, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:20:51', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 287, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:20:51', '2023-02-04 01:20:51'),
(291, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:21:19', '2652.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2652.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 288, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:21:19', '2023-02-04 01:21:19'),
(292, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:21:55', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 289, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:21:55', '2023-02-04 01:21:55'),
(293, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:22:42', '2652.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2652.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 290, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:22:42', '2023-02-04 01:22:42');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `round_off_amount`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(294, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:22:47', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 291, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:22:47', '2023-02-04 01:22:47'),
(295, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:23:43', '780.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '780.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 292, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:23:43', '2023-02-04 01:23:43'),
(296, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:23:44', '1989.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1989.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 293, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:23:44', '2023-02-04 01:23:44'),
(297, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:24:29', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 294, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:24:29', '2023-02-04 01:24:29'),
(298, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:24:56', '2652.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2652.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 295, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:24:56', '2023-02-04 01:24:56'),
(299, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:25:23', '405.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '405.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 296, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:25:23', '2023-02-04 01:25:23'),
(300, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:26:08', '405.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '405.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 297, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:26:08', '2023-02-04 01:26:08'),
(301, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:26:42', '960.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '960.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 298, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:26:42', '2023-02-04 01:26:42'),
(302, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:26:56', '960.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '960.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 299, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:26:56', '2023-02-04 01:26:56'),
(303, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:27:45', '1408.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1408.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 300, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:27:45', '2023-02-04 01:27:45'),
(304, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:28:14', '8925.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '8925.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 301, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:28:14', '2023-02-04 01:28:14'),
(305, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:28:49', '1440.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1440.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 302, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:28:49', '2023-02-04 01:28:49'),
(306, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:29:06', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 303, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:29:06', '2023-02-04 01:29:06'),
(307, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:29:50', '2016.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2016.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 304, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:29:50', '2023-02-04 01:29:50'),
(308, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:30:12', '225.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '225.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 305, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:30:12', '2023-02-04 01:30:12'),
(309, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:30:56', '486.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '486.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 307, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:30:56', '2023-02-04 01:30:56'),
(310, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:31:04', '1320.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1320.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 306, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:31:04', '2023-02-04 01:31:04'),
(311, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:32:21', '1872.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1872.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 308, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:32:21', '2023-02-04 01:32:21'),
(312, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:32:41', '780.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '780.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 309, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:32:41', '2023-02-04 01:32:41'),
(313, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:33:18', '3096.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3096.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 310, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:33:18', '2023-02-04 01:33:18'),
(314, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:33:37', '1806.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1806.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 311, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:33:37', '2023-02-04 01:33:37'),
(315, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:34:34', '486.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '486.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 312, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:34:34', '2023-02-04 01:34:34'),
(316, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:34:56', '3132.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3132.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 313, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:34:56', '2023-02-04 01:34:56'),
(317, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:35:24', '780.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '780.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 314, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:35:24', '2023-02-04 01:35:24'),
(318, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:36:46', '1806.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1806.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 315, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:36:46', '2023-02-04 01:36:46'),
(319, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:37:17', '459.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '459.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 316, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:37:17', '2023-02-04 01:37:17'),
(320, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:37:32', '486.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '486.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 317, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:37:32', '2023-02-04 01:37:32'),
(321, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:38:22', '780.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '780.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 318, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:38:22', '2023-02-04 01:38:22'),
(322, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:38:34', '1836.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1836.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 319, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:38:34', '2023-02-04 01:38:34'),
(323, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:39:16', '1806.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1806.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 320, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:39:16', '2023-02-04 01:39:16'),
(324, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:40:14', '486.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '486.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 321, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:40:14', '2023-02-04 01:40:14'),
(325, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:41:22', '876.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '876.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 322, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:41:22', '2023-02-04 01:41:22'),
(326, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:42:14', '972.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '972.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 323, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:42:14', '2023-02-04 01:42:14'),
(327, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:43:06', '1752.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1752.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 324, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:43:06', '2023-02-04 01:43:06'),
(328, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:45:57', '486.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '486.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 325, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:45:57', '2023-02-04 01:45:57'),
(329, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:46:42', '876.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '876.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 326, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:46:42', '2023-02-04 01:46:42'),
(330, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:47:30', '1344.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1344.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 327, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:47:30', '2023-02-04 01:47:30'),
(331, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:48:28', '1344.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1344.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 328, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:48:28', '2023-02-04 01:48:28'),
(332, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:49:11', '1344.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1344.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 329, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:49:11', '2023-02-04 01:49:11'),
(333, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:50:26', '732.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '732.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 330, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:50:26', '2023-02-04 01:50:26'),
(334, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:51:13', '1218.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1218.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 331, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:51:13', '2023-02-04 01:51:13'),
(335, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:51:58', '1932.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1932.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 332, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:51:58', '2023-02-04 01:51:58'),
(336, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:52:41', '732.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '732.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 333, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:52:41', '2023-02-04 01:52:41'),
(337, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:53:28', '1218.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1218.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 334, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:53:28', '2023-02-04 01:53:28'),
(338, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:54:28', '1932.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1932.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 335, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:54:28', '2023-02-04 01:54:28'),
(339, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:55:51', '732.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '732.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 336, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:55:51', '2023-02-04 01:55:51'),
(340, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:56:09', '1836.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1836.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 337, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:56:09', '2023-02-04 01:56:09'),
(341, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:56:37', '1218.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1218.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 338, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:56:37', '2023-02-04 01:56:37'),
(342, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:57:21', '1836.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1836.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 339, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:57:21', '2023-02-04 01:57:21'),
(343, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:57:35', '1932.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1932.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 340, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:57:35', '2023-02-04 01:57:35'),
(344, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:58:49', '3144.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3144.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 341, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:58:49', '2023-02-04 01:58:49'),
(345, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:58:55', '1800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 342, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:58:55', '2023-02-04 01:58:55'),
(346, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 01:59:43', '462.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '462.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 343, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 01:59:43', '2023-02-04 01:59:43'),
(347, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:02:40', '786.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '786.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 344, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:02:40', '2023-02-04 02:02:40'),
(348, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:04:04', '3144.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3144.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 345, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:04:04', '2023-02-04 02:04:04'),
(349, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:07:53', '459.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '459.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 346, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:07:53', '2023-02-04 02:07:53'),
(350, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:10:46', '1836.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1836.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 347, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:10:46', '2023-02-04 02:10:46'),
(351, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:20:14', '786.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '786.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 348, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:20:14', '2023-02-04 02:20:14'),
(352, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:22:15', '3144.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3144.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 349, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:22:15', '2023-02-04 02:22:15'),
(353, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:24:31', '392.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '392.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 350, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:24:31', '2023-02-04 02:24:31'),
(354, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:26:01', '19040.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '19040.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 351, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:26:01', '2023-02-04 02:26:01'),
(355, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:33:00', '408.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '408.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 352, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:33:00', '2023-02-04 02:33:00'),
(356, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:33:52', '574.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '574.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 353, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:33:52', '2023-02-04 02:33:52'),
(357, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:34:58', '286.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '286.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 354, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:34:58', '2023-02-04 02:34:58'),
(358, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:36:11', '816.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '816.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 355, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:36:11', '2023-02-04 02:36:11'),
(359, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:37:04', '1308.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1308.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 356, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:37:04', '2023-02-04 02:37:04'),
(360, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:37:54', '1404.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1404.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 357, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:37:54', '2023-02-04 02:37:54'),
(361, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:39:55', '816.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '816.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 358, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:39:55', '2023-02-04 02:39:55'),
(362, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:40:53', '1356.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1356.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 359, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:40:53', '2023-02-04 02:40:53'),
(363, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:42:18', '1452.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1452.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 360, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:42:18', '2023-02-04 02:42:18'),
(364, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:43:21', '864.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '864.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 361, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:43:21', '2023-02-04 02:43:21'),
(365, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:44:28', '1344.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1344.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 362, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:44:28', '2023-02-04 02:44:28'),
(366, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:45:36', '726.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '726.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 363, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:45:36', '2023-02-04 02:45:36'),
(367, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:46:26', '864.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '864.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 364, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:46:26', '2023-02-04 02:46:26'),
(368, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 02:49:44', '1356.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1356.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 365, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 02:49:44', '2023-02-04 02:49:44'),
(369, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:03:27', '726.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '726.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 366, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:03:27', '2023-02-04 03:03:27'),
(370, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:06:20', '726.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '726.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 367, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:06:20', '2023-02-04 03:06:20'),
(371, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:07:24', '339.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '339.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 368, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:07:24', '2023-02-04 03:07:24'),
(372, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:08:32', '339.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '339.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 369, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:08:32', '2023-02-04 03:08:32'),
(373, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:10:14', '657.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '657.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 370, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:10:14', '2023-02-04 03:10:14'),
(374, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:11:27', '438.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '438.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 371, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:11:27', '2023-02-04 03:11:27'),
(375, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:12:28', '1368.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1368.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 372, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:12:28', '2023-02-04 03:12:28'),
(376, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:13:53', '2436.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2436.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 373, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:13:53', '2023-02-04 03:13:53'),
(377, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:15:32', '1782.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1782.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 374, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:15:32', '2023-02-04 03:15:32'),
(378, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:16:34', '438.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '438.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 375, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:16:34', '2023-02-04 03:16:34'),
(379, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:17:41', '684.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '684.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 376, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:17:41', '2023-02-04 03:17:41'),
(380, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:18:51', '1224.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1224.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 377, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:18:51', '2023-02-04 03:18:51'),
(381, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:20:03', '1782.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1782.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 378, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:20:03', '2023-02-04 03:20:03'),
(382, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:21:24', '438.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '438.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 379, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:21:24', '2023-02-04 03:21:24'),
(383, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:22:25', '684.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '684.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 380, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:22:25', '2023-02-04 03:22:25'),
(384, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:23:20', '1218.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1218.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 381, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:23:20', '2023-02-04 03:23:20'),
(385, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:24:12', '1782.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1782.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 382, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:24:12', '2023-02-04 03:24:12'),
(386, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:25:41', '438.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '438.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 383, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:25:41', '2023-02-04 03:25:41'),
(387, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:28:36', '684.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '684.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 384, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:28:36', '2023-02-04 03:28:36'),
(388, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:29:40', '1218.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1218.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 385, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:29:40', '2023-02-04 03:29:40'),
(389, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:32:12', '1218.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1218.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 386, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:32:12', '2023-02-04 03:32:13');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `round_off_amount`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(390, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:33:26', '636.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '636.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 387, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:33:26', '2023-02-04 03:33:27'),
(391, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:34:34', '828.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '828.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 388, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:34:34', '2023-02-04 03:34:34'),
(392, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:35:52', '708.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '708.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 389, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:35:52', '2023-02-04 03:35:52'),
(393, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:36:43', '390.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '390.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 390, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:36:43', '2023-02-04 03:36:43'),
(394, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:39:29', '558.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '558.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 391, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:39:29', '2023-02-04 03:39:29'),
(395, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:41:27', '876.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '876.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 392, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:41:27', '2023-02-04 03:41:27'),
(396, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:43:00', '390.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '390.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 393, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:43:00', '2023-02-04 03:43:00'),
(397, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:44:23', '558.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '558.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 394, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:44:23', '2023-02-04 03:44:23'),
(398, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:46:36', '876.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '876.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 395, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:46:36', '2023-02-04 03:46:36'),
(399, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:48:04', '390.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '390.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 396, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:48:04', '2023-02-04 03:48:04'),
(400, 10, 4, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 03:49:33', '558.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '558.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 397, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-04 03:49:33', '2023-02-04 03:49:33');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments`
--

CREATE TABLE `transaction_payments` (
  `id` int UNSIGNED NOT NULL,
  `transaction_id` int UNSIGNED DEFAULT NULL,
  `business_id` int DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `method` enum('cash','card','cheque','bank_transfer','custom_pay_1','custom_pay_2','custom_pay_3','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_transaction_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_security` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `payment_for` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_payments`
--

INSERT INTO `transaction_payments` (`id`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `payment_for`, `parent_id`, `note`, `document`, `payment_ref_no`, `account_id`, `created_at`, `updated_at`) VALUES
(1, 2, 9, 0, '250.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-16 21:24:40', 9, 3, NULL, NULL, NULL, 'SP2023/0001', NULL, '2023-01-16 21:24:40', '2023-01-16 21:24:40'),
(2, 4, 8, 0, '230.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-02 18:56:12', 8, 2, NULL, NULL, NULL, 'SP2023/0001', NULL, '2023-02-02 18:56:12', '2023-02-02 18:56:12'),
(3, 82, 10, 0, '2470.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 16:51:38', 10, 4, NULL, NULL, NULL, 'SP2023/0001', NULL, '2023-02-03 16:51:38', '2023-02-03 16:51:38');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines`
--

CREATE TABLE `transaction_sell_lines` (
  `id` int UNSIGNED NOT NULL,
  `transaction_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `variation_id` int UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `unit_price_before_discount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line_discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int UNSIGNED DEFAULT NULL,
  `discount_id` int DEFAULT NULL,
  `lot_no_line_id` int DEFAULT NULL,
  `sell_line_note` text COLLATE utf8mb4_unicode_ci,
  `res_service_staff_id` int DEFAULT NULL,
  `res_line_order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_sell_line_id` int DEFAULT NULL,
  `children_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines`
--

INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, '1.0000', '0.0000', '250.0000', '250.0000', 'fixed', '0.0000', '250.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-01-16 21:24:40', '2023-01-16 21:24:40'),
(2, 4, 2, 2, '1.0000', '0.0000', '230.0000', '230.0000', 'fixed', '0.0000', '230.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-02-02 18:56:12', '2023-02-02 18:56:12'),
(3, 79, 33, 33, '1.0000', '0.0000', '350.0000', '350.0000', 'fixed', '0.0000', '350.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-02-03 16:36:04', '2023-02-03 16:36:04'),
(4, 80, 54, 54, '1.0000', '1.0000', '550.0000', '550.0000', 'fixed', '0.0000', '550.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-02-03 16:36:42', '2023-02-03 16:38:31'),
(5, 82, 54, 54, '1.0000', '0.0000', '550.0000', '550.0000', 'fixed', '0.0000', '550.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-02-03 16:51:38', '2023-02-03 16:51:38'),
(6, 82, 59, 59, '1.0000', '0.0000', '690.0000', '690.0000', 'fixed', '0.0000', '690.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-02-03 16:51:38', '2023-02-03 16:51:38'),
(7, 82, 7, 7, '1.0000', '0.0000', '580.0000', '580.0000', 'fixed', '0.0000', '580.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-02-03 16:51:38', '2023-02-03 16:51:38'),
(8, 82, 45, 45, '1.0000', '0.0000', '650.0000', '650.0000', 'fixed', '0.0000', '650.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-02-03 16:51:38', '2023-02-03 16:51:38'),
(11, 85, 2, 2, '1.0000', '0.0000', '250.0000', '250.0000', 'fixed', '0.0000', '250.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-02-03 17:06:25', '2023-02-03 17:06:25');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int UNSIGNED NOT NULL,
  `sell_line_id` int UNSIGNED DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines_purchase_lines`
--

INSERT INTO `transaction_sell_lines_purchase_lines` (`id`, `sell_line_id`, `stock_adjustment_line_id`, `purchase_line_id`, `quantity`, `qty_returned`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, '1.0000', '0.0000', '2023-01-16 21:24:40', '2023-01-16 21:24:40'),
(2, 2, NULL, 2, '1.0000', '0.0000', '2023-02-02 18:56:12', '2023-02-02 18:56:12'),
(3, 3, NULL, 33, '1.0000', '0.0000', '2023-02-03 16:36:04', '2023-02-03 16:36:04'),
(4, 4, NULL, 53, '1.0000', '1.0000', '2023-02-03 16:36:42', '2023-02-03 16:38:31'),
(5, 5, NULL, 53, '1.0000', '0.0000', '2023-02-03 16:51:38', '2023-02-03 16:51:38'),
(6, 6, NULL, 58, '1.0000', '0.0000', '2023-02-03 16:51:38', '2023-02-03 16:51:38'),
(7, 7, NULL, 7, '1.0000', '0.0000', '2023-02-03 16:51:38', '2023-02-03 16:51:38'),
(8, 8, NULL, 44, '1.0000', '0.0000', '2023-02-03 16:51:38', '2023-02-03 16:51:38'),
(11, 11, NULL, 2, '1.0000', '0.0000', '2023-02-03 17:06:25', '2023-02-03 17:06:25');

-- --------------------------------------------------------

--
-- Table structure for table `types_of_services`
--

CREATE TABLE `types_of_services` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `business_id` int NOT NULL,
  `location_price_group` text COLLATE utf8mb4_unicode_ci,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `actual_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `base_unit_id`, `base_unit_multiplier`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 7, 'Pieces', 'Pc(s)', 0, NULL, NULL, 7, NULL, '2023-01-16 22:44:22', '2023-01-16 22:44:22'),
(2, 8, 'Pieces', 'Pc(s)', 0, NULL, NULL, 8, NULL, '2023-01-16 22:46:09', '2023-01-16 22:46:09'),
(3, 9, 'Pieces', 'Pc(s)', 0, NULL, NULL, 9, NULL, '2023-01-16 23:33:06', '2023-01-16 23:33:06'),
(4, 10, 'Pieces', 'Pc(s)', 0, NULL, NULL, 10, NULL, '2023-02-03 15:41:21', '2023-02-03 15:41:21'),
(5, 10, 'Packets', 'PKTS', 0, NULL, NULL, 10, NULL, '2023-02-03 14:55:07', '2023-02-03 14:55:07'),
(6, 10, 'Dozen', 'dz', 0, NULL, NULL, 10, NULL, '2023-02-04 00:51:51', '2023-02-04 00:51:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `surname` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `contact_no` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int UNSIGNED DEFAULT NULL,
  `max_sales_discount_percent` decimal(5,2) DEFAULT NULL,
  `allow_login` tinyint(1) NOT NULL DEFAULT '1',
  `status` enum('active','inactive','terminated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT '0',
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT '0.00',
  `selected_contacts` tinyint(1) NOT NULL DEFAULT '0',
  `dob` date DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` text COLLATE utf8mb4_unicode_ci,
  `current_address` text COLLATE utf8mb4_unicode_ci,
  `guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` longtext COLLATE utf8mb4_unicode_ci,
  `id_proof_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_proof_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `max_sales_discount_percent`, `allow_login`, `status`, `is_cmmsn_agnt`, `cmmsn_percent`, `selected_contacts`, `dob`, `gender`, `marital_status`, `blood_group`, `contact_number`, `fb_link`, `twitter_link`, `social_media_1`, `social_media_2`, `permanent_address`, `current_address`, `guardian_name`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `bank_details`, `id_proof_name`, `id_proof_number`, `deleted_at`, `created_at`, `updated_at`) VALUES
(7, 'user', NULL, 'dsd', 'sdsd', 'sdsdsd', NULL, '$2y$10$TU0JN9CiIRe8oepPtfjFOubnFPrzeggSY9CXHTg6BADGT6W5e2y76', 'en', NULL, NULL, NULL, 7, NULL, 1, 'active', 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-16 22:44:22', '2023-01-16 22:44:22'),
(8, 'user', NULL, 'Allan', 'Mwaura', 'maarifa', NULL, '$2y$10$CR9WdyOAhdw4BPxfkbA0h.J2KNuZag9m1xNk1D31AnDX/KqFdOlBi', 'en', NULL, NULL, 'MaUzMuv1mizbLPkJebOWRwhPmV7UFPGBuRfMYG7QyuJ0wGyRwImSW6JQlpDB', 8, NULL, 1, 'active', 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-16 22:46:09', '2023-01-16 22:46:09'),
(9, 'user', 'Mr', 'Nelson', 'Mutua', 'mutuanelson', 'info@outofficeinnovations.co', '$2y$10$cUkha20c8xuLvYD8iYBzm.5LcEXzNu8FWhVAHuP8kkHFfqIIIcnle', 'en', NULL, NULL, 'nc4PBzBKkqNf2K1dgazPSD13hqbVAMCaSWQ5LH0lOrYCGNqtWJyaZbCy1A21', 9, NULL, 1, 'active', 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-16 23:33:05', '2023-01-16 23:33:05'),
(10, 'user', NULL, 'Eunice', 'Kirungo', 'Eunice', 'eunice@gmail.com', '$2y$10$33UvTIDpWDbO886AEBzuR.gDOUtL4.gEstJTPLnFcIT.xhhGa5LIq', 'en', NULL, NULL, 'iUyCVZ53aYAHwgdH1fqTFU4th0Yy41HCVIPxhVa2uDWT7qVk8jKiW9qZWwFf', 10, NULL, 1, 'active', 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-03 15:41:20', '2023-02-03 15:41:20');

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_access`
--

CREATE TABLE `user_contact_access` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `contact_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `sub_sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_variation_id` int UNSIGNED NOT NULL,
  `variation_value_id` int DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `profit_percent` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text COLLATE utf8mb4_unicode_ci COMMENT 'Contains the combo variation details'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(1, 'DUMMY', 1, '0001', 1, NULL, '180.0000', '180.0000', '38.8900', '250.0000', '250.0000', '2023-01-16 21:24:23', '2023-01-16 21:24:23', NULL, '[]'),
(2, 'DUMMY', 2, '0002', 2, NULL, '180.0000', '180.0000', '38.8900', '250.0000', '250.0000', '2023-02-02 18:55:24', '2023-02-02 18:55:24', NULL, '[]'),
(3, 'DUMMY', 3, '0003', 3, NULL, '412.0000', '412.0000', '21.3600', '500.0000', '500.0000', '2023-02-03 13:41:52', '2023-02-03 13:41:52', NULL, '[]'),
(4, 'DUMMY', 4, '0004', 4, NULL, '412.0000', '412.0000', '21.3600', '500.0000', '500.0000', '2023-02-03 14:04:36', '2023-02-03 14:04:36', NULL, '[]'),
(5, 'DUMMY', 5, '0005', 5, NULL, '412.0000', '412.0000', '21.3600', '500.0000', '500.0000', '2023-02-03 14:07:07', '2023-02-03 14:07:07', NULL, '[]'),
(6, 'DUMMY', 6, '0006', 6, NULL, '486.0000', '486.0000', '19.3400', '580.0000', '580.0000', '2023-02-03 14:11:22', '2023-02-03 14:11:22', NULL, '[]'),
(7, 'DUMMY', 7, '0007', 7, NULL, '486.0000', '486.0000', '19.3400', '580.0000', '580.0000', '2023-02-03 14:13:44', '2023-02-03 14:13:44', NULL, '[]'),
(8, 'DUMMY', 8, '0008', 8, NULL, '486.0000', '486.0000', '19.3400', '580.0000', '580.0000', '2023-02-03 14:19:03', '2023-02-03 14:19:03', NULL, '[]'),
(9, 'DUMMY', 9, '0009', 9, NULL, '683.0000', '683.0000', '9.8100', '750.0000', '750.0000', '2023-02-03 14:24:46', '2023-02-03 14:28:15', NULL, '[]'),
(10, 'DUMMY', 10, '0010', 10, NULL, '683.0000', '683.0000', '9.8100', '750.0000', '750.0000', '2023-02-03 14:27:10', '2023-02-03 14:27:10', NULL, '[]'),
(11, 'DUMMY', 11, '0011', 11, NULL, '407.0000', '407.0000', '17.9400', '480.0000', '480.0000', '2023-02-03 14:29:19', '2023-02-03 14:29:19', NULL, '[]'),
(12, 'DUMMY', 12, '0012', 12, NULL, '746.0000', '746.0000', '13.9400', '850.0000', '850.0000', '2023-02-03 14:31:08', '2023-02-03 14:35:22', NULL, '[]'),
(13, 'DUMMY', 13, '0013', 13, NULL, '570.0000', '570.0000', '17.5400', '670.0000', '670.0000', '2023-02-03 14:32:23', '2023-02-03 14:32:23', NULL, '[]'),
(14, 'DUMMY', 14, '0014', 14, NULL, '570.0000', '570.0000', '17.5400', '670.0000', '670.0000', '2023-02-03 14:33:32', '2023-02-03 14:33:32', NULL, '[]'),
(15, 'DUMMY', 15, '0015', 15, NULL, '570.0000', '570.0000', '17.5400', '670.0000', '670.0000', '2023-02-03 14:34:50', '2023-02-03 14:34:50', NULL, '[]'),
(16, 'DUMMY', 16, '0016', 16, NULL, '378.0000', '378.0000', '32.2800', '500.0000', '500.0000', '2023-02-03 14:36:24', '2023-02-03 14:36:24', NULL, '[]'),
(17, 'DUMMY', 17, '0017', 17, NULL, '378.0000', '378.0000', '32.2800', '500.0000', '500.0000', '2023-02-03 14:37:32', '2023-02-03 14:37:32', NULL, '[]'),
(18, 'DUMMY', 18, '0018', 18, NULL, '378.0000', '378.0000', '32.2800', '500.0000', '500.0000', '2023-02-03 14:38:28', '2023-02-03 14:38:28', NULL, '[]'),
(19, 'DUMMY', 19, '0019', 19, NULL, '378.0000', '378.0000', '32.2800', '500.0000', '500.0000', '2023-02-03 14:40:24', '2023-02-03 14:40:24', NULL, '[]'),
(20, 'DUMMY', 20, '0020', 20, NULL, '339.0000', '339.0000', '41.5900', '480.0000', '480.0000', '2023-02-03 14:41:27', '2023-02-03 14:58:25', NULL, '[]'),
(21, 'DUMMY', 21, '0021', 21, NULL, '339.0000', '339.0000', '41.5900', '480.0000', '480.0000', '2023-02-03 14:42:32', '2023-02-03 14:57:03', NULL, '[]'),
(22, 'DUMMY', 22, '0022', 22, NULL, '339.0000', '339.0000', '41.5900', '480.0000', '480.0000', '2023-02-03 14:43:38', '2023-02-03 14:57:52', NULL, '[]'),
(23, 'DUMMY', 23, '0023', 23, NULL, '339.0000', '339.0000', '41.5900', '480.0000', '480.0000', '2023-02-03 14:45:03', '2023-02-03 14:57:24', NULL, '[]'),
(24, 'DUMMY', 24, '0024', 24, NULL, '486.0000', '486.0000', '17.2800', '570.0000', '570.0000', '2023-02-03 14:45:57', '2023-02-03 14:45:57', NULL, '[]'),
(25, 'DUMMY', 25, '0025', 25, NULL, '486.0000', '486.0000', '17.2800', '570.0000', '570.0000', '2023-02-03 14:46:46', '2023-02-03 14:46:46', NULL, '[]'),
(26, 'DUMMY', 26, '0026', 26, NULL, '486.0000', '486.0000', '17.2800', '570.0000', '570.0000', '2023-02-03 14:47:44', '2023-02-03 14:47:44', NULL, '[]'),
(27, 'DUMMY', 27, '0027', 27, NULL, '486.0000', '486.0000', '17.2800', '570.0000', '570.0000', '2023-02-03 14:49:15', '2023-02-03 14:49:15', NULL, '[]'),
(28, 'DUMMY', 28, '0028', 28, NULL, '545.0000', '545.0000', '19.2700', '650.0000', '650.0000', '2023-02-03 14:50:14', '2023-02-03 14:50:14', NULL, '[]'),
(29, 'DUMMY', 29, '0029', 29, NULL, '545.0000', '545.0000', '19.2700', '650.0000', '650.0000', '2023-02-03 14:51:05', '2023-02-03 14:51:05', NULL, '[]'),
(30, 'DUMMY', 30, '0030', 30, NULL, '545.0000', '545.0000', '19.2700', '650.0000', '650.0000', '2023-02-03 14:52:07', '2023-02-03 14:52:07', NULL, '[]'),
(31, 'DUMMY', 31, '0031', 31, NULL, '545.0000', '545.0000', '19.2700', '650.0000', '650.0000', '2023-02-03 14:52:58', '2023-02-03 14:52:58', NULL, '[]'),
(32, 'DUMMY', 32, '0032', 32, NULL, '545.0000', '545.0000', '19.2700', '650.0000', '650.0000', '2023-02-03 14:54:03', '2023-02-03 14:54:03', NULL, '[]'),
(33, 'DUMMY', 33, '0033', 33, NULL, '324.0000', '324.0000', '23.4600', '400.0000', '400.0000', '2023-02-03 14:55:43', '2023-02-03 14:55:43', NULL, '[]'),
(34, 'DUMMY', 34, '0034', 34, NULL, '324.0000', '324.0000', '23.4600', '400.0000', '400.0000', '2023-02-03 14:59:03', '2023-02-03 14:59:03', NULL, '[]'),
(35, 'DUMMY', 35, '0035', 35, NULL, '520.0000', '520.0000', '15.3800', '600.0000', '600.0000', '2023-02-03 15:00:31', '2023-02-03 15:00:31', NULL, '[]'),
(36, 'DUMMY', 36, '0036', 36, NULL, '520.0000', '520.0000', '15.3800', '600.0000', '600.0000', '2023-02-03 15:01:33', '2023-02-03 15:01:33', NULL, '[]'),
(37, 'DUMMY', 37, '0037', 37, NULL, '520.0000', '520.0000', '15.3800', '600.0000', '600.0000', '2023-02-03 15:02:24', '2023-02-03 15:02:24', NULL, '[]'),
(38, 'DUMMY', 38, '0038', 38, NULL, '575.0000', '575.0000', '13.0400', '650.0000', '650.0000', '2023-02-03 15:03:12', '2023-02-03 15:03:12', NULL, '[]'),
(39, 'DUMMY', 39, '0039', 39, NULL, '575.0000', '575.0000', '13.0400', '650.0000', '650.0000', '2023-02-03 15:03:58', '2023-02-03 15:03:58', NULL, '[]'),
(40, 'DUMMY', 40, '0040', 40, NULL, '575.0000', '575.0000', '13.0400', '650.0000', '650.0000', '2023-02-03 15:04:37', '2023-02-03 15:04:37', NULL, '[]'),
(41, 'DUMMY', 41, '0041', 41, NULL, '525.0000', '525.0000', '14.2900', '600.0000', '600.0000', '2023-02-03 15:05:34', '2023-02-03 15:05:34', NULL, '[]'),
(42, 'DUMMY', 42, '0042', 42, NULL, '525.0000', '525.0000', '14.2900', '600.0000', '600.0000', '2023-02-03 15:07:14', '2023-02-03 15:07:14', NULL, '[]'),
(43, 'DUMMY', 43, '0043', 43, NULL, '550.0000', '550.0000', '18.1800', '650.0000', '650.0000', '2023-02-03 15:08:10', '2023-02-03 15:08:10', NULL, '[]'),
(45, 'DUMMY', 45, '0045', 45, NULL, '550.0000', '550.0000', '18.1800', '650.0000', '650.0000', '2023-02-03 15:10:15', '2023-02-03 15:10:15', NULL, '[]'),
(46, 'DUMMY', 46, '0046', 46, NULL, '270.0000', '270.0000', '29.6300', '350.0000', '350.0000', '2023-02-03 15:11:11', '2023-02-03 15:11:11', NULL, '[]'),
(47, 'DUMMY', 47, '0047', 47, NULL, '270.0000', '270.0000', '29.6300', '350.0000', '350.0000', '2023-02-03 15:12:20', '2023-02-03 15:12:20', NULL, '[]'),
(48, 'DUMMY', 48, '0048', 48, NULL, '270.0000', '270.0000', '29.6300', '350.0000', '350.0000', '2023-02-03 15:13:17', '2023-02-03 15:13:17', NULL, '[]'),
(49, 'DUMMY', 49, '0049', 49, NULL, '358.0000', '358.0000', '29.8900', '465.0000', '465.0000', '2023-02-03 15:14:01', '2023-02-03 15:14:01', NULL, '[]'),
(50, 'DUMMY', 50, '0050', 50, NULL, '358.0000', '358.0000', '29.8900', '465.0000', '465.0000', '2023-02-03 15:14:54', '2023-02-03 15:14:54', NULL, '[]'),
(51, 'DUMMY', 51, '0051', 51, NULL, '358.0000', '358.0000', '29.8900', '465.0000', '465.0000', '2023-02-03 15:15:46', '2023-02-03 15:15:46', NULL, '[]'),
(52, 'DUMMY', 52, '0052', 52, NULL, '486.0000', '486.0000', '13.1700', '550.0000', '550.0000', '2023-02-03 15:16:57', '2023-02-03 15:16:57', NULL, '[]'),
(53, 'DUMMY', 53, '0053', 53, NULL, '486.0000', '486.0000', '13.1700', '550.0000', '550.0000', '2023-02-03 15:28:21', '2023-02-03 15:28:21', NULL, '[]'),
(54, 'DUMMY', 54, '0054', 54, NULL, '452.0000', '452.0000', '21.6800', '550.0000', '550.0000', '2023-02-03 15:30:22', '2023-02-03 15:30:22', NULL, '[]'),
(55, 'DUMMY', 55, '0055', 55, NULL, '452.0000', '452.0000', '21.6800', '550.0000', '550.0000', '2023-02-03 15:31:28', '2023-02-03 15:31:28', NULL, '[]'),
(56, 'DUMMY', 56, '0056', 56, NULL, '570.0000', '570.0000', '21.0500', '690.0000', '690.0000', '2023-02-03 15:32:25', '2023-02-03 15:32:25', NULL, '[]'),
(57, 'DUMMY', 57, '0057', 57, NULL, '570.0000', '570.0000', '21.0500', '690.0000', '690.0000', '2023-02-03 15:33:24', '2023-02-03 15:33:24', NULL, '[]'),
(58, 'DUMMY', 58, '0058', 58, NULL, '570.0000', '570.0000', '21.0500', '690.0000', '690.0000', '2023-02-03 15:34:13', '2023-02-03 15:34:13', NULL, '[]'),
(59, 'DUMMY', 59, '0059', 59, NULL, '570.0000', '570.0000', '21.0500', '690.0000', '690.0000', '2023-02-03 15:35:07', '2023-02-03 15:35:07', NULL, '[]'),
(60, 'DUMMY', 60, '0060', 60, NULL, '570.0000', '570.0000', '21.0500', '690.0000', '690.0000', '2023-02-03 15:37:10', '2023-02-03 15:37:10', NULL, '[]'),
(61, 'DUMMY', 61, '0061', 61, NULL, '466.0000', '466.0000', '18.0300', '550.0000', '550.0000', '2023-02-03 15:38:06', '2023-02-03 15:38:06', NULL, '[]'),
(62, 'DUMMY', 62, '0062', 62, NULL, '466.0000', '466.0000', '18.0300', '550.0000', '550.0000', '2023-02-03 15:39:10', '2023-02-03 15:39:10', NULL, '[]'),
(63, 'DUMMY', 63, '0063', 63, NULL, '584.0000', '584.0000', '16.4400', '680.0000', '680.0000', '2023-02-03 15:40:02', '2023-02-03 15:40:02', NULL, '[]'),
(64, 'DUMMY', 64, '0064', 64, NULL, '584.0000', '584.0000', '16.4400', '680.0000', '680.0000', '2023-02-03 15:40:55', '2023-02-03 15:40:55', NULL, '[]'),
(65, 'DUMMY', 65, '0065', 65, NULL, '584.0000', '584.0000', '16.4400', '680.0000', '680.0000', '2023-02-03 15:42:00', '2023-02-03 15:42:00', NULL, '[]'),
(66, 'DUMMY', 66, '0066', 66, NULL, '584.0000', '584.0000', '16.4400', '680.0000', '680.0000', '2023-02-03 15:43:10', '2023-02-03 15:43:10', NULL, '[]'),
(67, 'DUMMY', 67, '0067', 67, NULL, '520.0000', '520.0000', '19.2300', '620.0000', '620.0000', '2023-02-03 15:44:13', '2023-02-03 15:44:13', NULL, '[]'),
(68, 'DUMMY', 68, '0068', 68, NULL, '520.0000', '520.0000', '19.2300', '620.0000', '620.0000', '2023-02-03 15:45:06', '2023-02-03 15:45:06', NULL, '[]'),
(69, 'DUMMY', 69, '0069', 69, NULL, '520.0000', '520.0000', '19.2300', '620.0000', '620.0000', '2023-02-03 15:46:27', '2023-02-03 15:46:27', NULL, '[]'),
(70, 'DUMMY', 70, '0070', 70, NULL, '402.0000', '402.0000', '24.3800', '500.0000', '500.0000', '2023-02-03 15:46:50', '2023-02-03 15:46:50', NULL, '[]'),
(71, 'DUMMY', 71, '0071', 71, NULL, '402.0000', '402.0000', '24.3800', '500.0000', '500.0000', '2023-02-03 15:47:49', '2023-02-03 15:47:49', NULL, '[]'),
(72, 'DUMMY', 72, '0072', 72, NULL, '402.0000', '402.0000', '24.3800', '500.0000', '500.0000', '2023-02-03 15:48:40', '2023-02-03 15:48:40', NULL, '[]'),
(73, 'DUMMY', 73, '0073', 73, NULL, '407.0000', '407.0000', '22.8500', '500.0000', '500.0000', '2023-02-03 15:49:28', '2023-02-03 15:49:28', NULL, '[]'),
(74, 'DUMMY', 74, '0074', 74, NULL, '407.0000', '407.0000', '22.8500', '500.0000', '500.0000', '2023-02-03 15:50:18', '2023-02-03 15:50:18', NULL, '[]'),
(75, 'DUMMY', 75, '0075', 75, NULL, '407.0000', '407.0000', '22.8500', '500.0000', '500.0000', '2023-02-03 15:51:16', '2023-02-03 15:51:16', NULL, '[]'),
(76, 'DUMMY', 76, '0076', 76, NULL, '353.0000', '353.0000', '33.1400', '470.0000', '470.0000', '2023-02-03 15:52:38', '2023-02-03 15:52:38', NULL, '[]'),
(77, 'DUMMY', 77, '0077', 77, NULL, '353.0000', '353.0000', '33.1400', '470.0000', '470.0000', '2023-02-03 15:53:55', '2023-02-03 15:53:55', NULL, '[]'),
(80, 'DUMMY', 80, '0080', 80, NULL, '220.0000', '220.0000', '59.0900', '350.0000', '350.0000', '2023-02-03 22:49:07', '2023-02-03 22:49:07', NULL, '[]'),
(81, 'DUMMY', 81, '0081', 81, NULL, '190.0000', '190.0000', '31.5800', '250.0000', '250.0000', '2023-02-03 22:50:27', '2023-02-03 22:50:27', NULL, '[]'),
(82, 'DUMMY', 82, '0082', 82, NULL, '26.0000', '26.0000', '92.3100', '50.0000', '50.0000', '2023-02-03 22:51:47', '2023-02-03 22:51:47', NULL, '[]'),
(83, 'DUMMY', 83, '0083', 83, NULL, '10.0000', '10.0000', '200.0000', '30.0000', '30.0000', '2023-02-03 22:52:50', '2023-02-03 22:52:50', NULL, '[]'),
(84, 'DUMMY', 84, '0084', 84, NULL, '12.0000', '12.0000', '316.6700', '50.0000', '50.0000', '2023-02-03 22:54:12', '2023-02-03 22:54:12', NULL, '[]'),
(85, 'DUMMY', 85, '0085', 85, NULL, '250.0000', '250.0000', '20.0000', '300.0000', '300.0000', '2023-02-03 22:55:19', '2023-02-03 22:55:19', NULL, '[]'),
(86, 'DUMMY', 86, '0086', 86, NULL, '27.0000', '27.0000', '85.1900', '50.0000', '50.0000', '2023-02-03 22:56:24', '2023-02-03 22:56:24', NULL, '[]'),
(87, 'DUMMY', 87, '0087', 87, NULL, '15.0000', '15.0000', '166.6700', '40.0000', '40.0000', '2023-02-03 23:01:08', '2023-02-03 23:01:08', NULL, '[]'),
(88, 'DUMMY', 88, '0088', 88, NULL, '240.0000', '240.0000', '45.8300', '350.0000', '350.0000', '2023-02-03 23:02:54', '2023-02-03 23:02:54', NULL, '[]'),
(89, 'DUMMY', 89, '0089', 89, NULL, '180.0000', '180.0000', '38.8900', '250.0000', '250.0000', '2023-02-03 23:03:57', '2023-02-03 23:03:57', NULL, '[]'),
(90, 'DUMMY', 90, '0090', 90, NULL, '80.0000', '80.0000', '87.5000', '150.0000', '150.0000', '2023-02-03 23:04:55', '2023-02-03 23:04:55', NULL, '[]'),
(91, 'DUMMY', 91, '0091', 91, NULL, '100.0000', '100.0000', '50.0000', '150.0000', '150.0000', '2023-02-03 23:05:59', '2023-02-03 23:05:59', NULL, '[]'),
(92, 'DUMMY', 92, '0092', 92, NULL, '65.0000', '65.0000', '53.8500', '100.0000', '100.0000', '2023-02-03 23:07:07', '2023-02-03 23:07:07', NULL, '[]'),
(93, 'DUMMY', 93, '0093', 93, NULL, '60.0000', '60.0000', '66.6700', '100.0000', '100.0000', '2023-02-03 23:08:20', '2023-02-03 23:08:20', NULL, '[]'),
(94, 'DUMMY', 94, '0094', 94, NULL, '210.0000', '210.0000', '42.8600', '300.0000', '300.0000', '2023-02-03 23:09:57', '2023-02-03 23:09:57', NULL, '[]'),
(95, 'DUMMY', 95, '0095', 95, NULL, '200.0000', '200.0000', '75.0000', '350.0000', '350.0000', '2023-02-03 23:11:01', '2023-02-03 23:11:01', NULL, '[]'),
(96, 'DUMMY', 96, '0096', 96, NULL, '170.0000', '170.0000', '47.0600', '250.0000', '250.0000', '2023-02-03 23:12:02', '2023-02-03 23:12:02', NULL, '[]'),
(97, 'DUMMY', 97, '0097', 97, NULL, '170.0000', '170.0000', '47.0600', '250.0000', '250.0000', '2023-02-03 23:13:08', '2023-02-03 23:15:12', NULL, '[]'),
(98, 'DUMMY', 98, '0098', 98, NULL, '200.0000', '200.0000', '50.0000', '300.0000', '300.0000', '2023-02-03 23:16:41', '2023-02-03 23:16:41', NULL, '[]'),
(99, 'DUMMY', 99, '0099', 99, NULL, '220.0000', '220.0000', '59.0900', '350.0000', '350.0000', '2023-02-03 23:17:58', '2023-02-03 23:17:58', NULL, '[]'),
(100, 'DUMMY', 100, '0100', 100, NULL, '353.0000', '353.0000', '33.1400', '470.0000', '470.0000', '2023-02-03 23:18:46', '2023-02-03 23:18:46', NULL, '[]'),
(101, 'DUMMY', 101, '0101', 101, NULL, '200.0000', '200.0000', '50.0000', '300.0000', '300.0000', '2023-02-03 23:19:11', '2023-02-03 23:19:11', NULL, '[]'),
(102, 'DUMMY', 102, '0102', 102, NULL, '353.0000', '353.0000', '33.1400', '470.0000', '470.0000', '2023-02-03 23:19:19', '2023-02-03 23:19:19', NULL, '[]'),
(103, 'DUMMY', 103, '0103', 103, NULL, '160.0000', '160.0000', '56.2500', '250.0000', '250.0000', '2023-02-03 23:21:03', '2023-02-03 23:21:03', NULL, '[]'),
(104, 'DUMMY', 104, '0104', 104, NULL, '50.0000', '50.0000', '100.0000', '100.0000', '100.0000', '2023-02-03 23:22:00', '2023-02-03 23:22:00', NULL, '[]'),
(105, 'DUMMY', 105, '0105', 105, NULL, '220.0000', '220.0000', '36.3600', '300.0000', '300.0000', '2023-02-03 23:23:33', '2023-02-03 23:23:33', NULL, '[]'),
(106, 'DUMMY', 106, '0106', 106, NULL, '24.0000', '24.0000', '108.3300', '50.0000', '50.0000', '2023-02-03 23:24:31', '2023-02-03 23:24:31', NULL, '[]'),
(107, 'DUMMY', 107, '0107', 107, NULL, '12.0000', '12.0000', '150.0000', '30.0000', '30.0000', '2023-02-03 23:25:30', '2023-02-03 23:25:30', NULL, '[]'),
(108, 'DUMMY', 108, '0108', 108, NULL, '60.0000', '60.0000', '66.6700', '100.0000', '100.0000', '2023-02-03 23:26:25', '2023-02-03 23:26:25', NULL, '[]'),
(109, 'DUMMY', 109, '0109', 109, NULL, '60.0000', '60.0000', '66.6700', '100.0000', '100.0000', '2023-02-03 23:27:19', '2023-02-03 23:27:19', NULL, '[]'),
(110, 'DUMMY', 110, '0110', 110, NULL, '45.0000', '45.0000', '122.2200', '100.0000', '100.0000', '2023-02-03 23:28:20', '2023-02-03 23:28:20', NULL, '[]'),
(111, 'DUMMY', 111, '0111', 111, NULL, '60.0000', '60.0000', '66.6700', '100.0000', '100.0000', '2023-02-03 23:29:15', '2023-02-03 23:29:15', NULL, '[]'),
(112, 'DUMMY', 112, '0112', 112, NULL, '120.0000', '120.0000', '25.0000', '150.0000', '150.0000', '2023-02-03 23:30:20', '2023-02-03 23:30:20', NULL, '[]'),
(113, 'DUMMY', 113, '0113', 113, NULL, '210.0000', '210.0000', '19.0500', '250.0000', '250.0000', '2023-02-03 23:31:17', '2023-02-03 23:31:17', NULL, '[]'),
(114, 'DUMMY', 114, '0114', 114, NULL, '100.0000', '100.0000', '50.0000', '150.0000', '150.0000', '2023-02-03 23:32:07', '2023-02-03 23:32:07', NULL, '[]'),
(115, 'DUMMY', 115, '0115', 115, NULL, '90.0000', '90.0000', '66.6700', '150.0000', '150.0000', '2023-02-03 23:33:00', '2023-02-03 23:33:00', NULL, '[]'),
(116, 'DUMMY', 116, '0116', 116, NULL, '10.0000', '10.0000', '150.0000', '25.0000', '25.0000', '2023-02-03 23:34:00', '2023-02-03 23:34:00', NULL, '[]'),
(117, 'DUMMY', 117, '0117', 117, NULL, '250.0000', '250.0000', '40.0000', '350.0000', '350.0000', '2023-02-03 23:35:18', '2023-02-03 23:35:18', NULL, '[]'),
(118, 'DUMMY', 118, '0118', 118, NULL, '60.0000', '60.0000', '66.6700', '100.0000', '100.0000', '2023-02-03 23:36:15', '2023-02-03 23:36:15', NULL, '[]'),
(119, 'DUMMY', 119, '0119', 119, NULL, '60.0000', '60.0000', '66.6700', '100.0000', '100.0000', '2023-02-03 23:36:58', '2023-02-03 23:36:58', NULL, '[]'),
(120, 'DUMMY', 120, '0120', 120, NULL, '60.0000', '60.0000', '66.6700', '100.0000', '100.0000', '2023-02-03 23:37:41', '2023-02-03 23:37:41', NULL, '[]'),
(121, 'DUMMY', 121, '0121', 121, NULL, '353.0000', '353.0000', '33.1400', '470.0000', '470.0000', '2023-02-03 23:38:11', '2023-02-03 23:38:11', NULL, '[]'),
(122, 'DUMMY', 122, '0122', 122, NULL, '50.0000', '50.0000', '100.0000', '100.0000', '100.0000', '2023-02-03 23:38:29', '2023-02-03 23:38:29', NULL, '[]'),
(123, 'DUMMY', 123, '0123', 123, NULL, '50.0000', '50.0000', '100.0000', '100.0000', '100.0000', '2023-02-03 23:39:28', '2023-02-03 23:39:28', NULL, '[]'),
(124, 'DUMMY', 124, '0124', 124, NULL, '614.0000', '614.0000', '14.0100', '700.0000', '700.0000', '2023-02-03 23:39:52', '2023-02-03 23:39:52', NULL, '[]'),
(125, 'DUMMY', 125, '0125', 125, NULL, '50.0000', '50.0000', '100.0000', '100.0000', '100.0000', '2023-02-03 23:40:18', '2023-02-03 23:40:18', NULL, '[]'),
(126, 'DUMMY', 126, '0126', 126, NULL, '16.0000', '16.0000', '87.5000', '30.0000', '30.0000', '2023-02-03 23:41:07', '2023-02-03 23:41:07', NULL, '[]'),
(127, 'DUMMY', 127, '0127', 127, NULL, '614.0000', '614.0000', '14.0100', '700.0000', '700.0000', '2023-02-03 23:41:35', '2023-02-03 23:41:35', NULL, '[]'),
(128, 'DUMMY', 128, '0128', 128, NULL, '55.0000', '55.0000', '81.8200', '100.0000', '100.0000', '2023-02-03 23:42:06', '2023-02-03 23:42:06', NULL, '[]'),
(129, 'DUMMY', 129, '0129', 129, NULL, '16.0000', '16.0000', '87.5000', '30.0000', '30.0000', '2023-02-03 23:42:53', '2023-02-03 23:42:53', NULL, '[]'),
(130, 'DUMMY', 130, '0130', 130, NULL, '614.0000', '614.0000', '14.0100', '700.0000', '700.0000', '2023-02-03 23:42:56', '2023-02-03 23:42:56', NULL, '[]'),
(131, 'DUMMY', 131, '0131', 131, NULL, '210.0000', '210.0000', '42.8600', '300.0000', '300.0000', '2023-02-03 23:43:41', '2023-02-03 23:43:41', NULL, '[]'),
(132, 'DUMMY', 132, '0132', 132, NULL, '614.0000', '614.0000', '14.0100', '700.0000', '700.0000', '2023-02-03 23:44:02', '2023-02-03 23:44:02', NULL, '[]'),
(133, 'DUMMY', 133, '0133', 133, NULL, '55.0000', '55.0000', '81.8200', '100.0000', '100.0000', '2023-02-03 23:44:18', '2023-02-03 23:44:18', NULL, '[]'),
(134, 'DUMMY', 134, '0134', 134, NULL, '36.0000', '36.0000', '177.7800', '100.0000', '100.0000', '2023-02-03 23:45:00', '2023-02-03 23:45:00', NULL, '[]'),
(135, 'DUMMY', 135, '0135', 135, NULL, '31.0000', '31.0000', '158.0600', '80.0000', '80.0000', '2023-02-03 23:45:47', '2023-02-03 23:45:47', NULL, '[]'),
(136, 'DUMMY', 136, '0136', 136, NULL, '520.0000', '520.0000', '34.6200', '700.0000', '700.0000', '2023-02-03 23:45:54', '2023-02-03 23:45:54', NULL, '[]'),
(137, 'DUMMY', 137, '0137', 137, NULL, '50.0000', '50.0000', '100.0000', '100.0000', '100.0000', '2023-02-03 23:46:54', '2023-02-03 23:46:54', NULL, '[]'),
(138, 'DUMMY', 138, '0138', 138, NULL, '285.0000', '285.0000', '29.8200', '370.0000', '370.0000', '2023-02-03 23:47:51', '2023-02-03 23:47:51', NULL, '[]'),
(139, 'DUMMY', 139, '0139', 139, NULL, '41.0000', '41.0000', '143.9000', '100.0000', '100.0000', '2023-02-03 23:47:51', '2023-02-03 23:47:51', NULL, '[]'),
(140, 'DUMMY', 140, '0140', 140, NULL, '280.0000', '280.0000', '17.8600', '330.0000', '330.0000', '2023-02-03 23:48:36', '2023-02-03 23:48:36', NULL, '[]'),
(141, 'DUMMY', 141, '0141', 141, NULL, '285.0000', '285.0000', '29.8200', '370.0000', '370.0000', '2023-02-03 23:49:06', '2023-02-03 23:49:06', NULL, '[]'),
(142, 'DUMMY', 142, '0142', 142, NULL, '150.0000', '150.0000', '33.3300', '200.0000', '200.0000', '2023-02-03 23:49:45', '2023-02-03 23:49:45', NULL, '[]'),
(143, 'DUMMY', 143, '0143', 143, NULL, '285.0000', '285.0000', '29.8200', '370.0000', '370.0000', '2023-02-03 23:50:28', '2023-02-03 23:50:28', NULL, '[]'),
(144, 'DUMMY', 144, '0144', 144, NULL, '250.0000', '250.0000', '40.0000', '350.0000', '350.0000', '2023-02-03 23:50:43', '2023-02-03 23:50:43', NULL, '[]'),
(145, 'DUMMY', 145, '0145', 145, NULL, '285.0000', '285.0000', '29.8200', '370.0000', '370.0000', '2023-02-03 23:51:22', '2023-02-03 23:51:22', NULL, '[]'),
(146, 'DUMMY', 146, '0146', 146, NULL, '150.0000', '150.0000', '33.3300', '200.0000', '200.0000', '2023-02-03 23:51:33', '2023-02-03 23:51:33', NULL, '[]'),
(147, 'DUMMY', 147, '0147', 147, NULL, '285.0000', '285.0000', '29.8200', '370.0000', '370.0000', '2023-02-03 23:52:39', '2023-02-03 23:52:39', NULL, '[]'),
(148, 'DUMMY', 148, '0148', 148, NULL, '170.0000', '170.0000', '47.0600', '250.0000', '250.0000', '2023-02-03 23:52:41', '2023-02-03 23:52:41', NULL, '[]'),
(149, 'DUMMY', 149, '0149', 149, NULL, '130.0000', '130.0000', '53.8500', '200.0000', '200.0000', '2023-02-03 23:53:41', '2023-02-03 23:53:41', NULL, '[]'),
(150, 'DUMMY', 150, '0150', 150, NULL, '160.0000', '160.0000', '25.0000', '200.0000', '200.0000', '2023-02-03 23:54:30', '2023-02-03 23:54:30', NULL, '[]'),
(151, 'DUMMY', 151, '0151', 151, NULL, '200.0000', '200.0000', '25.0000', '250.0000', '250.0000', '2023-02-03 23:55:28', '2023-02-03 23:55:28', NULL, '[]'),
(152, 'DUMMY', 152, '0152', 152, NULL, '230.0000', '230.0000', '30.4300', '300.0000', '300.0000', '2023-02-03 23:56:33', '2023-02-03 23:56:33', NULL, '[]'),
(153, 'DUMMY', 153, '0153', 153, NULL, '285.0000', '285.0000', '29.8200', '370.0000', '370.0000', '2023-02-03 23:57:17', '2023-02-03 23:57:17', NULL, '[]'),
(154, 'DUMMY', 154, '0154', 154, NULL, '120.0000', '120.0000', '33.3300', '160.0000', '160.0000', '2023-02-03 23:58:34', '2023-02-03 23:58:34', NULL, '[]'),
(155, 'DUMMY', 155, '0155', 155, NULL, '285.0000', '285.0000', '29.8200', '370.0000', '370.0000', '2023-02-03 23:59:50', '2023-02-03 23:59:50', NULL, '[]'),
(156, 'DUMMY', 156, '0156', 156, NULL, '60.0000', '60.0000', '66.6700', '100.0000', '100.0000', '2023-02-03 23:59:57', '2023-02-03 23:59:57', NULL, '[]'),
(157, 'DUMMY', 157, '0157', 157, NULL, '60.0000', '60.0000', '66.6700', '100.0000', '100.0000', '2023-02-04 00:00:50', '2023-02-04 00:00:50', NULL, '[]'),
(158, 'DUMMY', 158, '0158', 158, NULL, '570.0000', '570.0000', '14.0400', '650.0000', '650.0000', '2023-02-04 00:01:13', '2023-02-04 00:01:13', NULL, '[]'),
(159, 'DUMMY', 159, '0159', 159, NULL, '45.0000', '45.0000', '100.0000', '90.0000', '90.0000', '2023-02-04 00:01:46', '2023-02-04 00:01:46', NULL, '[]'),
(160, 'DUMMY', 160, '0160', 160, NULL, '45.0000', '45.0000', '122.2200', '100.0000', '100.0000', '2023-02-04 00:02:30', '2023-02-04 00:02:30', NULL, '[]'),
(161, 'DUMMY', 161, '0161', 161, NULL, '570.0000', '570.0000', '14.0400', '650.0000', '650.0000', '2023-02-04 00:02:50', '2023-02-04 00:02:50', NULL, '[]'),
(162, 'DUMMY', 162, '0162', 162, NULL, '20.0000', '20.0000', '150.0000', '50.0000', '50.0000', '2023-02-04 00:03:33', '2023-02-04 00:03:33', NULL, '[]'),
(163, 'DUMMY', 163, '0163', 163, NULL, '570.0000', '570.0000', '14.0400', '650.0000', '650.0000', '2023-02-04 00:03:57', '2023-02-04 00:03:57', NULL, '[]'),
(164, 'DUMMY', 164, '0164', 164, NULL, '300.0000', '300.0000', '33.3300', '400.0000', '400.0000', '2023-02-04 00:04:25', '2023-02-04 00:04:25', NULL, '[]'),
(165, 'DUMMY', 165, '0165', 165, NULL, '570.0000', '570.0000', '14.0400', '650.0000', '650.0000', '2023-02-04 00:05:06', '2023-02-04 00:05:06', NULL, '[]'),
(166, 'DUMMY', 166, '0166', 166, NULL, '60.0000', '60.0000', '66.6700', '100.0000', '100.0000', '2023-02-04 00:05:06', '2023-02-04 00:05:06', NULL, '[]'),
(167, 'DUMMY', 167, '0167', 167, NULL, '64.0000', '64.0000', '9.3800', '70.0000', '70.0000', '2023-02-04 00:06:18', '2023-02-04 00:06:18', NULL, '[]'),
(168, 'DUMMY', 168, '0168', 168, NULL, '0.4000', '0.4000', '1150.0000', '5.0000', '5.0000', '2023-02-04 00:06:55', '2023-02-04 00:06:55', NULL, '[]'),
(169, 'DUMMY', 169, '0169', 169, NULL, '64.0000', '64.0000', '9.3800', '70.0000', '70.0000', '2023-02-04 00:07:26', '2023-02-04 00:07:26', NULL, '[]'),
(170, 'DUMMY', 170, '0170', 170, NULL, '64.0000', '64.0000', '9.3800', '70.0000', '70.0000', '2023-02-04 00:08:37', '2023-02-04 00:08:37', NULL, '[]'),
(171, 'DUMMY', 171, '0171', 171, NULL, '210.0000', '210.0000', '19.0500', '250.0000', '250.0000', '2023-02-04 00:08:39', '2023-02-04 00:08:39', NULL, '[]'),
(172, 'DUMMY', 172, '0172', 172, NULL, '200.0000', '200.0000', '25.0000', '250.0000', '250.0000', '2023-02-04 00:09:32', '2023-02-04 00:09:32', NULL, '[]'),
(173, 'DUMMY', 173, '0173', 173, NULL, '50.0000', '50.0000', '40.0000', '70.0000', '70.0000', '2023-02-04 00:09:40', '2023-02-04 00:09:40', NULL, '[]'),
(174, 'DUMMY', 174, '0174', 174, NULL, '30.0000', '30.0000', '66.6700', '50.0000', '50.0000', '2023-02-04 00:10:20', '2023-02-04 00:10:20', NULL, '[]'),
(175, 'DUMMY', 175, '0175', 175, NULL, '64.0000', '64.0000', '9.3800', '70.0000', '70.0000', '2023-02-04 00:10:59', '2023-02-04 00:10:59', NULL, '[]'),
(176, 'DUMMY', 176, '0176', 176, NULL, '30.0000', '30.0000', '66.6700', '50.0000', '50.0000', '2023-02-04 00:11:31', '2023-02-04 00:11:31', NULL, '[]'),
(177, 'DUMMY', 177, '0177', 177, NULL, '50.0000', '50.0000', '100.0000', '100.0000', '100.0000', '2023-02-04 00:12:18', '2023-02-04 00:12:18', NULL, '[]'),
(178, 'DUMMY', 178, '0178', 178, NULL, '64.0000', '64.0000', '9.3800', '70.0000', '70.0000', '2023-02-04 00:12:19', '2023-02-04 00:12:19', NULL, '[]'),
(179, 'DUMMY', 179, '0179', 179, NULL, '4.0000', '4.0000', '150.0000', '10.0000', '10.0000', '2023-02-04 00:13:08', '2023-02-04 00:13:08', NULL, '[]'),
(180, 'DUMMY', 180, '0180', 180, NULL, '35.0000', '35.0000', '42.8600', '50.0000', '50.0000', '2023-02-04 00:14:56', '2023-02-04 00:14:56', NULL, '[]'),
(181, 'DUMMY', 181, '0181', 181, NULL, '30.0000', '30.0000', '66.6700', '50.0000', '50.0000', '2023-02-04 00:15:51', '2023-02-04 00:15:51', NULL, '[]'),
(182, 'DUMMY', 182, '0182', 182, NULL, '12.0000', '12.0000', '150.0000', '30.0000', '30.0000', '2023-02-04 00:17:10', '2023-02-04 00:17:10', NULL, '[]'),
(183, 'DUMMY', 183, '0183', 183, NULL, '100.0000', '100.0000', '50.0000', '150.0000', '150.0000', '2023-02-04 00:18:15', '2023-02-04 00:18:15', NULL, '[]'),
(184, 'DUMMY', 184, '0184', 184, NULL, '20.0000', '20.0000', '150.0000', '50.0000', '50.0000', '2023-02-04 00:19:06', '2023-02-04 00:19:06', NULL, '[]'),
(185, 'DUMMY', 185, '0185', 185, NULL, '17.0000', '17.0000', '76.4700', '30.0000', '30.0000', '2023-02-04 00:19:54', '2023-02-04 00:19:54', NULL, '[]'),
(186, 'DUMMY', 186, '0186', 186, NULL, '250.0000', '250.0000', '20.0000', '300.0000', '300.0000', '2023-02-04 00:21:38', '2023-02-04 00:21:38', NULL, '[]'),
(187, 'DUMMY', 187, '0187', 187, NULL, '90.0000', '90.0000', '55.5600', '140.0000', '140.0000', '2023-02-04 00:22:37', '2023-02-04 00:22:37', NULL, '[]'),
(188, 'DUMMY', 188, '0188', 188, NULL, '100.0000', '100.0000', '50.0000', '150.0000', '150.0000', '2023-02-04 00:23:24', '2023-02-04 00:23:24', NULL, '[]'),
(189, 'DUMMY', 189, '0189', 189, NULL, '8.0000', '8.0000', '275.0000', '30.0000', '30.0000', '2023-02-04 00:24:28', '2023-02-04 00:24:28', NULL, '[]'),
(190, 'DUMMY', 190, '0190', 190, NULL, '40.0000', '40.0000', '150.0000', '100.0000', '100.0000', '2023-02-04 00:25:14', '2023-02-04 00:25:14', NULL, '[]'),
(191, 'DUMMY', 191, '0191', 191, NULL, '15.0000', '15.0000', '100.0000', '30.0000', '30.0000', '2023-02-04 00:25:59', '2023-02-04 00:25:59', NULL, '[]'),
(192, 'DUMMY', 192, '0192', 192, NULL, '64.0000', '64.0000', '40.6300', '90.0000', '90.0000', '2023-02-04 00:26:49', '2023-02-04 00:26:49', NULL, '[]'),
(193, 'DUMMY', 193, '0193', 193, NULL, '20.0000', '20.0000', '150.0000', '50.0000', '50.0000', '2023-02-04 00:28:44', '2023-02-04 00:28:44', NULL, '[]'),
(194, 'DUMMY', 194, '0194', 194, NULL, '45.0000', '45.0000', '55.5600', '70.0000', '70.0000', '2023-02-04 00:29:29', '2023-02-04 00:29:29', NULL, '[]'),
(195, 'DUMMY', 195, '0195', 195, NULL, '30.0000', '30.0000', '66.6700', '50.0000', '50.0000', '2023-02-04 00:30:18', '2023-02-04 00:30:18', NULL, '[]'),
(196, 'DUMMY', 196, '0196', 196, NULL, '16.0000', '16.0000', '212.5000', '50.0000', '50.0000', '2023-02-04 00:31:07', '2023-02-04 00:31:07', NULL, '[]'),
(197, 'DUMMY', 197, '0197', 197, NULL, '20.0000', '20.0000', '150.0000', '50.0000', '50.0000', '2023-02-04 00:31:50', '2023-02-04 00:31:50', NULL, '[]'),
(198, 'DUMMY', 198, '0198', 198, NULL, '25.0000', '25.0000', '100.0000', '50.0000', '50.0000', '2023-02-04 00:32:44', '2023-02-04 00:32:44', NULL, '[]'),
(199, 'DUMMY', 199, '0199', 199, NULL, '64.0000', '64.0000', '9.3800', '70.0000', '70.0000', '2023-02-04 00:32:55', '2023-02-04 00:32:55', NULL, '[]'),
(200, 'DUMMY', 200, '0200', 200, NULL, '23.0000', '23.0000', '117.3900', '50.0000', '50.0000', '2023-02-04 00:33:25', '2023-02-04 00:33:25', NULL, '[]'),
(201, 'DUMMY', 201, '0201', 201, NULL, '64.0000', '64.0000', '9.3800', '70.0000', '70.0000', '2023-02-04 00:33:52', '2023-02-04 00:33:52', NULL, '[]'),
(202, 'DUMMY', 202, '0202', 202, NULL, '15.0000', '15.0000', '100.0000', '30.0000', '30.0000', '2023-02-04 00:34:17', '2023-02-04 00:34:17', NULL, '[]'),
(203, 'DUMMY', 203, '0203', 203, NULL, '64.0000', '64.0000', '9.3800', '70.0000', '70.0000', '2023-02-04 00:34:48', '2023-02-04 00:34:48', NULL, '[]'),
(204, 'DUMMY', 204, '0204', 204, NULL, '15.0000', '15.0000', '233.3300', '50.0000', '50.0000', '2023-02-04 00:35:23', '2023-02-04 00:37:14', NULL, '[]'),
(205, 'DUMMY', 205, '0205', 205, NULL, '64.0000', '64.0000', '9.3800', '70.0000', '70.0000', '2023-02-04 00:35:51', '2023-02-04 00:35:51', NULL, '[]'),
(206, 'DUMMY', 206, '0206', 206, NULL, '64.0000', '64.0000', '9.3800', '70.0000', '70.0000', '2023-02-04 00:36:44', '2023-02-04 00:38:34', NULL, '[]'),
(207, 'DUMMY', 207, '0207', 207, NULL, '50.0000', '50.0000', '100.0000', '100.0000', '100.0000', '2023-02-04 00:37:56', '2023-02-04 00:37:56', NULL, '[]'),
(208, 'DUMMY', 208, '0208', 208, NULL, '50.0000', '50.0000', '100.0000', '100.0000', '100.0000', '2023-02-04 00:38:41', '2023-02-04 00:38:41', NULL, '[]'),
(209, 'DUMMY', 209, '0209', 209, NULL, '15.0000', '15.0000', '100.0000', '30.0000', '30.0000', '2023-02-04 00:39:24', '2023-02-04 00:39:24', NULL, '[]'),
(210, 'DUMMY', 210, '0210', 210, NULL, '17.0000', '17.0000', '135.2900', '40.0000', '40.0000', '2023-02-04 00:40:07', '2023-02-04 00:40:07', NULL, '[]'),
(211, 'DUMMY', 211, '0211', 211, NULL, '64.0000', '64.0000', '9.3800', '70.0000', '70.0000', '2023-02-04 00:40:09', '2023-02-04 00:40:09', NULL, '[]'),
(212, 'DUMMY', 212, '0212', 212, NULL, '30.0000', '30.0000', '66.6700', '50.0000', '50.0000', '2023-02-04 00:40:47', '2023-02-04 00:40:47', NULL, '[]'),
(213, 'DUMMY', 213, '0213', 213, NULL, '64.0000', '64.0000', '9.3800', '70.0000', '70.0000', '2023-02-04 00:41:13', '2023-02-04 00:41:13', NULL, '[]'),
(214, 'DUMMY', 214, '0214', 214, NULL, '140.0000', '140.0000', '42.8600', '200.0000', '200.0000', '2023-02-04 00:41:34', '2023-02-04 00:41:34', NULL, '[]'),
(215, 'DUMMY', 215, '0215', 215, NULL, '250.0000', '250.0000', '20.0000', '300.0000', '300.0000', '2023-02-04 00:42:17', '2023-02-04 00:42:17', NULL, '[]'),
(216, 'DUMMY', 216, '0216', 216, NULL, '64.0000', '64.0000', '9.3800', '70.0000', '70.0000', '2023-02-04 00:42:33', '2023-02-04 00:42:33', NULL, '[]'),
(217, 'DUMMY', 217, '0217', 217, NULL, '13.0000', '13.0000', '92.3100', '25.0000', '25.0000', '2023-02-04 00:43:03', '2023-02-04 00:43:03', NULL, '[]'),
(218, 'DUMMY', 218, '0218', 218, NULL, '64.0000', '64.0000', '9.3800', '70.0000', '70.0000', '2023-02-04 00:43:30', '2023-02-04 00:43:30', NULL, '[]'),
(219, 'DUMMY', 219, '0219', 219, NULL, '300.0000', '300.0000', '16.6700', '350.0000', '350.0000', '2023-02-04 00:43:54', '2023-02-04 00:44:40', NULL, '[]'),
(220, 'DUMMY', 220, '0220', 220, NULL, '64.0000', '64.0000', '9.3800', '70.0000', '70.0000', '2023-02-04 00:44:25', '2023-02-04 00:44:25', NULL, '[]'),
(221, 'DUMMY', 221, '0221', 221, NULL, '90.0000', '90.0000', '38.8900', '125.0000', '125.0000', '2023-02-04 00:45:29', '2023-02-04 00:45:29', NULL, '[]'),
(222, 'DUMMY', 222, '0222', 222, NULL, '17.0000', '17.0000', '76.4700', '30.0000', '30.0000', '2023-02-04 00:45:31', '2023-02-04 00:45:31', NULL, '[]'),
(223, 'DUMMY', 223, '0223', 223, NULL, '18.0000', '18.0000', '177.7800', '50.0000', '50.0000', '2023-02-04 00:46:22', '2023-02-04 00:46:22', NULL, '[]'),
(224, 'DUMMY', 224, '0224', 224, NULL, '90.0000', '90.0000', '16.6700', '105.0000', '105.0000', '2023-02-04 00:46:36', '2023-02-04 00:46:36', NULL, '[]'),
(225, 'DUMMY', 225, '0225', 225, NULL, '90.0000', '90.0000', '38.8900', '125.0000', '125.0000', '2023-02-04 00:46:51', '2023-02-04 00:46:51', NULL, '[]'),
(226, 'DUMMY', 226, '0226', 226, NULL, '65.0000', '65.0000', '53.8500', '100.0000', '100.0000', '2023-02-04 00:47:07', '2023-02-04 00:47:07', NULL, '[]'),
(227, 'DUMMY', 227, '0227', 227, NULL, '90.0000', '90.0000', '38.8900', '125.0000', '125.0000', '2023-02-04 00:47:43', '2023-02-04 00:47:43', NULL, '[]'),
(228, 'DUMMY', 228, '0228', 228, NULL, '35.0000', '35.0000', '100.0000', '70.0000', '70.0000', '2023-02-04 00:47:53', '2023-02-04 00:47:53', NULL, '[]'),
(229, 'DUMMY', 229, '0229', 229, NULL, '410.0000', '410.0000', '9.7600', '450.0000', '450.0000', '2023-02-04 00:48:38', '2023-02-04 00:48:38', NULL, '[]'),
(230, 'DUMMY', 230, '0230', 230, NULL, '12.0000', '12.0000', '316.6700', '50.0000', '50.0000', '2023-02-04 00:48:43', '2023-02-04 00:48:43', NULL, '[]'),
(231, 'DUMMY', 231, '0231', 231, NULL, '23.0000', '23.0000', '117.3900', '50.0000', '50.0000', '2023-02-04 00:49:27', '2023-02-04 00:49:27', NULL, '[]'),
(232, 'DUMMY', 232, '0232', 232, NULL, '410.0000', '410.0000', '9.7600', '450.0000', '450.0000', '2023-02-04 00:49:43', '2023-02-04 00:49:43', NULL, '[]'),
(233, 'DUMMY', 233, '0233', 233, NULL, '50.0000', '50.0000', '100.0000', '100.0000', '100.0000', '2023-02-04 00:50:13', '2023-02-04 00:50:13', NULL, '[]'),
(234, 'DUMMY', 234, '0234', 234, NULL, '410.0000', '410.0000', '9.7600', '450.0000', '450.0000', '2023-02-04 00:51:23', '2023-02-04 00:51:23', NULL, '[]'),
(235, 'DUMMY', 235, '0235', 235, NULL, '2.0000', '2.0000', '400.0000', '10.0000', '10.0000', '2023-02-04 00:52:24', '2023-02-04 00:52:24', NULL, '[]'),
(236, 'DUMMY', 236, '0236', 236, NULL, '200.0000', '200.0000', '20.0000', '240.0000', '240.0000', '2023-02-04 00:53:16', '2023-02-04 00:53:16', NULL, '[]'),
(237, 'DUMMY', 237, '0237', 237, NULL, '100.0000', '100.0000', '30.0000', '130.0000', '130.0000', '2023-02-04 00:53:57', '2023-02-04 00:53:57', NULL, '[]'),
(238, 'DUMMY', 238, '0238', 238, NULL, '50.0000', '50.0000', '20.0000', '60.0000', '60.0000', '2023-02-04 00:54:39', '2023-02-04 00:54:39', NULL, '[]'),
(239, 'DUMMY', 239, '0239', 239, NULL, '53.0000', '53.0000', '22.6400', '65.0000', '65.0000', '2023-02-04 00:54:55', '2023-02-04 00:54:55', NULL, '[]'),
(240, 'DUMMY', 240, '0240', 240, NULL, '200.0000', '200.0000', '25.0000', '250.0000', '250.0000', '2023-02-04 00:55:43', '2023-02-04 00:55:43', NULL, '[]'),
(241, 'DUMMY', 241, '0241', 241, NULL, '50.0000', '50.0000', '20.0000', '60.0000', '60.0000', '2023-02-04 00:55:45', '2023-02-04 00:55:45', NULL, '[]'),
(242, 'DUMMY', 242, '0242', 242, NULL, '700.0000', '700.0000', '11.4300', '780.0000', '780.0000', '2023-02-04 00:56:36', '2023-02-04 00:56:36', NULL, '[]'),
(243, 'DUMMY', 243, '0243', 243, NULL, '50.0000', '50.0000', '20.0000', '60.0000', '60.0000', '2023-02-04 00:56:46', '2023-02-04 00:56:46', NULL, '[]'),
(244, 'DUMMY', 244, '0244', 244, NULL, '120.0000', '120.0000', '33.3300', '160.0000', '160.0000', '2023-02-04 00:57:23', '2023-02-04 00:57:23', NULL, '[]'),
(245, 'DUMMY', 245, '0245', 245, NULL, '344.0000', '344.0000', '27.9100', '440.0000', '440.0000', '2023-02-04 00:57:50', '2023-02-04 00:57:50', NULL, '[]'),
(246, 'DUMMY', 246, '0246', 246, NULL, '100.0000', '100.0000', '50.0000', '150.0000', '150.0000', '2023-02-04 00:58:13', '2023-02-04 00:58:13', NULL, '[]'),
(247, 'DUMMY', 247, '0247', 247, NULL, '175.0000', '175.0000', '2.8600', '180.0000', '180.0000', '2023-02-04 00:58:48', '2023-02-04 00:58:48', NULL, '[]'),
(248, 'DUMMY', 248, '0248', 248, NULL, '175.0000', '175.0000', '31.4300', '230.0000', '230.0000', '2023-02-04 00:59:00', '2023-02-04 00:59:00', NULL, '[]'),
(249, 'DUMMY', 249, '0249', 249, NULL, '230.0000', '230.0000', '30.4300', '300.0000', '300.0000', '2023-02-04 00:59:17', '2023-02-04 00:59:17', NULL, '[]'),
(250, 'DUMMY', 250, '0250', 250, NULL, '175.0000', '175.0000', '31.4300', '230.0000', '230.0000', '2023-02-04 00:59:56', '2023-02-04 00:59:56', NULL, '[]'),
(251, 'DUMMY', 251, '0251', 251, NULL, '30.0000', '30.0000', '66.6700', '50.0000', '50.0000', '2023-02-04 01:00:01', '2023-02-04 01:00:01', NULL, '[]'),
(252, 'DUMMY', 252, '0252', 252, NULL, '40.0000', '40.0000', '75.0000', '70.0000', '70.0000', '2023-02-04 01:00:40', '2023-02-04 01:00:40', NULL, '[]'),
(253, 'DUMMY', 253, '0253', 253, NULL, '175.0000', '175.0000', '31.4300', '230.0000', '230.0000', '2023-02-04 01:00:53', '2023-02-04 01:00:53', NULL, '[]'),
(254, 'DUMMY', 254, '0254', 254, NULL, '50.0000', '50.0000', '100.0000', '100.0000', '100.0000', '2023-02-04 01:01:20', '2023-02-04 01:01:20', NULL, '[]'),
(255, 'DUMMY', 255, '0255', 255, NULL, '175.0000', '175.0000', '31.4300', '230.0000', '230.0000', '2023-02-04 01:01:48', '2023-02-04 01:01:48', NULL, '[]'),
(256, 'DUMMY', 256, '0256', 256, NULL, '60.0000', '60.0000', '66.6700', '100.0000', '100.0000', '2023-02-04 01:02:10', '2023-02-04 01:02:10', NULL, '[]'),
(257, 'DUMMY', 257, '0257', 257, NULL, '51.0000', '51.0000', '27.4500', '65.0000', '65.0000', '2023-02-04 01:02:44', '2023-02-04 01:02:44', NULL, '[]'),
(258, 'DUMMY', 258, '0258', 258, NULL, '24.0000', '24.0000', '108.3300', '50.0000', '50.0000', '2023-02-04 01:03:08', '2023-02-04 01:03:08', NULL, '[]'),
(259, 'DUMMY', 259, '0259', 259, NULL, '51.0000', '51.0000', '27.4500', '65.0000', '65.0000', '2023-02-04 01:03:53', '2023-02-04 01:03:53', NULL, '[]'),
(260, 'DUMMY', 260, '0260', 260, NULL, '18.0000', '18.0000', '66.6700', '30.0000', '30.0000', '2023-02-04 01:03:53', '2023-02-04 01:03:53', NULL, '[]'),
(261, 'DUMMY', 261, '0261', 261, NULL, '51.0000', '51.0000', '27.4500', '65.0000', '65.0000', '2023-02-04 01:04:45', '2023-02-04 01:04:45', NULL, '[]'),
(262, 'DUMMY', 262, '0262', 262, NULL, '30.0000', '30.0000', '100.0000', '60.0000', '60.0000', '2023-02-04 01:04:47', '2023-02-04 01:05:36', NULL, '[]'),
(263, 'DUMMY', 263, '0263', 263, NULL, '326.0000', '326.0000', '22.7000', '400.0000', '400.0000', '2023-02-04 01:05:44', '2023-02-04 01:05:44', NULL, '[]'),
(264, 'DUMMY', 264, '0264', 264, NULL, '30.0000', '30.0000', '66.6700', '50.0000', '50.0000', '2023-02-04 01:06:20', '2023-02-04 01:06:20', NULL, '[]'),
(265, 'DUMMY', 265, '0265', 265, NULL, '325.0000', '325.0000', '23.0800', '400.0000', '400.0000', '2023-02-04 01:06:39', '2023-02-04 01:06:39', NULL, '[]'),
(266, 'DUMMY', 266, '0266', 266, NULL, '30.0000', '30.0000', '166.6700', '80.0000', '80.0000', '2023-02-04 01:07:12', '2023-02-04 01:07:12', NULL, '[]'),
(267, 'DUMMY', 267, '0267', 267, NULL, '476.0000', '476.0000', '15.5500', '550.0000', '550.0000', '2023-02-04 01:07:59', '2023-02-04 01:07:59', NULL, '[]'),
(268, 'DUMMY', 268, '0268', 268, NULL, '30.0000', '30.0000', '166.6700', '80.0000', '80.0000', '2023-02-04 01:08:55', '2023-02-04 01:08:55', NULL, '[]'),
(269, 'DUMMY', 269, '0269', 269, NULL, '476.0000', '476.0000', '15.5500', '550.0000', '550.0000', '2023-02-04 01:09:04', '2023-02-04 01:09:04', NULL, '[]'),
(270, 'DUMMY', 270, '0270', 270, NULL, '476.0000', '476.0000', '15.5500', '550.0000', '550.0000', '2023-02-04 01:10:15', '2023-02-04 01:10:15', NULL, '[]'),
(271, 'DUMMY', 271, '0271', 271, NULL, '8.0000', '8.0000', '150.0000', '20.0000', '20.0000', '2023-02-04 01:11:07', '2023-02-04 01:11:57', NULL, '[]'),
(272, 'DUMMY', 272, '0272', 272, NULL, '25.0000', '25.0000', '100.0000', '50.0000', '50.0000', '2023-02-04 01:12:39', '2023-02-04 01:12:39', NULL, '[]'),
(273, 'DUMMY', 273, '0273', 273, NULL, '30.0000', '30.0000', '66.6700', '50.0000', '50.0000', '2023-02-04 01:13:26', '2023-02-04 01:13:26', NULL, '[]'),
(274, 'DUMMY', 274, '0274', 274, NULL, '190.0000', '190.0000', '26.3200', '240.0000', '240.0000', '2023-02-04 01:13:44', '2023-02-04 01:13:44', NULL, '[]'),
(275, 'DUMMY', 275, '0275', 275, NULL, '25.0000', '25.0000', '100.0000', '50.0000', '50.0000', '2023-02-04 01:14:17', '2023-02-04 01:14:17', NULL, '[]'),
(276, 'DUMMY', 276, '0276', 276, NULL, '190.0000', '190.0000', '26.3200', '240.0000', '240.0000', '2023-02-04 01:14:35', '2023-02-04 01:14:35', NULL, '[]'),
(277, 'DUMMY', 277, '0277', 277, NULL, '50.0000', '50.0000', '60.0000', '80.0000', '80.0000', '2023-02-04 01:15:00', '2023-02-04 01:15:00', NULL, '[]'),
(278, 'DUMMY', 278, '0278', 278, NULL, '190.0000', '190.0000', '26.3200', '240.0000', '240.0000', '2023-02-04 01:15:21', '2023-02-04 01:15:21', NULL, '[]'),
(279, 'DUMMY', 279, '0279', 279, NULL, '110.0000', '110.0000', '54.5500', '170.0000', '170.0000', '2023-02-04 01:16:04', '2023-02-04 01:16:04', NULL, '[]'),
(280, 'DUMMY', 280, '0280', 280, NULL, '190.0000', '190.0000', '26.3200', '240.0000', '240.0000', '2023-02-04 01:16:13', '2023-02-04 01:16:13', NULL, '[]'),
(281, 'DUMMY', 281, '0281', 281, NULL, '100.0000', '100.0000', '50.0000', '150.0000', '150.0000', '2023-02-04 01:17:05', '2023-02-04 01:17:05', NULL, '[]'),
(282, 'DUMMY', 282, '0282', 282, NULL, '422.0000', '422.0000', '18.4800', '500.0000', '500.0000', '2023-02-04 01:17:54', '2023-02-04 01:17:54', NULL, '[]'),
(283, 'DUMMY', 283, '0283', 283, NULL, '80.0000', '80.0000', '50.0000', '120.0000', '120.0000', '2023-02-04 01:17:57', '2023-02-04 01:17:57', NULL, '[]'),
(284, 'DUMMY', 284, '0284', 284, NULL, '50.0000', '50.0000', '80.0000', '90.0000', '90.0000', '2023-02-04 01:18:56', '2023-02-04 01:18:56', NULL, '[]'),
(285, 'DUMMY', 285, '0285', 285, NULL, '422.0000', '422.0000', '18.4800', '500.0000', '500.0000', '2023-02-04 01:19:15', '2023-02-04 01:19:15', NULL, '[]'),
(286, 'DUMMY', 286, '0286', 286, NULL, '45.0000', '45.0000', '77.7800', '80.0000', '80.0000', '2023-02-04 01:19:46', '2023-02-04 01:19:46', NULL, '[]'),
(287, 'DUMMY', 287, '0287', 287, NULL, '45.0000', '45.0000', '77.7800', '80.0000', '80.0000', '2023-02-04 01:20:31', '2023-02-04 01:20:31', NULL, '[]'),
(288, 'DUMMY', 288, '0288', 288, NULL, '663.0000', '663.0000', '13.1200', '750.0000', '750.0000', '2023-02-04 01:21:02', '2023-02-04 01:21:02', NULL, '[]'),
(289, 'DUMMY', 289, '0289', 289, NULL, '45.0000', '45.0000', '77.7800', '80.0000', '80.0000', '2023-02-04 01:21:37', '2023-02-04 01:21:37', NULL, '[]'),
(290, 'DUMMY', 290, '0290', 290, NULL, '663.0000', '663.0000', '13.1200', '750.0000', '750.0000', '2023-02-04 01:22:23', '2023-02-04 01:22:23', NULL, '[]'),
(291, 'DUMMY', 291, '0291', 291, NULL, '45.0000', '45.0000', '77.7800', '80.0000', '80.0000', '2023-02-04 01:22:29', '2023-02-04 01:22:29', NULL, '[]'),
(292, 'DUMMY', 292, '0292', 292, NULL, '260.0000', '260.0000', '34.6200', '350.0000', '350.0000', '2023-02-04 01:23:27', '2023-02-04 01:23:27', NULL, '[]'),
(293, 'DUMMY', 293, '0293', 293, NULL, '663.0000', '663.0000', '13.1200', '750.0000', '750.0000', '2023-02-04 01:23:27', '2023-02-04 01:23:27', NULL, '[]'),
(294, 'DUMMY', 294, '0294', 294, NULL, '30.0000', '30.0000', '66.6700', '50.0000', '50.0000', '2023-02-04 01:24:14', '2023-02-04 01:24:14', NULL, '[]'),
(295, 'DUMMY', 295, '0295', 295, NULL, '663.0000', '663.0000', '13.1200', '750.0000', '750.0000', '2023-02-04 01:24:40', '2023-02-04 01:24:40', NULL, '[]'),
(296, 'DUMMY', 296, '0296', 296, NULL, '135.0000', '135.0000', '48.1500', '200.0000', '200.0000', '2023-02-04 01:25:09', '2023-02-04 01:25:09', NULL, '[]'),
(297, 'DUMMY', 297, '0297', 297, NULL, '135.0000', '135.0000', '48.1500', '200.0000', '200.0000', '2023-02-04 01:25:53', '2023-02-04 01:25:53', NULL, '[]'),
(298, 'DUMMY', 298, '0298', 298, NULL, '60.0000', '60.0000', '16.6700', '70.0000', '70.0000', '2023-02-04 01:26:27', '2023-02-04 01:26:27', NULL, '[]'),
(299, 'DUMMY', 299, '0299', 299, NULL, '40.0000', '40.0000', '75.0000', '70.0000', '70.0000', '2023-02-04 01:26:41', '2023-02-04 01:26:41', NULL, '[]'),
(300, 'DUMMY', 300, '0300', 300, NULL, '88.0000', '88.0000', '13.6400', '100.0000', '100.0000', '2023-02-04 01:27:29', '2023-02-04 01:27:29', NULL, '[]'),
(301, 'DUMMY', 301, '0301', 301, NULL, '105.0000', '105.0000', '42.8600', '150.0000', '150.0000', '2023-02-04 01:27:50', '2023-02-04 01:27:50', NULL, '[]'),
(302, 'DUMMY', 302, '0302', 302, NULL, '90.0000', '90.0000', '22.2200', '110.0000', '110.0000', '2023-02-04 01:28:32', '2023-02-04 01:28:32', NULL, '[]'),
(303, 'DUMMY', 303, '0303', 303, NULL, '150.0000', '150.0000', '46.6700', '220.0000', '220.0000', '2023-02-04 01:28:51', '2023-02-04 01:28:51', NULL, '[]'),
(304, 'DUMMY', 304, '0304', 304, NULL, '42.0000', '42.0000', '42.8600', '60.0000', '60.0000', '2023-02-04 01:29:33', '2023-02-04 01:29:33', NULL, '[]'),
(305, 'DUMMY', 305, '0305', 305, NULL, '75.0000', '75.0000', '100.0000', '150.0000', '150.0000', '2023-02-04 01:29:59', '2023-02-04 01:29:59', NULL, '[]'),
(306, 'DUMMY', 306, '0306', 306, NULL, '55.0000', '55.0000', '18.1800', '65.0000', '65.0000', '2023-02-04 01:30:43', '2023-02-04 01:30:43', NULL, '[]'),
(307, 'DUMMY', 307, '0307', 307, NULL, '81.0000', '81.0000', '29.6300', '105.0000', '105.0000', '2023-02-04 01:30:44', '2023-02-04 01:30:44', NULL, '[]'),
(308, 'DUMMY', 308, '0308', 308, NULL, '26.0000', '26.0000', '34.6200', '35.0000', '35.0000', '2023-02-04 01:32:03', '2023-02-04 01:32:03', NULL, '[]'),
(309, 'DUMMY', 309, '0309', 309, NULL, '130.0000', '130.0000', '26.9200', '165.0000', '165.0000', '2023-02-04 01:32:24', '2023-02-04 01:32:24', NULL, '[]'),
(310, 'DUMMY', 310, '0310', 310, NULL, '43.0000', '43.0000', '27.9100', '55.0000', '55.0000', '2023-02-04 01:33:01', '2023-02-04 01:33:01', NULL, '[]'),
(311, 'DUMMY', 311, '0311', 311, NULL, '301.0000', '301.0000', '26.2500', '380.0000', '380.0000', '2023-02-04 01:33:18', '2023-02-04 01:33:18', NULL, '[]'),
(312, 'DUMMY', 312, '0312', 312, NULL, '81.0000', '81.0000', '29.6300', '105.0000', '105.0000', '2023-02-04 01:34:18', '2023-02-04 01:34:18', NULL, '[]'),
(313, 'DUMMY', 313, '0313', 313, NULL, '87.0000', '87.0000', '14.9400', '100.0000', '100.0000', '2023-02-04 01:34:38', '2023-02-04 01:34:38', NULL, '[]'),
(314, 'DUMMY', 314, '0314', 314, NULL, '130.0000', '130.0000', '26.9200', '165.0000', '165.0000', '2023-02-04 01:35:10', '2023-02-04 01:35:10', NULL, '[]'),
(315, 'DUMMY', 315, '0315', 315, NULL, '301.0000', '301.0000', '26.2500', '380.0000', '380.0000', '2023-02-04 01:36:07', '2023-02-04 01:36:07', NULL, '[]'),
(316, 'DUMMY', 316, '0316', 316, NULL, '153.0000', '153.0000', '27.4500', '195.0000', '195.0000', '2023-02-04 01:36:56', '2023-02-04 01:36:56', NULL, '[]'),
(317, 'DUMMY', 317, '0317', 317, NULL, '81.0000', '81.0000', '29.6300', '105.0000', '105.0000', '2023-02-04 01:37:20', '2023-02-04 01:37:20', NULL, '[]'),
(318, 'DUMMY', 318, '0318', 318, NULL, '130.0000', '130.0000', '26.9200', '165.0000', '165.0000', '2023-02-04 01:38:03', '2023-02-04 01:38:03', NULL, '[]'),
(319, 'DUMMY', 319, '0319', 319, NULL, '153.0000', '153.0000', '27.4500', '195.0000', '195.0000', '2023-02-04 01:38:13', '2023-02-04 01:38:13', NULL, '[]'),
(320, 'DUMMY', 320, '0320', 320, NULL, '301.0000', '301.0000', '26.2500', '380.0000', '380.0000', '2023-02-04 01:38:59', '2023-02-04 01:38:59', NULL, '[]'),
(321, 'DUMMY', 321, '0321', 321, NULL, '81.0000', '81.0000', '23.4600', '100.0000', '100.0000', '2023-02-04 01:39:58', '2023-02-04 01:39:58', NULL, '[]'),
(322, 'DUMMY', 322, '0322', 322, NULL, '146.0000', '146.0000', '23.2900', '180.0000', '180.0000', '2023-02-04 01:40:50', '2023-02-04 01:40:50', NULL, '[]'),
(323, 'DUMMY', 323, '0323', 323, NULL, '81.0000', '81.0000', '23.4600', '100.0000', '100.0000', '2023-02-04 01:41:58', '2023-02-04 01:44:43', NULL, '[]'),
(324, 'DUMMY', 324, '0324', 324, NULL, '146.0000', '146.0000', '23.2900', '180.0000', '180.0000', '2023-02-04 01:42:42', '2023-02-04 01:42:42', NULL, '[]'),
(325, 'DUMMY', 325, '0325', 325, NULL, '81.0000', '81.0000', '23.4600', '100.0000', '100.0000', '2023-02-04 01:45:27', '2023-02-04 01:45:27', NULL, '[]'),
(326, 'DUMMY', 326, '0326', 326, NULL, '146.0000', '146.0000', '23.2900', '180.0000', '180.0000', '2023-02-04 01:46:26', '2023-02-04 01:46:26', NULL, '[]'),
(327, 'DUMMY', 327, '0327', 327, NULL, '224.0000', '224.0000', '31.7000', '295.0000', '295.0000', '2023-02-04 01:47:11', '2023-02-04 01:47:11', NULL, '[]'),
(328, 'DUMMY', 328, '0328', 328, NULL, '224.0000', '224.0000', '31.7000', '295.0000', '295.0000', '2023-02-04 01:48:08', '2023-02-04 01:48:08', NULL, '[]');
INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(329, 'DUMMY', 329, '0329', 329, NULL, '224.0000', '224.0000', '31.7000', '295.0000', '295.0000', '2023-02-04 01:48:56', '2023-02-04 01:48:56', NULL, '[]'),
(330, 'DUMMY', 330, '0330', 330, NULL, '122.0000', '122.0000', '22.9500', '150.0000', '150.0000', '2023-02-04 01:49:47', '2023-02-04 01:49:47', NULL, '[]'),
(331, 'DUMMY', 331, '0331', 331, NULL, '203.0000', '203.0000', '23.1500', '250.0000', '250.0000', '2023-02-04 01:51:00', '2023-02-04 01:51:00', NULL, '[]'),
(332, 'DUMMY', 332, '0332', 332, NULL, '322.0000', '322.0000', '24.2200', '400.0000', '400.0000', '2023-02-04 01:51:42', '2023-02-04 01:51:42', NULL, '[]'),
(333, 'DUMMY', 333, '0333', 333, NULL, '122.0000', '122.0000', '22.9500', '150.0000', '150.0000', '2023-02-04 01:52:27', '2023-02-04 01:52:27', NULL, '[]'),
(334, 'DUMMY', 334, '0334', 334, NULL, '203.0000', '203.0000', '23.1500', '250.0000', '250.0000', '2023-02-04 01:53:12', '2023-02-04 01:53:12', NULL, '[]'),
(335, 'DUMMY', 335, '0335', 335, NULL, '322.0000', '322.0000', '24.2200', '400.0000', '400.0000', '2023-02-04 01:54:13', '2023-02-04 01:54:13', NULL, '[]'),
(336, 'DUMMY', 336, '0336', 336, NULL, '122.0000', '122.0000', '22.9500', '150.0000', '150.0000', '2023-02-04 01:55:30', '2023-02-04 01:55:30', NULL, '[]'),
(337, 'DUMMY', 337, '0337', 337, NULL, '153.0000', '153.0000', '27.4500', '195.0000', '195.0000', '2023-02-04 01:55:42', '2023-02-04 01:55:42', NULL, '[]'),
(338, 'DUMMY', 338, '0338', 338, NULL, '203.0000', '203.0000', '23.1500', '250.0000', '250.0000', '2023-02-04 01:56:24', '2023-02-04 01:56:24', NULL, '[]'),
(339, 'DUMMY', 339, '0339', 339, NULL, '153.0000', '153.0000', '27.4500', '195.0000', '195.0000', '2023-02-04 01:57:00', '2023-02-04 01:57:00', NULL, '[]'),
(340, 'DUMMY', 340, '0340', 340, NULL, '322.0000', '322.0000', '24.2200', '400.0000', '400.0000', '2023-02-04 01:57:12', '2023-02-04 01:57:12', NULL, '[]'),
(341, 'DUMMY', 341, '0341', 341, NULL, '262.0000', '262.0000', '29.7700', '340.0000', '340.0000', '2023-02-04 01:58:16', '2023-02-04 01:58:16', NULL, '[]'),
(342, 'DUMMY', 342, '0342', 342, NULL, '150.0000', '150.0000', '23.3300', '185.0000', '185.0000', '2023-02-04 01:58:38', '2023-02-04 01:58:38', NULL, '[]'),
(343, 'DUMMY', 343, '0343', 343, NULL, '77.0000', '77.0000', '23.3800', '95.0000', '95.0000', '2023-02-04 01:59:28', '2023-02-04 01:59:28', NULL, '[]'),
(344, 'DUMMY', 344, '0344', 344, NULL, '262.0000', '262.0000', '29.7700', '340.0000', '340.0000', '2023-02-04 02:02:15', '2023-02-04 02:02:15', NULL, '[]'),
(345, 'DUMMY', 345, '0345', 345, NULL, '262.0000', '262.0000', '29.7700', '340.0000', '340.0000', '2023-02-04 02:03:48', '2023-02-04 02:03:48', NULL, '[]'),
(346, 'DUMMY', 346, '0346', 346, NULL, '153.0000', '153.0000', '27.4500', '195.0000', '195.0000', '2023-02-04 02:04:55', '2023-02-04 02:04:55', NULL, '[]'),
(347, 'DUMMY', 347, '0347', 347, NULL, '153.0000', '153.0000', '27.4500', '195.0000', '195.0000', '2023-02-04 02:09:32', '2023-02-04 02:09:32', NULL, '[]'),
(348, 'DUMMY', 348, '0348', 348, NULL, '262.0000', '262.0000', '29.7700', '340.0000', '340.0000', '2023-02-04 02:12:30', '2023-02-04 02:12:30', NULL, '[]'),
(349, 'DUMMY', 349, '0349', 349, NULL, '262.0000', '262.0000', '29.7700', '340.0000', '340.0000', '2023-02-04 02:21:58', '2023-02-04 02:21:58', NULL, '[]'),
(350, 'DUMMY', 350, '0350', 350, NULL, '56.0000', '56.0000', '25.0000', '70.0000', '70.0000', '2023-02-04 02:24:16', '2023-02-04 02:24:16', NULL, '[]'),
(351, 'DUMMY', 351, '0351', 351, NULL, '136.0000', '136.0000', '13.9700', '155.0000', '155.0000', '2023-02-04 02:25:43', '2023-02-04 02:25:43', NULL, '[]'),
(352, 'DUMMY', 352, '0352', 352, NULL, '136.0000', '136.0000', '13.9700', '155.0000', '155.0000', '2023-02-04 02:32:37', '2023-02-04 02:32:37', NULL, '[]'),
(353, 'DUMMY', 353, '0353', 353, NULL, '82.0000', '82.0000', '34.1500', '110.0000', '110.0000', '2023-02-04 02:33:33', '2023-02-04 02:33:33', NULL, '[]'),
(354, 'DUMMY', 354, '0354', 354, NULL, '22.0000', '22.0000', '59.0900', '35.0000', '35.0000', '2023-02-04 02:34:43', '2023-02-04 02:34:43', NULL, '[]'),
(355, 'DUMMY', 355, '0355', 355, NULL, '68.0000', '68.0000', '25.0000', '85.0000', '85.0000', '2023-02-04 02:35:53', '2023-02-04 02:35:53', NULL, '[]'),
(356, 'DUMMY', 356, '0356', 356, NULL, '109.0000', '109.0000', '23.8500', '135.0000', '135.0000', '2023-02-04 02:36:51', '2023-02-04 02:36:51', NULL, '[]'),
(357, 'DUMMY', 357, '0357', 357, NULL, '234.0000', '234.0000', '23.9300', '290.0000', '290.0000', '2023-02-04 02:37:39', '2023-02-04 02:37:39', NULL, '[]'),
(358, 'DUMMY', 358, '0358', 358, NULL, '68.0000', '68.0000', '25.0000', '85.0000', '85.0000', '2023-02-04 02:39:42', '2023-02-04 02:39:42', NULL, '[]'),
(359, 'DUMMY', 359, '0359', 359, NULL, '113.0000', '113.0000', '23.8900', '140.0000', '140.0000', '2023-02-04 02:40:36', '2023-02-04 02:40:36', NULL, '[]'),
(360, 'DUMMY', 360, '0360', 360, NULL, '242.0000', '242.0000', '19.8300', '290.0000', '290.0000', '2023-02-04 02:41:59', '2023-02-04 02:41:59', NULL, '[]'),
(361, 'DUMMY', 361, '0361', 361, NULL, '54.0000', '54.0000', '66.6700', '90.0000', '90.0000', '2023-02-04 02:43:00', '2023-02-04 02:43:00', NULL, '[]'),
(362, 'DUMMY', 362, '0362', 362, NULL, '84.0000', '84.0000', '66.6700', '140.0000', '140.0000', '2023-02-04 02:44:08', '2023-02-04 02:44:08', NULL, '[]'),
(363, 'DUMMY', 363, '0363', 363, NULL, '242.0000', '242.0000', '19.8300', '290.0000', '290.0000', '2023-02-04 02:45:21', '2023-02-04 02:45:21', NULL, '[]'),
(364, 'DUMMY', 364, '0364', 364, NULL, '72.0000', '72.0000', '25.0000', '90.0000', '90.0000', '2023-02-04 02:46:13', '2023-02-04 02:46:13', NULL, '[]'),
(365, 'DUMMY', 365, '0365', 365, NULL, '113.0000', '113.0000', '23.8900', '140.0000', '140.0000', '2023-02-04 02:49:19', '2023-02-04 02:49:19', NULL, '[]'),
(366, 'DUMMY', 366, '0366', 366, NULL, '242.0000', '242.0000', '19.8300', '290.0000', '290.0000', '2023-02-04 03:03:02', '2023-02-04 03:03:02', NULL, '[]'),
(367, 'DUMMY', 367, '0367', 367, NULL, '242.0000', '242.0000', '19.8300', '290.0000', '290.0000', '2023-02-04 03:05:57', '2023-02-04 03:05:57', NULL, '[]'),
(368, 'DUMMY', 368, '0368', 368, NULL, '113.0000', '113.0000', '23.8900', '140.0000', '140.0000', '2023-02-04 03:07:04', '2023-02-04 03:07:04', NULL, '[]'),
(369, 'DUMMY', 369, '0369', 369, NULL, '113.0000', '113.0000', '23.8900', '140.0000', '140.0000', '2023-02-04 03:08:13', '2023-02-04 03:08:13', NULL, '[]'),
(370, 'DUMMY', 370, '0370', 370, NULL, '219.0000', '219.0000', '23.2900', '270.0000', '270.0000', '2023-02-04 03:09:51', '2023-02-04 03:09:51', NULL, '[]'),
(371, 'DUMMY', 371, '0371', 371, NULL, '73.0000', '73.0000', '36.9900', '100.0000', '100.0000', '2023-02-04 03:11:07', '2023-02-04 03:11:07', NULL, '[]'),
(372, 'DUMMY', 372, '0372', 372, NULL, '114.0000', '114.0000', '31.5800', '150.0000', '150.0000', '2023-02-04 03:12:10', '2023-02-04 03:12:10', NULL, '[]'),
(373, 'DUMMY', 373, '0373', 373, NULL, '203.0000', '203.0000', '42.8600', '290.0000', '290.0000', '2023-02-04 03:13:20', '2023-02-04 03:13:20', NULL, '[]'),
(374, 'DUMMY', 374, '0374', 374, NULL, '297.0000', '297.0000', '33.0000', '395.0000', '395.0000', '2023-02-04 03:14:55', '2023-02-04 03:14:55', NULL, '[]'),
(375, 'DUMMY', 375, '0375', 375, NULL, '73.0000', '73.0000', '36.9900', '100.0000', '100.0000', '2023-02-04 03:16:22', '2023-02-04 03:16:22', NULL, '[]'),
(376, 'DUMMY', 376, '0376', 376, NULL, '114.0000', '114.0000', '31.5800', '150.0000', '150.0000', '2023-02-04 03:17:28', '2023-02-04 03:17:28', NULL, '[]'),
(377, 'DUMMY', 377, '0377', 377, NULL, '204.0000', '204.0000', '42.1600', '290.0000', '290.0000', '2023-02-04 03:18:33', '2023-02-04 03:18:33', NULL, '[]'),
(378, 'DUMMY', 378, '0378', 378, NULL, '297.0000', '297.0000', '33.0000', '395.0000', '395.0000', '2023-02-04 03:19:47', '2023-02-04 03:19:47', NULL, '[]'),
(379, 'DUMMY', 379, '0379', 379, NULL, '73.0000', '73.0000', '36.9900', '100.0000', '100.0000', '2023-02-04 03:21:06', '2023-02-04 03:21:06', NULL, '[]'),
(380, 'DUMMY', 380, '0380', 380, NULL, '114.0000', '114.0000', '31.5800', '150.0000', '150.0000', '2023-02-04 03:22:10', '2023-02-04 03:22:10', NULL, '[]'),
(381, 'DUMMY', 381, '0381', 381, NULL, '203.0000', '203.0000', '42.8600', '290.0000', '290.0000', '2023-02-04 03:23:02', '2023-02-04 03:23:02', NULL, '[]'),
(382, 'DUMMY', 382, '0382', 382, NULL, '297.0000', '297.0000', '33.0000', '395.0000', '395.0000', '2023-02-04 03:23:55', '2023-02-04 03:23:55', NULL, '[]'),
(384, 'DUMMY', 384, '0384', 384, NULL, '114.0000', '114.0000', '31.5800', '150.0000', '150.0000', '2023-02-04 03:28:01', '2023-02-04 03:28:01', NULL, '[]'),
(385, 'DUMMY', 385, '0385', 385, NULL, '203.0000', '203.0000', '42.8600', '290.0000', '290.0000', '2023-02-04 03:29:19', '2023-02-04 03:29:19', NULL, '[]'),
(386, 'DUMMY', 386, '0386', 386, NULL, '203.0000', '203.0000', '42.8600', '290.0000', '290.0000', '2023-02-04 03:31:59', '2023-02-04 03:31:59', NULL, '[]'),
(387, 'DUMMY', 387, '0387', 387, NULL, '53.0000', '53.0000', '32.0800', '70.0000', '70.0000', '2023-02-04 03:33:14', '2023-02-04 03:33:14', NULL, '[]'),
(388, 'DUMMY', 388, '0388', 388, NULL, '69.0000', '69.0000', '30.4300', '90.0000', '90.0000', '2023-02-04 03:34:19', '2023-02-04 03:34:19', NULL, '[]'),
(389, 'DUMMY', 389, '0389', 389, NULL, '118.0000', '118.0000', '27.1200', '150.0000', '150.0000', '2023-02-04 03:35:37', '2023-02-04 03:35:37', NULL, '[]'),
(390, 'DUMMY', 390, '0390', 390, NULL, '65.0000', '65.0000', '23.0800', '80.0000', '80.0000', '2023-02-04 03:36:31', '2023-02-04 03:36:31', NULL, '[]'),
(391, 'DUMMY', 391, '0391', 391, NULL, '93.0000', '93.0000', '23.6600', '115.0000', '115.0000', '2023-02-04 03:39:08', '2023-02-04 03:39:08', NULL, '[]'),
(392, 'DUMMY', 392, '0392', 392, NULL, '146.0000', '146.0000', '23.2900', '180.0000', '180.0000', '2023-02-04 03:40:45', '2023-02-04 03:40:45', NULL, '[]'),
(393, 'DUMMY', 393, '0393', 393, NULL, '65.0000', '65.0000', '23.0800', '80.0000', '80.0000', '2023-02-04 03:42:32', '2023-02-04 03:42:32', NULL, '[]'),
(394, 'DUMMY', 394, '0394', 394, NULL, '93.0000', '93.0000', '23.6600', '115.0000', '115.0000', '2023-02-04 03:43:50', '2023-02-04 03:43:50', NULL, '[]'),
(395, 'DUMMY', 395, '0395', 395, NULL, '146.0000', '146.0000', '23.2900', '180.0000', '180.0000', '2023-02-04 03:45:58', '2023-02-04 03:45:58', NULL, '[]'),
(396, 'DUMMY', 396, '0396', 396, NULL, '65.0000', '65.0000', '23.0800', '80.0000', '80.0000', '2023-02-04 03:47:47', '2023-02-04 03:47:47', NULL, '[]'),
(397, 'DUMMY', 397, 'N/Lovely Cocoa glycerine 65ml', 397, NULL, '93.0000', '93.0000', '23.6600', '115.0000', '115.0000', '2023-02-04 03:49:10', '2023-02-04 03:49:10', NULL, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `variation_group_prices`
--

CREATE TABLE `variation_group_prices` (
  `id` int UNSIGNED NOT NULL,
  `variation_id` int UNSIGNED NOT NULL,
  `price_group_id` int UNSIGNED NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_group_prices`
--

INSERT INTO `variation_group_prices` (`id`, `variation_id`, `price_group_id`, `price_inc_tax`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '230.0000', '2023-02-02 18:55:32', '2023-02-02 18:55:32'),
(2, 3, 2, '420.0000', '2023-02-03 13:41:59', '2023-02-03 13:41:59'),
(3, 4, 2, '420.0000', '2023-02-03 14:04:58', '2023-02-03 14:04:58'),
(4, 5, 2, '420.0000', '2023-02-03 14:07:28', '2023-02-03 14:07:28'),
(5, 6, 2, '505.0000', '2023-02-03 14:11:42', '2023-02-03 14:11:42'),
(6, 7, 2, '505.0000', '2023-02-03 14:14:00', '2023-02-03 14:14:00'),
(7, 8, 2, '505.0000', '2023-02-03 14:19:28', '2023-02-03 14:19:28'),
(8, 9, 2, '695.0000', '2023-02-03 14:25:00', '2023-02-03 14:25:00'),
(9, 10, 2, '695.0000', '2023-02-03 14:27:18', '2023-02-03 14:27:18'),
(10, 11, 2, '415.0000', '2023-02-03 14:29:30', '2023-02-03 14:29:30'),
(11, 12, 2, '760.0000', '2023-02-03 14:31:22', '2023-02-03 14:35:28'),
(12, 13, 2, '605.0000', '2023-02-03 14:32:36', '2023-02-03 14:32:36'),
(13, 14, 2, '605.0000', '2023-02-03 14:33:47', '2023-02-03 14:33:47'),
(14, 15, 2, '605.0000', '2023-02-03 14:35:03', '2023-02-03 14:35:03'),
(15, 16, 2, '400.0000', '2023-02-03 14:36:29', '2023-02-03 14:36:29'),
(16, 17, 2, '400.0000', '2023-02-03 14:37:40', '2023-02-03 14:37:40'),
(17, 18, 2, '400.0000', '2023-02-03 14:38:35', '2023-02-03 14:38:35'),
(18, 19, 2, '400.0000', '2023-02-03 14:40:37', '2023-02-03 14:40:38'),
(19, 20, 2, '400.0000', '2023-02-03 14:41:40', '2023-02-03 14:41:40'),
(20, 21, 2, '400.0000', '2023-02-03 14:42:40', '2023-02-03 14:42:41'),
(21, 22, 2, '400.0000', '2023-02-03 14:43:49', '2023-02-03 14:43:49'),
(22, 23, 2, '400.0000', '2023-02-03 14:45:08', '2023-02-03 14:45:08'),
(23, 24, 2, '500.0000', '2023-02-03 14:46:05', '2023-02-03 14:46:05'),
(24, 25, 2, '500.0000', '2023-02-03 14:46:52', '2023-02-03 14:46:52'),
(25, 26, 2, '500.0000', '2023-02-03 14:47:50', '2023-02-03 14:47:50'),
(26, 27, 2, '500.0000', '2023-02-03 14:49:23', '2023-02-03 14:49:23'),
(27, 28, 2, '570.0000', '2023-02-03 14:50:24', '2023-02-03 14:50:24'),
(28, 29, 2, '570.0000', '2023-02-03 14:51:14', '2023-02-03 14:51:14'),
(29, 30, 2, '570.0000', '2023-02-03 14:52:15', '2023-02-03 14:52:15'),
(30, 31, 2, '570.0000', '2023-02-03 14:53:07', '2023-02-03 14:53:07'),
(31, 32, 2, '570.0000', '2023-02-03 14:54:11', '2023-02-03 14:54:11'),
(32, 33, 2, '350.0000', '2023-02-03 14:55:57', '2023-02-03 14:55:57'),
(33, 34, 2, '350.0000', '2023-02-03 14:59:12', '2023-02-03 14:59:12'),
(34, 35, 2, '540.0000', '2023-02-03 15:00:47', '2023-02-03 15:00:47'),
(35, 36, 2, '540.0000', '2023-02-03 15:01:41', '2023-02-03 15:01:41'),
(36, 37, 2, '540.0000', '2023-02-03 15:02:36', '2023-02-03 15:02:36'),
(37, 38, 2, '585.0000', '2023-02-03 15:03:19', '2023-02-03 15:03:19'),
(38, 39, 2, '585.0000', '2023-02-03 15:04:03', '2023-02-03 15:04:03'),
(39, 40, 2, '585.0000', '2023-02-03 15:04:44', '2023-02-03 15:04:44'),
(40, 41, 2, '535.0000', '2023-02-03 15:05:40', '2023-02-03 15:05:40'),
(41, 42, 2, '535.0000', '2023-02-03 15:07:20', '2023-02-03 15:07:20'),
(42, 43, 2, '580.0000', '2023-02-03 15:08:18', '2023-02-03 15:08:18'),
(44, 45, 2, '580.0000', '2023-02-03 15:10:20', '2023-02-03 15:10:21'),
(45, 46, 2, '280.0000', '2023-02-03 15:11:24', '2023-02-03 15:11:24'),
(46, 47, 2, '280.0000', '2023-02-03 15:12:27', '2023-02-03 15:12:28'),
(47, 48, 2, '280.0000', '2023-02-03 15:13:28', '2023-02-03 15:13:28'),
(48, 49, 2, '395.0000', '2023-02-03 15:14:17', '2023-02-03 15:14:17'),
(49, 50, 2, '395.0000', '2023-02-03 15:15:05', '2023-02-03 15:15:05'),
(50, 51, 2, '395.0000', '2023-02-03 15:15:56', '2023-02-03 15:15:56'),
(51, 52, 2, '495.0000', '2023-02-03 15:17:10', '2023-02-03 15:17:10'),
(52, 53, 2, '495.0000', '2023-02-03 15:28:33', '2023-02-03 15:28:33'),
(53, 54, 2, '460.0000', '2023-02-03 15:30:34', '2023-02-03 15:30:34'),
(54, 55, 2, '460.0000', '2023-02-03 15:31:41', '2023-02-03 15:31:41'),
(55, 56, 2, '610.0000', '2023-02-03 15:32:35', '2023-02-03 15:32:35'),
(56, 57, 2, '610.0000', '2023-02-03 15:33:32', '2023-02-03 15:33:32'),
(57, 58, 2, '610.0000', '2023-02-03 15:34:20', '2023-02-03 15:34:20'),
(58, 59, 2, '610.0000', '2023-02-03 15:35:14', '2023-02-03 15:35:14'),
(59, 60, 2, '610.0000', '2023-02-03 15:37:17', '2023-02-03 15:37:17'),
(60, 61, 2, '475.0000', '2023-02-03 15:38:14', '2023-02-03 15:38:14'),
(61, 62, 2, '475.0000', '2023-02-03 15:39:16', '2023-02-03 15:39:16'),
(62, 63, 2, '595.0000', '2023-02-03 15:40:13', '2023-02-03 15:40:13'),
(63, 64, 2, '595.0000', '2023-02-03 15:41:10', '2023-02-03 15:41:10'),
(64, 65, 2, '595.0000', '2023-02-03 15:42:07', '2023-02-03 15:42:07'),
(65, 66, 2, '595.0000', '2023-02-03 15:43:17', '2023-02-03 15:43:17'),
(66, 67, 2, '550.0000', '2023-02-03 15:44:23', '2023-02-03 15:44:23'),
(67, 68, 2, '550.0000', '2023-02-03 15:45:18', '2023-02-03 15:45:18'),
(68, 70, 2, '450.0000', '2023-02-03 15:47:00', '2023-02-03 15:47:00'),
(69, 71, 2, '450.0000', '2023-02-03 15:48:02', '2023-02-03 15:48:02'),
(70, 72, 2, '450.0000', '2023-02-03 15:48:50', '2023-02-03 15:48:50'),
(71, 73, 2, '425.0000', '2023-02-03 15:49:38', '2023-02-03 15:49:38'),
(72, 74, 2, '425.0000', '2023-02-03 15:50:26', '2023-02-03 15:50:26'),
(73, 75, 2, '425.0000', '2023-02-03 15:51:24', '2023-02-03 15:51:24'),
(74, 76, 2, '405.0000', '2023-02-03 15:52:48', '2023-02-03 15:52:48'),
(75, 77, 2, '405.0000', '2023-02-03 15:54:01', '2023-02-03 15:54:02'),
(77, 80, 2, '230.0000', '2023-02-03 22:49:22', '2023-02-03 22:49:22'),
(78, 81, 2, '200.0000', '2023-02-03 22:50:35', '2023-02-03 22:50:35'),
(79, 82, 2, '30.0000', '2023-02-03 22:51:56', '2023-02-03 22:51:56'),
(80, 83, 2, '12.0000', '2023-02-03 22:52:59', '2023-02-03 22:52:59'),
(81, 84, 2, '15.0000', '2023-02-03 22:54:19', '2023-02-03 22:54:19'),
(82, 85, 2, '265.0000', '2023-02-03 22:55:29', '2023-02-03 22:55:29'),
(83, 86, 2, '35.0000', '2023-02-03 22:56:32', '2023-02-03 22:56:32'),
(84, 87, 2, '20.0000', '2023-02-03 23:01:16', '2023-02-03 23:01:16'),
(85, 88, 2, '250.0000', '2023-02-03 23:03:03', '2023-02-03 23:03:03'),
(86, 89, 2, '195.0000', '2023-02-03 23:04:07', '2023-02-03 23:04:07'),
(87, 90, 2, '90.0000', '2023-02-03 23:05:01', '2023-02-03 23:05:01'),
(88, 91, 2, '110.0000', '2023-02-03 23:06:07', '2023-02-03 23:06:07'),
(89, 92, 2, '70.0000', '2023-02-03 23:07:13', '2023-02-03 23:07:13'),
(90, 93, 2, '65.0000', '2023-02-03 23:08:33', '2023-02-03 23:08:33'),
(91, 94, 2, '220.0000', '2023-02-03 23:10:06', '2023-02-03 23:10:06'),
(92, 95, 2, '220.0000', '2023-02-03 23:11:08', '2023-02-03 23:11:08'),
(93, 96, 2, '185.0000', '2023-02-03 23:12:11', '2023-02-03 23:12:11'),
(94, 97, 2, '185.0000', '2023-02-03 23:13:25', '2023-02-03 23:15:22'),
(95, 98, 2, '220.0000', '2023-02-03 23:16:52', '2023-02-03 23:16:52'),
(96, 99, 2, '235.0000', '2023-02-03 23:18:08', '2023-02-03 23:18:08'),
(97, 101, 2, '220.0000', '2023-02-03 23:19:18', '2023-02-03 23:19:18'),
(98, 102, 2, '405.0000', '2023-02-03 23:19:30', '2023-02-03 23:19:30'),
(99, 103, 2, '170.0000', '2023-02-03 23:21:09', '2023-02-03 23:21:09'),
(100, 104, 2, '60.0000', '2023-02-03 23:22:06', '2023-02-03 23:22:06'),
(101, 105, 2, '230.0000', '2023-02-03 23:23:45', '2023-02-03 23:23:45'),
(102, 106, 2, '30.0000', '2023-02-03 23:24:38', '2023-02-03 23:24:38'),
(103, 107, 2, '15.0000', '2023-02-03 23:25:36', '2023-02-03 23:25:36'),
(104, 108, 2, '65.0000', '2023-02-03 23:26:35', '2023-02-03 23:26:35'),
(105, 109, 2, '65.0000', '2023-02-03 23:27:26', '2023-02-03 23:27:26'),
(106, 110, 2, '50.0000', '2023-02-03 23:28:26', '2023-02-03 23:28:26'),
(107, 111, 2, '65.0000', '2023-02-03 23:29:26', '2023-02-03 23:29:26'),
(108, 112, 2, '125.0000', '2023-02-03 23:30:27', '2023-02-03 23:30:27'),
(109, 113, 2, '220.0000', '2023-02-03 23:31:24', '2023-02-03 23:31:24'),
(110, 114, 2, '110.0000', '2023-02-03 23:32:13', '2023-02-03 23:32:13'),
(111, 115, 2, '100.0000', '2023-02-03 23:33:06', '2023-02-03 23:33:06'),
(112, 116, 2, '15.0000', '2023-02-03 23:34:07', '2023-02-03 23:34:07'),
(113, 117, 2, '270.0000', '2023-02-03 23:35:25', '2023-02-03 23:35:25'),
(114, 118, 2, '65.0000', '2023-02-03 23:36:21', '2023-02-03 23:36:21'),
(115, 119, 2, '65.0000', '2023-02-03 23:37:04', '2023-02-03 23:37:04'),
(116, 120, 2, '65.0000', '2023-02-03 23:37:47', '2023-02-03 23:37:47'),
(117, 121, 2, '405.0000', '2023-02-03 23:38:29', '2023-02-03 23:38:29'),
(118, 122, 2, '55.0000', '2023-02-03 23:38:34', '2023-02-03 23:38:34'),
(119, 123, 2, '55.0000', '2023-02-03 23:39:34', '2023-02-03 23:39:34'),
(120, 124, 2, '625.0000', '2023-02-03 23:40:06', '2023-02-03 23:40:06'),
(121, 125, 2, '55.0000', '2023-02-03 23:40:26', '2023-02-03 23:40:26'),
(122, 126, 2, '20.0000', '2023-02-03 23:41:29', '2023-02-03 23:41:29'),
(123, 127, 2, '625.0000', '2023-02-03 23:41:51', '2023-02-03 23:41:51'),
(124, 128, 2, '60.0000', '2023-02-03 23:42:12', '2023-02-03 23:42:12'),
(125, 129, 2, '20.0000', '2023-02-03 23:42:58', '2023-02-03 23:42:58'),
(126, 130, 2, '625.0000', '2023-02-03 23:43:07', '2023-02-03 23:43:07'),
(127, 131, 2, '225.0000', '2023-02-03 23:43:46', '2023-02-03 23:43:46'),
(128, 133, 2, '60.0000', '2023-02-03 23:44:23', '2023-02-03 23:44:23'),
(129, 132, 2, '625.0000', '2023-02-03 23:44:24', '2023-02-03 23:44:24'),
(130, 134, 2, '40.0000', '2023-02-03 23:45:05', '2023-02-03 23:45:05'),
(131, 135, 2, '35.0000', '2023-02-03 23:45:53', '2023-02-03 23:45:53'),
(132, 136, 2, '625.0000', '2023-02-03 23:46:02', '2023-02-03 23:46:02'),
(133, 137, 2, '55.0000', '2023-02-03 23:47:01', '2023-02-03 23:47:01'),
(134, 139, 2, '45.0000', '2023-02-03 23:47:56', '2023-02-03 23:47:56'),
(135, 138, 2, '310.0000', '2023-02-03 23:48:13', '2023-02-03 23:48:13'),
(136, 140, 2, '290.0000', '2023-02-03 23:48:42', '2023-02-03 23:48:42'),
(137, 141, 2, '310.0000', '2023-02-03 23:49:23', '2023-02-03 23:49:23'),
(138, 142, 2, '160.0000', '2023-02-03 23:49:52', '2023-02-03 23:49:52'),
(139, 143, 2, '310.0000', '2023-02-03 23:50:33', '2023-02-03 23:50:33'),
(140, 144, 2, '270.0000', '2023-02-03 23:50:49', '2023-02-03 23:50:49'),
(141, 145, 2, '310.0000', '2023-02-03 23:51:34', '2023-02-03 23:51:34'),
(142, 146, 2, '160.0000', '2023-02-03 23:51:40', '2023-02-03 23:51:40'),
(143, 148, 2, '180.0000', '2023-02-03 23:52:48', '2023-02-03 23:52:48'),
(144, 147, 2, '310.0000', '2023-02-03 23:52:52', '2023-02-03 23:52:52'),
(145, 149, 2, '145.0000', '2023-02-03 23:53:46', '2023-02-03 23:53:46'),
(146, 150, 2, '170.0000', '2023-02-03 23:54:36', '2023-02-03 23:54:36'),
(147, 151, 2, '210.0000', '2023-02-03 23:55:34', '2023-02-03 23:55:34'),
(148, 152, 2, '245.0000', '2023-02-03 23:56:47', '2023-02-03 23:56:47'),
(149, 153, 2, '310.0000', '2023-02-03 23:57:28', '2023-02-03 23:57:28'),
(150, 154, 2, '130.0000', '2023-02-03 23:58:54', '2023-02-03 23:58:54'),
(151, 155, 2, '310.0000', '2023-02-03 23:59:58', '2023-02-03 23:59:58'),
(152, 156, 2, '65.0000', '2023-02-04 00:00:06', '2023-02-04 00:00:06'),
(153, 157, 2, '65.0000', '2023-02-04 00:00:56', '2023-02-04 00:00:56'),
(154, 158, 2, '580.0000', '2023-02-04 00:01:23', '2023-02-04 00:01:23'),
(155, 159, 2, '50.0000', '2023-02-04 00:01:51', '2023-02-04 00:01:51'),
(156, 160, 2, '55.0000', '2023-02-04 00:02:40', '2023-02-04 00:02:40'),
(157, 161, 2, '580.0000', '2023-02-04 00:03:05', '2023-02-04 00:03:05'),
(158, 162, 2, '25.0000', '2023-02-04 00:03:39', '2023-02-04 00:03:39'),
(159, 163, 2, '580.0000', '2023-02-04 00:04:05', '2023-02-04 00:04:05'),
(160, 164, 2, '320.0000', '2023-02-04 00:04:32', '2023-02-04 00:04:32'),
(161, 166, 2, '65.0000', '2023-02-04 00:05:12', '2023-02-04 00:05:12'),
(162, 165, 2, '580.0000', '2023-02-04 00:05:13', '2023-02-04 00:05:13'),
(163, 167, 2, '67.0000', '2023-02-04 00:06:28', '2023-02-04 00:06:28'),
(164, 168, 2, '25.0000', '2023-02-04 00:07:20', '2023-02-04 00:07:20'),
(165, 169, 2, '67.0000', '2023-02-04 00:07:33', '2023-02-04 00:07:33'),
(166, 170, 2, '67.0000', '2023-02-04 00:08:44', '2023-02-04 00:08:44'),
(167, 171, 2, '220.0000', '2023-02-04 00:08:48', '2023-02-04 00:08:48'),
(168, 172, 2, '220.0000', '2023-02-04 00:09:38', '2023-02-04 00:09:38'),
(169, 173, 2, '67.0000', '2023-02-04 00:09:46', '2023-02-04 00:09:46'),
(170, 174, 2, '40.0000', '2023-02-04 00:10:26', '2023-02-04 00:10:26'),
(171, 175, 2, '67.0000', '2023-02-04 00:11:10', '2023-02-04 00:11:10'),
(172, 176, 2, '35.0000', '2023-02-04 00:11:36', '2023-02-04 00:11:36'),
(173, 177, 2, '55.0000', '2023-02-04 00:12:22', '2023-02-04 00:12:22'),
(174, 178, 2, '67.0000', '2023-02-04 00:12:26', '2023-02-04 00:12:26'),
(175, 179, 2, '60.0000', '2023-02-04 00:14:09', '2023-02-04 00:14:09'),
(176, 180, 2, '40.0000', '2023-02-04 00:15:00', '2023-02-04 00:15:00'),
(177, 181, 2, '35.0000', '2023-02-04 00:15:56', '2023-02-04 00:15:56'),
(178, 182, 2, '20.0000', '2023-02-04 00:17:17', '2023-02-04 00:17:17'),
(179, 183, 2, '110.0000', '2023-02-04 00:18:20', '2023-02-04 00:18:20'),
(180, 184, 2, '25.0000', '2023-02-04 00:19:11', '2023-02-04 00:19:11'),
(181, 185, 2, '20.0000', '2023-02-04 00:19:59', '2023-02-04 00:19:59'),
(182, 186, 2, '265.0000', '2023-02-04 00:21:45', '2023-02-04 00:21:45'),
(183, 187, 2, '100.0000', '2023-02-04 00:22:43', '2023-02-04 00:22:43'),
(184, 188, 2, '110.0000', '2023-02-04 00:23:29', '2023-02-04 00:23:29'),
(185, 189, 2, '10.0000', '2023-02-04 00:24:34', '2023-02-04 00:24:34'),
(186, 190, 2, '50.0000', '2023-02-04 00:25:22', '2023-02-04 00:25:22'),
(187, 191, 2, '20.0000', '2023-02-04 00:26:05', '2023-02-04 00:26:05'),
(188, 192, 2, '70.0000', '2023-02-04 00:26:54', '2023-02-04 00:26:54'),
(189, 193, 2, '25.0000', '2023-02-04 00:28:50', '2023-02-04 00:28:50'),
(190, 194, 2, '50.0000', '2023-02-04 00:29:35', '2023-02-04 00:29:35'),
(191, 195, 2, '35.0000', '2023-02-04 00:30:23', '2023-02-04 00:30:23'),
(192, 196, 2, '20.0000', '2023-02-04 00:31:13', '2023-02-04 00:31:13'),
(193, 197, 2, '25.0000', '2023-02-04 00:31:55', '2023-02-04 00:31:55'),
(194, 198, 2, '50.0000', '2023-02-04 00:32:49', '2023-02-04 00:32:49'),
(195, 199, 2, '67.0000', '2023-02-04 00:33:02', '2023-02-04 00:33:02'),
(196, 200, 2, '25.0000', '2023-02-04 00:33:31', '2023-02-04 00:33:31'),
(197, 201, 2, '67.0000', '2023-02-04 00:34:03', '2023-02-04 00:34:03'),
(198, 202, 2, '20.0000', '2023-02-04 00:34:22', '2023-02-04 00:34:22'),
(199, 203, 2, '67.0000', '2023-02-04 00:34:58', '2023-02-04 00:34:58'),
(200, 204, 2, '40.0000', '2023-02-04 00:35:34', '2023-02-04 00:37:22'),
(201, 205, 2, '67.0000', '2023-02-04 00:36:01', '2023-02-04 00:36:01'),
(202, 206, 2, '67.0000', '2023-02-04 00:36:51', '2023-02-04 00:38:37'),
(203, 207, 2, '60.0000', '2023-02-04 00:38:01', '2023-02-04 00:38:01'),
(204, 208, 2, '60.0000', '2023-02-04 00:38:46', '2023-02-04 00:38:46'),
(205, 209, 2, '20.0000', '2023-02-04 00:39:29', '2023-02-04 00:39:29'),
(206, 210, 2, '20.0000', '2023-02-04 00:40:11', '2023-02-04 00:40:11'),
(207, 211, 2, '67.0000', '2023-02-04 00:40:21', '2023-02-04 00:40:21'),
(208, 212, 2, '35.0000', '2023-02-04 00:40:52', '2023-02-04 00:40:52'),
(209, 213, 2, '67.0000', '2023-02-04 00:41:19', '2023-02-04 00:41:19'),
(210, 214, 2, '150.0000', '2023-02-04 00:41:39', '2023-02-04 00:41:39'),
(211, 215, 2, '260.0000', '2023-02-04 00:42:22', '2023-02-04 00:42:22'),
(212, 216, 2, '67.0000', '2023-02-04 00:42:44', '2023-02-04 00:42:44'),
(213, 217, 2, '25.0000', '2023-02-04 00:43:09', '2023-02-04 00:43:09'),
(214, 218, 2, '67.0000', '2023-02-04 00:43:39', '2023-02-04 00:43:39'),
(215, 219, 2, '320.0000', '2023-02-04 00:43:59', '2023-02-04 00:45:00'),
(216, 220, 2, '67.0000', '2023-02-04 00:44:32', '2023-02-04 00:44:32'),
(217, 222, 2, '20.0000', '2023-02-04 00:45:36', '2023-02-04 00:45:36'),
(218, 221, 2, '105.0000', '2023-02-04 00:45:39', '2023-02-04 00:45:39'),
(219, 223, 2, '20.0000', '2023-02-04 00:46:26', '2023-02-04 00:46:26'),
(220, 225, 2, '105.0000', '2023-02-04 00:46:58', '2023-02-04 00:46:58'),
(221, 226, 2, '70.0000', '2023-02-04 00:47:14', '2023-02-04 00:47:14'),
(222, 227, 2, '105.0000', '2023-02-04 00:47:51', '2023-02-04 00:47:51'),
(223, 228, 2, '40.0000', '2023-02-04 00:47:58', '2023-02-04 00:47:58'),
(224, 230, 2, '15.0000', '2023-02-04 00:48:47', '2023-02-04 00:48:47'),
(225, 229, 2, '420.0000', '2023-02-04 00:48:51', '2023-02-04 00:48:51'),
(226, 231, 2, '30.0000', '2023-02-04 00:49:32', '2023-02-04 00:49:32'),
(227, 232, 2, '420.0000', '2023-02-04 00:49:50', '2023-02-04 00:49:50'),
(228, 233, 2, '55.0000', '2023-02-04 00:50:18', '2023-02-04 00:50:18'),
(229, 234, 2, '420.0000', '2023-02-04 00:51:34', '2023-02-04 00:51:34'),
(230, 235, 2, '170.0000', '2023-02-04 00:52:31', '2023-02-04 00:52:31'),
(231, 236, 2, '215.0000', '2023-02-04 00:53:21', '2023-02-04 00:53:21'),
(232, 237, 2, '110.0000', '2023-02-04 00:54:02', '2023-02-04 00:54:02'),
(233, 238, 2, '55.0000', '2023-02-04 00:54:44', '2023-02-04 00:54:44'),
(234, 239, 2, '55.0000', '2023-02-04 00:55:00', '2023-02-04 00:55:00'),
(235, 240, 2, '210.0000', '2023-02-04 00:55:49', '2023-02-04 00:55:49'),
(236, 241, 2, '55.0000', '2023-02-04 00:55:53', '2023-02-04 00:55:53'),
(237, 242, 2, '730.0000', '2023-02-04 00:56:47', '2023-02-04 00:56:47'),
(238, 243, 2, '55.0000', '2023-02-04 00:56:53', '2023-02-04 00:56:53'),
(239, 244, 2, '130.0000', '2023-02-04 00:57:29', '2023-02-04 00:57:29'),
(240, 245, 2, '385.0000', '2023-02-04 00:57:59', '2023-02-04 00:57:59'),
(241, 246, 2, '110.0000', '2023-02-04 00:58:18', '2023-02-04 00:58:18'),
(242, 248, 2, '180.0000', '2023-02-04 00:59:07', '2023-02-04 00:59:07'),
(243, 249, 2, '250.0000', '2023-02-04 00:59:23', '2023-02-04 00:59:23'),
(244, 250, 2, '180.0000', '2023-02-04 01:00:03', '2023-02-04 01:00:03'),
(245, 251, 2, '35.0000', '2023-02-04 01:00:05', '2023-02-04 01:00:05'),
(246, 252, 2, '45.0000', '2023-02-04 01:00:44', '2023-02-04 01:00:44'),
(247, 253, 2, '180.0000', '2023-02-04 01:01:00', '2023-02-04 01:01:00'),
(248, 254, 2, '55.0000', '2023-02-04 01:01:23', '2023-02-04 01:01:23'),
(249, 255, 2, '189.0000', '2023-02-04 01:02:01', '2023-02-04 01:02:01'),
(250, 256, 2, '65.0000', '2023-02-04 01:02:29', '2023-02-04 01:02:29'),
(251, 257, 2, '54.0000', '2023-02-04 01:02:54', '2023-02-04 01:02:54'),
(252, 258, 2, '30.0000', '2023-02-04 01:03:13', '2023-02-04 01:03:13'),
(253, 260, 2, '20.0000', '2023-02-04 01:03:58', '2023-02-04 01:03:58'),
(254, 259, 2, '54.0000', '2023-02-04 01:04:00', '2023-02-04 01:04:00'),
(255, 261, 2, '54.0000', '2023-02-04 01:04:57', '2023-02-04 01:04:57'),
(256, 262, 2, '35.0000', '2023-02-04 01:05:09', '2023-02-04 01:05:39'),
(257, 263, 2, '340.0000', '2023-02-04 01:05:51', '2023-02-04 01:05:51'),
(258, 264, 2, '35.0000', '2023-02-04 01:06:26', '2023-02-04 01:06:26'),
(259, 265, 2, '340.0000', '2023-02-04 01:06:47', '2023-02-04 01:06:47'),
(260, 266, 2, '40.0000', '2023-02-04 01:07:18', '2023-02-04 01:07:18'),
(261, 267, 2, '495.0000', '2023-02-04 01:08:08', '2023-02-04 01:08:08'),
(262, 268, 2, '40.0000', '2023-02-04 01:09:01', '2023-02-04 01:09:01'),
(263, 269, 2, '495.0000', '2023-02-04 01:09:14', '2023-02-04 01:09:14'),
(264, 270, 2, '494.0000', '2023-02-04 01:10:23', '2023-02-04 01:10:23'),
(265, 271, 2, '12.0000', '2023-02-04 01:11:19', '2023-02-04 01:11:59'),
(266, 272, 2, '30.0000', '2023-02-04 01:12:45', '2023-02-04 01:12:45'),
(267, 273, 2, '35.0000', '2023-02-04 01:13:31', '2023-02-04 01:13:31'),
(268, 274, 2, '205.0000', '2023-02-04 01:13:51', '2023-02-04 01:13:51'),
(269, 275, 2, '30.0000', '2023-02-04 01:14:22', '2023-02-04 01:14:22'),
(270, 276, 2, '205.0000', '2023-02-04 01:14:42', '2023-02-04 01:14:42'),
(271, 277, 2, '60.0000', '2023-02-04 01:15:05', '2023-02-04 01:15:05'),
(272, 278, 2, '205.0000', '2023-02-04 01:15:29', '2023-02-04 01:15:29'),
(273, 279, 2, '120.0000', '2023-02-04 01:16:11', '2023-02-04 01:16:11'),
(274, 280, 2, '205.0000', '2023-02-04 01:16:25', '2023-02-04 01:16:25'),
(275, 281, 2, '110.0000', '2023-02-04 01:17:10', '2023-02-04 01:17:10'),
(276, 283, 2, '85.0000', '2023-02-04 01:18:04', '2023-02-04 01:18:04'),
(277, 282, 2, '435.0000', '2023-02-04 01:18:06', '2023-02-04 01:18:06'),
(278, 284, 2, '55.0000', '2023-02-04 01:19:00', '2023-02-04 01:19:00'),
(279, 285, 2, '435.0000', '2023-02-04 01:19:24', '2023-02-04 01:19:24'),
(280, 286, 2, '50.0000', '2023-02-04 01:19:51', '2023-02-04 01:19:51'),
(281, 287, 2, '50.0000', '2023-02-04 01:20:37', '2023-02-04 01:20:37'),
(282, 288, 2, '675.0000', '2023-02-04 01:21:12', '2023-02-04 01:21:12'),
(283, 289, 2, '50.0000', '2023-02-04 01:21:43', '2023-02-04 01:21:43'),
(284, 290, 2, '675.0000', '2023-02-04 01:22:33', '2023-02-04 01:22:33'),
(285, 291, 2, '55.0000', '2023-02-04 01:22:35', '2023-02-04 01:22:35'),
(286, 292, 2, '280.0000', '2023-02-04 01:23:33', '2023-02-04 01:23:33'),
(287, 293, 2, '675.0000', '2023-02-04 01:23:38', '2023-02-04 01:23:38'),
(288, 294, 2, '35.0000', '2023-02-04 01:24:20', '2023-02-04 01:24:20'),
(289, 295, 2, '675.0000', '2023-02-04 01:24:49', '2023-02-04 01:24:49'),
(290, 296, 2, '145.0000', '2023-02-04 01:25:15', '2023-02-04 01:25:15'),
(291, 297, 2, '145.0000', '2023-02-04 01:25:59', '2023-02-04 01:25:59'),
(292, 298, 2, '62.0000', '2023-02-04 01:26:35', '2023-02-04 01:26:35'),
(293, 299, 2, '45.0000', '2023-02-04 01:26:47', '2023-02-04 01:26:47'),
(294, 300, 2, '90.0000', '2023-02-04 01:27:38', '2023-02-04 01:27:38'),
(295, 301, 2, '110.0000', '2023-02-04 01:27:55', '2023-02-04 01:27:55'),
(296, 302, 2, '92.0000', '2023-02-04 01:28:41', '2023-02-04 01:28:41'),
(297, 303, 2, '165.0000', '2023-02-04 01:28:56', '2023-02-04 01:28:56'),
(298, 304, 2, '45.0000', '2023-02-04 01:29:42', '2023-02-04 01:29:42'),
(299, 305, 2, '85.0000', '2023-02-04 01:30:04', '2023-02-04 01:30:04'),
(300, 307, 2, '100.0000', '2023-02-04 01:30:49', '2023-02-04 01:30:49'),
(301, 306, 2, '57.0000', '2023-02-04 01:30:53', '2023-02-04 01:30:53'),
(302, 308, 2, '27.0000', '2023-02-04 01:32:12', '2023-02-04 01:32:12'),
(303, 309, 2, '155.0000', '2023-02-04 01:32:34', '2023-02-04 01:32:34'),
(304, 310, 2, '45.0000', '2023-02-04 01:33:08', '2023-02-04 01:33:08'),
(305, 311, 2, '349.0000', '2023-02-04 01:33:32', '2023-02-04 01:33:32'),
(306, 312, 2, '100.0000', '2023-02-04 01:34:29', '2023-02-04 01:34:29'),
(307, 313, 2, '89.0000', '2023-02-04 01:34:46', '2023-02-04 01:34:46'),
(308, 314, 2, '155.0000', '2023-02-04 01:35:20', '2023-02-04 01:35:20'),
(309, 315, 2, '349.0000', '2023-02-04 01:36:41', '2023-02-04 01:36:41'),
(310, 316, 2, '157.0000', '2023-02-04 01:37:05', '2023-02-04 01:37:05'),
(311, 317, 2, '100.0000', '2023-02-04 01:37:28', '2023-02-04 01:37:28'),
(312, 318, 2, '155.0000', '2023-02-04 01:38:16', '2023-02-04 01:38:16'),
(313, 319, 2, '157.0000', '2023-02-04 01:38:27', '2023-02-04 01:38:27'),
(314, 320, 2, '349.0000', '2023-02-04 01:39:11', '2023-02-04 01:39:11'),
(315, 321, 2, '95.0000', '2023-02-04 01:40:08', '2023-02-04 01:40:08'),
(316, 322, 2, '167.0000', '2023-02-04 01:41:17', '2023-02-04 01:41:17'),
(317, 323, 2, '95.0000', '2023-02-04 01:42:09', '2023-02-04 01:44:45'),
(318, 324, 2, '167.0000', '2023-02-04 01:43:01', '2023-02-04 01:43:01'),
(319, 325, 2, '95.0000', '2023-02-04 01:45:52', '2023-02-04 01:45:52'),
(320, 326, 2, '167.0000', '2023-02-04 01:46:38', '2023-02-04 01:46:38'),
(321, 327, 2, '272.0000', '2023-02-04 01:47:24', '2023-02-04 01:47:24'),
(322, 328, 2, '272.0000', '2023-02-04 01:48:23', '2023-02-04 01:48:23'),
(323, 329, 2, '272.0000', '2023-02-04 01:49:07', '2023-02-04 01:49:07'),
(324, 330, 2, '140.0000', '2023-02-04 01:50:21', '2023-02-04 01:50:21'),
(325, 331, 2, '230.0000', '2023-02-04 01:51:10', '2023-02-04 01:51:10'),
(326, 332, 2, '367.0000', '2023-02-04 01:51:54', '2023-02-04 01:51:54'),
(327, 333, 2, '140.0000', '2023-02-04 01:52:37', '2023-02-04 01:52:37'),
(328, 334, 2, '230.0000', '2023-02-04 01:53:24', '2023-02-04 01:53:24'),
(329, 335, 2, '367.0000', '2023-02-04 01:54:21', '2023-02-04 01:54:21'),
(330, 336, 2, '140.0000', '2023-02-04 01:55:44', '2023-02-04 01:55:44'),
(331, 337, 2, '157.0000', '2023-02-04 01:55:58', '2023-02-04 01:55:58'),
(332, 338, 2, '230.0000', '2023-02-04 01:56:32', '2023-02-04 01:56:32'),
(333, 339, 2, '157.0000', '2023-02-04 01:57:08', '2023-02-04 01:57:08'),
(334, 340, 2, '367.0000', '2023-02-04 01:57:26', '2023-02-04 01:57:26'),
(335, 341, 2, '267.0000', '2023-02-04 01:58:39', '2023-02-04 01:58:39'),
(336, 342, 2, '172.0000', '2023-02-04 01:58:50', '2023-02-04 01:58:50'),
(337, 343, 2, '90.0000', '2023-02-04 01:59:39', '2023-02-04 01:59:39'),
(338, 344, 2, '267.0000', '2023-02-04 02:02:22', '2023-02-04 02:02:22'),
(339, 345, 2, '267.0000', '2023-02-04 02:03:57', '2023-02-04 02:03:57'),
(340, 346, 2, '157.0000', '2023-02-04 02:06:55', '2023-02-04 02:06:55'),
(341, 347, 2, '157.0000', '2023-02-04 02:09:40', '2023-02-04 02:09:40'),
(342, 348, 2, '267.0000', '2023-02-04 02:12:40', '2023-02-04 02:12:40'),
(343, 349, 2, '267.0000', '2023-02-04 02:22:07', '2023-02-04 02:22:07'),
(344, 350, 2, '59.0000', '2023-02-04 02:24:24', '2023-02-04 02:24:24'),
(345, 351, 2, '140.0000', '2023-02-04 02:25:51', '2023-02-04 02:25:51'),
(346, 352, 2, '140.0000', '2023-02-04 02:32:51', '2023-02-04 02:32:51'),
(347, 353, 2, '86.0000', '2023-02-04 02:33:44', '2023-02-04 02:33:44'),
(348, 354, 2, '25.0000', '2023-02-04 02:34:51', '2023-02-04 02:34:51'),
(349, 355, 2, '72.0000', '2023-02-04 02:36:03', '2023-02-04 02:36:03'),
(350, 356, 2, '113.0000', '2023-02-04 02:36:57', '2023-02-04 02:36:57'),
(351, 357, 2, '238.0000', '2023-02-04 02:37:48', '2023-02-04 02:37:49'),
(352, 358, 2, '72.0000', '2023-02-04 02:39:49', '2023-02-04 02:39:49'),
(353, 359, 2, '116.0000', '2023-02-04 02:40:47', '2023-02-04 02:40:47'),
(354, 360, 2, '247.0000', '2023-02-04 02:42:10', '2023-02-04 02:42:10'),
(355, 361, 2, '58.0000', '2023-02-04 02:43:14', '2023-02-04 02:43:14'),
(356, 362, 2, '89.0000', '2023-02-04 02:44:17', '2023-02-04 02:44:17'),
(357, 363, 2, '247.0000', '2023-02-04 02:45:30', '2023-02-04 02:45:30'),
(358, 364, 2, '76.0000', '2023-02-04 02:46:20', '2023-02-04 02:46:20'),
(359, 365, 2, '116.0000', '2023-02-04 02:49:37', '2023-02-04 02:49:37'),
(360, 366, 2, '247.0000', '2023-02-04 03:03:20', '2023-02-04 03:03:20'),
(361, 367, 2, '247.0000', '2023-02-04 03:06:14', '2023-02-04 03:06:14'),
(362, 368, 2, '116.0000', '2023-02-04 03:07:15', '2023-02-04 03:07:15'),
(363, 369, 2, '116.0000', '2023-02-04 03:08:24', '2023-02-04 03:08:24'),
(364, 370, 2, '225.0000', '2023-02-04 03:10:07', '2023-02-04 03:10:07'),
(365, 371, 2, '95.0000', '2023-02-04 03:11:15', '2023-02-04 03:11:15'),
(366, 372, 2, '140.0000', '2023-02-04 03:12:21', '2023-02-04 03:12:21'),
(367, 373, 2, '267.0000', '2023-02-04 03:13:27', '2023-02-04 03:13:27'),
(368, 374, 2, '363.0000', '2023-02-04 03:15:08', '2023-02-04 03:15:08'),
(369, 375, 2, '95.0000', '2023-02-04 03:16:29', '2023-02-04 03:16:29'),
(370, 376, 2, '140.0000', '2023-02-04 03:17:36', '2023-02-04 03:17:36'),
(371, 377, 2, '267.0000', '2023-02-04 03:18:43', '2023-02-04 03:18:43'),
(372, 378, 2, '363.0000', '2023-02-04 03:19:55', '2023-02-04 03:19:55'),
(373, 379, 2, '95.0000', '2023-02-04 03:21:18', '2023-02-04 03:21:18'),
(374, 380, 2, '140.0000', '2023-02-04 03:22:20', '2023-02-04 03:22:20'),
(375, 381, 2, '267.0000', '2023-02-04 03:23:11', '2023-02-04 03:23:11'),
(376, 382, 2, '363.0000', '2023-02-04 03:24:03', '2023-02-04 03:24:03'),
(378, 384, 2, '140.0000', '2023-02-04 03:28:10', '2023-02-04 03:28:10'),
(379, 385, 2, '267.0000', '2023-02-04 03:29:30', '2023-02-04 03:29:30'),
(380, 386, 2, '267.0000', '2023-02-04 03:32:06', '2023-02-04 03:32:06'),
(381, 387, 2, '66.0000', '2023-02-04 03:33:22', '2023-02-04 03:33:22'),
(382, 388, 2, '84.0000', '2023-02-04 03:34:28', '2023-02-04 03:34:28'),
(383, 389, 2, '139.0000', '2023-02-04 03:35:46', '2023-02-04 03:35:46'),
(384, 390, 2, '75.0000', '2023-02-04 03:36:37', '2023-02-04 03:36:37'),
(385, 391, 2, '109.0000', '2023-02-04 03:39:16', '2023-02-04 03:39:16'),
(386, 392, 2, '168.0000', '2023-02-04 03:41:15', '2023-02-04 03:41:15'),
(387, 393, 2, '75.0000', '2023-02-04 03:42:49', '2023-02-04 03:42:49'),
(388, 394, 2, '109.0000', '2023-02-04 03:44:13', '2023-02-04 03:44:13'),
(389, 395, 2, '168.0000', '2023-02-04 03:46:10', '2023-02-04 03:46:10'),
(390, 396, 2, '75.0000', '2023-02-04 03:47:56', '2023-02-04 03:47:56'),
(391, 397, 2, '109.0000', '2023-02-04 03:49:21', '2023-02-04 03:49:21');

-- --------------------------------------------------------

--
-- Table structure for table `variation_location_details`
--

CREATE TABLE `variation_location_details` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `product_variation_id` int UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NOT NULL,
  `qty_available` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_location_details`
--

INSERT INTO `variation_location_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `location_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 3, '0.0000', '2023-01-16 21:24:24', '2023-01-16 21:24:40'),
(2, 2, 2, 2, 2, '18.0000', '2023-02-02 18:55:41', '2023-02-03 17:06:25'),
(3, 3, 3, 3, 4, '6.0000', '2023-02-03 13:42:07', '2023-02-03 13:42:07'),
(4, 4, 4, 4, 4, '4.0000', '2023-02-03 14:05:12', '2023-02-03 14:05:12'),
(5, 5, 5, 5, 4, '3.0000', '2023-02-03 14:07:47', '2023-02-03 14:07:47'),
(6, 6, 6, 6, 4, '5.0000', '2023-02-03 14:11:59', '2023-02-03 14:11:59'),
(7, 7, 7, 7, 4, '4.0000', '2023-02-03 14:14:09', '2023-02-03 16:51:38'),
(8, 8, 8, 8, 4, '3.0000', '2023-02-03 14:19:39', '2023-02-03 14:19:39'),
(9, 9, 9, 9, 4, '5.0000', '2023-02-03 14:25:05', '2023-02-03 14:25:05'),
(10, 10, 10, 10, 4, '5.0000', '2023-02-03 14:27:27', '2023-02-03 14:27:27'),
(11, 11, 11, 11, 4, '5.0000', '2023-02-03 14:29:36', '2023-02-03 14:29:36'),
(12, 12, 12, 12, 4, '2.0000', '2023-02-03 14:31:28', '2023-02-03 14:31:28'),
(13, 13, 13, 13, 4, '3.0000', '2023-02-03 14:32:41', '2023-02-03 14:32:41'),
(14, 14, 14, 14, 4, '2.0000', '2023-02-03 14:33:59', '2023-02-03 14:33:59'),
(15, 15, 15, 15, 4, '3.0000', '2023-02-03 14:35:16', '2023-02-03 14:35:16'),
(16, 16, 16, 16, 4, '5.0000', '2023-02-03 14:36:34', '2023-02-03 14:36:34'),
(17, 17, 17, 17, 4, '5.0000', '2023-02-03 14:37:44', '2023-02-03 14:37:44'),
(18, 18, 18, 18, 4, '5.0000', '2023-02-03 14:38:40', '2023-02-03 14:38:40'),
(19, 19, 19, 19, 4, '5.0000', '2023-02-03 14:40:43', '2023-02-03 14:40:43'),
(20, 20, 20, 20, 4, '3.0000', '2023-02-03 14:41:46', '2023-02-03 14:41:46'),
(21, 21, 21, 21, 4, '3.0000', '2023-02-03 14:42:51', '2023-02-03 14:42:51'),
(22, 22, 22, 22, 4, '3.0000', '2023-02-03 14:44:19', '2023-02-03 14:44:19'),
(23, 23, 23, 23, 4, '3.0000', '2023-02-03 14:45:15', '2023-02-03 14:45:15'),
(24, 24, 24, 24, 4, '5.0000', '2023-02-03 14:46:09', '2023-02-03 14:46:09'),
(25, 25, 25, 25, 4, '5.0000', '2023-02-03 14:47:04', '2023-02-03 14:47:04'),
(26, 26, 26, 26, 4, '3.0000', '2023-02-03 14:47:54', '2023-02-03 14:47:54'),
(27, 27, 27, 27, 4, '3.0000', '2023-02-03 14:49:29', '2023-02-03 14:49:29'),
(28, 28, 28, 28, 4, '5.0000', '2023-02-03 14:50:28', '2023-02-03 14:50:28'),
(29, 29, 29, 29, 4, '3.0000', '2023-02-03 14:51:19', '2023-02-03 14:51:19'),
(30, 30, 30, 30, 4, '3.0000', '2023-02-03 14:52:20', '2023-02-03 14:52:20'),
(31, 31, 31, 31, 4, '3.0000', '2023-02-03 14:53:11', '2023-02-03 14:53:11'),
(32, 32, 32, 32, 4, '3.0000', '2023-02-03 14:54:18', '2023-02-03 14:54:18'),
(33, 33, 33, 33, 4, '9.0000', '2023-02-03 14:56:07', '2023-02-03 16:36:04'),
(34, 34, 34, 34, 4, '5.0000', '2023-02-03 14:59:18', '2023-02-03 14:59:18'),
(35, 35, 35, 35, 4, '5.0000', '2023-02-03 15:00:52', '2023-02-03 15:00:52'),
(36, 36, 36, 36, 4, '3.0000', '2023-02-03 15:01:46', '2023-02-03 15:01:46'),
(37, 37, 37, 37, 4, '3.0000', '2023-02-03 15:02:40', '2023-02-03 15:02:40'),
(38, 38, 38, 38, 4, '3.0000', '2023-02-03 15:03:23', '2023-02-03 15:03:23'),
(39, 39, 39, 39, 4, '3.0000', '2023-02-03 15:04:07', '2023-02-03 15:04:07'),
(40, 40, 40, 40, 4, '3.0000', '2023-02-03 15:04:48', '2023-02-03 15:04:48'),
(41, 41, 41, 41, 4, '3.0000', '2023-02-03 15:05:45', '2023-02-03 15:05:45'),
(42, 42, 42, 42, 4, '2.0000', '2023-02-03 15:07:24', '2023-02-03 15:07:24'),
(43, 43, 43, 43, 4, '5.0000', '2023-02-03 15:08:24', '2023-02-03 15:08:24'),
(44, 45, 45, 45, 4, '0.0000', '2023-02-03 15:10:26', '2023-02-03 16:51:38'),
(45, 46, 46, 46, 4, '3.0000', '2023-02-03 15:11:29', '2023-02-03 15:11:29'),
(46, 47, 47, 47, 4, '4.0000', '2023-02-03 15:12:32', '2023-02-03 15:12:32'),
(47, 48, 48, 48, 4, '4.0000', '2023-02-03 15:13:32', '2023-02-03 15:13:32'),
(48, 49, 49, 49, 4, '6.0000', '2023-02-03 15:14:21', '2023-02-03 15:14:21'),
(49, 50, 50, 50, 4, '4.0000', '2023-02-03 15:15:10', '2023-02-03 15:15:10'),
(50, 51, 51, 51, 4, '4.0000', '2023-02-03 15:16:00', '2023-02-03 15:16:00'),
(51, 52, 52, 52, 4, '5.0000', '2023-02-03 15:17:16', '2023-02-03 15:17:16'),
(52, 53, 53, 53, 4, '5.0000', '2023-02-03 15:28:39', '2023-02-03 15:28:39'),
(53, 54, 54, 54, 4, '2.0000', '2023-02-03 15:30:40', '2023-02-03 16:51:38'),
(54, 55, 55, 55, 4, '3.0000', '2023-02-03 15:31:47', '2023-02-03 15:31:47'),
(55, 56, 56, 56, 4, '6.0000', '2023-02-03 15:32:41', '2023-02-03 15:32:41'),
(56, 57, 57, 57, 4, '4.0000', '2023-02-03 15:33:37', '2023-02-03 15:33:37'),
(57, 58, 58, 58, 4, '4.0000', '2023-02-03 15:34:27', '2023-02-03 15:34:27'),
(58, 59, 59, 59, 4, '3.0000', '2023-02-03 15:35:22', '2023-02-03 16:51:38'),
(59, 60, 60, 60, 4, '4.0000', '2023-02-03 15:37:24', '2023-02-03 15:37:24'),
(60, 61, 61, 61, 4, '5.0000', '2023-02-03 15:38:20', '2023-02-03 15:38:20'),
(61, 62, 62, 62, 4, '3.0000', '2023-02-03 15:39:23', '2023-02-03 15:39:23'),
(62, 63, 63, 63, 4, '5.0000', '2023-02-03 15:40:19', '2023-02-03 15:40:19'),
(63, 64, 64, 64, 4, '3.0000', '2023-02-03 15:41:16', '2023-02-03 15:41:16'),
(64, 65, 65, 65, 4, '3.0000', '2023-02-03 15:42:16', '2023-02-03 15:42:16'),
(65, 66, 66, 66, 4, '3.0000', '2023-02-03 15:43:23', '2023-02-03 15:43:23'),
(66, 67, 67, 67, 4, '3.0000', '2023-02-03 15:44:31', '2023-02-03 15:44:31'),
(67, 68, 68, 68, 4, '3.0000', '2023-02-03 15:45:24', '2023-02-03 15:45:24'),
(68, 70, 70, 70, 4, '6.0000', '2023-02-03 15:47:06', '2023-02-03 15:47:06'),
(69, 71, 71, 71, 4, '3.0000', '2023-02-03 15:48:10', '2023-02-03 15:48:10'),
(70, 72, 72, 72, 4, '3.0000', '2023-02-03 15:48:56', '2023-02-03 15:48:56'),
(71, 73, 73, 73, 4, '5.0000', '2023-02-03 15:49:43', '2023-02-03 15:49:43'),
(72, 74, 74, 74, 4, '3.0000', '2023-02-03 15:50:33', '2023-02-03 15:50:33'),
(73, 75, 75, 75, 4, '3.0000', '2023-02-03 15:51:30', '2023-02-03 15:51:30'),
(74, 76, 76, 76, 4, '6.0000', '2023-02-03 15:52:56', '2023-02-03 15:52:56'),
(75, 77, 77, 77, 4, '6.0000', '2023-02-03 15:54:14', '2023-02-03 15:54:14'),
(77, 80, 80, 80, 4, '3.0000', '2023-02-03 22:49:29', '2023-02-03 22:49:29'),
(78, 81, 81, 81, 4, '3.0000', '2023-02-03 22:50:43', '2023-02-03 22:50:43'),
(79, 82, 82, 82, 4, '10.0000', '2023-02-03 22:52:03', '2023-02-03 22:52:03'),
(80, 83, 83, 83, 4, '12.0000', '2023-02-03 22:53:13', '2023-02-03 22:53:13'),
(81, 84, 84, 84, 4, '12.0000', '2023-02-03 22:54:32', '2023-02-03 22:54:32'),
(82, 85, 85, 85, 4, '3.0000', '2023-02-03 22:55:46', '2023-02-03 22:55:46'),
(83, 86, 86, 86, 4, '24.0000', '2023-02-03 22:56:43', '2023-02-03 22:56:43'),
(84, 87, 87, 87, 4, '12.0000', '2023-02-03 23:01:28', '2023-02-03 23:01:28'),
(85, 88, 88, 88, 4, '3.0000', '2023-02-03 23:03:14', '2023-02-03 23:03:14'),
(86, 89, 89, 89, 4, '3.0000', '2023-02-03 23:04:16', '2023-02-03 23:04:16'),
(87, 90, 90, 90, 4, '6.0000', '2023-02-03 23:05:14', '2023-02-03 23:05:14'),
(88, 91, 91, 91, 4, '6.0000', '2023-02-03 23:06:25', '2023-02-03 23:06:25'),
(89, 92, 92, 92, 4, '12.0000', '2023-02-03 23:07:21', '2023-02-03 23:07:21'),
(90, 93, 93, 93, 4, '6.0000', '2023-02-03 23:09:08', '2023-02-03 23:09:08'),
(91, 94, 94, 94, 4, '3.0000', '2023-02-03 23:10:15', '2023-02-03 23:10:15'),
(92, 95, 95, 95, 4, '3.0000', '2023-02-03 23:11:17', '2023-02-03 23:11:17'),
(93, 96, 96, 96, 4, '3.0000', '2023-02-03 23:12:22', '2023-02-03 23:12:22'),
(94, 97, 97, 97, 4, '3.0000', '2023-02-03 23:15:27', '2023-02-03 23:15:27'),
(95, 98, 98, 98, 4, '3.0000', '2023-02-03 23:17:02', '2023-02-03 23:17:02'),
(96, 99, 99, 99, 4, '3.0000', '2023-02-03 23:18:17', '2023-02-03 23:18:17'),
(97, 101, 101, 101, 4, '3.0000', '2023-02-03 23:19:32', '2023-02-03 23:19:32'),
(98, 102, 102, 102, 4, '4.0000', '2023-02-03 23:19:36', '2023-02-03 23:19:36'),
(99, 103, 103, 103, 4, '6.0000', '2023-02-03 23:21:22', '2023-02-03 23:21:22'),
(100, 104, 104, 104, 4, '12.0000', '2023-02-03 23:22:15', '2023-02-03 23:22:15'),
(101, 105, 105, 105, 4, '3.0000', '2023-02-03 23:23:51', '2023-02-03 23:23:51'),
(102, 106, 106, 106, 4, '15.0000', '2023-02-03 23:24:55', '2023-02-03 23:24:55'),
(103, 107, 107, 107, 4, '8.0000', '2023-02-03 23:25:46', '2023-02-03 23:25:46'),
(104, 108, 108, 108, 4, '6.0000', '2023-02-03 23:26:44', '2023-02-03 23:26:44'),
(105, 109, 109, 109, 4, '12.0000', '2023-02-03 23:27:39', '2023-02-03 23:27:39'),
(106, 110, 110, 110, 4, '6.0000', '2023-02-03 23:28:38', '2023-02-03 23:28:38'),
(107, 111, 111, 111, 4, '12.0000', '2023-02-03 23:29:38', '2023-02-03 23:29:38'),
(108, 112, 112, 112, 4, '6.0000', '2023-02-03 23:30:37', '2023-02-03 23:30:37'),
(109, 113, 113, 113, 4, '12.0000', '2023-02-03 23:31:34', '2023-02-03 23:31:34'),
(110, 114, 114, 114, 4, '12.0000', '2023-02-03 23:32:20', '2023-02-03 23:32:20'),
(111, 115, 115, 115, 4, '12.0000', '2023-02-03 23:33:16', '2023-02-03 23:33:16'),
(112, 116, 116, 116, 4, '12.0000', '2023-02-03 23:34:17', '2023-02-03 23:34:17'),
(113, 117, 117, 117, 4, '2.0000', '2023-02-03 23:35:37', '2023-02-03 23:35:37'),
(114, 118, 118, 118, 4, '12.0000', '2023-02-03 23:36:29', '2023-02-03 23:36:29'),
(115, 119, 119, 119, 4, '6.0000', '2023-02-03 23:37:11', '2023-02-03 23:37:11'),
(116, 120, 120, 120, 4, '6.0000', '2023-02-03 23:37:55', '2023-02-03 23:37:55'),
(117, 121, 121, 121, 4, '4.0000', '2023-02-03 23:38:35', '2023-02-03 23:38:35'),
(118, 122, 122, 122, 4, '6.0000', '2023-02-03 23:38:45', '2023-02-03 23:38:45'),
(119, 123, 123, 123, 4, '6.0000', '2023-02-03 23:39:43', '2023-02-03 23:39:43'),
(120, 124, 124, 124, 4, '5.0000', '2023-02-03 23:40:16', '2023-02-03 23:40:16'),
(121, 125, 125, 125, 4, '6.0000', '2023-02-03 23:40:34', '2023-02-03 23:40:34'),
(122, 126, 126, 126, 4, '12.0000', '2023-02-03 23:41:35', '2023-02-03 23:41:35'),
(123, 127, 127, 127, 4, '3.0000', '2023-02-03 23:41:59', '2023-02-03 23:41:59'),
(124, 128, 128, 128, 4, '12.0000', '2023-02-03 23:42:19', '2023-02-03 23:42:19'),
(125, 129, 129, 129, 4, '12.0000', '2023-02-03 23:43:06', '2023-02-03 23:43:06'),
(126, 130, 130, 130, 4, '3.0000', '2023-02-03 23:43:14', '2023-02-03 23:43:14'),
(127, 131, 131, 131, 4, '3.0000', '2023-02-03 23:43:53', '2023-02-03 23:43:53'),
(128, 133, 133, 133, 4, '12.0000', '2023-02-03 23:44:31', '2023-02-03 23:44:31'),
(129, 132, 132, 132, 4, '3.0000', '2023-02-03 23:44:31', '2023-02-03 23:44:31'),
(130, 134, 134, 134, 4, '12.0000', '2023-02-03 23:45:13', '2023-02-03 23:45:13'),
(131, 135, 135, 135, 4, '12.0000', '2023-02-03 23:46:01', '2023-02-03 23:46:01'),
(132, 136, 136, 136, 4, '3.0000', '2023-02-03 23:46:09', '2023-02-03 23:46:09'),
(133, 137, 137, 137, 4, '12.0000', '2023-02-03 23:47:18', '2023-02-03 23:47:18'),
(134, 139, 139, 139, 4, '6.0000', '2023-02-03 23:48:03', '2023-02-03 23:48:03'),
(135, 138, 138, 138, 4, '12.0000', '2023-02-03 23:48:20', '2023-02-03 23:48:20'),
(136, 140, 140, 140, 4, '7.0000', '2023-02-03 23:49:02', '2023-02-03 23:49:02'),
(137, 141, 141, 141, 4, '6.0000', '2023-02-03 23:49:29', '2023-02-03 23:49:29'),
(138, 142, 142, 142, 4, '3.0000', '2023-02-03 23:50:01', '2023-02-03 23:50:01'),
(139, 143, 143, 143, 4, '6.0000', '2023-02-03 23:50:38', '2023-02-03 23:50:38'),
(140, 144, 144, 144, 4, '2.0000', '2023-02-03 23:50:56', '2023-02-03 23:50:56'),
(141, 145, 145, 145, 4, '6.0000', '2023-02-03 23:51:46', '2023-02-03 23:51:46'),
(142, 146, 146, 146, 4, '3.0000', '2023-02-03 23:51:58', '2023-02-03 23:51:58'),
(143, 147, 147, 147, 4, '6.0000', '2023-02-03 23:52:58', '2023-02-03 23:52:58'),
(144, 148, 148, 148, 4, '3.0000', '2023-02-03 23:53:06', '2023-02-03 23:53:06'),
(145, 149, 149, 149, 4, '3.0000', '2023-02-03 23:53:53', '2023-02-03 23:53:53'),
(146, 150, 150, 150, 4, '3.0000', '2023-02-03 23:54:42', '2023-02-03 23:54:42'),
(147, 151, 151, 151, 4, '3.0000', '2023-02-03 23:55:39', '2023-02-03 23:55:39'),
(148, 152, 152, 152, 4, '3.0000', '2023-02-03 23:57:11', '2023-02-03 23:57:11'),
(149, 153, 153, 153, 4, '6.0000', '2023-02-03 23:57:35', '2023-02-03 23:57:35'),
(150, 154, 154, 154, 4, '6.0000', '2023-02-03 23:59:23', '2023-02-03 23:59:23'),
(151, 155, 155, 155, 4, '6.0000', '2023-02-04 00:00:07', '2023-02-04 00:00:07'),
(152, 156, 156, 156, 4, '12.0000', '2023-02-04 00:00:18', '2023-02-04 00:00:18'),
(153, 157, 157, 157, 4, '12.0000', '2023-02-04 00:01:07', '2023-02-04 00:01:07'),
(154, 158, 158, 158, 4, '4.0000', '2023-02-04 00:01:29', '2023-02-04 00:01:29'),
(155, 159, 159, 159, 4, '6.0000', '2023-02-04 00:01:58', '2023-02-04 00:01:58'),
(156, 160, 160, 160, 4, '24.0000', '2023-02-04 00:02:49', '2023-02-04 00:02:49'),
(157, 161, 161, 161, 4, '4.0000', '2023-02-04 00:03:16', '2023-02-04 00:03:16'),
(158, 162, 162, 162, 4, '24.0000', '2023-02-04 00:03:50', '2023-02-04 00:03:50'),
(159, 163, 163, 163, 4, '4.0000', '2023-02-04 00:04:17', '2023-02-04 00:04:17'),
(160, 164, 164, 164, 4, '2.0000', '2023-02-04 00:04:38', '2023-02-04 00:04:38'),
(161, 166, 166, 166, 4, '12.0000', '2023-02-04 00:05:19', '2023-02-04 00:05:19'),
(162, 165, 165, 165, 4, '4.0000', '2023-02-04 00:05:23', '2023-02-04 00:05:23'),
(163, 167, 167, 167, 4, '200.0000', '2023-02-04 00:06:35', '2023-02-04 00:06:35'),
(164, 168, 168, 168, 4, '864.0000', '2023-02-04 00:07:34', '2023-02-04 00:07:34'),
(165, 169, 169, 169, 4, '50.0000', '2023-02-04 00:07:46', '2023-02-04 00:07:46'),
(166, 170, 170, 170, 4, '70.0000', '2023-02-04 00:08:51', '2023-02-04 00:08:51'),
(167, 171, 171, 171, 4, '3.0000', '2023-02-04 00:08:54', '2023-02-04 00:08:54'),
(168, 172, 172, 172, 4, '3.0000', '2023-02-04 00:09:48', '2023-02-04 00:09:48'),
(169, 173, 173, 173, 4, '50.0000', '2023-02-04 00:09:53', '2023-02-04 00:09:53'),
(170, 174, 174, 174, 4, '12.0000', '2023-02-04 00:10:39', '2023-02-04 00:10:39'),
(171, 175, 175, 175, 4, '50.0000', '2023-02-04 00:11:16', '2023-02-04 00:11:16'),
(172, 176, 176, 176, 4, '6.0000', '2023-02-04 00:11:46', '2023-02-04 00:11:46'),
(173, 177, 177, 177, 4, '6.0000', '2023-02-04 00:12:33', '2023-02-04 00:12:33'),
(174, 178, 178, 178, 4, '30.0000', '2023-02-04 00:12:33', '2023-02-04 00:12:33'),
(175, 179, 179, 179, 4, '24.0000', '2023-02-04 00:14:15', '2023-02-04 00:14:15'),
(176, 180, 180, 180, 4, '6.0000', '2023-02-04 00:15:07', '2023-02-04 00:15:07'),
(177, 181, 181, 181, 4, '12.0000', '2023-02-04 00:16:01', '2023-02-04 00:16:01'),
(178, 182, 182, 182, 4, '36.0000', '2023-02-04 00:17:32', '2023-02-04 00:17:32'),
(179, 183, 183, 183, 4, '3.0000', '2023-02-04 00:18:30', '2023-02-04 00:18:30'),
(180, 184, 184, 184, 4, '12.0000', '2023-02-04 00:19:24', '2023-02-04 00:19:24'),
(181, 185, 185, 185, 4, '12.0000', '2023-02-04 00:20:10', '2023-02-04 00:20:10'),
(182, 186, 186, 186, 4, '12.0000', '2023-02-04 00:21:56', '2023-02-04 00:21:56'),
(183, 187, 187, 187, 4, '12.0000', '2023-02-04 00:22:54', '2023-02-04 00:22:54'),
(184, 188, 188, 188, 4, '8.0000', '2023-02-04 00:23:57', '2023-02-04 00:23:57'),
(185, 189, 189, 189, 4, '12.0000', '2023-02-04 00:24:46', '2023-02-04 00:24:46'),
(186, 190, 190, 190, 4, '10.0000', '2023-02-04 00:25:30', '2023-02-04 00:25:30'),
(187, 191, 191, 191, 4, '24.0000', '2023-02-04 00:26:11', '2023-02-04 00:26:11'),
(188, 192, 192, 192, 4, '10.0000', '2023-02-04 00:27:08', '2023-02-04 00:27:08'),
(189, 193, 193, 193, 4, '12.0000', '2023-02-04 00:28:58', '2023-02-04 00:28:58'),
(190, 194, 194, 194, 4, '24.0000', '2023-02-04 00:29:43', '2023-02-04 00:29:43'),
(191, 195, 195, 195, 4, '12.0000', '2023-02-04 00:30:34', '2023-02-04 00:30:34'),
(192, 196, 196, 196, 4, '24.0000', '2023-02-04 00:31:23', '2023-02-04 00:31:23'),
(193, 197, 197, 197, 4, '24.0000', '2023-02-04 00:32:06', '2023-02-04 00:32:06'),
(194, 198, 198, 198, 4, '36.0000', '2023-02-04 00:32:58', '2023-02-04 00:32:58'),
(195, 199, 199, 199, 4, '30.0000', '2023-02-04 00:33:08', '2023-02-04 00:33:08'),
(196, 200, 200, 200, 4, '36.0000', '2023-02-04 00:33:44', '2023-02-04 00:33:44'),
(197, 201, 201, 201, 4, '30.0000', '2023-02-04 00:34:10', '2023-02-04 00:34:10'),
(198, 202, 202, 202, 4, '24.0000', '2023-02-04 00:34:32', '2023-02-04 00:34:32'),
(199, 203, 203, 203, 4, '30.0000', '2023-02-04 00:35:11', '2023-02-04 00:35:11'),
(200, 205, 205, 205, 4, '10.0000', '2023-02-04 00:36:08', '2023-02-04 00:36:08'),
(201, 204, 204, 204, 4, '48.0000', '2023-02-04 00:36:39', '2023-02-04 00:36:39'),
(202, 206, 206, 206, 4, '30.0000', '2023-02-04 00:37:10', '2023-02-04 00:38:44'),
(203, 207, 207, 207, 4, '6.0000', '2023-02-04 00:38:10', '2023-02-04 00:38:10'),
(204, 208, 208, 208, 4, '6.0000', '2023-02-04 00:38:56', '2023-02-04 00:38:56'),
(205, 209, 209, 209, 4, '12.0000', '2023-02-04 00:39:41', '2023-02-04 00:39:41'),
(206, 210, 210, 210, 4, '36.0000', '2023-02-04 00:40:22', '2023-02-04 00:40:22'),
(207, 211, 211, 211, 4, '200.0000', '2023-02-04 00:40:27', '2023-02-04 00:40:27'),
(208, 212, 212, 212, 4, '12.0000', '2023-02-04 00:41:06', '2023-02-04 00:41:06'),
(209, 213, 213, 213, 4, '50.0000', '2023-02-04 00:41:27', '2023-02-04 00:41:27'),
(210, 214, 214, 214, 4, '6.0000', '2023-02-04 00:41:47', '2023-02-04 00:41:47'),
(211, 215, 215, 215, 4, '6.0000', '2023-02-04 00:42:36', '2023-02-04 00:42:36'),
(212, 216, 216, 216, 4, '50.0000', '2023-02-04 00:42:54', '2023-02-04 00:42:54'),
(213, 217, 217, 217, 4, '40.0000', '2023-02-04 00:43:19', '2023-02-04 00:43:19'),
(214, 218, 218, 218, 4, '50.0000', '2023-02-04 00:43:45', '2023-02-04 00:43:45'),
(215, 219, 219, 219, 4, '1.0000', '2023-02-04 00:44:13', '2023-02-04 00:44:13'),
(216, 220, 220, 220, 4, '50.0000', '2023-02-04 00:44:40', '2023-02-04 00:44:40'),
(217, 222, 222, 222, 4, '12.0000', '2023-02-04 00:45:44', '2023-02-04 00:45:44'),
(218, 221, 221, 221, 4, '30.0000', '2023-02-04 00:45:46', '2023-02-04 00:45:46'),
(219, 223, 223, 223, 4, '60.0000', '2023-02-04 00:46:37', '2023-02-04 00:46:37'),
(220, 225, 225, 225, 4, '20.0000', '2023-02-04 00:47:05', '2023-02-04 00:47:05'),
(221, 226, 226, 226, 4, '12.0000', '2023-02-04 00:47:23', '2023-02-04 00:47:23'),
(222, 227, 227, 227, 4, '10.0000', '2023-02-04 00:47:58', '2023-02-04 00:47:58'),
(223, 228, 228, 228, 4, '12.0000', '2023-02-04 00:48:13', '2023-02-04 00:48:13'),
(224, 230, 230, 230, 4, '24.0000', '2023-02-04 00:48:56', '2023-02-04 00:48:56'),
(225, 229, 229, 229, 4, '6.0000', '2023-02-04 00:48:58', '2023-02-04 00:48:58'),
(226, 231, 231, 231, 4, '36.0000', '2023-02-04 00:49:42', '2023-02-04 00:49:42'),
(227, 232, 232, 232, 4, '6.0000', '2023-02-04 00:49:58', '2023-02-04 00:49:58'),
(228, 233, 233, 233, 4, '12.0000', '2023-02-04 00:50:28', '2023-02-04 00:50:28'),
(229, 234, 234, 234, 4, '6.0000', '2023-02-04 00:51:53', '2023-02-04 00:51:53'),
(230, 235, 235, 235, 4, '144.0000', '2023-02-04 00:52:45', '2023-02-04 00:52:45'),
(231, 236, 236, 236, 4, '3.0000', '2023-02-04 00:53:28', '2023-02-04 00:53:28'),
(232, 237, 237, 237, 4, '6.0000', '2023-02-04 00:54:19', '2023-02-04 00:54:19'),
(233, 238, 238, 238, 4, '50.0000', '2023-02-04 00:54:51', '2023-02-04 00:54:51'),
(234, 239, 239, 239, 4, '10.0000', '2023-02-04 00:55:10', '2023-02-04 00:55:10'),
(235, 241, 241, 241, 4, '30.0000', '2023-02-04 00:55:58', '2023-02-04 00:55:58'),
(236, 240, 240, 240, 4, '6.0000', '2023-02-04 00:56:00', '2023-02-04 00:56:00'),
(237, 242, 242, 242, 4, '6.0000', '2023-02-04 00:56:53', '2023-02-04 00:56:53'),
(238, 243, 243, 243, 4, '30.0000', '2023-02-04 00:56:59', '2023-02-04 00:56:59'),
(239, 244, 244, 244, 4, '6.0000', '2023-02-04 00:57:37', '2023-02-04 00:57:37'),
(240, 245, 245, 245, 4, '6.0000', '2023-02-04 00:58:05', '2023-02-04 00:58:05'),
(241, 246, 246, 246, 4, '6.0000', '2023-02-04 00:58:28', '2023-02-04 00:58:28'),
(242, 248, 248, 248, 4, '4.0000', '2023-02-04 00:59:13', '2023-02-04 00:59:13'),
(243, 249, 249, 249, 4, '15.0000', '2023-02-04 00:59:33', '2023-02-04 00:59:33'),
(244, 250, 250, 250, 4, '4.0000', '2023-02-04 01:00:09', '2023-02-04 01:00:09'),
(245, 251, 251, 251, 4, '6.0000', '2023-02-04 01:00:14', '2023-02-04 01:00:14'),
(246, 252, 252, 252, 4, '12.0000', '2023-02-04 01:00:52', '2023-02-04 01:00:52'),
(247, 253, 253, 253, 4, '4.0000', '2023-02-04 01:01:06', '2023-02-04 01:01:06'),
(248, 254, 254, 254, 4, '4.0000', '2023-02-04 01:01:37', '2023-02-04 01:01:37'),
(249, 255, 255, 255, 4, '2.0000', '2023-02-04 01:02:09', '2023-02-04 01:02:09'),
(250, 256, 256, 256, 4, '6.0000', '2023-02-04 01:02:38', '2023-02-04 01:02:38'),
(251, 257, 257, 257, 4, '20.0000', '2023-02-04 01:03:02', '2023-02-04 01:03:02'),
(252, 258, 258, 258, 4, '25.0000', '2023-02-04 01:03:26', '2023-02-04 01:03:26'),
(253, 259, 259, 259, 4, '20.0000', '2023-02-04 01:04:05', '2023-02-04 01:04:05'),
(254, 260, 260, 260, 4, '30.0000', '2023-02-04 01:04:13', '2023-02-04 01:04:13'),
(255, 261, 261, 261, 4, '3.0000', '2023-02-04 01:05:02', '2023-02-04 01:05:02'),
(256, 262, 262, 262, 4, '12.0000', '2023-02-04 01:05:16', '2023-02-04 01:05:16'),
(257, 263, 263, 263, 4, '5.0000', '2023-02-04 01:06:02', '2023-02-04 01:06:02'),
(258, 264, 264, 264, 4, '12.0000', '2023-02-04 01:06:38', '2023-02-04 01:06:38'),
(259, 265, 265, 265, 4, '5.0000', '2023-02-04 01:06:53', '2023-02-04 01:06:53'),
(260, 266, 266, 266, 4, '12.0000', '2023-02-04 01:07:28', '2023-02-04 01:07:28'),
(261, 267, 267, 267, 4, '6.0000', '2023-02-04 01:08:15', '2023-02-04 01:08:15'),
(262, 268, 268, 268, 4, '12.0000', '2023-02-04 01:09:11', '2023-02-04 01:09:11'),
(263, 269, 269, 269, 4, '3.0000', '2023-02-04 01:09:20', '2023-02-04 01:09:20'),
(264, 270, 270, 270, 4, '3.0000', '2023-02-04 01:10:28', '2023-02-04 01:10:28'),
(265, 271, 271, 271, 4, '18.0000', '2023-02-04 01:11:26', '2023-02-04 01:11:26'),
(266, 272, 272, 272, 4, '6.0000', '2023-02-04 01:12:55', '2023-02-04 01:12:55'),
(267, 273, 273, 273, 4, '12.0000', '2023-02-04 01:13:39', '2023-02-04 01:13:39'),
(268, 274, 274, 274, 4, '6.0000', '2023-02-04 01:13:57', '2023-02-04 01:13:57'),
(269, 275, 275, 275, 4, '11.0000', '2023-02-04 01:14:32', '2023-02-04 01:14:32'),
(270, 276, 276, 276, 4, '6.0000', '2023-02-04 01:14:47', '2023-02-04 01:14:47'),
(271, 277, 277, 277, 4, '6.0000', '2023-02-04 01:15:15', '2023-02-04 01:15:15'),
(272, 278, 278, 278, 4, '6.0000', '2023-02-04 01:15:36', '2023-02-04 01:15:36'),
(273, 279, 279, 279, 4, '3.0000', '2023-02-04 01:16:22', '2023-02-04 01:16:22'),
(274, 280, 280, 280, 4, '6.0000', '2023-02-04 01:16:34', '2023-02-04 01:16:34'),
(275, 281, 281, 281, 4, '3.0000', '2023-02-04 01:17:24', '2023-02-04 01:17:24'),
(276, 282, 282, 282, 4, '6.0000', '2023-02-04 01:18:16', '2023-02-04 01:18:16'),
(277, 283, 283, 283, 4, '6.0000', '2023-02-04 01:18:21', '2023-02-04 01:18:21'),
(278, 284, 284, 284, 4, '6.0000', '2023-02-04 01:19:14', '2023-02-04 01:19:14'),
(279, 285, 285, 285, 4, '6.0000', '2023-02-04 01:19:32', '2023-02-04 01:19:32'),
(280, 286, 286, 286, 4, '10.0000', '2023-02-04 01:20:03', '2023-02-04 01:20:03'),
(281, 287, 287, 287, 4, '10.0000', '2023-02-04 01:20:51', '2023-02-04 01:20:51'),
(282, 288, 288, 288, 4, '4.0000', '2023-02-04 01:21:19', '2023-02-04 01:21:19'),
(283, 289, 289, 289, 4, '10.0000', '2023-02-04 01:21:55', '2023-02-04 01:21:55'),
(284, 290, 290, 290, 4, '4.0000', '2023-02-04 01:22:42', '2023-02-04 01:22:42'),
(285, 291, 291, 291, 4, '10.0000', '2023-02-04 01:22:47', '2023-02-04 01:22:47'),
(286, 292, 292, 292, 4, '3.0000', '2023-02-04 01:23:43', '2023-02-04 01:23:43'),
(287, 293, 293, 293, 4, '3.0000', '2023-02-04 01:23:44', '2023-02-04 01:23:44'),
(288, 294, 294, 294, 4, '6.0000', '2023-02-04 01:24:29', '2023-02-04 01:24:29'),
(289, 295, 295, 295, 4, '4.0000', '2023-02-04 01:24:56', '2023-02-04 01:24:56'),
(290, 296, 296, 296, 4, '3.0000', '2023-02-04 01:25:23', '2023-02-04 01:25:23'),
(291, 297, 297, 297, 4, '3.0000', '2023-02-04 01:26:08', '2023-02-04 01:26:08'),
(292, 298, 298, 298, 4, '16.0000', '2023-02-04 01:26:42', '2023-02-04 01:26:42'),
(293, 299, 299, 299, 4, '24.0000', '2023-02-04 01:26:56', '2023-02-04 01:26:56'),
(294, 300, 300, 300, 4, '16.0000', '2023-02-04 01:27:45', '2023-02-04 01:27:45'),
(295, 301, 301, 301, 4, '85.0000', '2023-02-04 01:28:14', '2023-02-04 01:28:14'),
(296, 302, 302, 302, 4, '16.0000', '2023-02-04 01:28:49', '2023-02-04 01:28:49'),
(297, 303, 303, 303, 4, '3.0000', '2023-02-04 01:29:06', '2023-02-04 01:29:06'),
(298, 304, 304, 304, 4, '48.0000', '2023-02-04 01:29:50', '2023-02-04 01:29:50'),
(299, 305, 305, 305, 4, '3.0000', '2023-02-04 01:30:12', '2023-02-04 01:30:12'),
(300, 307, 307, 307, 4, '6.0000', '2023-02-04 01:30:56', '2023-02-04 01:30:56'),
(301, 306, 306, 306, 4, '24.0000', '2023-02-04 01:31:04', '2023-02-04 01:31:04'),
(302, 308, 308, 308, 4, '72.0000', '2023-02-04 01:32:21', '2023-02-04 01:32:21'),
(303, 309, 309, 309, 4, '6.0000', '2023-02-04 01:32:41', '2023-02-04 01:32:41'),
(304, 310, 310, 310, 4, '72.0000', '2023-02-04 01:33:18', '2023-02-04 01:33:18'),
(305, 311, 311, 311, 4, '6.0000', '2023-02-04 01:33:37', '2023-02-04 01:33:37'),
(306, 312, 312, 312, 4, '6.0000', '2023-02-04 01:34:34', '2023-02-04 01:34:34'),
(307, 313, 313, 313, 4, '36.0000', '2023-02-04 01:34:56', '2023-02-04 01:34:56'),
(308, 314, 314, 314, 4, '6.0000', '2023-02-04 01:35:24', '2023-02-04 01:35:24'),
(309, 315, 315, 315, 4, '6.0000', '2023-02-04 01:36:46', '2023-02-04 01:36:46'),
(310, 316, 316, 316, 4, '3.0000', '2023-02-04 01:37:17', '2023-02-04 01:37:17'),
(311, 317, 317, 317, 4, '6.0000', '2023-02-04 01:37:32', '2023-02-04 01:37:32'),
(312, 318, 318, 318, 4, '6.0000', '2023-02-04 01:38:22', '2023-02-04 01:38:22'),
(313, 319, 319, 319, 4, '12.0000', '2023-02-04 01:38:34', '2023-02-04 01:38:34'),
(314, 320, 320, 320, 4, '6.0000', '2023-02-04 01:39:16', '2023-02-04 01:39:16'),
(315, 321, 321, 321, 4, '6.0000', '2023-02-04 01:40:14', '2023-02-04 01:40:14'),
(316, 322, 322, 322, 4, '6.0000', '2023-02-04 01:41:22', '2023-02-04 01:41:22'),
(317, 323, 323, 323, 4, '12.0000', '2023-02-04 01:42:14', '2023-02-04 01:42:14'),
(318, 324, 324, 324, 4, '12.0000', '2023-02-04 01:43:06', '2023-02-04 01:43:06'),
(319, 325, 325, 325, 4, '6.0000', '2023-02-04 01:45:57', '2023-02-04 01:45:57'),
(320, 326, 326, 326, 4, '6.0000', '2023-02-04 01:46:42', '2023-02-04 01:46:42'),
(321, 327, 327, 327, 4, '6.0000', '2023-02-04 01:47:30', '2023-02-04 01:47:30'),
(322, 328, 328, 328, 4, '6.0000', '2023-02-04 01:48:28', '2023-02-04 01:48:28'),
(323, 329, 329, 329, 4, '6.0000', '2023-02-04 01:49:11', '2023-02-04 01:49:11'),
(324, 330, 330, 330, 4, '6.0000', '2023-02-04 01:50:26', '2023-02-04 01:50:26'),
(325, 331, 331, 331, 4, '6.0000', '2023-02-04 01:51:13', '2023-02-04 01:51:13'),
(326, 332, 332, 332, 4, '6.0000', '2023-02-04 01:51:58', '2023-02-04 01:51:58'),
(327, 333, 333, 333, 4, '6.0000', '2023-02-04 01:52:41', '2023-02-04 01:52:41'),
(328, 334, 334, 334, 4, '6.0000', '2023-02-04 01:53:28', '2023-02-04 01:53:28'),
(329, 335, 335, 335, 4, '6.0000', '2023-02-04 01:54:28', '2023-02-04 01:54:28'),
(330, 336, 336, 336, 4, '6.0000', '2023-02-04 01:55:51', '2023-02-04 01:55:51'),
(331, 337, 337, 337, 4, '12.0000', '2023-02-04 01:56:09', '2023-02-04 01:56:09'),
(332, 338, 338, 338, 4, '6.0000', '2023-02-04 01:56:37', '2023-02-04 01:56:37'),
(333, 339, 339, 339, 4, '12.0000', '2023-02-04 01:57:21', '2023-02-04 01:57:21'),
(334, 340, 340, 340, 4, '6.0000', '2023-02-04 01:57:35', '2023-02-04 01:57:35'),
(335, 341, 341, 341, 4, '12.0000', '2023-02-04 01:58:49', '2023-02-04 01:58:49'),
(336, 342, 342, 342, 4, '12.0000', '2023-02-04 01:58:55', '2023-02-04 01:58:55'),
(337, 343, 343, 343, 4, '6.0000', '2023-02-04 01:59:43', '2023-02-04 01:59:43'),
(338, 344, 344, 344, 4, '3.0000', '2023-02-04 02:02:40', '2023-02-04 02:02:40'),
(339, 345, 345, 345, 4, '12.0000', '2023-02-04 02:04:04', '2023-02-04 02:04:04'),
(340, 346, 346, 346, 4, '3.0000', '2023-02-04 02:07:53', '2023-02-04 02:07:53'),
(341, 347, 347, 347, 4, '12.0000', '2023-02-04 02:10:46', '2023-02-04 02:10:46'),
(342, 348, 348, 348, 4, '3.0000', '2023-02-04 02:20:14', '2023-02-04 02:20:14'),
(343, 349, 349, 349, 4, '12.0000', '2023-02-04 02:22:15', '2023-02-04 02:22:15'),
(344, 350, 350, 350, 4, '7.0000', '2023-02-04 02:24:31', '2023-02-04 02:24:31'),
(345, 351, 351, 351, 4, '140.0000', '2023-02-04 02:26:01', '2023-02-04 02:26:01'),
(346, 352, 352, 352, 4, '3.0000', '2023-02-04 02:33:00', '2023-02-04 02:33:00'),
(347, 353, 353, 353, 4, '7.0000', '2023-02-04 02:33:52', '2023-02-04 02:33:52'),
(348, 354, 354, 354, 4, '13.0000', '2023-02-04 02:34:58', '2023-02-04 02:34:58'),
(349, 355, 355, 355, 4, '12.0000', '2023-02-04 02:36:11', '2023-02-04 02:36:11'),
(350, 356, 356, 356, 4, '12.0000', '2023-02-04 02:37:04', '2023-02-04 02:37:04'),
(351, 357, 357, 357, 4, '6.0000', '2023-02-04 02:37:54', '2023-02-04 02:37:54'),
(352, 358, 358, 358, 4, '12.0000', '2023-02-04 02:39:55', '2023-02-04 02:39:55'),
(353, 359, 359, 359, 4, '12.0000', '2023-02-04 02:40:53', '2023-02-04 02:40:53'),
(354, 360, 360, 360, 4, '6.0000', '2023-02-04 02:42:18', '2023-02-04 02:42:18'),
(355, 361, 361, 361, 4, '16.0000', '2023-02-04 02:43:21', '2023-02-04 02:43:21'),
(356, 362, 362, 362, 4, '16.0000', '2023-02-04 02:44:28', '2023-02-04 02:44:28'),
(357, 363, 363, 363, 4, '3.0000', '2023-02-04 02:45:36', '2023-02-04 02:45:36'),
(358, 364, 364, 364, 4, '12.0000', '2023-02-04 02:46:26', '2023-02-04 02:46:26'),
(359, 365, 365, 365, 4, '12.0000', '2023-02-04 02:49:44', '2023-02-04 02:49:44'),
(360, 366, 366, 366, 4, '3.0000', '2023-02-04 03:03:27', '2023-02-04 03:03:27'),
(361, 367, 367, 367, 4, '3.0000', '2023-02-04 03:06:20', '2023-02-04 03:06:20'),
(362, 368, 368, 368, 4, '3.0000', '2023-02-04 03:07:24', '2023-02-04 03:07:24'),
(363, 369, 369, 369, 4, '3.0000', '2023-02-04 03:08:32', '2023-02-04 03:08:32'),
(364, 370, 370, 370, 4, '3.0000', '2023-02-04 03:10:14', '2023-02-04 03:10:14'),
(365, 371, 371, 371, 4, '6.0000', '2023-02-04 03:11:27', '2023-02-04 03:11:27'),
(366, 372, 372, 372, 4, '12.0000', '2023-02-04 03:12:28', '2023-02-04 03:12:28'),
(367, 373, 373, 373, 4, '12.0000', '2023-02-04 03:13:53', '2023-02-04 03:13:53'),
(368, 374, 374, 374, 4, '6.0000', '2023-02-04 03:15:32', '2023-02-04 03:15:32'),
(369, 375, 375, 375, 4, '6.0000', '2023-02-04 03:16:34', '2023-02-04 03:16:34'),
(370, 376, 376, 376, 4, '6.0000', '2023-02-04 03:17:41', '2023-02-04 03:17:41'),
(371, 377, 377, 377, 4, '6.0000', '2023-02-04 03:18:51', '2023-02-04 03:18:51'),
(372, 378, 378, 378, 4, '6.0000', '2023-02-04 03:20:03', '2023-02-04 03:20:03'),
(373, 379, 379, 379, 4, '6.0000', '2023-02-04 03:21:24', '2023-02-04 03:21:24'),
(374, 380, 380, 380, 4, '6.0000', '2023-02-04 03:22:25', '2023-02-04 03:22:25'),
(375, 381, 381, 381, 4, '6.0000', '2023-02-04 03:23:20', '2023-02-04 03:23:20'),
(376, 382, 382, 382, 4, '6.0000', '2023-02-04 03:24:12', '2023-02-04 03:24:12'),
(378, 384, 384, 384, 4, '6.0000', '2023-02-04 03:28:36', '2023-02-04 03:28:36'),
(379, 385, 385, 385, 4, '6.0000', '2023-02-04 03:29:40', '2023-02-04 03:29:40'),
(380, 386, 386, 386, 4, '6.0000', '2023-02-04 03:32:12', '2023-02-04 03:32:13'),
(381, 387, 387, 387, 4, '12.0000', '2023-02-04 03:33:26', '2023-02-04 03:33:27'),
(382, 388, 388, 388, 4, '12.0000', '2023-02-04 03:34:34', '2023-02-04 03:34:34'),
(383, 389, 389, 389, 4, '6.0000', '2023-02-04 03:35:52', '2023-02-04 03:35:52'),
(384, 390, 390, 390, 4, '6.0000', '2023-02-04 03:36:43', '2023-02-04 03:36:43'),
(385, 391, 391, 391, 4, '6.0000', '2023-02-04 03:39:29', '2023-02-04 03:39:29'),
(386, 392, 392, 392, 4, '6.0000', '2023-02-04 03:41:27', '2023-02-04 03:41:27'),
(387, 393, 393, 393, 4, '6.0000', '2023-02-04 03:43:00', '2023-02-04 03:43:00'),
(388, 394, 394, 394, 4, '6.0000', '2023-02-04 03:44:23', '2023-02-04 03:44:23'),
(389, 395, 395, 395, 4, '6.0000', '2023-02-04 03:46:36', '2023-02-04 03:46:36'),
(390, 396, 396, 396, 4, '6.0000', '2023-02-04 03:48:04', '2023-02-04 03:48:04'),
(391, 397, 397, 397, 4, '6.0000', '2023-02-04 03:49:33', '2023-02-04 03:49:33');

-- --------------------------------------------------------

--
-- Table structure for table `variation_templates`
--

CREATE TABLE `variation_templates` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_value_templates`
--

CREATE TABLE `variation_value_templates` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variation_template_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warranties`
--

CREATE TABLE `warranties` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `duration` int NOT NULL,
  `duration_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_account_id_index` (`account_id`),
  ADD KEY `account_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  ADD KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  ADD KEY `account_transactions_created_by_index` (`created_by`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcodes_business_id_foreign` (`business_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_contact_id_foreign` (`contact_id`),
  ADD KEY `bookings_business_id_foreign` (`business_id`),
  ADD KEY `bookings_created_by_foreign` (`created_by`),
  ADD KEY `bookings_table_id_index` (`table_id`),
  ADD KEY `bookings_waiter_id_index` (`waiter_id`),
  ADD KEY `bookings_location_id_index` (`location_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_business_id_foreign` (`business_id`),
  ADD KEY `brands_created_by_foreign` (`created_by`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_owner_id_foreign` (`owner_id`),
  ADD KEY `business_currency_id_foreign` (`currency_id`),
  ADD KEY `business_default_sales_tax_foreign` (`default_sales_tax`);

--
-- Indexes for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_locations_business_id_index` (`business_id`),
  ADD KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  ADD KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_registers_business_id_foreign` (`business_id`),
  ADD KEY `cash_registers_user_id_foreign` (`user_id`),
  ADD KEY `cash_registers_location_id_index` (`location_id`);

--
-- Indexes for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  ADD KEY `cash_register_transactions_transaction_id_index` (`transaction_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_business_id_foreign` (`business_id`),
  ADD KEY `categories_created_by_foreign` (`created_by`);

--
-- Indexes for table `categorizables`
--
ALTER TABLE `categorizables`
  ADD KEY `categorizables_categorizable_type_categorizable_id_index` (`categorizable_type`,`categorizable_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_business_id_foreign` (`business_id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`),
  ADD KEY `contacts_type_index` (`type`),
  ADD KEY `contacts_contact_status_index` (`contact_status`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_configurations_business_id_foreign` (`business_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_business_id_index` (`business_id`),
  ADD KEY `discounts_brand_id_index` (`brand_id`),
  ADD KEY `discounts_category_id_index` (`category_id`),
  ADD KEY `discounts_location_id_index` (`location_id`),
  ADD KEY `discounts_priority_index` (`priority`);

--
-- Indexes for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_and_notes_business_id_index` (`business_id`),
  ADD KEY `document_and_notes_notable_id_index` (`notable_id`),
  ADD KEY `document_and_notes_created_by_index` (`created_by`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_business_id_foreign` (`business_id`);

--
-- Indexes for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  ADD KEY `group_sub_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_layouts_business_id_foreign` (`business_id`);

--
-- Indexes for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_schemes_business_id_foreign` (`business_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_business_id_foreign` (`business_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_tax_foreign` (`tax`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_business_id_index` (`business_id`),
  ADD KEY `products_unit_id_index` (`unit_id`),
  ADD KEY `products_created_by_index` (`created_by`),
  ADD KEY `products_warranty_id_index` (`warranty_id`);

--
-- Indexes for table `product_locations`
--
ALTER TABLE `product_locations`
  ADD KEY `product_locations_product_id_index` (`product_id`),
  ADD KEY `product_locations_location_id_index` (`location_id`);

--
-- Indexes for table `product_racks`
--
ALTER TABLE `product_racks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_name_index` (`name`),
  ADD KEY `product_variations_product_id_index` (`product_id`);

--
-- Indexes for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_lines_product_id_foreign` (`product_id`),
  ADD KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`),
  ADD KEY `purchase_lines_lot_number_index` (`lot_number`);

--
-- Indexes for table `reference_counts`
--
ALTER TABLE `reference_counts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`);

--
-- Indexes for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_tables_business_id_foreign` (`business_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_business_id_foreign` (`business_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_price_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  ADD KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_business_id_foreign` (`business_id`),
  ADD KEY `tax_rates_created_by_foreign` (`created_by`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_tax_id_foreign` (`tax_id`),
  ADD KEY `transactions_business_id_index` (`business_id`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_contact_id_index` (`contact_id`),
  ADD KEY `transactions_transaction_date_index` (`transaction_date`),
  ADD KEY `transactions_created_by_index` (`created_by`),
  ADD KEY `transactions_location_id_index` (`location_id`),
  ADD KEY `transactions_expense_for_foreign` (`expense_for`),
  ADD KEY `transactions_expense_category_id_index` (`expense_category_id`),
  ADD KEY `transactions_sub_type_index` (`sub_type`),
  ADD KEY `transactions_return_parent_id_index` (`return_parent_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_payments_created_by_index` (`created_by`),
  ADD KEY `transaction_payments_parent_id_index` (`parent_id`);

--
-- Indexes for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  ADD KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `transaction_sell_lines_children_type_index` (`children_type`),
  ADD KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`);

--
-- Indexes for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_line_id` (`sell_line_id`),
  ADD KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  ADD KEY `purchase_line_id` (`purchase_line_id`);

--
-- Indexes for table `types_of_services`
--
ALTER TABLE `types_of_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `types_of_services_business_id_index` (`business_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_business_id_foreign` (`business_id`),
  ADD KEY `units_created_by_foreign` (`created_by`),
  ADD KEY `units_base_unit_id_index` (`base_unit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_business_id_foreign` (`business_id`),
  ADD KEY `users_user_type_index` (`user_type`);

--
-- Indexes for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`),
  ADD KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  ADD KEY `variations_name_index` (`name`),
  ADD KEY `variations_sub_sku_index` (`sub_sku`),
  ADD KEY `variations_variation_value_id_index` (`variation_value_id`);

--
-- Indexes for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  ADD KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`);

--
-- Indexes for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_location_details_location_id_foreign` (`location_id`),
  ADD KEY `variation_location_details_product_id_index` (`product_id`),
  ADD KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  ADD KEY `variation_location_details_variation_id_index` (`variation_id`);

--
-- Indexes for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_templates_business_id_foreign` (`business_id`);

--
-- Indexes for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_value_templates_name_index` (`name`),
  ADD KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`);

--
-- Indexes for table `warranties`
--
ALTER TABLE `warranties`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `business_locations`
--
ALTER TABLE `business_locations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=398;

--
-- AUTO_INCREMENT for table `product_racks`
--
ALTER TABLE `product_racks`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=398;

--
-- AUTO_INCREMENT for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=394;

--
-- AUTO_INCREMENT for table `reference_counts`
--
ALTER TABLE `reference_counts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `res_tables`
--
ALTER TABLE `res_tables`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system`
--
ALTER TABLE `system`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=401;

--
-- AUTO_INCREMENT for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `types_of_services`
--
ALTER TABLE `types_of_services`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=398;

--
-- AUTO_INCREMENT for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=392;

--
-- AUTO_INCREMENT for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=392;

--
-- AUTO_INCREMENT for table `variation_templates`
--
ALTER TABLE `variation_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warranties`
--
ALTER TABLE `warranties`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD CONSTRAINT `dashboard_configurations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `printers`
--
ALTER TABLE `printers`
  ADD CONSTRAINT `printers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD CONSTRAINT `res_product_modifier_sets_modifier_set_id_foreign` FOREIGN KEY (`modifier_set_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD CONSTRAINT `res_tables_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD CONSTRAINT `selling_price_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD CONSTRAINT `stock_adjustment_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD CONSTRAINT `tax_rates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_for_foreign` FOREIGN KEY (`expense_for`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `transactions_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD CONSTRAINT `transaction_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD CONSTRAINT `transaction_sell_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variations`
--
ALTER TABLE `variations`
  ADD CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variations_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD CONSTRAINT `variation_group_prices_price_group_id_foreign` FOREIGN KEY (`price_group_id`) REFERENCES `selling_price_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variation_group_prices_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD CONSTRAINT `variation_location_details_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `variation_location_details_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`);

--
-- Constraints for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD CONSTRAINT `variation_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD CONSTRAINT `variation_value_templates_variation_template_id_foreign` FOREIGN KEY (`variation_template_id`) REFERENCES `variation_templates` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
