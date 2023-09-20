USE `Друзья человека`;

-- Создаем таблицу "Команды"
CREATE TABLE IF NOT EXISTS `Команды` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `command` VARCHAR(255) NOT NULL
);

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

-- Создаем таблицы в группе "Вьючные животные"
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
  FOREIGN KEY (`animal_id`) REFERENCES `Вьючные животные`(`id`)
);

CREATE TABLE IF NOT EXISTS `ослы` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `animal_id` INT,
  `birth` DATE,
  `name` VARCHAR(255) NOT NULL,
  `command_list` TEXT,
  FOREIGN KEY (`animal_id`) REFERENCES `Вьючные животные`(`id`)
);

