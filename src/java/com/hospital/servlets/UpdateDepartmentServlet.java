package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "UpdateDepartmentServlet", urlPatterns = {"/UpdateDepartmentServlet"})
public class UpdateDepartmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String deptId = request.getParameter("deptId");
        String deptName = request.getParameter("deptName");
       
        try {
            Connection con = DBConnection.getConnection();
            String sql = "UPDATE DEPARTMENTS SET DEPT_NAME = ? WHERE DEPT_ID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, deptName);
            ps.setString(2, deptId);
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("departmentManagement.jsp?msg=Department Updated");
            } else {
                response.sendRedirect("updateDepartment.jsp?error=Update Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("updateDepartment.jsp?error=Exception Occurred");
        }
    }
}
