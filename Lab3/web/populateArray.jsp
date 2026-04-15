<%-- 
    Document   : populateArray
    Created on : 14 Apr 2026, 2:53:37 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab 3 - Populate Array</title>
    </head>
    <body>
        <h2>Salesman's Sale Data</h2>

        <%
            String[][] salesData = {
                {"Salesman 1", "2,500", "2,100", "2,200"},
                {"Salesman 2", "2,000", "1,900", "2,400"},
                {"Salesman 3", "1,800", "2,200", "2,450"}
            };
        %>

        <table border="1" cellpadding="10">
            <thead>
                <tr bgcolor="#eb87be">
                    <th>Salesman</th>
                    <th>Jan</th>
                    <th>Feb</th>
                    <th>Mar</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (int i = 0; i < salesData.length; i++) {
                %>
                <tr>
                    <td><%= salesData[i][0] %></td>
                    <td><%= salesData[i][1] %></td>
                    <td><%= salesData[i][2] %></td>
                    <td><%= salesData[i][3] %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        
        <br/>
        &copy;2026-Jenny
    </body>
</html>
