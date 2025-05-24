package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "UpdateStaffServlet", urlPatterns = {"/UpdateStaffServlet"})
public class UpdateStaffServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String staffId = request.getParameter("staffId");
        String name = request.getParameter("name");
        String position = request.getParameter("position");
        String department = request.getParameter("department");
        String contact = request.getParameter("contact");

        try {
            Connection con = DBConnection.getConnection();
            String sql = "UPDATE STAFF SET NAME = ?, POSITION = ?, DEPARTMENT = ?, CONTACT = ? WHERE STAFF_ID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, position);
            ps.setString(3, department);
            ps.setString(4, contact);
            ps.setInt(5, Integer.parseInt(staffId));
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("staffManagement.jsp?msg=Staff Updated");
            } else {
                response.sendRedirect("updateStaff.jsp?error=Update Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("updateStaff.jsp?error=Exception Occurred");
        }
    }
}
