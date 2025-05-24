package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "DeleteDepartmentServlet", urlPatterns = {"/DeleteDepartmentServlet"})
public class DeleteDepartmentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String deptId = request.getParameter("id");
       
        try {
            Connection con = DBConnection.getConnection();
            String sql = "DELETE FROM DEPARTMENTS WHERE DEPT_ID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, deptId);
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("departmentManagement.jsp?msg=Department Deleted");
            } else {
                response.sendRedirect("departmentManagement.jsp?error=Deletion Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("departmentManagement.jsp?error=Exception Occurred");
        }
    }
}
