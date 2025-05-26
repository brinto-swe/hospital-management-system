package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "ViewLabReportServlet", urlPatterns = {"/ViewLabReportServlet"})
public class ViewLabReportServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        
        String reportIdStr = request.getParameter("reportId");
        if (reportIdStr == null || reportIdStr.trim().isEmpty()) {
            request.setAttribute("error", "No Report ID provided.");
            request.getRequestDispatcher("doctorLabReports.jsp").forward(request, response);
            return;
        }
        
        int reportId = Integer.parseInt(reportIdStr);
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM LAB_REPORTS WHERE REPORT_ID = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, reportId);
            rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("reportId", reportId);
                request.setAttribute("userId", rs.getString("USER_ID"));
                request.setAttribute("appointmentId", rs.getInt("APPOINTMENT_ID"));
                request.setAttribute("userName", rs.getString("NAME"));
                request.setAttribute("age", rs.getInt("AGE"));
                request.setAttribute("testId", rs.getString("TEST_ID"));
                request.setAttribute("testName", rs.getString("TEST_NAME"));
                request.setAttribute("doctorInstruction", rs.getString("DOCTOR_INSTRUCTION"));
                request.setAttribute("results", rs.getString("RESULTS"));
                request.setAttribute("scheduleDate", rs.getString("SCHEDULE_DATE"));
                request.setAttribute("status", rs.getString("STATUS"));
                request.setAttribute("doctorName", rs.getString("DOCTOR_NAME"));
                
                request.getRequestDispatcher("viewLabReport.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Report not found.");
                request.getRequestDispatcher("doctorLabReports.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Error retrieving lab report: " + e.getMessage());
            request.getRequestDispatcher("doctorLabReports.jsp").forward(request, response);
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }
}
