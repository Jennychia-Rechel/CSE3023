<%-- 
    Document   : processCalculateCarLoan
    Created on : 14 Apr 2026, 3:15:11 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perform Car Loan Calculation</title>
    </head>
    <body>
        <h2>Perform Car Loan Calculation</h2>
        <hr/>
        
        <fieldset>
            <% 
                String strAmount = request.getParameter("loan_amount");
                String strPeriod = request.getParameter("loan_period");
                
                double loanAmount = Double.parseDouble(strAmount);
                int period = Integer.parseInt(strPeriod);

                double interestRate = 0.045;
                double totalInterest = loanAmount * interestRate * period;
                double totalLoan = loanAmount + totalInterest;
            %>
            
            <h3 style="color: blue;">Details of car loan:</h3>
            
            <p>Loan Request : <%= loanAmount %></p>
            <p>Period of payment : <%= period %></p>
            <p><b>Total Loan (+ interest) : <%= totalLoan %></b></p>
            
        </fieldset>
        
        <p>&copy;2026-Jenny</p>
    </body>
</html>
