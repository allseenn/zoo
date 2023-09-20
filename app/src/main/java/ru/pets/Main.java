package ru.pets;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        List<Animal> zoo = new ArrayList<>(); // Создаем список для хранения объектов Pets и Sumpter
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("Меню:");
            System.out.println("1. Завести новое вьючное животное (Sumpter)");
            System.out.println("2. Завести новое домашнее животное (Pets)");
            System.out.println("3. Вывести всех животных");
            System.out.println("4. Обучение навыкам");
            System.out.println("5. Удалить животное");
            System.out.println("6. Выход");
            System.out.print("Выберите действие (1-6): ");

            int choice = scanner.nextInt();
            scanner.nextLine(); // Считываем символ новой строки после ввода числа

            switch (choice) {
                case 1:
                    // Создание объекта Sumpter и добавление его в список zoo
                    System.out.print("Введите тип: ");
                    String sumpterType = scanner.nextLine();
                    System.out.print("Введите имя: ");
                    String sumpterName = scanner.nextLine();
                    System.out.print("Введите дату рождения: ");
                    String sumpterBirth = scanner.nextLine();
                    System.out.print("Введите пол: ");
                    String sumpterSex = scanner.nextLine();
                    System.out.print("Введите длину гривы: ");
                    int maneLength = scanner.nextInt();
                    System.out.print("Введите размер копыта: ");
                    int hoofSize = scanner.nextInt();
                    zoo.add(new Sumpter(sumpterType, sumpterName, sumpterBirth, sumpterSex, maneLength, hoofSize));
                    break;
                case 2:
                    // Создание объекта Pets и добавление его в список zoo
                    System.out.print("Введите тип: ");
                    String petsType = scanner.nextLine();
                    System.out.print("Введите имя: ");
                    String petsName = scanner.nextLine();
                    System.out.print("Введите дату рождения: ");
                    String petsBirth = scanner.nextLine();
                    System.out.print("Введите пол: ");
                    String petsSex = scanner.nextLine();
                    System.out.print("Введите длину хвоста: ");
                    int tailLength = scanner.nextInt();
                    System.out.print("Введите длину ногтей: ");
                    int nailLength = scanner.nextInt();
                    zoo.add(new Pet(petsType, petsName, petsBirth, petsSex, tailLength, nailLength));
                    break;
                case 3:
                    // Вывод информации о всех животных в списке
                    for (int i = 0; i < zoo.size(); i++) {
                        Animal animal = zoo.get(i);
                        System.out.println("Индекс: " + i);
                        System.out.println(animal.info());
                        System.out.println("Навыки: " + animal.list());
                        System.out.println();
                    }
                    break;
                case 4:
                    // Обучение навыкам
                    System.out.print("Введите индекс животного для обучения: ");
                    int index = scanner.nextInt();
                    scanner.nextLine(); // Считываем символ новой строки после ввода числа
                    if (index >= 0 && index < zoo.size()) {
                        System.out.print("Введите новый навык: ");
                        String skill = scanner.nextLine();
                        zoo.get(index).learn(skill);
                        System.out.println("Навык добавлен.");
                    } else {
                        System.out.println("Неверный индекс.");
                    }
                    break;
                case 5:
                    // Удаление животного
                    System.out.print("Введите индекс животного для удаления: ");
                    int removeIndex = scanner.nextInt();
                    scanner.nextLine(); // Считываем символ новой строки после ввода числа
                    if (removeIndex >= 0 && removeIndex < zoo.size()) {
                        zoo.remove(removeIndex);
                        System.out.println("Животное удалено.");
                    } else {
                        System.out.println("Неверный индекс.");
                    }
                    break;
                case 6:
                    // Выход из программы
                    System.out.println("Программа завершена.");
                    scanner.close();
                    System.exit(0);
                    break;
                default:
                    System.out.println("Неверный выбор. Попробуйте снова.");
            }
        }
    }
}
