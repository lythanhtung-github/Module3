package com.example.calculateapp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", value = "/calculate")
public class CalculatorServlet extends HttpServlet {
     @Override
     protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//          super.doGet(req, resp);
     }

     @Override
     protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          float firstNumber = Float.parseFloat(req.getParameter("firstNumber"));
          float secondNumber = Float.parseFloat(req.getParameter("secondNumber"));
          String operator = req.getParameter("operator");


          PrintWriter printWriter = resp.getWriter();
          printWriter.println("<html>");
          printWriter.println("<h1>Result: </h1>");
          try {
               float result = Calculator.calculate(firstNumber,secondNumber,operator);
               printWriter.println(firstNumber +" "+ operator +" "+ secondNumber + " = "+ result);
          }catch (Exception ex){
               printWriter.println("Error: " + ex.getMessage());
          }

          printWriter.println("</html>");
     }
}
