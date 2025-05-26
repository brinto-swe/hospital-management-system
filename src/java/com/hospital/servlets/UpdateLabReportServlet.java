package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "UpdateLabReportServlet", urlPatterns = {"/UpdateLabReportServlet"})
public class UpdateLabReportServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String reportIdStr = request.getParameter("reportId");
        int reportId = Integer.parseInt(reportIdStr);
        String results = request.getParameter("results");
        
        Connection con = null;
        PreparedStatement ps = null;
        
        try {
            con = DBConnection.getConnection();
            String sql = "UPDATE LAB_REPORTS SET RESULTS = ?, STATUS = 'completed' WHERE REPORT_ID = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, results);
            ps.setInt(2, reportId);
            
            int result = ps.executeUpdate();
            if(result > 0){
                response.sendRedirect("adminLabReports.jsp?msg=Report+Updated+Successfully");
            } else {
                response.sendRedirect("adminLabReports.jsp?error=Update+Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminLabReports.jsp?error=" + e.getMessage());
        } finally {
            if(ps != null) try { ps.close(); } catch(Exception ex){}
            if(con != null) try { con.close(); } catch(Exception ex){}
        }
    }
}
