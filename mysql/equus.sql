USE `Друзья человека`;

CREATE TABLE `непарнокопытные` (
  `id` int NOT NULL AUTO_INCREMENT,
  `animal_id` int DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `command_list` text,
  PRIMARY KEY (`id`),
  KEY `animal_id` (`animal_id`),
  CONSTRAINT `непарнокопытные_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `Домашние животные` (`id`)
);

INSERT INTO `непарнокопытные` (`animal_id`, `birth`, `name`, `command_list`)
SELECT `animal_id`, `birth`, `name`, `command_list` FROM `лошади`
UNION ALL
SELECT `animal_id`, `birth`, `name`, `command_list` FROM `ослы`;

DROP TABLE IF EXISTS `лошади`, `ослы`, `верблюды`;


