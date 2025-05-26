package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "TestNameServlet", urlPatterns = {"/TestNameServlet"})
public class TestNameServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        
        // Retrieve parameters from the form
        String testId = request.getParameter("testId");
        String testName = request.getParameter("testName");
        // Retrieve price as string, and convert it to BigDecimal (or you can use double)
        String priceStr = request.getParameter("price");
        BigDecimal price = new BigDecimal(priceStr);
        
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBConnection.getConnection();
            String sql = "INSERT INTO TEST_NAME (TEST_ID, TEST_NAME, PRICE) VALUES (?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, testId);
            ps.setString(2, testName);
            ps.setBigDecimal(3, price);
            
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("adminLabManagement.jsp?msg=Test+Added");
            } else {
                response.sendRedirect("adminLabManagement.jsp?error=Insertion+Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminLabManagement.jsp?error=" + e.getMessage());
        } finally {
            if(ps != null) { try { ps.close(); } catch(Exception ex) {} }
            if(con != null) { try { con.close(); } catch(Exception ex) {} }
        }
    }
}
