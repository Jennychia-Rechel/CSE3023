<%-- 
    Document   : insertStudent
    Created on : 12 May 2026, 3:42:45 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
</head>
<body>
    <form action="ProcessStudent.jsp" method="POST">
        <fieldset style="width: 450px;">
            <legend>Student Registration</legend>
            <table border="0">
                <tr>
                    <td>Student No</td>
                    <!-- Menggunakan pattern untuk Regular Expression [A-Z0-9]* -->
                    <td><input type="text" name="studentID" pattern="[A-Z0-9]*" placeholder="E.g.: UKXXXXX" required></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="studentName" placeholder="Enter your name" required></td>
                </tr>
                <tr>
                    <td>Program</td>
                    <td>
                        <!-- Dropdown (combo box) untuk Program -->
                        <select name="program">
                            <option value="BSc. Soft. Eng.">BSc. Soft. Eng.</option>
                            <option value="BSc. with IM">BSc. with IM</option>
                            <option value="BSc. in Networking">BSc. in Networking</option>
                            <option value="BSc. in Robotics">BSc. in Robotics</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br>
                        <input type="submit" value="Submit">
                        <input type="reset" value="Cancel">
                    </td>
                </tr>
            </table>
        </fieldset>
    </form>
    
    <br>
    <footer style="font-size: 12px;">
        ©2016
    </footer>
</body>
</html>
