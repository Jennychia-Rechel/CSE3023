<%-- 
    Document   : processInsuranceQuo
    Created on : 21 Apr 2026, 3:36:31 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insurance Quotation Result</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 40px;
        }
        .container {
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
        }
        .main-header {
            font-size: 1.2rem;
            color: #333;
            margin-bottom: 20px;
            border-left: 5px solid #6f42c1;
            padding-left: 15px;
            font-weight: bold;
        }
        .card {
            background: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }
        .label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-size: 0.9rem;
        }
        .value {
            display: block;
            margin-bottom: 15px;
            color: #333;
            font-size: 1rem;
        }
        hr {
            border: 0;
            border-top: 2px solid #333;
            margin: 20px 0;
        }
        .final-amount {
            font-weight: bold;
            font-size: 1.1rem;
        }
        .btn-back {
            padding: 5px 20px;
            background-color: #e0e0e0;
            border: 1px solid #ccc;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            color: black;
            font-size: 0.85rem;
        }
    </style>
</head>
<body>

<%
    // 1. Retrieve data (Pastikan 'name' di sini sama dengan fail HTML tadi)
    String icno = request.getParameter("icNo");
    String name = request.getParameter("custName");
    String coverage = request.getParameter("coverageType");
    String ncdStr = request.getParameter("ncdRate");
    
    double price = 0;
    double ncdRate = 0;
    
    try {
        price = Double.parseDouble(request.getParameter("marketPrice"));
        ncdRate = Double.parseDouble(ncdStr) / 100.0; // Tukar peratus ke decimal (cth: 55 ke 0.55)
    } catch (Exception e) {
        price = 0;
        ncdRate = 0;
    }

    // 2. Business Logic
    double rate = 0;
    String coverageDisplay = "";
    
    if ("Comprehensive".equals(coverage)) {
        rate = 0.05; // 5%
        coverageDisplay = "Comprehensive";
    } else {
        rate = 0.03; // 3%
        coverageDisplay = "Third Party";
    }

    // Calculations
    double baseInsurance = price * rate;
    double ncdDiscount = baseInsurance * ncdRate;
    double afterNCD = baseInsurance - ncdDiscount;
    double sst = afterNCD * 0.08;
    double finalAmount = afterNCD + sst;
%>

<div class="container">
    <div class="main-header">
        Insurance Quotation Result
    </div>

    <div class="card">
        <span class="label">IC No:</span>
        <span class="value"><%= icno %></span>

        <span class="label">Name:</span>
        <span class="value"><%= name %></span>

        <span class="label">Market Price (RM):</span>
        <span class="value"><%= String.format("%.2f", price) %></span>

        <span class="label">Coverage Type:</span>
        <span class="value"><%= coverageDisplay %></span>

        <span class="label">NCD:</span>
        <span class="value"><%= (int)(ncdRate * 100) %>%</span>

        <hr>

        <span class="label">Base Insurance:</span>
        <span class="value">RM <%= String.format("%.2f", baseInsurance) %></span>

        <span class="label">NCD Discount:</span>
        <span class="value">RM <%= String.format("%.2f", ncdDiscount) %></span>

        <span class="label">After NCD:</span>
        <span class="value">RM <%= String.format("%.2f", afterNCD) %></span>

        <span class="label">SST (8%):</span>
        <span class="value">RM <%= String.format("%.2f", sst) %></span>

        <span class="label">Final Insurance Amount:</span>
        <span class="value final-amount">RM <%= String.format("%.2f", finalAmount) %></span>

        <br>
        <a href="insuranceQuotation.jsp" class="btn-back">Back</a>
    </div>
</div>

</body>
</html>
