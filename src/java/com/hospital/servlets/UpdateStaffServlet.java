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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        int staffId = Integer.parseInt(request.getParameter("staffId"));
        String name = request.getParameter("name");
        String position = request.getParameter("position");
        int departmentId = Integer.parseInt(request.getParameter("department_id"));
        String contact = request.getParameter("contact");
        
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBConnection.getConnection();
            String sql = "UPDATE STAFF SET name = ?, position = ?, department_id = ?, contact = ? WHERE staff_id = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, position);
            ps.setInt(3, departmentId);
            ps.setString(4, contact);
            ps.setInt(5, staffId);
            int result = ps.executeUpdate();
            if(result > 0){
                response.sendRedirect("staffManagement.jsp?msg=Staff+updated+successfully");
            } else {
                response.sendRedirect("staffManagement.jsp?error=Update+failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("staffManagement.jsp?error=" + e.getMessage());
        } finally {
            if(ps != null) try { ps.close(); } catch(Exception ex){}
            if(con != null) try { con.close(); } catch(Exception ex){}
        }
    }
}
