package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.Model.Car;

public class CarDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/carshop";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin"; 
    private static final String SELECT_ALL_CARS = "select * from CarPricelist";
    private static final String INSERT_CAR_SQL = "INSERT INTO CarPricelist (Brand, Model, Cyclinder, Price) VALUES (?, ?, ?, ?);";
    private static final String DELETE_CAR_SQL = "DELETE FROM CarPricelist WHERE Car_id = ?;";
    private static final String SELECT_CAR_BY_ID = "select Car_id, Brand, Model, Cyclinder, Price from CarPricelist where Car_id = ?;";
    private static final String UPDATE_CAR_SQL = "update CarPricelist set Brand = ?, Model= ?, Cyclinder =?, Price =? where Car_id = ?;";

    public CarDAO() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    // 1. VIEW ALL DATA
    public List<Car> selectAllCars() {
        List<Car> cars = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CARS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("Car_id"); 
                String brand = rs.getString("Brand");
                String model = rs.getString("Model");
                int cyclinder = rs.getInt("Cyclinder");
                double price = rs.getDouble("Price");
                cars.add(new Car(id, brand, model, cyclinder, price));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cars;
    }

    // 2. ADD NEW DATA
    public void insertCar(Car car) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CAR_SQL)) {
            preparedStatement.setString(1, car.getBrand());
            preparedStatement.setString(2, car.getModel());
            preparedStatement.setInt(3, car.getCyclinder());
            preparedStatement.setDouble(4, car.getPrice());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 3. DELETE DATA
    public boolean deleteCar(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_CAR_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    // 4. SELECT 1 CAR (Untuk Edit)
    public Car selectCar(int id) {
        Car car = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CAR_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String brand = rs.getString("Brand");
                String model = rs.getString("Model");
                int cyclinder = rs.getInt("Cyclinder");
                double price = rs.getDouble("Price");
                car = new Car(id, brand, model, cyclinder, price);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return car;
    }

    // 5. UPDATE DATA
    public boolean updateCar(Car car) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_CAR_SQL);) {
            statement.setString(1, car.getBrand());
            statement.setString(2, car.getModel());
            statement.setInt(3, car.getCyclinder());
            statement.setDouble(4, car.getPrice());
            statement.setInt(5, car.getCarId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}