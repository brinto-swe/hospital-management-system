package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "UpdateDoctorServlet", urlPatterns = {"/UpdateDoctorServlet"})
public class UpdateDoctorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String doctorId = request.getParameter("doctorId");
        String doctorName = request.getParameter("doctorName");
        String deptId = request.getParameter("deptId");
        String contact = request.getParameter("contact");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        String etc = request.getParameter("etc");
        
        try {
            Connection con = DBConnection.getConnection();
            String sql = "UPDATE DOCTORS SET DOCTOR_NAME = ?, DEPT_ID = ?, CONTACT = ?, START_TIME = ?, END_TIME = ?, ETC = ? WHERE DOCTOR_ID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, doctorName);
            ps.setString(2, deptId);
            ps.setString(3, contact);
            ps.setString(4, startTime);
            ps.setString(5, endTime);
            ps.setString(6, etc);
            ps.setString(7, doctorId);
            
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("doctorsManagement.jsp?msg=Doctor Updated");
            } else {
                response.sendRedirect("updateDoctor.jsp?id=" + doctorId + "&error=Update Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("updateDoctor.jsp?id=" + doctorId + "&error=Exception Occurred");
        }
    }
}
