package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "WardServlet", urlPatterns = {"/WardServlet"})
public class WardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String patientId = request.getParameter("patientId");
        String wardNumber = request.getParameter("wardNumber");
        String admissionDate = request.getParameter("admissionDate");
        
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO WARDS (PATIENT_ID, WARD_NUMBER, ADMISSION_DATE) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, patientId);
            ps.setString(2, wardNumber);
            ps.setString(3, admissionDate);
            
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("wardManagement.jsp?msg=Ward Assigned");
            } else {
                response.sendRedirect("wardManagement.jsp?error=Assignment Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("wardManagement.jsp?error=Exception Occurred");
        }
    }
}
