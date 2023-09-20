USE `Друзья человека`;

-- Создаем таблицу "молодые животные"
CREATE TABLE IF NOT EXISTS `молодые животные` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `animal_id` INT,
  `birth` DATE,
  `name` VARCHAR(255) NOT NULL,
  `command_list` TEXT,
  `age_months` INT
);

-- Вставляем данные в таблицу "молодые животные" 
INSERT INTO `молодые животные` (`animal_id`, `birth`, `name`, `command_list`, `age_months`)
SELECT `animal_id`, `birth`, `name`, `command_list`,
    TIMESTAMPDIFF(MONTH, `birth`, NOW()) AS `age_months`
FROM `непарнокопытные`
WHERE `birth` BETWEEN DATE_SUB(NOW(), INTERVAL 3 YEAR) AND DATE_SUB(NOW(), INTERVAL 1 YEAR);

INSERT INTO `молодые животные` (`animal_id`, `birth`, `name`, `command_list`, `age_months`)
SELECT `animal_id`, `birth`, `name`, `command_list`,
    TIMESTAMPDIFF(MONTH, `birth`, NOW()) AS `age_months`
FROM `кошки`
WHERE `birth` BETWEEN DATE_SUB(NOW(), INTERVAL 3 YEAR) AND DATE_SUB(NOW(), INTERVAL 1 YEAR);

INSERT INTO `молодые животные` (`animal_id`, `birth`, `name`, `command_list`, `age_months`)
SELECT `animal_id`, `birth`, `name`, `command_list`,
    TIMESTAMPDIFF(MONTH, `birth`, NOW()) AS `age_months`
FROM `собаки`
WHERE `birth` BETWEEN DATE_SUB(NOW(), INTERVAL 3 YEAR) AND DATE_SUB(NOW(), INTERVAL 1 YEAR);

INSERT INTO `молодые животные` (`animal_id`, `birth`, `name`, `command_list`, `age_months`)
SELECT `animal_id`, `birth`, `name`, `command_list`,
    TIMESTAMPDIFF(MONTH, `birth`, NOW()) AS `age_months`
FROM `хомяки`
WHERE `birth` BETWEEN DATE_SUB(NOW(), INTERVAL 3 YEAR) AND DATE_SUB(NOW(), INTERVAL 1 YEAR);

