<%-- 
    Document   : jstl_database
    Created on : 29 Apr 2026, 3:36:03 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSTL SQL Tags - User List</title>
    <style>
        table { width: 50%; border-collapse: collapse; margin-top: 20px; }
        th { background-color: #add8e6; padding: 10px; }
        td { padding: 10px; text-align: center; }
    </style>
</head>
<body>
    <h2>User List (Fetched directly using JSTL SQL)</h2>

    <%-- 1. Setting up the database connection --%>
    <sql:setDataSource 
        var="dbConnection" 
        driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/webappdevlab5"
        user="root" 
        password="admin" />

    <%-- 2. Executing the SQL query --%>
    <sql:query dataSource="${dbConnection}" var="result">
        SELECT * FROM users;
    </sql:query>

    <%-- 3. Displaying the results in a table --%>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Roles</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row['id']}" /></td>
                    <td><c:out value="${row['username']}" /></td>
                    <td><c:out value="${row['roles']}" /></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>

