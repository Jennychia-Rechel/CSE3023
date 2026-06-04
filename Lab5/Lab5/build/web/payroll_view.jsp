<%-- 
    Document   : payroll_view
    Created on : 29 Apr 2026, 4:06:18 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Payroll</title>
</head>
<body>
    <h2>Employee Payroll Display System</h2>
    <table border="1" cellpadding="10">
        <tr style="background-color: pink;">
            <th>ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>Basic Salary (RM)</th>
            <th>Status</th>
        </tr>
        <c:forEach var="emp" items="${employeeList}">
            <tr>
                <td>${emp.empId}</td>
                <td>${emp.name}</td>
                <td>${emp.department}</td>
                <td>${emp.basicSalary}</td>
                <td>
                    <c:choose>
                        <c:when test="${emp.basicSalary >= 3000}">
                            <strong>Senior</strong>
                        </c:when>
                        <c:otherwise>
                            Junior
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>