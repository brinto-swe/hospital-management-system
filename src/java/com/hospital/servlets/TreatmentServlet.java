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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        
        // Retrieve parameters from the form
        String treatmentId = request.getParameter("treatmentId"); // Admin assigned ID
        String treatmentName = request.getParameter("treatmentName");
        String priceStr = request.getParameter("price");

        double price = Double.parseDouble(priceStr);
        
        Connection con = null;
        PreparedStatement ps = null;
        
        try {
            con = DBConnection.getConnection();
            String sql = "INSERT INTO TREATMENT (TREATMENT_ID, TREATMENT_NAME, PRICE) VALUES (?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, treatmentId);
            ps.setString(2, treatmentName);
            ps.setDouble(3, price);
            
            int result = ps.executeUpdate();
            if (result > 0) {
                response.sendRedirect("treatmentManagement.jsp?msg=Treatment+Added+Successfully");
            } else {
                response.sendRedirect("treatmentManagement.jsp?error=Insertion+Failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("treatmentManagement.jsp?error=" + e.getMessage());
        } finally {
            if (ps != null) try { ps.close(); } catch (Exception e) {}
            if (con != null) try { con.close(); } catch (Exception e) {}
        }
    }
}
