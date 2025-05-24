package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "DeleteAppointmentServlet", urlPatterns = {"/DeleteAppointmentServlet"})
public class DeleteAppointmentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String appointmentId = request.getParameter("id");
        try {
            Connection con = DBConnection.getConnection();
            String sql = "DELETE FROM APPOINTMENTS WHERE APPOINTMENT_ID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(appointmentId));
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("adminAppointmentManagement.jsp?msg=Appointment Deleted");
            } else {
                response.sendRedirect("adminAppointmentManagement.jsp?error=Deletion Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminAppointmentManagement.jsp?error=Exception Occurred");
        }
    }
}
