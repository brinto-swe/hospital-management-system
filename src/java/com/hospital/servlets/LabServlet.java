package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "LabServlet", urlPatterns = {"/LabServlet"})
public class LabServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String patientId = request.getParameter("patientId");
        String testType = request.getParameter("testType");
        String schedule = request.getParameter("schedule");
        
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO LAB_TESTS (PATIENT_ID, TEST_TYPE, SCHEDULE_DATE, STATUS) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, patientId);
            ps.setString(2, testType);
            ps.setString(3, schedule);
            ps.setString(4, "pending");
            
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("labManagement.jsp?msg=Lab Test Assigned");
            } else {
                response.sendRedirect("labManagement.jsp?error=Assignment Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("labManagement.jsp?error=Exception Occurred");
        }
    }
}
