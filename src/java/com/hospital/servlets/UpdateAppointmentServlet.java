package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "UpdateAppointmentServlet", urlPatterns = {"/UpdateAppointmentServlet"})
public class UpdateAppointmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String appointmentId = request.getParameter("appointmentId");
        String patientId = request.getParameter("patientId");
        String doctor = request.getParameter("doctor");
        String appointmentDate = request.getParameter("appointmentDate");
        String appointmentTime = request.getParameter("appointmentTime");

        try {
            Connection con = DBConnection.getConnection();
            String sql = "UPDATE APPOINTMENTS SET PATIENT_ID = ?, DOCTOR = ?, APPOINTMENT_DATE = ?, APPOINTMENT_TIME = ? WHERE APPOINTMENT_ID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, patientId);
            ps.setString(2, doctor);
            ps.setString(3, appointmentDate);
            ps.setString(4, appointmentTime);
            ps.setInt(5, Integer.parseInt(appointmentId));
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("adminAppointmentManagement.jsp?msg=Appointment Updated");
            } else {
                response.sendRedirect("updateAppointment.jsp?error=Update Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("updateAppointment.jsp?error=Exception Occurred");
        }
    }
}
