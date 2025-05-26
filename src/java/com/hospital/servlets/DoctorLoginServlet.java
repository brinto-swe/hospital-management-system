package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "DoctorLoginServlet", urlPatterns = {"/DoctorLoginServlet"})
public class DoctorLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String doctorId = request.getParameter("doctorId");
        String doctorPassword = request.getParameter("doctorPassword");
        
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT PASSWORD FROM DOCTORS WHERE DOCTOR_ID = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, doctorId);
            rs = ps.executeQuery();
            if(rs.next()){
                String storedPassword = rs.getString("PASSWORD");
                if(storedPassword.equals(doctorPassword)) {
                    // Login successful: set session attribute and redirect to doctor appointment page.
                    HttpSession session = request.getSession();
                    session.setAttribute("doctorId", doctorId);
                    response.sendRedirect("doctorAppointment.jsp");
                } else {
                    response.sendRedirect("doctorLogin.jsp?error=Invalid+credentials");
                }
            } else {
                response.sendRedirect("doctorLogin.jsp?error=Doctor+ID+not+found");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("doctorLogin.jsp?error=" + e.getMessage());
        } finally {
            if(rs != null) try { rs.close(); } catch(Exception ex){}
            if(ps != null) try { ps.close(); } catch(Exception ex){}
            if(con != null) try { con.close(); } catch(Exception ex){}
        }
    }
}
