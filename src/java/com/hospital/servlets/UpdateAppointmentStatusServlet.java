package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "UpdateAppointmentStatusServlet", urlPatterns = {"/UpdateAppointmentStatusServlet"})
public class UpdateAppointmentStatusServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBConnection.getConnection();
            String sql = "UPDATE APPOINTMENTS SET STATUS = 'done' WHERE APPOINTMENT_ID = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, appointmentId);
            int result = ps.executeUpdate();
            if(result > 0){
                response.sendRedirect("doctorAppointment.jsp?msg=Appointment+updated");
            } else {
                response.sendRedirect("doctorAppointment.jsp?error=Update+failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("doctorAppointment.jsp?error=" + e.getMessage());
        } finally {
            if(ps != null) try { ps.close(); } catch(Exception ex){}
            if(con != null) try { con.close(); } catch(Exception ex){}
        }
    }
}
