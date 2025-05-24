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
        String apptDate = request.getParameter("apptDate");
        String apptTime = request.getParameter("apptTime");
        String doctorId = request.getParameter("doctorId");
        
        Connection con = null;
        PreparedStatement psCheck = null;
        PreparedStatement psInsert = null;
        ResultSet rs = null;
        try {
            con = DBConnection.getConnection();
            // Final slot check: count appointments for this doctor on this appointment date.
            String checkSql = "SELECT COUNT(*) AS cnt FROM APPOINTMENTS WHERE DOCTOR_ID = ? AND APPOINTMENT_DATE = ?";
            psCheck = con.prepareStatement(checkSql);
            psCheck.setString(1, doctorId);
            psCheck.setString(2, apptDate);
            rs = psCheck.executeQuery();
            int count = 0;
            if(rs.next()){
                count = rs.getInt("cnt");
            }
            rs.close();
            psCheck.close();

            if(count >= 10) {
                response.sendRedirect("userAppointment.jsp?error=Selected doctor has reached maximum appointments for the day.");
                return;
            }
            
            // Insert the appointment record.
            String insertSql = "INSERT INTO APPOINTMENTS (DOCTOR_ID, APPOINTMENT_DATE, APPOINTMENT_TIME) VALUES (?, ?, ?)";
            psInsert = con.prepareStatement(insertSql);
            psInsert.setString(1, doctorId);
            psInsert.setString(2, apptDate);
            psInsert.setString(3, apptTime);
            
            int result = psInsert.executeUpdate();
            if(result > 0) {
                response.sendRedirect("userAppointment.jsp?msg=Appointment Booked Successfully");
            } else {
                response.sendRedirect("userAppointment.jsp?error=Appointment booking failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("userAppointment.jsp?error=" + e.getMessage());
        } finally {
            if(psInsert != null) try { psInsert.close(); } catch(Exception ex){}
            if(con != null) try { con.close(); } catch(Exception ex){}
        }
    }
}
