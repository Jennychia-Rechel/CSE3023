<%-- 
    Document   : dashboardExercise
    Created on : 19 May 2026, 4:27:42 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Security Guard: Ambil session sedia ada (jangan buat baru)
    HttpSession sess = request.getSession(false);
    
    // Ambil objek StudentBean yang disimpan semasa login
    com.lab.bean.StudentBean user = (sess != null) ? (com.lab.bean.StudentBean) sess.getAttribute("loggedUser") : null;

    // LOGIK: Jika belum login, tendang balik ke login.html
    if (user == null) {
        response.sendRedirect("login.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Dashboard</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f4f7f6;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .dashboard-container {
                background-color: #ffffff;
                width: 400px;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                text-align: center;
            }
            h2 {
                color: #333333;
                margin-bottom: 25px;
            }
            .profile-card {
                margin-bottom: 25px;
                display: flex;
                justify-content: center;
            }
            .profile-img {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                object-fit: cover;
                border: 3px solid #4CAF50;
                box-shadow: 0 2px 10px rgba(0,0,0,0.15);
            }
            .no-image {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                background: #e0e0e0;
                color: #666666;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 14px;
                border: 3px solid #ccc;
            }
            .info-group {
                background-color: #f9f9f9;
                padding: 12px 20px;
                margin-bottom: 25px;
                border-radius: 6px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-left: 5px solid #4CAF50;
            }
            .label {
                font-weight: bold;
                color: #666666;
            }
            .value {
                color: #333333;
                font-size: 16px;
            }
            .actions {
                display: flex;
                justify-content: space-between;
                gap: 15px;
            }
            .btn {
                flex: 1;
                padding: 12px;
                text-decoration: none;
                font-weight: bold;
                border-radius: 5px;
                transition: background 0.3s ease;
                font-size: 14px;
            }
            .btn-logout {
                background-color: #2196F3;
                color: white;
            }
            .btn-logout:hover {
                background-color: #0b7dda;
            }
            .btn-delete {
                background-color: #f44336;
                color: white;
            }
            .btn-delete:hover {
                background-color: #da190b;
            }
        </style>
    </head>
    <body>

        <div class="dashboard-container">
            <h2>Welcome, <%= user.getFullname() %>!</h2>

            <div class="profile-card">
                <% if (user.getBase64Image() != null && !user.getBase64Image().isEmpty()) { %>
                    <img src="data:image/jpeg;base64, <%= user.getBase64Image() %>" alt="Profile Image" class="profile-img">
                <% } else { %>
                    <div class="no-image">No Image</div>
                <% } %>
            </div>

            <div class="info-group">
                <span class="label">Matric No:</span>
                <span class="value"><%= user.getMatricNo() %></span>
            </div>

            <div class="actions">
                <a href="SubjectServlet?action=view" class="btn">Manage My Subjects</a>
                <a href="UserServlet?action=logout" class="btn btn-logout">Logout</a>
                <a href="UserServlet?action=delete" class="btn btn-delete" 
                   onclick="return confirm('Are you sure you want to delete your account? This action cannot be undone.');">
                   Delete Account
                </a>
            </div>
        </div>

    </body>
</html>