<%-- 
    Document   : errorStudent
    Created on : 12 May 2026, 3:59:43 pm
    Author     : Huawei
--%>

<%-- Step 2: Declare that this is an error page --%>
<%@page isErrorPage="true" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Error Page</title>
    </head>
    <body>
        <form id="errorFrm" action="insertStudent.jsp" method="post">
            <h1>Lab 9 - Task 1 - Perform creating and retrieving records via JSP page</h1>
            <p>Error when inserting record...!</p>
            
            <%-- Step 3: Complete remaining code to show error message --%>
            <p><jsp:expression>exception.getMessage()</jsp:expression></p>
            <hr>
            <input type="submit" value="Back to Registration">
        </form>
    </body>
</html>