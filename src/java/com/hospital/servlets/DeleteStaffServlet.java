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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        int staffId = Integer.parseInt(request.getParameter("staffId"));
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBConnection.getConnection();
            String sql = "DELETE FROM STAFF WHERE staff_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, staffId);
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("staffManagement.jsp?msg=Staff+deleted+successfully");
            } else {
                response.sendRedirect("staffManagement.jsp?error=Deletion+failed");
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
