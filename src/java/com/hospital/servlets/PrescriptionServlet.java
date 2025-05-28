package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "PrescriptionServlet", urlPatterns = {"/PrescriptionServlet"})
public class PrescriptionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
         
        // Retrieve basic parameters
        String userId = request.getParameter("userId");
        String appointmentIdStr = request.getParameter("appointmentId");
        int appointmentId = Integer.parseInt(appointmentIdStr);
        String instructions = request.getParameter("instructions");
        String issueDate = request.getParameter("issueDate");
        
        // Since we used manual add buttons, the following fields already hold comma-separated IDs.
        String treatmentIdsStr = request.getParameter("treatmentIds");
        String medicineIdsStr = request.getParameter("medicineIds");
        
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBConnection.getConnection();
            String sql = "INSERT INTO PRESCRIPTION (USER_ID, APPOINTMENT_ID, TREATMENT_NAMES, MEDICINES, INSTRUCTIONS, ISSUE_DATE) VALUES (?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, userId);
            ps.setInt(2, appointmentId);
            ps.setString(3, treatmentIdsStr);
            ps.setString(4, medicineIdsStr);
            ps.setString(5, instructions);
            ps.setString(6, issueDate);
            
            int result = ps.executeUpdate();
            if(result > 0){
                response.sendRedirect("assignPrescription.jsp?msg=Prescription+Assigned");
            } else {
                response.sendRedirect("assignPrescription.jsp?error=Insertion+Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("assignPrescription.jsp?error=" + e.getMessage());
        } finally {
            if(ps != null) try { ps.close(); } catch(Exception ex){}
            if(con != null) try { con.close(); } catch(Exception ex){}
        }
    }
}
