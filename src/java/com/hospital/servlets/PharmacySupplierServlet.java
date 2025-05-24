package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "PharmacySupplierServlet", urlPatterns = {"/PharmacySupplierServlet"})
public class PharmacySupplierServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String supplierName = request.getParameter("supplierName");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO SUPPLIERS (SUPPLIER_NAME, CONTACT, EMAIL) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, supplierName);
            ps.setString(2, contact);
            ps.setString(3, email);
            
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("pharmacySupplier.jsp?msg=Supplier Added");
            } else {
                response.sendRedirect("pharmacySupplier.jsp?error=Insertion Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("pharmacySupplier.jsp?error=Exception Occurred");
        }
    }
}
