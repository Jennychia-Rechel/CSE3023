<%-- 
    Document   : main
    Created on : 12 May 2026, 4:31:25 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Main Page - Profile</title>
    <style>
        .profile-card {
            width: 400px;
            margin: 50px auto;
            border: 2px solid #4CAF50;
            border-radius: 10px;
            padding: 20px;
            font-family: Arial, sans-serif;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        h2 { color: #4CAF50; text-align: center; }
        .info-row { margin-bottom: 15px; border-bottom: 1px solid #eee; padding-bottom: 5px; }
        .label { font-weight: bold; color: #555; }
        .logout-btn { 
            display: block; 
            width: 100px; 
            margin: 20px auto 0; 
            text-align: center; 
            background-color: #f44336; 
            color: white; 
            padding: 8px; 
            text-decoration: none; 
            border-radius: 5px; 
        }
    </style>
</head>
<body>
    <div class="profile-card">
        <h2>User Profile</h2>
        
        <div class="info-row">
            <span class="label">Username:</span> 
            <%= session.getAttribute("user") %>
        </div>
        
        <div class="info-row">
            <span class="label">First Name:</span> 
            <%= session.getAttribute("fname") %>
        </div>
        
        <div class="info-row">
            <span class="label">Last Name:</span> 
            <%= session.getAttribute("lname") %>
        </div>

        <a href="login.jsp" class="logout-btn">Logout</a>
    </div>
</body>
</html>