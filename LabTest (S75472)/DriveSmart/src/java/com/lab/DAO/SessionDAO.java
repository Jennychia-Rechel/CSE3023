/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lab.DAO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.lab.bean;

public class SessionDAO {
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc.mysql://localhost:3306/drivesmart_db","admin","admin123");
    }
    
    public boolean bookSession(SessionBean session) throws SQLException {
        String sql = "INSERT INTO training_session (session_id, studentName, branchLocation, lesson_type, status) VALUES (?, ?, ?)";
                try(Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setInt(1, session.getSession_id());
                    ps.setString(2, session.getStudent_name());
                    ps.setString(3, session.getBranch_location());
                    ps.setString(4, session.getLesson_type());
                    ps.setString(5, session.getStatus());
                    return ps.executeUpdate() > 0;
                } catch (Exception e) { e.printStackTrace(); return false; }
    }
    
    public List<SessionBean> getAllSessions(String sql) throws SQLException, Exception {
        List<SessionBean> list = new ArrayList<>();
        String sql = ("SELECT*FROM training_session ORDER BY branchLocation ASC");
        
        try (Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, session_id);
            ps.setString(2, student_name);
            ps.setString(3, branch_location);
            ps.setString(4, lesson_type);
            ps.setString(5, status);
        }
    }
}
