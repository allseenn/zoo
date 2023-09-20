USE `Друзья человека`;

-- Создаем таблицу "animals"
CREATE TABLE IF NOT EXISTS `animals` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `animal_id` varchar(255),
  `birth` DATE DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `command_list` TEXT
);

-- Переносим кошек из таблицы "кошки" в "animals"
INSERT INTO `animals` (`animal_id`, `birth`, `name`, `command_list`)
SELECT `Домашние животные`.`animal`, `кошки`.`birth`, `кошки`.`name`, `кошки`.`command_list`
FROM `кошки`
JOIN `Домашние животные` ON `кошки`.`animal_id` = `Домашние животные`.`id`;

-- Переносим собак из таблицы "собаки" в "animals"
INSERT INTO `animals` (`animal_id`, `birth`, `name`, `command_list`)
SELECT `Домашние животные`.`animal`, `собаки`.`birth`, `собаки`.`name`, `собаки`.`command_list`
FROM `собаки`
JOIN `Домашние животные` ON `собаки`.`animal_id` = `Домашние животные`.`id`;

-- Переносим хомяков из таблицы "хомяки" в "animals"
INSERT INTO `animals` (`animal_id`, `birth`, `name`, `command_list`)
SELECT `Домашние животные`.`animal`, `хомяки`.`birth`, `хомяки`.`name`, `хомяки`.`command_list`
FROM `хомяки`
JOIN `Домашние животные` ON `хомяки`.`animal_id` = `Домашние животные`.`id`;

-- Переносим непарнокопытных из таблицы "непарнокопытные" в "animals"
INSERT INTO `animals` (`animal_id`, `birth`, `name`, `command_list`)
SELECT `Вьючные животные`.`animal`, `непарнокопытные`.`birth`, `непарнокопытные`.`name`, `непарнокопытные`.`command_list`
FROM `непарнокопытные`
JOIN `Вьючные животные` ON `непарнокопытные`.`animal_id` = `Вьючные животные`.`id`;

UPDATE animals a
SET a.command_list = (
    SELECT GROUP_CONCAT(k.command ORDER BY FIND_IN_SET(k.id, REPLACE(a.command_list, ' ', ',')))
    FROM Команды k
    WHERE FIND_IN_SET(k.id, REPLACE(a.command_list, ' ', ',')) > 0
)
WHERE a.command_list IS NOT NULL;

ALTER TABLE animals ADD COLUMN monthes INT;

UPDATE animals
SET monthes = TIMESTAMPDIFF(MONTH, birth, CURDATE())
WHERE birth IS NOT NULL
   AND TIMESTAMPDIFF(MONTH, birth, CURDATE()) BETWEEN 12 AND 36;


DROP TABLE `кошки`, `собаки`, `хомяки`, `непарнокопытные`, `Команды`;
DROP TABLE `Домашние животные`, `Вьючные животные`, `молодые животные`;

