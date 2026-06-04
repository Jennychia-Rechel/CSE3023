<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Car Shop Price List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
          crossorigin="anonymous">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #2c3e50">
            <div>
                <a href="#" class="navbar-brand">Jenny's CarShop 🚗</a>
            </div>
        </nav>
    </header>

    <div class="container mt-5">
        <h3 class="text-center">The Car List That Available In This Shop</h3>
        <hr>
        
        <div class="container text-left mb-3">
            <a href="new" class="btn btn-success">Add New Car</a>
        </div>
        
        <table class="table table-bordered table-striped mt-4">
            <thead class="thead-dark">
                <tr>
                    <th>No.</th>
                    <th>Brand (Jenama)</th>
                    <th>Model (Jenis)</th>
                    <th>Cylinder (Enjin cc)</th>
                    <th>Price (Harga RM)</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="car" items="${listCar}" varStatus="loop">
                    <tr>
                        <td><c:out value="${loop.count}" /></td>
                        <td><c:out value="${car.brand}" /></td>
                        <td><c:out value="${car.model}" /></td>
                        <td><c:out value="${car.cyclinder}" /></td>
                        <td><c:out value="${car.price}" /></td>
                        <td>
                            <a href="edit?id=<c:out value='${car.carId}' />" class="btn btn-sm btn-primary">Edit</a>
                            &nbsp;&nbsp;
                            <a href="delete?id=<c:out value='${car.carId}' />" class="btn btn-sm btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>