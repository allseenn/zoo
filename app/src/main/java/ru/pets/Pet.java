package ru.pets;

public class Pet extends Animal {
    private int tail; // Длина хвоста
    private int nail; // Длина ногтей

    public Pet(String animalType, String name, String birth, String sex, int tail, int nail) {
        super(animalType, name, birth, sex);
        this.tail = tail;
        this.nail = nail;
        this.learn("есть");
        this.learn("лакать");

    }

    // Переопределение метода info()
    @Override
    public String info() {
        // Вызов родительского метода info() для получения информации о типе, имени, дате рождения и поле
        String parentInfo = super.info();

        // Добавление информации о длине хвоста и длине ногтей
        return parentInfo + " хвост.см: " + tail + " когти.мм: " + nail;
    }

    @Override
    public void command(String action) {
        if (this.list().contains(action)) {
            switch (action) {
                case "есть":
                    meal();
                    break;
                case "лакать":
                    lap();
                    break;
                default:
                    super.command(action); // Если навык не найден, вызовем родительский метод
            }
        }
    }

    // Публичный метод для поедания мяса
    private void meal() {
        System.out.println(info().split(" ")[0] + " " + info().split(" ")[1] + " есть");
    }

    // Публичный метод для локации жидкости
    private void lap() {
        System.out.println(info().split(" ")[0] + " " + info().split(" ")[1] + " лакает");
    }
}
