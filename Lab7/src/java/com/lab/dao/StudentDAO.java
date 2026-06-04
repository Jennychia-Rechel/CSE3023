/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lab.dao;

import com.lab.bean.StudentBean;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Base64;

public class StudentDAO {
    
    // Fungsi untuk buat sambungan ke MySQL database
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        // SINI: Pastikan guna "root" dan password kosong ""
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/lab7_db", "root", "");
    }
    
    // --- REGISTER LOGIC ---
    public boolean registerStudent(StudentBean student, InputStream imageStream) {
        String sql = "INSERT INTO students (matric_no, password, fullname, profile_image) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, student.getMatricNo());
            pstmt.setString(2, student.getPassword());
            pstmt.setString(3, student.getFullname());
            
            // Logik letak gambar BLOB
            if (imageStream != null) {
                pstmt.setBlob(4, imageStream);
            } else {
                pstmt.setNull(4, java.sql.Types.BLOB);
            }
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (Exception e) {
            // SINI PENTING: Menghantar ralat ke Tomcat Output Window untuk kita debug
            System.out.println(">>> ERROR DI STUDENTDAO (REGISTER): " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    // --- LOGIN LOGIC ---
    public StudentBean loginStudent(String matricNo, String password) {
        StudentBean student = null;
        String sql = "SELECT * FROM students WHERE matric_no = ? AND password = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, matricNo);
            pstmt.setString(2, password);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    student = new StudentBean();
                    student.setMatricNo(rs.getString("matric_no"));
                    student.setFullname(rs.getString("fullname"));
                    student.setPassword(rs.getString("password"));
                    
                    // Ambil BLOB gambar dan tukar ke Base64 String
                    Blob blob = rs.getBlob("profile_image");
                    if (blob != null) {
                        try (InputStream inputStream = blob.getBinaryStream();
                             ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
                            
                            byte[] buffer = new byte[4096];
                            int bytesRead;
                            while ((bytesRead = inputStream.read(buffer)) != -1) {
                                outputStream.write(buffer, 0, bytesRead);
                            }
                            byte[] imageBytes = outputStream.toByteArray();
                            student.setBase64Image(Base64.getEncoder().encodeToString(imageBytes));
                        }
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(">>> ERROR DI STUDENTDAO (LOGIN): " + e.getMessage());
            e.printStackTrace();
        }
        return student;
    }
    
    // --- DELETE LOGIC ---
    public boolean deleteStudent(String matricNo) {
        String sql = "DELETE FROM students WHERE matric_no = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, matricNo);
            return pstmt.executeUpdate() > 0;
            
        } catch (Exception e) {
            System.out.println(">>> ERROR DI STUDENTDAO (DELETE): " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}