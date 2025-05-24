package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "DeleteDoctorServlet", urlPatterns = {"/DeleteDoctorServlet"})
public class DeleteDoctorServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String doctorId = request.getParameter("id");
        try {
            Connection con = DBConnection.getConnection();
            String sql = "DELETE FROM DOCTORS WHERE DOCTOR_ID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, doctorId);
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("doctorsManagement.jsp?msg=Doctor Deleted");
            } else {
                response.sendRedirect("doctorsManagement.jsp?error=Deletion Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("doctorsManagement.jsp?error=Exception Occurred");
        }
    }
}
