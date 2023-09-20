import java.util.ArrayList;
import java.util.List;

public class Animal {
    private String animalType; // Вид животного
    private String name; // Имя животного
    private String birth; // Дата рождения
    private String sex; // Пол
    private List<String> skills; // Список навыков

    public Animal(String animalType, String name, String birth, String sex) {
        this.animalType = animalType;
        this.name = name;
        this.birth = birth;
        this.sex = sex;
        this.skills = new ArrayList<>();
    }

    // Публычный метод для обучения животного новому навыку
    public void learn(String skill) {
        skills.add(skill);
    }

    // Публичный метод для получения списка доступных навыков
    public List<String> list() {
        return skills;
    }

    // Публичный метод для получения информации о животном
    public String info() {
        return "Тип: " + animalType + ", Имя: " + name + ", Дата рождения: " + birth + ", Пол: " + sex;
    }

    // Публычный метод для выполнения команды (действия)
    public void command(String action) {
        if (skills.contains(action)) {
            switch (action) {
                case "sit":
                    sit();
                    break;
                case "lie":
                    lie();
                    break;
                case "run":
                    run();
                    break;
                case "go":
                    go();
                    break;
                case "jump":
                    jump();
                    break;
                case "dance":
                    dance();
                    break;
                case "paw":
                    paw();
                    break;
                case "attack":
                    attack();
                    break;
                case "voice":
                    voice();
                    break;
                case "find":
                    find();
                    break;
                case "spit":
                    spit();
                    break;
                default:
                    System.out.println(name + " не знает, как это делать.");
            }
        } else {
            System.out.println(name + " не знает, как " + action + " делать.");
        }
    }

    // Приватные методы для выполнения действий
    private void sit() {
        System.out.println(name + " сел");
    }

    private void lie() {
        System.out.println(name + " лег");
    }

    private void run() {
        System.out.println(name + " побежал");
    }

    private void go() {
        System.out.println(name + " пошел");
    }

    private void jump() {
        System.out.println(name + " прыгает");
    }

    private void dance() {
        System.out.println(name + " танцует");
    }

    private void paw() {
        System.out.println(name + " дает лапу");
    }

    private void attack() {
        System.out.println(name + " нападает");
    }

    private void voice() {
        System.out.println(name + " издает звуки");
    }

    private void find() {
        System.out.println(name + " ищет");
    }

    private void spit() {
        System.out.println(name + " сплевывает");
    }
}

