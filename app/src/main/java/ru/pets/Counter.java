package ru.pets;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;
class Counter {
    public int count;
    private List<Animal> zoo;
    public List<String> sumpters;
    public List<String> pets;
    private final List<String> course = Arrays.asList(
            "сидеть", "ходить", "лежать", "бегать", "прыгать",
            "лапать", "атаковать", "петь", "искать", "плевать", "танцевать"
    );
    Scanner scanner = new Scanner(System.in);

    public Counter() {
        this.count = 0;
        this.zoo = new ArrayList<>();
        this.sumpters = new ArrayList<>();
        this.pets = new ArrayList<>();
        try {
            animalFile();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void animalFile() throws IOException {
        try (BufferedReader reader = new BufferedReader(new FileReader("../pets/Друзья человека"))) {
            String line;
            boolean inSumpters = false;
            boolean inPets = false;

            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) {
                    continue; // Пропускаем пустые строки
                }

                if (line.trim().equals("Друзья человека")) {
                    continue; // Пропускаем заголовок
                }

                if (line.trim().equals("Домашние животные")) {
                    inPets = true;
                    inSumpters = false;
                    continue;
                }

                if (line.trim().equals("Вьючные животные")) {
                    inSumpters = true;
                    inPets = false;
                    continue;
                }

                if (inSumpters) {
                    sumpters.add(line.trim());
                }

                if (inPets) {
                    pets.add(line.trim());
                }
            }
        }
    }
    public void addSumpter() {
        Any.cls();
        System.out.print("Выберите номер вида ( ");
        for (int i = 0; i < sumpters.size(); i++) {
            System.out.print(i + "." + sumpters.get(i) + " ");
        }
        System.out.print("): ");
        int chosenIndex = getIntInput();

        if (chosenIndex >= 0 && chosenIndex < sumpters.size()) {
            String sumpterType = sumpters.get(chosenIndex);

            System.out.print("Имя: ");
            String sumpterName = scanner.nextLine();
            System.out.print("Дата рождения: ");
            String sumpterBirth = scanner.nextLine();
            System.out.print("Пол: ");
            String sumpterSex = scanner.nextLine();
            System.out.print("Длина гривы: ");
            int maneLength = getIntInput();
            System.out.print("Размер копыт: ");
            int hoofSize = getIntInput();

            Sumpter sumpter = new Sumpter(sumpterType, sumpterName, sumpterBirth, sumpterSex, maneLength, hoofSize);
            System.out.println("Индекс: " + count + " присвоен животному: " + sumpter.info());
            zoo.add(sumpter);
            count++;

        } else {
            System.out.println("Неверный номер вида. Попробуйте снова.");
        }
        Any.key();
    }

    public void addPet() {
        Any.cls();
        System.out.print("Выберите номер вида ( ");
        for (int i = 0; i < pets.size(); i++) {
            System.out.print(i + "." + pets.get(i) + " ");
        }
        System.out.print("): ");
        int chosenIndex = getIntInput();

        if (chosenIndex >= 0 && chosenIndex < pets.size()) {
            String sumpterType = sumpters.get(chosenIndex);

            System.out.print("Имя: ");
            String sumpterName = scanner.nextLine();
            System.out.print("Дата рождения: ");
            String sumpterBirth = scanner.nextLine();
            System.out.print("Пол: ");
            String sumpterSex = scanner.nextLine();
            System.out.print("Длина хвоста: ");
            int maneLength = getIntInput();
            System.out.print("Размер когтей: ");
            int hoofSize = getIntInput();

            Sumpter sumpter = new Sumpter(sumpterType, sumpterName, sumpterBirth, sumpterSex, maneLength, hoofSize);
            System.out.println("Индекс: " + count + " присвоен животному: " + sumpter.info());
            zoo.add(sumpter);
            count++;

        } else {
            System.out.println("Неверный номер вида. Попробуйте снова.");
        }
        Any.key();
    }

