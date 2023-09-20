package ru.pets;

public class Sumpter extends Animal {
    private int mane; // Длина гривы
    private int hoof; // Размер копыта

    public Sumpter(String animalType, String name, String birth, String sex, int mane, int hoof) {
        super(animalType, name, birth, sex);
        this.mane = mane;
        this.hoof = hoof;
        this.learn("жевать");
        this.learn("пить");
    }

    @Override
    public String info() {
        // Вызов родительского метода info() для получения информации о типе, имени, дате рождения и поле
        String parentInfo = super.info();

        // Добавление информации о длине хвоста и длине ногтей
        return parentInfo + " грива.мм: " + mane + " копыта.мм: " + hoof;
    }

    @Override
    public void command(String action) {
        if (this.list().contains(action)) {
            switch (action) {
                case "жевать":
                    crop();
                    break;
                case "пить":
                    drink();
                    break;
                default:
                    super.command(action); // Если навык не найден, вызовем родительский метод
            }
        }
    }

    // Публичный метод для поедания травы
    private void crop() {
        System.out.println(info().split(" ")[0] + " " + info().split(" ")[1] + " жуёт");
    }

    // Публичный метод для пития воды
    public void drink() {
        System.out.println(info().split(" ")[0] + " " + info().split(" ")[1] + " пьет");
    }
}

