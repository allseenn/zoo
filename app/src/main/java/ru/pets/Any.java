package ru.pets;

import java.util.Scanner;

public class Any {
    public static void cls(){
        System.out.println("\033[H\033[2J"); // Clear Screen
    }
    public static void key() {
        System.out.println("Нажмите Enter, для продолжения.");
        Scanner scanner = new Scanner(System.in);
        scanner.nextLine(); // Ждем, пока пользователь нажмет Enter

    }
}