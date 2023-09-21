package ru.pets;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Counter counter = new Counter();
        while (true) {
            try {
                Any.cls();
                System.out.println("Сейчас животных в питомнике: " + counter.count);
                System.out.println("1. Новое вьючное животное");
                System.out.println("2. Новое домашнее животное");
                System.out.println("3. Список всех животных");
                System.out.println("4. Обучение новым командам");
                System.out.println("5. Удалить животное");
                System.out.println("6. Приказать животному");
                System.out.println("7. Выход");
                System.out.print("Выберите действие (1-7): ");

                String choiceStr = scanner.nextLine();

                if (choiceStr.isEmpty()) {
                    throw new NumberFormatException("Пустой ввод"); // Генерируем исключение для пустой строки
                }
                int choice = Integer.parseInt(choiceStr);
                switch (choice) {
                    case 1:
                        counter.addSumpter();
                        break;
                    case 2:
                        counter.addPet();
                        break;
                    case 3:
                        counter.showAllAnimals();
                        break;
                    case 4:
                        counter.learnSkill();
                        break;
                    case 5:
                        counter.removeAnimal();
                        break;
                    case 6:
                        counter.commandAnimal();
                        break;
                    case 7:
                        System.out.println("Программа завершена.");
                        scanner.close();
                        System.exit(0);
                        break;
                    default:
                        System.out.println("Неверный выбор. Попробуйте снова.");
                }
            } catch (NumberFormatException e) {
                System.out.println("Ошибка: Введите корректное число от 1 до 7.");
            } catch (Exception e) {
                System.out.println("Ошибка: " + e.getMessage());
            }
        }
    }
}