    public void showAllAnimals() {
        Any.cls();
        for (int i = 0; i < zoo.size(); i++) {
            Animal animal = zoo.get(i);
            System.out.println("Индекс: " + i);
            System.out.print(animal.info());
            System.out.println(", умеет: " + animal.list());
        }
        Any.key();
    }
    public void learnSkill() {
        Any.cls();
        System.out.print("Введите индекс животного для обучения: ");
        int index = getIntInput();

        if (index >= 0 && index < zoo.size()) {
            Animal animal = zoo.get(index);
            List<String> skills = animal.list();
            String type = animal.info().split(" ")[0];
            String name = animal.info().split(" ")[1];
            System.out.print(type + " " + name + " Уже умеет: ");

            System.out.println(skills);

            System.out.println("Можно обучить:");

            for (int i = 0; i < course.size(); i++) {
                String skill = course.get(i);
                if (!skills.contains(skill)) {
                    System.out.println((i + 1) + ". " + skill);
                } else {
                    System.out.println(skill + " уже научено.");
                }
            }

            System.out.print("Введите номер навыка для обучения или 'q' для выхода: ");
            String input = scanner.nextLine();

            if ("q".equalsIgnoreCase(input)) {
                return; // Выход из метода
            }

            try {
                int skillIndex = Integer.parseInt(input) - 1;

                if (skillIndex >= 0 && skillIndex < course.size()) {
                    String selectedSkill = course.get(skillIndex);
                    if (!skills.contains(selectedSkill)) {
                        animal.learn(selectedSkill);
                        System.out.println("Навык добавлен.");
                    } else {
                        System.out.println(selectedSkill + " уже научено.");
                    }
                } else {
                    System.out.println("Неверный номер навыка.");
                }
            } catch (NumberFormatException e) {
                System.out.println("Неверный формат ввода.");
            }
        } else {
            System.out.println("Неверный индекс.");
        }
        Any.key();
    }
    public void removeAnimal() {
        Any.cls();
        System.out.print("Введите индекс животного для удаления: ");
        int removeIndex = getIntInput();

        if (removeIndex >= 0 && removeIndex < zoo.size()) {
            Animal removedAnimal = zoo.remove(removeIndex);
            count--;

            System.out.println("Животное удалено: " + removedAnimal.info());
        } else {
            System.out.println("Неверный индекс.");
        }
        Any.key();
    }
    public void commandAnimal() {
        Any.cls();
        System.out.print("Введите индекс животного для команды: ");
        int index = getIntInput();

        if (index >= 0 && index < zoo.size()) {
            Animal animal = zoo.get(index);
            List<String> skills = animal.list();

            if (skills.isEmpty()) {
                System.out.println("У животного нет доступных навыков.");
                return;
            }

            System.out.println("Доступные навыки:");

            for (int i = 0; i < skills.size(); i++) {
                System.out.println((i + 1) + ". " + skills.get(i));
            }

            System.out.print("Введите номер навыка или 'q' для выхода: ");
            String input = scanner.nextLine();

            if ("q".equalsIgnoreCase(input)) {
                return; // Выход из метода
            }

            try {
                int skillIndex = Integer.parseInt(input) - 1;

                if (skillIndex >= 0 && skillIndex < skills.size()) {
                    String selectedSkill = skills.get(skillIndex);
                    animal.command(selectedSkill);
                } else {
                    System.out.println("Неверный номер навыка.");
                }
            } catch (NumberFormatException e) {
                System.out.println("Неверный формат ввода.");
            }
        } else {
            System.out.println("Неверный индекс.");
        }
        Any.key();
    }
    private int getIntInput() {
        while (true) {
            try {
                String input = scanner.nextLine();
                if (input.isEmpty()) {
                    throw new NumberFormatException(); // Генерируем исключение для пустой строки
                }
                return Integer.parseInt(input);
            } catch (NumberFormatException e) {
                System.out.println("Неверный формат ввода. Попробуйте снова.");
            }
        }
    }
}
