<%-- 
    Document   : memberProcessing
    Created on : 14 Apr 2026, 2:28:43 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab 3 - Task 1</title>
    </head>
    <body>
        <h2>Passing data from main JSP page to another JSP page</h2>
        <fieldset>
            <% 
                String myIC = null;
                String myName = null;
                
                myIC = request.getParameter("my_icno");
                myName = request.getParameter("my_name");
            %>
            
            <p>Thank you for registering in this event..!</p>
            <p>This is your details:</p>
            
            <p>IC No : <%= myIC %></p>
            <p>Name : <%= myName %></p>
        </fieldset>
    </body>
</html>
