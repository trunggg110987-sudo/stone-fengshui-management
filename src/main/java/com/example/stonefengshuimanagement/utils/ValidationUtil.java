package com.example.stonefengshuimanagement.utils;

import java.util.regex.Pattern;

public class ValidationUtil {

    private static final String EMAIL_REGEX =
            "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";

    private static final String PHONE_REGEX =
            "^[0-9]{9,11}$";

    public static boolean isNullOrEmpty(String input) {
        return input == null || input.trim().isEmpty();
    }

    public static boolean isValidEmail(String email) {
        if (isNullOrEmpty(email)) return false;
        return Pattern.matches(EMAIL_REGEX, email);
    }

    public static boolean isValidPhone(String phone) {
        if (isNullOrEmpty(phone)) return false;
        return Pattern.matches(PHONE_REGEX, phone);
    }

    public static boolean isValidPassword(String password) {
        if (isNullOrEmpty(password)) return false;
        return password.length() >= 6;
    }

    public static boolean isPositiveNumber(String value) {
        if (isNullOrEmpty(value)) return false;
        try {
            double number = Double.parseDouble(value);
            return number >= 0;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}