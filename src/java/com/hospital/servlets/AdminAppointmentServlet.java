package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "AdminAppointmentServlet", urlPatterns = {"/AdminAppointmentServlet"})
public class AdminAppointmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String patientId = request.getParameter("patientId");
        String doctor = request.getParameter("doctor");
        String date = request.getParameter("appointmentDate");
        String time = request.getParameter("appointmentTime");
        
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO APPOINTMENTS (PATIENT_ID, DOCTOR, APPOINTMENT_DATE, APPOINTMENT_TIME, STATUS) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, patientId);
            ps.setString(2, doctor);
            ps.setString(3, date);
            ps.setString(4, time);
            ps.setString(5, "approved"); // auto-approve for admin registered appointments
            
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("adminAppointmentManagement.jsp?msg=Appointment Registered");
            } else {
                response.sendRedirect("adminAppointmentManagement.jsp?error=Registration Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminAppointmentManagement.jsp?error=Exception Occurred");
        }
    }
}
