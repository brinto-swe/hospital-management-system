package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "DoctorLabReportsServlet", urlPatterns = {"/DoctorLabReportsServlet"})
public class DoctorLabReportsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

        String appointmentIdFilter = request.getParameter("appointmentId");
        String filterDate = request.getParameter("filterDate");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        ArrayList<String[]> reportList = new ArrayList<String[]>();


        try {
            con = DBConnection.getConnection();
            String sql = "SELECT REPORT_ID, APPOINTMENT_ID, NAME, AGE, SCHEDULE_DATE, STATUS FROM LAB_REPORTS WHERE 1=1";
            if (appointmentIdFilter != null && !appointmentIdFilter.trim().isEmpty()) {
                sql += " AND APPOINTMENT_ID = ?";
            }
            if (filterDate != null && !filterDate.trim().isEmpty()) {
                sql += " AND SCHEDULE_DATE = ?";
            }
            ps = con.prepareStatement(sql);

            int paramIndex = 1;
            if (appointmentIdFilter != null && !appointmentIdFilter.trim().isEmpty()) {
                ps.setInt(paramIndex++, Integer.parseInt(appointmentIdFilter));
            }
            if (filterDate != null && !filterDate.trim().isEmpty()) {
                ps.setString(paramIndex++, filterDate);
            }

            rs = ps.executeQuery();
            while (rs.next()) {
                reportList.add(new String[]{
                    String.valueOf(rs.getInt("REPORT_ID")),
                    String.valueOf(rs.getInt("APPOINTMENT_ID")),
                    rs.getString("NAME"),
                    String.valueOf(rs.getInt("AGE")),
                    rs.getString("SCHEDULE_DATE"),
                    rs.getString("STATUS")
                });
            }

            request.setAttribute("reportList", reportList);
            request.getRequestDispatcher("doctorLabReports.jsp").forward(request, response);

        } catch (Exception ex) {
            request.setAttribute("error", "Error retrieving reports: " + ex.getMessage());
            request.getRequestDispatcher("doctorLabReports.jsp").forward(request, response);
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }
}
