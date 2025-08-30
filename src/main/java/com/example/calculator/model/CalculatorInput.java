package com.example.calculator.model;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.NotBlank;

//Changes

public class CalculatorInput {

    @NotNull(message = "Number 1 cannot be null")
    private Double num1;

    private Double num2; // Optional for some operations

    @NotBlank(message = "Operation cannot be blank")
    private String operation;

    // Getters & Setters
    public Double getNum1() { return num1; }
    public void setNum1(Double num1) { this.num1 = num1; }

    public Double getNum2() { return num2; }
    public void setNum2(Double num2) { this.num2 = num2; }

    public String getOperation() { return operation; }
    public void setOperation(String operation) { this.operation = operation; }
}
