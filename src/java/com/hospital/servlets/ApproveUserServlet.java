package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "ApproveUserServlet", urlPatterns = {"/ApproveUserServlet"})
public class ApproveUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String userId = request.getParameter("userId");
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBConnection.getConnection();
            String sql = "UPDATE USERS SET STATUS = 'approved' WHERE USER_ID = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, userId);
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("userRequestManagement.jsp?msg=User+approved");
            } else {
                response.sendRedirect("userRequestManagement.jsp?error=Approval+failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("userRequestManagement.jsp?error=" + e.getMessage());
        } finally {
            if(ps != null) try { ps.close(); } catch(Exception ex){}
            if(con != null) try { con.close(); } catch(Exception ex){}
        }
    }
}
