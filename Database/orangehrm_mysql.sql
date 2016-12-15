-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2016 at 02:43 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `orangehrm_mysql`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `dashboard_get_subunit_parent_id`(
			  id INT
			) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
			SELECT (SELECT t2.id 
						   FROM ohrm_subunit t2 
						   WHERE t2.lft < t1.lft AND t2.rgt > t1.rgt    
						   ORDER BY t2.rgt-t1.rgt ASC LIMIT 1) INTO @parent
			FROM ohrm_subunit t1 WHERE t1.id = id;

			RETURN @parent;

			END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `abstract_display_field`
--

CREATE TABLE IF NOT EXISTS `abstract_display_field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `field_alias` varchar(255) DEFAULT NULL,
  `is_sortable` varchar(10) NOT NULL,
  `sort_order` varchar(255) DEFAULT NULL,
  `sort_field` varchar(255) DEFAULT NULL,
  `element_type` varchar(255) NOT NULL,
  `element_property` text NOT NULL,
  `width` varchar(255) NOT NULL,
  `is_exportable` varchar(10) DEFAULT NULL,
  `text_alignment_style` varchar(20) DEFAULT NULL,
  `is_value_list` tinyint(1) NOT NULL,
  `display_field_group_id` bigint(20) unsigned DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `is_encrypted` tinyint(1) NOT NULL,
  `is_meta` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_config`
--

CREATE TABLE IF NOT EXISTS `hs_hr_config` (
  `key` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_config`
--

INSERT INTO `hs_hr_config` (`key`, `value`) VALUES
('admin.default_workshift_end_time', '17:00'),
('admin.default_workshift_start_time', '09:00'),
('admin.localization.default_date_format', 'Y-m-d'),
('admin.localization.default_language', 'en_US'),
('admin.localization.use_browser_language', 'No'),
('admin.product_type', 'os'),
('attendanceEmpEditSubmitted', 'No'),
('attendanceSupEditSubmitted', 'No'),
('authorize_user_role_manager_class', 'BasicUserRoleManager'),
('beacon.activation_acceptance_status', 'off'),
('beacon.activiation_status', 'on'),
('beacon.company_name', ''),
('beacon.flash_period', '120'),
('beacon.lock', 'unlocked'),
('beacon.next_flash_time', '0000-00-00'),
('beacon.uuid', 'pPz0Q0y2jjsW+A=='),
('domain.name', 'localhost'),
('hsp_accrued_last_updated', '0000-00-00'),
('hsp_current_plan', '0'),
('hsp_used_last_updated', '0000-00-00'),
('include_supervisor_chain', 'No'),
('ldap_domain_name', ''),
('ldap_port', ''),
('ldap_server', ''),
('ldap_status', ''),
('leave.entitlement_consumption_algorithm', 'FIFOEntitlementConsumptionStrategy'),
('leave.include_pending_leave_in_balance', '1'),
('leave.leavePeriodStatus', '1'),
('leave.work_schedule_implementation', 'BasicWorkSchedule'),
('leave_period_defined', 'Yes'),
('openId.provider.added', 'on'),
('pim_show_deprecated_fields', '0'),
('report.mysql_group_concat_max_len', '2048'),
('showSIN', '0'),
('showSSN', '0'),
('showTaxExemptions', '0'),
('themeName', 'default'),
('timesheet_period_and_start_date', '<TimesheetPeriod><PeriodType>Weekly</PeriodType><ClassName>WeeklyTimesheetPeriod</ClassName><StartDate>1</StartDate><Heading>Week</Heading></TimesheetPeriod>'),
('timesheet_period_set', 'No'),
('timesheet_time_format', '1');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_country`
--

CREATE TABLE IF NOT EXISTS `hs_hr_country` (
  `cou_code` char(2) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `cou_name` varchar(80) NOT NULL DEFAULT '',
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`cou_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_country`
--

INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES
('AD', 'ANDORRA', 'Andorra', 'AND', 20),
('AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784),
('AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4),
('AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28),
('AI', 'ANGUILLA', 'Anguilla', 'AIA', 660),
('AL', 'ALBANIA', 'Albania', 'ALB', 8),
('AM', 'ARMENIA', 'Armenia', 'ARM', 51),
('AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530),
('AO', 'ANGOLA', 'Angola', 'AGO', 24),
('AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL),
('AR', 'ARGENTINA', 'Argentina', 'ARG', 32),
('AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16),
('AT', 'AUSTRIA', 'Austria', 'AUT', 40),
('AU', 'AUSTRALIA', 'Australia', 'AUS', 36),
('AW', 'ARUBA', 'Aruba', 'ABW', 533),
('AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31),
('BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70),
('BB', 'BARBADOS', 'Barbados', 'BRB', 52),
('BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50),
('BE', 'BELGIUM', 'Belgium', 'BEL', 56),
('BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854),
('BG', 'BULGARIA', 'Bulgaria', 'BGR', 100),
('BH', 'BAHRAIN', 'Bahrain', 'BHR', 48),
('BI', 'BURUNDI', 'Burundi', 'BDI', 108),
('BJ', 'BENIN', 'Benin', 'BEN', 204),
('BM', 'BERMUDA', 'Bermuda', 'BMU', 60),
('BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96),
('BO', 'BOLIVIA', 'Bolivia', 'BOL', 68),
('BR', 'BRAZIL', 'Brazil', 'BRA', 76),
('BS', 'BAHAMAS', 'Bahamas', 'BHS', 44),
('BT', 'BHUTAN', 'Bhutan', 'BTN', 64),
('BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL),
('BW', 'BOTSWANA', 'Botswana', 'BWA', 72),
('BY', 'BELARUS', 'Belarus', 'BLR', 112),
('BZ', 'BELIZE', 'Belize', 'BLZ', 84),
('CA', 'CANADA', 'Canada', 'CAN', 124),
('CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL),
('CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180),
('CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140),
('CG', 'CONGO', 'Congo', 'COG', 178),
('CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756),
('CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384),
('CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184),
('CL', 'CHILE', 'Chile', 'CHL', 152),
('CM', 'CAMEROON', 'Cameroon', 'CMR', 120),
('CN', 'CHINA', 'China', 'CHN', 156),
('CO', 'COLOMBIA', 'Colombia', 'COL', 170),
('CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188),
('CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL),
('CU', 'CUBA', 'Cuba', 'CUB', 192),
('CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132),
('CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL),
('CY', 'CYPRUS', 'Cyprus', 'CYP', 196),
('CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203),
('DE', 'GERMANY', 'Germany', 'DEU', 276),
('DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262),
('DK', 'DENMARK', 'Denmark', 'DNK', 208),
('DM', 'DOMINICA', 'Dominica', 'DMA', 212),
('DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214),
('DZ', 'ALGERIA', 'Algeria', 'DZA', 12),
('EC', 'ECUADOR', 'Ecuador', 'ECU', 218),
('EE', 'ESTONIA', 'Estonia', 'EST', 233),
('EG', 'EGYPT', 'Egypt', 'EGY', 818),
('EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732),
('ER', 'ERITREA', 'Eritrea', 'ERI', 232),
('ES', 'SPAIN', 'Spain', 'ESP', 724),
('ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231),
('FI', 'FINLAND', 'Finland', 'FIN', 246),
('FJ', 'FIJI', 'Fiji', 'FJI', 242),
('FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238),
('FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583),
('FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234),
('FR', 'FRANCE', 'France', 'FRA', 250),
('GA', 'GABON', 'Gabon', 'GAB', 266),
('GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826),
('GD', 'GRENADA', 'Grenada', 'GRD', 308),
('GE', 'GEORGIA', 'Georgia', 'GEO', 268),
('GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254),
('GH', 'GHANA', 'Ghana', 'GHA', 288),
('GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292),
('GL', 'GREENLAND', 'Greenland', 'GRL', 304),
('GM', 'GAMBIA', 'Gambia', 'GMB', 270),
('GN', 'GUINEA', 'Guinea', 'GIN', 324),
('GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312),
('GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226),
('GR', 'GREECE', 'Greece', 'GRC', 300),
('GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL),
('GT', 'GUATEMALA', 'Guatemala', 'GTM', 320),
('GU', 'GUAM', 'Guam', 'GUM', 316),
('GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624),
('GY', 'GUYANA', 'Guyana', 'GUY', 328),
('HK', 'HONG KONG', 'Hong Kong', 'HKG', 344),
('HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL),
('HN', 'HONDURAS', 'Honduras', 'HND', 340),
('HR', 'CROATIA', 'Croatia', 'HRV', 191),
('HT', 'HAITI', 'Haiti', 'HTI', 332),
('HU', 'HUNGARY', 'Hungary', 'HUN', 348),
('ID', 'INDONESIA', 'Indonesia', 'IDN', 360),
('IE', 'IRELAND', 'Ireland', 'IRL', 372),
('IL', 'ISRAEL', 'Israel', 'ISR', 376),
('IN', 'INDIA', 'India', 'IND', 356),
('IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL),
('IQ', 'IRAQ', 'Iraq', 'IRQ', 368),
('IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364),
('IS', 'ICELAND', 'Iceland', 'ISL', 352),
('IT', 'ITALY', 'Italy', 'ITA', 380),
('JM', 'JAMAICA', 'Jamaica', 'JAM', 388),
('JO', 'JORDAN', 'Jordan', 'JOR', 400),
('JP', 'JAPAN', 'Japan', 'JPN', 392),
('KE', 'KENYA', 'Kenya', 'KEN', 404),
('KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417),
('KH', 'CAMBODIA', 'Cambodia', 'KHM', 116),
('KI', 'KIRIBATI', 'Kiribati', 'KIR', 296),
('KM', 'COMOROS', 'Comoros', 'COM', 174),
('KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659),
('KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408),
('KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410),
('KW', 'KUWAIT', 'Kuwait', 'KWT', 414),
('KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136),
('KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398),
('LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418),
('LB', 'LEBANON', 'Lebanon', 'LBN', 422),
('LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662),
('LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438),
('LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144),
('LR', 'LIBERIA', 'Liberia', 'LBR', 430),
('LS', 'LESOTHO', 'Lesotho', 'LSO', 426),
('LT', 'LITHUANIA', 'Lithuania', 'LTU', 440),
('LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442),
('LV', 'LATVIA', 'Latvia', 'LVA', 428),
('LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434),
('MA', 'MOROCCO', 'Morocco', 'MAR', 504),
('MC', 'MONACO', 'Monaco', 'MCO', 492),
('MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498),
('MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450),
('MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584),
('MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807),
('ML', 'MALI', 'Mali', 'MLI', 466),
('MM', 'MYANMAR', 'Myanmar', 'MMR', 104),
('MN', 'MONGOLIA', 'Mongolia', 'MNG', 496),
('MO', 'MACAO', 'Macao', 'MAC', 446),
('MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580),
('MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474),
('MR', 'MAURITANIA', 'Mauritania', 'MRT', 478),
('MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500),
('MT', 'MALTA', 'Malta', 'MLT', 470),
('MU', 'MAURITIUS', 'Mauritius', 'MUS', 480),
('MV', 'MALDIVES', 'Maldives', 'MDV', 462),
('MW', 'MALAWI', 'Malawi', 'MWI', 454),
('MX', 'MEXICO', 'Mexico', 'MEX', 484),
('MY', 'MALAYSIA', 'Malaysia', 'MYS', 458),
('MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508),
('NA', 'NAMIBIA', 'Namibia', 'NAM', 516),
('NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540),
('NE', 'NIGER', 'Niger', 'NER', 562),
('NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574),
('NG', 'NIGERIA', 'Nigeria', 'NGA', 566),
('NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558),
('NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528),
('NO', 'NORWAY', 'Norway', 'NOR', 578),
('NP', 'NEPAL', 'Nepal', 'NPL', 524),
('NR', 'NAURU', 'Nauru', 'NRU', 520),
('NU', 'NIUE', 'Niue', 'NIU', 570),
('NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554),
('OM', 'OMAN', 'Oman', 'OMN', 512),
('PA', 'PANAMA', 'Panama', 'PAN', 591),
('PE', 'PERU', 'Peru', 'PER', 604),
('PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258),
('PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598),
('PH', 'PHILIPPINES', 'Philippines', 'PHL', 608),
('PK', 'PAKISTAN', 'Pakistan', 'PAK', 586),
('PL', 'POLAND', 'Poland', 'POL', 616),
('PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666),
('PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612),
('PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630),
('PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL),
('PT', 'PORTUGAL', 'Portugal', 'PRT', 620),
('PW', 'PALAU', 'Palau', 'PLW', 585),
('PY', 'PARAGUAY', 'Paraguay', 'PRY', 600),
('QA', 'QATAR', 'Qatar', 'QAT', 634),
('RE', 'REUNION', 'Reunion', 'REU', 638),
('RO', 'ROMANIA', 'Romania', 'ROM', 642),
('RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643),
('RW', 'RWANDA', 'Rwanda', 'RWA', 646),
('SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682),
('SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90),
('SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690),
('SD', 'SUDAN', 'Sudan', 'SDN', 736),
('SE', 'SWEDEN', 'Sweden', 'SWE', 752),
('SG', 'SINGAPORE', 'Singapore', 'SGP', 702),
('SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654),
('SI', 'SLOVENIA', 'Slovenia', 'SVN', 705),
('SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744),
('SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703),
('SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694),
('SM', 'SAN MARINO', 'San Marino', 'SMR', 674),
('SN', 'SENEGAL', 'Senegal', 'SEN', 686),
('SO', 'SOMALIA', 'Somalia', 'SOM', 706),
('SR', 'SURINAME', 'Suriname', 'SUR', 740),
('ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678),
('SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222),
('SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760),
('SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748),
('TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796),
('TD', 'CHAD', 'Chad', 'TCD', 148),
('TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL),
('TG', 'TOGO', 'Togo', 'TGO', 768),
('TH', 'THAILAND', 'Thailand', 'THA', 764),
('TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762),
('TK', 'TOKELAU', 'Tokelau', 'TKL', 772),
('TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL),
('TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795),
('TN', 'TUNISIA', 'Tunisia', 'TUN', 788),
('TO', 'TONGA', 'Tonga', 'TON', 776),
('TR', 'TURKEY', 'Turkey', 'TUR', 792),
('TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780),
('TV', 'TUVALU', 'Tuvalu', 'TUV', 798),
('TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan', 'TWN', 158),
('TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834),
('UA', 'UKRAINE', 'Ukraine', 'UKR', 804),
('UG', 'UGANDA', 'Uganda', 'UGA', 800),
('UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL),
('US', 'UNITED STATES', 'United States', 'USA', 840),
('UY', 'URUGUAY', 'Uruguay', 'URY', 858),
('UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860),
('VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336),
('VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670),
('VE', 'VENEZUELA', 'Venezuela', 'VEN', 862),
('VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92),
('VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850),
('VN', 'VIET NAM', 'Viet Nam', 'VNM', 704),
('VU', 'VANUATU', 'Vanuatu', 'VUT', 548),
('WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876),
('WS', 'SAMOA', 'Samoa', 'WSM', 882),
('YE', 'YEMEN', 'Yemen', 'YEM', 887),
('YT', 'MAYOTTE', 'Mayotte', NULL, NULL),
('ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710),
('ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894),
('ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716);

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_currency_type`
--

CREATE TABLE IF NOT EXISTS `hs_hr_currency_type` (
  `code` int(11) NOT NULL DEFAULT '0',
  `currency_id` char(3) NOT NULL DEFAULT '',
  `currency_name` varchar(70) NOT NULL DEFAULT '',
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_currency_type`
--

INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES
(3, 'AED', 'Utd. Arab Emir. Dirham'),
(4, 'AFN', 'Afghanistan Afghani'),
(5, 'ALL', 'Albanian Lek'),
(6, 'ANG', 'NL Antillian Guilder'),
(7, 'AOR', 'Angolan New Kwanza'),
(177, 'ARP', 'Argentina Pesos'),
(8, 'ARS', 'Argentine Peso'),
(10, 'AUD', 'Australian Dollar'),
(11, 'AWG', 'Aruban Florin'),
(12, 'BBD', 'Barbados Dollar'),
(13, 'BDT', 'Bangladeshi Taka'),
(15, 'BGL', 'Bulgarian Lev'),
(16, 'BHD', 'Bahraini Dinar'),
(17, 'BIF', 'Burundi Franc'),
(18, 'BMD', 'Bermudian Dollar'),
(19, 'BND', 'Brunei Dollar'),
(20, 'BOB', 'Bolivian Boliviano'),
(21, 'BRL', 'Brazilian Real'),
(22, 'BSD', 'Bahamian Dollar'),
(23, 'BTN', 'Bhutan Ngultrum'),
(24, 'BWP', 'Botswana Pula'),
(25, 'BZD', 'Belize Dollar'),
(26, 'CAD', 'Canadian Dollar'),
(27, 'CHF', 'Swiss Franc'),
(28, 'CLP', 'Chilean Peso'),
(29, 'CNY', 'Chinese Yuan Renminbi'),
(30, 'COP', 'Colombian Peso'),
(31, 'CRC', 'Costa Rican Colon'),
(32, 'CUP', 'Cuban Peso'),
(33, 'CVE', 'Cape Verde Escudo'),
(34, 'CYP', 'Cyprus Pound'),
(171, 'CZK', 'Czech Koruna'),
(37, 'DJF', 'Djibouti Franc'),
(38, 'DKK', 'Danish Krona'),
(39, 'DOP', 'Dominican Peso'),
(40, 'DZD', 'Algerian Dinar'),
(41, 'ECS', 'Ecuador Sucre'),
(43, 'EEK', 'Estonian Krona'),
(44, 'EGP', 'Egyptian Pound'),
(46, 'ETB', 'Ethiopian Birr'),
(42, 'EUR', 'Euro'),
(48, 'FJD', 'Fiji Dollar'),
(49, 'FKP', 'Falkland Islands Pound'),
(51, 'GBP', 'Pound Sterling'),
(52, 'GHC', 'Ghanaian Cedi'),
(53, 'GIP', 'Gibraltar Pound'),
(54, 'GMD', 'Gambian Dalasi'),
(55, 'GNF', 'Guinea Franc'),
(57, 'GTQ', 'Guatemalan Quetzal'),
(58, 'GYD', 'Guyanan Dollar'),
(59, 'HKD', 'Hong Kong Dollar'),
(60, 'HNL', 'Honduran Lempira'),
(61, 'HRK', 'Croatian Kuna'),
(62, 'HTG', 'Haitian Gourde'),
(63, 'HUF', 'Hungarian Forint'),
(64, 'IDR', 'Indonesian Rupiah'),
(66, 'ILS', 'Israeli New Shekel'),
(67, 'INR', 'Indian Rupee'),
(68, 'IQD', 'Iraqi Dinar'),
(69, 'IRR', 'Iranian Rial'),
(70, 'ISK', 'Iceland Krona'),
(72, 'JMD', 'Jamaican Dollar'),
(73, 'JOD', 'Jordanian Dinar'),
(74, 'JPY', 'Japanese Yen'),
(75, 'KES', 'Kenyan Shilling'),
(76, 'KHR', 'Kampuchean Riel'),
(77, 'KMF', 'Comoros Franc'),
(78, 'KPW', 'North Korean Won'),
(79, 'KRW', 'Korean Won'),
(80, 'KWD', 'Kuwaiti Dinar'),
(81, 'KYD', 'Cayman Islands Dollar'),
(82, 'KZT', 'Kazakhstan Tenge'),
(83, 'LAK', 'Lao Kip'),
(84, 'LBP', 'Lebanese Pound'),
(85, 'LKR', 'Sri Lanka Rupee'),
(86, 'LRD', 'Liberian Dollar'),
(87, 'LSL', 'Lesotho Loti'),
(88, 'LTL', 'Lithuanian Litas'),
(90, 'LVL', 'Latvian Lats'),
(91, 'LYD', 'Libyan Dinar'),
(92, 'MAD', 'Moroccan Dirham'),
(93, 'MGF', 'Malagasy Franc'),
(94, 'MMK', 'Myanmar Kyat'),
(95, 'MNT', 'Mongolian Tugrik'),
(96, 'MOP', 'Macau Pataca'),
(97, 'MRO', 'Mauritanian Ouguiya'),
(98, 'MTL', 'Maltese Lira'),
(99, 'MUR', 'Mauritius Rupee'),
(100, 'MVR', 'Maldive Rufiyaa'),
(101, 'MWK', 'Malawi Kwacha'),
(102, 'MXN', 'Mexican New Peso'),
(172, 'MXP', 'Mexican Peso'),
(103, 'MYR', 'Malaysian Ringgit'),
(104, 'MZM', 'Mozambique Metical'),
(105, 'NAD', 'Namibia Dollar'),
(106, 'NGN', 'Nigerian Naira'),
(107, 'NIO', 'Nicaraguan Cordoba Oro'),
(109, 'NOK', 'Norwegian Krona'),
(110, 'NPR', 'Nepalese Rupee'),
(111, 'NZD', 'New Zealand Dollar'),
(112, 'OMR', 'Omani Rial'),
(113, 'PAB', 'Panamanian Balboa'),
(114, 'PEN', 'Peruvian Nuevo Sol'),
(115, 'PGK', 'Papua New Guinea Kina'),
(116, 'PHP', 'Philippine Peso'),
(117, 'PKR', 'Pakistan Rupee'),
(118, 'PLN', 'Polish Zloty'),
(120, 'PYG', 'Paraguay Guarani'),
(121, 'QAR', 'Qatari Rial'),
(122, 'ROL', 'Romanian Leu'),
(123, 'RUB', 'Russian Rouble'),
(180, 'RUR', 'Russia Rubles'),
(173, 'SAR', 'Saudi Arabia Riyal'),
(125, 'SBD', 'Solomon Islands Dollar'),
(126, 'SCR', 'Seychelles Rupee'),
(127, 'SDD', 'Sudanese Dinar'),
(128, 'SDP', 'Sudanese Pound'),
(129, 'SEK', 'Swedish Krona'),
(131, 'SGD', 'Singapore Dollar'),
(132, 'SHP', 'St. Helena Pound'),
(130, 'SKK', 'Slovak Koruna'),
(135, 'SLL', 'Sierra Leone Leone'),
(136, 'SOS', 'Somali Shilling'),
(137, 'SRD', 'Surinamese Dollar'),
(138, 'STD', 'Sao Tome/Principe Dobra'),
(139, 'SVC', 'El Salvador Colon'),
(140, 'SYP', 'Syrian Pound'),
(141, 'SZL', 'Swaziland Lilangeni'),
(142, 'THB', 'Thai Baht'),
(143, 'TND', 'Tunisian Dinar'),
(144, 'TOP', 'Tongan Pa''anga'),
(145, 'TRL', 'Turkish Lira'),
(146, 'TTD', 'Trinidad/Tobago Dollar'),
(147, 'TWD', 'Taiwan Dollar'),
(148, 'TZS', 'Tanzanian Shilling'),
(149, 'UAH', 'Ukraine Hryvnia'),
(150, 'UGX', 'Uganda Shilling'),
(151, 'USD', 'United States Dollar'),
(152, 'UYP', 'Uruguayan Peso'),
(153, 'VEB', 'Venezuelan Bolivar'),
(154, 'VND', 'Vietnamese Dong'),
(155, 'VUV', 'Vanuatu Vatu'),
(156, 'WST', 'Samoan Tala'),
(158, 'XAF', 'CFA Franc BEAC'),
(159, 'XAG', 'Silver (oz.)'),
(160, 'XAU', 'Gold (oz.)'),
(161, 'XCD', 'Eastern Caribbean Dollars'),
(179, 'XDR', 'IMF Special Drawing Right'),
(162, 'XOF', 'CFA Franc BCEAO'),
(163, 'XPD', 'Palladium (oz.)'),
(164, 'XPF', 'CFP Franc'),
(165, 'XPT', 'Platinum (oz.)'),
(166, 'YER', 'Yemeni Riyal'),
(167, 'YUM', 'Yugoslavian Dinar'),
(175, 'YUN', 'Yugoslav Dinar'),
(168, 'ZAR', 'South African Rand'),
(176, 'ZMK', 'Zambian Kwacha'),
(169, 'ZRN', 'New Zaire'),
(170, 'ZWD', 'Zimbabwe Dollar');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_custom_export`
--

CREATE TABLE IF NOT EXISTS `hs_hr_custom_export` (
  `export_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `fields` text,
  `headings` text,
  PRIMARY KEY (`export_id`),
  KEY `emp_number` (`export_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_custom_fields`
--

CREATE TABLE IF NOT EXISTS `hs_hr_custom_fields` (
  `field_num` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `type` int(11) NOT NULL,
  `screen` varchar(100) DEFAULT NULL,
  `extra_data` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`field_num`),
  KEY `emp_number` (`field_num`),
  KEY `screen` (`screen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_custom_import`
--

CREATE TABLE IF NOT EXISTS `hs_hr_custom_import` (
  `import_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `fields` text,
  `has_heading` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`import_id`),
  KEY `emp_number` (`import_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_district`
--

CREATE TABLE IF NOT EXISTS `hs_hr_district` (
  `district_code` varchar(13) NOT NULL DEFAULT '',
  `district_name` varchar(50) DEFAULT NULL,
  `province_code` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`district_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_employee`
--

CREATE TABLE IF NOT EXISTS `hs_hr_employee` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `employee_id` varchar(50) DEFAULT NULL,
  `emp_lastname` varchar(100) NOT NULL DEFAULT '',
  `emp_firstname` varchar(100) NOT NULL DEFAULT '',
  `emp_middle_name` varchar(100) NOT NULL DEFAULT '',
  `emp_nick_name` varchar(100) DEFAULT '',
  `emp_smoker` smallint(6) DEFAULT '0',
  `ethnic_race_code` varchar(13) DEFAULT NULL,
  `emp_birthday` date DEFAULT NULL,
  `nation_code` int(4) DEFAULT NULL,
  `emp_gender` smallint(6) DEFAULT NULL,
  `emp_marital_status` varchar(20) DEFAULT NULL,
  `emp_ssn_num` varchar(100) CHARACTER SET latin1 DEFAULT '',
  `emp_sin_num` varchar(100) DEFAULT '',
  `emp_other_id` varchar(100) DEFAULT '',
  `emp_dri_lice_num` varchar(100) DEFAULT '',
  `emp_dri_lice_exp_date` date DEFAULT NULL,
  `emp_military_service` varchar(100) DEFAULT '',
  `emp_status` int(13) DEFAULT NULL,
  `job_title_code` int(7) DEFAULT NULL,
  `eeo_cat_code` int(11) DEFAULT NULL,
  `work_station` int(6) DEFAULT NULL,
  `emp_street1` varchar(100) DEFAULT '',
  `emp_street2` varchar(100) DEFAULT '',
  `city_code` varchar(100) DEFAULT '',
  `coun_code` varchar(100) DEFAULT '',
  `provin_code` varchar(100) DEFAULT '',
  `emp_zipcode` varchar(20) DEFAULT NULL,
  `emp_hm_telephone` varchar(50) DEFAULT NULL,
  `emp_mobile` varchar(50) DEFAULT NULL,
  `emp_work_telephone` varchar(50) DEFAULT NULL,
  `emp_work_email` varchar(50) DEFAULT NULL,
  `sal_grd_code` varchar(13) DEFAULT NULL,
  `joined_date` date DEFAULT NULL,
  `emp_oth_email` varchar(50) DEFAULT NULL,
  `termination_id` int(4) DEFAULT NULL,
  `custom1` varchar(250) DEFAULT NULL,
  `custom2` varchar(250) DEFAULT NULL,
  `custom3` varchar(250) DEFAULT NULL,
  `custom4` varchar(250) DEFAULT NULL,
  `custom5` varchar(250) DEFAULT NULL,
  `custom6` varchar(250) DEFAULT NULL,
  `custom7` varchar(250) DEFAULT NULL,
  `custom8` varchar(250) DEFAULT NULL,
  `custom9` varchar(250) DEFAULT NULL,
  `custom10` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`emp_number`),
  KEY `work_station` (`work_station`),
  KEY `nation_code` (`nation_code`),
  KEY `job_title_code` (`job_title_code`),
  KEY `emp_status` (`emp_status`),
  KEY `eeo_cat_code` (`eeo_cat_code`),
  KEY `termination_id` (`termination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_employee`
--

INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES
(1, '0001', 'Alpapara', 'Johann Paul', 'Romero', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '0005', 'Alpapara', 'Lizbeth', 'R.', '', 0, NULL, NULL, 62, 2, 'Married', '', '', '', '', NULL, '', NULL, 9, 33, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '0006', 'Beltran', 'Janerrie', 'N.', '', 0, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '0007', 'Bautista', 'Rodelio', 'C.', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '0008', 'Cruz', 'Ryan Dexter', 'P.', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '0009', 'Cruz', 'Ryan Dexter', 'P.', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '0010', 'Garcia', 'Roscelle', 'T.', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '0011', 'Perina', 'Jocelyn', 'R.', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_attachment`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_attachment` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `eattach_id` int(11) NOT NULL DEFAULT '0',
  `eattach_desc` varchar(200) DEFAULT NULL,
  `eattach_filename` varchar(100) DEFAULT NULL,
  `eattach_size` int(11) DEFAULT '0',
  `eattach_attachment` mediumblob,
  `eattach_type` varchar(200) DEFAULT NULL,
  `screen` varchar(100) DEFAULT '',
  `attached_by` int(11) DEFAULT NULL,
  `attached_by_name` varchar(200) DEFAULT NULL,
  `attached_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`emp_number`,`eattach_id`),
  KEY `screen` (`screen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_basicsalary`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_basicsalary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `sal_grd_code` int(11) DEFAULT NULL,
  `currency_id` varchar(6) NOT NULL DEFAULT '',
  `ebsal_basic_salary` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `payperiod_code` varchar(13) DEFAULT NULL,
  `salary_component` varchar(100) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sal_grd_code` (`sal_grd_code`),
  KEY `currency_id` (`currency_id`),
  KEY `emp_number` (`emp_number`),
  KEY `payperiod_code` (`payperiod_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hs_hr_emp_basicsalary`
--

INSERT INTO `hs_hr_emp_basicsalary` (`id`, `emp_number`, `sal_grd_code`, `currency_id`, `ebsal_basic_salary`, `payperiod_code`, `salary_component`, `comments`) VALUES
(1, 5, NULL, 'PHP', 'ED32E5B615B771ACE7179980021E1534', '6', '89.54', '');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_children`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_children` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `ec_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ec_name` varchar(100) DEFAULT '',
  `ec_date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`ec_seqno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_contract_extend`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_contract_extend` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `econ_extend_id` decimal(10,0) NOT NULL DEFAULT '0',
  `econ_extend_start_date` datetime DEFAULT NULL,
  `econ_extend_end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`econ_extend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_emp_contract_extend`
--

INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES
(5, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_dependents`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_dependents` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `ed_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ed_name` varchar(100) DEFAULT '',
  `ed_relationship_type` enum('child','other') DEFAULT NULL,
  `ed_relationship` varchar(100) DEFAULT '',
  `ed_date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`ed_seqno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_directdebit`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_directdebit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salary_id` int(11) NOT NULL,
  `dd_routing_num` int(9) NOT NULL,
  `dd_account` varchar(100) NOT NULL DEFAULT '',
  `dd_amount` decimal(11,2) NOT NULL,
  `dd_account_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'CHECKING, SAVINGS',
  `dd_transaction_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'BLANK, PERC, FLAT, FLATMINUS',
  PRIMARY KEY (`id`),
  KEY `salary_id` (`salary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_emergency_contacts`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_emergency_contacts` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `eec_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `eec_name` varchar(100) DEFAULT '',
  `eec_relationship` varchar(100) DEFAULT '',
  `eec_home_no` varchar(100) DEFAULT '',
  `eec_mobile_no` varchar(100) DEFAULT '',
  `eec_office_no` varchar(100) DEFAULT '',
  PRIMARY KEY (`emp_number`,`eec_seqno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_history_of_ealier_pos`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_history_of_ealier_pos` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `emp_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ehoep_job_title` varchar(100) DEFAULT '',
  `ehoep_years` varchar(100) DEFAULT '',
  PRIMARY KEY (`emp_number`,`emp_seqno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_language`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_language` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `lang_id` int(11) NOT NULL,
  `fluency` smallint(6) NOT NULL DEFAULT '0',
  `competency` smallint(6) DEFAULT '0',
  `comments` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`lang_id`,`fluency`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_locations`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_locations` (
  `emp_number` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`emp_number`,`location_id`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_member_detail`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_member_detail` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `membship_code` int(6) NOT NULL DEFAULT '0',
  `ememb_subscript_ownership` varchar(20) DEFAULT NULL,
  `ememb_subscript_amount` decimal(15,2) DEFAULT NULL,
  `ememb_subs_currency` varchar(20) DEFAULT NULL,
  `ememb_commence_date` date DEFAULT NULL,
  `ememb_renewal_date` date DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`membship_code`),
  KEY `membship_code` (`membship_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_passport`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_passport` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `ep_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ep_passport_num` varchar(100) NOT NULL DEFAULT '',
  `ep_passportissueddate` datetime DEFAULT NULL,
  `ep_passportexpiredate` datetime DEFAULT NULL,
  `ep_comments` varchar(255) DEFAULT NULL,
  `ep_passport_type_flg` smallint(6) DEFAULT NULL,
  `ep_i9_status` varchar(100) DEFAULT '',
  `ep_i9_review_date` date DEFAULT NULL,
  `cou_code` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`ep_seqno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_picture`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_picture` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `epic_picture` mediumblob,
  `epic_filename` varchar(100) DEFAULT NULL,
  `epic_type` varchar(50) DEFAULT NULL,
  `epic_file_size` varchar(20) DEFAULT NULL,
  `epic_file_width` varchar(20) DEFAULT NULL,
  `epic_file_height` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_emp_picture`
--

INSERT INTO `hs_hr_emp_picture` (`emp_number`, `epic_picture`, `epic_filename`, `epic_type`, `epic_file_size`, `epic_file_width`, `epic_file_height`) VALUES
(1, 0xffd8ffe2021c4943435f50524f46494c450001010000020c6c636d73021000006d6e74725247422058595a2007dc00010019000300290039616373704150504c0000000000000000000000000000000000000000000000000000f6d6000100000000d32d6c636d7300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a64657363000000fc0000005e637072740000015c0000000b777470740000016800000014626b70740000017c000000147258595a00000190000000146758595a000001a4000000146258595a000001b80000001472545243000001cc0000004067545243000001cc0000004062545243000001cc0000004064657363000000000000000363320000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074657874000000004642000058595a20000000000000f6d6000100000000d32d58595a20000000000000031600000333000002a458595a200000000000006fa2000038f50000039058595a2000000000000062990000b785000018da58595a2000000000000024a000000f840000b6cf63757276000000000000001a000000cb01c903630592086b0bf6103f15511b3421f1299032183b92460551775ded6b707a0589b19a7cac69bf7dd3c3e930ffffffe000104a46494600010100000100010000ffed003650686f746f73686f7020332e30003842494d04040000000000191c02670014552d6641315064633166316d2d70646456556c6e00ffdb00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101ffdb00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101ffc200110802d802cf03012200021101031101ffc4001e0001000202030101010000000000000000000304050607080902010affc4001c0101000203010101000000000000000000000304010506020708ffda000c03010002100310000001f533e7e9f60f8d804801224008c00b002c00009308c908d24612308c66b866c015ec0af5d60570000011a4488d211d74918af7213e815d6132bac57c8335e34918af605758ae7d43224469046047208ebd815d62b88e4157ea411a48c57b036c90a760904690923908c02c002c123c83c8000008c000004808c8e4488d23d2348578d2162324578c7a00af605708e386d4323ea3b154fa491802bd815c582390af1a48c015ec0ae08d247211c823249d4d62be48e411a48c4720dc069ec0b092bac5705807df97c4879b0000488d1a411a411c80000000023902390469046904692300011c8c11eb9aa45e7939ab6cf761fa8251f587c86a86c3324c2348963abf5f3f59120a6b02bac0ae2c11c8230af5d6053482312234918af7239d5c648e48cdc161a7b95ec24f28d208e43cd808c4823900000000582bac0aeb02bac0aeb02bac0aeb02bac57000000070c4126e5d5aea1fad7aedbf5ef78e6dc4c916930ebd9ad75ce59c7f4a388b5db2f477547907b2a5eadf2c7553976cebb98f54e3da9e2c6c3ca7e54f7de6afcbec76577dcfc71d88e6f31a411d7b02bac0aeb15e746919af1d7b02bc772b88e488fd866488ebdc14d62b9ba246b6e043609023900000b05758000000460002411a4118000024046090385629393bc67ed0795fcd75fe81766fccbcaea767eab756b42e11931d8febdf146bdafd9f2162381e14fe8cf5a77de01f38ee372f740797a9cdd9fc7f0e6b10cbb8f6dba931ecb5bea2739f8e7c91b2d07a33375a7b21dcf0b2582dd5af1dcae46923910fd49195d37d15e39046923b15d5ec0af1c82348238e41b6246af680005815ec0000079123ca3904800058795758af90642c615d618571e80239046908e3482a7941dc6e916af75cddd13eccf4bb41d3714e7f88a6d76e39e31da265a39b98faf7b0f13d7965dc749d9ec78df321c659ca76b922d708cbe5ca7168537af5bbf1bed98492bf34e538cf90a3c73d7613cdadb761adf477ba5fcf7fa9fd5715dde7c4fd1f371d7b0f6af1da851c71c823491c8aeb15c8d208d22c578c15c1b616357b4af600008c242348012005879575801e4000248d1a411890000057587a575823af14b161e6b6b18ee0ce6fb4a9d2fefb740f49d1e3aadac779ce5f90b8c72f1d8a988c8e3e4456e0fd2d2a451a69aa7e4926cf90d3ad53646a65e9cec4e4707bbe61d86de9b553731f60fa7f2cd4bfa58d9fc31f53fb2f9c73f926d34f5d24732bac57f48d2468e34918af6122bac0aeb15c8d2466d835f704846909000058c2bac301278cc63383e27f3ea348f3e639023f998000011c811a411a48c248c2484458cc5d6b9d01f2c7d1df2ef82fa2f2670e676486f71f54b752fd466f5fbfe2c4556d552447f923f69d8af1ac2b9265e4c25833fb36870798f238f8b1b3269b1f32091731f1cbb0fa95e4c6e56b5bfd4ce77c7ef4f7b3f9ef214722fd58e391257a6b0915e3b95c8d20ae9046923475d62b9b44853d8002c60af61e03e4fa248c0b0000002b800000000000000b1a3f4bbadfc73caf59be79fbc8584e77acd1f78d1e64dac54cb60e4863fcfd8ec47246ae926faae4762bd8a6488e44847f24d62b91b1f98c6c886d5584c863d54b59cc1ef1351eddfa3bd18ec2745c7faa10477379ce578e6f99331c7215e30575815c58471d88c8c23d916147601e424c66348f188e4005800001f928892889288bf640023902294449444944494472001e2c7437d34f23f8fee761c8ea590d3efd561ab1ad6bf96a922a4779618f65bf0c536194d6ebe6c6123cfc66117ea14fea4fa24ab6b1f2471fcfd09235757b996c2fccd17a1deb7ff3ebe82753c5776fb57e6af77735793ab9b3d5c6923c91c811c829ac24af5c11a48cda2429dc0016001211c80000000118b15f00c82400000118b0f2aeb02bcdf5261e707883fd667f34fa1ebbae13a0d274d6ff0061c8c84b365a3930796d872e6b16b671afc3b00d6a1dae3352a9b654354c76e54cd36aeef8f34dc6ec709af53ce63ca734d8e929cb631a36660fb57728edbdfcf11ffa0adb73bde28e48fa2e5e14c29a411a48c47224475ec57574720da053da00480000008c5879575815ec1e4f9fa007cbe893e5f43e5f447f2fa1f2fa24f97d000480923603f9e9f73bc16e6fb0eada4929f41f59087612e6cb3644a934b2a4862bb0468a5fcfd2286d7e98ea79818387398d314c88d7b1db3d3343c2f236bd2343a9b0e3d4f0ab358cf7246a542e50ec7f29721758363a4fe989343bfe463160af605704692311c823af61257d80929ed0000230b180789000001211a411a411a411a4460000239000012238a6e9cf877e8ff949c77d0b5db9572d34ff003b3e2b9099caaed249fbf894ab572954c7fd59889230fc8a5a82aa1849267a5586d4654c26cd8e923e2dc766f0962be3f1f9ac2d78f35363f9326abe92f5d79fb07bee67dbb491ee39faeb15c8d2462bd8af62302349191a48cd9053b800b180789001211a4468e4000000024118000000090b11c846fca37b0b1cbe16f433b6bd40e47e852ecdaf72f4d96cd9c84c4e3aaf1b1c9ce2198e5871c66d26ccc7db3f4fc8d2d5b51c8c6a698850d02dfce108f3b0c368e33d4f94f8f55f118bca63d1cddc6e9efb25b1d2f19f3c71efa3dbde6f9a85eab1d7b91abd758ae469232bac11d78e458460d816146e07990008c48000090b11a400000046000000000018aceb0fe723a89ead796bcd7756bb2bc2fd84866a7c73cc7a0ac70655e56c553938f709ca78f4fc78dca14188d86326d9723af6592dbc73148b1faf643f26874fa7bbcc71ecbc84f51eb3c85af5392bf27685becd61d6fc4ecfac23b9fd38ff003f7fd316d793f2c3d81f2afd59d96863491d9f40475ec24af5d62b9182bac57468e41b20a7b01211a4000048588e4008c00000000000000002c57b024c779b7a4dee5fc41f4c3ce6a5bddf79bb8df96239b58d0f2bc674ee66f09a3eb50cdc99578b21961e488748b796e591d63618edecf699131d84db34daf9ab8ea78f33991d36dd88f71bba8db636754cac8cbda64771a8ebde87ca5c6f1f8f4ebd2fd235de9b84dc7b838eccfaab5e3923b00234823af61257af1c82349195d62b9b24853da00012230000b057580005790004602bd815d6057b00af60575815d6001c0de337acfe39fcaff4e60b8cf9634eb9cfee1c91a9ed9d2707c45ac6e38a5bd22aed78ea79d7a1cbd4f13ebd8fdb16b3abe5f2390c3239ac7ddf55e0d1f72d670d4b5edce182c69d8eddae2bf1bc3ca634dddff6636bdcb48dc7654f88b71d535243ec677cff009a1f462e69bd9f3e77dcb4208d247623021fa90475ec24578e42bc60d80935fb48e400000ae5800b120900234811c8239021fa904690469046012119211a411c85774a7c79f74bc0ae27ed397a90e5f8ff00aff26644efff003e71f61f63c47bf789c765ea988a995fd31efcfd8d4f2315b24fd24438fc8558d8365aa98d65ac1ae4b9c94c24d9b864371d5376b9ade13f99aaeb765f9bee87f94f7bfd584704fde7c595ec26af5c11a48d18584690475ec0af1c857d8053da0000b090024611c8b102bd8162bd8000000057b000aeb02bd80aeb0000303fcdcff4b7e29f3fdd744b61ceeb1c9fd67b154ea4dd1fc9b58c566f072cd8aa93d7c58ab524c545e58fc75b8536c1fb90b90c11daab2a9d5cb626263e6a78e8db3cd4f2d212cff93bf22baca0daf5ad99afe01c467752d2f51b8ef1a17ab77357ea7fd48ec7e5f18cd757b15e4011a48d1810fd490d87d57b0360af614ee024002b892c15ec0b00046000000000000000000715f2a2393c0eebaff44fe3ef33f40d0a86e3c7b5e38752ceea70dc86ac38e589b5ea96e3c54d9aad3b706e58ed0f0904fca4d62685b0cbc716ee6390b8e360c721cbec3a3ece976282ac5722bf731391969e42d54fdcd3e168b61a71edf23fd18f463d50db7141bae76349180af5d6122b823482302392347b02453d84720000b0118984298429be80480002423482348234823491800000024030f2eba03e9d798bcc761af6172984d5eff1583d875967139dc3cb253d87ea19ada1a790aa63aadf8a29137e5c9639a1928e7cd2c8d4c7eb66daee626d4b3e4ade3ad5dd665edc3ec65cd37941ea77776e6cb4f5c6c74918b247208d24602b82c5758aeae8e48c03605853da575815ec00024491a411a411c85700000491800908c0000000000243acbe31ff0044de0e69f7dc1783cde1747d96231d968a4afa1ea7be55b11e8fb3e0f6793ce431fcdbad539b8f61e52b561c476ae624cde3b5ad4bdc7c857311b3d4f76e48e478b96e85fb94f71fe86fc58f7937dc9c6365a7ae04722c23482315c8e4238c00571608e48e46d891aedb4691066348b08d208d23188e42084270413131ea14c214df45758f92158ae000011a42ba390464846001207ef9e3e87750e9ecbc63d7b93b8df8bfa0ebb572388b71538ed2e55c7e2b71624d4aae6f1f35b958f9a5ce3b1fb0c998754d87373629e132b0cd5a1b48e458b991a9ce92d0f477bfb8fc8745c346923b2aeb15e4ae0008e411811c8471815ec0ae2c3741a7dc024f97d11fcbe800000000000000000af60575815d62b80002c15d603a23deef3c21b5e5fe3f43ddf8dedb52c667f13afd956af34db7d6c74ed2ec789c4ec18faf262884b591a96c988ec53af1dca55ec5bb98fd815f2beef70c7a15d1f2b5c6d7528e41182bac0ae0057472472004724600af608f701a7e8c10027000002c408e411a411a411a411a411a411a41180118000000003caef557c57a3b5f3df1f6b15a1e9f76aba6ec3a7dadcb98dc8cd17e4bfbf9b2d6d4ab32c438d2e5b2199031b1e4212ad3b990a687d4af333dded8e9fb631c91eff9bae0011c8b08d211d35815d62b804690af182348911837090d1f40000004847208d208d223469046912234823482348234823002b8278d21046904690464800f057de5fe74a1d9f00ebdb3e0f43d263aadba90dbcde5b43b74e6e42a9af2166e9d0866872f0e3a2b90e598423cadaa1b0bcc3558db90ec5fd33ff3d7fd25ee39a8e3923d950ae15c00008e408d246575858570c2390f11a48c4720dc069f70000000fa980000000002198575884f90001223482349181e2be234de38e97fe62fa9fa9f97f317b09d754dc7c06ee57453e9da7c762721571631b5323572c77edf8a392a54cdc35ac62a1c8d48909f4f30df8b61b94ede6e25c8707f4b5363bd7ee1f9a3e976eb908e391347180000005757b0915e3b95c8ebd815d62b808e3491d893701a7da00458f931956bf978f3910f60c8000000020627632ebc4d5ec0ae00000f618ad4c991c469be717c8f7baf724755367f83f57e867963bb747bf45e7378cf99bb5d64746f57cd3c7c390ab3671eb95d2c69a0863ab2cbf10db92de22db39753b96e8e4b1b6a9d9863cb63f7141ef4f653139eddf254d2476404692300000000af1dcaeaf1d7b0915d62b8050d87ca9e69d0ed3be72f4a36196bf3a75c381b84a27a67d8ae96f71aeb21574d9b2ddb1fa1f1348ed0daebde6e39b9c21d37107215de26dc4d8be78fb135a5e4e756b6b54e7ae20d3bac113b1dd84f213bef0c7db2a584e37d9dae639787b9735f34aa10731b2cb69dc67e52fcaf71ea2700f9ef4f9bb7de2dcba0f6f99b9b5ef1c79fbea1d1f72e32dca8e777e21e588759bfe9ccddb6eb27e81a3a763a6abf4dd14d5e34f4d0ccb087ea48ebbe6a65fe61b1afdbc8922e436aed38df30e573b4bd60f44fcd2f64d247bbe72b8f68c58c0328e48d182457b02b8460008e4c7b172bea9f8836c7d7c9e37ecfc41a6f1fbfe43c7703e908398f61e0bdaebbb9bdd0f2979a764eeb62784748b90f61382eaf0b539fb21bb747b9752f62b1dd5ad611f706df52b5357edb43ac6a7adb8ecaf4bb72b90767faf79b89e3873b3fd54eca6824ef76e7ca7b1eaf6788b1243c06ee3c4e435ae3b68e01ec15ce726f01707ebb791db8d3edbeb278bbcd34e5ed5f423d7bf2ae9e758a94ef6fa9ec996d3ad686e65f5eb5fbb28786f8a3b6f8def23eaa5be59e25fabd7fdfac15ae9d97559214d2465893eaa98ca474e6409219ac32dda5eaae4b9997fa77cc74f39fb4fa8e45c0e13aa9f51e7bb4b8af386d692b7a5373ce1cda7f43b2dd02edaedf1c9cc1e62eca4983b19c862788b43ad4fb357fa499589dd4afc24b6dc789f8478435b376db67e91612a43eaac5d12da3631f9efa3f216b1cb745a9e87cf1c45b19b58e4ee379bd639fb5ec7ee3058873b88c8c7531dc4fb8ebd6abed9bbe2a58b65bbf0e6d9c174a9f29e4343c44d2f78f80343d0ee6794b37c7bb67a727739f0e7a85ccdb939afa4777e51bde61e24e15e37f985cb991c7755361aef4eb77f2977cab37a95b0f8fb3579fdb8e07f2e79a66f3c1988ee9759763579e798fcf1ee8e8ad74b9df8e896e35f52c7cd3d94172dd4faa79b11c336b6dc657f76358e39e6d8fa983ac953b49ad7d1e1e059f7bd4bb28687ed2abb88f212e2a679cac78289eb66d3f2bca5cadaf40fb61e72f777f31ecb61e9ce7366eaab75aa6cbdafa2719561c86bf526ce767fa93c85629f787b3fe52f3afd161f40bac9c67d75bae48d4f85b4ed6dce52e21c2691ea7e79ddfaa9b95ac72460a6db332f1ec588cbe22eca53e0886e43c652ccd8dcc76132b562b1a9cb902becfca7c6595f4cbec3c2d8f929f2f60b0955637cc721a76f3bc6390d698d4b6dd237b961cbcdb0e6d3623bf1c91d8ea9b7e4ec875af52cb9d3c3def3f42fd56ecdf11710eeff9d64dcad71cecba4c688fcfdd9d490642c62c571026db74ebd137ed4f076b1e6e43f5f37aac3f50b125a9b1726b2c65bea8cd4ed23b95e9cd4e3b5f58b74d24723f7f135d8e16412d786685366e4b15ba51ed7cf5d64b9ebcf21ea3c9dc01a5dc7a3dd44abdd3b94ba0189ed7f527e89ce4782b9a774b0f236e5c39929dcbb88d23205cc7e6a7ea67e31e38e53e31bb5321b971c37f6f95f54d7ad419dfb52cb7111cc76f43cad3afb8ea7b4622e31f84df347d8d5c7cdaf65a2b3b64ccad3cebd84df2a4bef48c86462cc1b3638a36daa6d7ad65a0ee53647283d3ae17e748763b5f5ef85b8736ee69e2dd368ee35b263a5a798715cc7c4fb37cc6e6f9432f4fe0f3548b2152ec3f962bd8c841e53b8ee2d9b9264e1ccda1e429baadb0ee71d88c2700e566f7cd3ac6a9d60dff009efae47aabcbbcf394dd54e5ea7372bdcc4dce26e5a863929cd2c534d4eed39a686c41f5f3298a934b3c915394b74ee53a96ee43db5eb8f63f1dcc6ffa93d9ceacef15361eb25bf2d7d33d8c3e68f597fa48f373eada8f34361d6367fa6e9f2d95da30559bbdcd0b61dc4bc45c41bf7166cea6cfcc7c7bc852d8d3b11ac62b0db26c76472c85bc223f7eafe2766ab5da6ebdcb245d759bb15954dd60c876554dd74c576ae5a70f5131ddccc7c2ea47ef70263a53f3dd990e976cfd9fc7984e99e6f82fafb9571cab7ea7cc679552bcb9fd86ee374b27357ce3f2df94367569dcf992955d4f2fc59d543a47137656afd063eaf5cecfebdbeafc23cc7c7bb64465b67c1e9172d63ed40b9d61ecc75afa78f92399f81f9e3452752a19a1fa33bb126bdc5bf1176ae6e8676528dce6592afcf0772e08c42f4bd5eac36219956c4b0fd6431b62c39cff0038466d64dcafc3d0e3b5fb2edb70b45f9acb9eab6e3e447ab7a8b9c0bd3feeeeb9d841e79e43d2fe8ef67a2fd974dde3b18f82f85bb01c17d7d1d7b13b0eb1d5666c7646141909a1c8c562a4391a9ea4f6e26cbc14e3c269dbe69b6f10e6eaec3525c7647154ccbfe61307236dc8703638ec54fc0b90c39e1a4ecde173aa9cdbd0eb536b1849b1db7ab4e3923891d7b15cabf93fe2480fa89b8ef3c57ca9f9a2e636d437395635343b2a6faf9460923ab324b2b10cc95ac43b6ad57d0b86fb42b8e8e762b91f5edecdd18872d89fb443dacd4b61c4fcca7ebdbf7f3ea19ed2f2975ef50f90d7ee8384399785b16a13568d2124d300851dab15ec58af8dc1e7307436596d9f4dd9b51731dd90eb7cd4f63e8fc3a6f3d73777ae3c99a3f036ea971464361ea57e82e7390b52d4ee77989753cb6277b1dbb9ae4dea0c8cd7e6b4c56eba26c351ed14bca4a7638e5c9849c25af73f6bd1b478f6ba862b07bb645638ca6e47d615e2c8e8f54e4ccbf1bd492c75c7ac9b971eee2bc35be61471c335308c910fcd82b83f79af82b98fe2772498f8fcca7723d9eb6b8c88e40058af62dc6ae65615ec573e7e860baf7d99b1d079e05c1f6438437b3756ff002687edd4f9a71172df16e10e69e16750f426ff00453b81f12976bb15ec71bed5ec5748b0235aab72c57c6e232f8eaf722c862ed6b763b263f2f84a79e57ee379c5da5d6dbd6389b2fa6ef351b0e6f8f778fd00ebde3fd39dafaf87c947ac2cc3e5de0bd61a713cb1fcf52b58b70f9a5a0facfa9c317a09f3958db1a91de142cfecb1d8aa97f08d72babac57b0b1f98ec80c77467bc3e52d97196bd6f1db3a70d792315c11dcf9498ff009b829ac0a5c85a16d1f379b7ca93c3f9df736962bec3414cfab08648e458092985808c92c57575809011be61b11dbe16ead7a1da97d1a975c32a9ba3878007d3ce54e2bddf4d1f6db73eb4f247c53cf233ebe78fbab0aecd8b556d58af4f179bc526c3dc8e4d5ded9684396c79c1cd4d52dedb8899b7d755e2ce53e05fb03b3fdb6f32f6cfa73d3f9b88798f50c855c7627d58dde1d52657d97f74dba76a27c1fd48ca7e502c6424c5ca65ff00313299286013cb0a34f24529c17e55f7c7cf7d857a18d2e471c7f249f4ae011a6faae9156d558d0e431ce5a6e5fa7354fcc1b9cd8b9a686adaab6218ec579162412570b118571f5f2585724b0118af1c8b15d5edfd75efb051f4943ce79397b887f43d772471bf21f86f99785c553d9f977af70f3363b2d5f099be12dd8b98db50e61a395c55863fed2d3926cb60f39235f495e9cd94cdea7b3cd0e27af7d83e00fb2cb732fae65feb75b93bd44f20fba34ebf7061e33d9753b3d858fa883238ec26ec72fcb838a46c0c5c06cf0ebf31b0fee0466aeea729b94da996366974eb51bcedeaa7297116dabe3d0c7324008c2bfd46c8431c82adaaa53a93623453737d38ff003f2cef76c23f7410cd0dbd5c2866cd848495c11824046b15ec1f30d8ae901188e1b7223919faeaf767dd057f39f67e7feb7fdb69f31cdc7af11ef95758b50b39ce9c02e7ddb4bbc59c99f33b33e2af63eafbab22c5791247f31d8c86bfb06beaff009b3ea99faf62af03f3c706fdbabd7b887ea2cbf653ac5ccde63f47b37c878ee7adf1c627907129749cae47088f94addc6d2bd3a997c192e471d912dfe5c96bb073c232136b131b4623f389d63ce1d1f67d53675e1a73fee6c7e4b1c8ae8e414d62bac4f2c5faaea52d5af622d632daceaad73a7e639f9a765c85f4af4b5f615ec494e9c762bd858472012570460000900faf9b08d4e48d5edc82df8719f262fd7e84e3fb95d3ff00ba435737a9673a387922de3b21c953b7cbfc43a9eb5bd7633ce6e4886df73711d71e47e46cdbdc3393e864bd8ac8d3d3d8a399c4e46b495385b9678bbeeb0d7587d32ab70d3760c3d98367e72dea536432f1e75ec772143237cc5f2e7eee29f133963f4e268b967e637115ce4785271c53e4efc38a31dcc6aee0ce01ef0f44ac3cfdd7b2d83b7623aefacd79a48c491815e758fdaf62b8a13d2a2c56a5b3e91a5d87376438e37cf825ce4c1a2d7ac572babd88edc64726520907d7cab80000058571f556c4705c491cd13e4588da76e31dc741e6ee8f583ecf4765abb5e2ab6b61d5368d46f58e31ec875de4e9e4f4224e22e5dfceb3c6923d6dbb58acde12a7a872d86cd436b4be39db353fd214ed92f6d563cae2af9eb5f643a31dddd3c96b23ac22b1b3438565cf0d862d853d7db28d7a1d9e23588b668636166c84862e4c84ded85f27bd7bf09fc49d7fc55bc6db98faf9cfab00aff53572c4914a470cd0d753c7e43154e4c1e91b5e93a1b7be7216a9b67c6eef2b3ebe795d791a4491c8538c8d2588e3588e49a14892390af1c9189be6312000472474ec472472472488e4b5184c55b9f3e9c5da973d71675dabd0f58df35aeda3e1292d3e8326c3d9beb27ef1d1f79ea71372ff00c76d5bc75a8f4f730b9aa78e8b63c510e3f23fa8b5d6e58ad6ee186782647daaf4a7c7ef5175be77d8b8dd04dca4e22b797a2ff5521b915ffaa66723fb8e16d0fe13a0984b30d67f9eaf71fc109a4d531396c7fab10c914e7cd8af60af62b95e7fd0433522ae232faf696e6bda6edba4682e72eef1a1723fc96c7210e4a9c62449257915e4af24760571624a7624488c8e447208ec47192462412574727d46aa57af6ec491c8cc88d6234d08923492638a38dfb37c23de6b3af72e5a1faec734b721d7b43ee8748f39049e8455c7657e0bb28f8f77ce26d84da76731390fd150e426ab72f4304bf4923d83d44f2bfd04a7e760b788e33a5372943c31b2e6c7af916bd91dbe9f3736a5324daf23a14d9721c3a6db85b15bd7a4867da26d5ccf52bc6df463cdc9a4c1d5b50fa4734139f362bfd0995e4587e7ea352b98e8e4a9af65b09a5b7ac6b1979b95b3c85c8fa46e5f3193779619b8f8e186c57f458af609232dd7ae3258ae2c012464721211a1faaf2488e4b74e48ee53f08ebd887cdb490a1cd87cfd4d187a91246248669268fad9aa76d382fe97abd3b09c85a6f4b1f10bea6fa0dbe61ee379e5df7f8ce315c23cbbc0baedce5f2d8fc87d9aa4d217abcd3539a48f23d8feb87abfadf7d50e3df4774fa73f4632bda084f44d8ac4749a0ddedeb17239b66fdd0a6f39dda2d7ada49bf29e2e6abb2ddd5e64de4cf5279678821d8d0811333fcc72023244721621f91155b5569b1f83caebda1d9e87b971ef31f1d9d8767c466fe7b26e9253b1ce46ae467d4292492c572991c96015ec58572bd816122390861c857ae827af60b1629dcb74e9c7247158ae21b7615fe904c2c00491c88e4a17e399c6fc3bd9feb7f7f4b81ac579bedd06c3db0eadf33f10dcb8cb67d61b7cae4b1f90ec2a4b2c7258472c36e48f21eea7857ef5435f378fc855867c72e2162643b7e18123f478db36135fb5d4a32dd669a57bfe33e9c69fa1a9f833180003f01f148d6d8c76b4686df1e73a1f3fced96ce1db35d34eae2346247e4a08cb15e684af612002bcd313432573d4b4857b976c1635c8c921a623b8fa2ba616000008e4d0cdad7e9ce34fd251ee7ca468a9c236fb7cbe40d8c1309a39670d83dd823aeaa3cc308f3fffc4003610000103030302030703040203010000000200030405061201101307111420221516233032405021243108333460414217253543ffda000801010001050258fe587e7e3f3b1fce8ffac63b0ffad37b17a4bfd5c4769058a1fe176dbfeffe97aed2ab54b868af4b6145ad52e62d35145fc0a221112709c98d8ac84b71fe3fd2eab7251e82d7bc973ded207a5349992bff001eda429bb468ecb532a834f06f81ca739548cf3f29ec50dc54ba7cfa5c8ac3da11f26d3a70e50ee68ae48fb62fca5e57643b4e956bb95bea35d14ea5c3a3d3db70474ad488ccd02d7afd46b0ab97d51e1b373750a32b6fa946370bd56812a55cd763f509d6ad79a9da0d618661d3ee6f6a1dc4f36233abd1a1dc34db89a94a2cc8d23ecfb7e5653cd32bac9777b6ae1b4ea036dd29aac3f4d8f02e893c57a5727b8ed06f0f0355ba2a0fd6af4baae229274b9cc51644cab0b9472a5e5586ee2f6868f5684828752290d542a4fd634991dad1aa1c5f64c5a4d40a40c86478897a7cf8fe76f3bc29d66d29eabd5aa90208f24f83566a3c81b89ba2d51bea53f5287d48a83b54a3d06a5199871ca6454f48c94590ebc76bb6fb3a57aa9ed0954b78a38c1903e2654a80cc772e27ea8a0d624b90f5af00d4ff00f30428b29beac562bd32d7bd1aae4a6dc173cddb7c7f34e6021705721dd9745d0c8d2ec5b8a3c0a3418b389950ea02499a90c5991def691b316834da4d4aa873912a6912995875c6a8fe0e294aab30f28752e6552904e08d58590a855aa35469c6ca29d16551e1c679be4769b7c545998cf512bd1ca95d5c2f190ea94ea831e4c7f39d62af1506c9e9ad2d872b17f57b86354a7432a513df0a3ca28e6ce52a64373c41d62a1cc2484bf565ce1619c5e4e4a222f18e96acbdc66c9e44cfc42c988a739e8643499989156a19038d93cec8aa35e0d9b9aa316a1d39b818c5b1c437c7f37f49f5ca613d5ab4e6785a54acab1164384e13c38869f43646d93d2b9b5905df7225dd1384b2425ea64b25e29deef484f0ba85e21d59c88992e175975a832bc430e45b16bd0a8f70c3a8469917eafcf48fd1aeb93cfc5bc62d5dd28d15ea4c1b7a57a5fcb2d997314e3c44d1121dbfe516cd912125c899a6baf2c48938de2ec322209521c8aa3ce605393a03d199308e563ddd5866450ebd31e8da7e2c7ec7febfdc2fea1697007579e7e1ca6653f548b50649990890a1112d0be432e62b93d4cb9eaa7b8d457e5134442e3e4d126a41b28b948b47085459cfc72e91f50a3266646ee3f831fb72526535063506a0ed71758a53b2972913506510aab325b12ee9b2f496e5e7224445aacb6ee8722d44485a71e123150640b2addbc1d66816bd4d8ac527f355a263c18dd53ed176f4ab0cca7cc1f532589482099188916c2e2efb17947ca5bb397239922259286e136741ae498b4ae91d606a52b2fb9c7f03d4ebcaa316f2bb3a885724372b8eca9f299e4d5ef490964329e12f9a5e4736c96445b08aa4d3dd9d2aa1491a3b5d1f7868f25979a78117e07b2ecbb2ecbb2ede7ecbb2ecbb2ecbb2ede5eb752ca1ded208b2f57666672278936e2719c877158ac563b63e61d9cd857a761251653acbbd3d8751af17b994b876dd06ac5457c4bf33d7e2eeec86dde564b10f102f197c4592ff00a90ae35c6b8490b28629226715c392e244ca265136b058ed92d7cd92b5efeb82d756cff519c2d48bfba797a356dd521cc6b21590f9bb7e4315d7eb45faa51e613ae1a1226c79b25eb4228850b69b8a862a18e2b8c570ae14515702e144c8a2651324b8d10a215db7fa778e2d3cbd515fb56cda3dd85d3ce9ede941b976c562b11588fe4e5456a435d48b758b76e421db1428450c732431536d2c560b8d71ae344da26d13689b44ca265391d709e4e3289b5db62592c936e2a6c38d785b90e549a6c8e8cf505fbca8bf83c77c562b158ac562b158ac562b158f9ea923c2c1eaa73955b614c8e4998e9b6563b92ecb1db144288510ae344cac170a7194e329c6d10a21de2c1294d5935e7ed9b9baad6795b7757416a9e06bbf98bca430cd3ba90cc31b876114c8a6db42288563b0ed96d8ee43bf644289b4e329e6711705629c1da8af08ca984d0d47a9d0fda5a748f3f7acbf31d4e94fb306ec7bc5494d8a115147242dfa75dbb22db2f212c964b25ebdc851369e6ff47871214e0ed05e08f24a3938afd168ac4e84d27da5d4efcbb9e90eb24e7f9673c2f21429b67250e38f65aad37c5108f90910a2d84563e47854a1fd47ea787f4517119130b8c3aa904a1daffd2dc527ae1fcbcd7bc3c6eac5606a95175ccb51151d94cc742df18f65aac964b245e624223aae3d891163b62b55387d58e24f224c8e4762dae573543fa94c86bbfd33d29f8749fcbd5044a9fd4a9594f2fe591c8a9b0f9178716f421532a02da72a8ea1a93a86ac4286b499aa30e21942485c5dd0f90497202725348a60a1942b4736991f244de29c45fc4171a6dffe9e686539deb0094eea6d8141f766d2fcbd4191910faa50dd6aba4a18e4ec2641b69c15527251228ee92f0aea2a7e48a0ba28619228ae8a6c8db4cc824db992124449c7053d3314e54091bcf92f512c9c43ca9994eb25165352110fa6743c53a89471cb5e90d04683614ae7b8badc2388fe63fa8882c4392e0e4541679240fa74c445a94cb449c6c512ec2896bf564b115c699f4a14f278b244c9385e145708a18a2862b48a18af0a9b6c99365ce669e67209c1c6e92e9edb2fdc570e5ec3a0f42e19562f1fccff0050543ca90f0e256eb3ea11f54e91c62e3c9c7853929a14531a4531a4520565921731425926c508a24e378a70b144e2124da1d8457871251d9c510aad378bebfa758ac155baa1522836d745a97e06d5fcbbaf351daaf75aebda4aa9759a657a054312956fb3887d3a4e2cb594f1278a61273c60aef25723a99275c327099265c17b465348445382a41222cb52784514a6875198c2190865629b78490928a69c15700e2623c9af466d38147b66e070aeab9a0c3620c3fcbf5327153ecd6dcc634c862f15419c5505b116a57a4257d44d8ad512c45132d2719610c7690b2229914c2d13c5fa482459228249c86ebc8a9afaf02f8a1298da6a43e2a3cac9432c4cbd43700ae9bb36d375a2ebb5ab562b460dbe34af918fe43accef0d93e23f6be20555991e0b7d9fdbd4bd3a3c396a4289b44ca26d1475e157855c24996d08ec5ea179bc971a264962e8a179720a115c28594c28ff00c5c9e928f0c8965c2ba0b783f06ba8bf0f8fd875db2f74c9cc58c9aed232798b7f4f8152f56ae2215d910e444dae35d97658ac715a6c4884571ae15c6bc38ae115c6b8568da65451f4dc5ea99e915215933bd97756bf98eab52fda964d533150081dd2432d65451c63ca4f0feb8a707621d8b6ee8472dcb673c98a16d71ac714da8a39056bd553c4bbbc25c549221991cb9a3fe44bcd528e3329d5c82ee850de28c6e4a113a4ff0086f271388938bb8a2244e227936449bcfc8e12e41d87615db6214d8a8aabb939506de2ecc9733564d0dfb8abe2d8b21f2cbe70fdff00552dd2b6eea902c48529b6b0a08f1d15c4e278b670911271e4e399286ce68a3e299f4a73726f25219c45979364850aff009d991fd592c46710b8e910a8a38c7fe9bedbc7e717e32ecb4e05dd4ab9acba8da73243396b4bf4d29e24e1279cf511227138f271e58aa7fa41c71732e644f2e64da7b1e2151dc424b25dd092142a439c710a3e40dc36849864e63bd3db6fdd3b4bee31fc15e16ac6bb2955ce9ddcb4d9254d994d872093849e2fd48938e271e4cb2b8d136eb7ac8292f2f0bc6a3bc440e3d8e8e48924a2d41d6c9e91cc24da64bb6ad92e4d85369bfe6ac58c06c72d062938ef467a56f8bbf698ac563b63f85eb40e370bdfcb849c44a4398e8d8a6dc42596c488562289b4222b85ac844510a70714cb992c965b09264b22ab0fc2b5ecbaf5cd2ac9e89d2e82efde62b158ac563f7dd7087ea9029c4e225207665c1243b1221d872225db6244992c75ee8490ecc8febd2bb3682f5ab1e3b1143f3fd56a4fb4ad49829c4f224e8e48bea98e3f1945a84d226e73e4393f894a21432914c5e232432178a14f48124259211f569bb6a9edf23b6bd37d976f7fa04a8ed4c8d7751dda2d59d4e6c49e1fd5c8e2e69e1ca2c98321815930e468b0e1bcecea6b05a374b86212296d0c98edb04752116c228bee3ad8e29b1f20ae98d0fdb975ff00a08aeb75045c521bc510ec4885362899c9145442f88457a4c1d1caa3e5a7b62527254c78ca3e445149e26e3f1888a1dc5476f22e84dae50699f85c562b158ac77c7ed457589ee1a1d499124e270512214228871d0844b426d62b8571aec485ac90b62daedb0eedab26d993745720c2629b0d17dc62b158ac7f0dd78771a2c39c24a63389383bfd3bb84b25cc4b9909212d88b1d36142a0c67653fd2db146cfa2ff00a1f5f9ec69e4f1b26ccc190d3c38ea4b15d962891328a39228e48592142da11f21215159278fa47d2b1a38f90bfd03afd33298ea6e414721785e12df15db624485b58a21442bb6f1d9270ba0f65d3a76bfe8bd7299cd753de922f526e413242f039a09212d889775dd1212592cb625d932cf22178574569a34fb0bfd17ab9209ebbdd5f4a2f521708486509217172e4392c9112c9722125c8b2d8594f3c44a28e476cc1f65dbdfe88e382cb57b4cf195a7112c512d532e16885e5ceb9566b35c8b99649b42d88e8f116d61533dad75fe107e717cf97321d36333785b92099991a4ac55fd5e1a7d16a9239a4e48871d885638ed8a2c9775c8b91138b9137ea51c56bf4b9b740a97e3af5fca17cdafcd1ac466c887580dc99721faa15b14ebcaec29d15c73222448876258aec885136b897835e15371d36ca6c714f16cd8afe9ca938c3ff40ab4a629b06e4b91dab4fb6dbf7c264e9b47b4605dd7c499cf94e75ed362f4ad510f97b92f4edd8176c5698ece2114c8ae8fd1fd8f627de91229422bc6096ad965f604e08ae5143f3274c8d4d8d4abd2dfac2ea25ed51ad54db254fa849a4cabeab53ea50cbd49b1c976d8962b5dfb225db7125ea243b8aa5c52992a9b0c69f4efb966b0c12198d38b9c513c23a542b0d32152bbb1768338a626138e08a17113822bc50ae414243b77142e65b65b13c2b90513c22ab55a18aa1dd80f3b065730227045090979675c56fd2caa5d59b3a0a9dd767f22eb75caf3b3baa902a831ea9328353bd292f8e8dbc99f521558b445e1ec885122dbea5d9628876ed92edb76423e46c574a295ed5bf7eea3dd1304e97753a5a15e42dba57835c5715d858c1aa3b2a4da3307265e1109d501128b2849a9d5216da1b8044cabc22a2d6448caa0222e559ac21d51a710d41a4f559a6cdeaf342057635cbedac825578442e4ae138a9f5821996cd73984657a2a15618e74fae04843e9129d0c4b59c78d70aad5062e4a6d529351271112834d9952505b9ecd4eb8f3ecd4fde6998fd3ac37b142e6489c212994fa5d7155a0bf49984e2cbcf8ed88ad1b142d8ec5b36bfa7b65af7abed49e11522a022516566876e3165d66662358a9625ef16413aa44e2a5c8c55bb723b06543ba09e6a754093373785d245c4eca52ab0ec77bde2e401b8b8f572f42ec37719287763ac9ccbe1d653d7a3f29397249269eac3e326955af14d4e9c58d5243a49b904dc8b6ab98bb1aa52678b165f882894c83041e65a42de3a389c6f995e166b15e8354a6cca3ccc9506b92a8350b7ab545b899eab5b719e870def0af48f51b258eadbc485e4eb89e8ed4819d6da90cc98a42f2e4596da794772429bc574e6aced26b94f9052a06cf4a16539566057b61a221ab349ba9345a8cc6890965e570b145304578b14db825b1162a7549a8ea457b239154547ab34e21aa3020356694c9d96b22a842aa1523902ccc2efe23254f2224db843ad36e41654cb91ae26e70ca06ea0d45d2b9546b266712a7cae60aa364d914e216a9f289c8d549444ed26962dc19ce0b2729e12549a870eaf553914a6791a94240eda5655cb577689468343844f30da2991973329d79a5afab517113792bfac26ae687321bf0df56adc4ed16643721dc14eaf515da1d5b5fa909765cabbeef362f6932d78cf29549a8c15cc8497759797ba1d8493649dac1532551e64d6eb916e8a4cc97509c3174b82eae15ef64970c6ea26cbdea22d59bb1d154dbcb9a553ea8c380dca170b6952859d2a17008a72a84a55d1e0ca0df4c113375462072e061cd2e4b881b31b93e2cab804820dd04ceb16bd32621aa3a1a70baa436446e412ecf33c6439aa4ca16d1399685cae6acc89222cce763a915477bcc904470c8c821cac54c902e34e48c4d9904cb147e29d5191586a3c572a8330de91ea66462a0caf8f0592a83b66d9763c272a7542861efbb319cab57aa2e3b50beae3a7ca83d529e3ad3efef140cdf02ce8dde4c3da337b431d63dc94b98afcb0a1dd0d54297329b28495837778177a9d4962b14c21c752143b658acbcb2a8b4e98a45af25b4f479314b9166bbacbd3dd77db25dd0cac554e467a53aef627512b434eae46a7de4d56235cd2263325994489c2226dc7453d29d54d98eb2ec1b89fc28b71116b06a4d3c2f4a6874b92bdc68aa9913d7170aa856065229cee6cdc525951eea7c5a9d5a7666a42ef77241f761cf8b4d942d848a8193cf4a6875221cc9c6882617ac53658bb15ec81921ec4485b2714a6cbb947c8a0c7f84db7f16672b61309f6f566a032234594ec79550aac994d36f3a2a389388592156cdb756b926d27a5505b857cd9a765b56edfd1aec877039e0ca3d69d79aa84562e4a563c651663f14dcad93da335a94ceaf57a7b8a3dc1548bad37a9956864e750adfae05c11e92cc965ec55a37314e8f56b0e82f304d937a92cb142e6dc9e62c4948a2d2e527ad724e526a31d10be289c42f0ae644f2eee926e9f549054bb3f2d62b622c477020c3b80469f58267df0a7b904a398b228938991c499982c8c5ad63ad26ea26d4ebcbe154eb8ec84e543f47a41389e2753d289b265c2708488428f13f5aa3cd331d91e6d78f8d78c75b47502ec52b22e4fd39b1520724229b1fd6363ddb26948705b287398219cf35ca2e08a1986d88d4085d7a731215431206dcc5d8e29c4cc3e44cb24ceb65749dfab0d2d9a5d062bd56c4aa95461e62a8f49b4ee6a856d8ad52bda0432a2d58a9755bb21c623f90d97eb4f9cec390ddd1586d148279dc916d910ac84962bb96c5beab225912fd57c025e1e1921870d0b318508b428890a64845aae5618f655487c65069f547e0cc786837e43b8addab5b7391272471e85389cd62c8214cd4b8d6b3b9138f0a21e4443c6a51291ea5050bc23a7b581907a73f31f1f860e55317597b35a88e9a0c32c9c144284510a16d322b2747495926c89b22788936592144c8a7997454a2c87fef147216d91c228e4ed9760c3a08cab81a6d3d7508aa85d42d8d52f486aec9cc5526506a051cf24e111354d99cd0fe92f38ec5b97939090b8bd3b122dfb2ecb46d08ec4b14228538efe8e3d9356cc12914721e13b62a822743a8b15e897574b6b747111c4a4a1c4485e4db885c58e4a2b39294ca9788a788533281b52257226c790628fc599285969b1c8e2c8e3452391730927bd45c258638eae6a299f521f4e829e6725e1cb2d5b24c8ac7d1a64b2e4539bc97872cd91c7465c772b06cd1b6e2d52e4c54ebb181532f492a55c53e46ae3c4e138e6424442a3bde29843e9273e51126d38f34deb3aaf4ea73b3aa31a9cc8dd141228f321ce43b7742e2125e9582e3258ede9db122582f4a1731d7d4e2111144e65ad347c2da95e8a4deadb84a2d50a741b1af26aa8c5d9d33a0dd4af2b1ae2b49d7888485e24cbc49b71d433b154f942aa458e9502fd4a4177a7b2ecc7dbb747b4cc62e8ccecb498f13c4cb6b8f142e62a452df6d7857f27049b6a4112e4cb58e58ea23dd7832ec314913648a392164875c5f14df2e5223e49e65f24dc17497857574ced1112ae5c192aa5789c29121d709c2e4f212a2bb8ea9c15f5088f91e79a645cbaa88d915d9474577402d2935a7674a9cf941bb254c9306eabb73875bbe9bc82b194db455aae10ccba25498631ef6a8b2a9f7652666a2e65b892c9775dd622b16971a2115f09138b93159116adfa8e47ede0c7a1956e8ae0932ed1677819432a4d0ea7625f6171c37b56a646be3a32c4b4f477e2c986de4a3b23da6471715345d1d67365daa9ca887f5a1c808a750b905b6a54c2944c912125a3c22b9b25dc148a3c6717b062a7adb6093d66b0e22b058c86c561159e2da1b6d7bb69cb5c7b95b68add4ddbe8add45412efeef92f61e2a976bfb425572a4c438f58ab148d49c44488916e42a3b9e1e5221c90a2144aa35ba752f49d7b4c352a74da812d1325eba0bd8ccbe19c6ab737a98bd1be68358fdf5a547fdf59cadbf4cebb87f6c5b5aef7350cae08715d65e69e6877c8b6cb7271722c90a1731d5eb91a79ab5eec2a0d4ef89d4bab4d8e5c9a50a92d5e1428b267d06a367dd4c5dd06a915fd02bd41b4af29172f4deb766bbc69b6c89438c22d3cc8b835a8228a1a71b26d7d48850a115e1c970936b245ca4b27c5138ea19842866126de4443aa16c71ec2b85a5e0da2454d6b55a535a15ecf6897b2d85eca6d1525a5289aa3c7b82b1cc6f399222c512245e47be986f734324dfa48854e8d32607b87197b8d4e5ee1c34363d394cb1c874728b568aed2e3cc0937953df941223bef59b30bc759b4bfde5996396505e6f85db7ffccbb8728a5b597f128b710fc58354994b768b7743a82cbc844b244e222f28a24e0a64b13a2d51fa6cfad541da84ab6ee09941a8c6baa9d3d8b928e4f2b6af8974776e2e9ad12b0152a6c9a2ca2a87ae2b7fa5c45db4190a53c29b24e2d1b42f629b94d27a50968d684f2e11ede144978515209a1d596dad5710a111588a244485e432914c4dca44f2e65cc42ae8ac290f7222244bbec48910ef4373e02fa4fc98ee5bb8d8bda7b2e1f838348874e8f48a0b5473ac59f512954f8efc59f747aa097f2ac52ca99720fc5242ad9a93ee045a84698392c965e41f312ffb09295f19a12563d5322875875e53a823528d41b8ab16fccaa4ea75d5066452a4d41cb8188fa4eaa0ccd4a38a90cac712efb70a16570a82c882114e090a225223e5ac78e4285b4f32f8ae475b5cc5d9e9842a5559d6d335875c4539d251e6ba25127726d5aa80c5875498521d70bce5b12a4b9c739388917ce7a2b12156a0bb3a1cc8afc57d587fe1dc85f15cfa9b56eb9f16b0e3f4ab828776313b6edb88f9077244849432170093644250a77bcf023b3e323dd4f46aa04a9c5de7432acc698591f371af149c9192cb24445a21909b7325afd24f6299963a039ce29b27c845975391493cd93286a5c6435468b41a8304be027a38926e130e21a7c014dd36312f64c524cd1da1d6443165abbaa593af3991116e5b16c5bb65c72117ab46fd4d17cf253a9f0aa0d55acb7db563324cb572619b9f50aa0962ede8de35a543ba9f82a3ca62535f205127368ee62eca1f58ab46e1f776ad3aa454572f09de3a48cae64cca286ed6ad762e417ad5a88ebec2aa22a0cf43439fdfddf7fb150648ba54b92c8b315f714ca5bb8932fb6899690b2d2e169708a2862e2728ad388a82d2f77d7b1c850d2f25ec552a86fa28754650bd516d3752982ab15875b835499e21f70912cb62f3bdfda8ae734724d7f1f658ab8a97270707136d515cc4ef8ffe8ed49ac4ca4bb47ab46ac45f90e273615df92292c95af588756a4549918f3d8f4e9502c62d1ea84d8d3dc8154456ec625eedc25eecc32456db0bdd88c9eb5582d06d163bbd68b05a3964b05b0ee23e4ede426449143609781615f939a192f1222f2116f8f9355472ca0a67eb45f6592af5a6c54347a2bf15fa0ff76fcfefef41789b0835417bce29c145bc12c4dc1e32c932e1366d913899537fc38750763a875838aa83743130254e2ca2cc24531375015e384978a15e285720aec89b58ac562b144df9b2592a84af0706e4a814a94e22dfba1db15e9f2d14b124cff7516c3f235f9556a2c3ab351e9b268f3efc1f251cb1d59704941ab62b212d3c829cf2325894cf56ec9211c5d9bfe1e4a3c826d43a93f0f5b46bcc55dad591144ce48a2fea2ce2899242d92d72ec2e0ae41dbbf938c4962b15c285b5c2b855fd33c0d16739ea259794b72db2da9658ce24cff7f62fb471b1715fcc9716f6cfa9f11e33170941a8145d63bcd480f239b8a1443c8d6cc92ff9a97a60a12424a8756769b322ca626461e244d8ae344289b115c79ac7cbc8b997321797221790bc89e42e2eac54bf590592224448bf92d8bcc4b5514b8e71126cbf73b17ca1f96f32d486ae2b5dda6ebb5b8f70cd731e5ec8537507e0bb4fa93150690ff29cd8b78e4a50f1ba850ff154ff00e7ec24992566d41f914f17262649d5ea15f11138f91c56cf1271092e442e2c96484b6c856408715c7b08aea34cf155a78912cbce3b9224258be449b2f8fb97cd2f904390dc569f0ed49f4ca170490c8144e7a9ec49457dd8eed3eb4d4e4dff002e2ff8f237f54ef51121251cb20aa7f818ec28495872b1a8c686ea26c853ce10e9e28d78ec53752f48b8b997222225c84b9173217913cb47168e227d73112f104d85c92bc4545e245b0f947c84893a58ad4937fdddc917d8ebe5b8ad5194a2e51e40c8ee86421949b739361547ae722790fd25e4124f7a8490a8aaa7fe06c3b5932823d7fb8a705a24e43171152da4e51453b4bec84890b792222d114ac578a224320b54288715c885e15cc22b904b6aa3c31e99507391d7371f30ee44894c24d964d097c5cbc9afd863e7af5bac551486df86ef22e4505c2cfbac7d2c8aa6d61a2d299713d32e2da44e871515d2c3c54d29ee017f243eb51d550bff005fb0ed497b8653244e4622c578914dbd92d5c2448845658a22e45c085942229bc4539ea44cae05c2ee5c642bd4aec98eb34598596a48bca3b8ee48894c73d315cca2897c5fb712f2d7282c56027417e9f2153c72958a12c74155ecb12cb38f56b9cb466897654544b1a0b29b8ac451443f08bf9251d560bff5fb8a8bf55b23e3a80e534897b19d4cd37145057805ecd4e5350d3d7825ecf5e050c3c57854515147431d3d1c908baba84e70d21f45f31c4f2904a9a5fb5fff007fb62f3d5a931aacc54a9b26932a93ea9dc2b1e3212c4ab58930ad3b8b145f56da21f5065f0894755a73f6c24b1c910ecc2e97ce2916a93de91790b82bd3b60b8c562d2e315c62b88514715c428a38af062bc1a28628a9e2babc42c9bc48b61f308f90893c49f545924e0e5f17e565f3c7cb52a5b1568d1e8f26975971bc74c76ac0fedb6b6ebded0636d137fcfd229955a7329228776d7466764d2eeb9090b84b25d891092ecbb2c76243b765d962bb2eae4ee6afb9ea445e6cbc8489389e2530b1d280de2d37ea91f2c7ca3f274f33ccb4f0ca864c938285b55812f07b5332176935c1947ff1aa6d10fee933fc4c7bc44ad8766feae96d40a1dc7cd92e45c8b9b1452171a26d70ae15c28a3af0e8995c2b89712164971e237d4af195e78b61f30ee489389e5309537e0b107d4e8efdfe5f7dfbf9b5dfbf90b671b1706753ca3ae35566ff00638a1150c4796ad903b6cdc4352024da95e990e0e253a478582da6f6c76156acc2855a1aa08a72b4d2f6a0a2ab08a1a90968bd3b62b11dbb0ae315c2b8d0b6b8d569e0834aad3dcd31ef903b9224e127d3df124b3fc41fe7c9a7d9ebf232d9c6c5ed2653dd86aa43fb5c571a86de2ed67e965e75976855c6eb1147eaa87f69cf535711631db43b0a242a0b9c2fb243218954d3ef1d9111902d2684451382b9164b25912c8b6eebba12dfa913bc1da531c2cdc245fcea87e46a9c4e27909652a2a862b4f2f7f99af98be5b989057a09476099422a18faeb5fe32a7d41fa6caa4d418aa439c394560b26ae273294da1f2b2a8b5860634eae0a915a9397b564a8d2e512e642f2e65cc85e42f2c849640bba1215c8b25d6ea970d0651646e6f8ee3e5d512794a250dbc8e18a6137fc6a8be6f75dd6bbf7df5dc50fc87996a4055292504f8d476c5b3af0e2c6d67d60a0d4640e51a22a93de22a2da1dc7667ea8b1c9c61c8b883c2e893390af6bbed68cb842bea5d8976757a97a90bc4285e5cc85e44f0ae55d6ea9734f91fcb9b68b2d8771d891224e29ce6214d6ff0048a2994cad7ec4bce5b8fc879969e09d4b2866cb24ae41c581da9bfe6535ef194f27863c76fd4850f9324d2b66d769ea0396ab44a559ed272cb5ee1b489b21d192cb6c897a48445136289b445c6b9850964b8d7532694cb91d45b0f9f25aa24e2789540bd54f6fd0c8a6535f4ebe41f9a5b097935f97df67991781c87e1d5d3fc6d4dff32dc958c9af1f0c36f6143b8a6d5b238dbc4289b144d8ac14c9dc64dcac932f649e7b15ed04dd5850d432453bf4c85e1c714d927a570b17348e6aab9b77f93aa2449e4f1724c86dfe8d8a6937f4fd869f307e49362e697b0e2485527fcc87238645c5239aa2da143b9214cfa8e963c34ceeb25dd775e204968e092e474578c924b917fcb24389488cf0731345913c5d9d5714e28745a8384e3e4887e4775df6224e1290588c3f893228a6c5369bf30f90bcc3e42425f207e55728ed55a2c88aec57d51c7295d89543d531b428771f56d491e4a808e2d6448889775c8bffc4003e1100010105040706030702070000000000030001041113f0051020d1021423304041610621313351811250c1152432344391a107f12553607182b1e1ffda0008010301013f01ff0059416a67c126a3f27770eb0d4567d9bca2befafa9c6cbff3d1aca0140aceb16547ea9f1c0e56ec5883d9f6c9ea9eec591c97c2df9258d670213d6939834bc501ce5293d14108282e20450a787746b2ba27877680ff0022740ec272b185b0b981a822e57072fa29d51b8d92ee46b15d74fbd5b365eafe47c85d9cbee2cf6fa2760c875dcc9b9faced619ec9fac63b977f02c646ef8778ec19a76207e5d95e8b96ecc9e1df58027c73d5cfc7596e729043b041c91b2dd98b295a9b70eed8c8f04c562f915d37f69bb9e7e4beccd84ee36c07bfd0df9b4e52b467081d38db01d3613f7e6dab1efa23966d97c63ba76d838b035c9337cf3f87d9ab4cb2acbf7e31dff30cf6ff00b5a1e5b37f6c9a5021ecb58d848e3189c76a0be5546f9350b8d749a8e1b64ddf045f399c658bd9fb46dbef76637b909ccf67fdd4fe3e17094d0fa29b50536a178b3c2d46cd3f17efd3bf8e37fa3da0eae7605ac63c22d6772ed359cc8b5e59d5a989988574aa8de5c9145ac6c15a3d95339bbeb5e2cfe19c6f619fbfc16475fab13e765dc4fd9f7bb423ca3fc26f735aceadde1938893cc92d82f61e6ce37b1cf3b7d493f7694eef6736cee4d4dfcc36bd2f9350526a1b97110242b4dee4393db38d77783bb1e78159d6a7da5dcf2d678293b7e8821c0c91dde174901549a8a9350526a373105bf033d3d55bf69eb07900f7e3a3f0745659b638a6d42e9c859dc6c919fb524f76c9cfd3e41601704e5add43ff0014da862b537726a1824d4149a8a9351526a1bfb37f31eff541e48d70735258a4014a0faa3677bc16423f7e9ffcbe436779e9c5191b2ba7755af29d50bcd92b45fa6ec7e456779f704a8d92938ad137a71d26a386ce5a3f553aa2a7542e9350526a371b3bad3f3d9edf21ecd7639c6d506dded5b3d8a75b33c87c4c76d5f14e53aa37be1669f8fd07639f9277b2e56d8d5e0acc7b383c84f73de3cf8a285179266136773c26efa6d414aa8df3aa0a75454ea8a11ae9b50be7545042d3a0d9672a0d820427175e885a00f4b9c4b71e42365867542f3735a7cf8028549a82d50084e2b5407aa93505a9a9351bb569fc906cbf8505dfe1e5fc2065f4b8db24e8f7eb927b0feb814ea8a13f2f8fadd26a38dd7ce6a7db20ff008d8a0dd15de993fa29d51c526a0a4d46e0e58839232629d5041cd09d19e29db516314ed0f467ec8af66120da6bed40a9a0d24516c53a1a6ec3d93dba486de1cee9351526a17ceb845567163e35fbab66cb0176e0523a2935045739a8a152549e8a0c526a1748a822bbe2626235cc0c7fb20d9d9a35d3aa0846f5c4636011ae65db0e98276ae826d601dead1b2e7f908aee777c2c4cc3ada2e5717c2ba61747491b73a33f29d51b828a2c13aa0a75454ea8dd3aa2a75454e5394ea8e09d5153aa376872f6fa29d50460cf46b2d4887f645e5b8d5c0a48149a8a93505282a4a935041744f6f7e0cc01e57183b816774da820994eeaa75414f07aa296fd7139bdcd53baff0008254f6e61f1457730ae2a661dbf442c5e5071051b2c526a2a4d45072ddb9669e16872412cf4f0595dc8b92d8e0167b936589c51b3dcc9a85e1b839610f246413209a41abd118db741c9182a4a935045c9327f4dfbbae5ec8dcf70c4c46cd073bc26c01cae77464245c94ea829b50dd972c6ee988d9ef4d96e03926235c1f16267021fcc5744cdd3301b2c01cb00b3b8d95cc4ce04397d378c4cbcd9dec4cb839de6cee62670215fa3bc122e579b3c21cae1051b3de872c4c4c5fa3c09b2c01320e571b3bc397002df3133094380395c6cef0e5f4dfb1337cc4cc450a626209933004ca729d515af316b8b5c029cefe8a77553aa38c3c9337ec4cdc6879ffb7d371f1e920e9e97aaf8f4930ba6be3d240f3d95e89989899bb32d0e571b341cf74cc30ff7bbffc400481100000402030c060902040407000000000001030405110213f00610121420213031415161d12333407181c107152224323491a1b14344163550f125265262364254556492e1ffda0008010201013f01d199c819c811cc6169f0811cfb361693084c6109f629cb4385d9264318444c4ef576948e7918430bb2ac11a15bb42d49065aed6de1e467a0e80378a2e97c7f90ea288afbc347c4975db87afd0af0ce318c2f83a86196fc9239e830bb3c49f2fd40270e82cf175f5dfaeb4c2ce1709730d96141fd52e59cfea1bad5c817639e4e10239de3390c2ca57a55ea7b845fe76dc32aa6d2bc8f3bc8c4d7a3bc42de2eb8c2ec58430b458430852d9e20df542e7e2165b183d1b77d8b8691345c51e3fdaf61694ce430819caf19cb48ed5aa0b75e08165d4e437f775c345ab50b7779e8cce5d8e28efa7a9be8f3d1d1e9e418a2ba4b703fa6cd0e15e33976389f5e57d1e7a343979066f900abde9e5d8c8e797843084c4451fd6f0d3b74830a9556e3e7fdf4f8430b230b88c2e230b88c2e230b88c2e3911171d35469dbab55221412a87bdfa433976171d2baaed0d4e5370b75ed2dbb44672ec4b6a07f3076dda763d78fd62eee5a0c2ecaf36f8f904722bad215d695eaeb48575a62bad3c98773edb128a20c7e20abc2705982215e42a4555a62a6d3cbadb4823d47d3f04083146459f776dbb568bbc7cd11a19842d6a8f765edaafabcafd4da5915b690adb48555a610e5e42b7170de3d5ab62ddb6348fbe92c1176b7ac6dc023d45b86912e6161412f7e2b6e1435176c8ed008b14553af05aafd7da612e77abad3bf5b69642b5f5f6b588364ab572f005abb62dede60aa389ea15c2bad215d695e215cb84965c57055608ac2bad3c88637fd6d0d75a5d9644223d7786410cc2a6d2bd536985450d979146bc230eaae23576f8a64555a790af2bf476067b3fa0c4fa8bd47cef24a849640630d8630dc2d7c823b3fa0bbea083dda115851b7daf54da62a6d3c8a1b03147495d6976677d4905b90592a808ac115b2a188ff004378b74179646bc2ad056da42bed318c0afb4c572eb847979067fd029d3aba1587a88a7f41769e9b22b098955c2da4d911c8fc05c47a4f895d3f5f0832e22b8d7ebb364d4da42a4248a21146aaf34ea4fb8bb74cb7879118732e9d77a5dd3175de91107081c3e11c738a962e149c47fd53fb8b96560c4d48a1383a8b77015d6984795fa9b4af102be8ecd2a4f0577118e5ac7a178b5421c4439dd6ebbcb3f8737ebde107f77f02645bf85b787fe979eb85cdb42dae21c4c2d75d758bfef03c79117bf32f0fea2a752c8f888ca39b36b908046a2b095f6ca62e66ead18a66a7af306fc322a6d2153695f556410e997144f0cbd8d3a53fc8496187c4572e12703d63d37d82cf04d608cc2c957876f9687888dd1a6afef48b36f907d1062bfef3ee228e5af52899055a22a9d7a2619ec9db508a227d722202f2b4ea170b2215635a1bb8387fcb6b105bbf5d97cd7010bbad83c4ff0077231469d0a7f0191f7655d5274d485ba4a86b2ce52f0d42e53d24c21445a436227883e2f673edd8147ed534eb2819522de59c7f12a1bc7f15b10ce28d9edfc610b1849f2030dbeffb859cf11eb4d828c47cbcaf23cbcb211e43a0e212e9570aa21146f44ddc47a9642ec3d7e92135a7b3507745daf2ce7f50de1ecd7435e7efdb982d033de612833efd176144622dc22aaeaf40b108832364be3285b506311c702c5e6154454da6282f4e87c13210bbb48bc2f59ccb3710c3d27325be74b7067751077bd4bc2fa90c69affb7ea2b13ff517fec431a6dbcbea23f1a87273f7c23e02e953457895634cd9e652172b77311869942e2267896f3d6158d3571d405560c6e829b7e8441aea10fdc888dd321535281866fb78cee17e807bd247b47bc047afb700aac2a6d30b04795ea9b4ef92369854575a62bad3181c0c398521106b50b167908ac15685444d15cb34cff22a6a97ae43564994c228b742f660b221546fd0a74e86a397d47ad62497ef0f86731eb789ff00dc297d4f98f5ac4aa7e70fea30d4a7f19998a50ead59ad30f11aca621711c5d792de01b2d8c4843a173ce158598461cbe61411e82a36862d1742ddd7ea6d30b223af0934155698c245008be4150b3c4057a0127c41572858c52cf20de1da8fb85470bde92a155acbd6086c08ab7e83774e3e01ea28cffd19f7856e762a94965ca43f84b089a2985ff26178c8b36dfb86b734de92cd0d776727d3e1ed16c23cfc040ee318c45277436d13fb1089dcd54c57d5e8700fae4e2acff6930e1be0f796b15369e57e88de1646d6d96210d8a2ecb58b9abbf87e660e659c2b4da53431940ca5fd8337685bc07409c8164f502b8ec42bad20b255e12871a41568b8c4cc7ab97dff00708c3ba720c995eaeb4ef4751c761af1096c0e51c5dd9a1c7cc22b082b483a99e20f3c3806717b8d63d4ecff00e670deebe00bf418d1178108f3968e210ef01e14f6087ab42943e14ae399f5194ec63e16ad3ff022ff009f2173a756f62c8ef1164bfccacc1d0c34fc0270041f47de20b6d33fc88fdc34421bd3b529b1fb8a896cd4241245609237fd5c82e8f10f191a280a08acb5b56a9876d29b7f6d3100bb37cdd0c55733908345568939e85e4b84e429c49d66435d883159f669eacc11d97abb44dd11d40aeb4af9e7232de2ed19e251e3e21156fea18cd3de609cd3cd298f5ac452294f8ebdbbcf8f110cbab8ab2715e79f7f12cc29dd2faca2ecd73e130cdc1384eb9132d41256a6eb4c38f6db7b7b43cb9a6af628f114331ca659b6e6fa6fda229087509eb88e594e022160f9536ebf4221548d492e84c9ef88b9f62bb86acdeafaf68a08ae18f115288a9111ae411e83428f516dd95e9418d52ed1e82057c815fd42197511161be5de20d1a41ec7c9caf9b5790a5ed9160047fe25b7fb445214de2a854ac453ee2ce2e96e517857b653964adc824905910b32c625c0376e4dd01703ef103ee092b502b874fc022f170b3bd034ebf2fd22a35f0beebc8f3d0d05b0750b9abb759afbb3a3cdab386ce507374ad1ca07af71de8e37c618e79188a402aa668778a93a192ed108eb20af21e8b7e49d0599d78a897f6d1b1cbbae46be0ef3b81eb308f3d1c0229eab7cd1733b6610b8a211542b9132988bfc895b70d61f4031dcedbbc386ebb7ccb847216ebadc07e85b80f45bf24ec23c844b8688850d99715e961af51e07f814e8fbc1f79fe4102d0adcc23c8416e81782afb65e218c69ac7589549e7ddb42b0b188ae808cc1507a1f305d92e356bc9f45bfcade020b751a220596fd5f743f10e51f7a79de7f9d342dfb8852f5c89e6ef173574084690cfafee16ea02dc8538621145ea5611fb8fa1ecfc3408a8916e2cc459f9ebce1682c1d951f7d8811f0a39f9107cee1d51510f69e3b6f18f45ffcabebe578c2db74240b2abad30fbe03ee0fd1aa882be20c102d0adcc22b5e62fdd43d7af6c7e020d756844a1d25fe7a4127d39886fcd7888a43918a3534679e422ecdc431d1a2bea985795e585c034c4a0256d77d6e5a12cb5b9070b08a2b5af5e2fdfa64795ea0e317d421714d5310a77efc57a3305422bd76b11485af0a5ea56d5799b3c7622923c484211c5da248702beeedf6042a6d3cb4797965adcc3dea1d78f908a23a646f91c85cbc4eb57e9f879025b3044ffc405d2dcfa31a6fc439626d1d1b6fc8b9146b631e3c850d45e17883fe59353698a9be8f2cb79b6db844d6aa43bc4487ebdb85e2059457d6e7791e57dbb83a020174d5a550bfdc42dc63115bd77d0b4105b19407a3b63d3bb7028f9df79b6db8548a909331522a17155698a9b482c8e5adc83cdb6dc23fd12016da0f5e8c82dcf2a81e018b917d5b142cf6cd7aead8e3080b9485e24c7bf216153698a9b4860511574770c0a23028ee18147705ba9b70cb5b987bb45d2d3a5bf75e5b96811e5a384d3a4da205527839cbc842d4a4bb5e90e7abc844faf30c7e5423cb2bffc40055100001030104050707080605080b00000002000304120513223210142033522324304042435306414450546263011534606472737435828384a3e116258592d40711559394a4b4c421314551707595b2b3d3e5ffda0008010100063f02ff00c69f3fd5e0fab404b8fea973999159fc4358ad88a875698cbd5f86bfe8d3520633b5cdddd9ab8fea603f6b4c065a33baf8ee29b02c28df36d9ecfa5b9ff368265bf326daaef62257a9c341fd4f142854b30e8fc3e45350e15f4fb575cba088df78cfff009ca13b2df28c679ef02e2edef664eb0cd01421e07b3de782ad27e4bb43acdcc78ec48dc392155c07ddf2f7881f6440c0cef4f450dd1580636eb5ab4b7e2ded77576dfd4b767cba7c28edf88f237e5baf034c7fa8811d3502200331c392463c00a5c96e7ead3757e6ff000e42d4ded4e7da611e3ba0e367bc56859cf36cb3684591cdce426aaade07eca65dfc39daaaa5e987f364ab9846df7f2a46abcd35b470c5d8b5d9f6363e53793a4fd2e2ab409c1a00ed18ed1dda6a4cf238d679c8bd391e2331a32a5b1acf9c3a78ee355548bb72d33f4c909a8d024b166d9fe9123bf94ac72b245e7a3eb1740e51f4fd6652a690baec48ad6120afea4623b94d5971b1c28bcde3a3b2635c1db1681dd489ed9eede52d86e785b769da1a8b56544af77ed72a22b40a5c3ae459fac34a14f97262b2d4d8722ced5dce418d7944a98007421c7d61c8bddc8f4451c5c20300e7a7e0388bb6146a4146e358522613a13f5508eeddb7ddce92a24c6eb09061abddb6e6edef448a886595111999bbdfeb4a259d11dbe3e70ec873906188bacca52ddbd07b5ae56d1bce435a46fcb2623b46d5ec788df21788c2173988c4790ede3fb8b94d6a8c1c99060d6af23b88b23d2d59f265c9003a1eae3bfe94a3df6ab1bd9dbba424dbf59986b176e7d4639f371c83e4a1c4efdc795ad6df94331e20b32ca9d37578e7c84091e89672d7248d75fd1d00c0ade7757babf97ed12799cb94accb6e13bcac591ac6a9dc37ab29b0ae19f9c251c89121cdc5dc8fa62cccb3f345a0cbb2186dcf6940eb37df39eaef3568de6e1cf64d515a127b67e90e7b3a321a01d1e4903438001447ed0c16659a7f3b1de6fe7b2aa646e6b37b7668086864043588edb884a5c9003602f794e41846fcf995eb4775771cefef3f74f6540c3c2c468317d11b3e42528e54e30365a37dcdcc5fded4b7edbb475f30e573dfddc7511d85659bc01ddb8a3b1368b12cff0064f11e4eb0f084000c9787cbb8829fa8751645afb20fcc3b3e67cd3e4cb6e7d0dc9ca6c011393ad4c8f677c794f7a5ca570220f5a611e448b56447dc739fa245fece5ad559392052321c83e6f1ef13a4cc608c661746dbea44396edcc7947bc7370da02b4abaef6f41b6fbc54b74506ededdb7a2e846baff00868e1b2ed11d04c961acd390370c2c4c0460ec36da3bc6a2b3407376dc0be7dc4179455d8d5cefef1034e378eb66871beefecc8c4688d1d9e4aed5fc929407e1f7faba69f9606f1f2cefc7d63d135451e73cd60308ee837dfa8fa84f84cd0175aa47b391bae3a133fc3a06ad860d98ef05e8207e34960efb67cfebcb42e7e9b3f9947509fc91fc95b399de7fa72d557151d7164de9b7f6892ad561cade9b28399b9fbd20a504a1c0e81f26e27af1dbe907ce2f1c354cbaccd838ee823a4abee834ba5db7bfe1d011501c6e2a48a86802e811d2282a2aebcff113a4ce0a162230f89bf40312837433befaab1c99619dc7cf9041cdb0789e1ababac7d8e717eaa1b966bf0e428ed5ebf7a07f478fb88bf6a972d0ba55847fa3dfb91eff009ba0b3aa8b242506b012e2211fa81e4740ab568fae6b0bcb4b46a00a2d190a6c97bed1342ecf79ab291784a91d0d3ade761cbd53679607a5776dec53a70e8a4b27ff0022a45d00462459d5ee37abef1524668045ac6f1dd023606ce601d0e6eeb8fb9e908eec8cda307ab72eb77fba26aa7dfd5c392bb70d47b92d66cfedeb1c8209311d09205e1fafea1ccbc8ee08bcf415ab62110085ad3359fdde32844f96393673cec8bb0e5e2bd254811ed9ec53d17f3553c4c431f1259dc236afc280ddb8b8d00913f832388dabd7c11df2645b639c578e5a07597e820f0cd34d0da2541e46ebe41c4d3f55f355eaf25b737f7df65f5f00f1f24accb4592acecf99abcc40fb6559864bc59f1b01abf80c6af1918b94060bde9b0d1f88b10df7e22d6597e287e602fd1ddd675f78b7f4082c4e9bc8e91ceb2aca809b2a17cd36b5017f92d340c33322c91ec5dc8f5e3d3247d1e285e237498d4028d623fe5d4862ad65a091bc4625dc860574b94a01ddefe2754c2aa73035e22c2340786e2c39d5557ed1beee428e526cb7cdda23b51e5c0051e6467f59038f1eb73bfbdf6697ebb361e7c002505d29b6756f515c86a184be43554eb4db592667efd18b6808b202aa9642451bcad62cfd4e911accf22c45a6a15846e63c5b9d4db737fac7d915ab7340dfc38f20db0f6ef4af5dc861b7cd93b3cd426087598f1795071ce4267daece972d3a58c224ae48db70d1ddd7efb6a95f716ebab830ce074d793d631133266d0f3b31b8ead51923ab14ab46f425f71f9557a3eba76d1c9aec38eaa1a11d3faedaa886a3dd1de2c3901613a015597aa622a3f0f483ac950e864520992d66d07c2ea65a7203f46474365c66a88e017978e6f93365da932bf677242c438fd7367fb44a3e4d18b958507bb46e917ff7b8b0b144806ef6f1b5575ab8b35d0d5cb3b0fa063ca1b3b590f122a061e7e559b2d031127ebfc1e3eafeb98fe51c0af58f279193dbd3e54f452df6d0523d68da71d303ec5df78f2369e68eb0cedb8a9f267ca53876affa22d6e45f51ced4934598de773d726d380060617460e784a6b100abb3de90f6afd57174320862d7e50f93617a777bfb4ec3ff001567269d6c9e65d60f78defdb410279576c592d357ae7ae643a5928de290fcb2c0f9f33bbeba74d0060accb47b0122ea447f123ab4ca163b29ee7b0d1f1b3abbb77e24193cda5fae4db92fbd1ab4772f9847a3bceba0c3d59b4f9c7bd522ec8e809174bc8398592d4f2667423bc4d7ae6a22036816b2393647ac4775c1ac193bd305683ee0805cf2a6daff0026b92b95c9de38a3f05977d37d7068ea7e810c8dee187119719e0d8abacb578a5de315c8b4023fecd79010dec965d957a6bca19fc1677ae1d778013b72f99c4afaf072a0cfc47159f0dc2c6f5a3746a130c64f9a95b73def123c2f5c4bbcc9421b9c11002ea3ed523a3368c42b83a81e903784cdaf0db537ca378688f6606a50ff001bd2d598c60a2286bae37f02cb8aacab2f348a35d99f12749e732fd7121821ac0c31a3be1d5b822f86ce801141a0c44a80d19561e8bdf54ece7358738776b12321d8b118c8735bd7647e34956c3148521abc2fddd53eb9016468d6b9ec87f4068a8ba5c3a69d9a84a82f11054341823463a2cf61b6359680ef667e5d03af3a1459f672f2bbcaa7bd7416a68ab453a737533d891eda8d811ae45a1cc41b5ae5c6adf3bb9aeddfc1f45f5c3afbe5434c05e9a97fd1f622c784c29b64dbf0c0c2527485ab9033bd06f455a30ac22b10e8c446a9a966035574188a85bf585f035887641008e73567da8f43d5ad3951f1b88ecb65aae877528ee367bb6bfed3b454786c80035163b31da01f0a37ae2d331cef6af1d192bd404836f2aca1a2a6c73ef368e955555ec663d35680436b7955302359567f2b71dfb9216a6d8daf6547dd6b69a99613a131995e97797ef39eb991efcc67462550a01ea384ba1040a8141e4fbced70ad7fe1cef5cc7f7ed041a3120ea1fcb632ed342847b685589244a9b9b560bbeb9b4f8a173d405ee2c48292eb608c891970269ded81b2ea8eef1c78eefae2d0865e950de693ac76e2c87a3ffbd2a4903a44bf5379d68cb43aaccb262679b2103439186ae83d7368153fd596b9ebb0d61695d28fd42a1d9cdb069e2f7f4482569f94643939943f5d1d9d373ef633fe1a90c4f6a8e071bdc38bdf4d0f5990efb8871633553849a8d186bacd59964fa451aeccfcc49f5d9c07b048dec3908da72c9947f12385fb09a8d3587e348f0e405c3fb548e9aa317ecd62c0b09182e533e8a9b20054bc6ae87a1a788d5248c547f2aedd628699e56c688e7af80b8e1af97a6cbd14468503164d9cfc9e391b861b4168dbf45ab69ef4227a1b7ebfb267fb921aea74ec80a8968da964c5992e51bce838fab88cc3119af0e385c7d4090e8e7b3ddd636a9587b7a310ac427a31748d53c774ac781e059d1fea0c886fe36a505d1ab42ce733c691b3568a853a24280472275dce15a0bb54d09d1a95c3d80fb0e57bc585d586ba36ecc87d803d6247d438f6c37f8523a1a45fc0a967268ca8cb22a8b19f432fca37b3da7cde1fd438eaf5bc87d56159318739dec873c365478110688f15b8f1c1bfa8767ab873aa34c3235bafb9740daaa5fe9bb539599f0d9f65fa896535a292ea40283ca5b7d8feb03fd1d13c3fa8b0a37043ea6022a6f9473c7593b2ceea1f817df51a6b5e1eaed2331ea3c0019dc54c6caacce3b40de9bf51adbe0099d27f3d1fcf4d458015238005008f6d58903d96ce8ed7d4575f2c8c05eab41fab7d2243bb58b182c3d0e2d3e4f40a6bd6ad567ea114c9af8468fe238a91b4803f102e973693164fe01b0fe89ad32ed320e3a75de8b09742333b165437a6fd429b63e475e3ae1b9f1a3a312ce1c91b686344133907c289a7ad17a7c83cf8f908bf9552faa79436b71bb1e17d4191265bbabc700bd3715fc6ad98ec1f336d524fb302d0babdb47e27daa2231b3be50077d22539cbbee275888fac5d52cae39b7b34fd7e7326bb731c33b888214f0d6a3377aec5efee548b38ab8d67c27326809909da2402d7215775e91e3c091d179fa3891446b395223b40acf803921438f1bfd9a2f5acc0b09693c4a914045d4a941d0533ed88518fc3bc4572fc99e7e1c45cc2c18b47dacd052c59ecb48ecc721d1ad6773b84e9596eb0f19f2579bf61c6944b61be5a1185d1b9ecb23d9760e658e38f3c8b33befcd44ea9e4e33e1ccd75dfdcfadd352c482a2ceb323a4956e1201a955568aaa458966418962259966589d5995352cea9a96659b4889169006f199aa9ca19fc4354d46f1fc00bd477701dff003fbe69d684b563a2eb3a36a7d666790ebde6977528cfc93673b71d471168c25eb11e8073907ef973d8d735e78edf20a4462260ecf94ddd9b1b00426606191c6d73ba2cab40f25a71c39073ff003388a44693456cf791ddbf61cfca4bea53663d922d95d6e925492a84b22cda332154d4aa574449de0404258133c608091854b1167478f02c2eac2a9a909092a491e8a9021621b66eba4d65157f6bc8f95cfb2c5c2c2a223011c43c359760d82c123d1e4786f2910268dcc88ba026324a3cd911211cdbbc12ae98be476c421c7173a07e9ae8e56ed1bbe3f2adecd0f081abd88ed3f67715325a30ea10a9c9681ea46a23fc61b1996659966e9732c2aa2259b4e12584b453a30a02402e12a84ab13465db556703cea964ab40b1168a503b52011ce6809cce61a7368ab447a60bf0e11dd57694add208913171bc7bd716270056f4166f934612d37f1280b562e4f889d61e68d97583ba36dcd0151737346c6709418d4db2deee0f07414b82060aa885ab1aa9c62b0f11bd3e7e8ecc7c73c6b463c84250ad1a23bf0d99ad592f9f213d9928acef91d38d383d125efd1d48c44d1e258895424b3206aa418b6691257b5aaaa54912ccb092c25a309e9c45a29d07a0c4961586b5491683a4b4069a553d854bd918e5741acda02f0b02d56f42347dec896e6e62b2be4b4214c1b726d1bd95e6fdd161c819c117c84f1dc48f3b9ba8a9d16dd46d38eaa5e74d675ca2a84ab54b84a96df4768d974336c07ec189e8e34960e34860ee8db73404096547038a3dbd13e97142ea67c48fd1e26283f11855447efbe1b8a97983674f9f479f63cfa7c89b4e1118da167d9ed4198dfe59356cdd572e2c38f22ee048babcfb2eb48ecb9ad3119ea2eace975bff00ecb2e5a758784c0d83c6db9b19954829241784b3683684966ac95d1154b32a85da16fd6654a02254d5a017cbfe62c3a2adacbb5851d24af4952581d057ada315874840b2d833c78dcee1b65043b55f37e3f6e2b7c93d29efb44843e52f912e1c66a2fe90b315c4b2a2d0471b3d7ca823a7e910b247fb3fb2ff00672aa363b422f2b77e247d1536a9716f4d6f5542f9ae5b1a06adfb2424fc4efdb57b63bb5c27f236e6fdb550950608204d2aee33fc46548f9b704a7e3c8910ef0fd2237d2e2aa086830e48dbe8e9215b8a0fc46d73699feb016260cfee72eb134f07ea6c6113585a78d7230df40fdb055d1caea8daa5b0a017936fd54570d9adc6f71fbda90c3341c77cf588ce02bacfe51d96d7fea70518bcd5061ddb9d053b7855eb9a2ad148e3359b6c34823d18555d8db0c35a8f68f9424766d9879227a64a4102c786d40881bb6db0d12182e731df6ae8d4bb9ac018909a9e2ef3863bc473290adefe1a098cd60d19de9b69ab62cdfa15a1fc391d1542540185d1a31d70ce8c9788dd731baf72a6e74fff0052dd07f71628acff0071618717fb8b0b0cff007161100d26bc9ebbb9ac2ce66f357dff00daf5b51e7b25f429922b6fecf25479f18a890c284fcb20b36d3782ea1db4df7923d96d35a85a4d7c58f21bdc4afca6cd45d054b120a719aa9c7502a7454488b6e912d15548c8ba1061868de378f036defdc4d5b16e8849b4f7a111cdc40475150b092a89f00af25e201174cde0ff00884129b233ac31de1dfa38658fd9f453564522cb78b927f9587f0deea9e7e9ee873a684b2301741f13f36a69774612239a360bb09db2669732b43f873bd124a3f25bcac60248c53ba8f2bd323a37ecbfeb5b303c3fa62312e871690d26aa58b4e1e8f0e8a4b601a67199f24db682dbb61a03b6df0c0db9e811d1f2b41a32a80d7228ef1f330ec36e1dfb0daa889020747381dea69f1efb41aaba40127400cf236e216a6c9068cd03f2ca969c54eb942e6d241eea190d706969a1cf2af9d351e78e494141fe347587326ad8c936cbb98532efbc67d125208cf3b41872608dff00d1769fb5c45cfd8be84792d38fb9d8c2a92d27c1a05a6d19673d34ec655ba5974874189543a72afe92dacd56d45fd1d1dcf1bda91aa566da7982fc56b498ec9baf1000788e2a6febfc30585f33fd45c8b0f1abaa68055545404967b7ed09a127dd38aefcb7b4a893478197559efa8f27b600d39a1ae0af1a07633e6caa65b4d4c42245ab3a7ddc85876f274023f15035d85361b3cb3b5ebb1ff19134e0d06078db424e628f2435791f82aa65d30360ef415c3c54daad2bb20624477b3c490d5fb0e29168f9183448deb9617f844eb125a3664327746db8170fb7a70aa762a571186b33cee2a8b6f22cab2aaae965d9cba72acab22ca9a688286b7a6e786ca18d1b918ec85d0231aba08eef62bc7b5cb3f5bde031cbbe8c613411fe21f2caa9af9c8d88ea3bfc71e3ff00bb2b12d6edd0cd6acc98a13fdb008ea431c0121ad0d7df6506989c601748da9657281d6480daf11be941060ace8dda75f2c7125676d05a902907657d22ef44886d9005bd6105ec3bcf4eb315eb24f439b08d5fee6d06705a313fe6a22aaac7d871031e525766dbdba6ad987de7b2eb7ed2aa7b9cd98792d389a7b15aa47a965d197a03a739a31aba1251cbdcd07a2ea34c286059cdb055b93e51adfca5f4d79627e52aa149afe1c854b9025268ae255607c0acf76230fc9a2f9a3bb417cc1b4ec2f11477739c552d8f02f95a0c7be9d6b80ee935f889a2d34fda1e47855ec47e8f87dc20624f3695fc073a883ecbb7247c9237de1a246ea428f6a44cece76fc48fecca390bbccad00ae3b88d7ccb6fb5ac5967c97c9f2b9f223b47c9e2663487f9506ebe67291c69b18e3480f10152daa8b3a31edede2ea5e6465c08f1746eb5db03d01d1d2e0d6079db4ec0168023bfd86d3b1a3d7abbfbdbc5209974cc1d522644a24df3b21dd5d034f306041ddb8834c81e0989dd20c3857c08ca33b5d0741f506a4f1863d07e4fbc58269ded9ce787391d8f2eb09acee9cf113a2581dec389df272d2afec68e35a43f0a3cb6f7d154880f156714f78b323a7199f43f255ff716de1d3956168d6530590f62947d198f187520be681ea38d5c33456192f11b4f346cbbc0e68b43f308f4b54a9ae4474d92ad0313688d23c4ee1ce9dd63f6a1a05d12a083238da896f33405a70b9bdb2df88f7b57f68a028dc8c8673a061ee46d9b3f958723c4fb2a91765401a375b2feb360377ed4d7f8a54967dbae9d18961dac43a295874729a3b1a2a1a11ba5d946225d2477780f48751ba96c03c8ddb2cb590f67737ead21704c0c0f2388e9d2d2ab8a1b3a0189b5c989e277eda07e33a2f347de37d2812c390f95d00fb98ecf95cdad56fe02a85d038e617b1e4788ca8f31b2a1d04049a75b2eda3b46cde46d5f4888dee2723e496e0d6e17d18d6260d6160d19130b109e8c86b2acbb1d8dac3a3b6b2a31711969f3f44d3bc41a0feff5437dbade0d204a2171c3d37b18befb6e6e1c40e3780fb6cf4befb1a7fa396b678bfa39cf82a434d956d231e034e97072a9a26cb3aa648b012fc4f116110590165059434650595655bae972acab2a7586fa6a781cd07d54df8144697fc0711b0f85cbc1dda056617d9f60eeca83040d49c123a4a5cc87c92368bb1c968c2541822222acd3df8aa5fe5d00897df40fb255876db715d3858fc4587ab487f8013a5d0f9f66435fb5eb14c91c7d896defd5c3d93b123c465593f7246c3ba005e2adaf115425587460ef186c481f7d4afb9a332021756acf7d2c3a879b63cfa3df7b4f9fa4a78c3ace200356790899806b1b12c486bc1a78e3aa9b2afa797f97d88f29b2c86a3c96ddc0f857a7f974bfcf663c6e9e3f5a369e0079a3cedb88a4c413385fc78ba4f21d71d19e8aa940eb2aa6f01f6d8e88c7625fdcd8057025f45734652d2034ac41d3cb1ab274f1cbdf6740759a491cfb346b6b7a713630e05ffbf403acbb43a0a92a1991d0816c4bfc3d9b8ec4a0ea865c00a6bbc6ec8ea0283ad9ccb3c6891db8fe2231730187247b1c7a3dfec3885896541f61fe80f6246cd98ef6358dac3a2ae9273bc11de45d41afb89aeb86fb386d0f13da91b0f01b4e86930f87b0d40925448a2f63b9e22f9065be4cb017c11d86f73a79692c33faeaeace8d2a73a8ca6b60c91e46db34d12a74c8d98e5c06ca68b8c2f7a979d4d47d39a8e5ee26baef04b0c8fa36258d061a71698ee8963055206197669fea2e772e54703f11d42ecd7ce712a1968190f86d69ab8f49ed595278e1b3b5fcfa0cbb1490a16b8cfa8b5f7135d7aea48d061924786b5692147039e22054e8c38107dfd0165cd77e14391ff2bb263ee268b480f19ed471edc590f47ea70a37510141f7fafdc49fd473bf6d030f0e13bea1eee5c58562d1fafa6e24973b63239e26cc81e03d2d35c0ded5ab677bf1e4741e75e7daf3af3e8f3a90d7007503404a38f072bea0a5c680d1d593b1768c747ebe9a873a1872f04b30c1f6ad87478dad049e776a9ec4d8d75d48c8bb017aad37f8e448ea14e8a8bd42624aaec76341ec4775b23020c977dda0872f04d06bfd6698e5a1d776ecc7f824752b424f810e43aa417bef75068500fa8cc4971b49dd86903ed950e864358b04863e90de868f80d0128e3c5236da2e034d171b7a29259966e96d3f7f92ea357a96921ac11f6da3d88e5efe80951b3826a6c6fdab7e1be8f44763802f7a08ff007152d9e8cabe522e93cca2c6edbcea3ea067ea6369cc626b8daee9cd18aba147fbfa423385cde69dd7ed948fb9a2597411ff00091e7594e85563ad612daf3edc785c11fa81faa0da706b05c61d8734471f7f4c71f7d054559ee8d487f801545dbe82c77cb3bf0e3bba327479b62d0f70eeba800ec7c9ea5a5c462a269651b05dfab8f19ce86c41e0b399d9a4476f1202e3d321d2ec36fbaa5bbc723a808faab12843a41472c941abb1c8c74002acf6b821b3b38b454d92c441a41660034623418786e69b41d22eeee9197aeeeb2480c8e275879a364d83d1fb391a0cba0841c731969341ee6cff00ffc4002c1000010303030401040301010100000000f00011a1102030314081015060c161215171d14191b1e170f1ffda0008010100013f21407eedab381f301fbe89f1803ad04ffe76000a7fbecadf9edd044e020889f380008012ae12b2815c50208c819a4598aa460081c0c4525105046969023bd10545401400054ac72752612c33fef939000034c805028128482c552561a20447324a150014820042c08a9abc418b90024a8008561683463c2a0840b2c40809110a408090b21129500643907452048043346001fc720424df42423094880178c895590202042c80b000208054f80a24807802100b9152602901268a0509005e50582a040fe082088388102a050a8000401806141411080904008da0040c223848810cd02d426a60020600440003120308808498500803af8287f2e2010209cb081020212204803edb52000081451020d08005010809024a3040801100424201c000fe028618410f6c04269f8f0080d011000240200020005140812829290204c220889268c582c32a008003da9eb4d1de8002040804102201203641a4a12a4460c4ee0043872b08a30092f65ed4008da822007101024020010210e237144f6313b711808cc00e04290c025f6ac08ae8c2081bc2e20a02020082024b54531384184c80981040014845a445a22d137102001ac0840202ead786e40fdd02e10e041020245400008b806c200b00032024501047817ffc01004809000044a03a03a03d00d709b027c180148444a9a10640280390910a2280006b40074c200406ae071403df0377c08603095c1013e07cc5202440800000065c283d01b66000808502109491c5407407ef3e160b4bce807422d0040c9bb000000044a032037680922944208249a01ea07407407407407407407407407407407407c6010a184d8000f5d14f2a01ee003d72f0d00020162a05588106882b100007a7b53953964200007bc0b081421c58847811000400388a01acd080c80e80d800404780802161c14420c4848890c4ad1800b03da3450115381c5c1f677d228b14ac201e9a62810b1900303203203211708b0426a00f640128477b1001c51c369e9a6c40a28a801000400403a3c300010020200287018cd3de01418d3845c2200080075db000000000050800000088f0410e189920108c022300134842d65c2932808426a001fae20000421204a08ef64f144849ddf640000000000000136801a108f110000540814626202ad917805050a102139020005ed96004020c4101f66e04200dac1219dfc1082bbc04b040040110445e810020d7ba90000288a02009e422600040607efc848008440000e98800001f0d0e5434df8004a4a11d9f81c6c800043ed9008440606b088a800f47c55403d2f6f05040219084833001103da1a2e811700f60347781020000208827187209286041bd96aa34644000f8a8268276d040222f2101119846fba69b704b90210000800001284ede20010208623b8000c0c888201f1780000f5272407a0075aa804d400d582109df0910008291dc0377a21110c215c1008000810006124010018f6a357723c400512006406406a01bb488c022e1002310800007039406ec60101622125207407407407407ec228352d160026822f022109b0704f8410021216820021a36701802080000003abc20082404a86bb46c8820142214254a00172c2140347818e7f6b41a0119800522e28080000026a23b4000981d01d01d01d01ea07dafb5a00c026e0108075c9317c56a289bc4c54c00613b803a03a03a03f7048600032fc8b85e022509f0a4302053020801f6407a40e846200001284de100f513e081b003daa07ac4211400fe301000f8a04000010311400c80d411e25020432826000403203d00358001bc34000880c81443902101d7a59101eb8a7a7d1c172ed408680139846ca0e02011a301ea1a9000d700e184800d6abfecedeea23679c721023a06741b0804a11504a03f8ec20008449b28306024c690448a113e6efaa80338020b13948c2eb18498810485600c8044ae0716e137404d44ef820243481007c5684208034d8000fd6f4400db8080002000703301425200e42000256aa074580669342116207c8587d89f0a216082000004002002060806800810081004100024840808d00815800a121e04c200058172121320000200a508802006bc0f403ad9008de03800113d844000080030802000a88104040804840812000097085d333e4003aac044514801f0818b65b2b1140502023fcb8080420001af89a88427bb000e150200020003000100050200010008042004042080200000080049406043fa80957085ef5ea7f7fc6501224a01316460a0004461af4b11ca81009872a901ae89b8279a021440a890ff00eee42005002800828008200040516084a04867e1dc06200008420010108044015010800404137da9ff00ff001d5df6f9e9d7a278ec47424404120a0832c15036820550a0208a0b0822a72c208110461f7450376281579940214a8085608c1800000180a0020000100814a0840b02800441223b308880102420200015a00002264401920a005882210810440ab50800b020984894400123005480404236200020141220838630400616001004500b0c802098008efc0009141000204d0880000401a04204000221100228452138102204a858005081851551081488824203a1160006ac26c81d101d13de5529525003460009100094140070a90408846ec42008000021022211c0100008fb960000046700001140c488500020844400461a0a40f8c2008604d0454460004a1183810b81c50f6b9810583562d16a42a85a7cb74de1120000001000000020004941d5d880828411060058b0004030b1241000081003f4b820114a8f08044826e81b440d6837b2840022021074005345186060352000000482022022000200408887fdc4000a001003ae1061000000233aa000040224a43810290f8224d5d790a839a729904011400001add4eeec2026003e7128603788c2c77044826c111029204010a420510004116210820020008010145c2840022f04604d011b0ce0082c0d90028350ce41408045a02208040136a07b401909c82084142098852c15a5149583082016d551d8410000001143e5a0e073b6080004100301c040401a108422e0244d8030cebb9d10810782a188cb2088d020081c044208b82210804a06b4e07378084236209580ae2585641701b334a40a95c12906027ed6c003d73ad481fadc11c622f00003ada00004d7a908c600a03d44660a128095c11210a00532011121084d48c100e06406406b04dc23640ac022a044400881022602110140040f400cbaceea000402020000004400004d04580210847612420c442128023e0498304d44211503a2338004b25200095850a026ae2000406b6e01c4400000920681004044000114d541178892139c45c1a10031418809cc206260912012842d5608404ee15a1080a818002520621284668a882400800120075401a602001004004203a5356144c4ed340fb536042224312b304d282101b6244812288800800040104ca18a209ca4041be203000f860109d97039d815848800a1400026808b45000035420083fd9768041885403a8b0007ea87eb6100e80eb9203de01901aa0a135211675500f80003fdd04d04f6090a0ba8c20040402568c400804dfc203e40140d9008001f8af803aa03a035003a203d4402101d2dd551140354088b011d9400600011010281084d8001f2bdf28402c918c00081ee70407c800050088a6ab845f00046213b801040a864248212a4e8a09b81046c9101204248000006407c6700401080d789a88422f020046511b3000089004248000d0bd6f0022a089f280f41188198000001ed0007c414811181aa9aad136085ed5905f8b04211bf82144848010d21283fa422e0042d56b09ce198000a0020089c8000088011708b0f6b014b81ced207dc93d2320220102b05864b24e826128422c011804401004d5d2c007dc000db8001108426dd5511511d9c01241545402089b00045621a87cdd4e8080104afe36809c40e820400fca3a2e5880000013a508c9a109dd05446c08052c5040008240feae9202508b8081aef005003f390e30800e6aa09c6001f2b5e560a06ce27684a5a43c40842c044500042d15d570d60035b0a03d04a136501f1422006b04211b10290009b44ee20600420e5070fef4e8a90ff005d827b5c0001950750e4b92e56000cb9ae7600106803e2826e11510842d1684209df7c45c02041c0e2d04c8a812445a2003fa2d1403d04d83d02075b80203d8df32035c00d0684e011510bda869ec604f035a124101d3ad0a061d42f65a0804c268257b213700820480742a800c80d9bf0608c4e1e85fb6f031c46c0400003d57894040629157e8845a26d22117e8e801e801901f000a0074b830201ea26ee8426c0435d488dc7c4a13b109414040216a03fce827e884d44de0010000e987c070000f84111103504d44504a1084da1104a11b288bc4544e4090120044dc900205009426c035d0e2000074ce118000826a26826f0353ecb45a00826e9139446e0c287138ac224d5412b457dae04801bba08008040000900bf6423b1822489c810426c02118d484a135d084d850d7960c60241ef80050200081800d5b330020d5708b045c26c138413b00840608993521284e3024028bfffda000c030100020003000000100000000000000000000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000001800000000000000000000000000002c81412840800000000000000000000000800000000000000000000000000000001cf206ba57c690b0000000000001000000000000000000000000000000000000000cdb3501d3258e378b0000000000000000000000000000800000000000000000000363dcd3b01a70041f3e20800000000000000000000000000000000000000000000032a1a38800c00502d68739202000000000000000000000000280000000000000001223dc23000000109a0c3822f00000000000000000000000000000000000000000001a02c800800010000810812089000000000000000000000000430c20000430c3000146480000421c20420800044a34e0001000000000000000000000000000000000000b6024008700004438c08100da9000c00000000000000000000000002082082080000000010000800c08c1480827b7c00000000000000000000000000000000000000000d607cd1800000488c0247089c70000000000000000000000000000000000000000152c4b1434020902450c01020e1800000000000000000000000000000000000000004c0f24331c3094434487db203f200000000000000000000000000000000000000000e464e889f5859d9aa2b3493d4a000000000000000000000000000000000000000004e82691b58a0457d1dc3091014000000000000000000000000000002000000000000c6e6410030a224200002116852c000000000000000000a0000000000000000200001322c8484a142d4108580e50b02000000000000000008000000000000000000000001d84d00dd301d284358499740000000000000010c1000000000000000000000000000316910788392206b9c285108000000000000000000000000000000000000000000002de10621a8c69234002000000000000000008104108008000000000000000000000010312e321c850810210880000000000000030020820020000000000000000000000009285002002801066401000000000000000400410410000000000000000000000001edb4844c510804d80000000000001000000000000000082000000000001000000015c22608f9840c811000000000000040000000000000000000000000000000003782a8a0082a460e3010400000000000000000000092010000000001480000000c11fefac5490052520805eb000000000000000000f2f40ab3470490b1c0d5e9c5603ae9a6c94a4010114820310c004000000000004400d60f5aacc277c5ab13f07e88e455a5859bd2708000100450d775d160408dd4ee71b0beff005aac635760e1b64e9d31ce6bac25a01062aada631d4629d8033245885a6dcd22e24b0565d2860a5fc4d172c00810d1843c48943042274aac767152896ad19e6331c871431d57eb86afa34454220060821d282c1305573198a22e2861c01c715bc788959c8140269e53b199842557116480a9a52a5826c4020b50092aa469e44aab78d2eb41a4c306148a828280018208a0000000024b223121b080000000083d4a2d935730206c300a18c28910000000008fa20000820000b28226828c0000005061895e06c1071620000080041ac00000000d405400000000000510be0060430008021c33beabaa3082040440c708b0c00000000f1c000000000000004200b1a204b0206140092e027dc5c214400e0058600000000015508200000000000104048ef2492320002850a49386cd20428620f0668880002800eb200000000000000010c202c1ac96d28ac1a8901c320ca08534f1e08a000000000032082080000000000002000036b000090bccb4000e22004004b0438a88000020006dc000000000000000000000000b4c0ea002018804360b81c2b04320b0020002011068a0000000000000000010400000f42b252e1c400206bc1b0a062530ca080002193702200020800000000830410000000260433c708002f01c15d51862d564000000a55a8e08000000000000008204100000040f09d2c0000929f5ff0040f22721000000f0187e70000080000000106100000000000208286300001c840fffc4002b110001020404060301010101000000000001112100315191416171f01081a1b1d1f130c1e120405060ffda0008010301013f10ff00d9023204e0c375845092409c8cb2584343bf62f08686d001320ba3c284c7fc718431500570a6b96b080318c81699149e32849411012a02286df258c51a228b92d8fe2c200020a101b11271d7ac3910a5c842e0a2bb70b082ca20098042b361040921090bb9c16799964120c1939e032fc6b919212591f1ff000c0522730b941ae3a150d32871ccb0e6044b4a730bf598a610096465a266f957ec2119817294c390e900004409a0de02270ab1ece1347e430113267390170966a40d00002060da600735bc0c842f839ace70220b126882986481c61583b084852acb42e8130e70844c7fc1195c31066992a52aae86f19ec48ca582510725ce0004808369e05a241d0ec912f2e130266014f4fd44e31410999db0c53f3a650e001dcaa622a43d29d440908c0770aa74de30241678ff00bc0520548eb05204391d8e4c71e73090843120754f23f7e105355c65396590808c17273a4ee2f0323cf231202306c7dc1c20e0925925cb5ed2ff000b8744e1aba7efc6263170d585600a01182862144914900cd7ec0002491b7bc070130834c3f210898f8412a1ccc771e05a08a073238ebe05a2708a2ae800be017f043ca145c659eb296bf2a13204ff00800703302000a8aa0263347c697e801816c548187e52118a255ca026cfb78f8d196274c757938ed095022aa818a4f5020320cbb7c4e1d13fc530d4778512c5866f27e7cc4283a182d80a2b388123cc882608d88745d3045a9d134897fb30c3991a32ebe32f9c580132540aa732eed32e906b80249c62c4be5910ca8c9fed1c94ab688e954ceb5f981420d0ac1a8211051426024a830c1df36cccc82b964c736e5fec052054f72df90813880a5981258335709448341dbe6300dd3bca2158239295140ec272e4bfece59744908320b0ce9fc21a1dfb17e286877ec5fe05a09ac8a7625f90e1e44b1c6ba5a7fec986a3bc195d5c001cc9001d7255c384e04a40a110408897e5e040720560484647648000de9e05a0282b2e607d084343bf62f1a2086877ec5e10d0db7517e2b04c55c23e0e966e5410e20c4744c7fd8189400a589000472532ecd07caa026a1004b9ac8f53c30ae7f49f919aebe75d965e7b7e8bc0590e663b3c8bc0700d40851517dd45e0c1990712f2af2e90829bd81685151bf62f0828369e05841010b091edf82d131d4c180164002ef285d470c00210b27123c926d05caebd7fd602902a5201b1100c80ae02013332a8261e0e4272804c4820902dd052261a8ef120d0768414dec0b420a0da78161082837e85b829a9dfa16832ca4e38e89f5d382f3dbf05b8cf0288091a2e39a72c66a61fc41ea06c640d1c5de25fec6c4514010a8a712b3b863066b82409c5040027e25a8809800680a7c930d4fdc2ef92a93a263a2bc2bcea152e540044ce32327a18210919ff00ad15aad080114752a401823fe2571854050211590a0774a3e6d04a4a906e7810d3a69e45c46fb08df61c10d0efd8bff41c8d443aa8058859ab6659e5d20430a284a12100a3891f2b04a926affec1d21043ab8264ecfaf9810a210002942a819cf2f5082643b90e08b3968d15792f9edc8a420a0dfa16851517dd45e0228592be91aa35e10506fd0b454b815c59baa92938d104e5b0cb31711a3801486571de00224a0005c9200e550b541cc2a4ca8870aa155fa9995711affb41128251428be553a6090422a492c1dc8932ed1ab024341c14d4df7416e017006da7917814aec3c8bf0550dff7317832ca4eacd3bb74851517dd45e31414a215cdfbcf9a6103102b306a0600835d52aaa49254ceb8fc486877ec5e10d0efd8bc21a1dfb17ff1ba998084a51fb4f4ca03806bc41603ae99e62f0240941d15d18d1e1396df82d0a2a37ec5e10537b02d0a2a369e45c429aef605a1ce704a4ba96ccabfc7bec210506fd0b420a0dfa16841416dd05a37d8468868865dadf3b011992d112e83d840d0570d53eba7000d27c49957974853009a8cb0b74808850f8ed63da5376d773c967385353b4f02c380c4c9c229231f784aa60890924aa9f300fc6868769e45c704343bf62f086877ec5e10d0efd8bc21a1dfb17ff089c0517ec7d411c4d266a9581a0acb9a7d27280ca81e201a11b4f22f0aaada6790b4090683601e91ab83482014929aa8f066d58cc2cda698b20ca6ff00220a0b6e82dc10506fd0b420a0dfa1684141bf42d08282dba0b7c6869bd917fea94970d427480c450258432146017baa9e5d08c0c02ab2f9798554dbf3216fe89222a5102ce92e6a0f389b99d7e043436dd45ffc88282dba0b468fe1393c0105c23e3a08690727d404ede635706fb08d10d2138268e7f49c2472b9be14141bf42dfe7009203aa8c0b2e290b1409008066e02d4845d5a65141c60c9810710da19644f2802000143284ca88ab3e63f85151bf62fc143044cff007310b13dafc09404d02c33bb12fa274a9a994fe75151bf62fc14546fd8bff6a2a37ec5e14577b22ffc80700790304838050644621f539cfb09892502023240010d5c8681e8d508320598656c1d9571244a55c92aa55893298024030942499497932755e4718690a13f7120d07685151bf62f00b87c47d7816804207c07d791784141bf42d09c367fa4e04c50e02263a9eff2a1a6f645e179edfa2f0bceede02d0e3230a6a77e85a35437d8c6fb189dd7acc93c9398c0c28a8beea2f0bcf6fd1785353bf42d009044f0296f03a40601340076561d4038605dfbbfb84d064df547756534a40401330f350a26855f4e748126a494b2d420c28c2050c0a06002324c84180bb52090e2603a14ed5974844a128e016cd8aa6984020804a4b24c3f3a46927da6d7258c5c0a6a77e85b829aedbc0b4331e21242012c24f0284511c35b828a8dfb17f814545f7517e282837e85a132e9a7e74ca00277a7917858020601ac8f609d203c2d769404c105d179c09ce0cba3175b6c983acceb9d85a03c25769402201790facb21684d06da642d0941bda4023084f91796197d08520a124a310511a81678634a8c424a8f3609d487d7190649a3e9cba4573a41133328a422e5244e94b011840649c99f39150e149834e28ca14a54920ee500c255953104cf28310429901339091e4534d20912a7a2bca1ce661543b7e8bff0a2a2fba8bf115582869869f8e90712e02a500557067a489c60928421011c1ae687089b1da57974864606d522742daa27ce14367bfbe08686dba8bc21a1b18009de9e45e1698cb1d1969d328550edfa2f08686dba8bc6eb420a6f605a10506fd0b431a1e1a46eb44c353dcc48341da354015022d1033a4c4b60a151b425db138c000a6402284421300035d915960043643324c720f9083ec01149b32e08a9f499e19030042698f216632855a6ad2397eec39d7a4ca17289d4ede0492089ab17c33a24c3a49212ac8011c582802ba62e88064250105c16209adb7a040005121f5e45c428af5d3c8b8820ce361e45c42038036cbf3a46886fb084343630f9f5cbf3a650aa1b9f30868769e45c426ac87789e4da118181b1e15d5f5603c8272940a411958238425862b2a22c141428e74e590e91bec21a10c94629cbefac1c0002b00a99223dbba40250c6fa791710253931d304d1b480000206c842555073d19642001245c253978108a6dcb21681a8401149414326cdba65fca1a1dfb178986a2241a0ed0230159734fa480e40ac2a0062999d304cc4040064c0ba02657e79184060c8b2c97f3a40342369e45e356dce00411884cd0e47a7278575cd780343685353780482a20851c949295a3aaf2ef0a6a6fba0b429a9dfa1685353bf42d1fb7d29274096c204c6a3bc48341da10505870905058420a0dfa16e018208722851485c4eb3e4d0200c81db10b34c4f5ce0000800501384909bc83316a21e0a0a2806792db79eb0829bd8168414e9a2761d210505b74168986a3bc48341db8a1a1b6ea2f1c8db7517806a8a668da8cf317106a17236d1604c6a3bc2512c3b7e204c6a3bc02103e03ebc8bc28a8dfb178085002281c69f620c248acc17213131e6280a009c95f4c3a413353e99e9d214d4efd0b4388cd446385978c05d6ac7f8d50df6306b0aa40c532d8d758dd5a37d8c6fb18123f44eb86b0181fa2f5c602c87990e3f50084049127e9e47051517dd45e37d8c6fb18049214ab8fa868a419282010005908045801da694674eac4c34b404add7f3934289c48e4972812a002b9909a3788121a0fe50506fd0b420a0b6e82d18e7b0f3f5ca034c49089ae8bd232082ccf6b406d0bb26ad9261da8eaaf4d32c85842f7f8c85a08082a58833a115d010a331482238640b6829a619ac4c0cd0c20a0dfa16e0d2a6733d44042062c3b08fc3f001a95e4711f061e05e7b7e8bc54e4a3ebb7278dc9a67a74ca3540111ca531c5bc0b453e5d31164bf00c41a404a3c93a66bf508d0d1d6e70eadd8c33653ed39c04b1442ce2a50b76e41612800aa15032962a0e0e434a419e0f840a26022a0ad648a9ca35d984a84a9973890683b71515dec8e025c0d6e7185739f24fa4fe946799e8c35a662b289e78feff2e4c669f518bfa68868867d4bcb820a0dfa16e0a6a6e7780d8feda912728711de0d01d07d12f0cc4c840e8e83492ecc0d4485a4ca17b19023a41a926a48a2c89cba406059a3ce70a2a2fba8bf15b2aeae5fce9fc62fe9e1f50269b2f917f844a46bb24060053860e7d11382714d5cbf99f51ee2241a1ec6087dd8aae82c98429d08c92ecab052c7054b950e939e83167cd18ea5e51208ca4744436ee90aa9b7e642d1bec204e03226f489381ab2eff7fce9f14e35fb8d9ca1a5151dcfc130d477890683b409c0720d7e93a460e07196d7f6084e7ad949e412d84020ef4f22fc775a157158986bf704a03ab1bbc4e166f39e093e5d21b2d846a8059016700e01aff1a7f4b74fed38d6241a0ed0269b2f917f844c6a3bc00080a01618642108c356d3f3a421a1b6ea2f18b8012a1f11dc7816804207c07d7917fe4966573728986a3bc48343d8f05b8aaa673c2241a0ed08686dba8bff008058cca349f2448341da10198f8661a8ef024341082837e85a10537b02d005db6f6211304e0a6a77e85a0c6246ae5c4261d230f062e0986a2241a0ed082837e85be2d3fc5261a8ef120d076e08b82c0d0720d47816e24543998fa89039562ab1b7df78c1b61c775f84c351de241a0edf169fde0e7d51237bfc98573fa4fc8cba13a70406620683906a3c0b421131c54546fd8bc6eb709dd7acc11cd790c046ebf10686df16eb7f4e2351120d042c98cfafc9a7f080cc40152c5723ee5d38a9a9dfa168437f6ba04e63031bad0a2a2fba8bc6ebf1dd6e1a428a8dfb17fef4feb0ae73e49f49f34c351de241a0edfc20a0b41988c13e91ede38e91bad0a6a77e85a375f889a1e4db11784343bf62f1a43e7d72fce99421a1dfb17e2a2a37ec5fe0986a3bc2905506abf2a1a1b6ea2f130d477890683b7f280cc41988c13e91ede201086651f5e45e241a0ed0f0d42df124e81398c0c48341dbf8065937d726e41611417fdc85a37d8c058491b11967a74ca0094048ce5967a6146940659f56eb0c35c779ecb6e4d3f3a6500540cc372679c090d07f42e046258f2890683b7ca9974d3f3a65c261a8890683b7f280cc420a0dfa168d2108a2e8afaaaf38121a0fe54546fd8bc28a8dfb178ce16dd05a15e83f7e05840583898c331e05a110712181a6b0160e2630cc7816822444a8663190683b7f530d4448341dbe3986a7b989349fb841416dd05a375e307c2131a8ef120d076fe535bbf321685353bf42d1ffc4002a110100010302050305010101000000000001110021314151617191a1f01081b130c1d1e1f1204050ffda0008010201013f10fa761699ab0b4cd5c5a22b93bfea8482fa1f6fc9d7d4641dc9fa7c9dff005571688ff9b93bfebea7277fd516969f7fd57277fd516969f7fd549b9e7f4eb526e79fd3ad49b9e7f4ebe8b02ec4fd56c4133f461c7b6e7e7ac6ff00f2710ea50e80cf299c98d3df8158085a08d0bf163b4daf61a8428969d7663bd28650e76f9a02c4198ce31c79508f9e6e7d4b8b447f865bbcdfed7277fd7fcaac2b919eff007a9378690b1adf2b0f2e1a56ea9408173ada62f04b199c54a094da6182f05f734064984269214a66eb54716b8103130419648020c044c4cc469aebceda21378f144c31dac5f962999170132469c6352fda830416e11d88d208a1b0b85cbe38f1ff00371688fa1c9dff005ff328653a9f7db5a0b2b3c1d2d30da7df994248622309a46c4e9e6b91101f8d1386f6f7f5f3e1a5616202cf2fd4fcdaed91566e973ce904862f18e37bfe7df7a424c49a93426ebadfefb9aa490c4daf1bfb44f3d68e73ff0014767b7e7fcf277fd55c5a23d2c2d335c9dff5fe9242754fb8e9a62ed5a631624c63ee3d61d9f3fa75f48767a79b9d6a6e7c74f4d14b8cb326f3a467b547930208e97d234fe5224e2d9dad8bddeba6d42824d0d7872f491c23ff0007277fd57277fd7d2e4eff00aae4effaa71cd6596e137d8b505e1eecf09f3de29d59bcda61b4daebcb6cf5f48363cfe1d3d20dbcf03a7adb48f23f5daa0d8f3f874a8363cfe1d299992e3ae89af0fc58b51d870225dcba72e7ed24b4384e6350d47e7f1f56c2d335c9dff5561699f4c7220d7dd2c1f9fa65d0de8cb8c32ec416c8cbb468de928566ecbbe5e9aed591ccf9ac0e47c1fec5999d719c70e0516036f40162d7631cbf5d29c0de1d39c779e1680d68e5d64e792569e2c1d31f4ac2d33e8a19439ffc2b87fb6bedfbf5d1e34fa4591daa6c191336948f3599a045d0d6e8d118cccdb83a579cf17385fe87277fd7a585a67fe3f7d6fb7e3d21d9f3fa75ad1f4c8117034585ee44eba041719e2e2d3a41a4443070d0c0f6a2e0ee1ff15c5a23fdf277fd57277fd52dc5bbfda89ce6230be0cc97d39cc6fe906c79fc3a7d5c6cbbe33b5e1d8bdf4ab1ce302b8840dc64b32270621c7d6e4eff00aae4effaff0012d9daa5b3b54b676a96ced52d9daa5b3b7f89cc8bc47678bae716b6ff00464dfcf13aff00a9d6194372efc68542a36831ce19cfdf8f31c273fa761699ff0081405741682c16261393af42769fa32dde9fae074ff1cbd0ca1137c679566e85de41970fa561699ff8b34796282588248db387ac9b9e7f4eb526e79fd3afd3165ad3b5b2d37440b986e04241634c36ddfa1c9dff005ff231ae38e3279f33411b21e0bcf97bd68f7ed1152196a78f7e5faedc2a5dfbf2fc1d0ae6a737a39a9c3e3ad79f0d49b9e7f4ebe9a5b1dbcc7a190b7324c4c468fb6996a497733c27cf8ffb16060a85d0954b4b7f70b697a056425a2399739df8dab47bf788a9de27c7f3b54b77a72e1cbb547878fd9d6b93d10ede789d6a1d9e9e6e75a8767c8fc9d4a8767cfe9d6ae6fe47ebb51883c3c4d79335094b4dcf9a806c0d45b04e7f96bf1d5e7d78e3f38e7ff637cc11594924598db46dc0cd3319502149c009974b709f6a304634f49de27c7f28993393edfaedc28c1c8ae1f1d2a0d8f3f874a8363a79b1d2a0dbcf03a572798fd76e15769e63f5da8c50d929601b5178c37186f18b65d38f2a8fc610dbdbc6f4320ee4fd5e5f5d08382d17880d634f8d2accca484f01863edac7bad794beff0076feb06c79fc3a7ac3b3e7f4ebeb1c3b72fd76e151c3b72fd76e1e9a69724ee9f351b62615989d17d2f199e18a8d8d10e91f54654da3bfd748109b4adee413898903a4d5beb89cc44759f3daac06907c1f82a4dcf3fa75a9373af9b9d6a1c3c73e275a7897dd4591da811a3ec76e3cbb7a4c5e83608d0ecfc1d288418f2df83a7ae971da3488b62784515da973ca1df4b71e334201880fdfbefc7fec2090336249c8962fe453e091c013128a4044fb1ed6a919127753e5a9eef8e7c0e952dfc7f0e942c97727c9f83a5581c8ab313688d71d389d69adf73a497d36f0a96cf5fdf13ad369ed1eda8ef68f777af09e975e4474d289e1cfcbde847ce5f93afa5bcf39546af4661e668ef8f03e8f37fca5320f3068418209696993d4c9ccf9ac0e47c57b3b70fd76e14629cfc4541111d7dbf052353ad332377a4bfaa944e70cf7cd4bbbe7f0e95a1d62d7b93a13b5e862b6598f79ef1936e141002d8c5b1fcffbc658dafe7b76a937f3c4ebe8180e4513c14bf1efc3f5dbd0192da9f27e4eb520dadebfbdf7af6bdb482236d37b75fa726e75f373afa49b9e7f4eb526e79fd3ad49b9d7cdcebe926e75f373affc048b17b5fa52a654e7edfaed4cb5f47dbf2549b9d7cdceb4fafbcfdd78411c9346a6e2fae26ef7d1c685eb91db870e3f1bd89023b9c38703a14842310fc2fc7a854816e7c953096cfc1f4e5ddf3f874f49777cfe1d2a5ddf3f874a9777cfe1d3d25ddf3f874ff823c861f7899adaf6f68c72a6509727da6d68889d9806f4d438a78e874a234ed5c9496de3fa75a8767a79b9d7d42a2ecc8c6d7a0494d9bb8c4113ca7dcfa9cdfed26e79fd3ad49b9e7f4ebf5a7ef5f9c9406489c3ad65635da261e17e3debf267eebc88e51a56efb4fe3e3d89a124b9935e27e4eb4441318266363f5daa0dbcf03a536cdb9fa6bbc154d24dfe63686b18b7fc72eef9fc3a54bbbe7f0e9f566358a0b2419b104cdb38e5e47a07cdcfe2d83cbd47ae230dad0c7e7ace9432c2da0ecfd76a1497f11c781d28c6fb7dbf5db851a871fb6f441d019dacdbce53a5170e72e74d3e6dff00806f04872c102527894a24b484aa82dadd36be740a346dd12201b5e609c4f1a8b6b8217b2c45b8103edab4469a7ac1b1e7f0e95e7c152dde9fae074a6e7360e0f1efd78a501b7b7282c31887d2335b071c4b2cf1188375648ffb0be2fcaff148641add0b6f43b080cc3a6489e29f38a521b81194887aedbe5bd40ea84a6e1627f1ee5ea15502a41980b6879ced7d24284c4c13666dc7976e15e5d3d7cf83d32399f342c5af0758f432733e6b1e47edf57f77efb45f81bd47674fdf13ad054275fc7dd4220c970d797e7d24dcf3fa75a9373cfe9d7d2432d49b9d4a9373ad05a4745e5bb9b718fcb4f8926d724cdb49b7f2942ea06ea1f35aba2f12680444f08a4d1111b191d8cc6aead125170811bd9d65738c4dab5503330e96d2762ed244f249277b9387e7b4501562da493381cdf8d8e5488460c17981d38c762cb51910752c41193560ee0ec43a258577224bb6b9875cc259898325a2f9c62a1327af9f05114764f16a30722b1502c0480ab04a04a5ad13ed3ad103144192e22490df1e6b5cbe9c3b79e27a5f8f91faed58a6755e785fe3b536ef29f7caf2239268d702e17e9af13ad325863ce3cfc2efaaeb33daded13c036a1c4740f87b6ddaf48fbedf27cbf1ad0a8cb0b39d3e714ac95d757878528cb13ecc43ba7bf56f4b97024bc819336db3a3be68c07008416012e93afdb34ab26edf4da359df8c4e3314b840b4aa2e8ce625bfdac4514ba126f7d342fd6d6c14ed260059fba8822e1c1c8488e7f9a64cdb62f26f05b4b399da85c93e5afd3bda9d4c25c9b44e15d25e751304113a4a25cc1330cfbde69004a489e16976b5e1d2fbd004960b305ed263036eb458eb12848decbf9b522644e750ecf9fd3afa90a5cbfebf275a155540575141aae96277e343e983598464e65ceb7bd1c5924683622e491d62675213cd09c12f6db36f3aed61c46fa5c876be34bda284d1e8d4812b6df4eb5c11b7d9c79f8da7e499bcbc71e1cf5a18104b09667ad01705a75e92f388f6e145c4af318bfcd1d862353ecf3b18a8767c8fc9d4a86b1cdf97b541b1d3d25ddf23f0742b8fab6b5305d53dff00b59f8083634df991b5a22af1d0fe1eecf5d6ac767f63eccf4d3d31b7426356c5d34e0b8deb2c6f26491634dcbcf4cd0a93b132a6009cded7f78da8fcac6d21b2e83df9914ab9731766e59df626db51dbd037d80d2ebfce54c117881dad1773c5bbc76a34942062c6245888cefbbbd1b9e085016214a06638dbdf08411b4088e8061e70d608367cebd27da9dd1bf0be9a077f676a94dcbf1f9494992422216644d9e052f7030544113ae913c2d50569893010a12e969998f9c044450b20e8a6b1d68584562f0e1c6dfcdede79f6a0e3462eec8be79f8d871030846f05b38b67858a9f12642472392ec41dd9a680304cec0bb291265224de6a3665e1c96107bb358d1e25f93333e65de9a0cdb5e51b4e77b75c4007a05de070c9893f10d77cb93316d7a414a9298755b5e2e331e5b5a1b833ab2dec2ebbf1d762a614ac5a5fde23ad0a8948b4cce2a594c7bc4ecef5162db5f9391edeeef50340e6387ebb57071c7bc7dbb57974a2f84678d5da7aae16d45f71c29c0709d79d5a17c113fd579f0d4df923df31ef4c72c052f80233794fb44d5cb141442309b462d7eee6dae270625b3e7e68c13b516c5b95a90720f3a83317de82c499b426fc1a6480962c1bba396b3eddb1d34ed576c872f3115c1cfea2fd3f15b6730f68bf4fc533acfbf9caa0d8f3f874a5c9549088c7488b3d18dc000f1022d62d032e87b61d682499ceb74b316beb76edfb4a8ce44aab3c659cb1ca76abf5825d26c3753849c713a49c408a5b6396d1d1cd28ab121748dc89b8121989b9a5e84c1c85e4d88c5b5e3989a892264cc5af7cf4ef44489df53a96f6676a5aae9337573737e61ef4b01a3de6d18e38f629524cc68fd9cbb66a2424bc5ea1d9e9e6e75ae4a707cb45fa7e285c574c31fd98b504329317bf0d65e513edb524dbc7eceb4cf6ea71db3ce7c8d3570c3a691677bf1dabe0dba5cf8a8ee44972ee6af0522c64e1bfb3d29910936c6a63c5d77d8e098631b5ff00553906ef8bc9d6c50002162327e28012c44ec70fc558fbc260bc10e9cb87dab45e1336beeae34b7b9a3433e8b105842098e04e79634e7420210c470310cbe5f944aa84348098efc46760cd5b026ea8c32228050dc168b212f4021b10b98070a60594822591cc82ec4211bc4232cc388dcc20702f22905f23b6ba4ab40b784950902d78cf1b94ed1211025c75934c6ba00dab745b7f1c4a8767a79b9d6a3876e5faed51c3b72fd76e14172d693e4a060b6869cbf5da919c178637beded4b0dd04b3ca7f3de822401c8de6406264371bda4ac5644a11d2dc7e2ced4d619412c65420586174f82c9371124236483c34db6e4f41096d7bde6e77bc50ceb2b17b5e63ae3dbe1084620d67d20d8f3f874f5e1e1c7f9136ad85eae1faed52dfc7f0e94befb73c5b97934cb76f7baebe3cb5bd4f226244758b5b9f2e1c28b5674df8707876e1459bbdae8b7ebb52a8aef756f06b319c44fc4ebc16dd9d935f9e0516c5a89a1bf8d684b3f3edf93ad490227161b41e6959bc44c756b18996d6b6935b8c6fc38cbb588e9a50a5948b146c14948cc8594be009081930850592177449889521a5c08b0382e417c373f50d5aaa260938160ce328f1334be0c2c13722e68c189b729b40858275851a6adb0cf48f304485d61634f62dade69c7649496721179b685b96ed029032c24971c458ef6ac61a034be81e1f7e5536c025014002c85fdfe334c88c1579711bc96c19e15c9db97ebb70a2aac45bbc4f4d738c9a1787d93933ca34a8363cfe1d29044711da99bc5ca7b97b4631edd44654888ba6a74b5b114c36010234b381884e1d1a7ef488c8b239d394e8c769e04025560001857190e396a122885421718859e08e77d69282a52f2b29cdd2271d226484a5d2c3aeb7c4f35abc95ecfdaa4dcf3fa75a96cf5fdf13ad43b345d27728082c60f83f074ff306c79fc3a7a35a0d733d6defaf09a18c9e7e67ce1cde89777cfe1d286c011e49ad23a224a5a246f8d26f52beff007b2b6e045b86943612d63f3e83292dcad8e5caac4286a2c8c6fbe286040220140c4413060d2ad44ca324894809640b71374c2952819449bba8676b84de2088b8367c372c685d6c2c63422846894136275dafcafbd3e05df6c9c6f974e7c0060903259b5bf2e8f2a11ae04b1948c9025085c0403228e72d66e5a2e1a5b5862d436da4b9f6ff00264489b62b2799f2511ce2f369deacab2644bc8936b9c8c3d2aca1a4820822592d29c63682d5004c0dd7b17f2ed5846048016d6fd508236033ed52baccefaf5a0da0da2f7d3f074289c868daee4cba63a36dbe842e09a2185edcf09eff00ea31369bced97f362d591ccf9ac0e47c7ae4733e6b0391f1ea2a1184b89688c45121284175116b008c21da38d125722eef099d9bb75d2ec14c55e20897010bdb9fbc97d90204262035e03af7ac0b0837138bc5f03f334c26a7221609131823305e890072679ff8123ca559debdf47acfb1a57e0f08e6cfb3a9436026c78c2469a62d640b48a9a4218b38c10b3934e36a7620ee46dc18c6d9cdaf5161034be97be4cc7ce946c73c3f7436bc0ea7f2ac270693a1acf3209fcd2b132deff139e872bfd0bd6a49cb24f6edfed2749b9989888d4b9c7bad445b6b74ad1f448c5224424cc9c487967b140922c0a5b206b2dcc5f77900c482c088c598724ea6487d0df30896261b7384f829b30b282fc62234e91d69623338564c5b519c67fc19399f3560874f263dafdebbc7ed58fb7c69a9ab016e17a00a05afd19bff0023834a4cc90b7618d71f4ec99b633edfe8b23b50302617402d8e16f0ab03597b35a3e92e3a8f7a6684916598f76f6d4de2b0ec4c092b04c93ccc71bc932d5d67ae5dfbd202126d17bdb1ad5e0c45c0071be9b5da7504851305a22fcefdaa56f7fb47af9d3142c83a72fb9ef4b7cbb7dcd76df7af2e94351ee1cb6fa591ccf9ac398f83fdb9dc305a67586d727f3519ec1c4880a6e7cf2b64733e6b0391f1f4783a3dea3f67bc7cd5fca48c4c1245d630abf6d4d024129cac3aceb18bd4c16cc38e504f4ef44162d0472b70c0697a02409e1ab674b7bc7b53322d285ac9d89d7ae948e08e76f98f4d274df4eb50393d0e864b71785480d2c55c3561e2ebf4b2399f3581c8f8ff00738c5e03a691116d2335927daf773239e9a7d42c936b93a6bad1709bd8cfb51274d141444936e59b6a5a6824880598256d1bdaf4205a2cfdeb5507913243a64f7d9ccfb5418320880c8412ab74c94c60097aba4d70086a4e085def13529049cd645af36216f313ce3d3079340958bddf977efe983c9ace1b911cf4a8767cfe9d7fdc3b3d3cdceb591ccac0e47c7fa74bd1fda8c96e8ed5174729e646776dafdef93cdf9ac8e67cd60723e3e8c748e4f7fb4526b3ee7dbe3d89f42c80b37416477fe7b52a401828160c4b79d89cf4902cca16bec447443972a563ac17462d9e19ef40d4170cc3306a6939e3ac494252c80a2da48bbcef2b6e55bcb65f8ae55721312a7553e528ec014198be0c439ebadb4a2e0efe9aa906c79fc3a7fb8363cfe1d2b2399f3460e47fad5488781b62377a4e383ad5a402c1c0b8637b18d9e34dd5dfd797d2f2e9e8b724645453dedbef731b514c99825cb8ddbe90f2e15286f192d16e7ef7fc860e218a9b816b0013316fb43a186991b3585180c97f71cbc60f483a72469913818bcf0748a8bed962da04c5a74c9f8f5376daba718fdfbd60723e2b9290ecf9fd3ad43b3e7f4ebfe48e4ff67975ae2cbc1d7183c19f7a2ba25f306783da17dda6cc73edf5747bf788f5442288897d4a111c440978c2275d0b4d2210520c33a73a90cb6854d2e0e39e2a68100c8422039ce9e5e981365d9878ded8ef9a86d404da6215cb4f228c09a23a07a64733e6b4f8d28482fa1f6fc9d6a4dfbf2fc9d4ab691e47ebb541b1d3cd8e95c9486e74fd713afaf974ff007f73f1fbf7a2786550c65938666cfde9ccb6cb8f6a73dadcb77efd32399f3581c8f8ff00591ccf9a120be87dbf275f4f2ebe91d71bbdbd5d92c971b911e59fe569001028bc46e98b46bb5611d4c6c2279c526d404438b0f2c7c544605cc1858998d21b98f8a9184dc493682cfc41f9a3006c0f8f5930de636dbf7ef4241bf4e5c381d2a5bbd3f5c0e94d1f9c60cfb447088dab9bb7eb89d68b325bedd6a7e727e0e8579f05706d8c72301b6becedfef551613be5f3bf7a5616ef1358b7c6dade9c974d8d674fe76ac9cdfa42c97d4f93f074ac0e47c57975ff004a0922232673c224786d486764cade2ce7abfd8a30723e28a2d562225d17f71333524c43762331ef77321788a0d8e9eb7f1998ef157694f3e0ae03d6b82edf8e074ae179e074f4c467014485bc9ff6f2eb4fa31da88060fcaa572d6afa0f2e9f48ba1ba523aae7cdf2c6d4199a185b4e6deb19b86f7de811b6a7c35e5d3fd7ffc4002b10000003060603010101010101000000000001112131415161f0718191a1b1c110d1e1f12030504060ffda0008010100013f10187feb1ee5cffbe1ff00661ffba87ff9861f043ffcd1f2c7bf08685f53a67b17ff0031e86593199722015851f758899353ae1cc25778c7bfcff8eae7bfd7fc770f02e7c624d36f65c4309c56692d1ec116110cc6dc639499111cbd6742e438cf9108309fcb41120e04b099e24d78ed7f64bd641aaea58a41be5e63473c60ab0ffe3214428d487e3263e2183756740d02925f7aa30a8241126332b9b41919d9acaeac796cf2a24c47d9246260d9662eac8b4192ce462a707d0a84d1a09bcd51d5084b46d5c02dcda3f4903247f70114e1586889af32818a9836375c4da33046a4fc0914a3affe78ff00ea382da2105cb1064326660f414bd1b26a7c690ab05a86dbf51048c638cf41cf2698b6e34a2b6d085621426b9a6c33524638d355322469dc26624a8b1180386198bc4d40e170b43f5ca1408af198813c2c982dc31c03c10999686c81508343a2711fd91040787d31e84d589fc1619355e886d5b6baccac94d76a3acb067fe355752ffab0293c0fb51a861ccdb13c06240148d3e25b86c000aad6225f0815f8345fa1b40c0032c18f1d8622843427fa98d80a19eff07e9a79fac6351c62c1e200f156c10381a3120c4c8597a4d148e81439056d40f4f78f66e00ebc48c11258d431b92ef807201824ce9c3d9b1707c21505148a6cb60b264ae3a44196146c962e434e7230e73e05ddfde1ff00ba85021c2d3768347a56a25a8b17c03829a3ef85d10201976661fd94d4abdf81acdf01200166a31a4265c92204feee462646436c2b78366a78869c87d0cd94e8c3d4bd9198c2adb4c030d1ba6e42e392db662080e23cd9bccdaf1a118413e6721a00c88cc0df73023a4f655587b084ff008411636416122d0ae49e63b0d01c50436662a4006f2549f6f0e25a5a96a3d330b7da7f38f7f9e70ffda701a96ec20462d880820f4e94308606c03c7f14cea269e0d3e98ad60569ab7ebce014b896b2486a86d1167051b99695390c43d468554dc101402349ea44fd0185c08a4978c60d39793715e6439a3bee08d46c90748ce4734808847584f8153099a880b3f67193886a43a79ee4b5882227b516bf1a65323339b64a7421071e566b1c482b685474186bf80c43de4bf0945142210c20d548641a051bf1f661d4c5650236eb9cc59343ecc8de847fce1ffb84c9a7b75ee0b5430c81a0076eca60c7881a5c095e8e24888fb1c18d0e0aefb5d01d4da9875bbd4aea61eb406598cda1d47e8326eae381c48418858a6b73065986a50689b244b13627a0447a56bbfc382822447f7c661a2ec9b02651ad06d0e9d96e309f63155d8bc6608a6953d8292c2d6dbee3904794f45d04899964eab2d1c089af0cede700d268f22583dc3c95c548693162c3d8c1ad5066a75a4307e6cfe30ffdb58f77eea5236210aacedbd300d0664255ef00c4736e83fe34c8309651bee331984b6966f17302060d0037e3844fd8b0008d608ed8e65a68f748b6b779b33e90edaa155d08666756c737fc56a556e979d182c5d652cb3999277ab0dc68f254bdc8ac9cbcb05435e8e3259e2147106f581fc18d33e4f1290b472fa389930886c06d05bc5b095052d37442a86432546625c44622e57cde342b8af132dc6c3cbe29960b8ffde51d873d8f17c520f0a04cced263467a865b068151620d9e3c05387251ef62e0246a7a9fdf67e1e14f3a7798792d4c135da02cb465e3160f1665e3ab93f132587323b842cb59d5fa2247abd8bae4b78a1251c1f93302fcc39550479f9ba3ac3bd58f5f9d2cc202d9727e3853104b72afe3885813a5589e822865934ee1221993e560f9aca6224aea8466cf6e0e1607cffcb87ff0afa0343158952527e5fa0e2448b34c8cda884dc81407e2b11a107812fc9ac46704571e7c41884580605eff007111ff0083e17638a73404869241f7b90786e5aa37a22071306db0f39d0c348141f3c32d9f40156565236c866e74792393daae8838b67badef08b0bf7b222fc19d7148fcec2834653fd974ad16414897710222f84b33c4d24ad10ffc319a448f5c93ff003a30d61edc665279c292540546e84f46d46918999e6f64caab073f76e0b8dac76b6c21b1cf35ce941e880b96ff007c4188229a18a081ef9f70612a88fcbab93feecb4951dae664d3b218fc30edf410a53a42fe87927460ede29119930d357c73688321eae37dcc59609c462e80f84d325bed80918a28c90daac46d6e0917affda681048f3c3245c5921e8188859a3f90f268b9d6d7f3895c9553e89810d6d9aab11b11f80cdc1fe844359b897b11f86435ea8c56e17308a687e23fe4f67dff0027b3efca0f8df8b9cfcce011fcb5473a0ea0ecec912e2d18c1a4dde88604d820f935cc102e2156266a6e247bc60d5ffa70ff00c16c480d1aed0a1416434983cda6ec440b9a6d0e183222cc69f751c8caf03e44c3f4d7b18cc86459b89e529d7fd63fe1065d78c612596856b5f1d1d1aaf39301d0e4acf9a0b21a809f9b0744c4425aee4372724e1b9320df11ff00c12aba90557520aaea4155d482aba9055752fed55d482aba90557520aaea4155d482aba9055752fe6a6e30e962c0847e26a4707e390584b728db0a7eb8603ce443897c8c42c7dc37c13e074d8b7f12d4711f67ae78ff00108610c2187c155dff00a43e1065d788431e71a2f18d6a2ce59ac26c1627559cbf07c27c844d1244d047b6c5870a938908bb6d4684744ba93010bde7ef8c79ff00b284485131133a1c03894cd877ac0380ec3c6d074920c1aa185c9e47aa67c8c617d059692a3b5c5b8c5b8a7c8587dd0bd516cfed4f6cd059c60f269358d1d8ebf653684d77f62c2b71fbaa507dd6552eb21ae4462b30b98c10ab9f82abb843977fd63071177a4bea036831c62dd8d481048a689ce71045660f5cbea91140b7f42816febfa45353ff00a1843b074d252b64c488e5d85a23f1f122492f7962e1d0e16c66c2ee1e8659b5b9f1670dd23268bf5f9b5059cdb5440a5f16acb2ccf9de62aee43086207854be6d1b4b81840cc7f2b8174d1615b8fdd53f4f6e9db15322d85968dbc7d0db36373e31eff3cea5c953955a224119e08894d651d6d18c752164537904202bec9c716ba24681f1e3391bc3365637c610c2150b7f62a16feffe9b48016c7822b1fa920fa4337974cda2cb4951da8c20e65d074746abce4c110c2da14e7234ddccf642d3fdd5330aaee182316e316e316e1c2dbd4be070b6f52f808b64bed98cc63915b0c6e4283ae93a1f7615bcbdd56a6049a37405638ade73189842edb132db2fb6431eff003c3997418c318764310e230a240667a121d976a3b441318bac9a6890d3604c22297fc3c3e584308610c2184308610c2184308610c3fd981d1734a14c8312ecddfe79840cd5d2e371045b5b59fca8525d9eeb8aee30f975726114d4c62d1e3087a1b66c6e7c7a1b66c6e7c59c3748c9a316e2c2b71fbaa628c4084bb2dd704d8293e8f74c13704255ee7db1b14a8b386e91934596acbc3c4e88115bb0e85812a9b71c642b54ae97f643b008c23371ff00d92020894feb4e3280da88c5869e6ce5bac66d0a23af46b5f335c3b222cb4951dad96b3abf4c3e1160f183578c5a3cd968dbc7c63dfe0b2d59786a6b3f8c8a5062610bb6c7d01b7675591d0687acb569a54610d4f796ad25a78910947d310f2514684b6808c8f1a566598b9a68bd55047ff618c395dbc586b6cf6618ed7f64bd642cf6f6de0f1384a175dde1126e2df81e3c4b8f0aaea423f0c7fc3ab9318c155dc3185dde7b3b355b8b06a6b3f8c8a50188f61c10c5ad6a413e87b3ec3a5dd12f5978f80d16476a840cea226c56b991329b139e1ea1c0c85cd43823f1427ffd8683a102f876f46a93dca1cb74602096ad1527916a2107b9703d0e3772ead2102b9b94932ae06cf0f1e25c078b13e3ce10b3652a3b5f3d5c98f436cd8dcf88fc2cf6f6de0ab9ff000e05b69297b364ac597194dd6214179974d6f8f89605028519478c802a085fcb23ae76f336b403083d5851aa977ff5dd67c98d2333abb9084c6b69bbdb4422b70926ad531e8659b5b9f1fa45b74cc58e64e84f65681a10c2a7dd463dfe078f12e0630c618c23fe91848d16383ddedf318b7f0f67d864204c96a6df18421cbb1635a66e9ac03c1e9b115ba30118461a82175c8e86942285fbab935a054155ad65c55c1105c55e6c35932bf9ff005dd67c987328374a548721ab43ddea1c67c0d4358de38888af55585b54a49b7aa38b1435165a36f14a2f49fe404cb7097b163066736e331eca0a844f6db0217a13322331d820ddace82a52b263e3b8c86bd518adc2e6114d0c77725fc59edcdbc68ec628e13caf91c9fdc5ac6ab4647f267cf441f25b90fef85597ef36e0818ce1cafaa207cf1ec38cf914e191ff0066e98713d63f6d2521a91198e7ab532129b9d199308e30ff00b1035aeee70379990f1c8377118583766e84b70c80da5d5b25a16a7bcb5692d0582b971256c51e8524b80b86f63b1bc10e39b43cbf7047db4627bb6e841a4e85ae1d0fc06e9dd4606395a30a4310a91bba0b2d25476b65aceafd383098b29161b41440e5b2591ed11f20a1f1ced86977b134b12cc542d7e06b55acff002d46043a325fd9603029539e70fa1e2166946a63b346e1e3dba21fcba2118320aca78622040bc083e49532a0258a994b8d54286bca9dd5cdff00b3b95cd292253e341dd38b6269fe8980d489d96722a870ef52bc49c80b6c515dc7b1659e094d05932cd96a1ecfb0afb97a1185cc0c60d42e4314363f4322d92455851f17b3ec23033773cba7e2a1c4b361ce3a8c309b8d11253ab859fda1ed96c76ca68584a589b2bc826bb0713bda71dc198083fe70d90a82f8d361a226e3d5be9701186a0051c34b289043f7094ba2257b1111cc0353662fe09e9ff6222ac1c96ff1c8327e59641c1466edcd90a890efce4fdd0405e0cf7168687e4756e335181fb9c63dc6a7f2fda4109f5d5ef8e0d4a8c4e7764733181e4bbfdc03cddbe101335dcbe7a31fa39ae66f51814fbbbe0202dc109341e8659319972f67d86011617750c15c917d4a458832d92fb663d8cb36373e1c65c90732ebc2ce5bac66d1aaced338ab0648a52737b9b147a1b64d665cb4739e7a7c878743f87d76c0c488695a3c8c2436105f458e539aefff005e24d560c9dce2260c068bd62e4730854801be8afca22f2c55bc88cc721f3e343cc6e7dcfe98308bb22951910d2baef5f6ac4919ceb7d49e745bc957d2eaae14f63f632516b3c70da15271692c492ea34243a5997061c4e7273cb2c331103f97462cd9ceafd1c67be8f5fc844de394eacd44c191ba18ec98c7a412d0724d19b7db9e202d9e27ae0bb18989ed46ab1c380f467a67129a96dfb57f2e167b736f124fd59398e97744bd64224b83a5266c2c0937fa1a00c6aa631f878d1865d481466202a2bca71a555a9ffd88008f6b54d2037049adb326c47643f86f6c634c50312bf450a07105b5adc0c6c19d91b6670c1cfe6086ceee4621cbb118503d0fd8d0efa6d18f21a0a0cfc1b9b2cd8da8615b1f2cb282208fbd58c7c897175700f1627c068aef097aec20cf859fee837dedf144113e2dff001e64830a6f79965578809b2f56b8db40a290ca7c62c57accab97d62c06106c8777160cd6ac5694a01a13bae09ab2a08d324fcd059a69d6614174a385915a05252c689acc11b8186cccd5742654ddfe187fe81c97072dedb85419435ddf41c3abf4c8e718140b5bef3378b0d91bf2889065b69c3731104b5ee7f7d0db26b32e7318e456c31b90b0ade5eeaafee5f77a890bf25ce951837f8306ff00053e41d686dc187bee2cb59d5fa090b8b6106a2f23115d34c9b98c5b873c7b85377188ab817c2161f752f545be7f059692a3b5c4141f75954fa75711c5d10d03f5f291e22249caf1644cc721276f22abaa1e0f0e6d8f346d7c47ff001cab9ffe0315a88cafe69883883ca2aee5a3b5d2e80d49deea1ea229be72cfd38641779c09d90832e85968dbc71eff000501266c54d58a3318e456c31b90c5b84535308a6a6155dc1c251f43ddafae61e2c4f8f11838e5771a922a65a3d0b34316e2d20bc6316e2cd07c96e42f82205209fd372d6721cad594f4f68bf2e56c639059a8a07d2b09b6cd5b0e5dff00d8c8564e97e1602612e298eaa0a4ed959d059381e53226ec2b1a4a389e730fe5d83154e2f1c62308405b8a926be3d0db26b32e475727e114d0c6053eecf8f98fc20cbafe3086635c8ac56e37209916c1e2d5d4e58efc0e32e4820332b6bb61004a72d84097408f4783348f41a4b99e2cc3dc87c264e7784c443dd3f26597fd27b3effa30c49c0f5c5d6a4d0a6a25b25a3c59b6ccb9ec7b32f5fb98688b15b3df701003ccf831065d0739f01d3c3a14f62f62cb59d5fa686b3f8d8a5050cf855b73202dd72462b5a1a3512d739c1e90fe343de7ab09682f27af10f8420aaea5e3d0db26b32e753d65a34d2a1dcfa178f4b33c28a10a106bfae7288cc6657bbfd0504b276c730119f41e98587fa47fec7b3eff00f71d67c987939653cf88b88741d7e26614af67710a14b28931a541065d074f0e828aebd1ad74cd301d2ee8d3bcc7b1b66d6e7c292ecf65c137188558ddd4113a6d1f715340b30d70d141bb3ad738123c3e78f7e5a192aa514a1bf22a5c7acb394c7a1b0c6bf593697ebbd2108421cbbfa58ab994f340cdb061a0d80465bd37949440aacb27db9ae39d957b7d4e26d0e0dda3ebac08403609d13c1a670ff68ffe62c2c728b3d8227da07191e0c8a6d04c35a0254b9e59681c6bc34185faef48424cf487efa165a32f1cc6bd558acc6e4149767b2e09b8427d16c9826c30844658c58f6547440600c6161ba2f731bb93278c1c65c106ecfa1083c5a2172cf82cb59d5fa630557421ec659359972e65d042151f1d33277a6b5431a8c4ed7e0fa4f851ada1505c30b719662405d928767b31a5ff00a155dffe1302545b225a8781079264ae96d80f64c2c9151ec40833e167fba0719efa3d7f2140cdb169a0b2d25476bd101d1e6654dc85851e59f193c5b8892b6a8ed682853955969ee21e379b732913b71a989e112d2aa4f0e06e8bc3f0f40ca35c726369d4549acdb3d97451c06f8e28adb70d4d67f1914a07931fada37e0697ebbd209996de22c022cfb1b83e486e0ff3b5490b0d7e63a02625851595babb905366ac2d17ff002aabb82abb82abbf82abbffc554033bdb72e5761a5faef58c197423088756c72a3e61e65be8f5fc8764062170973e230ececd56e2c140f43f63318e456c31b90337bf12a57f46184e38b1203f0c52f6368b386e91934345aa36e990a8dfe24dad8bc2ae618fc2cb4951dab41c66e7e12fc74851ff4d833758b844027103934e3b05223f5706afe7fedc2184308610c3ffb9512cfb16f0146fd2cff00350f9e3d8799f063ab930a37e967f9af8f64c9ee58320e7c3e11859c3748c9be1d858dfc494fc63dfe788c1ccba03183f359590c3b7d167b736f187c1a1c8f95baa8247169db93a47208801d0b5d57ff0080b1e26726879b7c671a403a78741fc8f91d5c98d2533494f370c4c9e4ec3270b1f14e9e5dfe832b6b0db211065f9a64931c8d9d6570064b238decd90c09a5d1371413ab5de82c83a364ccc4c5f93e34a8abb17b1b91351ee9fb4e3029f777c058cfdca3a479f5e5c65c10c8b997982312157f14dd9ffc0c49856e3c0995345bde700fe5d10832ebc7572608a3479d9aeb01b9197df0c926db6f792840755e4f527be932188134fe5225d0f64897c3b21880baa9ec18c2d6059b361a97cb46d0e3078b025668a7ac02937efeae860d66f78c1ec16a8dbae6353d65a34d2bfc777240860d0f35caca7ffc14580765957c176cea2a0f43cb19239f41670dd2326f88c3d0db36373e3b5fd92f590a0dfaa5b4c3c2af7f2d58a0d80e66ff00d4304563dfbf7a950124c5d6a42b75f81c0466ad8965790686e1bbb36741a1088d87aa135311a852e3066c2cb4951dac3e4f67d868088f46f571313672a775ca5ff1b08610c218430f961ffca8b00984dd70cc60419615c8df241065d0719edab93f62f67d85968dbc6cf6f6de0e0bc73cda14976f77b20e16dea5f0610c414363f42e20c13ac96b9445851a7a17c18f7f9e21f28b3ec66405116b345cda8b465941f79f87b3efff004308610c2187fe33e2271c9ed2c1e408a247383539f9408c1b0a3625d0617efad63e36167f148b14c7cf4bba34ef318c28ee1802cf6f65e1d1d12273937c6711cb487984210b65a2b260a118c84bae3ffc2341b49ec8b48a84047ac696861e4d58bb2425466a2a1ca22f5f50418861045353184230b0dd17bd8cd89b289cee6c2faa1e63ddf340ad059ddb910116d9fcb21d1d1aaf3933f8732e8210811f85eca1ab8ff0800e593663fcbd9f7ffc01e8fe9dc98cc43f9744342550ef374c4c9169dd24d58083179c20aaea5e2308c343597d645283087a1b66c6e7c7a1b66c6e7c63dfe79fa46ca9c6ea28425142dcfec53ff86987f0659381ac79ebc08199fe9f3c98525d9f3382836f8f6f0d167b736f1b2d25476a3d8db36b73e114d0c229a188c2cf6e6de38c31f84618f7f8203b110799fc297d110691654868aab071ff00f0bf091434942d5fcba21b8b3fa8478a6020667fa7cf26264c1a9eb4dda088d134c674065b67f2c87d89bbd1bbe23182abb87b1b64c665ce30548b47b1672cd61360548b47b18fc2ae1e30cdd4cc104f3779c434191d5bb59822b223d842f650b2cfff008599293f2487c98411d5fb02570832e84618420c41c3c0b9103f26d450e2e54726cb920adc04dcfd0c518a306c30060d41d2c3a0d2757e8c9f4f60f656f1ddbe17078a5a4ca3abbfe2c3fec8ff00dd50606591f2e883057063ae9b6c8d815cb4444b8fb18428c7df5b288864e6eb7b8c6190c98cb7f8b2d59783c5aba9cb1df9e3168186ef5beee480453431576e7564fd060d8686b3f8d8a5060d858b096aca60c100b32be56482e62620cbaf051b9e5881ee533346459ff563ff0052f5545cbed36604a6686148f511cf28193b105650353391154ccce473311bd8cc58134323996a82c97b28f4362a8dc1ff002516c43d9f611876766ab71678732e83082aba90b2d59786435c88c5661730ba6dec2a45b0c1bfc044f6d75d8213e8b74c5760c16a8dbae63d994de6c614e0c9880b70424d02c08a524e5fc661ff00c092131f5938dbbb581e42ba04f8d19b890201163d4238ece623826607ab5ad9a151494f5251fd8e7510249a906efb798199fe9f3c10872ec76766ab7167f37105dde31351ee4db24c03fce54f1065d0b396eb19b47a32938d8c39c5b3208fb3b9ec393cdb87feef636cdadcf8325f9f5cd31825cf370c07dfb83b1ffc041ebd44636fe843fe869142ce67a61520250a2252308cd518f2791b9886664f270575448123b01a1eb3d186950a455564af182098259f83f70143067ab64da348ea93d3ab208a6a7e1ecfb055cc21cbbf38f57c0e65d02aba979f632c9accb9ce5c4953547d1120821f2841e4b1b4eba560320cc1cce6ff00eaa8566fb7bde186575f6bf82b75122139265d7cd6c8b1b094d2280869a5a356dc149b122fccae81d5c43c9d67c34ab9ae631eaad8e372152c5a724a6c5c8c30abbfd1679d8e13a28a7b17b1fa39a666e5f18fc2cd9cb6c52aeff4309ce6cf09bc2956ec9da8882e6f51b62b0540712bda8d8178a962d3925362e419509e5964d7e1fce4c40527c91850ca6153103e74ccd8d8a491048238648d79c1e320226e8bcdc49a0a8249e455481561c359e0c071ec183a8d105549ac46212078efcce10ea06edbe386741348dadc8fda16a098ff00ad370aaea42cb565e1d5c988fc361e5f14cb05c463dfe0c21d9d9aadc59e3dc9b66b8055752f0aaea42ce5bac66dfe1a5fbeb58b3133afa29961b1ff00eb897692e57e8193dfbb6b8c7e11a5aee8d0474f5e7d13e7b9292c22bf64a2c8f7c4a72986033646550642ca9b524c40646de2db9906937c2f084c549d946da80993e1ad9879265fb5ecfd1219df46faed12f2aa40e81e58f0c37c9030b696daee9a2cdb0f535ab5b9b28fe7a35166692fb330d2b7cf3eb40525c14b5c29188e09f7cbaa5216536d655313ab6cf04694642c1bf0f96040c5236f49d8a91c6b4ce7cb06800feb4b3e1311145d98f84d3795b43685a5644c6b8ccd99ac0409e4fcf9ad6220461ef7d4ab906635eaac566372165aceafd205c4e1c32f8e2040f2eb191e87baa98a01bb8d1dc20dd7836f1e336c82d7daba8f80b1ccb85d47e8e6999b94458c5387bb63478eea123739a937b039192d408971065b25f6cc63fed87c29f00db724ed9b0b39fb26efe23f08b3ec50b937bc9a85f9ff009bb2631e904b4132454acb2699f21848ceed8de10c43e1ba64f3f8fa48543e4f1927060c81cd844f78e0e21e8786fd74602446ef6782b6dd5192318ed9b16a0cc99e782fe8dc9964b1cc647cdb5f88887e668c7942418546279433fa10a4f73dec5168607b27025361f331883de1f06e4716bd37c0285aa5c282c83bb6ccda456f25d03c3eabda370798f44f2b33798347b79fcd84e37db195d30407e6b18d1a8631269f30280dcbae77d08c3bfd2b2605fe8cd3929aa9ca27983c93d44f77033433333a11c54c886445d45579b572a98b38ef469c48593724b6218799f063112c31fda55004db8a251421253bab4cd42abb8600763ecbb0553112c94d4ca2b26a31a41a05237de2d12121b81de62c01cdf83d923278c048f1bb1591cc584e839ec66c6c97c9b87d3d081c4644ab1b829a031ff192fb051b36859daeccb0fba1faa260d863f08f3ebf987ca30841ae676c6e8d132666409ceb60226c7375f98f8e8a9ae541ec3ae68d7c76cd38ef8547e9e3f68da10b2f6a426d3a861c293b81c462170973fcc07e2b53446af60c9be99b5b45e82eace90630fc59d8cca516843575deede2c2f7f5d8329edb91d300e2c2c28c7d635221616ad3f30213379f723910d838c2946504cb849b8f39488750b3895280cd566ef8598b3342d1a8f16c733423daac064587c993989156fd1d12e8cde67bee5d7299d361f8453be9e743d8c5d788308f8a0c6f03b29fa356d90786e4a339c7b1b95562f6bfd51e3e13a2e3d0ecadaddadc3223a7798991194f057fa120668f774da447a2a7355d07602cdac8b55cbc8e03b7ede998985f9cbb898799efdedcae09ee0db9889e844d33252711a1a1134c2c59488d9546999872442223226999a9023cb234c20e280889ef869aa52463f5cfd86d535c9338b15b82e6ba9ef9370c468692fad82d43432554a29437e43d896f3636ae120d953d4343cc358527ba93b22ccca1fe0d7156b82119ab7e18443787e08a51d767509aefe82aba179702989711b64ecb8cdba36078509c3dcde25c8c0167b7b2f0c3a3e8c7fcb0edf443e167b736f17996dab93f6277314b1891f67480347da320b831c4d091e05210cc461199992bc94c84f5530e23ed4a04221b8e199c861ceb8d99a0693f581b12060ec79a5a8b2db9951506c2b375940440ceecc115ff0075aaf47e6c8cdbf73630aa3e166ee700e352f0a996e9c34112eb5ece35140748b217d89b24ac5cd9afc160492bef05160d87f09c82b2d7dec720a0ca7dd7321912ff001ad63886e5b96efe98a08851d1aadafe0a81645cd8e1423d35f9ec593ab70c2b5fbbd0644f9c88b184222314c95964941aa569a937021c5b91da1ae111124d7f312d981e4de5d3f6f438a3b5cb2e4280ebada6b886c59ae6d0c264eba579502be7dc673ec48942e666590d0311dddc9b41d20ce73a45ad418d91a94b76e121516391b8b8db3c8285e63ee8b3c8702b65c18f90a11e9a47031e73911c635b0420c88cc6684ac44aa4a194e0727b0f0e9b10c566650b3ddd91a2e084d24b5c31254490a917bbec583bb274a082c0e2d8e98e86480b1843bede140f02dd575a6e4afa4d96e1b14ed18f6111648c16ce419e924a3772151ba1b5459edcdbc5c064ca3ebe29b4202fda8dcce14241306c2e843d0db36373e1ecfbf091a9ea7f7d10c1abf9c4a3915aea51a08a996768ec05925b61e98583618a30e8fa2053e4f27e430e8fa155d0bc630c3a3e8404b97c4a46612f12733d649173c166534e539919931668e48a0c4951377fe38191c245c35363cd062490ce099d0d4b1d86af2a3d93750d877461da08936f15558448cc9a1b599604ddb090f94f5b6d10e075a419d98221de3acfa312272b361448e3253891c51463656f184729c7367e128ec2e925f4321ec56611d92208a3b3d27089b9e815ce676e044cab9fb5a0c419b6e155cc1d39f47efe8813bfdac5547014930774ec4aeccb40d22ef9788548d316a6f8458e1b5276d527ec185cebcf6f112610ceb6d161fdb0b76bde1ecfb023010b1fdb70e4acd9fa53112b6d4a6f3743141ec6d9319973c06fb930d9480c4ad88cd0646d22227c7ab51ec6312614b438890c348e66aee4c3119e98b2447a6ac8178f77d04a67f88ae2f0f359193f0aa3b106c6e87f262ca7162fec43ca74cc9906eb5065729135f9042912d611b19a03619233410a68466ac4227cc980e9273964704338c8d5eaa21463abc28b8449967316468f2411e180c1840ec7e323a02b1c1dc51181c09a92956e46248be1457e198bc557e3b18e065463dd70340c241bd575b41b3247ebc7c0e221618da30d8a1e0e23ca9bcbf1030270ec6e12d6c924a39b434180316ea0c90b230954f76d291848d4f53fbe8868692fad82d7c60dbfa92e48fcaf46b4c294d7a1bafc16d7183d177541f0aa9e1eaa16131da596c4198d7aab1598dc859b29ef82e00b361898cb67ea27e35a810986625e8d53a8aa180af1c43890a94599c3b160210575941274a596f0a9450805e819c9cae4934590806fa7a560fd3dd4d38639230832e8301e64e7e33fd7c811120779b1ae68d40bb9ceae60fc024f6df788c44f93efad968fd6bab3652784106d27e36a3d91fb33db43341d9c2d5ef730488b28358ad326ea1016d9947e48389bc35c76a29128cd05d120f8a571269023b2857c23c38db184d9f41b9667dce9e827b6f2fcc7a8821428d79e45427ac1de919b089185c5ca5f4746b95ac9059ededbc3509f64dbc75e3bbe455fa4b86f140231948b2715e0180a95489dac8c6c4b65b60486c2fb81335b51b83e93e620c082ec897a35c980651c6d8a61a994392ce88d63058332e3617459a7598832e820a2edae725360e48b126448401e1366b8ed310a4ba2981c5d6e160ece3f160a0c15c8f7d590c4d8f32cbd0e9172cc93f4849185939e380a4656fb9ce65491317631e4bfc7a0cf6cb8c03c9e5f8c4da6af31b131145b6d2084515b673f28b82abb847e12596a56940c5486d6c7b942abb853d8fdf87b3efca1cbb15f90afcf86f41dcf726c41514f9921ee1e599f5e1d9741a5946ed26f280b2cb2d5f3165ab6f0eee48110eb8bb0dc8c4c00370c192046658b522ce5aa608028932adc3114818402a79ba014272c322935ad75117c46120c0b34b79b8c592a5ae26ec19ecb71aee50a8784bc6b3c14425ccef460a9fccf56690e443de515331623183927163446c96cbacc3c83e4e8bdf2b6db8348a38afb0447fd5fa78f8086e479c1b1d84896f7b70f405dee499627760adaccf00f39b25ee86e6c5f162668ab3346262302d5bd9b7a0e33db5727ec7d0db36373e3a3a355e7260f436c9accb922db3f9643916da4a7ec992c53bdacc4f8d5ac17f29663a26c87ec8f2084b0e25180a8b6f0bd0732e82674b71b68f48052fd6be5c31e0ce43c23dfd17d034342c19789110916269bd62ff632090c65dcf31a93c209dc8de22cce8348f1ed8160f5e494b7c85830bdaf32a9726d1f61d8c40234d705238fde3b39b07aabb8319d394f8a9c9a0883f362cf70cfc59c938e8e9ff843e11f947fc28ec6343497d6c16a2e6787b3ec23f2c7bfc18f7f81f25b90be0f432c98ccb91182ae6167b7b6f08b00cd6b9bf046a8b0e5348c7371390791797db58f5c8c7600d39cecc1da5693c492d2394c34380286310ccc88cd4889149508da4c14301177ecdd11a83df1bc19efd0826cfd7022cf31433e512dec80ec862321af5462b70b98709aef6ed14602b698522221151bf4fbc8572cec91acd752dbf6f6130343e636c6090314f44e61d8687b5ba63016bf5f9fa29916d8b1db850be6b6661061bc179682266361a48e71c81609aeba5918fd07c9d276c54a292db16d11a1e1735c8cfb7bc13534bd576c8665b26a890a3a046994191c1d916e3bb82111ea74dbb0f4adc33c5ec5d832dcd7a66c3916da4a7ec992622e51cb98c433cbd499a3240b524abae6d4730486cc4e1dc352125ed1ea98fa1884d935ada87910701cdb9a36239612b231d84e13be8301903eff007861b0e1b3286584844003e45c2b20c229f51f593820127ea48bed8f1a132bd24a83b08fb12c4d95f1d83498459092bab6849b7a22ff002ecec912e2d11de0264709f2d4c8355686652cb17a381bd4e2122999e4564d1b13488db793c42b21b4eea4821f0c3b7d1a1a4beb60b5167b736f1bb8608a3b7c0aaefe177786a5fc8adecc1822ee0f1539fc3c684338b49ee6dccc29c577bcf60f02ad9c350f8e8132ed7d8525b3ab189a68347f657d071304bf40f292a90641c4f5556c9154a2d63c1235a412c14d08894f02a0618a0133223223891a191a1b5cc251855fcdd14ccc7656fdc9a3436b06759235b74a5ba59091cda669f570d5a08bacca16b01c0375e115c7216025896080cbd66eb8079769032248b7d023648b608bf5e1c926e393ac8850337fb8920427e2117108d24381916df351dd4b5547140104a1ab97b773b8dc3b672cc83f21ca917e2f164b38db406738616ad3d47e83667f726b91167cdcda08ad5d76741355b759bc44e7b7cdc666556c3277c4798f77cd01d24f27ca70e51e3e0cd326b4d982189ef488695496e2837b33a276b4160afd49c68d7081259e44bf51c62e1bd8321972162e3a0dc264dc27fb51812ef4493b89b085ef4799fd80b29aeaaaf7ff001181af29f2358db64fc74bba25eb20941d0e12cb22167b732f1f28470d5a7a718c430b727bfa2ce4a95585200c1716f8acc190af9075e4598601d404ca2b9eda98782e69bc4e7a30d20ad883af3223304ac6a655c9aa2431f1ad18cc55a091b9ca0c34b8788a3bb93dceaab4dc30220d8a5b4844bce37b6d88f3790505ab3e262147e7a4ceb8f9f632cd8dcf8c608a686114d0c506a7ec553dbd8a1b17a0472bacf7d0331af5562b31b90e8c7386afc547687e9885955474336f878510eac648b674066664d7bcbc9db01c350508b148a0cce414733f7a9986dd18e79cc54982c3dccb0603e972a8646446aac32352762aa46d3804f253c201b48e8f232294d2e308e63acccd5ae5040b2aa4399b1b07d3c5d264818572d64c9603f1b5760e084b2cfa50ead1fb075721519b1f9dd03418706fe7e0ec8459cdd882227a9e84f3b3933a36e52c26f959edcdbc6b49029a5c3406673746cae755189a0b226df7ad16c1e2b76f82d244201259b2f0062f949cb268d87f2b053ec81de5c7bb620c2b5f7b1c860d811d670ad771677225e31a0d0bcd77694c92414d0d3bec6a597a64a302e6f660cb4149798a9c1ee65306605020f0e58ac997c1387575bfc174749c653198d7aab1598dc8596adbc2cb56de11f9596acbc350dc11cb6ce462170972210ececd56e2c1184f81805532ae86624eb1ab6c9991ee55360602323dd4a30ad19e23cfa163b61f59bc4c34f9836c85849e54836e0779555b26cecc2038124bb6c9f20e030be2c018da4c44b6509e7e1512f8bf7f5e2615949acc910bdc7e04660b3d5b6a40c8d6c96512631143c8e685d1d510f9542d4bd785577f232d92fb66306c318421405cc935c8c3881eabcb2d09549dd60e6918369755abf8a221c1aeb0b40fc28414f2c49cff008ace1364aa5e95498d41900646419f6917070fd52d6b6d2050441a4dc7695322839a244814323711b49e4c6a1b450d8bd0536dde2f426bdacb3350f0669ba32e620696bcd5ae1f85db300c287d9d278b06a5c953547d112082ce1ba464d0e65d059ededbc2936f6374d3c519f5ce0ab983b2349d6585bc7a85386c541772672cf40899e9bb5b47c3d37474a8313185db62564eaeee0a4e925bf37e82bee5e85c3206e570bfa40cd77f4d73c256d69986a5f537ab9f6442bdea30b5fa333fac9f6cc0112960c87384f47583645b4693a2e68b09f1918eaec02612e439cf811847fc3727d822079e41ecfb0228c08dff004e559c47a1b66c6e7c51a273f24e06aca1424424994373d45b1fb1f8043731da1c195d0152c875aee1908d4d48be113c25b224afe6093e4a014253374700a10cc3a244f839ec88c8307e98d96a90111588c722c283502875366110721b6a925c2267131b90f83961fae639447e0ac9ce3cd869ed010f37ebac850999d028157116009713d2831ff0b2d5b782ae60e16dea7f459c3348499fcbd9f6118405b8a926a2a2e9e13db180a80d1f9c489b569d08b509263c38964e20f633d44e3566e35b79cccc9364288a91ae87df6e09ce50db0433735e46c3328991488ca44727a4517fb6b4368ad82ea37029894b9c378c44c6d35f04d31d4c309e4936704322589c1733b26187725ccae4b112e086ba086f10f92dc85f06020e825b98267f363fc710da929f56ae36ce04674f45966d1d6ed3a92c0355ba459e52718c30ec936e348a682cce927d513218dbfb066f7e254ad42dfd88c2cb465e351f75954ba438c8937737d10fd2edb80b39b6a8b0ade7eea98c18a5475bdd9832d7fe9ec512151fa5543f452165aceafd1ecfb0c3b7df0e73e446165ab2f0f042b9b37956f7984d822ea556db1bfc61f28fc889fb4586daaa72cca7aef0ca03a5b061f0151c76ac3f71164e02e62e2c02cb3e8380f7bab1f828719f1e2818c6c965fbc703ecacf328c610819c735dcf0ad705229af282a41cdc2a318630c7fc21fe9185f51672cd61360d07eeac3841c2cf6e6de360ec17ca154b8133f06e6d6cdc4efab5e448b906d345283cd882245761de8664b116445da108c75a31e82c806449184fe440e57918fd22cbae41a89996a9fbb0c3b7df166854cb944b7b6230817ef9bccb86e1078f432c98ccb952a62f6bf7f63b3b244b8b4481b87549e8216c47de1ee42fd7e6d418073a6b4c2a1516dd4db78f4ae9192422342bb3ca56c1b968a9929fb96084185a4ee3fb4085f07559698c1a5c99c82cb9b27e3e13c318ce01119c7769a66ad30e33db5727ec7fa732ebc2304068eb14c2cfc3e78f62308ffd8a1b87638d1e089043eae0ac2d43e0e691daefe2ca84148997e759bc3ec0459f61e3e78ce3f85b72732392a462d243593058020d729b3143518f7f9e6ce5bac66dfe21f28c230b3dbd9783c832d3e3e08c1e4f4c8f6e0fc4617421506839191bc44566f7866d7f16420116d4907a2b60858dc034d655117b69393c3e89ef0f40b20b1cf1ae8135d858a9fbb71091a9ea7f7d9899aa43173fd3a4322589c1733b264c2bf399b9242e626180eebddbc16a636c23a477c8ac6b5561c6839050ddb3cb7460fc33b2666d60e1a34f262762a5fadc51b478f81f158c4f01f84b619d4c621dadc915782a396ceacbd0e49bafe8c5044addeb70150ab98eb6fb0a496c2afc508346747b6b96b230e266369a718c8449e689f37345cc341e8c2427b6390884ed18b371d5a2cb4951daf88fc1ce7cf88fca11d5a1736730f17913b5fa2c129f7d87b3effdd1870046968141e616f458208d943394e6cb78e6eb34e5d9e41f60210b2ae37ca020c3b190e768ff00cf18802e05b68508d2ee47d9f05fe108460f33e0fc6a0a93574a91446226c6e0b37ee2108401dbc9aec45979516f9849d8ad1eaf6e6c99060570ebafd1c9374d1981e0e7813719264d568a91fd3ad98fd82160cb74606d0d194979cf935989349e58c58814908d3aef561c46647ccf56967170d0336d76a8694909b759341a4036306479b25b9774ccf264b63eab89a9fa18da1030c9e595cb81d119438331e200cdb4decd8bd8a9b97b0582a416db8c86859870aeca4112dfd87d1cecccba0d0d25bf18404898dfb9b0348aea67facf4382226cce45123dcc5493f57c2bcdc67be8f5fc84618fc0e73e7fbe12ec4434ef3ce6a1ecfb0def8ffc78428406135a5b4583e1b9b4d4459f6280ebeb1ddc62654998e3e73a49631fb485080f57917eff008c19741d3c3af1083f3d46d741186309127144858aa11b3d8326a3af59b05cdde16a83e0f4a56f8883356dbcd44c2956f3c1558c142dc5c8a26e171f4316963296b1a33316adf99be62f52f62809d7235c20464340c35d770d87382ce32b3240c3b4ea85d6221f2b3dbdb787945353fe363fc33b920318759e17a0bbf42cd1c706bdc6b41ecce6f26b4a5064bd8db26332e7cd9c3348499e70ff00078f12e0203b41230d2d4bc5cc7c3d9f7ff88ab983404a50993d9cd444201186bc90dc1f060967a9c8ea7fc210e22ee82d928c72326ccbfb84343d65ab4d2a23f2ec2136d68b53720d018d572d2dd2c61b9b0da10b2fa8cbc85e602dea3327fe6bf50345cfc9c4e8220a711bc88971f677a9846aa141958b203f4bb6e0287b6674759eab656d5cfd0dac186186147620aaea4321ae4462b30b98c218431681843318e456c31b97f58c3182a7abeef91f84ded7f388799f0623f2c3b7d0f72e7c610b99fcb033913487b6178ecf07b3efc21ff043977fe4e24246128ec9c731f845137e8b51628fe9c74879314e0b09c444accf35abb90a707589deb8d739226c318ff3083ccf93fe350d217862282c7446b32f69e7912d8687e89b39070cabed5b370dbf90557707127f0bf13f06407a7e13c762ab818ad244e6971d03047ac8dcdcbbe57df8f0a2ce1179b4dad60e8a5fa9b059cfd13770c7895b3f66d101ee5ac74a32f27af0aae85fc5ad6af7c1ca30830861022db3f9643082cd0e01edbdecc1b038afec93311863fe4739f3e63f0c7e1209f4db5b07934460f2e1e63ffc87944a7c513f4112389b45c52ac3fe1c3cfecff6bc022272cfa79abc59cfd93360e21b52cc8b3c2810955d95fafe5f3c7bf2e65d0420459d9bf92abfc3cdbe6c166411b9a7bfc7933c7b1966c6e7c59692a3b57b2528df3a204069178dafd30a423267b357baec2ce5f5bec2267abd0f436c9accb932b34bab9f4114e1a242665180c3fc9332d8600c6161f743f544448f57b1613e0e735bb9b27613e0e735bb9b27615b8bdd56fd7e6d41d0c98fd6331124c6b30d29b0f636c98ccb9f636c98ccb9719f023f0739f3fd460f1e25c08877f4b3ce82ce19a424c1d0f90b8c3cc7fe487fcdee8c51387e71189389a1d4633247f99c872a59b886e87512eb018f7f8386a99a933d741807ed4e93b610243a12b3995852be1e65c78799f27e1ccbaf289bc339d19a8902d7c374237ad978732e81e65c8daf82f365a4a8ed7e88db18c2c901022cb65279cecb275a959b5859e1873d9131c34bbdc98581662cf161659427223a079cefc545393bd870b6f53fa2cf6e6de38361a1a4beb60b518c155dc2cf6e6de22816fe8503bc863bfdedb3d62316fe2cf6e65e2e0f6fc66014575e8d6ba66984618ffb43e518460419e96b273709345968cbc790ea9c653f31ff00aa3ff010f34c666b3fbb8de0abd3a99af880465a1be4e26448107bf500c3096f4fc430a3935c67dd918252a2d7f736b4458ebf19bc5f4d4b30c61b483bc7a0f33e4c599ff2f73e4c3c314c697ec846167b7b2f06815a946a3720c3e0f67d8596b3abf46030285c401179aed69d950665778e6185e715ab5e4ef75762f61a5c6adcdc6ac0c18dbe3b48116c9fcb318c306c3130bf8f6e74763183618c2867ca25bd90161be2f7b59b1324f92dc87f43e4b721fd124f0bd6d03f5eac4555c9543512c929731b21a822d79a0f665379b18538326e73e7c3dcb9fe61fe11841886b2b92ca79b86976bcfdec3b7f11847ff00850e5dff003a92b449f9a032c590736cd8790692e773d66262fc9f1a544ce709e4fa8518974ad76f13625b1dd6d8831145247cce1808c39023fe1d1d1227393468143c29339454461ddc10773e86d7bf30f84d8acc7160a7b17b0a5027de0d4ae241a50cad7b83074674eb70620f489f0a99382b955dcb52180b3cee709d12c5d09b2b83c1d93ebbb8406792ceac1edd65b5cd0e3b9751734421804c67c05ccf70a5febb97354c91bee8fc282abf5b42af2a6e164d54dc86b93241b1fb70844c3e78f7e5ccbafe8e65d797b1b66d6e7c41883cdbe378d62162d345e7fb8a9aa8b1c165c1e01573fe10e5dffe0c3fdb9031a465be81e0264e9318b5c306c306c2c87bb46045343101bbcf848aa723d19c9c4d69ca2d9704969476db103a053917a1248c9e7f17c195c645ee7987adf369196cfc0d31889810e68e57a944ccf50f3eae3edc1e39232edfe1e3c0b9089ceddebb3f0f67df8741ab3c3d08978ada1db464204c96a6d17b3d0dc77d22322e6865b9af4ddc72783166ca5476af16aea1eed75720d59db5ddf14b81613a0e731bb9b66673ba4b6d7f11c5237052689168fc5f04580a0fbacaa5d52e43b21bd6e0fa2a682d6b473e2f51734251faab3c77d1803a531d6dc230732ebf93dcb9f2e65d79461ec6d93199726349c959d60163752b711d0abfa5d4f2ff00d1672cd61367f3016628e65f034161314ee3a47c10f184cfbbb3a0c61ecaf8689047345f678960210f6bc7bd18fabb5125e2e3832a190319a5c70644df39c3b47c59a1115a8b082032582a84684eb455d86cc684b592f842d12ce5f91e4a196314488732e83b04c2e6f65b5ffc421cc1e1c646342fd645ad2b7f6f6646291ec310c5dae208b6fce985230991ea61333d7ec308ea499db2010ae57f8099ec18b57c0899ea5ec6a15eaecd22135d8645766be1021213ecb9d68247375522ab062639f5061cc3cf66d676c0659fc71c07d7111ffa1e67c988c2e8375ef21b8dac26c7d704a38cbff3c7fdb325de8c464489a85b5150d5e9ab10f6742812bb77f4f78288f7919f1a102248fc5e891b306ea7bf3a67e1466a10ce0d2443fb8f9479f43009ed3165998a1d0a50bfa1ccba078f02e41c14b6656ea7b1966c6e7c384a3ebc31ff00a2cb4951da875700d6685cfd35b1488c02e2b0b71b54584e839ec66c6c921b3bb910bbbc628abb90aa7b7b157721476f831b7f61e61d5f1518dbfb0e376f8c4503dc2a45b0c0e37ae243a355be0eab5a3597a7fc1c896c253f66d939cf9f10ff004f432cdadcf8f365aceafd1c6ff77dc1f5c05a1a970cc73f83eeb68e3ff2c7fee87f9480fe8452ead6b9cbf273e41c157fb42f730d63e8ef8678fa3a56728ba5e38034e6899d53cc79f41de3d099a76ee796de2106068d20496d2687b3ec3bb92f2e32e08483e6c61c67e30edf451d8c59cfd933618c2bee7e87e98a5ec4d18f57c18f57c187c1ccba087c31eaf831eaf830863d5f0453b702b41724f4489366f1ec6d9b5b9f1fce3fe118461065d0f66737935a5283248075746dc5a2b0d31ce47568cad88955dbe13aff00a43fca1ff1479f5fd684829cb4a4d98e0c4ca24b707914019f06bdfa9631a8d4d25f5905a8d8ac6da728d3878a643d18d38cca22e9d68cf832166621cbb0e32e48387997e925e2c2a2c1d4ce8b6ef1160f0eb01434273724b67889085c1ea5f060d854dcfd8ec75fa29b44ccef22b36d0d8bd0d0d27f1905a8c4188310484fb2e75a055753f62c3745ef633626cb082ee5ec2ee5ec59b7668d36cde3c94675d02846f5c66f4b50e35e1be10ff4732ebca308c1e67c987f23e4111c7125fd3a0c03a16b3a2aa2898dac4fb3e32310f961dbeff9e1dbef9c3b7dfea1cbbf3876fbfc47e1322aa668ee5a4c16d6474631a93c062dc11f083d12e615730b3dbdb7811e1c32baab5c0c5b4b392fa2056138aaae1183e58f6311feafaf62814a9b0b7fa3f2223e11624f988ef00e32e4bc61f08433b0f17360712b092ddfa331946a8beaa2a721525b825e80a868b4cede47aa78bbbc610a07a1fbf15f72f42f27b184316e353497d6416a316e1e4620cc1f6862a0e8744f4617023ff039975e5184188687bcf5612d03eb88e86718cb8ec4c4e1e97dd310e2e07fcc79f5ff008e1cbbff000c7e193126adc48662d328135d9868e0776581b8610a1b17a1b8626773f437be81904d4bac9d1a488836162acdc09f5f61d6216cb3ec226a0dd222753461021c7f9937f76428b3ec43e1084188420a3f5deec0647813f6cd5418259bb9164625f47b38e8fc282b9c5f8bd92684365773309996c318630a07b7a140f6f5e155d082aba10b3dbd97878a81c65aab7db0c449ada4bad1a42225c54d750e33e03c7897021ff03c789701e67c9886f10ee67c0681fa67aa999a9503f9763e9f59ce9011e7d7f3876fbfe90e5dff0051ff009ad3c6513e35368990aad161be2f735bb9367e8659b5b9f162ced1ee2b9f5c72ab3c580156cff23f808259a921f63224287c409e6d20f8265e6e93282a12e5d9b5a823bc03d9f7fcbd81ccabf6f97d41b18c7272cfb5b22743a67a17d3d88e9b1df72835d118c2c27c1ce6b77364ecc0c61613a0e7b19b1b2551f75954ba624b9e91f6a281de4114d0c11caeb3df4c1b0c6078330c3bad4350a78ed5eb30f9e3df9c3e50ff00278f12e075726230b0d85c135ac67a0f018ac2581dd47d3eb39d201d5c03bc3b10e5d88ffd5876fa30edf443977e70edf7cc3977e61087fc084488d33ca13ec389d866316e148c84d47dce4103064e24c965e77339499e3c0d634e4aa3a8609aa6b4676ac808ef010f943e1c07d0526d046227a063c8abf84cd0308530c4aa24cec815d6a6d3e09c0924fcc88cc8f2a11d98a1535d73f836652d0d4b24a8b6cc58df62ef1734549d9646e98a19f2896f640630b09d073d8cd8d92fd3dba76c55d36f43a09c95fe87297041f3c7bf0f1627c0c7e10f939975e0e65d0460f67d83a7874220cdf837f31160d2f18bc584c2e49ad6b7d8f608421cbbff00c31ff68fca1ff0388a25d6a8d718ed850773d10e8b249bbe8d46347e07ede518bd043e133db816736a305831b4588607e5e51ccc711fa65e8a29f821087f8630773ecc6e4a028b35ee23b25b89b16ce27312964a87a0c44c2f39b662a1ee1a14af1f951ac6169d7a4f140f6f4311bb4f432e5b151e8659b5b9f1672f46ddc6a6b3f8c8a50683283a38c4f4518da90c091612bfd762dc5187e0df7831fcba20e65d7843fdb183c7897020c41e67c98f66737935a528324c0b28704e4b5d83c7d9c6103d2614475e8d6be66b87b073b8310e5dff0010ff00aa3f0b3dbd97879872effcf0edf7c39915cb02516065696753e6f25fc4770784f0cf3217c2797b0e32e0bc421ddc9798b007cb1ec3834fc094d6521e86d935997286ceee463232a3619bbe2e0840b79d0f57088a917ad530740588dbd8d5a8b10b7b5ab5166891dbd4a3b08a7ec5a7668f98b155ee2b1626568a254db315335ce66e9b301a1eb3d186951a862f9654043cd55fdbd1ef9e3df855742ff178f12e04188460fe47c8b0e2558e4a2e1e0353d65a34d2a1fcba30f73e0fff000c79f5fe90ff008b02592b4cce680c88b7ea25f3e210df1f6185cc9736c52d5a4e845946d1ea41c65c108421f2eae4c4218825adae43f20189b522c636046155d0860d4114d0c229a18335045f7599ce2214f9317acd3d87aa9d3ae4f1f881fa92abf7183616640ce8638b5f9ea30a44ccef3cc5b304feacdc8d47b97796d51637d8d08642495b70d0aedbcdf40e73e4596acbc3fb557420aae85e2cb59d5fa687bcf5612d019dd8ef5b50d176b12c3116130b926b5adf6202dc109340e961d0719705fd39975fc23fe90ff0732e83d8cb26b32e7fb87fc8f251672324e48b1e08961da17ed4284ccc65dc1a2db31ee3f7640e32e084210f9445be925f9e33001b9b4b0b69392bcadab5150b52f43f4c16f7260c3b7d18361fffd9, '12239606_1066977379999933_7229195596604277746_n.jpg', 'image/jpeg', '61742', '197', '200');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_reportto`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_reportto` (
  `erep_sup_emp_number` int(7) NOT NULL DEFAULT '0',
  `erep_sub_emp_number` int(7) NOT NULL DEFAULT '0',
  `erep_reporting_mode` int(7) NOT NULL DEFAULT '0',
  PRIMARY KEY (`erep_sup_emp_number`,`erep_sub_emp_number`,`erep_reporting_mode`),
  KEY `erep_sub_emp_number` (`erep_sub_emp_number`),
  KEY `erep_reporting_mode` (`erep_reporting_mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_skill`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_skill` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `skill_id` int(11) NOT NULL,
  `years_of_exp` decimal(2,0) DEFAULT NULL,
  `comments` varchar(100) NOT NULL DEFAULT '',
  KEY `emp_number` (`emp_number`),
  KEY `skill_id` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_us_tax`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_us_tax` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `tax_federal_status` varchar(13) DEFAULT NULL,
  `tax_federal_exceptions` int(2) DEFAULT '0',
  `tax_state` varchar(13) DEFAULT NULL,
  `tax_state_status` varchar(13) DEFAULT NULL,
  `tax_state_exceptions` int(2) DEFAULT '0',
  `tax_unemp_state` varchar(13) DEFAULT NULL,
  `tax_work_state` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_work_experience`
--

CREATE TABLE IF NOT EXISTS `hs_hr_emp_work_experience` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `eexp_seqno` decimal(10,0) NOT NULL DEFAULT '0',
  `eexp_employer` varchar(100) DEFAULT NULL,
  `eexp_jobtit` varchar(120) DEFAULT NULL,
  `eexp_from_date` datetime DEFAULT NULL,
  `eexp_to_date` datetime DEFAULT NULL,
  `eexp_comments` varchar(200) DEFAULT NULL,
  `eexp_internal` int(1) DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`eexp_seqno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_jobtit_empstat`
--

CREATE TABLE IF NOT EXISTS `hs_hr_jobtit_empstat` (
  `jobtit_code` int(7) NOT NULL,
  `estat_code` int(13) NOT NULL,
  PRIMARY KEY (`jobtit_code`,`estat_code`),
  KEY `estat_code` (`estat_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_mailnotifications`
--

CREATE TABLE IF NOT EXISTS `hs_hr_mailnotifications` (
  `user_id` int(20) NOT NULL,
  `notification_type_id` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `notification_type_id` (`notification_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_module`
--

CREATE TABLE IF NOT EXISTS `hs_hr_module` (
  `mod_id` varchar(36) NOT NULL DEFAULT '',
  `name` varchar(45) DEFAULT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `owner_email` varchar(100) DEFAULT NULL,
  `version` varchar(36) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`mod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_module`
--

INSERT INTO `hs_hr_module` (`mod_id`, `name`, `owner`, `owner_email`, `version`, `description`) VALUES
('MOD001', 'Admin', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'HR Admin'),
('MOD002', 'PIM', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'HR Functions'),
('MOD004', 'Report', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Reporting'),
('MOD005', 'Leave', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Leave Tracking'),
('MOD006', 'Time', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Time Tracking'),
('MOD007', 'Benefits', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Benefits Tracking'),
('MOD008', 'Recruitment', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Recruitment'),
('MOD009', 'Performance', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Performance');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_payperiod`
--

CREATE TABLE IF NOT EXISTS `hs_hr_payperiod` (
  `payperiod_code` varchar(13) NOT NULL DEFAULT '',
  `payperiod_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`payperiod_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_payperiod`
--

INSERT INTO `hs_hr_payperiod` (`payperiod_code`, `payperiod_name`) VALUES
('1', 'Weekly'),
('2', 'Bi Weekly'),
('3', 'Semi Monthly'),
('4', 'Monthly'),
('5', 'Monthly on first pay of month.'),
('6', 'Hourly');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_pay_period`
--

CREATE TABLE IF NOT EXISTS `hs_hr_pay_period` (
  `id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `close_date` date NOT NULL,
  `check_date` date NOT NULL,
  `timesheet_aproval_due_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_province`
--

CREATE TABLE IF NOT EXISTS `hs_hr_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_name` varchar(40) NOT NULL DEFAULT '',
  `province_code` char(2) NOT NULL DEFAULT '',
  `cou_code` char(2) NOT NULL DEFAULT 'us',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `hs_hr_province`
--

INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES
(1, 'Alaska', 'AK', 'US'),
(2, 'Alabama', 'AL', 'US'),
(3, 'American Samoa', 'AS', 'US'),
(4, 'Arizona', 'AZ', 'US'),
(5, 'Arkansas', 'AR', 'US'),
(6, 'California', 'CA', 'US'),
(7, 'Colorado', 'CO', 'US'),
(8, 'Connecticut', 'CT', 'US'),
(9, 'Delaware', 'DE', 'US'),
(10, 'District of Columbia', 'DC', 'US'),
(11, 'Federated States of Micronesia', 'FM', 'US'),
(12, 'Florida', 'FL', 'US'),
(13, 'Georgia', 'GA', 'US'),
(14, 'Guam', 'GU', 'US'),
(15, 'Hawaii', 'HI', 'US'),
(16, 'Idaho', 'ID', 'US'),
(17, 'Illinois', 'IL', 'US'),
(18, 'Indiana', 'IN', 'US'),
(19, 'Iowa', 'IA', 'US'),
(20, 'Kansas', 'KS', 'US'),
(21, 'Kentucky', 'KY', 'US'),
(22, 'Louisiana', 'LA', 'US'),
(23, 'Maine', 'ME', 'US'),
(24, 'Marshall Islands', 'MH', 'US'),
(25, 'Maryland', 'MD', 'US'),
(26, 'Massachusetts', 'MA', 'US'),
(27, 'Michigan', 'MI', 'US'),
(28, 'Minnesota', 'MN', 'US'),
(29, 'Mississippi', 'MS', 'US'),
(30, 'Missouri', 'MO', 'US'),
(31, 'Montana', 'MT', 'US'),
(32, 'Nebraska', 'NE', 'US'),
(33, 'Nevada', 'NV', 'US'),
(34, 'New Hampshire', 'NH', 'US'),
(35, 'New Jersey', 'NJ', 'US'),
(36, 'New Mexico', 'NM', 'US'),
(37, 'New York', 'NY', 'US'),
(38, 'North Carolina', 'NC', 'US'),
(39, 'North Dakota', 'ND', 'US'),
(40, 'Northern Mariana Islands', 'MP', 'US'),
(41, 'Ohio', 'OH', 'US'),
(42, 'Oklahoma', 'OK', 'US'),
(43, 'Oregon', 'OR', 'US'),
(44, 'Palau', 'PW', 'US'),
(45, 'Pennsylvania', 'PA', 'US'),
(46, 'Puerto Rico', 'PR', 'US'),
(47, 'Rhode Island', 'RI', 'US'),
(48, 'South Carolina', 'SC', 'US'),
(49, 'South Dakota', 'SD', 'US'),
(50, 'Tennessee', 'TN', 'US'),
(51, 'Texas', 'TX', 'US'),
(52, 'Utah', 'UT', 'US'),
(53, 'Vermont', 'VT', 'US'),
(54, 'Virgin Islands', 'VI', 'US'),
(55, 'Virginia', 'VA', 'US'),
(56, 'Washington', 'WA', 'US'),
(57, 'West Virginia', 'WV', 'US'),
(58, 'Wisconsin', 'WI', 'US'),
(59, 'Wyoming', 'WY', 'US'),
(60, 'Armed Forces Africa', 'AE', 'US'),
(61, 'Armed Forces Americas (except Canada)', 'AA', 'US'),
(62, 'Armed Forces Canada', 'AE', 'US'),
(63, 'Armed Forces Europe', 'AE', 'US'),
(64, 'Armed Forces Middle East', 'AE', 'US'),
(65, 'Armed Forces Pacific', 'AP', 'US');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_unique_id`
--

CREATE TABLE IF NOT EXISTS `hs_hr_unique_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_id` int(10) unsigned NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_field` (`table_name`,`field_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `hs_hr_unique_id`
--

INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES
(1, 11, 'hs_hr_employee', 'emp_number'),
(2, 6, 'hs_hr_module', 'mod_id'),
(3, 0, 'hs_hr_leave', 'leave_id'),
(4, 0, 'hs_hr_leavetype', 'leave_type_id'),
(5, 0, 'hs_hr_leave_requests', 'leave_request_id'),
(6, 0, 'hs_hr_custom_export', 'export_id'),
(7, 0, 'hs_hr_custom_import', 'import_id'),
(8, 0, 'hs_hr_pay_period', 'id'),
(9, 0, 'hs_hr_kpi', 'id'),
(10, 0, 'hs_hr_performance_review', 'id'),
(11, 2, 'ohrm_emp_reporting_method', 'reporting_method_id'),
(12, 0, 'ohrm_timesheet', 'timesheet_id'),
(13, 0, 'ohrm_timesheet_action_log', 'timesheet_action_log_id'),
(14, 0, 'ohrm_timesheet_item', 'timesheet_item_id'),
(15, 0, 'ohrm_attendance_record', 'id'),
(16, 0, 'ohrm_job_vacancy', 'id'),
(17, 0, 'ohrm_job_candidate', 'id'),
(18, 106, 'ohrm_workflow_state_machine', 'id'),
(19, 0, 'ohrm_job_candidate_attachment', 'id'),
(20, 0, 'ohrm_job_vacancy_attachment', 'id'),
(21, 0, 'ohrm_job_candidate_vacancy', 'id'),
(22, 0, 'ohrm_job_candidate_history', 'id'),
(23, 0, 'ohrm_job_interview', 'id');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_advanced_report`
--

CREATE TABLE IF NOT EXISTS `ohrm_advanced_report` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `definition` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_advanced_report`
--

INSERT INTO `ohrm_advanced_report` (`id`, `name`, `definition`) VALUES
(1, 'Leave Entitlements and Usage Report', '\n<report>\n    <settings>\n        <csv>\n            <include_group_header>1</include_group_header>\n            <include_header>1</include_header>\n        </csv>\n    </settings>\n<filter_fields>\n	<input_field type="text" name="empNumber" label="Employee Number"></input_field>\n	<input_field type="text" name="fromDate" label="From"></input_field>\n        <input_field type="text" name="toDate" label="To"></input_field>\n        <input_field type="text" name="asOfDate" label="AsOf"></input_field>\n</filter_fields> \n\n<sub_report type="sql" name="mainTable">       \n    <query>FROM ohrm_leave_type WHERE (deleted = 0) OR (SELECT count(l.id) FROM ohrm_leave l WHERE l.status = 3 AND l.leave_type_id = ohrm_leave_type.id) > 0 ORDER BY ohrm_leave_type.id</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n        <display_group name="leavetype" type="one" display="true">\n            <group_header></group_header>\n            <fields>\n                <field display="false">\n                    <field_name>ohrm_leave_type.id</field_name>\n                    <field_alias>leaveTypeId</field_alias>\n                    <display_name>Leave Type ID</display_name>\n                    <width>1</width>	\n                </field>   \n                <field display="false">\n                    <field_name>ohrm_leave_type.exclude_in_reports_if_no_entitlement</field_name>\n                    <field_alias>exclude_if_no_entitlement</field_alias>\n                    <display_name>Exclude</display_name>\n                    <width>1</width>	\n                </field>  \n                <field display="false">\n                    <field_name>ohrm_leave_type.deleted</field_name>\n                    <field_alias>leave_type_deleted</field_alias>\n                    <display_name>Leave Type Deleted</display_name>\n                    <width>1</width>	\n                </field>  \n                <field display="true">\n                    <field_name>ohrm_leave_type.name</field_name>\n                    <field_alias>leaveType</field_alias>\n                    <display_name>Leave Type</display_name>\n                    <width>160</width>	\n                </field>s                                                                                                     \n            </fields>\n        </display_group>\n    </display_groups> \n</sub_report>\n\n<sub_report type="sql" name="entitlementsTotal">\n                    <query>\n\nFROM (\nSELECT ohrm_leave_entitlement.id as id, \n       ohrm_leave_entitlement.leave_type_id as leave_type_id,\n       ohrm_leave_entitlement.no_of_days as no_of_days,\n       sum(IF(ohrm_leave.status = 2, ohrm_leave_leave_entitlement.length_days, 0)) AS scheduled,\n       sum(IF(ohrm_leave.status = 3, ohrm_leave_leave_entitlement.length_days, 0)) AS taken\n       \nFROM ohrm_leave_entitlement LEFT JOIN ohrm_leave_leave_entitlement ON\n    ohrm_leave_entitlement.id = ohrm_leave_leave_entitlement.entitlement_id\n    LEFT JOIN ohrm_leave ON ohrm_leave.id = ohrm_leave_leave_entitlement.leave_id AND \n    ( $X{&gt;,ohrm_leave.date,toDate} OR $X{&lt;,ohrm_leave.date,fromDate} )\n\nWHERE ohrm_leave_entitlement.deleted=0 AND $X{=,ohrm_leave_entitlement.emp_number,empNumber} AND \n    $X{IN,ohrm_leave_entitlement.leave_type_id,leaveTypeId} AND\n    (\n      ( $X{&lt;=,ohrm_leave_entitlement.from_date,fromDate} AND $X{&gt;=,ohrm_leave_entitlement.to_date,fromDate} ) OR\n      ( $X{&lt;=,ohrm_leave_entitlement.from_date,toDate} AND $X{&gt;=,ohrm_leave_entitlement.to_date,toDate} ) OR \n      ( $X{&gt;=,ohrm_leave_entitlement.from_date,fromDate} AND $X{&lt;=,ohrm_leave_entitlement.to_date,toDate} ) \n    )\n    \nGROUP BY ohrm_leave_entitlement.id\n) AS A\n\nGROUP BY A.leave_type_id\nORDER BY A.leave_type_id\n\n</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n            <display_group name="g2" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>A.leave_type_id</field_name>\n                        <field_alias>leaveTypeId</field_alias>\n                        <display_name>Leave Type ID</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(A.no_of_days) - sum(A.scheduled) - sum(A.taken)</field_name>\n                        <field_alias>entitlement_total</field_alias>\n                        <display_name>Leave Entitlements (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveEntitlements?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n\n<sub_report type="sql" name="pendingQuery">\n<query>\nFROM ohrm_leave_type LEFT JOIN \nohrm_leave ON ohrm_leave_type.id = ohrm_leave.leave_type_id AND\n$X{=,ohrm_leave.emp_number,empNumber} AND\nohrm_leave.status = 1 AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nWHERE\nohrm_leave_type.deleted = 0 AND\n$X{IN,ohrm_leave_type.id,leaveTypeId}\n\nGROUP BY ohrm_leave_type.id\nORDER BY ohrm_leave_type.id\n</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n            <display_group name="g6" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave_type.id</field_name>\n                        <field_alias>leaveTypeId</field_alias>\n                        <display_name>Leave Type ID</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>pending</field_alias>\n                        <display_name>Leave Pending Approval (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=1&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n    </sub_report>\n\n<sub_report type="sql" name="scheduledQuery">\n<query>\nFROM ohrm_leave_type LEFT JOIN \nohrm_leave ON ohrm_leave_type.id = ohrm_leave.leave_type_id AND\n$X{=,ohrm_leave.emp_number,empNumber} AND\nohrm_leave.status = 2 AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nWHERE\nohrm_leave_type.deleted = 0 AND\n$X{IN,ohrm_leave_type.id,leaveTypeId}\n\nGROUP BY ohrm_leave_type.id\nORDER BY ohrm_leave_type.id\n</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n            <display_group name="g5" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave_type.id</field_name>\n                        <field_alias>leaveTypeId</field_alias>\n                        <display_name>Leave Type ID</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>scheduled</field_alias>\n                        <display_name>Leave Scheduled (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=2&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n    </sub_report>\n\n<sub_report type="sql" name="takenQuery">\n<query>\nFROM ohrm_leave WHERE $X{=,emp_number,empNumber} AND\nstatus = 3 AND\n$X{IN,ohrm_leave.leave_type_id,leaveTypeId} AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nGROUP BY leave_type_id\nORDER BY ohrm_leave.leave_type_id\n</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n            <display_group name="g4" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave.leave_type_id</field_name>\n                        <field_alias>leaveTypeId</field_alias>\n                        <display_name>Leave Type ID</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>taken</field_alias>\n                        <display_name>Leave Taken (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=3&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n    </sub_report>\n\n<sub_report type="sql" name="unused">       \n    <query>FROM ohrm_leave_type WHERE deleted = 0 AND $X{IN,ohrm_leave_type.id,leaveTypeId} ORDER BY ohrm_leave_type.id</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n        <display_group name="unused" type="one" display="true">\n            <group_header></group_header>\n            <fields>\n                <field display="false">\n                    <field_name>ohrm_leave_type.id</field_name>\n                    <field_alias>leaveTypeId</field_alias>\n                    <display_name>Leave Type ID</display_name>\n                    <width>1</width>	\n                </field>   \n                <field display="true">\n                    <field_name>ohrm_leave_type.name</field_name>\n                    <field_alias>unused</field_alias>\n                    <display_name>Leave Balance (Days)</display_name>\n                    <width>160</width>	\n                    <align>right</align>\n                </field>                                                                                                     \n            </fields>\n        </display_group>\n    </display_groups> \n</sub_report>\n\n\n    <join>             \n        <join_by sub_report="mainTable" id="leaveTypeId"></join_by>              \n        <join_by sub_report="entitlementsTotal" id="leaveTypeId"></join_by> \n        <join_by sub_report="pendingQuery" id="leaveTypeId"></join_by>  \n        <join_by sub_report="scheduledQuery" id="leaveTypeId"></join_by>  \n        <join_by sub_report="takenQuery" id="leaveTypeId"></join_by>  \n        <join_by sub_report="unused" id="leaveTypeId"></join_by>  \n\n    </join>\n    <page_limit>100</page_limit>        \n</report>'),
(2, 'Leave Entitlements and Usage Report', '\n<report>\n    <settings>\n        <csv>\n            <include_group_header>1</include_group_header>\n            <include_header>1</include_header>\n        </csv>\n    </settings>\n<filter_fields>\n	<input_field type="text" name="leaveType" label="Leave Type"></input_field>\n	<input_field type="text" name="fromDate" label="From"></input_field>\n        <input_field type="text" name="toDate" label="To"></input_field>\n        <input_field type="text" name="asOfDate" label="AsOf"></input_field>\n        <input_field type="text" name="emp_numbers" label="employees"></input_field>\n        <input_field type="text" name="job_title" label="Job Title"></input_field>\n        <input_field type="text" name="location" label="Location"></input_field>\n        <input_field type="text" name="sub_unit" label="Sub Unit"></input_field>\n        <input_field type="text" name="terminated" label="Terminated"></input_field>\n</filter_fields> \n\n<sub_report type="sql" name="mainTable">       \n    <query>FROM hs_hr_employee \n    LEFT JOIN hs_hr_emp_locations ON hs_hr_employee.emp_number = hs_hr_emp_locations.emp_number\n    WHERE $X{IN,hs_hr_employee.emp_number,emp_numbers} \n    AND $X{=,hs_hr_employee.job_title_code,job_title}\n    AND $X{IN,hs_hr_employee.work_station,sub_unit}\n    AND $X{IN,hs_hr_emp_locations.location_id,location}\n    AND $X{IS NULL,hs_hr_employee.termination_id,terminated}\n    ORDER BY hs_hr_employee.emp_lastname</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n        <display_group name="personalDetails" type="one" display="true">\n            <group_header></group_header>\n            <fields>\n                <field display="false">\n                    <field_name>hs_hr_employee.emp_number</field_name>\n                    <field_alias>empNumber</field_alias>\n                    <display_name>Employee Number</display_name>\n                    <width>1</width>	\n                </field>                \n                <field display="false">\n                    <field_name>hs_hr_employee.termination_id</field_name>\n                    <field_alias>termination_id</field_alias>\n                    <display_name>Termination ID</display_name>\n                    <width>1</width>	\n                </field>   \n                <field display="true">\n                    <field_name>CONCAT(hs_hr_employee.emp_firstname, '' '', hs_hr_employee.emp_lastname)</field_name>\n                    <field_alias>employeeName</field_alias>\n                    <display_name>Employee</display_name>\n                    <width>150</width>\n                </field>                                                                                               \n            </fields>\n        </display_group>\n    </display_groups> \n</sub_report>\n\n<sub_report type="sql" name="entitlementsTotal">\n                    <query>\n\nFROM (\nSELECT ohrm_leave_entitlement.id as id, \n       ohrm_leave_entitlement.emp_number as emp_number,\n       ohrm_leave_entitlement.no_of_days as no_of_days,\n       sum(IF(ohrm_leave.status = 2, ohrm_leave_leave_entitlement.length_days, 0)) AS scheduled,\n       sum(IF(ohrm_leave.status = 3, ohrm_leave_leave_entitlement.length_days, 0)) AS taken\n       \nFROM ohrm_leave_entitlement LEFT JOIN ohrm_leave_leave_entitlement ON\n    ohrm_leave_entitlement.id = ohrm_leave_leave_entitlement.entitlement_id\n    LEFT JOIN ohrm_leave ON ohrm_leave.id = ohrm_leave_leave_entitlement.leave_id AND \n    ( $X{&gt;,ohrm_leave.date,toDate} OR $X{&lt;,ohrm_leave.date,fromDate} )\n\nWHERE ohrm_leave_entitlement.deleted=0 AND $X{=,ohrm_leave_entitlement.leave_type_id,leaveType}\n    AND $X{IN,ohrm_leave_entitlement.emp_number,empNumber} AND\n    (\n      ( $X{&lt;=,ohrm_leave_entitlement.from_date,fromDate} AND $X{&gt;=,ohrm_leave_entitlement.to_date,fromDate} ) OR\n      ( $X{&lt;=,ohrm_leave_entitlement.from_date,toDate} AND $X{&gt;=,ohrm_leave_entitlement.to_date,toDate} ) OR \n      ( $X{&gt;=,ohrm_leave_entitlement.from_date,fromDate} AND $X{&lt;=,ohrm_leave_entitlement.to_date,toDate} ) \n    )\n    \nGROUP BY ohrm_leave_entitlement.id\n) AS A\n\nGROUP BY A.emp_number\nORDER BY A.emp_number\n\n</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n            <display_group name="g2" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>A.emp_number</field_name>\n                        <field_alias>empNumber</field_alias>\n                        <display_name>Emp Number</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(A.no_of_days) - sum(A.scheduled) - sum(A.taken)</field_name>\n                        <field_alias>entitlement_total</field_alias>\n                        <display_name>Leave Entitlements (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveEntitlements?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n\n<sub_report type="sql" name="pendingQuery">\n<query>\nFROM ohrm_leave WHERE $X{=,ohrm_leave.leave_type_id,leaveType} AND\nstatus = 1 AND\n$X{IN,ohrm_leave.emp_number,empNumber} AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nGROUP BY emp_number\nORDER BY ohrm_leave.emp_number\n</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n            <display_group name="g6" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave.emp_number</field_name>\n                        <field_alias>empNumber</field_alias>\n                        <display_name>Emp Number</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>pending</field_alias>\n                        <display_name>Leave Pending Approval (Days)</display_name>\n                        <width>121</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=1&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n\n\n<sub_report type="sql" name="scheduledQuery">\n<query>\nFROM ohrm_leave WHERE $X{=,ohrm_leave.leave_type_id,leaveType} AND\nstatus = 2 AND\n$X{IN,ohrm_leave.emp_number,empNumber} AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nGROUP BY emp_number\nORDER BY ohrm_leave.emp_number\n</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n            <display_group name="g5" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave.emp_number</field_name>\n                        <field_alias>empNumber</field_alias>\n                        <display_name>Emp Number</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>scheduled</field_alias>\n                        <display_name>Leave Scheduled (Days)</display_name>\n                        <width>121</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=2&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n\n<sub_report type="sql" name="takenQuery">\n<query>\nFROM ohrm_leave WHERE $X{=,ohrm_leave.leave_type_id,leaveType} AND\nstatus = 3 AND\n$X{IN,ohrm_leave.emp_number,empNumber} AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nGROUP BY emp_number\nORDER BY ohrm_leave.emp_number\n</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n            <display_group name="g4" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave.emp_number</field_name>\n                        <field_alias>empNumber</field_alias>\n                        <display_name>Emp Number</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>taken</field_alias>\n                        <display_name>Leave Taken (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=3&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n<sub_report type="sql" name="unused">       \n    <query>FROM hs_hr_employee WHERE $X{IN,hs_hr_employee.emp_number,empNumber} ORDER BY hs_hr_employee.emp_number</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n        <display_group name="unused" type="one" display="true">\n            <group_header></group_header>\n            <fields>    \n                <field display="false">\n                    <field_name>hs_hr_employee.emp_number</field_name>\n                    <field_alias>empNumber</field_alias>\n                    <display_name>Employee Number</display_name>\n                    <width>1</width>	\n                </field>                \n                <field display="true">\n                    <field_name>hs_hr_employee.emp_firstname</field_name>\n                    <field_alias>unused</field_alias>\n                    <display_name>Leave Balance (Days)</display_name>\n                    <width>150</width>\n                    <align>right</align>\n                </field> \n                                                                                               \n            </fields>\n        </display_group>\n    </display_groups> \n</sub_report>\n    <join>             \n        <join_by sub_report="mainTable" id="empNumber"></join_by>            \n        <join_by sub_report="entitlementsTotal" id="empNumber"></join_by> \n        <join_by sub_report="pendingQuery" id="empNumber"></join_by>\n        <join_by sub_report="scheduledQuery" id="empNumber"></join_by>\n        <join_by sub_report="takenQuery" id="empNumber"></join_by> \n        <join_by sub_report="unused" id="empNumber"></join_by>  \n    </join>\n    <page_limit>20</page_limit>       \n</report>');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_attendance_record`
--

CREATE TABLE IF NOT EXISTS `ohrm_attendance_record` (
  `id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `punch_in_utc_time` datetime DEFAULT NULL,
  `punch_in_note` varchar(255) DEFAULT NULL,
  `punch_in_time_offset` varchar(255) DEFAULT NULL,
  `punch_in_user_time` datetime DEFAULT NULL,
  `punch_out_utc_time` datetime DEFAULT NULL,
  `punch_out_note` varchar(255) DEFAULT NULL,
  `punch_out_time_offset` varchar(255) DEFAULT NULL,
  `punch_out_user_time` datetime DEFAULT NULL,
  `state` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_id_state` (`employee_id`,`state`),
  KEY `emp_id_time` (`employee_id`,`punch_in_utc_time`,`punch_out_utc_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_auth_provider_extra_details`
--

CREATE TABLE IF NOT EXISTS `ohrm_auth_provider_extra_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(10) NOT NULL,
  `provider_type` int(11) DEFAULT NULL,
  `client_id` text,
  `client_secret` text,
  `developer_key` text,
  PRIMARY KEY (`id`),
  KEY `provider_id` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_available_group_field`
--

CREATE TABLE IF NOT EXISTS `ohrm_available_group_field` (
  `report_group_id` bigint(20) NOT NULL,
  `group_field_id` bigint(20) NOT NULL,
  PRIMARY KEY (`report_group_id`,`group_field_id`),
  KEY `report_group_id` (`report_group_id`),
  KEY `group_field_id` (`group_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_beacon_notification`
--

CREATE TABLE IF NOT EXISTS `ohrm_beacon_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `expiry_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `definition` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_composite_display_field`
--

CREATE TABLE IF NOT EXISTS `ohrm_composite_display_field` (
  `composite_display_field_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `label` varchar(255) NOT NULL,
  `field_alias` varchar(255) DEFAULT NULL,
  `is_sortable` varchar(10) NOT NULL,
  `sort_order` varchar(255) DEFAULT NULL,
  `sort_field` varchar(255) DEFAULT NULL,
  `element_type` varchar(255) NOT NULL,
  `element_property` varchar(1000) NOT NULL,
  `width` varchar(255) NOT NULL,
  `is_exportable` varchar(10) DEFAULT NULL,
  `text_alignment_style` varchar(20) DEFAULT NULL,
  `is_value_list` tinyint(1) NOT NULL DEFAULT '0',
  `display_field_group_id` int(10) unsigned DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `is_encrypted` tinyint(1) NOT NULL DEFAULT '0',
  `is_meta` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`composite_display_field_id`),
  KEY `report_group_id` (`report_group_id`),
  KEY `display_field_group_id` (`display_field_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ohrm_composite_display_field`
--

INSERT INTO `ohrm_composite_display_field` (`composite_display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES
(1, 1, 'IF(hs_hr_employee.termination_id IS NULL, CONCAT(hs_hr_employee.emp_firstname, " " ,hs_hr_employee.emp_lastname), CONCAT(hs_hr_employee.emp_firstname, " " ,hs_hr_employee.emp_lastname, " (Past Employee)"))', 'Employee Name', 'employeeName', 'false', NULL, NULL, 'label', '<xml><getter>employeeName</getter></xml>', '300', '0', NULL, 0, NULL, 'Deleted Employee', 0, 0),
(2, 1, 'CONCAT(ohrm_customer.name, " - " ,ohrm_project.name)', 'Project Name', 'projectname', 'false', NULL, NULL, 'label', '<xml><getter>projectname</getter></xml>', '300', '0', NULL, 0, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_customer`
--

CREATE TABLE IF NOT EXISTS `ohrm_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_datapoint`
--

CREATE TABLE IF NOT EXISTS `ohrm_datapoint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `datapoint_type_id` int(11) NOT NULL,
  `definition` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `datapoint_type_id` (`datapoint_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_datapoint_type`
--

CREATE TABLE IF NOT EXISTS `ohrm_datapoint_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `action_class` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ohrm_datapoint_type`
--

INSERT INTO `ohrm_datapoint_type` (`id`, `name`, `action_class`) VALUES
(1, 'config', 'configDatapointProcessor'),
(2, 'count', 'countDatapointProcessor'),
(3, 'session', 'sessionDatapointProcessor'),
(4, 'organization', 'OrganizationDataProcessor');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_data_group`
--

CREATE TABLE IF NOT EXISTS `ohrm_data_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `can_read` tinyint(4) DEFAULT NULL,
  `can_create` tinyint(4) DEFAULT NULL,
  `can_update` tinyint(4) DEFAULT NULL,
  `can_delete` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `ohrm_data_group`
--

INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES
(1, 'personal_information', 'PIM - Personal Details', 1, NULL, 1, NULL),
(2, 'personal_attachment', 'PIM - Personal Details - Attachments', 1, 1, 1, 1),
(3, 'personal_custom_fields', 'PIM - Personal Details - Custom Fields', 1, NULL, 1, NULL),
(4, 'contact_details', 'PIM - Contact Details', 1, NULL, 1, NULL),
(5, 'contact_attachment', 'PIM - Contact Details - Attachments', 1, 1, 1, 1),
(6, 'contact_custom_fields', 'PIM - Contact Details - Custom Fields', 1, NULL, 1, NULL),
(7, 'emergency_contacts', 'PIM - Emergency Contacts', 1, 1, 1, 1),
(8, 'emergency_attachment', 'PIM - Emergency Contacts - Attachments', 1, 1, 1, 1),
(9, 'emergency_custom_fields', 'PIM - Emergency Contacts - Custom Fields', 1, NULL, 1, NULL),
(10, 'dependents', 'PIM - Dependents', 1, 1, 1, 1),
(11, 'dependents_attachment', 'PIM - Dependents - Attachments', 1, 1, 1, 1),
(12, 'dependents_custom_fields', 'PIM - Dependents - Custom Fields', 1, NULL, 1, NULL),
(13, 'immigration', 'PIM - Immigration', 1, 1, 1, 1),
(14, 'immigration_attachment', 'PIM - Immigration - Attachments', 1, 1, 1, 1),
(15, 'immigration_custom_fields', 'PIM - Immigration - Custom Fields', 1, NULL, 1, NULL),
(16, 'job_details', 'PIM - Job', 1, NULL, 1, NULL),
(17, 'job_attachment', 'PIM - Job - Attachments', 1, 1, 1, 1),
(18, 'job_custom_fields', 'PIM - Job - Custom Fields', 1, NULL, 1, NULL),
(19, 'salary_details', 'PIM - Salary', 1, 1, 1, 1),
(20, 'salary_attachment', 'PIM - Salary - Attachments', 1, 1, 1, 1),
(21, 'salary_custom_fields', 'PIM - Salary - Custom Fields', 1, NULL, 1, NULL),
(22, 'tax_exemptions', 'PIM - Tax Exemptions', 1, NULL, 1, NULL),
(23, 'tax_attachment', 'PIM - Tax Exemptions - Attachments', 1, 1, 1, 1),
(24, 'tax_custom_fields', 'PIM - Tax Exemptions - Custom Fields', 1, NULL, 1, NULL),
(25, 'supervisor', 'PIM - Employee Supervisors', 1, 1, 1, 1),
(26, 'subordinates', 'PIM - Employee Subordinates', 1, 1, 1, 1),
(27, 'report-to_attachment', 'PIM - Employee Supervisors/Subordinates - Attachment', 1, 1, 1, 1),
(28, 'report-to_custom_fields', 'PIM - Employee Supervisors/Subordinates - Custom Fields', 1, NULL, 1, NULL),
(29, 'qualification_work', 'PIM - Qualifications - Work Experience', 1, 1, 1, 1),
(30, 'qualification_education', 'PIM - Qualifications - Education', 1, 1, 1, 1),
(31, 'qualification_skills', 'PIM - Qualifications - Skills', 1, 1, 1, 1),
(32, 'qualification_languages', 'PIM - Qualifications - Languages', 1, 1, 1, 1),
(33, 'qualification_license', 'PIM - Qualifications - License', 1, 1, 1, 1),
(34, 'qualifications_attachment', 'PIM - Qualifications - Attachments', 1, 1, 1, 1),
(35, 'qualifications_custom_fields', 'PIM - Qualifications - Custom Fields', 1, NULL, 1, NULL),
(36, 'membership', 'PIM - Membership', 1, 1, 1, 1),
(37, 'membership_attachment', 'PIM - Membership - Attachments', 1, 1, 1, 1),
(38, 'membership_custom_fields', 'PIM - Membership - Custom Fields', 1, NULL, 1, NULL),
(39, 'photograph', 'PIM - Employee Photograph', 1, NULL, 1, 1),
(40, 'leave_entitlements', 'Leave - Leave Entitlements', 1, 1, 1, 1),
(41, 'leave_entitlements_usage_report', 'Leave - Leave Entitlements and Usage Report', 1, NULL, NULL, NULL),
(42, 'job_titles', 'Admin - Job Titles', 1, 1, 1, 1),
(43, 'pay_grades', 'Admin - Pay Grades', 1, 1, 1, 1),
(44, 'time_customers', 'Time - Project Info - Customers', 1, 1, 1, 1),
(45, 'time_projects', 'Time - Project Info - Projects', 1, 1, 1, 1),
(46, 'pim_reports', 'PIM - Reports', 1, 1, 1, 1),
(47, 'attendance_configuration', 'Time - Attendance Configuration', 1, 0, 1, 0),
(48, 'attendance_records', 'Time - Attendance Records', 1, 0, 0, 0),
(49, 'time_project_reports', 'Time - Project Reports', 1, 0, 0, 0),
(50, 'time_employee_reports', 'Time - Employee Reports', 1, 0, 0, 0),
(51, 'attendance_summary', 'Time - Attendance Summary', 1, 0, 0, 0),
(52, 'leave_period', 'Leave - Leave Period', 1, 0, 1, 0),
(53, 'leave_types', 'Leave - Leave Types', 1, 1, 1, 1),
(54, 'work_week', 'Leave - Work Week', 1, 0, 1, 0),
(55, 'holidays', 'Leave - Holidays', 1, 1, 1, 1),
(56, 'recruitment_vacancies', 'Recruitment - Vacancies', 1, 1, 1, 1),
(57, 'recruitment_candidates', 'Recruitment - Candidates', 1, 1, 1, 1),
(58, 'time_employee_timesheets', 'Time - Employee Timesheets', 1, 0, 0, 0),
(59, 'leave_list', 'Leave - Leave List', 1, 0, 0, 0),
(60, 'leave_list_comments', 'Leave - Leave List - Comments', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_data_group_screen`
--

CREATE TABLE IF NOT EXISTS `ohrm_data_group_screen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_group_id` int(11) DEFAULT NULL,
  `screen_id` int(11) DEFAULT NULL,
  `permission` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data_group_id` (`data_group_id`),
  KEY `screen_id` (`screen_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=76 ;

--
-- Dumping data for table `ohrm_data_group_screen`
--

INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES
(1, 40, 69, 1),
(2, 40, 72, 2),
(3, 40, 73, 3),
(4, 40, 71, 4),
(5, 41, 78, 1),
(6, 42, 23, 1),
(7, 42, 80, 1),
(8, 42, 80, 2),
(9, 42, 80, 3),
(10, 42, 81, 4),
(11, 43, 24, 1),
(12, 43, 82, 1),
(13, 43, 82, 2),
(14, 43, 82, 3),
(15, 43, 83, 4),
(16, 43, 84, 3),
(17, 43, 85, 3),
(18, 42, 74, 1),
(19, 43, 74, 1),
(20, 44, 36, 1),
(21, 44, 86, 2),
(22, 44, 86, 3),
(23, 44, 87, 4),
(24, 45, 37, 1),
(25, 45, 88, 1),
(26, 45, 88, 2),
(27, 45, 88, 3),
(28, 45, 89, 4),
(29, 45, 90, 2),
(30, 45, 90, 3),
(31, 45, 91, 2),
(32, 45, 91, 3),
(33, 46, 45, 1),
(34, 46, 45, 4),
(35, 46, 92, 2),
(36, 46, 92, 3),
(37, 46, 93, 1),
(38, 47, 56, 1),
(39, 47, 56, 3),
(40, 48, 55, 1),
(41, 49, 57, 1),
(42, 49, 102, 1),
(43, 50, 58, 1),
(44, 51, 59, 1),
(45, 51, 101, 1),
(46, 52, 47, 1),
(47, 52, 47, 3),
(48, 53, 7, 1),
(49, 53, 8, 1),
(50, 53, 8, 2),
(51, 53, 8, 3),
(52, 53, 9, 2),
(53, 53, 10, 4),
(54, 54, 14, 1),
(55, 54, 14, 3),
(56, 55, 11, 1),
(57, 55, 12, 2),
(58, 55, 12, 3),
(59, 55, 13, 4),
(60, 56, 61, 1),
(61, 56, 94, 1),
(62, 56, 94, 2),
(63, 56, 94, 3),
(64, 56, 95, 4),
(65, 57, 60, 1),
(66, 57, 96, 1),
(67, 57, 96, 2),
(68, 57, 96, 3),
(69, 57, 97, 4),
(70, 56, 76, 1),
(71, 57, 76, 1),
(72, 58, 52, 1),
(73, 59, 16, 1),
(74, 59, 98, 1),
(75, 59, 99, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_display_field`
--

CREATE TABLE IF NOT EXISTS `ohrm_display_field` (
  `display_field_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `field_alias` varchar(255) DEFAULT NULL,
  `is_sortable` varchar(10) NOT NULL,
  `sort_order` varchar(255) DEFAULT NULL,
  `sort_field` varchar(255) DEFAULT NULL,
  `element_type` varchar(255) NOT NULL,
  `element_property` varchar(1000) NOT NULL,
  `width` varchar(255) NOT NULL,
  `is_exportable` varchar(10) DEFAULT NULL,
  `text_alignment_style` varchar(20) DEFAULT NULL,
  `is_value_list` tinyint(1) NOT NULL DEFAULT '0',
  `display_field_group_id` int(10) unsigned DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `is_encrypted` tinyint(1) NOT NULL DEFAULT '0',
  `is_meta` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`display_field_id`),
  KEY `report_group_id` (`report_group_id`),
  KEY `display_field_group_id` (`display_field_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=121 ;

--
-- Dumping data for table `ohrm_display_field`
--

INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES
(1, 1, 'ohrm_project.name', 'Project Name', 'projectname', 'false', NULL, NULL, 'label', '<xml><getter>projectname</getter></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0),
(2, 1, 'ohrm_project_activity.name', 'Activity Name', 'activityname', 'false', NULL, NULL, 'link', '<xml><labelGetter>activityname</labelGetter><placeholderGetters><id>activity_id</id><total>totalduration</total><projectId>projectId</projectId><from>fromDate</from><to>toDate</to><approved>onlyIncludeApprovedTimesheets</approved></placeholderGetters><urlPattern>../../displayProjectActivityDetailsReport?reportId=3#activityId={id}#total={total}#from={from}#to={to}#projectId={projectId}#onlyIncludeApprovedTimesheets={approved}</urlPattern></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0),
(3, 1, 'ohrm_project_activity.project_id', 'Project Id', NULL, 'false', NULL, NULL, 'label', '<xml><getter>project_id</getter></xml>', '75', '0', 'right', 0, NULL, NULL, 0, 1),
(4, 1, 'ohrm_project_activity.activity_id', 'Activity Id', NULL, 'false', NULL, NULL, 'label', '<xml><getter>activity_id</getter></xml>', '75', '0', 'right', 0, NULL, NULL, 0, 1),
(5, 1, 'ohrm_timesheet_item.duration', 'Time (hours)', NULL, 'false', NULL, NULL, 'label', '<xml><getter>duration</getter></xml>', '75', '0', 'right', 0, NULL, NULL, 0, 0),
(6, 1, 'hs_hr_employee.emp_firstname', 'Employee First Name', NULL, 'false', NULL, NULL, 'label', '<xml><getter>emp_firstname</getter></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0),
(7, 1, 'hs_hr_employee.emp_lastname', 'Employee Last Name', NULL, 'false', NULL, NULL, 'label', '<xml><getter>emp_lastname</getter></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0),
(8, 1, 'ohrm_project_activity.name', 'Activity Name', 'activityname', 'false', NULL, NULL, 'label', '<xml><getter>activityname</getter></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0),
(9, 3, 'hs_hr_employee.employee_id', 'Employee Id', 'employeeId', 'false', NULL, NULL, 'label', '<xml><getter>employeeId</getter></xml>', '100', '0', NULL, 0, 1, '---', 0, 0),
(10, 3, 'hs_hr_employee.emp_lastname', 'Employee Last Name', 'employeeLastname', 'false', NULL, NULL, 'label', '<xml><getter>employeeLastname</getter></xml>', '200', '0', NULL, 0, 1, '---', 0, 0),
(11, 3, 'hs_hr_employee.emp_firstname', 'Employee First Name', 'employeeFirstname', 'false', NULL, NULL, 'label', '<xml><getter>employeeFirstname</getter></xml>', '200', '0', NULL, 0, 1, '---', 0, 0),
(12, 3, 'hs_hr_employee.emp_middle_name', 'Employee Middle Name', 'employeeMiddlename', 'false', NULL, NULL, 'label', '<xml><getter>employeeMiddlename</getter></xml>', '200', '0', NULL, 0, 1, '---', 0, 0),
(13, 3, 'hs_hr_employee.emp_birthday', 'Date of Birth', 'empBirthday', 'false', NULL, NULL, 'labelDate', '<xml><getter>empBirthday</getter></xml>', '100', '0', NULL, 0, 1, '---', 0, 0),
(14, 3, 'ohrm_nationality.name', 'Nationality', 'nationality', 'false', NULL, NULL, 'label', '<xml><getter>nationality</getter></xml>', '200', '0', NULL, 0, 1, '---', 0, 0),
(15, 3, 'CASE hs_hr_employee.emp_gender WHEN 1 THEN "Male" WHEN 2 THEN "Female" WHEN 3 THEN "Other" END', 'Gender', 'empGender', 'false', NULL, NULL, 'label', '<xml><getter>empGender</getter></xml>', '80', '0', NULL, 0, 1, '---', 0, 0),
(17, 3, 'hs_hr_employee.emp_marital_status', 'Marital Status', 'maritalStatus', 'false', NULL, NULL, 'label', '<xml><getter>maritalStatus</getter></xml>', '100', '0', NULL, 0, 1, '---', 0, 0),
(18, 3, 'hs_hr_employee.emp_dri_lice_num', 'Driver License Number', 'driversLicenseNumber', 'false', NULL, NULL, 'label', '<xml><getter>driversLicenseNumber</getter></xml>', '240', '0', NULL, 0, 1, '---', 0, 0),
(19, 3, 'hs_hr_employee.emp_dri_lice_exp_date', 'License Expiry Date', 'licenseExpiryDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>licenseExpiryDate</getter></xml>', '135', '0', NULL, 0, 1, '---', 0, 0),
(20, 3, 'CONCAT_WS(", ", NULLIF(hs_hr_employee.emp_street1, ""), NULLIF(hs_hr_employee.emp_street2, ""), NULLIF(hs_hr_employee.city_code, ""), NULLIF(hs_hr_employee.provin_code,""), NULLIF(hs_hr_employee.emp_zipcode,""), NULLIF(hs_hr_country.cou_name,""))', 'Address', 'address', 'false', NULL, NULL, 'label', '<xml><getter>address</getter></xml>', '200', '0', NULL, 0, 2, '---', 0, 0),
(21, 3, 'hs_hr_employee.emp_hm_telephone', 'Home Telephone', 'homeTelephone', 'false', NULL, NULL, 'label', '<xml><getter>homeTelephone</getter></xml>', '130', '0', NULL, 0, 2, '---', 0, 0),
(22, 3, 'hs_hr_employee.emp_mobile', 'Mobile', 'mobile', 'false', NULL, NULL, 'label', '<xml><getter>mobile</getter></xml>', '100', '0', NULL, 0, 2, '---', 0, 0),
(23, 3, 'hs_hr_employee.emp_work_telephone', 'Work Telephone', 'workTelephone', 'false', NULL, NULL, 'label', '<xml><getter>workTelephone</getter></xml>', '100', '0', NULL, 0, 2, '---', 0, 0),
(24, 3, 'hs_hr_employee.emp_work_email', 'Work Email', 'workEmail', 'false', NULL, NULL, 'label', '<xml><getter>workEmail</getter></xml>', '200', '0', NULL, 0, 2, '---', 0, 0),
(25, 3, 'hs_hr_employee.emp_oth_email', 'Other Email', 'otherEmail', 'false', NULL, NULL, 'label', '<xml><getter>otherEmail</getter></xml>', '200', '0', NULL, 0, 2, '---', 0, 0),
(26, 3, 'hs_hr_emp_emergency_contacts.eec_name', 'Name', 'ecname', 'false', NULL, NULL, 'label', '<xml><getter>ecname</getter></xml>', '200', '0', NULL, 1, 3, '---', 0, 0),
(27, 3, 'hs_hr_emp_emergency_contacts.eec_home_no', 'Home Telephone', 'ecHomeTelephone', 'false', NULL, NULL, 'label', '<xml><getter>ecHomeTelephone</getter></xml>', '130', '0', NULL, 1, 3, '---', 0, 0),
(28, 3, 'hs_hr_emp_emergency_contacts.eec_office_no', 'Work Telephone', 'ecWorkTelephone', 'false', NULL, NULL, 'label', '<xml><getter>ecWorkTelephone</getter></xml>', '100', '0', NULL, 1, 3, '---', 0, 0),
(29, 3, 'hs_hr_emp_emergency_contacts.eec_relationship', 'Relationship', 'ecRelationship', 'false', NULL, NULL, 'label', '<xml><getter>ecRelationship</getter></xml>', '200', '0', NULL, 1, 3, '---', 0, 0),
(30, 3, 'hs_hr_emp_emergency_contacts.eec_mobile_no', 'Mobile', 'ecMobile', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 3, '---', 0, 0),
(31, 3, 'hs_hr_emp_dependents.ed_name', 'Name', 'dependentName', 'false', NULL, NULL, 'label', '<xml><getter>dependentName</getter></xml>', '200', '0', NULL, 1, 4, '---', 0, 0),
(32, 3, 'IF (hs_hr_emp_dependents.ed_relationship_type = ''other'', hs_hr_emp_dependents.ed_relationship, hs_hr_emp_dependents.ed_relationship_type)', 'Relationship', 'dependentRelationship', 'false', NULL, NULL, 'label', '<xml><getter>dependentRelationship</getter></xml>', '200', '0', NULL, 1, 4, '---', 0, 0),
(33, 3, 'hs_hr_emp_dependents.ed_date_of_birth', 'Date of Birth', 'dependentDateofBirth', 'false', NULL, NULL, 'labelDate', '<xml><getter>dependentDateofBirth</getter></xml>', '100', '0', NULL, 1, 4, '---', 0, 0),
(35, 3, 'ohrm_membership.name', 'Membership', 'name', 'false', NULL, NULL, 'label', '<xml><getter>name</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(36, 3, 'hs_hr_emp_member_detail.ememb_subscript_ownership', 'Subscription Paid By', 'subscriptionPaidBy', 'false', NULL, NULL, 'label', '<xml><getter>subscriptionPaidBy</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(37, 3, 'hs_hr_emp_member_detail.ememb_subscript_amount', 'Subscription Amount', 'subscriptionAmount', 'false', NULL, NULL, 'label', '<xml><getter>subscriptionAmount</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(38, 3, 'hs_hr_emp_member_detail.ememb_subs_currency', 'Currency', 'membershipCurrency', 'false', NULL, NULL, 'label', '<xml><getter>membershipCurrency</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(39, 3, 'hs_hr_emp_member_detail.ememb_commence_date', 'Subscription Commence Date', 'subscriptionCommenceDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>subscriptionCommenceDate</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(40, 3, 'hs_hr_emp_member_detail.ememb_renewal_date', 'Subscription Renewal Date', 'subscriptionRenewalDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>subscriptionRenewalDate</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(41, 3, 'hs_hr_emp_work_experience.eexp_employer', 'Company', 'expCompany', 'false', NULL, NULL, 'label', '<xml><getter>expCompany</getter></xml>', '200', '0', NULL, 1, 10, '---', 0, 0),
(42, 3, 'hs_hr_emp_work_experience.eexp_jobtit', 'Job Title', 'expJobTitle', 'false', NULL, NULL, 'label', '<xml><getter>expJobTitle</getter></xml>', '200', '0', NULL, 1, 10, '---', 0, 0),
(43, 3, 'hs_hr_emp_work_experience.eexp_from_date', 'From', 'expFrom', 'false', NULL, NULL, 'labelDate', '<xml><getter>expFrom</getter></xml>', '100', '0', NULL, 1, 10, '---', 0, 0),
(44, 3, 'hs_hr_emp_work_experience.eexp_to_date', 'To', 'expTo', 'false', NULL, NULL, 'labelDate', '<xml><getter>expTo</getter></xml>', '100', '0', NULL, 1, 10, '---', 0, 0),
(45, 3, 'hs_hr_emp_work_experience.eexp_comments', 'Comment', 'expComment', 'false', NULL, NULL, 'label', '<xml><getter>expComment</getter></xml>', '200', '0', NULL, 1, 10, '---', 0, 0),
(47, 3, 'ohrm_education.name', 'Level', 'eduProgram', 'false', NULL, NULL, 'label', '<xml><getter>eduProgram</getter></xml>', '200', '0', NULL, 1, 11, '---', 0, 0),
(48, 3, 'ohrm_emp_education.year', 'Year', 'eduYear', 'false', NULL, NULL, 'label', '<xml><getter>eduYear</getter></xml>', '100', '0', NULL, 1, 11, '---', 0, 0),
(49, 3, 'ohrm_emp_education.score', 'Score', 'eduGPAOrScore', 'false', NULL, NULL, 'label', '<xml><getter>eduGPAOrScore</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0),
(52, 3, 'ohrm_skill.name', 'Skill', 'skill', 'false', NULL, NULL, 'label', '<xml><getter>skill</getter></xml>', '200', '0', NULL, 1, 12, '---', 0, 0),
(53, 3, 'hs_hr_emp_skill.years_of_exp', 'Years of Experience', 'skillYearsOfExperience', 'false', NULL, NULL, 'label', '<xml><getter>skillYearsOfExperience</getter></xml>', '135', '0', NULL, 1, 12, '---', 0, 0),
(54, 3, 'hs_hr_emp_skill.comments', 'Comments', 'skillComments', 'false', NULL, NULL, 'label', '<xml><getter>skillComments</getter></xml>', '200', '0', NULL, 1, 12, '---', 0, 0),
(55, 3, 'ohrm_language.name', 'Language', 'langName', 'false', NULL, NULL, 'label', '<xml><getter>langName</getter></xml>', '200', '0', NULL, 1, 13, '---', 0, 0),
(57, 3, 'CASE hs_hr_emp_language.competency WHEN 1 THEN "Poor" WHEN 2 THEN "Basic" WHEN 3 THEN "Good" WHEN 4 THEN "Mother Tongue" END', 'Competency', 'langCompetency', 'false', NULL, NULL, 'label', '<xml><getter>langCompetency</getter></xml>', '130', '0', NULL, 1, 13, '---', 0, 0),
(58, 3, 'hs_hr_emp_language.comments', 'Comments', 'langComments', 'false', NULL, NULL, 'label', '<xml><getter>langComments</getter></xml>', '200', '0', NULL, 1, 13, '---', 0, 0),
(59, 3, 'ohrm_license.name', 'License Type', 'empLicenseType', 'false', NULL, NULL, 'label', '<xml><getter>empLicenseType</getter></xml>', '200', '0', NULL, 1, 14, '---', 0, 0),
(60, 3, 'ohrm_emp_license.license_issued_date', 'Issued Date', 'empLicenseIssuedDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empLicenseIssuedDate</getter></xml>', '100', '0', NULL, 1, 14, '---', 0, 0),
(61, 3, 'ohrm_emp_license.license_expiry_date', 'Expiry Date', 'empLicenseExpiryDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empLicenseExpiryDate</getter></xml>', '100', '0', NULL, 1, 14, '---', 0, 0),
(62, 3, 'supervisor.emp_firstname', 'First Name', 'supervisorFirstName', 'false', NULL, NULL, 'label', '<xml><getter>supervisorFirstName</getter></xml>', '200', '0', NULL, 1, 9, '---', 0, 0),
(63, 3, 'subordinate.emp_firstname', 'First Name', 'subordinateFirstName', 'false', NULL, NULL, 'label', '<xml><getter>subordinateFirstName</getter></xml>', '200', '0', NULL, 1, 8, '---', 0, 0),
(64, 3, 'supervisor.emp_lastname', 'Last Name', 'supervisorLastName', 'false', NULL, NULL, 'label', '<xml><getter>supervisorLastName</getter></xml>', '200', '0', NULL, 1, 9, '---', 0, 0),
(65, 3, 'ohrm_pay_grade.name', 'Pay Grade', 'salPayGrade', 'false', NULL, NULL, 'label', '<xml><getter>salPayGrade</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(66, 3, 'hs_hr_emp_basicsalary.salary_component', 'Salary Component', 'salSalaryComponent', 'false', NULL, NULL, 'label', '<xml><getter>salSalaryComponent</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(67, 3, 'hs_hr_emp_basicsalary.ebsal_basic_salary', 'Amount', 'salAmount', 'false', NULL, NULL, 'label', '<xml><getter>salAmount</getter></xml>', '200', '0', NULL, 1, 7, '---', 1, 0),
(68, 3, 'hs_hr_emp_basicsalary.comments', 'Comments', 'salComments', 'false', NULL, NULL, 'label', '<xml><getter>salComments</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(69, 3, 'hs_hr_payperiod.payperiod_name', 'Pay Frequency', 'salPayFrequency', 'false', NULL, NULL, 'label', '<xml><getter>salPayFrequency</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(70, 3, 'hs_hr_currency_type.currency_name', 'Currency', 'salCurrency', 'false', NULL, NULL, 'label', '<xml><getter>salCurrency</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(71, 3, 'hs_hr_emp_directdebit.dd_account', 'Direct Deposit Account Number', 'ddAccountNumber', 'false', NULL, NULL, 'label', '<xml><getter>ddAccountNumber</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(72, 3, 'hs_hr_emp_directdebit.dd_account_type', 'Direct Deposit Account Type', 'ddAccountType', 'false', NULL, NULL, 'label', '<xml><getter>ddAccountType</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(73, 3, 'hs_hr_emp_directdebit.dd_routing_num', 'Direct Deposit Routing Number', 'ddRoutingNumber', 'false', NULL, NULL, 'label', '<xml><getter>ddRoutingNumber</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(74, 3, 'hs_hr_emp_directdebit.dd_amount', 'Direct Deposit Amount', 'ddAmount', 'false', NULL, NULL, 'label', '<xml><getter>ddAmount</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(75, 3, 'hs_hr_emp_contract_extend.econ_extend_start_date', 'Contract Start Date', 'empContStartDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empContStartDate</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(76, 3, 'hs_hr_emp_contract_extend.econ_extend_end_date', 'Contract End Date', 'empContEndDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empContEndDate</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(77, 3, 'ohrm_job_title.job_title', 'Job Title', 'empJobTitle', 'false', NULL, NULL, 'label', '<xml><getter>empJobTitle</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(78, 3, 'ohrm_employment_status.name', 'Employment Status', 'empEmploymentStatus', 'false', NULL, NULL, 'label', '<xml><getter>empEmploymentStatus</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(80, 3, 'ohrm_job_category.name', 'Job Category', 'empJobCategory', 'false', NULL, NULL, 'label', '<xml><getter>empJobCategory</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(81, 3, 'hs_hr_employee.joined_date', 'Joined Date', 'empJoinedDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empJoinedDate</getter></xml>', '100', '0', NULL, 1, 6, '---', 0, 0),
(82, 3, 'ohrm_subunit.name', 'Sub Unit', 'empSubUnit', 'false', NULL, NULL, 'label', '<xml><getter>empSubUnit</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(83, 3, 'ohrm_location.name', 'Location', 'empLocation', 'false', NULL, NULL, 'label', '<xml><getter>empLocation</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(84, 3, 'hs_hr_emp_passport.ep_passport_num', 'Number', 'empPassportNo', 'false', NULL, NULL, 'label', '<xml><getter>empPassportNo</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(85, 3, 'hs_hr_emp_passport.ep_passportissueddate', 'Issued Date', 'empPassportIssuedDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empPassportIssuedDate</getter></xml>', '100', '0', NULL, 1, 5, '---', 0, 0),
(86, 3, 'hs_hr_emp_passport.ep_passportexpiredate', 'Expiry Date', 'empPassportExpiryDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empPassportExpiryDate</getter></xml>', '100', '0', NULL, 1, 5, '---', 0, 0),
(87, 3, 'hs_hr_emp_passport.ep_i9_status', 'Eligibility Status', 'empPassportEligibleStatus', 'false', NULL, NULL, 'label', '<xml><getter>empPassportEligibleStatus</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(88, 3, 'hs_hr_emp_passport.cou_code', 'Issued By', 'empPassportIssuedBy', 'false', NULL, NULL, 'label', '<xml><getter>empPassportIssuedBy</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(89, 3, 'hs_hr_emp_passport.ep_i9_review_date', 'Eligibility Review Date', 'empPassportEligibleReviewDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empPassportEligibleReviewDate</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(90, 3, 'hs_hr_emp_passport.ep_comments', 'Comments', 'empPassportComments', 'false', NULL, NULL, 'label', '<xml><getter>empPassportComments</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(91, 3, 'subordinate.emp_lastname', 'Last Name', 'subordinateLastName', 'false', NULL, NULL, 'label', '<xml><getter>subordinateLastName</getter></xml>', '200', '0', NULL, 1, 8, '---', 0, 0),
(92, 3, 'CASE hs_hr_emp_language.fluency WHEN 1 THEN "Writing" WHEN 2 THEN "Speaking" WHEN 3 THEN "Reading" END', 'Fluency', 'langFluency', 'false', NULL, NULL, 'label', '<xml><getter>langFluency</getter></xml>', '200', '0', NULL, 1, 13, '---', 0, 0),
(93, 3, 'supervisor_reporting_method.reporting_method_name', 'Reporting Method', 'supReportingMethod', 'false', NULL, NULL, 'label', '<xml><getter>supReportingMethod</getter></xml>', '200', '0', NULL, 1, 9, '---', 0, 0),
(94, 3, 'subordinate_reporting_method.reporting_method_name', 'Reporting Method', 'subReportingMethod', 'false', NULL, NULL, 'label', '<xml><getter>subReportingMethod</getter></xml>', '200', '0', NULL, 1, 8, '---', 0, 0),
(95, 3, 'CASE hs_hr_emp_passport.ep_passport_type_flg WHEN 1 THEN "Passport" WHEN 2 THEN "Visa" END', 'Document Type', 'documentType', 'false', NULL, NULL, 'label', '<xml><getter>documentType</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(97, 3, 'hs_hr_employee.emp_other_id', 'Other Id', 'otherId', 'false', NULL, NULL, 'label', '<xml><getter>otherId</getter></xml>', '100', '0', NULL, 0, 1, '---', 0, 0),
(98, 3, 'hs_hr_emp_emergency_contacts.eec_seqno', 'ecSeqNo', 'ecSeqNo', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 3, '---', 0, 1),
(99, 3, 'hs_hr_emp_dependents.ed_seqno', 'SeqNo', 'edSeqNo', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 4, '---', 0, 1),
(100, 3, 'hs_hr_emp_passport.ep_seqno', 'SeqNo', 'epSeqNo', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 5, '---', 0, 1),
(101, 3, 'hs_hr_emp_basicsalary.id', 'salaryId', 'salaryId', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 7, '---', 0, 1),
(102, 3, 'subordinate.emp_number', 'subordinateId', 'subordinateId', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 8, '---', 0, 1),
(103, 3, 'supervisor.emp_number', 'supervisorId', 'supervisorId', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 9, '---', 0, 1),
(104, 3, 'hs_hr_emp_work_experience.eexp_seqno', 'workExpSeqNo', 'workExpSeqNo', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 10, '---', 0, 1),
(105, 3, 'ohrm_emp_education.education_id', 'empEduCode', 'empEduCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 11, '---', 0, 1),
(106, 3, 'hs_hr_emp_skill.skill_id', 'empSkillCode', 'empSkillCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 12, '---', 0, 1),
(107, 3, 'hs_hr_emp_language.lang_id', 'empLangCode', 'empLangCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 13, '---', 0, 1),
(108, 3, 'hs_hr_emp_language.fluency', 'empLangType', 'empLangType', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 13, '---', 0, 1),
(109, 3, 'ohrm_emp_license.license_id', 'empLicenseCode', 'empLicenseCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 14, '---', 0, 1),
(110, 3, 'hs_hr_emp_member_detail.membship_code', 'membershipCode', 'membershipCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 15, '---', 0, 1),
(112, 3, 'ROUND(DATEDIFF(hs_hr_emp_work_experience.eexp_to_date, hs_hr_emp_work_experience.eexp_from_date)/365,1)', 'Duration', 'expDuration', 'false', NULL, NULL, 'label', '<xml><getter>expDuration</getter></xml>', '100', '0', NULL, 1, 10, '---', 0, 0),
(113, 3, 'ohrm_emp_termination.termination_date', 'Termination Date', 'terminationDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>terminationDate</getter></xml>', '100', '0', NULL, 1, 6, '---', 0, 0),
(114, 3, 'ohrm_emp_termination_reason.name', 'Termination Reason', 'terminationReason', 'false', NULL, NULL, 'label', '<xml><getter>terminationReason</getter></xml>', '100', '0', NULL, 1, 6, '---', 0, 0),
(115, 3, 'ohrm_emp_education.institute', 'Institute', 'getInstitute', 'false', NULL, NULL, 'label', '<xml><getter>getInstitute</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0),
(116, 3, 'ohrm_emp_education.major', 'Major/Specialization', 'getMajor', 'false', NULL, NULL, 'label', '<xml><getter>getMajor</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0),
(117, 3, 'ohrm_emp_education.start_date', 'Start Date', 'getStartDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>getStartDate</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0),
(118, 3, 'ohrm_emp_education.end_date', 'End Date', 'getEndDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>getEndDate</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0),
(119, 3, 'ohrm_emp_license.license_no', 'License Number', 'getLicenseNo', 'false', NULL, NULL, 'label', '<xml><getter>getLicenseNo</getter></xml>', '200', '0', NULL, 1, 14, '---', 0, 0),
(120, 3, 'ohrm_emp_termination.note', 'Termination Note', 'getNote', 'false', NULL, NULL, 'label', '<xml><getter>getNote</getter></xml>', '100', '0', NULL, 1, 6, '---', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_display_field_group`
--

CREATE TABLE IF NOT EXISTS `ohrm_display_field_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_list` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `report_group_id` (`report_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `ohrm_display_field_group`
--

INSERT INTO `ohrm_display_field_group` (`id`, `report_group_id`, `name`, `is_list`) VALUES
(1, 3, 'Personal', 0),
(2, 3, 'Contact Details', 0),
(3, 3, 'Emergency Contacts', 1),
(4, 3, 'Dependents', 1),
(5, 3, 'Immigration', 1),
(6, 3, 'Job', 0),
(7, 3, 'Salary', 1),
(8, 3, 'Subordinates', 1),
(9, 3, 'Supervisors', 1),
(10, 3, 'Work Experience', 1),
(11, 3, 'Education', 1),
(12, 3, 'Skills', 1),
(13, 3, 'Languages', 1),
(14, 3, 'License', 1),
(15, 3, 'Memberships', 1),
(16, 3, 'Custom Fields', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_education`
--

CREATE TABLE IF NOT EXISTS `ohrm_education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email`
--

CREATE TABLE IF NOT EXISTS `ohrm_email` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `ohrm_email_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ohrm_email`
--

INSERT INTO `ohrm_email` (`id`, `name`) VALUES
(1, 'leave.apply'),
(3, 'leave.approve'),
(2, 'leave.assign'),
(4, 'leave.cancel'),
(6, 'leave.change'),
(5, 'leave.reject');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_configuration`
--

CREATE TABLE IF NOT EXISTS `ohrm_email_configuration` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mail_type` varchar(50) DEFAULT NULL,
  `sent_as` varchar(250) NOT NULL,
  `sendmail_path` varchar(250) DEFAULT NULL,
  `smtp_host` varchar(250) DEFAULT NULL,
  `smtp_port` int(10) DEFAULT NULL,
  `smtp_username` varchar(250) DEFAULT NULL,
  `smtp_password` varchar(250) DEFAULT NULL,
  `smtp_auth_type` varchar(50) DEFAULT NULL,
  `smtp_security_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_notification`
--

CREATE TABLE IF NOT EXISTS `ohrm_email_notification` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `is_enable` int(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ohrm_email_notification`
--

INSERT INTO `ohrm_email_notification` (`id`, `name`, `is_enable`) VALUES
(1, 'Leave Applications', 0),
(2, 'Leave Assignments', 0),
(3, 'Leave Approvals', 0),
(4, 'Leave Cancellations', 0),
(5, 'Leave Rejections', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_processor`
--

CREATE TABLE IF NOT EXISTS `ohrm_email_processor` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `email_id` int(6) NOT NULL,
  `class_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email_id` (`email_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ohrm_email_processor`
--

INSERT INTO `ohrm_email_processor` (`id`, `email_id`, `class_name`) VALUES
(1, 1, 'LeaveEmailProcessor'),
(2, 2, 'LeaveEmailProcessor'),
(3, 3, 'LeaveEmailProcessor'),
(4, 4, 'LeaveEmailProcessor'),
(5, 5, 'LeaveEmailProcessor'),
(6, 6, 'LeaveChangeMailProcessor');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_subscriber`
--

CREATE TABLE IF NOT EXISTS `ohrm_email_subscriber` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `notification_id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_id` (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_template`
--

CREATE TABLE IF NOT EXISTS `ohrm_email_template` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `email_id` int(6) NOT NULL,
  `locale` varchar(20) DEFAULT NULL,
  `performer_role` varchar(50) DEFAULT NULL,
  `recipient_role` varchar(50) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`id`),
  KEY `email_id` (`email_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `ohrm_email_template`
--

INSERT INTO `ohrm_email_template` (`id`, `email_id`, `locale`, `performer_role`, `recipient_role`, `subject`, `body`) VALUES
(1, 1, 'en_US', NULL, 'supervisor', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/apply/leaveApplicationSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/apply/leaveApplicationBody.txt'),
(2, 1, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/apply/leaveApplicationSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/apply/leaveApplicationSubscriberBody.txt'),
(3, 3, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/approve/leaveApprovalSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/approve/leaveApprovalBody.txt'),
(4, 3, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/approve/leaveApprovalSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/approve/leaveApprovalSubscriberBody.txt'),
(5, 2, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentBody.txt'),
(6, 2, 'en_US', NULL, 'supervisor', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentSubjectForSupervisors.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentBodyForSupervisors.txt'),
(7, 2, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentSubscriberBody.txt'),
(8, 4, 'en_US', 'ess', 'supervisor', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveEmployeeCancellationSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveEmployeeCancellationBody.txt'),
(9, 4, 'en_US', 'ess', 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveEmployeeCancellationSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveEmployeeCancellationSubscriberBody.txt'),
(10, 4, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveCancellationSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveCancellationBody.txt'),
(11, 4, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveCancellationSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveCancellationSubscriberBody.txt'),
(12, 5, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/reject/leaveRejectionSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/reject/leaveRejectionBody.txt'),
(13, 5, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/reject/leaveRejectionSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/reject/leaveRejectionSubscriberBody.txt'),
(14, 6, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/change/leaveChangeSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/change/leaveChangeBody.txt'),
(15, 6, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/change/leaveChangeSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/change/leaveChangeSubscriberBody.txt');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_employee_work_shift`
--

CREATE TABLE IF NOT EXISTS `ohrm_employee_work_shift` (
  `work_shift_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_number` int(11) NOT NULL,
  PRIMARY KEY (`work_shift_id`,`emp_number`),
  KEY `emp_number` (`emp_number`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ohrm_employee_work_shift`
--

INSERT INTO `ohrm_employee_work_shift` (`work_shift_id`, `emp_number`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_employment_status`
--

CREATE TABLE IF NOT EXISTS `ohrm_employment_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_education`
--

CREATE TABLE IF NOT EXISTS `ohrm_emp_education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_number` int(11) NOT NULL,
  `education_id` int(11) NOT NULL,
  `institute` varchar(100) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `year` decimal(4,0) DEFAULT NULL,
  `score` varchar(25) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_number` (`emp_number`),
  KEY `education_id` (`education_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_license`
--

CREATE TABLE IF NOT EXISTS `ohrm_emp_license` (
  `emp_number` int(11) NOT NULL,
  `license_id` int(11) NOT NULL,
  `license_no` varchar(50) DEFAULT NULL,
  `license_issued_date` date DEFAULT NULL,
  `license_expiry_date` date DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`license_id`),
  KEY `license_id` (`license_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_reporting_method`
--

CREATE TABLE IF NOT EXISTS `ohrm_emp_reporting_method` (
  `reporting_method_id` int(7) NOT NULL AUTO_INCREMENT,
  `reporting_method_name` varchar(100) NOT NULL,
  PRIMARY KEY (`reporting_method_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ohrm_emp_reporting_method`
--

INSERT INTO `ohrm_emp_reporting_method` (`reporting_method_id`, `reporting_method_name`) VALUES
(1, 'Direct'),
(2, 'Indirect');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_termination`
--

CREATE TABLE IF NOT EXISTS `ohrm_emp_termination` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `emp_number` int(4) DEFAULT NULL,
  `reason_id` int(4) DEFAULT NULL,
  `termination_date` date NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reason_id` (`reason_id`),
  KEY `emp_number` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_termination_reason`
--

CREATE TABLE IF NOT EXISTS `ohrm_emp_termination_reason` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ohrm_emp_termination_reason`
--

INSERT INTO `ohrm_emp_termination_reason` (`id`, `name`) VALUES
(1, 'Other'),
(2, 'Retired'),
(3, 'Contract Not Renewed'),
(4, 'Resigned - Company Requested'),
(5, 'Resigned - Self Proposed'),
(6, 'Resigned'),
(7, 'Deceased'),
(8, 'Physically Disabled/Compensated'),
(9, 'Laid-off'),
(10, 'Dismissed');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_filter_field`
--

CREATE TABLE IF NOT EXISTS `ohrm_filter_field` (
  `filter_field_id` bigint(20) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `where_clause_part` mediumtext NOT NULL,
  `filter_field_widget` varchar(255) DEFAULT NULL,
  `condition_no` int(20) NOT NULL,
  `required` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`filter_field_id`),
  KEY `report_group_id` (`report_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_filter_field`
--

INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES
(1, 1, 'project_name', 'ohrm_project.project_id', 'ohrmWidgetProjectList', 2, 'true'),
(2, 1, 'activity_show_deleted', 'ohrm_project_activity.is_deleted', 'ohrmWidgetInputCheckbox', 2, 'false'),
(3, 1, 'project_date_range', 'date', 'ohrmWidgetDateRange', 1, 'false'),
(4, 1, 'employee', 'hs_hr_employee.emp_number', 'ohrmReportWidgetEmployeeListAutoFill', 2, 'true'),
(5, 1, 'activity_name', 'ohrm_project_activity.activity_id', 'ohrmWidgetProjectActivityList', 2, 'true'),
(6, 1, 'project_name', 'ohrm_project.project_id', 'ohrmWidgetProjectListWithAllOption', 2, 'true'),
(7, 1, 'only_include_approved_timesheets', 'ohrm_timesheet.state', 'ohrmWidgetApprovedTimesheetInputCheckBox', 2, NULL),
(8, 3, 'employee_name', 'hs_hr_employee.emp_number', 'ohrmReportWidgetEmployeeListAutoFill', 1, NULL),
(9, 3, 'pay_grade', 'hs_hr_emp_basicsalary.sal_grd_code', 'ohrmReportWidgetPayGradeDropDown', 1, NULL),
(10, 3, 'education', 'ohrm_emp_education.education_id', 'ohrmReportWidgetEducationtypeDropDown', 1, NULL),
(11, 3, 'employment_status', 'hs_hr_employee.emp_status', 'ohrmWidgetEmploymentStatusList', 1, NULL),
(12, 3, 'service_period', 'datediff(current_date(), hs_hr_employee.joined_date)/365', 'ohrmReportWidgetServicePeriod', 1, NULL),
(13, 3, 'joined_date', 'hs_hr_employee.joined_date', 'ohrmReportWidgetJoinedDate', 1, NULL),
(14, 3, 'job_title', 'hs_hr_employee.job_title_code', 'ohrmWidgetJobTitleList', 1, NULL),
(15, 3, 'language', 'hs_hr_emp_language.lang_id', 'ohrmReportWidgetLanguageDropDown', 1, NULL),
(16, 3, 'skill', 'hs_hr_emp_skill.skill_id', 'ohrmReportWidgetSkillDropDown', 1, NULL),
(17, 3, 'age_group', 'datediff(current_date(), hs_hr_employee.emp_birthday)/365', 'ohrmReportWidgetAgeGroup', 1, NULL),
(18, 3, 'sub_unit', 'hs_hr_employee.work_station', 'ohrmWidgetSubDivisionList', 1, NULL),
(19, 3, 'gender', 'hs_hr_employee.emp_gender', 'ohrmReportWidgetGenderDropDown', 1, NULL),
(20, 3, 'location', 'ohrm_location.id', 'ohrmReportWidgetOperationalCountryLocationDropDown', 1, NULL),
(21, 1, 'is_deleted', 'ohrm_project_activity.is_deleted', '', 2, NULL),
(22, 3, 'include', 'hs_hr_employee.termination_id', 'ohrmReportWidgetIncludedEmployeesDropDown', 1, 'true');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_group_field`
--

CREATE TABLE IF NOT EXISTS `ohrm_group_field` (
  `group_field_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_by_clause` mediumtext NOT NULL,
  `group_field_widget` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`group_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_group_field`
--

INSERT INTO `ohrm_group_field` (`group_field_id`, `name`, `group_by_clause`, `group_field_widget`) VALUES
(1, 'activity id', 'GROUP BY ohrm_project_activity.activity_id', NULL),
(2, 'employee number', 'GROUP BY hs_hr_employee.emp_number', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_holiday`
--

CREATE TABLE IF NOT EXISTS `ohrm_holiday` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` text,
  `date` date DEFAULT NULL,
  `recurring` tinyint(3) unsigned DEFAULT '0',
  `length` int(10) unsigned DEFAULT NULL,
  `operational_country_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ohrm_holiday_ohrm_operational_country` (`operational_country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_home_page`
--

CREATE TABLE IF NOT EXISTS `ohrm_home_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_role_id` int(11) NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `enable_class` varchar(100) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT 'lowest priority 0',
  PRIMARY KEY (`id`),
  KEY `user_role_id` (`user_role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ohrm_home_page`
--

INSERT INTO `ohrm_home_page` (`id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES
(1, 1, 'dashboard/index', NULL, 15),
(2, 2, 'dashboard/index', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_candidate`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_candidate` (
  `id` int(13) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact_number` varchar(30) DEFAULT NULL,
  `status` int(4) NOT NULL,
  `comment` text,
  `mode_of_application` int(4) NOT NULL,
  `date_of_application` date NOT NULL,
  `cv_file_id` int(13) DEFAULT NULL,
  `cv_text_version` text,
  `keywords` varchar(255) DEFAULT NULL,
  `added_person` int(13) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `added_person` (`added_person`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_candidate_attachment`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_candidate_attachment` (
  `id` int(13) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(13) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_content` mediumblob,
  `attachment_type` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_id` (`candidate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_candidate_history`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_candidate_history` (
  `id` int(13) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(13) NOT NULL,
  `vacancy_id` int(13) DEFAULT NULL,
  `candidate_vacancy_name` varchar(255) DEFAULT NULL,
  `interview_id` int(13) DEFAULT NULL,
  `action` int(4) NOT NULL,
  `performed_by` int(13) DEFAULT NULL,
  `performed_date` datetime NOT NULL,
  `note` text,
  `interviewers` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_id` (`candidate_id`),
  KEY `vacancy_id` (`vacancy_id`),
  KEY `interview_id` (`interview_id`),
  KEY `performed_by` (`performed_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_candidate_vacancy`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_candidate_vacancy` (
  `id` int(13) DEFAULT NULL,
  `candidate_id` int(13) NOT NULL,
  `vacancy_id` int(13) NOT NULL,
  `status` varchar(100) NOT NULL,
  `applied_date` date NOT NULL,
  PRIMARY KEY (`candidate_id`,`vacancy_id`),
  UNIQUE KEY `id` (`id`),
  KEY `vacancy_id` (`vacancy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_category`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `ohrm_job_category`
--

INSERT INTO `ohrm_job_category` (`id`, `name`) VALUES
(27, 'BARANGAY OPERATIONS OFFICE'),
(28, 'CITY ENVIRONMENT AND NATURAL RESOURCES OFFICE'),
(29, 'Office of the City Engineer'),
(30, 'OFFICE OF THE CITY GENERAL SERVICES OFFICER'),
(31, 'Office of the City Special Services Officer'),
(32, 'Office of the City Treasurer'),
(33, 'Human Resource Management Office'),
(34, 'LDRRMO'),
(35, 'OFFICE OF THE CITY ACCOUNTANT'),
(36, 'Office of the City Assessor'),
(37, 'OFFICE OF THE CITY BUILDING OFFICIAL'),
(38, 'OFFICE OF THE CITY CIVIL REGISTRAR'),
(39, 'OFFICE OF THE CITY HEALTH OFFICER'),
(40, 'OSPITAL NG PARAÑAQUE'),
(41, 'Parañaque Livelihood Resource Management Office'),
(42, 'Public Employment Service Office');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_interview`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_interview` (
  `id` int(13) NOT NULL AUTO_INCREMENT,
  `candidate_vacancy_id` int(13) DEFAULT NULL,
  `candidate_id` int(13) DEFAULT NULL,
  `interview_name` varchar(100) NOT NULL,
  `interview_date` date DEFAULT NULL,
  `interview_time` time DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`),
  KEY `candidate_vacancy_id` (`candidate_vacancy_id`),
  KEY `candidate_id` (`candidate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_interview_attachment`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_interview_attachment` (
  `id` int(13) NOT NULL AUTO_INCREMENT,
  `interview_id` int(13) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_content` mediumblob,
  `attachment_type` int(4) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `interview_id` (`interview_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_interview_interviewer`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_interview_interviewer` (
  `interview_id` int(13) NOT NULL,
  `interviewer_id` int(13) NOT NULL,
  PRIMARY KEY (`interview_id`,`interviewer_id`),
  KEY `interviewer_id` (`interviewer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_specification_attachment`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_specification_attachment` (
  `id` int(13) NOT NULL AUTO_INCREMENT,
  `job_title_id` int(13) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_content` mediumblob,
  PRIMARY KEY (`id`),
  KEY `job_title_id` (`job_title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_title`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_title` (
  `id` int(13) NOT NULL AUTO_INCREMENT,
  `job_title` varchar(100) NOT NULL,
  `job_description` varchar(400) DEFAULT NULL,
  `note` varchar(400) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `ohrm_job_title`
--

INSERT INTO `ohrm_job_title` (`id`, `job_title`, `job_description`, `note`, `is_deleted`) VALUES
(1, 'Administrative Aide III (Clerk I)', '', '', 1),
(2, 'Computer Maintenance Technologist I', '', '', 1),
(3, 'Administrative Officer I ', '', '', 1),
(4, 'Administrative Aide IV', '', '', 1),
(5, 'Administrative Aide III', '', '', 1),
(6, 'Senior Administrative Assistant III', '', '', 0),
(7, 'Computer Maintenance Technologist I', '', '', 0),
(8, 'Administrative Assistant IV', '', '', 0),
(9, 'Administrative Officer I', '', '', 0),
(10, 'Administrative Assistant  III', '', '', 0),
(11, 'Administrative Assistant II', '', '', 0),
(12, 'Administrative Assistant I', '', '', 0),
(13, 'Administrative Aide IV', '', '', 0),
(14, 'Administrative Aide III', '', '', 0),
(15, 'Administrative Aide II (Bookbinder I)', '', '', 0),
(16, 'Data Entry Machine Operator I', '', '', 0),
(17, 'Administrative Aide II', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_vacancy`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_vacancy` (
  `id` int(13) NOT NULL,
  `job_title_code` int(4) NOT NULL,
  `hiring_manager_id` int(13) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `no_of_positions` int(13) DEFAULT NULL,
  `status` int(4) NOT NULL,
  `published_in_feed` tinyint(1) NOT NULL DEFAULT '0',
  `defined_time` datetime NOT NULL,
  `updated_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `job_title_code` (`job_title_code`),
  KEY `hiring_manager_id` (`hiring_manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_vacancy_attachment`
--

CREATE TABLE IF NOT EXISTS `ohrm_job_vacancy_attachment` (
  `id` int(13) NOT NULL AUTO_INCREMENT,
  `vacancy_id` int(13) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_content` mediumblob,
  `attachment_type` int(4) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vacancy_id` (`vacancy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_kpi`
--

CREATE TABLE IF NOT EXISTS `ohrm_kpi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_title_code` varchar(10) DEFAULT NULL,
  `kpi_indicators` varchar(255) DEFAULT NULL,
  `min_rating` int(7) DEFAULT '0',
  `max_rating` int(7) DEFAULT '0',
  `default_kpi` smallint(1) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_language`
--

CREATE TABLE IF NOT EXISTS `ohrm_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `length_hours` decimal(6,2) unsigned DEFAULT NULL,
  `length_days` decimal(6,4) unsigned DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `comments` varchar(256) DEFAULT NULL,
  `leave_request_id` int(10) unsigned NOT NULL,
  `leave_type_id` int(10) unsigned NOT NULL,
  `emp_number` int(7) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `duration_type` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `leave_request_type_emp` (`leave_request_id`,`leave_type_id`,`emp_number`),
  KEY `request_status` (`leave_request_id`,`status`),
  KEY `leave_type_id` (`leave_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ohrm_leave`
--

INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES
(1, '2016-10-28', 9.00, 1.0000, 3, '', 1, 2, 1, '00:00:00', '00:00:00', 0),
(2, '2016-10-29', 0.00, 0.0000, 4, NULL, 1, 2, 1, '00:00:00', '00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_adjustment`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_adjustment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `emp_number` int(7) NOT NULL,
  `no_of_days` decimal(19,15) NOT NULL,
  `leave_type_id` int(10) unsigned NOT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `credited_date` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `adjustment_type` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_id` int(10) DEFAULT NULL,
  `created_by_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_type_id` (`leave_type_id`),
  KEY `emp_number` (`emp_number`),
  KEY `created_by_id` (`created_by_id`),
  KEY `adjustment_type` (`adjustment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_comment`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by_name` varchar(255) NOT NULL,
  `created_by_id` int(10) DEFAULT NULL,
  `created_by_emp_number` int(7) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_id` (`leave_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `created_by_emp_number` (`created_by_emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_entitlement`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_entitlement` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `emp_number` int(7) NOT NULL,
  `no_of_days` decimal(19,15) NOT NULL,
  `days_used` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `leave_type_id` int(10) unsigned NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime DEFAULT NULL,
  `credited_date` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `entitlement_type` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_id` int(10) DEFAULT NULL,
  `created_by_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_type_id` (`leave_type_id`),
  KEY `emp_number` (`emp_number`),
  KEY `entitlement_type` (`entitlement_type`),
  KEY `created_by_id` (`created_by_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ohrm_leave_entitlement`
--

INSERT INTO `ohrm_leave_entitlement` (`id`, `emp_number`, `no_of_days`, `days_used`, `leave_type_id`, `from_date`, `to_date`, `credited_date`, `note`, `entitlement_type`, `deleted`, `created_by_id`, `created_by_name`) VALUES
(1, 1, 12.000000000000000, 1.0000, 2, '2016-01-01 00:00:00', '2016-12-31 00:00:00', NULL, NULL, 1, 0, NULL, NULL),
(4, 1, 12.000000000000000, 0.0000, 1, '2016-01-01 00:00:00', '2016-12-31 00:00:00', NULL, NULL, 1, 0, NULL, NULL),
(5, 7, 12.000000000000000, 0.0000, 2, '2016-01-01 00:00:00', '2016-12-31 00:00:00', '2016-10-27 00:00:00', NULL, 1, 0, 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_entitlement_adjustment`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_entitlement_adjustment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(10) unsigned NOT NULL,
  `entitlement_id` int(10) unsigned NOT NULL,
  `length_days` decimal(4,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entitlement_id` (`entitlement_id`),
  KEY `adjustment_id` (`adjustment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_entitlement_type`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_entitlement_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `is_editable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ohrm_leave_entitlement_type`
--

INSERT INTO `ohrm_leave_entitlement_type` (`id`, `name`, `is_editable`) VALUES
(1, 'Added', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_leave_entitlement`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_leave_entitlement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_id` int(11) NOT NULL,
  `entitlement_id` int(10) unsigned NOT NULL,
  `length_days` decimal(6,4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entitlement_id` (`entitlement_id`),
  KEY `leave_id` (`leave_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ohrm_leave_leave_entitlement`
--

INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES
(1, 1, 1, 1.0000);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_period_history`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_period_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_period_start_month` int(11) NOT NULL,
  `leave_period_start_day` int(11) NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ohrm_leave_period_history`
--

INSERT INTO `ohrm_leave_period_history` (`id`, `leave_period_start_month`, `leave_period_start_day`, `created_at`) VALUES
(1, 1, 1, '2016-10-25');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_request`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `leave_type_id` int(10) unsigned NOT NULL,
  `date_applied` date NOT NULL,
  `emp_number` int(7) NOT NULL,
  `comments` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_number` (`emp_number`),
  KEY `leave_type_id` (`leave_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ohrm_leave_request`
--

INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES
(1, 2, '2016-10-28', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_request_comment`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_request_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_request_id` int(10) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by_name` varchar(255) NOT NULL,
  `created_by_id` int(10) DEFAULT NULL,
  `created_by_emp_number` int(7) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_request_id` (`leave_request_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `created_by_emp_number` (`created_by_emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_status`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` smallint(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ohrm_leave_status`
--

INSERT INTO `ohrm_leave_status` (`id`, `status`, `name`) VALUES
(1, -1, 'REJECTED'),
(2, 0, 'CANCELLED'),
(3, 1, 'PENDING APPROVAL'),
(4, 2, 'SCHEDULED'),
(5, 3, 'TAKEN'),
(6, 4, 'WEEKEND'),
(7, 5, 'HOLIDAY');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_type`
--

CREATE TABLE IF NOT EXISTS `ohrm_leave_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `exclude_in_reports_if_no_entitlement` tinyint(1) NOT NULL DEFAULT '0',
  `operational_country_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `operational_country_id` (`operational_country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ohrm_leave_type`
--

INSERT INTO `ohrm_leave_type` (`id`, `name`, `deleted`, `exclude_in_reports_if_no_entitlement`, `operational_country_id`) VALUES
(1, 'Sick Leave', 0, 1, NULL),
(2, 'Emergency Leave', 0, 1, NULL),
(3, 'Paternity Leave', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_license`
--

CREATE TABLE IF NOT EXISTS `ohrm_license` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_location`
--

CREATE TABLE IF NOT EXISTS `ohrm_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(110) NOT NULL,
  `country_code` varchar(3) NOT NULL,
  `province` varchar(60) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip_code` varchar(35) DEFAULT NULL,
  `phone` varchar(35) DEFAULT NULL,
  `fax` varchar(35) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_code` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_login`
--

CREATE TABLE IF NOT EXISTS `ohrm_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_role_name` text NOT NULL,
  `user_role_predefined` tinyint(1) NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `ohrm_login`
--

INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES
(1, 1, 'Admin', 'Admin', 1, '2016-10-24 22:52:03'),
(2, 2, 'Johann Paul', 'ESS', 1, '2016-10-24 23:08:54'),
(3, 1, 'Admin', 'Admin', 1, '2016-10-24 23:13:01'),
(4, 1, 'Admin', 'Admin', 1, '2016-10-26 14:42:23'),
(5, 1, 'Admin', 'Admin', 1, '2016-10-26 15:17:28'),
(6, 1, 'Admin', 'Admin', 1, '2016-10-26 15:24:34'),
(7, 1, 'Admin', 'Admin', 1, '2016-10-26 16:24:11'),
(8, 2, 'Johann Paul', 'ESS', 1, '2016-10-26 17:54:26'),
(9, 2, 'Johann Paul', 'ESS', 1, '2016-10-26 17:54:56'),
(10, 2, 'Johann Paul', 'ESS', 1, '2016-10-26 23:27:38'),
(11, 1, 'Admin', 'Admin', 1, '2016-10-26 23:28:12'),
(12, 2, 'Johann Paul', 'ESS', 1, '2016-10-26 23:39:41'),
(13, 1, 'Admin', 'Admin', 1, '2016-10-26 23:40:19'),
(14, 2, 'Johann Paul', 'ESS', 1, '2016-10-26 23:40:50'),
(15, 2, 'Johann Paul', 'ESS', 1, '2016-10-26 23:48:22'),
(16, 1, 'Admin', 'Admin', 1, '2016-10-26 23:49:32'),
(17, 1, 'Admin', 'Admin', 1, '2016-10-26 23:52:59'),
(18, 1, 'Admin', 'Admin', 1, '2016-11-14 05:03:08'),
(19, 1, 'Admin', 'Admin', 1, '2016-11-14 05:06:05');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_membership`
--

CREATE TABLE IF NOT EXISTS `ohrm_membership` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_menu_item`
--

CREATE TABLE IF NOT EXISTS `ohrm_menu_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_title` varchar(255) NOT NULL,
  `screen_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `level` tinyint(4) NOT NULL,
  `order_hint` int(11) NOT NULL,
  `url_extras` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `screen_id` (`screen_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=95 ;

--
-- Dumping data for table `ohrm_menu_item`
--

INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES
(1, 'Admin', 74, NULL, 1, 100, NULL, 1),
(2, 'User Management', NULL, 1, 2, 100, NULL, 1),
(3, 'Project Info', NULL, 52, 2, 400, NULL, 0),
(4, 'Customers', 36, 3, 3, 100, NULL, 0),
(5, 'Projects', 37, 3, 3, 200, NULL, 0),
(6, 'Job', NULL, 1, 2, 300, NULL, 1),
(7, 'Job Titles', 23, 6, 3, 100, NULL, 1),
(8, 'Pay Grades', 24, 6, 3, 200, NULL, 1),
(9, 'Employment Status', 25, 6, 3, 300, NULL, 1),
(10, 'Job Categories', 26, 6, 3, 400, NULL, 1),
(11, 'Work Shifts', 27, 6, 3, 500, NULL, 1),
(12, 'Organization', NULL, 1, 2, 400, NULL, 1),
(13, 'General Information', 20, 12, 3, 100, NULL, 1),
(14, 'Locations', 21, 12, 3, 200, NULL, 1),
(15, 'Structure', 22, 12, 3, 300, NULL, 1),
(16, 'Qualifications', NULL, 1, 2, 500, NULL, 1),
(17, 'Skills', 28, 16, 3, 100, NULL, 1),
(18, 'Education', 29, 16, 3, 200, NULL, 1),
(19, 'Licenses', 30, 16, 3, 300, NULL, 1),
(20, 'Languages', 31, 16, 3, 400, NULL, 1),
(21, 'Memberships', 32, 16, 3, 500, NULL, 1),
(22, 'Nationalities', 33, 1, 2, 700, NULL, 1),
(23, 'Configuration', NULL, 1, 2, 900, NULL, 1),
(24, 'Email Configuration', 34, 23, 3, 100, NULL, 1),
(25, 'Email Subscriptions', 35, 23, 3, 200, NULL, 1),
(27, 'Localization', 38, 23, 3, 300, NULL, 1),
(28, 'Modules', 39, 23, 3, 400, NULL, 1),
(30, 'PIM', 75, NULL, 1, 200, NULL, 1),
(31, 'Configuration', NULL, 30, 2, 100, NULL, 1),
(32, 'Optional Fields', 40, 31, 3, 100, NULL, 1),
(33, 'Custom Fields', 41, 31, 3, 200, NULL, 1),
(34, 'Data Import', 42, 31, 3, 300, NULL, 1),
(35, 'Reporting Methods', 43, 31, 3, 400, NULL, 1),
(36, 'Termination Reasons', 44, 31, 3, 500, NULL, 1),
(37, 'Employee List', 5, 30, 2, 200, '/reset/1', 1),
(38, 'Add Employee', 4, 30, 2, 300, NULL, 1),
(39, 'Reports', 45, 30, 2, 400, '/reportGroup/3/reportType/PIM_DEFINED', 1),
(40, 'My Info', 46, NULL, 1, 700, NULL, 1),
(41, 'Leave', 68, NULL, 1, 300, NULL, 1),
(42, 'Configure', NULL, 41, 2, 500, NULL, 0),
(43, 'Leave Period', 47, 42, 3, 100, NULL, 1),
(44, 'Leave Types', 7, 42, 3, 200, NULL, 1),
(45, 'Work Week', 14, 42, 3, 300, NULL, 1),
(46, 'Holidays', 11, 42, 3, 400, NULL, 1),
(48, 'Leave List', 16, 41, 2, 600, '/reset/1', 1),
(49, 'Assign Leave', 17, 41, 2, 700, NULL, 1),
(50, 'My Leave', 48, 41, 2, 200, '/reset/1', 1),
(51, 'Apply', 49, 41, 2, 100, NULL, 1),
(52, 'Time', 67, NULL, 1, 400, NULL, 1),
(53, 'Timesheets', NULL, 52, 2, 100, NULL, 1),
(54, 'My Timesheets', 51, 53, 3, 100, NULL, 0),
(55, 'Employee Timesheets', 52, 53, 3, 200, NULL, 0),
(56, 'Attendance', NULL, 52, 2, 200, NULL, 1),
(57, 'My Records', 53, 56, 3, 100, NULL, 0),
(58, 'Punch In/Out', 54, 56, 3, 200, NULL, 0),
(59, 'Employee Records', 55, 56, 3, 300, NULL, 0),
(60, 'Configuration', 56, 56, 3, 400, NULL, 0),
(61, 'Reports', NULL, 52, 2, 300, NULL, 1),
(62, 'Project Reports', 57, 61, 3, 100, '?reportId=1', 0),
(63, 'Employee Reports', 58, 61, 3, 200, '?reportId=2', 0),
(64, 'Attendance Summary', 59, 61, 3, 300, '?reportId=4', 0),
(65, 'Recruitment', 76, NULL, 1, 500, NULL, 1),
(66, 'Candidates', 60, 65, 2, 100, NULL, 1),
(67, 'Vacancies', 61, 65, 2, 200, NULL, 1),
(74, 'Entitlements', NULL, 41, 2, 300, NULL, 0),
(75, 'Add Entitlements', 72, 74, 3, 100, NULL, 1),
(76, 'My Entitlements', 70, 74, 3, 300, '/reset/1', 1),
(77, 'Employee Entitlements', 69, 74, 3, 200, '/reset/1', 1),
(78, 'Reports', NULL, 41, 2, 400, NULL, 0),
(79, 'Leave Entitlements and Usage Report', 78, 78, 3, 100, NULL, 1),
(80, 'My Leave Entitlements and Usage Report', 79, 78, 3, 200, NULL, 1),
(81, 'Users', 1, 2, 3, 100, NULL, 1),
(82, 'Dashboard', 103, NULL, 1, 800, NULL, 1),
(83, 'Performance', NULL, NULL, 1, 700, '', 1),
(84, 'Configure', NULL, 83, 2, 100, '', 1),
(85, 'Manage Reviews', NULL, 83, 2, 200, '', 1),
(86, 'KPIs', 105, 84, 3, 100, '', 1),
(87, 'Manage Reviews', 111, 85, 3, 100, '', 1),
(88, 'My Reviews', 106, 85, 3, 200, '', 1),
(89, 'Review List', 110, 85, 3, 300, '', 1),
(90, 'Trackers', 112, 84, 3, 200, NULL, 1),
(91, 'Employee Trackers', 113, 83, 2, 800, NULL, 1),
(92, 'My Trackers', 114, 83, 2, 700, NULL, 1),
(93, 'Directory', 116, NULL, 1, 1000, '/reset/1', 1),
(94, 'Social Media Authentication', 117, 23, 3, 500, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_module`
--

CREATE TABLE IF NOT EXISTS `ohrm_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `ohrm_module`
--

INSERT INTO `ohrm_module` (`id`, `name`, `status`) VALUES
(1, 'core', 1),
(2, 'admin', 1),
(3, 'pim', 1),
(4, 'leave', 1),
(5, 'time', 0),
(6, 'attendance', 0),
(7, 'recruitment', 0),
(8, 'recruitmentApply', 0),
(9, 'communication', 1),
(10, 'dashboard', 1),
(11, 'performance', 0),
(12, 'directory', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_module_default_page`
--

CREATE TABLE IF NOT EXISTS `ohrm_module_default_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `enable_class` varchar(100) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT 'lowest priority 0',
  PRIMARY KEY (`id`),
  KEY `user_role_id` (`user_role_id`),
  KEY `module_id` (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `ohrm_module_default_page`
--

INSERT INTO `ohrm_module_default_page` (`id`, `module_id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES
(1, 2, 1, 'admin/viewSystemUsers', NULL, 20),
(2, 3, 1, 'pim/viewEmployeeList', NULL, 20),
(3, 3, 3, 'pim/viewEmployeeList', NULL, 10),
(4, 3, 2, 'pim/viewMyDetails', NULL, 0),
(5, 4, 1, 'leave/viewLeaveList/reset/1', NULL, 20),
(6, 4, 3, 'leave/viewLeaveList/reset/1', NULL, 10),
(7, 4, 2, 'leave/viewMyLeaveList', NULL, 0),
(8, 4, 1, 'leave/defineLeavePeriod', 'LeavePeriodDefinedHomePageEnabler', 100),
(9, 4, 2, 'leave/showLeavePeriodNotDefinedWarning', 'LeavePeriodDefinedHomePageEnabler', 90),
(10, 5, 1, 'time/viewEmployeeTimesheet', NULL, 20),
(11, 5, 2, 'time/viewMyTimesheet', NULL, 0),
(12, 5, 1, 'time/defineTimesheetPeriod', 'TimesheetPeriodDefinedHomePageEnabler', 100),
(13, 5, 2, 'time/timesheetPeriodNotDefined', 'TimesheetPeriodDefinedHomePageEnabler', 100),
(14, 7, 1, 'recruitment/viewCandidates', NULL, 20),
(15, 7, 5, 'recruitment/viewCandidates', NULL, 10),
(16, 7, 6, 'recruitment/viewCandidates', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_nationality`
--

CREATE TABLE IF NOT EXISTS `ohrm_nationality` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=194 ;

--
-- Dumping data for table `ohrm_nationality`
--

INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES
(1, 'Afghan'),
(2, 'Albanian'),
(3, 'Algerian'),
(4, 'American'),
(5, 'Andorran'),
(6, 'Angolan'),
(7, 'Antiguans'),
(8, 'Argentinean'),
(9, 'Armenian'),
(10, 'Australian'),
(11, 'Austrian'),
(12, 'Azerbaijani'),
(13, 'Bahamian'),
(14, 'Bahraini'),
(15, 'Bangladeshi'),
(16, 'Barbadian'),
(17, 'Barbudans'),
(18, 'Batswana'),
(19, 'Belarusian'),
(20, 'Belgian'),
(21, 'Belizean'),
(22, 'Beninese'),
(23, 'Bhutanese'),
(24, 'Bolivian'),
(25, 'Bosnian'),
(26, 'Brazilian'),
(27, 'British'),
(28, 'Bruneian'),
(29, 'Bulgarian'),
(30, 'Burkinabe'),
(31, 'Burmese'),
(32, 'Burundian'),
(33, 'Cambodian'),
(34, 'Cameroonian'),
(35, 'Canadian'),
(36, 'Cape Verdean'),
(37, 'Central African'),
(38, 'Chadian'),
(39, 'Chilean'),
(40, 'Chinese'),
(41, 'Colombian'),
(42, 'Comoran'),
(43, 'Congolese'),
(44, 'Costa Rican'),
(45, 'Croatian'),
(46, 'Cuban'),
(47, 'Cypriot'),
(48, 'Czech'),
(49, 'Danish'),
(50, 'Djibouti'),
(51, 'Dominican'),
(52, 'Dutch'),
(53, 'East Timorese'),
(54, 'Ecuadorean'),
(55, 'Egyptian'),
(56, 'Emirian'),
(57, 'Equatorial Guinean'),
(58, 'Eritrean'),
(59, 'Estonian'),
(60, 'Ethiopian'),
(61, 'Fijian'),
(62, 'Filipino'),
(63, 'Finnish'),
(64, 'French'),
(65, 'Gabonese'),
(66, 'Gambian'),
(67, 'Georgian'),
(68, 'German'),
(69, 'Ghanaian'),
(70, 'Greek'),
(71, 'Grenadian'),
(72, 'Guatemalan'),
(73, 'Guinea-Bissauan'),
(74, 'Guinean'),
(75, 'Guyanese'),
(76, 'Haitian'),
(77, 'Herzegovinian'),
(78, 'Honduran'),
(79, 'Hungarian'),
(80, 'I-Kiribati'),
(81, 'Icelander'),
(82, 'Indian'),
(83, 'Indonesian'),
(84, 'Iranian'),
(85, 'Iraqi'),
(86, 'Irish'),
(87, 'Israeli'),
(88, 'Italian'),
(89, 'Ivorian'),
(90, 'Jamaican'),
(91, 'Japanese'),
(92, 'Jordanian'),
(93, 'Kazakhstani'),
(94, 'Kenyan'),
(95, 'Kittian and Nevisian'),
(96, 'Kuwaiti'),
(97, 'Kyrgyz'),
(98, 'Laotian'),
(99, 'Latvian'),
(100, 'Lebanese'),
(101, 'Liberian'),
(102, 'Libyan'),
(103, 'Liechtensteiner'),
(104, 'Lithuanian'),
(105, 'Luxembourger'),
(106, 'Macedonian'),
(107, 'Malagasy'),
(108, 'Malawian'),
(109, 'Malaysian'),
(110, 'Maldivan'),
(111, 'Malian'),
(112, 'Maltese'),
(113, 'Marshallese'),
(114, 'Mauritanian'),
(115, 'Mauritian'),
(116, 'Mexican'),
(117, 'Micronesian'),
(118, 'Moldovan'),
(119, 'Monacan'),
(120, 'Mongolian'),
(121, 'Moroccan'),
(122, 'Mosotho'),
(123, 'Motswana'),
(124, 'Mozambican'),
(125, 'Namibian'),
(126, 'Nauruan'),
(127, 'Nepalese'),
(128, 'New Zealander'),
(129, 'Nicaraguan'),
(130, 'Nigerian'),
(131, 'Nigerien'),
(132, 'North Korean'),
(133, 'Northern Irish'),
(134, 'Norwegian'),
(135, 'Omani'),
(136, 'Pakistani'),
(137, 'Palauan'),
(138, 'Panamanian'),
(139, 'Papua New Guinean'),
(140, 'Paraguayan'),
(141, 'Peruvian'),
(142, 'Polish'),
(143, 'Portuguese'),
(144, 'Qatari'),
(145, 'Romanian'),
(146, 'Russian'),
(147, 'Rwandan'),
(148, 'Saint Lucian'),
(149, 'Salvadoran'),
(150, 'Samoan'),
(151, 'San Marinese'),
(152, 'Sao Tomean'),
(153, 'Saudi'),
(154, 'Scottish'),
(155, 'Senegalese'),
(156, 'Serbian'),
(157, 'Seychellois'),
(158, 'Sierra Leonean'),
(159, 'Singaporean'),
(160, 'Slovakian'),
(161, 'Slovenian'),
(162, 'Solomon Islander'),
(163, 'Somali'),
(164, 'South African'),
(165, 'South Korean'),
(166, 'Spanish'),
(167, 'Sri Lankan'),
(168, 'Sudanese'),
(169, 'Surinamer'),
(170, 'Swazi'),
(171, 'Swedish'),
(172, 'Swiss'),
(173, 'Syrian'),
(174, 'Taiwanese'),
(175, 'Tajik'),
(176, 'Tanzanian'),
(177, 'Thai'),
(178, 'Togolese'),
(179, 'Tongan'),
(180, 'Trinidadian or Tobagonian'),
(181, 'Tunisian'),
(182, 'Turkish'),
(183, 'Tuvaluan'),
(184, 'Ugandan'),
(185, 'Ukrainian'),
(186, 'Uruguayan'),
(187, 'Uzbekistani'),
(188, 'Venezuelan'),
(189, 'Vietnamese'),
(190, 'Welsh'),
(191, 'Yemenite'),
(192, 'Zambian'),
(193, 'Zimbabwean');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_access_token`
--

CREATE TABLE IF NOT EXISTS `ohrm_oauth_access_token` (
  `access_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`access_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_authorization_code`
--

CREATE TABLE IF NOT EXISTS `ohrm_oauth_authorization_code` (
  `authorization_code` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `redirect_uri` varchar(2000) NOT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`authorization_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_client`
--

CREATE TABLE IF NOT EXISTS `ohrm_oauth_client` (
  `client_id` varchar(80) NOT NULL,
  `client_secret` varchar(80) NOT NULL,
  `redirect_uri` varchar(2000) NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_refresh_token`
--

CREATE TABLE IF NOT EXISTS `ohrm_oauth_refresh_token` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`refresh_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_user`
--

CREATE TABLE IF NOT EXISTS `ohrm_oauth_user` (
  `username` varchar(255) NOT NULL,
  `password` varchar(2000) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_openid_provider`
--

CREATE TABLE IF NOT EXISTS `ohrm_openid_provider` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `provider_name` varchar(40) DEFAULT NULL,
  `provider_url` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_openid_user_identity`
--

CREATE TABLE IF NOT EXISTS `ohrm_openid_user_identity` (
  `user_id` int(10) DEFAULT NULL,
  `provider_id` int(10) DEFAULT NULL,
  `user_identity` varchar(255) DEFAULT NULL,
  KEY `ohrm_user_identity_ibfk_1` (`user_id`),
  KEY `ohrm_user_identity_ibfk_2` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_operational_country`
--

CREATE TABLE IF NOT EXISTS `ohrm_operational_country` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_code` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ohrm_operational_country_hs_hr_country` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_organization_gen_info`
--

CREATE TABLE IF NOT EXISTS `ohrm_organization_gen_info` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `tax_id` varchar(30) DEFAULT NULL,
  `registration_number` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `province` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `zip_code` varchar(30) DEFAULT NULL,
  `street1` varchar(100) DEFAULT NULL,
  `street2` varchar(100) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ohrm_organization_gen_info`
--

INSERT INTO `ohrm_organization_gen_info` (`id`, `name`, `tax_id`, `registration_number`, `phone`, `fax`, `email`, `country`, `province`, `city`, `zip_code`, `street1`, `street2`, `note`) VALUES
(1, ' Mantis ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_pay_grade`
--

CREATE TABLE IF NOT EXISTS `ohrm_pay_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_pay_grade_currency`
--

CREATE TABLE IF NOT EXISTS `ohrm_pay_grade_currency` (
  `pay_grade_id` int(11) NOT NULL,
  `currency_id` varchar(6) NOT NULL DEFAULT '',
  `min_salary` double DEFAULT NULL,
  `max_salary` double DEFAULT NULL,
  PRIMARY KEY (`pay_grade_id`,`currency_id`),
  KEY `currency_id` (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_performance_review`
--

CREATE TABLE IF NOT EXISTS `ohrm_performance_review` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `status_id` int(7) DEFAULT NULL,
  `employee_number` int(7) DEFAULT NULL,
  `work_period_start` date DEFAULT NULL,
  `work_period_end` date DEFAULT NULL,
  `job_title_code` int(7) DEFAULT NULL,
  `department_id` int(7) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `completed_date` date DEFAULT NULL,
  `activated_date` datetime DEFAULT NULL,
  `final_comment` text CHARACTER SET utf8 COLLATE utf8_bin,
  `final_rate` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_number` (`employee_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_performance_track`
--

CREATE TABLE IF NOT EXISTS `ohrm_performance_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_number` int(7) NOT NULL,
  `tracker_name` varchar(200) NOT NULL,
  `added_date` timestamp NULL DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ohrm_performance_track_fk1_idx` (`emp_number`),
  KEY `ohrm_performance_track_fk2_idx` (`added_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_performance_tracker_log`
--

CREATE TABLE IF NOT EXISTS `ohrm_performance_tracker_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `performance_track_id` int(11) DEFAULT NULL,
  `log` varchar(150) DEFAULT NULL,
  `comment` varchar(3000) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `added_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `reviewer_id` int(7) DEFAULT NULL,
  `achievement` varchar(45) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ohrm_performance_tracker_log_fk1_idx` (`performance_track_id`),
  KEY `ohrm_performance_tracker_log_fk2_idx` (`reviewer_id`),
  KEY `fk_ohrm_performance_tracker_log_1` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_performance_tracker_reviewer`
--

CREATE TABLE IF NOT EXISTS `ohrm_performance_tracker_reviewer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `performance_track_id` int(11) NOT NULL,
  `reviewer_id` int(7) NOT NULL,
  `added_date` timestamp NULL DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ohrm_performance_tracker_reviewer_fk1_idx` (`performance_track_id`),
  KEY `ohrm_performance_tracker_reviewer_fk2_idx` (`reviewer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_plugin`
--

CREATE TABLE IF NOT EXISTS `ohrm_plugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `version` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_project`
--

CREATE TABLE IF NOT EXISTS `ohrm_project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`project_id`,`customer_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_project_activity`
--

CREATE TABLE IF NOT EXISTS `ohrm_project_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(110) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`activity_id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_project_admin`
--

CREATE TABLE IF NOT EXISTS `ohrm_project_admin` (
  `project_id` int(11) NOT NULL,
  `emp_number` int(11) NOT NULL,
  PRIMARY KEY (`project_id`,`emp_number`),
  KEY `emp_number` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_report`
--

CREATE TABLE IF NOT EXISTS `ohrm_report` (
  `report_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `use_filter_field` tinyint(1) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `report_group_id` (`report_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ohrm_report`
--

INSERT INTO `ohrm_report` (`report_id`, `name`, `report_group_id`, `use_filter_field`, `type`) VALUES
(1, 'Project Report', 1, 1, NULL),
(2, 'Employee Report', 1, 1, NULL),
(3, 'Project Activity Details', 1, 1, NULL),
(4, 'Attendance Total Summary Report', 2, 0, NULL),
(5, 'PIM Sample Report', 3, 1, 'PIM_DEFINED');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_report_group`
--

CREATE TABLE IF NOT EXISTS `ohrm_report_group` (
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `core_sql` mediumtext NOT NULL,
  PRIMARY KEY (`report_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_report_group`
--

INSERT INTO `ohrm_report_group` (`report_group_id`, `name`, `core_sql`) VALUES
(1, 'timesheet', 'SELECT selectCondition FROM ohrm_project_activity LEFT JOIN (SELECT * FROM ohrm_timesheet_item WHERE whereCondition1) AS ohrm_timesheet_item  ON (ohrm_timesheet_item.activity_id = ohrm_project_activity.activity_id) LEFT JOIN ohrm_project ON (ohrm_project.project_id = ohrm_project_activity.project_id) LEFT JOIN hs_hr_employee ON (hs_hr_employee.emp_number = ohrm_timesheet_item.employee_id) LEFT JOIN ohrm_timesheet ON (ohrm_timesheet.timesheet_id = ohrm_timesheet_item.timesheet_id) LEFT JOIN ohrm_customer ON (ohrm_customer.customer_id = ohrm_project.customer_id) WHERE whereCondition2 groupByClause ORDER BY ohrm_customer.name, ohrm_project.name, ohrm_project_activity.name, hs_hr_employee.emp_lastname, hs_hr_employee.emp_firstname'),
(2, 'attendance', 'SELECT selectCondition FROM hs_hr_employee LEFT JOIN (SELECT * FROM ohrm_attendance_record WHERE ( ( ohrm_attendance_record.punch_in_user_time BETWEEN "#@fromDate@,@1970-01-01@#" AND #@"toDate"@,@CURDATE()@# ) AND ( ohrm_attendance_record.punch_out_user_time BETWEEN "#@fromDate@,@1970-01-01@#" AND #@"toDate"@,@CURDATE()@# ) ) ) AS ohrm_attendance_record ON (hs_hr_employee.emp_number = ohrm_attendance_record.employee_id) WHERE hs_hr_employee.emp_number = #@employeeId@,@hs_hr_employee.emp_number AND (hs_hr_employee.termination_id is null) @# AND (hs_hr_employee.job_title_code = #@"jobTitle")@,@hs_hr_employee.job_title_code OR hs_hr_employee.job_title_code is null)@# AND (hs_hr_employee.work_station IN (#@subUnit)@,@SELECT id FROM ohrm_subunit) OR hs_hr_employee.work_station is null@#) AND (hs_hr_employee.emp_status = #@"employeeStatus")@,@hs_hr_employee.emp_status OR hs_hr_employee.emp_status is null)@# groupByClause ORDER BY hs_hr_employee.emp_lastname, hs_hr_employee.emp_firstname'),
(3, 'pim', 'SELECT selectCondition FROM hs_hr_employee \n                    LEFT JOIN hs_hr_emp_emergency_contacts ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_emergency_contacts.emp_number) \n                    LEFT JOIN ohrm_subunit ON \n                        (hs_hr_employee.work_station = ohrm_subunit.id) \n                    LEFT JOIN ohrm_employment_status ON \n                        (hs_hr_employee.emp_status = ohrm_employment_status.id) \n                    LEFT JOIN ohrm_job_title ON\n                        (hs_hr_employee.job_title_code = ohrm_job_title.id)\n                    LEFT JOIN ohrm_job_category ON \n                        (hs_hr_employee.eeo_cat_code = ohrm_job_category.id) \n                    LEFT JOIN ohrm_nationality ON\n                        (hs_hr_employee.nation_code = ohrm_nationality.id)\n                    LEFT JOIN hs_hr_emp_dependents ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_dependents.emp_number)\n                    LEFT JOIN hs_hr_emp_locations AS emp_location ON\n                        (hs_hr_employee.emp_number = emp_location.emp_number)\n                    LEFT JOIN ohrm_location ON\n                        (emp_location.location_id = ohrm_location.id)\n                    LEFT JOIN hs_hr_emp_contract_extend ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_contract_extend.emp_number) \n                    LEFT JOIN hs_hr_emp_basicsalary ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_basicsalary.emp_number) \n                    LEFT JOIN ohrm_pay_grade ON \n                        (hs_hr_emp_basicsalary.sal_grd_code = ohrm_pay_grade.id) \n                    LEFT JOIN hs_hr_currency_type ON \n                        (hs_hr_emp_basicsalary.currency_id = hs_hr_currency_type.currency_id) \n                    LEFT JOIN hs_hr_payperiod ON \n                        (hs_hr_emp_basicsalary.payperiod_code = hs_hr_payperiod.payperiod_code) \n                    LEFT JOIN hs_hr_emp_passport ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_passport.emp_number) \n                    LEFT JOIN hs_hr_emp_reportto AS subordinate_list ON \n                        (hs_hr_employee.emp_number = subordinate_list.erep_sup_emp_number) \n                    LEFT JOIN hs_hr_employee AS subordinate ON\n                        (subordinate.emp_number = subordinate_list.erep_sub_emp_number)\n                    LEFT JOIN ohrm_emp_reporting_method AS subordinate_reporting_method ON \n                        (subordinate_list.erep_reporting_mode = subordinate_reporting_method.reporting_method_id) \n                    LEFT JOIN hs_hr_emp_work_experience ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_work_experience.emp_number) \n                    LEFT JOIN ohrm_emp_education ON \n                        (hs_hr_employee.emp_number = ohrm_emp_education.emp_number) \n                    LEFT JOIN ohrm_education ON \n                        (ohrm_emp_education.education_id = ohrm_education.id) \n                    LEFT JOIN hs_hr_emp_skill ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_skill.emp_number) \n                    LEFT JOIN ohrm_skill ON \n                        (hs_hr_emp_skill.skill_id = ohrm_skill.id) \n                    LEFT JOIN hs_hr_emp_language ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_language.emp_number) \n                    LEFT JOIN ohrm_language ON \n                        (hs_hr_emp_language.lang_id = ohrm_language.id) \n                    LEFT JOIN ohrm_emp_license ON \n                        (hs_hr_employee.emp_number = ohrm_emp_license.emp_number) \n                    LEFT JOIN ohrm_license ON \n                        (ohrm_emp_license.license_id = ohrm_license.id) \n                    LEFT JOIN hs_hr_emp_member_detail ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_member_detail.emp_number) \n                    LEFT JOIN ohrm_membership ON\n                        (hs_hr_emp_member_detail.membship_code = ohrm_membership.id)\n                    LEFT JOIN hs_hr_country ON \n                        (hs_hr_employee.coun_code = hs_hr_country.cou_code) \n                    LEFT JOIN hs_hr_emp_directdebit ON \n                        (hs_hr_emp_basicsalary.id = hs_hr_emp_directdebit.salary_id) \n                    LEFT JOIN hs_hr_emp_reportto AS supervisor_list ON \n                        (hs_hr_employee.emp_number = supervisor_list.erep_sub_emp_number) \n                    LEFT JOIN hs_hr_employee AS supervisor ON\n                        (supervisor.emp_number = supervisor_list.erep_sup_emp_number)\n                    LEFT JOIN ohrm_emp_reporting_method AS supervisor_reporting_method ON \n                        (supervisor_list.erep_reporting_mode = supervisor_reporting_method.reporting_method_id) \n                    LEFT JOIN ohrm_emp_termination ON\n                        (hs_hr_employee.termination_id = ohrm_emp_termination.id)\n                    LEFT JOIN ohrm_emp_termination_reason ON\n                        (ohrm_emp_termination.reason_id = ohrm_emp_termination_reason.id)\n                WHERE hs_hr_employee.emp_number in (\n                    SELECT hs_hr_employee.emp_number FROM hs_hr_employee\n                        LEFT JOIN hs_hr_emp_basicsalary ON \n                            (hs_hr_employee.emp_number = hs_hr_emp_basicsalary.emp_number) \n                        LEFT JOIN ohrm_emp_education ON \n                            (hs_hr_employee.emp_number = ohrm_emp_education.emp_number) \n                        LEFT JOIN hs_hr_emp_skill ON \n                            (hs_hr_employee.emp_number = hs_hr_emp_skill.emp_number) \n                        LEFT JOIN hs_hr_emp_language ON \n                            (hs_hr_employee.emp_number = hs_hr_emp_language.emp_number) \n                    WHERE whereCondition1\n                )\n                GROUP BY \n                     hs_hr_employee.emp_number,\n                     hs_hr_employee.emp_lastname,\n                     hs_hr_employee.emp_firstname,\n                     hs_hr_employee.emp_middle_name,\n                     hs_hr_employee.emp_birthday,\n                     ohrm_nationality.name,\n                     hs_hr_employee.emp_gender,\n                     hs_hr_employee.emp_marital_status,\n                     hs_hr_employee.emp_dri_lice_num,\n                     hs_hr_employee.emp_dri_lice_exp_date,\n                     hs_hr_employee.emp_street1,\n                     hs_hr_employee.emp_street2,\n                     hs_hr_employee.city_code,\n                     hs_hr_employee.provin_code,\n                     hs_hr_employee.emp_zipcode,\n                     hs_hr_country.cou_code,\n                     hs_hr_employee.emp_hm_telephone,\n                     hs_hr_employee.emp_mobile,\n                     hs_hr_employee.emp_work_telephone,\n                     hs_hr_employee.emp_work_email,\n                     hs_hr_employee.emp_oth_email\n\nORDER BY hs_hr_employee.emp_lastname\n');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_reviewer`
--

CREATE TABLE IF NOT EXISTS `ohrm_reviewer` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `review_id` int(7) DEFAULT NULL,
  `employee_number` int(7) DEFAULT NULL,
  `status` int(7) DEFAULT NULL,
  `reviewer_group_id` int(7) DEFAULT NULL,
  `completed_date` datetime DEFAULT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `review_id` (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_reviewer_group`
--

CREATE TABLE IF NOT EXISTS `ohrm_reviewer_group` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `piority` int(7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ohrm_reviewer_group`
--

INSERT INTO `ohrm_reviewer_group` (`id`, `name`, `piority`) VALUES
(1, 'Supervisor', 1),
(2, 'Employee', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_reviewer_rating`
--

CREATE TABLE IF NOT EXISTS `ohrm_reviewer_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` decimal(18,2) DEFAULT NULL,
  `kpi_id` int(7) DEFAULT NULL,
  `review_id` int(7) DEFAULT NULL,
  `reviewer_id` int(7) NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `review_id` (`review_id`),
  KEY `reviewer_id` (`reviewer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_role_user_selection_rule`
--

CREATE TABLE IF NOT EXISTS `ohrm_role_user_selection_rule` (
  `user_role_id` int(10) NOT NULL,
  `selection_rule_id` int(10) NOT NULL,
  `configurable_params` text,
  PRIMARY KEY (`user_role_id`,`selection_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_screen`
--

CREATE TABLE IF NOT EXISTS `ohrm_screen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `module_id` int(11) NOT NULL,
  `action_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `module_id` (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=118 ;

--
-- Dumping data for table `ohrm_screen`
--

INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES
(1, 'User List', 2, 'viewSystemUsers'),
(2, 'Add/Edit System User', 2, 'saveSystemUser'),
(3, 'Delete System Users', 2, 'deleteSystemUsers'),
(4, 'Add Employee', 3, 'addEmployee'),
(5, 'View Employee List', 3, 'viewEmployeeList'),
(6, 'Delete Employees', 3, 'deleteEmployees'),
(7, 'Leave Type List', 4, 'leaveTypeList'),
(8, 'Define Leave Type', 4, 'defineLeaveType'),
(9, 'Undelete Leave Type', 4, 'undeleteLeaveType'),
(10, 'Delete Leave Type', 4, 'deleteLeaveType'),
(11, 'View Holiday List', 4, 'viewHolidayList'),
(12, 'Define Holiday', 4, 'defineHoliday'),
(13, 'Delete Holiday', 4, 'deleteHoliday'),
(14, 'Define WorkWeek', 4, 'defineWorkWeek'),
(16, 'Leave List', 4, 'viewLeaveList'),
(17, 'Assign Leave', 4, 'assignLeave'),
(18, 'View Leave Summary', 4, 'viewLeaveSummary'),
(19, 'Save Leave Entitlements', 4, 'saveLeaveEntitlements'),
(20, 'General Information', 2, 'viewOrganizationGeneralInformation'),
(21, 'Location List', 2, 'viewLocations'),
(22, 'View Company Structure', 2, 'viewCompanyStructure'),
(23, 'Job Title List', 2, 'viewJobTitleList'),
(24, 'Pay Grade List', 2, 'viewPayGrades'),
(25, 'Employment Status List', 2, 'employmentStatus'),
(26, 'Job Category List', 2, 'jobCategory'),
(27, 'Work Shift List', 2, 'workShift'),
(28, 'Skill List', 2, 'viewSkills'),
(29, 'Education List', 2, 'viewEducation'),
(30, 'License List', 2, 'viewLicenses'),
(31, 'Language List', 2, 'viewLanguages'),
(32, 'Membership List', 2, 'membership'),
(33, 'Nationality List', 2, 'nationality'),
(34, 'Add/Edit Mail Configuration', 2, 'listMailConfiguration'),
(35, 'Notification List', 2, 'viewEmailNotification'),
(36, 'Customer List', 2, 'viewCustomers'),
(37, 'Project List', 2, 'viewProjects'),
(38, 'Localization', 2, 'localization'),
(39, 'Module Configuration', 2, 'viewModules'),
(40, 'Configure PIM', 3, 'configurePim'),
(41, 'Custom Field List', 3, 'listCustomFields'),
(42, 'Data Import', 2, 'pimCsvImport'),
(43, 'Reporting Method List', 3, 'viewReportingMethods'),
(44, 'Termination Reason List', 3, 'viewTerminationReasons'),
(45, 'PIM Reports List', 1, 'viewDefinedPredefinedReports'),
(46, 'View MyInfo', 3, 'viewMyDetails'),
(47, 'Define Leave Period', 4, 'defineLeavePeriod'),
(48, 'View My Leave List', 4, 'viewMyLeaveList'),
(49, 'Apply Leave', 4, 'applyLeave'),
(50, 'Define Timesheet Start Date', 5, 'defineTimesheetPeriod'),
(51, 'View My Timesheet', 5, 'viewMyTimesheet'),
(52, 'View Employee Timesheet', 5, 'viewEmployeeTimesheet'),
(53, 'View My Attendance', 6, 'viewMyAttendanceRecord'),
(54, 'Punch In/Out', 6, 'punchIn'),
(55, 'View Employee Attendance', 6, 'viewAttendanceRecord'),
(56, 'Attendance Configuration', 6, 'configure'),
(57, 'View Project Report Criteria', 5, 'displayProjectReportCriteria'),
(58, 'View Employee Report Criteria', 5, 'displayEmployeeReportCriteria'),
(59, 'View Attendance Report Criteria', 5, 'displayAttendanceSummaryReportCriteria'),
(60, 'Candidate List', 7, 'viewCandidates'),
(61, 'Vacancy List', 7, 'viewJobVacancy'),
(67, 'View Time Module', 5, 'viewTimeModule'),
(68, 'View Leave Module', 4, 'viewLeaveModule'),
(69, 'Leave Entitlements', 4, 'viewLeaveEntitlements'),
(70, 'My Leave Entitlements', 4, 'viewMyLeaveEntitlements'),
(71, 'Delete Leave Entitlements', 4, 'deleteLeaveEntitlements'),
(72, 'Add Leave Entitlement', 4, 'addLeaveEntitlement'),
(73, 'Edit Leave Entitlement', 4, 'editLeaveEntitlement'),
(74, 'View Admin Module', 2, 'viewAdminModule'),
(75, 'View PIM Module', 3, 'viewPimModule'),
(76, 'View Recruitment Module', 7, 'viewRecruitmentModule'),
(78, 'Leave Balance Report', 4, 'viewLeaveBalanceReport'),
(79, 'My Leave Balance Report', 4, 'viewMyLeaveBalanceReport'),
(80, 'Save Job Title', 2, 'saveJobTitle'),
(81, 'Delete Job Title', 2, 'deleteJobTitle'),
(82, 'Save Pay Grade', 2, 'payGrade'),
(83, 'Delete Pay Grade', 2, 'deletePayGrades'),
(84, 'Save Pay Grade Currency', 2, 'savePayGradeCurrency'),
(85, 'Delete Pay Grade Currency', 2, 'deletePayGradeCurrency'),
(86, 'Add Customer', 2, 'addCustomer'),
(87, 'Delete Customer', 2, 'deleteCustomer'),
(88, 'Save Project', 2, 'saveProject'),
(89, 'Delete Project', 2, 'deleteProject'),
(90, 'Add Project Adtivity', 2, 'addProjectActivity'),
(91, 'Delete Project Adtivity', 2, 'deleteProjectActivity'),
(92, 'Define PIM reports', 1, 'definePredefinedReport'),
(93, 'Display PIM reports', 1, 'displayPredefinedReport'),
(94, 'Add Job Vacancy', 7, 'addJobVacancy'),
(95, 'Delete Job Vacancy', 7, 'deleteJobVacancy'),
(96, 'Add Candidate', 7, 'addCandidate'),
(97, 'Delete Candidate', 7, 'deleteCandidateVacancies'),
(98, 'View Leave Request', 4, 'viewLeaveRequest'),
(99, 'Change Leave Status', 4, 'changeLeaveStatus'),
(100, 'Terminate Employment', 3, 'terminateEmployement'),
(101, 'View Attendance Summary Report', 5, 'displayAttendanceSummaryReport'),
(102, 'View Project Activity Details Report', 5, 'displayProjectActivityDetailsReport'),
(103, 'Dashboard', 10, 'index'),
(104, 'Save KPI', 11, 'saveKpi'),
(105, 'Saearch KPI', 11, 'searchKpi'),
(106, 'My Reviews', 11, 'myPerformanceReview'),
(107, 'Add Review', 11, 'saveReview'),
(108, 'Review Evaluate', 11, 'reviewEvaluate'),
(109, 'Review Evaluate By Admin', 11, 'reviewEvaluateByAdmin'),
(110, 'Search Evaluate Performance', 11, 'searchEvaluatePerformancReview'),
(111, 'Search Performance Review', 11, 'searchPerformancReview'),
(112, 'Manage_Trackers', 11, 'addPerformanceTracker'),
(113, 'Employee_Trackers', 11, 'viewEmployeePerformanceTrackerList'),
(114, 'My_Trackers', 11, 'viewMyPerformanceTrackerList'),
(115, 'Employee_Tracker_Logs', 11, 'addPerformanceTrackerLog'),
(116, 'Directory', 12, 'viewDirectory'),
(117, 'Manage OpenId', 2, 'openIdProvider');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_composite_display_field`
--

CREATE TABLE IF NOT EXISTS `ohrm_selected_composite_display_field` (
  `id` bigint(20) NOT NULL,
  `composite_display_field_id` bigint(20) NOT NULL,
  `report_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`,`composite_display_field_id`,`report_id`),
  KEY `composite_display_field_id` (`composite_display_field_id`),
  KEY `report_id` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_selected_composite_display_field`
--

INSERT INTO `ohrm_selected_composite_display_field` (`id`, `composite_display_field_id`, `report_id`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_display_field`
--

CREATE TABLE IF NOT EXISTS `ohrm_selected_display_field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `display_field_id` bigint(20) NOT NULL,
  `report_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`,`display_field_id`,`report_id`),
  KEY `display_field_id` (`display_field_id`),
  KEY `report_id` (`report_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=94 ;

--
-- Dumping data for table `ohrm_selected_display_field`
--

INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES
(2, 2, 1),
(4, 8, 2),
(5, 9, 5),
(6, 10, 5),
(7, 11, 5),
(8, 12, 5),
(9, 13, 5),
(10, 14, 5),
(11, 15, 5),
(13, 17, 5),
(14, 18, 5),
(15, 19, 5),
(16, 20, 5),
(17, 21, 5),
(18, 22, 5),
(19, 23, 5),
(20, 24, 5),
(21, 25, 5),
(22, 26, 5),
(23, 27, 5),
(24, 28, 5),
(25, 29, 5),
(26, 30, 5),
(27, 31, 5),
(28, 32, 5),
(29, 33, 5),
(31, 35, 5),
(32, 36, 5),
(33, 37, 5),
(34, 38, 5),
(35, 39, 5),
(36, 40, 5),
(37, 41, 5),
(38, 42, 5),
(39, 43, 5),
(40, 44, 5),
(41, 45, 5),
(43, 47, 5),
(44, 48, 5),
(45, 49, 5),
(48, 52, 5),
(49, 53, 5),
(50, 54, 5),
(51, 55, 5),
(53, 57, 5),
(54, 58, 5),
(55, 59, 5),
(56, 60, 5),
(57, 61, 5),
(58, 62, 5),
(59, 63, 5),
(60, 64, 5),
(61, 65, 5),
(62, 66, 5),
(63, 67, 5),
(64, 68, 5),
(65, 69, 5),
(66, 70, 5),
(67, 71, 5),
(68, 72, 5),
(69, 73, 5),
(70, 74, 5),
(71, 75, 5),
(72, 76, 5),
(73, 77, 5),
(74, 78, 5),
(76, 80, 5),
(77, 81, 5),
(78, 82, 5),
(79, 83, 5),
(80, 84, 5),
(81, 85, 5),
(82, 86, 5),
(83, 87, 5),
(84, 88, 5),
(85, 89, 5),
(86, 90, 5),
(87, 91, 5),
(88, 92, 5),
(89, 93, 5),
(90, 94, 5),
(91, 95, 5),
(93, 97, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_display_field_group`
--

CREATE TABLE IF NOT EXISTS `ohrm_selected_display_field_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` bigint(20) NOT NULL,
  `display_field_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_id` (`report_id`),
  KEY `display_field_group_id` (`display_field_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `ohrm_selected_display_field_group`
--

INSERT INTO `ohrm_selected_display_field_group` (`id`, `report_id`, `display_field_group_id`) VALUES
(1, 5, 1),
(2, 5, 2),
(3, 5, 3),
(4, 5, 4),
(5, 5, 5),
(6, 5, 6),
(7, 5, 7),
(8, 5, 8),
(9, 5, 9),
(10, 5, 10),
(11, 5, 11),
(12, 5, 12),
(13, 5, 13),
(14, 5, 14),
(15, 5, 15);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_filter_field`
--

CREATE TABLE IF NOT EXISTS `ohrm_selected_filter_field` (
  `report_id` bigint(20) NOT NULL,
  `filter_field_id` bigint(20) NOT NULL,
  `filter_field_order` bigint(20) NOT NULL,
  `value1` varchar(255) DEFAULT NULL,
  `value2` varchar(255) DEFAULT NULL,
  `where_condition` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`report_id`,`filter_field_id`),
  KEY `report_id` (`report_id`),
  KEY `filter_field_id` (`filter_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_selected_filter_field`
--

INSERT INTO `ohrm_selected_filter_field` (`report_id`, `filter_field_id`, `filter_field_order`, `value1`, `value2`, `where_condition`, `type`) VALUES
(1, 1, 1, NULL, NULL, NULL, 'Runtime'),
(1, 3, 2, NULL, NULL, NULL, 'Runtime'),
(1, 7, 3, NULL, NULL, NULL, 'Runtime'),
(1, 21, 4, '0', NULL, '=', 'Predefined'),
(2, 3, 4, NULL, NULL, NULL, 'Runtime'),
(2, 4, 1, NULL, NULL, NULL, 'Runtime'),
(2, 5, 3, NULL, NULL, NULL, 'Runtime'),
(2, 6, 2, NULL, NULL, NULL, 'Runtime'),
(2, 7, 5, NULL, NULL, NULL, 'Runtime'),
(3, 3, 2, NULL, NULL, NULL, 'Runtime'),
(3, 5, 1, NULL, NULL, NULL, 'Runtime'),
(3, 7, 3, NULL, NULL, NULL, 'Runtime'),
(5, 22, 1, NULL, NULL, 'IS NULL', 'Predefined');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_group_field`
--

CREATE TABLE IF NOT EXISTS `ohrm_selected_group_field` (
  `group_field_id` bigint(20) NOT NULL,
  `summary_display_field_id` bigint(20) NOT NULL,
  `report_id` bigint(20) NOT NULL,
  PRIMARY KEY (`group_field_id`,`summary_display_field_id`,`report_id`),
  KEY `group_field_id` (`group_field_id`),
  KEY `summary_display_field_id` (`summary_display_field_id`),
  KEY `report_id` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_selected_group_field`
--

INSERT INTO `ohrm_selected_group_field` (`group_field_id`, `summary_display_field_id`, `report_id`) VALUES
(1, 1, 1),
(1, 1, 2),
(2, 1, 3),
(2, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_skill`
--

CREATE TABLE IF NOT EXISTS `ohrm_skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_subunit`
--

CREATE TABLE IF NOT EXISTS `ohrm_subunit` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `unit_id` varchar(100) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `lft` smallint(6) unsigned DEFAULT NULL,
  `rgt` smallint(6) unsigned DEFAULT NULL,
  `level` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ohrm_subunit`
--

INSERT INTO `ohrm_subunit` (`id`, `name`, `unit_id`, `description`, `lft`, `rgt`, `level`) VALUES
(1, 'Organization', '', '', 1, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_summary_display_field`
--

CREATE TABLE IF NOT EXISTS `ohrm_summary_display_field` (
  `summary_display_field_id` bigint(20) NOT NULL,
  `function` varchar(1000) NOT NULL,
  `label` varchar(255) NOT NULL,
  `field_alias` varchar(255) DEFAULT NULL,
  `is_sortable` varchar(10) NOT NULL,
  `sort_order` varchar(255) DEFAULT NULL,
  `sort_field` varchar(255) DEFAULT NULL,
  `element_type` varchar(255) NOT NULL,
  `element_property` varchar(1000) NOT NULL,
  `width` varchar(255) NOT NULL,
  `is_exportable` varchar(10) DEFAULT NULL,
  `text_alignment_style` varchar(20) DEFAULT NULL,
  `is_value_list` tinyint(1) NOT NULL DEFAULT '0',
  `display_field_group_id` int(10) unsigned DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`summary_display_field_id`),
  KEY `display_field_group_id` (`display_field_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_summary_display_field`
--

INSERT INTO `ohrm_summary_display_field` (`summary_display_field_id`, `function`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`) VALUES
(1, 'ROUND(COALESCE(sum(duration)/3600, 0),2)', 'Time (Hours)', 'totalduration', 'false', NULL, NULL, 'label', '<xml><getter>totalduration</getter></xml>', '100', 'false', 'right', 0, NULL, NULL),
(2, 'ROUND(COALESCE(sum(TIMESTAMPDIFF(SECOND , ohrm_attendance_record.punch_in_utc_time , ohrm_attendance_record.punch_out_utc_time))/3600, 0),2)', 'Time (Hours)', 'totalduration', 'false', NULL, NULL, 'label', '<xml><getter>totalduration</getter></xml>', '100', 'false', 'right', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_timesheet`
--

CREATE TABLE IF NOT EXISTS `ohrm_timesheet` (
  `timesheet_id` bigint(20) NOT NULL,
  `state` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  PRIMARY KEY (`timesheet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_timesheet_action_log`
--

CREATE TABLE IF NOT EXISTS `ohrm_timesheet_action_log` (
  `timesheet_action_log_id` bigint(20) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `date_time` date NOT NULL,
  `performed_by` int(20) NOT NULL,
  `timesheet_id` bigint(20) NOT NULL,
  PRIMARY KEY (`timesheet_action_log_id`),
  KEY `timesheet_id` (`timesheet_id`),
  KEY `performed_by` (`performed_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_timesheet_item`
--

CREATE TABLE IF NOT EXISTS `ohrm_timesheet_item` (
  `timesheet_item_id` bigint(20) NOT NULL,
  `timesheet_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `duration` bigint(20) DEFAULT NULL,
  `comment` text,
  `project_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `activity_id` bigint(20) NOT NULL,
  PRIMARY KEY (`timesheet_item_id`),
  KEY `timesheet_id` (`timesheet_id`),
  KEY `activity_id` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_upgrade_history`
--

CREATE TABLE IF NOT EXISTS `ohrm_upgrade_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `start_version` varchar(30) DEFAULT NULL,
  `end_version` varchar(30) DEFAULT NULL,
  `start_increment` int(11) NOT NULL,
  `end_increment` int(11) NOT NULL,
  `upgraded_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user`
--

CREATE TABLE IF NOT EXISTS `ohrm_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_role_id` int(10) NOT NULL,
  `emp_number` int(13) DEFAULT NULL,
  `user_name` varchar(40) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` int(10) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `user_role_id` (`user_role_id`),
  KEY `emp_number` (`emp_number`),
  KEY `modified_user_id` (`modified_user_id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `ohrm_user`
--

INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES
(1, 1, NULL, 'Admin', '$2a$12$8RiRKF8F8jKCO.ZdR8D5Q.aHpRpfbEgt0.cByr/hR40mXZYl0WO4e', 0, 1, NULL, NULL, NULL, NULL),
(2, 2, 1, 'johannalpapara', '$2a$12$AhgpgBcE5dTeYibqUW0Isec2ILihmfsTHxN8on3kRI2pMdTrB4DAu', 0, 1, '2016-10-25 01:01:56', NULL, NULL, 1),
(6, 2, 5, 'lizbethralpapara', '$2a$12$1nRJs0.Sfsk.H92UH/zVL.cDm4RrhEyggbGLHTMx5sG27V49ZsTqu', 0, 1, '2016-10-26 19:00:52', NULL, NULL, 1),
(7, 2, 6, 'janerrienbeltran', '$2a$12$YlnxcM7pwbBkWTotYgM7n.t1svRv1e7rbFyyhj.CrHwQ9dxOzb9Ve', 0, 1, '2016-10-26 19:15:48', NULL, NULL, 1),
(8, 2, 7, 'rodeliocbautista', '$2a$12$Am4pUcNiZADwuFmjhpxRWeHui6M0BC.h0Ipo.OW8.aO7Uiyv9RA5e', 0, 1, '2016-10-26 19:19:15', NULL, NULL, 1),
(9, 2, 9, 'ryandexterpcruz', '$2a$12$lcglX84yW3P7DJVQuQBXm.6yTdaMO9G/OfYNEyymh4xfgCLvbp6rK', 0, 1, '2016-10-26 19:23:05', NULL, NULL, 1),
(10, 2, 10, 'roscelletgarcia', '$2a$12$PY7MbyiffqcimepTNB9FXuTll.uOHjHJB9dkngAw85z5Sr3je/uRK', 0, 1, '2016-10-26 19:23:50', NULL, NULL, 1),
(11, 2, 11, 'jocelynrperina', '$2a$12$LlqLyxTVhYriSnV3HlCq9.TzsqxyYVa56pQJJGiY09SPCTLHVOJEO', 0, 1, '2016-10-26 19:24:33', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user_role`
--

CREATE TABLE IF NOT EXISTS `ohrm_user_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `is_assignable` tinyint(1) DEFAULT '0',
  `is_predefined` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_role_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ohrm_user_role`
--

INSERT INTO `ohrm_user_role` (`id`, `name`, `display_name`, `is_assignable`, `is_predefined`) VALUES
(1, 'Admin', 'Admin', 1, 1),
(2, 'ESS', 'ESS', 1, 1),
(3, 'Supervisor', 'Supervisor', 0, 1),
(4, 'ProjectAdmin', 'ProjectAdmin', 0, 1),
(5, 'Interviewer', 'Interviewer', 0, 1),
(6, 'HiringManager', 'HiringManager', 0, 1),
(7, 'Reviewer', 'Reviewer', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user_role_data_group`
--

CREATE TABLE IF NOT EXISTS `ohrm_user_role_data_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_role_id` int(11) DEFAULT NULL,
  `data_group_id` int(11) DEFAULT NULL,
  `can_read` tinyint(4) DEFAULT NULL,
  `can_create` tinyint(4) DEFAULT NULL,
  `can_update` tinyint(4) DEFAULT NULL,
  `can_delete` tinyint(4) DEFAULT NULL,
  `self` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_role_id` (`user_role_id`),
  KEY `data_group_id` (`data_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=227 ;

--
-- Dumping data for table `ohrm_user_role_data_group`
--

INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES
(1, 1, 1, 1, NULL, 1, NULL, 0),
(2, 1, 2, 1, 1, 1, 1, 0),
(3, 1, 3, 1, NULL, 1, NULL, 0),
(4, 1, 4, 1, NULL, 1, NULL, 0),
(5, 1, 5, 1, 1, 1, 1, 0),
(6, 1, 6, 1, NULL, 1, NULL, 0),
(7, 1, 7, 1, 1, 1, 1, 0),
(8, 1, 8, 1, 1, 1, 1, 0),
(9, 1, 9, 1, NULL, 1, NULL, 0),
(10, 1, 10, 1, 1, 1, 1, 0),
(11, 1, 11, 1, 1, 1, 1, 0),
(12, 1, 12, 1, NULL, 1, NULL, 0),
(13, 1, 13, 1, 1, 1, 1, 0),
(14, 1, 14, 1, 1, 1, 1, 0),
(15, 1, 15, 1, NULL, 1, NULL, 0),
(16, 1, 16, 1, NULL, 1, NULL, 0),
(17, 1, 17, 1, 1, 1, 1, 0),
(18, 1, 18, 1, NULL, 1, NULL, 0),
(19, 1, 19, 1, 1, 1, 1, 0),
(20, 1, 20, 1, 1, 1, 1, 0),
(21, 1, 21, 1, NULL, 1, NULL, 0),
(22, 1, 22, 1, NULL, 1, NULL, 0),
(23, 1, 23, 1, 1, 1, 1, 0),
(24, 1, 24, 1, NULL, 1, NULL, 0),
(25, 1, 25, 1, 1, 1, 1, 0),
(26, 1, 26, 1, 1, 1, 1, 0),
(27, 1, 27, 1, 1, 1, 1, 0),
(28, 1, 28, 1, NULL, 1, NULL, 0),
(29, 1, 29, 1, 1, 1, 1, 0),
(30, 1, 30, 1, 1, 1, 1, 0),
(31, 1, 31, 1, 1, 1, 1, 0),
(32, 1, 32, 1, 1, 1, 1, 0),
(33, 1, 33, 1, 1, 1, 1, 0),
(34, 1, 34, 1, 1, 1, 1, 0),
(35, 1, 35, 1, NULL, 1, NULL, 0),
(36, 1, 36, 1, 1, 1, 1, 0),
(37, 1, 37, 1, 1, 1, 1, 0),
(38, 1, 38, 1, NULL, 1, NULL, 0),
(39, 1, 39, 1, NULL, 1, 1, 0),
(40, 1, 40, 1, 1, 1, 1, 0),
(41, 1, 41, 1, NULL, NULL, NULL, 0),
(42, 1, 40, 1, 1, 1, 1, 1),
(43, 2, 1, 1, NULL, 1, NULL, 1),
(44, 2, 2, 1, 1, 1, 1, 1),
(45, 2, 3, 1, NULL, 1, NULL, 1),
(46, 2, 4, 1, NULL, 1, NULL, 1),
(47, 2, 5, 1, 1, 1, 1, 1),
(48, 2, 6, 1, NULL, 1, NULL, 1),
(49, 2, 7, 1, 1, 1, 1, 1),
(50, 2, 8, 1, 1, 1, 1, 1),
(51, 2, 9, 1, NULL, 1, NULL, 1),
(52, 2, 10, 1, 1, 1, 1, 1),
(53, 2, 11, 1, 1, 1, 1, 1),
(54, 2, 12, 1, NULL, 1, NULL, 1),
(55, 2, 13, 1, 1, 1, 1, 1),
(56, 2, 14, 1, 1, 1, 1, 1),
(57, 2, 15, 1, NULL, 1, NULL, 1),
(58, 2, 16, 1, NULL, NULL, NULL, 1),
(59, 2, 17, 1, 0, 0, 0, 1),
(60, 2, 18, 1, 0, 0, 0, 1),
(61, 2, 19, 1, NULL, NULL, NULL, 1),
(62, 2, 20, 1, 0, 0, 0, 1),
(63, 2, 21, 1, 0, 0, 0, 1),
(64, 2, 22, 1, NULL, NULL, NULL, 1),
(65, 2, 23, 1, 0, 0, 0, 1),
(66, 2, 24, 1, 0, 0, 0, 1),
(67, 2, 25, 1, NULL, NULL, NULL, 1),
(68, 2, 26, 1, NULL, NULL, NULL, 1),
(69, 2, 27, 1, 0, 0, 0, 1),
(70, 2, 28, 1, 0, 0, 0, 1),
(71, 2, 29, 1, 1, 1, 1, 1),
(72, 2, 30, 1, 1, 1, 1, 1),
(73, 2, 31, 1, 1, 1, 1, 1),
(74, 2, 32, 1, 1, 1, 1, 1),
(75, 2, 33, 1, 1, 1, 1, 1),
(76, 2, 34, 1, 1, 1, 1, 1),
(77, 2, 35, 1, NULL, 1, NULL, 1),
(78, 2, 36, 1, 1, 1, 1, 1),
(79, 2, 37, 1, 1, 1, 1, 1),
(80, 2, 38, 1, NULL, 1, NULL, 1),
(81, 2, 39, 1, NULL, 1, 1, 1),
(82, 2, 40, 1, 0, 0, 0, 1),
(83, 2, 41, 1, NULL, NULL, NULL, 1),
(84, 3, 1, 1, NULL, 1, NULL, 0),
(85, 3, 2, 1, 1, 1, 1, 0),
(86, 3, 3, 1, NULL, 1, NULL, 0),
(87, 3, 4, 1, NULL, 1, NULL, 0),
(88, 3, 5, 1, 1, 1, 1, 0),
(89, 3, 6, 1, NULL, 1, NULL, 0),
(90, 3, 7, 1, 1, 1, 1, 0),
(91, 3, 8, 1, 1, 1, 1, 0),
(92, 3, 9, 1, NULL, 1, NULL, 0),
(93, 3, 10, 1, 1, 1, 1, 0),
(94, 3, 11, 1, 1, 1, 1, 0),
(95, 3, 12, 1, NULL, 1, NULL, 0),
(96, 3, 13, 1, 1, 1, 1, 0),
(97, 3, 14, 1, 1, 1, 1, 0),
(98, 3, 15, 1, NULL, 1, NULL, 0),
(99, 3, 16, 1, NULL, NULL, NULL, 0),
(100, 3, 17, 1, 0, 0, 0, 0),
(101, 3, 18, 1, 0, 0, 0, 0),
(102, 3, 19, 0, 0, 0, 0, 0),
(103, 3, 20, 0, 0, 0, 0, 0),
(104, 3, 21, 0, 0, 0, 0, 0),
(105, 3, 22, 1, NULL, NULL, NULL, 0),
(106, 3, 23, 1, 0, 0, 0, 0),
(107, 3, 24, 1, 0, 0, 0, 0),
(108, 3, 25, 1, NULL, NULL, NULL, 0),
(109, 3, 26, 1, NULL, NULL, NULL, 0),
(110, 3, 27, 1, 0, 0, 0, 0),
(111, 3, 28, 1, 0, 0, 0, 0),
(112, 3, 29, 1, 1, 1, 1, 0),
(113, 3, 30, 1, 1, 1, 1, 0),
(114, 3, 31, 1, 1, 1, 1, 0),
(115, 3, 32, 1, 1, 1, 1, 0),
(116, 3, 33, 1, 1, 1, 1, 0),
(117, 3, 34, 1, 1, 1, 1, 0),
(118, 3, 35, 1, NULL, 1, NULL, 0),
(119, 3, 36, 1, 1, 1, 1, 0),
(120, 3, 37, 1, 1, 1, 1, 0),
(121, 3, 38, 1, NULL, 1, NULL, 0),
(122, 3, 39, 1, NULL, 1, 1, 0),
(123, 3, 40, 1, 0, 0, 0, 0),
(124, 3, 41, 1, NULL, NULL, NULL, 0),
(125, 3, 1, 1, NULL, 1, NULL, 1),
(126, 3, 2, 1, 1, 1, 1, 1),
(127, 3, 3, 1, NULL, 1, NULL, 1),
(128, 3, 4, 1, NULL, 1, NULL, 1),
(129, 3, 5, 1, 1, 1, 1, 1),
(130, 3, 6, 1, NULL, 1, NULL, 1),
(131, 3, 7, 1, 1, 1, 1, 1),
(132, 3, 8, 1, 1, 1, 1, 1),
(133, 3, 9, 1, NULL, 1, NULL, 1),
(134, 3, 10, 1, 1, 1, 1, 1),
(135, 3, 11, 1, 1, 1, 1, 1),
(136, 3, 12, 1, NULL, 1, NULL, 1),
(137, 3, 13, 1, 1, 1, 1, 1),
(138, 3, 14, 1, 1, 1, 1, 1),
(139, 3, 15, 1, NULL, 1, NULL, 1),
(140, 3, 16, 1, NULL, NULL, NULL, 1),
(141, 3, 17, 1, 0, 0, 0, 1),
(142, 3, 18, 1, 0, 0, 0, 1),
(143, 3, 19, 1, 0, 0, 0, 1),
(144, 3, 20, 1, 0, 0, 0, 1),
(145, 3, 21, 1, 0, 0, 0, 1),
(146, 3, 22, 1, NULL, NULL, NULL, 1),
(147, 3, 23, 1, 0, 0, 0, 1),
(148, 3, 24, 1, 0, 0, 0, 1),
(149, 3, 25, 1, NULL, NULL, NULL, 1),
(150, 3, 26, 1, NULL, NULL, NULL, 1),
(151, 3, 27, 1, 0, 0, 0, 1),
(152, 3, 28, 1, 0, 0, 0, 1),
(153, 3, 29, 1, 1, 1, 1, 1),
(154, 3, 30, 1, 1, 1, 1, 1),
(155, 3, 31, 1, 1, 1, 1, 1),
(156, 3, 32, 1, 1, 1, 1, 1),
(157, 3, 33, 1, 1, 1, 1, 1),
(158, 3, 34, 1, 1, 1, 1, 1),
(159, 3, 35, 1, NULL, 1, NULL, 1),
(160, 3, 36, 1, 1, 1, 1, 1),
(161, 3, 37, 1, 1, 1, 1, 1),
(162, 3, 38, 1, NULL, 1, NULL, 1),
(163, 3, 39, 1, NULL, 1, 1, 1),
(164, 3, 40, 1, 0, 0, 0, 1),
(165, 3, 41, 1, NULL, NULL, NULL, 1),
(166, 1, 42, 1, 1, 1, 1, 0),
(167, 2, 42, 0, 0, 0, 0, 0),
(168, 3, 42, 0, 0, 0, 0, 0),
(169, 1, 43, 1, 1, 1, 1, 0),
(170, 2, 43, 0, 0, 0, 0, 0),
(171, 3, 43, 0, 0, 0, 0, 0),
(172, 1, 44, 1, 1, 1, 1, 0),
(173, 2, 44, 0, 0, 0, 0, 0),
(174, 3, 44, 0, 0, 0, 0, 0),
(175, 1, 45, 1, 1, 1, 1, 0),
(176, 2, 45, 0, 0, 0, 0, 0),
(177, 3, 45, 0, 0, 0, 0, 0),
(178, 4, 45, 1, 0, 1, 0, 0),
(179, 1, 46, 1, 1, 1, 1, 0),
(180, 2, 46, 0, 0, 0, 0, 0),
(181, 3, 46, 0, 0, 0, 0, 0),
(182, 1, 47, 1, NULL, 1, NULL, 0),
(183, 2, 47, 0, 0, 0, 0, 0),
(184, 3, 47, 0, 0, 0, 0, 0),
(185, 1, 48, 1, 0, 0, 0, 0),
(186, 2, 48, 0, 0, 0, 0, 0),
(187, 2, 48, 1, 0, 0, 0, 1),
(188, 3, 48, 1, 0, 0, 0, 0),
(189, 1, 49, 1, 0, 0, 0, 0),
(190, 2, 49, 0, 0, 0, 0, 0),
(191, 3, 49, 0, 0, 0, 0, 0),
(192, 4, 49, 1, 0, 0, 0, 0),
(193, 1, 50, 1, 0, 0, 0, 0),
(194, 2, 50, 0, 0, 0, 0, 0),
(195, 3, 50, 1, 0, 0, 0, 0),
(196, 1, 51, 1, 0, 0, 0, 0),
(197, 2, 51, 0, 0, 0, 0, 0),
(198, 3, 51, 1, 0, 0, 0, 0),
(199, 1, 52, 1, NULL, 1, NULL, 0),
(200, 2, 52, 0, 0, 0, 0, 0),
(201, 3, 52, 0, 0, 0, 0, 0),
(202, 1, 53, 1, 1, 1, 1, 0),
(203, 2, 53, 0, 0, 0, 0, 0),
(204, 3, 53, 0, 0, 0, 0, 0),
(205, 1, 54, 1, 0, 1, 0, 0),
(206, 2, 54, 0, 0, 0, 0, 0),
(207, 3, 54, 0, 0, 0, 0, 0),
(208, 1, 55, 1, 1, 1, 1, 0),
(209, 2, 55, 0, 0, 0, 0, 0),
(210, 3, 55, 0, 0, 0, 0, 0),
(211, 1, 56, 1, 1, 1, 1, 0),
(212, 2, 56, 0, 0, 0, 0, 0),
(213, 3, 56, 0, 0, 0, 0, 0),
(214, 1, 57, 1, 1, 1, 1, 0),
(215, 6, 57, 1, 1, 1, 1, 0),
(216, 5, 57, 1, 0, 1, 0, 0),
(217, 1, 58, 1, 0, 0, 0, 0),
(218, 2, 58, 0, 0, 0, 0, 0),
(219, 2, 58, 1, 0, 0, 0, 1),
(220, 3, 58, 1, 0, 0, 0, 0),
(221, 1, 59, 1, 0, 0, 0, 0),
(222, 2, 59, 1, 0, 0, 0, 1),
(223, 3, 59, 1, 0, 0, 0, 0),
(224, 1, 60, 0, 1, 0, 0, 0),
(225, 2, 60, 0, 1, 0, 0, 1),
(226, 3, 60, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user_role_screen`
--

CREATE TABLE IF NOT EXISTS `ohrm_user_role_screen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_role_id` int(11) NOT NULL,
  `screen_id` int(11) NOT NULL,
  `can_read` tinyint(1) NOT NULL DEFAULT '0',
  `can_create` tinyint(1) NOT NULL DEFAULT '0',
  `can_update` tinyint(1) NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_role_id` (`user_role_id`),
  KEY `screen_id` (`screen_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=157 ;

--
-- Dumping data for table `ohrm_user_role_screen`
--

INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES
(1, 1, 1, 1, 1, 1, 1),
(2, 1, 2, 1, 1, 1, 1),
(3, 2, 2, 0, 0, 0, 0),
(4, 3, 2, 0, 0, 0, 0),
(5, 1, 3, 1, 1, 1, 1),
(6, 2, 3, 0, 0, 0, 0),
(7, 3, 3, 0, 0, 0, 0),
(8, 1, 4, 1, 1, 1, 1),
(9, 1, 5, 1, 1, 1, 1),
(10, 3, 5, 1, 0, 0, 0),
(11, 1, 6, 1, 0, 0, 1),
(12, 1, 7, 1, 1, 1, 1),
(13, 1, 8, 1, 1, 1, 1),
(14, 1, 9, 1, 1, 1, 1),
(15, 1, 10, 1, 1, 1, 1),
(16, 1, 11, 1, 1, 1, 1),
(17, 1, 12, 1, 1, 1, 1),
(18, 1, 13, 1, 1, 1, 1),
(19, 1, 14, 1, 1, 1, 1),
(20, 1, 16, 1, 1, 1, 0),
(21, 3, 16, 1, 1, 1, 0),
(22, 1, 17, 1, 1, 1, 0),
(23, 3, 17, 1, 1, 1, 0),
(24, 1, 18, 1, 1, 1, 0),
(25, 2, 18, 1, 0, 0, 0),
(26, 3, 18, 1, 0, 0, 0),
(27, 1, 19, 1, 1, 1, 1),
(28, 1, 20, 1, 1, 1, 1),
(29, 1, 21, 1, 1, 1, 1),
(30, 1, 22, 1, 1, 1, 1),
(31, 1, 23, 1, 1, 1, 1),
(32, 1, 24, 1, 1, 1, 1),
(33, 1, 25, 1, 1, 1, 1),
(34, 1, 26, 1, 1, 1, 1),
(35, 1, 27, 1, 1, 1, 1),
(36, 1, 28, 1, 1, 1, 1),
(37, 1, 29, 1, 1, 1, 1),
(38, 1, 30, 1, 1, 1, 1),
(39, 1, 31, 1, 1, 1, 1),
(40, 1, 32, 1, 1, 1, 1),
(41, 1, 33, 1, 1, 1, 1),
(42, 1, 34, 1, 1, 1, 1),
(43, 1, 35, 1, 1, 1, 1),
(44, 1, 36, 1, 1, 1, 1),
(45, 1, 37, 1, 1, 1, 1),
(46, 4, 37, 1, 0, 0, 0),
(47, 1, 38, 1, 1, 1, 1),
(48, 1, 39, 1, 1, 1, 1),
(49, 1, 40, 1, 1, 1, 1),
(50, 1, 41, 1, 1, 1, 1),
(51, 1, 42, 1, 1, 1, 1),
(52, 1, 43, 1, 1, 1, 1),
(53, 1, 44, 1, 1, 1, 1),
(54, 1, 45, 1, 1, 1, 1),
(55, 2, 46, 1, 1, 1, 1),
(56, 1, 47, 1, 1, 1, 1),
(57, 2, 48, 1, 1, 1, 0),
(58, 2, 49, 1, 1, 1, 1),
(59, 1, 50, 1, 1, 1, 1),
(60, 2, 51, 1, 1, 1, 1),
(61, 1, 52, 1, 1, 1, 1),
(62, 3, 52, 1, 1, 1, 1),
(63, 2, 53, 1, 1, 0, 0),
(64, 2, 54, 1, 1, 1, 1),
(65, 1, 55, 1, 1, 0, 1),
(66, 3, 55, 1, 1, 0, 0),
(67, 1, 56, 1, 1, 1, 1),
(68, 1, 57, 1, 1, 1, 1),
(69, 4, 57, 1, 1, 1, 1),
(70, 1, 58, 1, 1, 1, 1),
(71, 3, 58, 1, 1, 1, 1),
(72, 1, 59, 1, 1, 1, 1),
(73, 3, 59, 1, 1, 1, 1),
(74, 1, 60, 1, 1, 1, 1),
(75, 6, 60, 1, 1, 1, 1),
(76, 5, 60, 1, 0, 1, 0),
(77, 1, 61, 1, 1, 1, 1),
(78, 1, 67, 1, 1, 1, 1),
(79, 2, 67, 1, 0, 1, 0),
(80, 3, 67, 1, 0, 1, 0),
(81, 1, 68, 1, 1, 1, 1),
(82, 2, 68, 1, 0, 1, 0),
(83, 3, 68, 1, 0, 1, 0),
(84, 1, 69, 1, 1, 1, 1),
(85, 3, 69, 1, 0, 0, 0),
(86, 2, 70, 1, 0, 0, 0),
(87, 1, 71, 1, 0, 0, 1),
(88, 1, 72, 1, 1, 1, 0),
(89, 1, 73, 1, 0, 1, 0),
(90, 1, 74, 1, 1, 1, 1),
(91, 1, 75, 1, 1, 1, 1),
(92, 3, 75, 1, 1, 1, 1),
(93, 1, 76, 1, 1, 1, 1),
(94, 5, 76, 1, 1, 1, 1),
(95, 6, 76, 1, 1, 1, 1),
(96, 1, 78, 1, 0, 0, 0),
(97, 3, 78, 1, 0, 0, 0),
(98, 2, 79, 1, 0, 0, 0),
(99, 1, 80, 1, 1, 1, 1),
(100, 1, 81, 1, 1, 1, 1),
(101, 1, 82, 1, 1, 1, 1),
(102, 1, 83, 1, 1, 1, 1),
(103, 1, 84, 1, 1, 1, 1),
(104, 1, 85, 1, 1, 1, 1),
(105, 1, 86, 1, 1, 1, 1),
(106, 1, 87, 1, 1, 1, 1),
(107, 1, 88, 1, 1, 1, 1),
(108, 4, 88, 1, 1, 1, 1),
(109, 1, 89, 1, 1, 1, 1),
(110, 1, 90, 1, 1, 1, 1),
(111, 4, 90, 1, 1, 1, 1),
(112, 1, 91, 1, 1, 1, 1),
(113, 4, 91, 1, 1, 1, 1),
(114, 1, 92, 1, 1, 1, 1),
(115, 1, 93, 1, 1, 1, 1),
(116, 1, 94, 1, 1, 1, 1),
(117, 1, 95, 1, 1, 1, 1),
(118, 1, 96, 1, 1, 1, 1),
(119, 5, 96, 1, 1, 1, 1),
(120, 6, 96, 1, 1, 1, 1),
(121, 1, 97, 1, 1, 1, 1),
(122, 6, 97, 1, 1, 1, 1),
(123, 1, 98, 1, 1, 1, 1),
(124, 2, 98, 1, 1, 1, 1),
(125, 3, 98, 1, 1, 1, 1),
(126, 1, 99, 1, 0, 1, 0),
(127, 2, 99, 1, 0, 1, 0),
(128, 3, 99, 1, 0, 1, 0),
(129, 1, 100, 1, 0, 0, 0),
(130, 1, 101, 1, 1, 1, 1),
(131, 3, 101, 1, 1, 1, 1),
(132, 1, 102, 1, 1, 1, 1),
(133, 4, 102, 1, 1, 1, 1),
(134, 1, 103, 1, 0, 0, 0),
(135, 2, 103, 1, 0, 0, 0),
(136, 1, 104, 1, 1, 1, 0),
(137, 1, 105, 1, 1, 1, 1),
(138, 1, 107, 1, 1, 1, 0),
(139, 1, 109, 1, 1, 1, 0),
(140, 1, 111, 1, 1, 1, 1),
(141, 2, 110, 1, 0, 1, 0),
(142, 2, 108, 1, 1, 1, 0),
(143, 2, 106, 1, 0, 1, 0),
(144, 3, 109, 1, 1, 1, 0),
(145, 2, 109, 1, 1, 1, 0),
(146, 1, 112, 1, 1, 1, 1),
(147, 2, 112, 0, 0, 0, 0),
(148, 1, 113, 1, 1, 1, 1),
(149, 2, 113, 1, 1, 1, 0),
(150, 1, 114, 0, 0, 0, 0),
(151, 2, 114, 1, 0, 1, 0),
(152, 1, 115, 1, 1, 1, 0),
(153, 2, 115, 1, 0, 0, 0),
(154, 1, 116, 1, 1, 1, 1),
(155, 2, 116, 1, 1, 1, 1),
(156, 1, 117, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user_selection_rule`
--

CREATE TABLE IF NOT EXISTS `ohrm_user_selection_rule` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `implementation_class` varchar(255) NOT NULL,
  `rule_xml_data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_workflow_state_machine`
--

CREATE TABLE IF NOT EXISTS `ohrm_workflow_state_machine` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `workflow` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `resulting_state` varchar(255) NOT NULL,
  `roles_to_notify` text,
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT 'lowest priority 0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=107 ;

--
-- Dumping data for table `ohrm_workflow_state_machine`
--

INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES
(1, '0', 'INITIAL', 'SYSTEM', '7', 'NOT SUBMITTED', '', 0),
(2, '0', 'SUBMITTED', 'ADMIN', '2', 'APPROVED', '', 0),
(3, '0', 'SUBMITTED', 'ADMIN', '3', 'REJECTED', '', 0),
(4, '0', 'SUBMITTED', 'ADMIN', '0', 'SUBMITTED', '', 0),
(5, '0', 'SUBMITTED', 'ADMIN', '5', 'SUBMITTED', '', 0),
(6, '0', 'SUBMITTED', 'SUPERVISOR', '2', 'APPROVED', '', 0),
(7, '0', 'SUBMITTED', 'SUPERVISOR', '3', 'REJECTED', '', 0),
(8, '0', 'SUBMITTED', 'SUPERVISOR', '5', 'SUBMITTED', '', 0),
(9, '0', 'SUBMITTED', 'SUPERVISOR', '0', 'SUBMITTED', '', 0),
(10, '0', 'SUBMITTED', 'ESS USER', '0', 'SUBMITTED', '', 0),
(11, '0', 'SUBMITTED', 'ESS USER', '5', 'SUBMITTED', '', 0),
(12, '0', 'NOT SUBMITTED', 'ESS USER', '1', 'SUBMITTED', '', 0),
(13, '0', 'NOT SUBMITTED', 'ESS USER', '5', 'NOT SUBMITTED', '', 0),
(15, '0', 'NOT SUBMITTED', 'ESS USER', '0', 'NOT SUBMITTED', '', 0),
(16, '0', 'NOT SUBMITTED', 'SUPERVISOR', '0', 'NOT SUBMITTED', '', 0),
(17, '0', 'NOT SUBMITTED', 'SUPERVISOR', '5', 'NOT SUBMITTED', '', 0),
(18, '0', 'NOT SUBMITTED', 'SUPERVISOR', '1', 'SUBMITTED', '', 0),
(19, '0', 'NOT SUBMITTED', 'ADMIN', '0', 'NOT SUBMITTED', '', 0),
(20, '0', 'NOT SUBMITTED', 'ADMIN', '5', 'NOT SUBMITTED', '', 0),
(21, '0', 'NOT SUBMITTED', 'ADMIN', '1', 'SUBMITTED', '', 0),
(22, '0', 'REJECTED', 'ESS USER', '1', 'SUBMITTED', '', 0),
(23, '0', 'REJECTED', 'ESS USER', '0', 'REJECTED', '', 0),
(24, '0', 'REJECTED', 'ESS USER', '5', 'REJECTED', '', 0),
(25, '0', 'REJECTED', 'SUPERVISOR', '1', 'SUBMITTED', '', 0),
(26, '0', 'REJECTED', 'SUPERVISOR', '0', 'REJECTED', '', 0),
(27, '0', 'REJECTED', 'SUPERVISOR', '5', 'REJECTED', '', 0),
(28, '0', 'REJECTED', 'ADMIN', '0', 'REJECTED', '', 0),
(29, '0', 'REJECTED', 'ADMIN', '5', 'SUBMITTED', '', 0),
(30, '0', 'REJECTED', 'ADMIN', '1', 'SUBMITTED', '', 0),
(31, '0', 'APPROVED', 'ESS USER', '0', 'APPROVED', '', 0),
(32, '0', 'APPROVED', 'SUPERVISOR', '0', 'APPROVED', '', 0),
(33, '0', 'APPROVED', 'ADMIN', '0', 'APPROVED', '', 0),
(34, '0', 'APPROVED', 'ADMIN', '4', 'SUBMITTED', '', 0),
(35, '1', 'PUNCHED IN', 'ESS USER', '1', 'PUNCHED OUT', '', 0),
(36, '1', 'INITIAL', 'ESS USER', '0', 'PUNCHED IN', '', 0),
(37, '2', 'INITIAL', 'ADMIN', '1', 'APPLICATION INITIATED', '', 0),
(38, '2', 'APPLICATION INITIATED', 'ADMIN', '2', 'SHORTLISTED', '', 0),
(39, '2', 'APPLICATION INITIATED', 'ADMIN', '3', 'REJECTED', '', 0),
(40, '2', 'SHORTLISTED', 'ADMIN', '4', 'INTERVIEW SCHEDULED', '', 0),
(41, '2', 'SHORTLISTED', 'ADMIN', '3', 'REJECTED', '', 0),
(42, '2', 'INTERVIEW SCHEDULED', 'ADMIN', '3', 'REJECTED', '', 0),
(43, '2', 'INTERVIEW SCHEDULED', 'ADMIN', '5', 'INTERVIEW PASSED', '', 0),
(44, '2', 'INTERVIEW SCHEDULED', 'ADMIN', '6', 'INTERVIEW FAILED', '', 0),
(45, '2', 'INTERVIEW PASSED', 'ADMIN', '4', 'INTERVIEW SCHEDULED', '', 0),
(46, '2', 'INTERVIEW PASSED', 'ADMIN', '7', 'JOB OFFERED', '', 0),
(47, '2', 'INTERVIEW PASSED', 'ADMIN', '3', 'REJECTED', '', 0),
(48, '2', 'INTERVIEW FAILED', 'ADMIN', '3', 'REJECTED', '', 0),
(49, '2', 'JOB OFFERED', 'ADMIN', '8', 'OFFER DECLINED', '', 0),
(50, '2', 'JOB OFFERED', 'ADMIN', '3', 'REJECTED', '', 0),
(51, '2', 'JOB OFFERED', 'ADMIN', '9', 'HIRED', '', 0),
(52, '2', 'OFFER DECLINED', 'ADMIN', '3', 'REJECTED', '', 0),
(53, '2', 'INITIAL', 'HIRING MANAGER', '1', 'APPLICATION INITIATED', '', 0),
(54, '2', 'APPLICATION INITIATED', 'HIRING MANAGER', '2', 'SHORTLISTED', '', 0),
(55, '2', 'APPLICATION INITIATED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(56, '2', 'SHORTLISTED', 'HIRING MANAGER', '4', 'INTERVIEW SCHEDULED', '', 0),
(57, '2', 'SHORTLISTED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(58, '2', 'INTERVIEW SCHEDULED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(59, '2', 'INTERVIEW SCHEDULED', 'HIRING MANAGER', '5', 'INTERVIEW PASSED', '', 0),
(60, '2', 'INTERVIEW SCHEDULED', 'HIRING MANAGER', '6', 'INTERVIEW FAILED', '', 0),
(61, '2', 'INTERVIEW PASSED', 'HIRING MANAGER', '4', 'INTERVIEW SCHEDULED', '', 0),
(62, '2', 'INTERVIEW PASSED', 'HIRING MANAGER', '7', 'JOB OFFERED', '', 0),
(63, '2', 'INTERVIEW PASSED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(64, '2', 'INTERVIEW FAILED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(65, '2', 'JOB OFFERED', 'HIRING MANAGER', '8', 'OFFER DECLINED', '', 0),
(66, '2', 'JOB OFFERED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(67, '2', 'JOB OFFERED', 'HIRING MANAGER', '9', 'HIRED', '', 0),
(68, '2', 'OFFER DECLINED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(69, '2', 'INTERVIEW SCHEDULED', 'INTERVIEWER', '5', 'INTERVIEW PASSED', '', 0),
(70, '2', 'INTERVIEW SCHEDULED', 'INTERVIEWER', '6', 'INTERVIEW FAILED', '', 0),
(71, '1', 'INITIAL', 'ADMIN', '5', 'PUNCHED IN', '', 0),
(72, '1', 'PUNCHED IN', 'ADMIN', '6', 'PUNCHED OUT', '', 0),
(73, '1', 'PUNCHED IN', 'ADMIN', '2', 'PUNCHED IN', '', 0),
(74, '1', 'PUNCHED IN', 'ADMIN', '7', 'N/A', '', 0),
(75, '1', 'PUNCHED OUT', 'ADMIN', '2', 'PUNCHED OUT', '', 0),
(76, '1', 'PUNCHED OUT', 'ADMIN', '3', 'PUNCHED OUT', '', 0),
(77, '1', 'PUNCHED OUT', 'ADMIN', '7', 'N/A', '', 0),
(78, '0', 'INITIAL', 'ADMIN', '7', 'NOT SUBMITTED', '', 0),
(79, '0', 'INITIAL', 'ESS USER', '7', 'NOT SUBMITTED', '', 0),
(80, '0', 'INITIAL', 'SUPERVISOR', '7', 'NOT SUBMITTED', '', 0),
(81, '3', 'NOT_EXIST', 'ADMIN', '1', 'ACTIVE', '', 0),
(82, '3', 'ACTIVE', 'ADMIN', '2', 'NOT_EXIST', '', 0),
(83, '3', 'ACTIVE', 'ADMIN', '3', 'TERMINATED', '', 0),
(84, '3', 'TERMINATED', 'ADMIN', '4', 'ACTIVE', '', 0),
(85, '3', 'TERMINATED', 'ADMIN', '5', 'NOT_EXIST', '', 0),
(86, '4', 'INITIAL', 'ESS', 'APPLY', 'PENDING APPROVAL', 'supervisor,subscriber', 0),
(87, '4', 'INITIAL', 'ADMIN', 'ASSIGN', 'SCHEDULED', 'ess,supervisor,subscriber', 0),
(88, '4', 'INITIAL', 'SUPERVISOR', 'ASSIGN', 'SCHEDULED', 'ess,supervisor,subscriber', 0),
(89, '4', 'PENDING APPROVAL', 'ADMIN', 'APPROVE', 'SCHEDULED', 'ess,subscriber', 0),
(90, '4', 'PENDING APPROVAL', 'SUPERVISOR', 'APPROVE', 'SCHEDULED', 'ess,subscriber', 0),
(91, '4', 'PENDING APPROVAL', 'ESS', 'CANCEL', 'CANCELLED', 'supervisor,subscriber', 0),
(92, '4', 'PENDING APPROVAL', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(93, '4', 'PENDING APPROVAL', 'SUPERVISOR', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(94, '4', 'PENDING APPROVAL', 'ADMIN', 'REJECT', 'REJECTED', 'ess,subscriber', 0),
(95, '4', 'PENDING APPROVAL', 'SUPERVISOR', 'REJECT', 'REJECTED', 'ess,subscriber', 0),
(96, '4', 'SCHEDULED', 'ESS', 'CANCEL', 'CANCELLED', 'supervisor,subscriber', 0),
(97, '4', 'SCHEDULED', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(98, '4', 'SCHEDULED', 'SUPERVISOR', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(99, '4', 'TAKEN', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(100, '4', 'LEAVE TYPE DELETED PENDING APPROVAL', 'ESS', 'CANCEL', 'CANCELLED', 'supervisor,subscriber', 0),
(101, '4', 'LEAVE TYPE DELETED PENDING APPROVAL', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(102, '4', 'LEAVE TYPE DELETED PENDING APPROVAL', 'SUPERVISOR', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(103, '4', 'LEAVE TYPE DELETED SCHEDULED', 'ESS', 'CANCEL', 'CANCELLED', 'supervisor,subscriber', 0),
(104, '4', 'LEAVE TYPE DELETED SCHEDULED', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(105, '4', 'LEAVE TYPE DELETED SCHEDULED', 'SUPERVISOR', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(106, '4', 'LEAVE TYPE DELETED TAKEN', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_work_shift`
--

CREATE TABLE IF NOT EXISTS `ohrm_work_shift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `hours_per_day` decimal(4,2) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ohrm_work_shift`
--

INSERT INTO `ohrm_work_shift` (`id`, `name`, `hours_per_day`, `start_time`, `end_time`) VALUES
(1, 'Whole Day', 9.00, '08:00:00', '17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_work_week`
--

CREATE TABLE IF NOT EXISTS `ohrm_work_week` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operational_country_id` int(10) unsigned DEFAULT NULL,
  `mon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `tue` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `wed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `thu` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fri` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sat` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sun` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ohrm_work_week_ohrm_operational_country` (`operational_country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ohrm_work_week`
--

INSERT INTO `ohrm_work_week` (`id`, `operational_country_id`, `mon`, `tue`, `wed`, `thu`, `fri`, `sat`, `sun`) VALUES
(1, NULL, 0, 0, 0, 0, 0, 8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_ws_consumer`
--

CREATE TABLE IF NOT EXISTS `ohrm_ws_consumer` (
  `app_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_token` varchar(10) NOT NULL,
  `app_name` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hs_hr_employee`
--
ALTER TABLE `hs_hr_employee`
  ADD CONSTRAINT `hs_hr_employee_ibfk_1` FOREIGN KEY (`work_station`) REFERENCES `ohrm_subunit` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `hs_hr_employee_ibfk_2` FOREIGN KEY (`nation_code`) REFERENCES `ohrm_nationality` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `hs_hr_employee_ibfk_3` FOREIGN KEY (`job_title_code`) REFERENCES `ohrm_job_title` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `hs_hr_employee_ibfk_4` FOREIGN KEY (`emp_status`) REFERENCES `ohrm_employment_status` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `hs_hr_employee_ibfk_5` FOREIGN KEY (`eeo_cat_code`) REFERENCES `ohrm_job_category` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `hs_hr_employee_ibfk_6` FOREIGN KEY (`termination_id`) REFERENCES `ohrm_emp_termination` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `hs_hr_emp_attachment`
--
ALTER TABLE `hs_hr_emp_attachment`
  ADD CONSTRAINT `hs_hr_emp_attachment_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_basicsalary`
--
ALTER TABLE `hs_hr_emp_basicsalary`
  ADD CONSTRAINT `hs_hr_emp_basicsalary_ibfk_1` FOREIGN KEY (`sal_grd_code`) REFERENCES `ohrm_pay_grade` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_basicsalary_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `hs_hr_currency_type` (`currency_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_basicsalary_ibfk_3` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_basicsalary_ibfk_4` FOREIGN KEY (`payperiod_code`) REFERENCES `hs_hr_payperiod` (`payperiod_code`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_children`
--
ALTER TABLE `hs_hr_emp_children`
  ADD CONSTRAINT `hs_hr_emp_children_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_contract_extend`
--
ALTER TABLE `hs_hr_emp_contract_extend`
  ADD CONSTRAINT `hs_hr_emp_contract_extend_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_dependents`
--
ALTER TABLE `hs_hr_emp_dependents`
  ADD CONSTRAINT `hs_hr_emp_dependents_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_directdebit`
--
ALTER TABLE `hs_hr_emp_directdebit`
  ADD CONSTRAINT `hs_hr_emp_directdebit_ibfk_1` FOREIGN KEY (`salary_id`) REFERENCES `hs_hr_emp_basicsalary` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_emergency_contacts`
--
ALTER TABLE `hs_hr_emp_emergency_contacts`
  ADD CONSTRAINT `hs_hr_emp_emergency_contacts_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_history_of_ealier_pos`
--
ALTER TABLE `hs_hr_emp_history_of_ealier_pos`
  ADD CONSTRAINT `hs_hr_emp_history_of_ealier_pos_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_language`
--
ALTER TABLE `hs_hr_emp_language`
  ADD CONSTRAINT `hs_hr_emp_language_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_language_ibfk_2` FOREIGN KEY (`lang_id`) REFERENCES `ohrm_language` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_locations`
--
ALTER TABLE `hs_hr_emp_locations`
  ADD CONSTRAINT `hs_hr_emp_locations_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `ohrm_location` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_locations_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_member_detail`
--
ALTER TABLE `hs_hr_emp_member_detail`
  ADD CONSTRAINT `hs_hr_emp_member_detail_ibfk_1` FOREIGN KEY (`membship_code`) REFERENCES `ohrm_membership` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_member_detail_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_passport`
--
ALTER TABLE `hs_hr_emp_passport`
  ADD CONSTRAINT `hs_hr_emp_passport_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_picture`
--
ALTER TABLE `hs_hr_emp_picture`
  ADD CONSTRAINT `hs_hr_emp_picture_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_reportto`
--
ALTER TABLE `hs_hr_emp_reportto`
  ADD CONSTRAINT `hs_hr_emp_reportto_ibfk_1` FOREIGN KEY (`erep_sup_emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_reportto_ibfk_2` FOREIGN KEY (`erep_sub_emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_reportto_ibfk_3` FOREIGN KEY (`erep_reporting_mode`) REFERENCES `ohrm_emp_reporting_method` (`reporting_method_id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_skill`
--
ALTER TABLE `hs_hr_emp_skill`
  ADD CONSTRAINT `hs_hr_emp_skill_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_skill_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `ohrm_skill` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_us_tax`
--
ALTER TABLE `hs_hr_emp_us_tax`
  ADD CONSTRAINT `hs_hr_emp_us_tax_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_work_experience`
--
ALTER TABLE `hs_hr_emp_work_experience`
  ADD CONSTRAINT `hs_hr_emp_work_experience_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_jobtit_empstat`
--
ALTER TABLE `hs_hr_jobtit_empstat`
  ADD CONSTRAINT `hs_hr_jobtit_empstat_ibfk_1` FOREIGN KEY (`jobtit_code`) REFERENCES `ohrm_job_title` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_jobtit_empstat_ibfk_2` FOREIGN KEY (`estat_code`) REFERENCES `ohrm_employment_status` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_mailnotifications`
--
ALTER TABLE `hs_hr_mailnotifications`
  ADD CONSTRAINT `hs_hr_mailnotifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ohrm_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_auth_provider_extra_details`
--
ALTER TABLE `ohrm_auth_provider_extra_details`
  ADD CONSTRAINT `ohrm_auth_provider_extra_details_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `ohrm_openid_provider` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_available_group_field`
--
ALTER TABLE `ohrm_available_group_field`
  ADD CONSTRAINT `ohrm_available_group_field_ibfk_1` FOREIGN KEY (`group_field_id`) REFERENCES `ohrm_group_field` (`group_field_id`);

--
-- Constraints for table `ohrm_composite_display_field`
--
ALTER TABLE `ohrm_composite_display_field`
  ADD CONSTRAINT `ohrm_composite_display_field_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `ohrm_report_group` (`report_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_composite_display_field_ibfk_2` FOREIGN KEY (`display_field_group_id`) REFERENCES `ohrm_display_field_group` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_datapoint`
--
ALTER TABLE `ohrm_datapoint`
  ADD CONSTRAINT `ohrm_datapoint_ibfk_1` FOREIGN KEY (`datapoint_type_id`) REFERENCES `ohrm_datapoint_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_data_group_screen`
--
ALTER TABLE `ohrm_data_group_screen`
  ADD CONSTRAINT `ohrm_data_group_screen_ibfk_1` FOREIGN KEY (`data_group_id`) REFERENCES `ohrm_data_group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_data_group_screen_ibfk_2` FOREIGN KEY (`screen_id`) REFERENCES `ohrm_screen` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_display_field`
--
ALTER TABLE `ohrm_display_field`
  ADD CONSTRAINT `ohrm_display_field_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `ohrm_report_group` (`report_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_display_field_ibfk_2` FOREIGN KEY (`display_field_group_id`) REFERENCES `ohrm_display_field_group` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_display_field_group`
--
ALTER TABLE `ohrm_display_field_group`
  ADD CONSTRAINT `ohrm_display_field_group_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `ohrm_report_group` (`report_group_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_email_processor`
--
ALTER TABLE `ohrm_email_processor`
  ADD CONSTRAINT `ohrm_email_processor_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `ohrm_email` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_email_subscriber`
--
ALTER TABLE `ohrm_email_subscriber`
  ADD CONSTRAINT `ohrm_email_subscriber_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `ohrm_email_notification` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_email_template`
--
ALTER TABLE `ohrm_email_template`
  ADD CONSTRAINT `ohrm_email_template_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `ohrm_email` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_employee_work_shift`
--
ALTER TABLE `ohrm_employee_work_shift`
  ADD CONSTRAINT `ohrm_employee_work_shift_ibfk_1` FOREIGN KEY (`work_shift_id`) REFERENCES `ohrm_work_shift` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_employee_work_shift_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_emp_education`
--
ALTER TABLE `ohrm_emp_education`
  ADD CONSTRAINT `ohrm_emp_education_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_emp_education_ibfk_2` FOREIGN KEY (`education_id`) REFERENCES `ohrm_education` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_emp_license`
--
ALTER TABLE `ohrm_emp_license`
  ADD CONSTRAINT `ohrm_emp_license_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_emp_license_ibfk_2` FOREIGN KEY (`license_id`) REFERENCES `ohrm_license` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_emp_termination`
--
ALTER TABLE `ohrm_emp_termination`
  ADD CONSTRAINT `ohrm_emp_termination_ibfk_1` FOREIGN KEY (`reason_id`) REFERENCES `ohrm_emp_termination_reason` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_emp_termination_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_filter_field`
--
ALTER TABLE `ohrm_filter_field`
  ADD CONSTRAINT `ohrm_filter_field_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `ohrm_report_group` (`report_group_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_holiday`
--
ALTER TABLE `ohrm_holiday`
  ADD CONSTRAINT `fk_ohrm_holiday_ohrm_operational_country` FOREIGN KEY (`operational_country_id`) REFERENCES `ohrm_operational_country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_home_page`
--
ALTER TABLE `ohrm_home_page`
  ADD CONSTRAINT `ohrm_home_page_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `ohrm_user_role` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_candidate`
--
ALTER TABLE `ohrm_job_candidate`
  ADD CONSTRAINT `ohrm_job_candidate_ibfk_1` FOREIGN KEY (`added_person`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_job_candidate_attachment`
--
ALTER TABLE `ohrm_job_candidate_attachment`
  ADD CONSTRAINT `ohrm_job_candidate_attachment_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `ohrm_job_candidate` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_candidate_history`
--
ALTER TABLE `ohrm_job_candidate_history`
  ADD CONSTRAINT `ohrm_job_candidate_history_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `ohrm_job_candidate` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_job_candidate_history_ibfk_2` FOREIGN KEY (`vacancy_id`) REFERENCES `ohrm_job_vacancy` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_job_candidate_history_ibfk_3` FOREIGN KEY (`interview_id`) REFERENCES `ohrm_job_interview` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_job_candidate_history_ibfk_4` FOREIGN KEY (`performed_by`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_job_candidate_vacancy`
--
ALTER TABLE `ohrm_job_candidate_vacancy`
  ADD CONSTRAINT `ohrm_job_candidate_vacancy_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `ohrm_job_candidate` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_job_candidate_vacancy_ibfk_2` FOREIGN KEY (`vacancy_id`) REFERENCES `ohrm_job_vacancy` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_interview`
--
ALTER TABLE `ohrm_job_interview`
  ADD CONSTRAINT `ohrm_job_interview_ibfk_1` FOREIGN KEY (`candidate_vacancy_id`) REFERENCES `ohrm_job_candidate_vacancy` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_job_interview_ibfk_2` FOREIGN KEY (`candidate_id`) REFERENCES `ohrm_job_candidate` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_interview_attachment`
--
ALTER TABLE `ohrm_job_interview_attachment`
  ADD CONSTRAINT `ohrm_job_interview_attachment_ibfk_1` FOREIGN KEY (`interview_id`) REFERENCES `ohrm_job_interview` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_interview_interviewer`
--
ALTER TABLE `ohrm_job_interview_interviewer`
  ADD CONSTRAINT `ohrm_job_interview_interviewer_ibfk_1` FOREIGN KEY (`interview_id`) REFERENCES `ohrm_job_interview` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_job_interview_interviewer_ibfk_2` FOREIGN KEY (`interviewer_id`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_specification_attachment`
--
ALTER TABLE `ohrm_job_specification_attachment`
  ADD CONSTRAINT `ohrm_job_specification_attachment_ibfk_1` FOREIGN KEY (`job_title_id`) REFERENCES `ohrm_job_title` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_vacancy`
--
ALTER TABLE `ohrm_job_vacancy`
  ADD CONSTRAINT `ohrm_job_vacancy_ibfk_1` FOREIGN KEY (`job_title_code`) REFERENCES `ohrm_job_title` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_job_vacancy_ibfk_2` FOREIGN KEY (`hiring_manager_id`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_job_vacancy_attachment`
--
ALTER TABLE `ohrm_job_vacancy_attachment`
  ADD CONSTRAINT `ohrm_job_vacancy_attachment_ibfk_1` FOREIGN KEY (`vacancy_id`) REFERENCES `ohrm_job_vacancy` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave`
--
ALTER TABLE `ohrm_leave`
  ADD CONSTRAINT `ohrm_leave_ibfk_1` FOREIGN KEY (`leave_request_id`) REFERENCES `ohrm_leave_request` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_ibfk_2` FOREIGN KEY (`leave_type_id`) REFERENCES `ohrm_leave_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_adjustment`
--
ALTER TABLE `ohrm_leave_adjustment`
  ADD CONSTRAINT `ohrm_leave_adjustment_ibfk_1` FOREIGN KEY (`leave_type_id`) REFERENCES `ohrm_leave_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_adjustment_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_adjustment_ibfk_3` FOREIGN KEY (`created_by_id`) REFERENCES `ohrm_user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_leave_adjustment_ibfk_4` FOREIGN KEY (`adjustment_type`) REFERENCES `ohrm_leave_entitlement_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_comment`
--
ALTER TABLE `ohrm_leave_comment`
  ADD CONSTRAINT `ohrm_leave_comment_ibfk_1` FOREIGN KEY (`leave_id`) REFERENCES `ohrm_leave` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_comment_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `ohrm_user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_leave_comment_ibfk_3` FOREIGN KEY (`created_by_emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_entitlement`
--
ALTER TABLE `ohrm_leave_entitlement`
  ADD CONSTRAINT `ohrm_leave_entitlement_ibfk_1` FOREIGN KEY (`leave_type_id`) REFERENCES `ohrm_leave_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_entitlement_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_entitlement_ibfk_3` FOREIGN KEY (`entitlement_type`) REFERENCES `ohrm_leave_entitlement_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_entitlement_ibfk_4` FOREIGN KEY (`created_by_id`) REFERENCES `ohrm_user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_leave_entitlement_adjustment`
--
ALTER TABLE `ohrm_leave_entitlement_adjustment`
  ADD CONSTRAINT `ohrm_leave_entitlement_adjustment_ibfk_1` FOREIGN KEY (`entitlement_id`) REFERENCES `ohrm_leave_entitlement` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_entitlement_adjustment_ibfk_2` FOREIGN KEY (`adjustment_id`) REFERENCES `ohrm_leave_adjustment` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_leave_entitlement`
--
ALTER TABLE `ohrm_leave_leave_entitlement`
  ADD CONSTRAINT `ohrm_leave_leave_entitlement_ibfk_1` FOREIGN KEY (`entitlement_id`) REFERENCES `ohrm_leave_entitlement` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_leave_entitlement_ibfk_2` FOREIGN KEY (`leave_id`) REFERENCES `ohrm_leave` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_request`
--
ALTER TABLE `ohrm_leave_request`
  ADD CONSTRAINT `ohrm_leave_request_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_request_ibfk_2` FOREIGN KEY (`leave_type_id`) REFERENCES `ohrm_leave_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_request_comment`
--
ALTER TABLE `ohrm_leave_request_comment`
  ADD CONSTRAINT `ohrm_leave_request_comment_ibfk_1` FOREIGN KEY (`leave_request_id`) REFERENCES `ohrm_leave_request` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_request_comment_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `ohrm_user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_leave_request_comment_ibfk_3` FOREIGN KEY (`created_by_emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_type`
--
ALTER TABLE `ohrm_leave_type`
  ADD CONSTRAINT `ohrm_leave_type_ibfk_1` FOREIGN KEY (`operational_country_id`) REFERENCES `ohrm_operational_country` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_location`
--
ALTER TABLE `ohrm_location`
  ADD CONSTRAINT `ohrm_location_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `hs_hr_country` (`cou_code`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_menu_item`
--
ALTER TABLE `ohrm_menu_item`
  ADD CONSTRAINT `ohrm_menu_item_ibfk_1` FOREIGN KEY (`screen_id`) REFERENCES `ohrm_screen` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_module_default_page`
--
ALTER TABLE `ohrm_module_default_page`
  ADD CONSTRAINT `ohrm_module_default_page_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `ohrm_user_role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_module_default_page_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `ohrm_module` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_openid_user_identity`
--
ALTER TABLE `ohrm_openid_user_identity`
  ADD CONSTRAINT `ohrm_user_identity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ohrm_user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_user_identity_ibfk_2` FOREIGN KEY (`provider_id`) REFERENCES `ohrm_openid_provider` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_operational_country`
--
ALTER TABLE `ohrm_operational_country`
  ADD CONSTRAINT `fk_ohrm_operational_country_hs_hr_country` FOREIGN KEY (`country_code`) REFERENCES `hs_hr_country` (`cou_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_pay_grade_currency`
--
ALTER TABLE `ohrm_pay_grade_currency`
  ADD CONSTRAINT `ohrm_pay_grade_currency_ibfk_1` FOREIGN KEY (`currency_id`) REFERENCES `hs_hr_currency_type` (`currency_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_pay_grade_currency_ibfk_2` FOREIGN KEY (`pay_grade_id`) REFERENCES `ohrm_pay_grade` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_performance_review`
--
ALTER TABLE `ohrm_performance_review`
  ADD CONSTRAINT `ohrm_performance_review_ibfk_1` FOREIGN KEY (`employee_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_performance_track`
--
ALTER TABLE `ohrm_performance_track`
  ADD CONSTRAINT `ohrm_performance_track_fk1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ohrm_performance_track_fk2` FOREIGN KEY (`added_by`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_performance_tracker_log`
--
ALTER TABLE `ohrm_performance_tracker_log`
  ADD CONSTRAINT `fk_ohrm_performance_tracker_log_1` FOREIGN KEY (`user_id`) REFERENCES `ohrm_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ohrm_performance_tracker_log_fk1` FOREIGN KEY (`performance_track_id`) REFERENCES `ohrm_performance_track` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ohrm_performance_tracker_log_fk2` FOREIGN KEY (`reviewer_id`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_performance_tracker_reviewer`
--
ALTER TABLE `ohrm_performance_tracker_reviewer`
  ADD CONSTRAINT `ohrm_performance_tracker_reviewer_fk1` FOREIGN KEY (`performance_track_id`) REFERENCES `ohrm_performance_track` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ohrm_performance_tracker_reviewer_fk2` FOREIGN KEY (`reviewer_id`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_project_activity`
--
ALTER TABLE `ohrm_project_activity`
  ADD CONSTRAINT `ohrm_project_activity_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `ohrm_project` (`project_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_project_admin`
--
ALTER TABLE `ohrm_project_admin`
  ADD CONSTRAINT `ohrm_project_admin_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `ohrm_project` (`project_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_project_admin_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_report`
--
ALTER TABLE `ohrm_report`
  ADD CONSTRAINT `ohrm_report_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `ohrm_report_group` (`report_group_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_reviewer`
--
ALTER TABLE `ohrm_reviewer`
  ADD CONSTRAINT `ohrm_reviewer_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `ohrm_performance_review` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_reviewer_rating`
--
ALTER TABLE `ohrm_reviewer_rating`
  ADD CONSTRAINT `ohrm_reviewer_rating_ibfk_1` FOREIGN KEY (`reviewer_id`) REFERENCES `ohrm_reviewer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_reviewer_rating_ibfk_2` FOREIGN KEY (`review_id`) REFERENCES `ohrm_performance_review` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_screen`
--
ALTER TABLE `ohrm_screen`
  ADD CONSTRAINT `ohrm_screen_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `ohrm_module` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_selected_composite_display_field`
--
ALTER TABLE `ohrm_selected_composite_display_field`
  ADD CONSTRAINT `ohrm_selected_composite_display_field_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `ohrm_report` (`report_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_selected_composite_display_field_ibfk_2` FOREIGN KEY (`composite_display_field_id`) REFERENCES `ohrm_composite_display_field` (`composite_display_field_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_selected_display_field`
--
ALTER TABLE `ohrm_selected_display_field`
  ADD CONSTRAINT `ohrm_selected_display_field_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `ohrm_report` (`report_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_selected_display_field_ibfk_2` FOREIGN KEY (`display_field_id`) REFERENCES `ohrm_display_field` (`display_field_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_selected_display_field_group`
--
ALTER TABLE `ohrm_selected_display_field_group`
  ADD CONSTRAINT `ohrm_selected_display_field_group_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `ohrm_report` (`report_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_selected_display_field_group_ibfk_2` FOREIGN KEY (`display_field_group_id`) REFERENCES `ohrm_display_field_group` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_selected_filter_field`
--
ALTER TABLE `ohrm_selected_filter_field`
  ADD CONSTRAINT `ohrm_selected_filter_field_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `ohrm_report` (`report_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_selected_filter_field_ibfk_2` FOREIGN KEY (`filter_field_id`) REFERENCES `ohrm_filter_field` (`filter_field_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_selected_group_field`
--
ALTER TABLE `ohrm_selected_group_field`
  ADD CONSTRAINT `ohrm_selected_group_field_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `ohrm_report` (`report_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_selected_group_field_ibfk_2` FOREIGN KEY (`group_field_id`) REFERENCES `ohrm_group_field` (`group_field_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_selected_group_field_ibfk_3` FOREIGN KEY (`summary_display_field_id`) REFERENCES `ohrm_summary_display_field` (`summary_display_field_id`);

--
-- Constraints for table `ohrm_summary_display_field`
--
ALTER TABLE `ohrm_summary_display_field`
  ADD CONSTRAINT `ohrm_summary_display_field_ibfk_1` FOREIGN KEY (`display_field_group_id`) REFERENCES `ohrm_display_field_group` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_timesheet_action_log`
--
ALTER TABLE `ohrm_timesheet_action_log`
  ADD CONSTRAINT `ohrm_timesheet_action_log_ibfk_1` FOREIGN KEY (`performed_by`) REFERENCES `ohrm_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_user`
--
ALTER TABLE `ohrm_user`
  ADD CONSTRAINT `ohrm_user_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_user_ibfk_2` FOREIGN KEY (`user_role_id`) REFERENCES `ohrm_user_role` (`id`);

--
-- Constraints for table `ohrm_user_role_data_group`
--
ALTER TABLE `ohrm_user_role_data_group`
  ADD CONSTRAINT `ohrm_user_role_data_group_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `ohrm_user_role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_user_role_data_group_ibfk_2` FOREIGN KEY (`data_group_id`) REFERENCES `ohrm_data_group` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_user_role_screen`
--
ALTER TABLE `ohrm_user_role_screen`
  ADD CONSTRAINT `ohrm_user_role_screen_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `ohrm_user_role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_user_role_screen_ibfk_2` FOREIGN KEY (`screen_id`) REFERENCES `ohrm_screen` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_work_week`
--
ALTER TABLE `ohrm_work_week`
  ADD CONSTRAINT `fk_ohrm_work_week_ohrm_operational_country` FOREIGN KEY (`operational_country_id`) REFERENCES `ohrm_operational_country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `leave_taken_status_change` ON SCHEDULE EVERY 1 HOUR STARTS '2016-10-25 06:49:09' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
		UPDATE hs_hr_leave SET leave_status = 3 WHERE leave_status = 2 AND leave_date < DATE(NOW());
	  END$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
