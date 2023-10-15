package com.gnmathur.fma;

import java.util.Arrays;
import java.util.Random;

public class Main {
    public static void allocateMemory() {
        Random r = new Random();
        int[] bytes = new int[1024 * 1024];

        Arrays.setAll(bytes, i -> r.nextInt(100_000));

        double average = Arrays.stream(bytes)
                .average()
                .orElse(0.0);
        System.out.printf("Average: %.2f%n", average);
        bytes = null;
    }

    public static void main(String[] args) {
        while (true) {
            allocateMemory();
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}