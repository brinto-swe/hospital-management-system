package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "DepartmentServlet", urlPatterns = {"/DepartmentServlet"})
public class DepartmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve department ID and name from the form
        String deptId = request.getParameter("deptId");
        String deptName = request.getParameter("deptName");
       
        try {
            Connection con = DBConnection.getConnection();
            // Since we want to supply the department id, it is provided in the INSERT, not auto-generated.
            String sql = "INSERT INTO DEPARTMENTS (DEPT_ID, DEPT_NAME) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, deptId);
            ps.setString(2, deptName);
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("departmentManagement.jsp?msg=Department Added");
            } else {
                response.sendRedirect("departmentManagement.jsp?error=Insertion Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("departmentManagement.jsp?error=Exception Occurred");
        }
    }
}
