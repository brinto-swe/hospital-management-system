package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "MedicineServlet", urlPatterns = {"/MedicineServlet"})
public class MedicineServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        
        // Retrieve parameters from the form
        String medicineId = request.getParameter("medicineId"); // Admin assigned ID
        String medicineName = request.getParameter("medicineName");
        String batch = request.getParameter("batch");
        String expiryDate = request.getParameter("expiryDate");
        String quantityStr = request.getParameter("quantity");
        String priceStr = request.getParameter("price");

        int quantity = Integer.parseInt(quantityStr);
        double price = Double.parseDouble(priceStr);
        
        Connection con = null;
        PreparedStatement ps = null;
        
        try {
            con = DBConnection.getConnection();
            String sql = "INSERT INTO MEDICINE (MEDICINE_ID, MEDICINE_NAME, BATCH, EXPIRY_DATE, QUANTITY, PRICE) VALUES (?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, medicineId);
            ps.setString(2, medicineName);
            ps.setString(3, batch);
            ps.setString(4, expiryDate);
            ps.setInt(5, quantity);
            ps.setDouble(6, price);
            
            int result = ps.executeUpdate();
            if (result > 0) {
                response.sendRedirect("medicineManagement.jsp?msg=Medicine+Added+Successfully");
            } else {
                response.sendRedirect("medicineManagement.jsp?error=Insertion+Failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("medicineManagement.jsp?error=" + e.getMessage());
        } finally {
            if (ps != null) try { ps.close(); } catch (Exception e) {}
            if (con != null) try { con.close(); } catch (Exception e) {}
        }
    }
}
