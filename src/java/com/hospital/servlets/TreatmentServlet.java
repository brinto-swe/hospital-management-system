package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "TreatmentServlet", urlPatterns = {"/TreatmentServlet"})
public class TreatmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String patientId = request.getParameter("patientId");
        String nurse = request.getParameter("nurse");
        String notes = request.getParameter("notes");
        String fees = request.getParameter("fees");
        
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO TREATMENTS (PATIENT_ID, NURSE, NOTES, FEES) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, patientId);
            ps.setString(2, nurse);
            ps.setString(3, notes);
            ps.setDouble(4, Double.parseDouble(fees));
            
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("treatmentManagement.jsp?msg=Treatment Assigned");
            } else {
                response.sendRedirect("treatmentManagement.jsp?error=Assignment Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("treatmentManagement.jsp?error=Exception Occurred");
        }
    }
}
