package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "BookAppointmentServlet", urlPatterns = {"/BookAppointmentServlet"})
public class BookAppointmentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        
        // Retrieve appointment parameters from the form
        String apptDate = request.getParameter("apptDate");
        String apptTime = request.getParameter("apptTime");
        String doctorId = request.getParameter("doctorId");
        
        // Retrieve the user ID from the session (set at user login)
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("userLogin.jsp?error=Please+login+first");
            return;
        }
        String userId = (String) session.getAttribute("userId");
        
        Connection con = null;
        PreparedStatement psCheck = null;
        PreparedStatement psInsert = null;
        ResultSet rs = null;
        try {
            con = DBConnection.getConnection();
            
            // Check if the doctor already has reached maximum appointments (e.g., 10) for the day
            String checkSql = "SELECT COUNT(*) AS cnt FROM APPOINTMENTS WHERE DOCTOR_ID = ? AND APPOINTMENT_DATE = ?";
            psCheck = con.prepareStatement(checkSql);
            psCheck.setString(1, doctorId);
            psCheck.setString(2, apptDate);
            rs = psCheck.executeQuery();
            
            int count = 0;
            if (rs.next()) {
                count = rs.getInt("cnt");
            }
            rs.close();
            psCheck.close();
            
            if (count >= 10) {
                response.sendRedirect("userAppointment.jsp?error=Selected+doctor+has+reached+maximum+appointments+for+the+day");
                return;
            }
            
            // Insert based on the new requirement: include USER_ID
            String insertSql = "INSERT INTO APPOINTMENTS (USER_ID, DOCTOR_ID, APPOINTMENT_DATE, APPOINTMENT_TIME) VALUES (?, ?, ?, ?)";
            psInsert = con.prepareStatement(insertSql);
            psInsert.setString(1, userId);
            psInsert.setString(2, doctorId);
            psInsert.setString(3, apptDate);
            psInsert.setString(4, apptTime);
            
            int result = psInsert.executeUpdate();
            if (result > 0) {
                response.sendRedirect("userAppointment.jsp?msg=Appointment+Booked+Successfully");
            } else {
                response.sendRedirect("userAppointment.jsp?error=Appointment+booking+failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("userAppointment.jsp?error=" + e.getMessage());
        } finally {
            if (psInsert != null) try { psInsert.close(); } catch(Exception ex) {}
            if (con != null) try { con.close(); } catch(Exception ex) {}
        }
    }
}
