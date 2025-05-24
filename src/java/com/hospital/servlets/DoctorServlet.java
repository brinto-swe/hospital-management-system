package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "DoctorServlet", urlPatterns = {"/DoctorServlet"})
public class DoctorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

        // Retrieve parameters from the form
        String doctorId = request.getParameter("doctorId");
        String doctorName = request.getParameter("doctorName");
        String deptId = request.getParameter("deptId");
        String contact = request.getParameter("contact");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        
        // Debug: log received parameters
        System.out.println("Adding Doctor - ID: " + doctorId 
                + ", Name: " + doctorName 
                + ", Dept: " + deptId 
                + ", Contact: " + contact 
                + ", Start: " + startTime 
                + ", End: " + endTime);
        
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBConnection.getConnection();
            String sql = "INSERT INTO DOCTORS (DOCTOR_ID, DOCTOR_NAME, DEPT_ID, CONTACT, START_TIME, END_TIME) VALUES (?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, doctorId);
            ps.setString(2, doctorName);
            ps.setString(3, deptId);
            ps.setString(4, contact);
            ps.setString(5, startTime);
            ps.setString(6, endTime);
            
            int result = ps.executeUpdate();
            if(result > 0) {
                System.out.println("Doctor " + doctorId + " added successfully.");
                response.sendRedirect("doctorsManagement.jsp?msg=Doctor Added");
            } else {
                System.out.println("Insertion failed, result: " + result);
                response.sendRedirect("doctorsManagement.jsp?error=Insertion Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("doctorsManagement.jsp?error=" + e.getMessage());
        } finally {
            if(ps != null) try { ps.close(); } catch(Exception ex){}
            if(con != null) try { con.close(); } catch(Exception ex){}
        }
    }
}
