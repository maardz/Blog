-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Loomise aeg: Nov 03, 2014 kell 04:02 PL
-- Serveri versioon: 5.6.17
-- PHP versioon: 5.5.12

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Andmebaas: `blog`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(10) unsigned NOT NULL,
  `author` varchar(25) NOT NULL,
  `comment_text` text NOT NULL,
  `comment_created` timestamp NOT NULL,
  `post_id` int(10) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Andmete tõmmistamine tabelile `comment`
--

INSERT INTO `comment` (`comment_id`, `author`, `comment_text`, `comment_created`, `post_id`) VALUES
(0, '', 'test test test', '2014-11-03 13:33:15', 0);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_subject` varchar(225) NOT NULL,
  `post_text` text NOT NULL,
  `post_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Andmete tõmmistamine tabelile `post`
--

INSERT INTO `post` (`post_id`, `post_subject`, `post_text`, `post_created`, `user_id`) VALUES
(1, '', '', '2014-10-19 22:47:34', 1),
(7, 'pealkiri', 'Slow-carb meggings Portland retro authentic, squid kogi freegan brunch church-key tousled plaid. Blue Bottle +1 cornhole, mustache jean shorts sriracha shabby chic heirloom mlkshk Godard wayfarers. Selfies meditation crucifix XOXO. Blog cray messenger bag beard 90''s, put a bird on it umami McSweeney''s raw denim ethical lo-fi Intelligentsia synth. Messenger bag jean shorts bespoke 8-bit, slow-carb keytar Odd Future crucifix tote bag sriracha hoodie. Echo Park tattooed meggings blog Schlitz quinoa. Godard Tumblr +1, Banksy blog jean shorts pour-over direct trade stumptown High Life small batch Pitchfork iPhone.', '2014-10-22 11:44:01', 1),
(8, 'teine postitus veel', 'Occupy Helvetica Truffaut, direct trade banjo lomo Wes Anderson Kickstarter tofu. Dreamcatcher normcore cardigan occupy gentrify. Before they sold out photo booth PBR Pinterest crucifix forage. Pickled skateboard Tumblr Shoreditch, McSweeney''s street art Bushwick 3 wolf moon wolf roof party retro normcore irony tousled. Deep v polaroid next level Banksy. Photo booth whatever messenger bag, raw denim readymade organic food truck 90''s art party four loko Wes Anderson bespoke salvia Carles Blue Bottle. Shabby chic put a bird on it cliche banh mi Tonx selfies.', '2014-10-22 11:49:21', 1);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
CREATE TABLE IF NOT EXISTS `post_tag` (
  `post_id` int(11) unsigned NOT NULL,
  `tag_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Andmete tõmmistamine tabelile `post_tag`
--

INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES
(7, 1),
(1, 2),
(8, 4);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(25) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Andmete tõmmistamine tabelile `tag`
--

INSERT INTO `tag` (`tag_id`, `tag_name`) VALUES
(1, 'tag123'),
(2, 'tag123'),
(3, 'test'),
(4, 'valmis');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UNIQUE` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Andmete tõmmistamine tabelile `user`
--

INSERT INTO `user` (`user_id`, `username`, `is_admin`, `password`, `active`, `email`, `deleted`) VALUES
(1, 'demo', 0, 'demo', 1, '', 0);

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Piirangud tabelile `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post_tag_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  ADD CONSTRAINT `post_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`);
SET FOREIGN_KEY_CHECKS=1;
