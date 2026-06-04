<%-- 
    Document   : forwardInfo
    Created on : 21 Apr 2026, 3:21:15 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forwarded Info</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 40px;
        }
        .container {
            width: 100%;
            max-width: 650px;
            margin: 0 auto;
        }
        .main-header {
            font-size: 1.1rem;
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
            font-weight: 500;
            margin-top: 0;
            margin-bottom: 25px;
        }
        .info-group {
            margin-bottom: 12px;
            font-size: 0.95rem;
            color: #333;
        }
        strong {
            display: inline-block;
            width: 100px; /* Lebar label supaya nampak kemas */
        }
    </style>
</head>
<body>

<div class="container">
    <div class="main-header">
        Using jsp:forward to display user info
    </div>

    <div class="card">
        <h2 class="form-title">Forwarded Info</h2>

        <%
            String name = request.getParameter("uname");
            String email = request.getParameter("email");
            String nationality = request.getParameter("nationality");
            String background = request.getParameter("background");
        %>

        <div class="info-group">
            <strong>Name:</strong> <%= (name != null) ? name : "" %>
        </div>
        
        <div class="info-group">
            <strong>Email:</strong> <%= (email != null) ? email : "" %>
        </div>
        
        <div class="info-group">
            <strong>Nationality:</strong> <%= (nationality != null) ? nationality : "" %>
        </div>
        
        <div class="info-group">
            <strong>Background:</strong> <%= (background != null) ? background : "" %>
        </div>
    </div>
</div>

</body>
</html>