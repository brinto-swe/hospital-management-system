package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "UserLoginServlet", urlPatterns = {"/UserLoginServlet"})
public class UserLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT PASSWORD, STATUS FROM USERS WHERE USER_ID = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, userId);
            rs = ps.executeQuery();
            if(rs.next()){
                String storedPwd = rs.getString("PASSWORD");
                String status = rs.getString("STATUS");
                if(!storedPwd.equals(password)) {
                    response.sendRedirect("userLogin.jsp?error=Invalid+credentials");
                } else if("pending".equalsIgnoreCase(status)) {
                    response.sendRedirect("userLogin.jsp?error=Your+account+is+pending+approval");
                } else if("approved".equalsIgnoreCase(status)) {
                    // Optionally, set session attribute and forward to appointment page
                    HttpSession session = request.getSession();
                    session.setAttribute("userId", userId);
                    response.sendRedirect("userAppointment.jsp?msg=Logged+in");
                } else {
                    response.sendRedirect("userLogin.jsp?error=Unknown+account+status");
                }
            } else {
                response.sendRedirect("userLogin.jsp?error=User+not+found.+Please+Sign+Up");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("userLogin.jsp?error=" + e.getMessage());
        } finally {
            if(rs != null) try { rs.close(); } catch(Exception ex){}
            if(ps != null) try { ps.close(); } catch(Exception ex){}
            if(con != null) try { con.close(); } catch(Exception ex){}
        }
    }
}
