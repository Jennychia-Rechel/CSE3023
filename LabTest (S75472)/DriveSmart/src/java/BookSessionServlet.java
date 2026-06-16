/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.lab.DAO.SessionDAO;
import com.lab.bean.UserBean.SessionBean;

/**
 *
 * @author MP2-4
 */
@WebServlet(urlPatterns = {"/BookSessionServlet"})

public class BookSessionServlet extends HttpServlet {
    private SessionDAO sessionDAO = new SessionDAO();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        String action = request.getParameter("action");
        
        if ("register".equals(action)) {
 
            SessionBean newStudent = new SessionBean();
            newStudent.setStudent_name(request.getParameter("student_name"));
            newStudent.setBranch_location(request.getParameter("branch_location"));
            newStudent.setLesson_type(request.getParameter("lesson_type"));

            InputStream inputStream = null;
            Part filePart = request.getPart("profileImage");
            if (filePart != null && filePart.getSize() > 0) {
                inputStream = filePart.getInputStream();
            }

            try {
                boolean isSuccess = sessionDAO.registerStudent(newStudent, inputStream);
                if (isSuccess) {
                    response.getWriter().println("Registration Successful!");
                    response.getWriter().println("<a href='login.html'>Login here</a>");
                } else {
                
                    response.getWriter().println("Registration Failed! Database rejected the data.");
                }
            } catch (Exception ex) {
            
                response.getWriter().println("<h2>System Error Detected!</h2>");
                response.getWriter().println("<pre>");
                ex.printStackTrace(response.getWriter());
                response.getWriter().println("</pre>");
            }

        } else if ("login".equals(action)) {
    
            String matric = request.getParameter("matricNo");
            String pass = request.getParameter("password");

            SessionBean student = SessionDAO.loginSession(session_id, student_name);

            if (student != null) {

                HttpSession session = request.getSession();
                session.setAttribute("loggedUser", student);
                response.sendRedirect("dashboard.jsp");
            } else {
                response.getWriter().println("Invalid Credentials!");
                response.getWriter().println("<a href='login.html'>Try Again</a>");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);

        if ("logout".equals(action)) {
          
            if (session != null) {
                session.invalidate(); 
            }
            response.sendRedirect("login.html");

        } else if ("delete".equals(action)) {

            if (session != null && session.getAttribute("loggedUser") != null) {
                SessionBean user = (SessionBean) session.getAttribute("loggedUser");
                SessionDAO.deleteStudent(user.getSession_id());
                session.invalidate(); 
            }
            response.sendRedirect("register.html");
        }
    }
}
