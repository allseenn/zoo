-- Создаем базу данных "Друзья человека"
CREATE DATABASE IF NOT EXISTS `Друзья человека`;

-- Используем созданную базу данных
USE `Друзья человека`;

-- Создаем таблицу "Команды"
CREATE TABLE IF NOT EXISTS `Команды` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `command` VARCHAR(255) NOT NULL
);

-- Вставляем команды
INSERT INTO `Команды` (`command`) VALUES
  ('сидеть'), ('стоять'), ('лежать'), ('беги'), ('иди'), ('прыгай'), 
  ('танцуй'), ('лапу'), ('фас'), ('голос'), ('ищи'), ('плюй');

-- Создаем таблицу "Домашние животные"
CREATE TABLE IF NOT EXISTS `Домашние животные` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `animal` VARCHAR(255) NOT NULL
);

-- Создаем таблицу "Вьючные животные"
CREATE TABLE IF NOT EXISTS `Вьючные животные` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `animal` VARCHAR(255) NOT NULL
);

-- Создаем таблицы в группе "Домашние животные"
CREATE TABLE IF NOT EXISTS `собаки` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `animal_id` INT,
  `birth` DATE,
  `name` VARCHAR(255) NOT NULL,
  `command_list` TEXT,
  FOREIGN KEY (`animal_id`) REFERENCES `Домашние животные`(`id`)
);

CREATE TABLE IF NOT EXISTS `кошки` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `animal_id` INT,
  `birth` DATE,
  `name` VARCHAR(255) NOT NULL,
  `command_list` TEXT,
  FOREIGN KEY (`animal_id`) REFERENCES `Домашние животные`(`id`)
);

CREATE TABLE IF NOT EXISTS `хомяки` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `animal_id` INT,
  `birth` DATE,
  `name` VARCHAR(255) NOT NULL,
  `command_list` TEXT,
  FOREIGN KEY (`animal_id`) REFERENCES `Домашние животные`(`id`)
);

-- Создаем таблицы в группе "Домашние животные"
CREATE TABLE IF NOT EXISTS `лошади` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `animal_id` INT,
  `birth` DATE,
  `name` VARCHAR(255) NOT NULL,
  `command_list` TEXT,
  FOREIGN KEY (`animal_id`) REFERENCES `Вьючные животные`(`id`)
);

CREATE TABLE IF NOT EXISTS `верблюды` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `animal_id` INT,
  `birth` DATE,
  `name` VARCHAR(255) NOT NULL,
  `command_list` TEXT,
  FOREIGN KEY (`animal_id`) REFERENCES `Вьючные животные`((`id`)
);

CREATE TABLE IF NOT EXISTS `ослы` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `animal_id` INT,
  `birth` DATE,
  `name` VARCHAR(255) NOT NULL,
  `command_list` TEXT,
  FOREIGN KEY (`animal_id`) REFERENCES `Вьючные животные`((`id`)
);

-- Вставляем данные для Домашних животных
INSERT INTO `Домашние животные` (`animal`) VALUES
  ('собака'), ('кошка'), ('хомяк');

-- Вставляем данные для Вьючных животных
INSERT INTO `Вьючные животные` (`animal`) VALUES
  ('лошадь'), ('верблюд'), ('осел');

-- Вставляем данные для животных
INSERT INTO `собаки` (`animal_id`, `birth`, `name`, `command_list`) VALUES
  (1, '2019-08-01', 'Рекс', '1 2 3 4 5 6 7 8 9 10 11'),
  (1, '2020-03-15', 'Белла', '1 2 3 4 5 6 7 8');

INSERT INTO `кошки` (`animal_id`, `birth`, `name`, `command_list`) VALUES
  (2, '2018-05-20', 'Мурка', '1 2 3 4 5 6 7 8 10 11'),
  (2, '2019-12-10', 'Васька', '1 2 3 4 5 6 8 10');

INSERT INTO `хомяки` (`animal_id`, `birth`, `name`, `command_list`) VALUES
  (3, '2022-02-05', 'Харри', '1 2 3 4 5 6 7');

INSERT INTO `лошади` (`animal_id`, `birth`, `name`, `command_list`) VALUES
  (1, '2015-07-10', 'Буцефал', '1 2 3 4 5 6 7 8 10'),
  (1, '2016-04-22', 'Рокки', '1 2 4 5 6 8 10');

INSERT INTO `верблюды` (`animal_id`, `birth`, `name`, `command_list`) VALUES
  (2, '2017-09-12', 'Саид', '1 2 3 4 5 6 7 8 12'),
  (2, '2018-10-25', 'Амина', '1 2 3 4 5 6 7 8 12');

INSERT INTO `ослы` (`animal_id`, `birth`, `name`, `command_list`) VALUES
  (3, '2019-04-30', 'Оскар', '1 2 3 4 5 6 7 8 10'),
  (3, '2020-11-15', 'Оля', '1 2 3 4 5 6 8 10');
