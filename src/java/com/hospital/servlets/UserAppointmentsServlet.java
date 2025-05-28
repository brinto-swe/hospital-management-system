package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "UserAppointmentsServlet", urlPatterns = {"/UserAppointmentsServlet"})
public class UserAppointmentsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

        // Check if user is logged in and retrieve userId from session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("userLogin.jsp?error=Please+login+first");
            return;
        }
        String userId = (String) session.getAttribute("userId");
        
        ArrayList<Appointment> appointmentList = new ArrayList<Appointment>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT APPOINTMENT_ID, APPOINTMENT_DATE, APPOINTMENT_TIME, DOCTOR_ID, STATUS FROM APPOINTMENTS WHERE USER_ID = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, userId);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                int appointmentId = rs.getInt("APPOINTMENT_ID");
                String appointmentDate = rs.getString("APPOINTMENT_DATE");
                String appointmentTime = rs.getString("APPOINTMENT_TIME");
                String doctorId = rs.getString("DOCTOR_ID");
                String status = rs.getString("STATUS");
                Appointment app = new Appointment(appointmentId, appointmentDate, appointmentTime, doctorId, status);
                appointmentList.add(app);
            }
            request.setAttribute("appointmentList", appointmentList);
            request.getRequestDispatcher("userAppointments.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("userAppointments.jsp").forward(request, response);
        } finally {
            if (rs != null) try { rs.close(); } catch(Exception ex) {}
            if (ps != null) try { ps.close(); } catch(Exception ex) {}
            if (con != null) try { con.close(); } catch(Exception ex) {}
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
         doGet(request, response);
    }
}
