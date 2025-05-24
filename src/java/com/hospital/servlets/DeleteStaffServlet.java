package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "DeleteStaffServlet", urlPatterns = {"/DeleteStaffServlet"})
public class DeleteStaffServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String staffId = request.getParameter("id");
        try {
            Connection con = DBConnection.getConnection();
            String sql = "DELETE FROM STAFF WHERE STAFF_ID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(staffId));
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("staffManagement.jsp?msg=Staff Deleted");
            } else {
                response.sendRedirect("staffManagement.jsp?error=Deletion Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("staffManagement.jsp?error=Exception Occurred");
        }
    }
}
