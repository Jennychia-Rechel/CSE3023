<%-- 
    Document   : processCurrency
    Created on : 21 Apr 2026, 2:40:43 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Currency Conversion Result</title>
    <style>
        /* Base setup */
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 50px 20px;
            display: flex;
            justify-content: center;
        }
        
        /* Container utama */
        .main-wrapper {
            width: 100%;
            max-width: 550px;
        }

        /* Header ungu di luar kotak */
        .top-label {
            font-size: 1.3rem;
            color: #333;
            font-weight: bold;
            border-left: 5px solid #6f42c1;
            padding-left: 15px;
            margin-bottom: 20px;
        }

        /* Kotak Putih (Card) */
        .result-card {
            background: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        }

        /* Tajuk dalam kotak */
        .title-purple {
            color: #6f42c1;
            font-size: 1.7rem;
            margin-top: 0;
            margin-bottom: 30px;
        }

        /* Gaya tulisan Label */
        .info-label {
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 10px;
            display: block;
        }

        /* Gaya tulisan Hasil */
        .info-value {
            font-size: 1.1rem;
            color: #333;
            margin-bottom: 30px;
            display: block;
        }

        /* Butang Back */
        .btn-back {
            display: inline-block;
            background-color: #e0e0e0;
            color: #333;
            padding: 8px 18px;
            text-decoration: none;
            border-radius: 4px;
            border: 1px solid #adadad;
            font-weight: 500;
            font-size: 0.9rem;
        }
        .btn-back:hover {
            background-color: #d5d5d5;
        }
    </style>
</head>
<body>

<%! 
    // Logic - Declaration
    final double USD = 0.25;
    final double EURO = 0.21;
    final double JPY = 40.0;
    final double SGD = 0.32;

    private double calculateRate(String currency, int amount) {
        if (currency == null) return 0.0;
        if (currency.equals("1")) return amount * USD;
        if (currency.equals("2")) return amount * EURO;
        if (currency.equals("3")) return amount * JPY;
        if (currency.equals("4")) return amount * SGD;
        return 0.0;
    }
%>

<%
    // Logic - Scriptlet
    String cType = request.getParameter("currencyType");
    String amtStr = request.getParameter("amount");
    
    int amount = 0;
    double result = 0;
    
    try {
        if (amtStr != null) {
            amount = Integer.parseInt(amtStr);
            result = calculateRate(cType, amount);
        }
    } catch (Exception e) { amount = 0; }
    
    String cName = "USD"; // Default
    if ("2".equals(cType)) cName = "EURO";
    else if ("3".equals(cType)) cName = "JPY";
    else if ("4".equals(cType)) cName = "SGD";
%>

<div class="main-wrapper">
    <div class="top-label">JSP Application Result</div>

    <div class="result-card">
        <h2 class="title-purple">Conversion Result</h2>
        
        <span class="info-label">Amount in Ringgit Malaysia (RM):</span>
        <span class="info-value">RM <%= amount %></span>
        
        <span class="info-label">Converted to (<%= cName %>):</span>
        <span class="info-value"><%= String.format("%.2f", result) %></span>
        
        <a href="currencyConversion.html" class="btn-back">Back to Converter</a>
    </div>
</div>

</body>
</html>