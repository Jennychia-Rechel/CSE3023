package com.WEB;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.CarDAO;
import com.Model.Car;

@WebServlet("/")
public class CarServlet extends HttpServlet {
    private CarDAO carDAO;

    public void init() {
        carDAO = new CarDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertCar(request, response);
                    break;
                case "/delete":
                    deleteCar(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateCar(request, response);
                    break;
                default:
                    listCar(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    //(MAIN)
    private void listCar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Car> listCar = carDAO.selectAllCars();
        request.setAttribute("listCar", listCar);
        RequestDispatcher dispatcher = request.getRequestDispatcher("carList.jsp");
        dispatcher.forward(request, response);
    }

    //(NEW FORM)
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("carForm.jsp");
        dispatcher.forward(request, response);
    }

    //(EDIT)
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Car existingCar = carDAO.selectCar(id);
        request.setAttribute("car", existingCar);
        RequestDispatcher dispatcher = request.getRequestDispatcher("carForm.jsp");
        dispatcher.forward(request, response);
    }

    //(INSERT)
    private void insertCar(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        int cyclinder = Integer.parseInt(request.getParameter("cyclinder"));
        double price = Double.parseDouble(request.getParameter("price"));

        Car newCar = new Car(0, brand, model, cyclinder, price);
        carDAO.insertCar(newCar);
        
        listCar(request, response);
    }

    //(UPDATE)
    private void updateCar(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        int cyclinder = Integer.parseInt(request.getParameter("cyclinder"));
        double price = Double.parseDouble(request.getParameter("price"));

        Car car = new Car(id, brand, model, cyclinder, price);
        carDAO.updateCar(car);
        
        listCar(request, response);
    }

    //(DELETE)
    private void deleteCar(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        carDAO.deleteCar(id);
        
        listCar(request, response);
    }
}