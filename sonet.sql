SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
CREATE TABLE IF NOT EXISTS `announcements` (`id` bigint(20) NOT NULL AUTO_INCREMENT,`usernameCreated` varchar(128) NOT NULL,`usernameUpdated` varchar(128) NOT NULL,`dateCreated` datetime NOT NULL,`dateExpires` datetime NOT NULL,`title` varchar(128) NOT NULL,`body` longtext NOT NULL,`linkUrl` varchar(2048) NOT NULL,`linkText` varchar(256) NOT NULL,`publishState` varchar(16) NOT NULL,PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `autoSaveContent` (`username` varchar(128) NOT NULL,`content` longtext NOT NULL,PRIMARY KEY (`username`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `blogs` (`id` bigint(20) NOT NULL AUTO_INCREMENT,`usernameCreated` varchar(128) NOT NULL,`usernameUpdated` varchar(128) NOT NULL,`documentType` varchar(64) NOT NULL,`category` varchar(64) NOT NULL,`subcategory` varchar(64) NOT NULL,`subject` varchar(64) NOT NULL,`rating` varchar(4) NOT NULL,`dateCreated` datetime DEFAULT NULL,`dateUpdated` datetime DEFAULT NULL,`datePublished` datetime DEFAULT NULL,`publishState` varchar(16) NOT NULL,`hits` bigint(20) NOT NULL,`lastAccess` datetime DEFAULT NULL,`customHeader` mediumtext NOT NULL,`title` varchar(128) NOT NULL,`body` longtext NOT NULL,`summaryImage` varchar(2048) NOT NULL,`summary` text NOT NULL,`keywords` text NOT NULL,PRIMARY KEY (`id`),FULLTEXT KEY `title` (`title`,`body`,`summary`,`keywords`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `categories` (`id` bigint(20) NOT NULL AUTO_INCREMENT,`category` varchar(64) NOT NULL,`userSelectable` tinyint(1) NOT NULL DEFAULT '0',`hidden` tinyint(1) NOT NULL DEFAULT '0',`useAlternateClass` tinyint(1) NOT NULL DEFAULT '0',`defaultUrl` text NOT NULL,`flyoutContent` longtext NOT NULL,`weight` mediumint(9) NOT NULL,PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `categoriesUserGroups` (`groupId` bigint(20) NOT NULL,`category` varchar(64) NOT NULL,PRIMARY KEY (`groupId`,`category`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `commentsDocuments` (`parentId` bigint(20) NOT NULL,`id` bigint(20) NOT NULL AUTO_INCREMENT,`type` varchar(32) NOT NULL,`username` varchar(128) NOT NULL,`dateCreated` bigint(20) NOT NULL,`dateUpdated` bigint(20) NOT NULL,`body` longtext NOT NULL,PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `commentsImages` (`parentId` varchar(128) NOT NULL,`imageId` varchar(256) NOT NULL,`id` bigint(20) NOT NULL AUTO_INCREMENT,`type` varchar(32) NOT NULL,`username` varchar(128) NOT NULL,`dateCreated` bigint(20) NOT NULL,`dateUpdated` bigint(20) NOT NULL,`body` longtext NOT NULL,PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `commentsUserProfiles` (`parentId` varchar(128) NOT NULL,`id` bigint(20) NOT NULL AUTO_INCREMENT,`username` varchar(128) NOT NULL,`dateCreated` bigint(20) NOT NULL,`dateUpdated` bigint(20) NOT NULL,`body` longtext NOT NULL,PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `conversations` (`groupId` bigint(20) NOT NULL,`id` bigint(20) NOT NULL AUTO_INCREMENT,`title` varchar(256) NOT NULL,`dateCreated` datetime NOT NULL,`author` varchar(128) NOT NULL,`sticky` tinyint(1) NOT NULL DEFAULT '0',`restricted` tinyint(1) NOT NULL DEFAULT '0',`locked` tinyint(1) NOT NULL DEFAULT '0',PRIMARY KEY (`id`),FULLTEXT KEY `title` (`title`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `conversationsPosts` (`parentId` bigint(20) NOT NULL,`id` bigint(20) NOT NULL AUTO_INCREMENT,`body` longtext NOT NULL,`author` varchar(128) NOT NULL,`dateCreated` datetime NOT NULL,`dateUpdated` datetime NOT NULL,PRIMARY KEY (`id`),FULLTEXT KEY `body` (`body`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `documentEditTracking` (`documentType` varchar(64) NOT NULL,`id` bigint(20) NOT NULL,`username` varchar(128) NOT NULL,`date` datetime NOT NULL,PRIMARY KEY (`documentType`,`id`,`username`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `documents` (`id` bigint(20) NOT NULL AUTO_INCREMENT,`shortcut` varchar(128) NOT NULL,`usernameCreated` varchar(128) NOT NULL,`usernameUpdated` varchar(128) NOT NULL,`documentType` varchar(64) NOT NULL,`category` varchar(64) NOT NULL,`subcategory` varchar(64) NOT NULL,`subject` varchar(64) NOT NULL,`rating` varchar(4) NOT NULL,`dateCreated` datetime DEFAULT NULL,`dateUpdated` datetime DEFAULT NULL,`datePublished` datetime DEFAULT NULL,`publishState` varchar(16) NOT NULL,`hits` bigint(20) NOT NULL,`lastAccess` datetime DEFAULT NULL,`title` varchar(128) NOT NULL,`body` longtext NOT NULL,`author` varchar(128) NOT NULL,`summaryImage` varchar(2048) NOT NULL,`summary` text NOT NULL,`summaryLinkText` varchar(256) NOT NULL,`keywords` text NOT NULL,`galleryLinkText` varchar(256) NOT NULL,`galleryLinkBackUrl` varchar(2048) NOT NULL,`galleryLinkBackText` varchar(256) NOT NULL,`cssPath` varchar(2048) NOT NULL,`showToolbar` tinyint(1) NOT NULL DEFAULT '0',`showComments` tinyint(1) NOT NULL DEFAULT '0',`requireAuthentication` tinyint(1) NOT NULL DEFAULT '0',`doNotSyndicate` tinyint(1) NOT NULL DEFAULT '0',`component` tinyint(1) NOT NULL DEFAULT '0',PRIMARY KEY (`id`),UNIQUE KEY `shortcut` (`shortcut`),FULLTEXT KEY `title` (`title`,`body`,`summary`,`keywords`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `documentTypes` (`id` bigint(20) NOT NULL AUTO_INCREMENT,`documentType` varchar(64) NOT NULL,`userSelectable` tinyint(1) NOT NULL DEFAULT '0',`weight` mediumint(11) NOT NULL,PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `documentVersioning` (`parentId` bigint(20) NOT NULL,`documentType` varchar(64) NOT NULL,`version` bigint(20) NOT NULL,`dateCreated` datetime NOT NULL,`title` varchar(128) NOT NULL,`body` longtext NOT NULL,`usernameCreated` varchar(128) NOT NULL,PRIMARY KEY (`parentId`,`documentType`,`version`),FULLTEXT KEY `title` (`title`,`body`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `documentVotes` (`type` varchar(32) NOT NULL,`parentId` varchar(128) NOT NULL,`username` varchar(128) NOT NULL,`dateVoted` datetime DEFAULT NULL,`dateUpdated` datetime DEFAULT NULL,`voteYes` tinyint(1) NOT NULL DEFAULT '0',`voteNo` tinyint(1) NOT NULL DEFAULT '0',PRIMARY KEY (`type`,`parentId`,`username`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `events` (`id` bigint(20) NOT NULL AUTO_INCREMENT,`groupId` bigint(20) DEFAULT NULL,`usernameCreated` varchar(128) NOT NULL,`usernameUpdated` varchar(128) NOT NULL,`category` varchar(64) NOT NULL,`subcategory` varchar(64) NOT NULL,`subject` varchar(64) NOT NULL,`dateCreated` datetime DEFAULT NULL,`dateUpdated` datetime DEFAULT NULL,`datePublished` datetime DEFAULT NULL,`publishState` varchar(16) NOT NULL,`lastAccess` datetime NOT NULL,`customHeader` mediumtext NOT NULL,`title` varchar(128) NOT NULL,`startDate` datetime NOT NULL,`expireDate` datetime NOT NULL,`body` longtext NOT NULL,`summaryImage` varchar(2048) NOT NULL,`summary` text NOT NULL,`summaryLinkText` varchar(256) NOT NULL,`showComments` tinyint(1) NOT NULL DEFAULT '0',`private` tinyint(1) NOT NULL DEFAULT '0',PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `featuredDocuments` (`id` bigint(20) NOT NULL,`dateStarts` datetime NOT NULL,`dateExpires` datetime NOT NULL,`activeState` varchar(16) NOT NULL,`weight` mediumint(9) NOT NULL,PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `fileManager` (`wwwPath` text NOT NULL,`fsPath` text NOT NULL,`owner` varchar(128) NOT NULL,`security` varchar(16) NOT NULL,`groupId` longtext NOT NULL,KEY `owner` (`owner`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `focusedDocuments` (`id` bigint(20) NOT NULL,`dateStarts` datetime NOT NULL,`dateExpires` datetime NOT NULL,`activeState` varchar(16) NOT NULL,`weight` mediumint(9) NOT NULL,PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `friends` (`owner` varchar(128) NOT NULL,`friend` varchar(128) NOT NULL,`dateAdded` bigint(20) NOT NULL,`status` varchar(16) NOT NULL,`weight` mediumint(20) NOT NULL,PRIMARY KEY (`owner`,`friend`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `groups` (`id` bigint(20) NOT NULL AUTO_INCREMENT,`name` varchar(128) NOT NULL,`about` longtext NOT NULL,`dateCreated` datetime NOT NULL,`lastAccess` datetime NOT NULL,`approvalRequired` tinyint(1) NOT NULL DEFAULT '0',`exclusiveRequired` tinyint(1) NOT NULL DEFAULT '0',`allowNonMemberPosting` tinyint(1) NOT NULL DEFAULT '0',`summaryImage` varchar(2048) NOT NULL,`summary` text NOT NULL,PRIMARY KEY (`id`),FULLTEXT KEY `name` (`name`,`about`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `groupsMembers` (`parentId` bigint(20) NOT NULL,`username` varchar(128) NOT NULL,`memberLevel` varchar(32) NOT NULL,`dateJoined` datetime NOT NULL,`status` varchar(32) NOT NULL,PRIMARY KEY (`parentId`,`username`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `imagesDocuments` (`parentId` bigint(20) NOT NULL,`id` bigint(20) NOT NULL AUTO_INCREMENT,`inSeriesImage` tinyint(1) NOT NULL DEFAULT '0',`caption` varchar(256) NOT NULL,`title` varchar(128) NOT NULL,`body` longtext NOT NULL,`imageUrl` varchar(2048) NOT NULL,`weight` mediumint(9) NOT NULL,PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `imagesGroups` (`parentId` bigint(20) NOT NULL,`id` bigint(20) NOT NULL AUTO_INCREMENT,`inSeriesImage` tinyint(1) NOT NULL DEFAULT '0',`caption` varchar(256) NOT NULL,`title` varchar(128) NOT NULL,`body` longtext NOT NULL,`showComments` tinyint(1) NOT NULL DEFAULT '0',`imageUrl` varchar(2048) NOT NULL,`weight` mediumint(9) NOT NULL,PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `imagesUsers` (`parentId` varchar(128) NOT NULL,`id` bigint(20) NOT NULL AUTO_INCREMENT,`inSeriesImage` tinyint(1) NOT NULL DEFAULT '0',`dateCreated` datetime NOT NULL,`dateUpdated` datetime NOT NULL,`caption` varchar(256) NOT NULL,`title` varchar(128) NOT NULL,`body` longtext NOT NULL,`imageUrl` varchar(2048) NOT NULL,`weight` mediumint(9) NOT NULL,PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `messages` (`id` bigint(20) NOT NULL AUTO_INCREMENT,`dateSent` bigint(20) NOT NULL,`toUser` varchar(128) NOT NULL,`fromUser` varchar(128) NOT NULL,`subject` varchar(256) NOT NULL,`body` longtext NOT NULL,`status` varchar(16) NOT NULL,`system` tinyint(4) NOT NULL,PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `subcategories` (`id` bigint(20) NOT NULL AUTO_INCREMENT,`category` varchar(64) NOT NULL,`subcategory` varchar(64) NOT NULL,`userSelectable` tinyint(1) NOT NULL DEFAULT '0',`weight` mediumint(9) NOT NULL,PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `subjects` (`id` bigint(20) NOT NULL AUTO_INCREMENT,`category` varchar(64) NOT NULL,`subcategory` varchar(64) NOT NULL,`subject` varchar(64) NOT NULL,`userSelectable` tinyint(1) NOT NULL DEFAULT '0',`weight` mediumint(9) NOT NULL,PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `userGroups` (`id` bigint(20) NOT NULL AUTO_INCREMENT,`name` varchar(128) NOT NULL,`restrictViewing` tinyint(1) NOT NULL DEFAULT '1',`allowEditing` tinyint(1) NOT NULL DEFAULT '0',PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `userGroupsMembers` (`groupId` bigint(20) NOT NULL,`username` varchar(128) NOT NULL,PRIMARY KEY (`groupId`,`username`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `users` (`id` bigint(20) NOT NULL AUTO_INCREMENT,`username` varchar(128) NOT NULL,`password` varchar(128) NOT NULL,`email` varchar(512) NOT NULL,`imageUrl` varchar(2048) DEFAULT NULL,`name` varchar(128) DEFAULT NULL,`company` varchar(128) DEFAULT NULL,`profession` varchar(128) DEFAULT NULL,`dateOfBirth` date DEFAULT NULL,`race` varchar(64) NOT NULL,`gender` varchar(32) NOT NULL,`heightFeet` tinyint(4) NOT NULL,`heightInches` tinyint(4) NOT NULL,`bodyType` varchar(32) NOT NULL,`orientation` varchar(32) NOT NULL,`religion` varchar(64) NOT NULL,`smoke` varchar(32) NOT NULL,`drink` varchar(32) NOT NULL DEFAULT '',`hereFor` varchar(64) NOT NULL DEFAULT '',`city` varchar(128) DEFAULT NULL,`state` varchar(64) DEFAULT NULL,`zip` varchar(10) DEFAULT NULL,`country` varchar(128) DEFAULT NULL,`profileSummary` longtext NOT NULL,`interests` longtext NOT NULL,`showName` tinyint(1) NOT NULL DEFAULT '0',`showAge` tinyint(1) NOT NULL DEFAULT '0',`allowEmailNotifications` tinyint(1) NOT NULL DEFAULT '0',`commentsFromFriendsOnly` tinyint(1) NOT NULL DEFAULT '0',`dateCreated` datetime NOT NULL,`level` tinyint(4) NOT NULL,`status` varchar(32) NOT NULL,`lastLogin` datetime NOT NULL,`lastIpAddress` varchar(32) NOT NULL,`lastActive` datetime NOT NULL,`signedOut` datetime NOT NULL,`lastAccess` datetime NOT NULL,PRIMARY KEY (`id`),UNIQUE KEY `username` (`username`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `ZIPCodes` (`ZIPCode` char(5) NOT NULL,`Latitude` decimal(9,6) NOT NULL,`Longitude` decimal(9,6) NOT NULL,KEY `ZIPCode` (`ZIPCode`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;