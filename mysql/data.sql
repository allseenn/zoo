USE `Друзья человека`;

-- Вставляем данные для Домашних животных
INSERT INTO `Домашние животные` (`animal`) VALUES
  ('собака'), ('кошка'), ('хомяк');

-- Вставляем данные для Вьючных животных
INSERT INTO `Вьючные животные` (`animal`) VALUES
  ('лошадь'), ('верблюд'), ('осел');

-- Вставляем данные для животных
INSERT INTO `собаки` (`animal_id`, `birth`, `name`, `command_list`) VALUES
  (1, '2019-08-01', 'Рекс', '1 2 3 4 5 6 7 8 9 10 11'),
  (1, '2020-03-15', 'Белла', '1 2 3 4 5 6 7 8 9 10 11');

INSERT INTO `кошки` (`animal_id`, `birth`, `name`, `command_list`) VALUES
  (2, '2018-05-20', 'Мурка', '1 2 3 4 5 6 7 8 10 11'),
  (2, '2019-12-10', 'Васька', '1 2 3 4 5 6 8 10 11');

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
