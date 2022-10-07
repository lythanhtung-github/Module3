package com.example.calculateapp;

public class Calculator {
    public static float calculate(float firstNumber, float secondNumber, String operator) {
        float result;
        switch (operator) {
            case "+":
                result = firstNumber + secondNumber;
                break;
            case "-":
                result = firstNumber - secondNumber;
                break;
            case "*":
                result = firstNumber * secondNumber;
                break;
            case "/":
                if (secondNumber != 0) {
                    result = firstNumber / secondNumber; break;
                } else throw new RuntimeException("Can't divide by zero");

            default:
                throw new RuntimeException("Invalid operation");
        }
        return result;
    }
}
