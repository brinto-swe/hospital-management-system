package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "UpdateTreatmentServlet", urlPatterns = {"/UpdateTreatmentServlet"})
public class UpdateTreatmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String treatmentId = request.getParameter("treatmentId");
        String nurse = request.getParameter("nurse");
        String notes = request.getParameter("notes");
        String fees = request.getParameter("fees");
        
        try {
            Connection con = DBConnection.getConnection();
            String sql = "UPDATE TREATMENTS SET NURSE = ?, NOTES = ?, FEES = ? WHERE TREATMENT_ID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nurse);
            ps.setString(2, notes);
            ps.setDouble(3, Double.parseDouble(fees));
            ps.setInt(4, Integer.parseInt(treatmentId));
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("treatmentManagement.jsp?msg=Treatment Updated");
            } else {
                response.sendRedirect("updateTreatment.jsp?error=Update Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("updateTreatment.jsp?error=Exception Occurred");
        }
    }
}
