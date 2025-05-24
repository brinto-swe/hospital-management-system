package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "PharmacyServlet", urlPatterns = {"/PharmacyServlet"})
public class PharmacyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String medicineName = request.getParameter("medicineName");
        String batch = request.getParameter("batch");
        String expiryDate = request.getParameter("expiryDate");
        String quantity = request.getParameter("quantity");
        String price = request.getParameter("price");
        
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO MEDICINES (MEDICINE_NAME, BATCH, EXPIRY_DATE, QUANTITY, PRICE) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, medicineName);
            ps.setString(2, batch);
            ps.setString(3, expiryDate);
            ps.setInt(4, Integer.parseInt(quantity));
            ps.setDouble(5, Double.parseDouble(price));
            
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("pharmacyManagement.jsp?msg=Medicine Added");
            } else {
                response.sendRedirect("pharmacyManagement.jsp?error=Insertion Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("pharmacyManagement.jsp?error=Exception Occurred");
        }
    }
}
