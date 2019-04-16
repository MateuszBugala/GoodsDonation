package pl.coderslab.model;

import java.util.Random;

public class Token {

    private final String LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private final char[] ALPHANUMERIC = (LETTERS + LETTERS.toLowerCase() + "0123456789").toCharArray();

    public String generateRandom(int length) {
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < length; i++) {
            result.append(ALPHANUMERIC[new Random().nextInt(ALPHANUMERIC.length)]);
        }
        return result.toString();
    }

}
