<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Car Management Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
          crossorigin="anonymous">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #2c3e50">
            <div><a href="#" class="navbar-brand">🚗 Car Shop Admin System</a></div>
        </nav>
    </header>

    <div class="container col-md-5 pt-5">
        <div class="card">
            <div class="card-body">
                <c:if test="${car != null}">
                    <form action="update" method="post">
                </c:if>
                <c:if test="${car == null}">
                    <form action="insert" method="post">
                </c:if>

                <caption>
                    <h2>
                        <c:if test="${car != null}">Edit Car</c:if>
                        <c:if test="${car == null}">Add New Car</c:if>
                    </h2>
                </caption>

                <c:if test="${car != null}">
                    <input type="hidden" name="id" value="<c:out value='${car.carId}' />" />
                </c:if>

                <fieldset class="form-group">
                    <label>Car Brand</label> 
                    <input type="text" value="<c:out value='${car.brand}' />" class="form-control" name="brand" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Car Model</label> 
                    <input type="text" value="<c:out value='${car.model}' />" class="form-control" name="model" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Engine Cylinder (cc)</label> 
                    <input type="number" value="<c:out value='${car.cyclinder}' />" class="form-control" name="cyclinder" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Car Price (RM)</label> 
                    <input type="text" value="<c:out value='${car.price}' />" class="form-control" name="price" required="required">
                </fieldset>

                <button type="submit" class="btn btn-success">Save Car</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>