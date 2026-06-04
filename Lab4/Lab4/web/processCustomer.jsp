<%-- 
    Document   : processCustomer
    Created on : 21 Apr 2026, 2:02:06 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Discount Result</title>
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
        .form-title {
            color: #6f42c1;
            font-size: 1.6rem;
            font-weight: 600;
            margin-bottom: 25px;
        }
        .result-group {
            margin-bottom: 15px;
        }
        .label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        .value {
            display: block;
            margin-bottom: 15px;
            color: #555;
        }
        .btn-back {
            padding: 5px 15px;
            background-color: #e0e0e0;
            border: 1px solid #ccc;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            color: black;
            font-size: 0.8rem;
        }
    </style>
</head>
<body>

<%
    // 1. Retrieve Data
    String custCode = request.getParameter("custCode");
    String custType = request.getParameter("custType");
    String qtyStr = request.getParameter("quantity");
    
    final double price = 10.0;
    int quantity = 0;
    
    // 2. Convert Data
    try {
        if(qtyStr != null) quantity = Integer.parseInt(qtyStr);
    } catch(Exception e) {
        quantity = 0;
    }
    
    // 3. Business Logic
    double total = 0;
    String status = "";
    
    if ("1".equals(custType) && quantity > 100) {
        status = "You're entitled to 10% discount";
        total = (quantity * price) * 0.9;
    } else if ("2".equals(custType) && quantity > 100) {
        status = "You're entitled to 25% discount";
        total = (quantity * price) * 0.75;
    } else {
        status = "You're not entitled to any discount";
        total = quantity * price;
    }
    
    String custTypeDisplay = "1".equals(custType) ? "Normal Customer" : "Privilege Customer";
%>

<div class="container">
    <div class="main-header">
        Customer Discount Result
    </div>

    <div class="card">
        <h2 class="form-title">Transaction Summary</h2>
        
        <div class="result-group">
            <span class="label">Customer Code:</span>
            <span class="value"><%= (custCode != null) ? custCode : "" %></span>
        </div>

        <div class="result-group">
            <span class="label">Quantity:</span>
            <span class="value"><%= quantity %></span>
        </div>

        <div class="result-group">
            <span class="label">Customer Type:</span>
            <span class="value"><%= custTypeDisplay %></span>
        </div>

        <div class="result-group">
            <span class="label">Status:</span>
            <span class="value"><%= status %></span>
        </div>

        <div class="result-group">
            <span class="label">Total Amount:</span>
            <span class="value">RM <%= String.format("%.2f", total) %></span>
        </div>

        <br>
        <a href="customer.html" class="btn-back">Back</a>
    </div>
</div>

</body>
</html>