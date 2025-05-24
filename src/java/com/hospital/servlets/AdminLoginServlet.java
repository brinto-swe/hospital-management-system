package com.hospital.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "AdminLoginServlet", urlPatterns = {"/AdminLoginServlet"})
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String adminId = request.getParameter("adminId");
        String password = request.getParameter("password");
        
        // Hard-coded credentials; in production, fetch from a secured source.
        if("admin".equals(adminId) && "admin123".equals(password)){
            HttpSession session = request.getSession();
            session.setAttribute("admin", adminId);
            response.sendRedirect("adminAppointmentManagement.jsp");
        } else {
            response.sendRedirect("adminLogin.jsp?error=Invalid+Admin+Credentials");
        }
    }
}
