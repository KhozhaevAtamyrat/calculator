package com.example.calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/calculator.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String result = request.getParameter("result");
        String[] strings = result.split(" ");
        Double calculationResult = null;
        if (strings.length < 3) {
            request.setAttribute("result", result);
            request.getRequestDispatcher("views/calculator.jsp").forward(request, response);
            return;
        }
        Double firstNumber = isNumeric(strings[0]) ? Double.parseDouble(strings[0]) : null;
        Double secondNumber = isNumeric(strings[2]) ? Double.parseDouble(strings[2]) : null;
        if (firstNumber == null || secondNumber == null) {
            request.setAttribute("result", "");
            request.getRequestDispatcher("views/calculator.jsp").forward(request, response);
            return;
        }
        switch (strings[1]) {
            case "+":
                calculationResult = firstNumber + secondNumber;
                break;
            case "-":
                calculationResult = firstNumber - secondNumber;
                break;
            case "/":
                calculationResult = firstNumber / secondNumber;
                break;
            case "*":
                calculationResult = firstNumber * secondNumber;
                break;
        }
        request.setAttribute("result", calculationResult + (strings.length == 4 ?( " " + strings[3] + " ") : ""));
        System.out.println(calculationResult);
        request.getRequestDispatcher("views/calculator.jsp").forward(request, response);
    }

    public static boolean isNumeric(String strNum) {
        if (strNum == null) {
            return false;
        }
        try {
            double d = Double.parseDouble(strNum);
        } catch (NumberFormatException nfe) {
            return false;
        }
        return true;
    }
}
