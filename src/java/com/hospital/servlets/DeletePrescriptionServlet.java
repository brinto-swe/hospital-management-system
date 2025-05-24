package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "DeletePrescriptionServlet", urlPatterns = {"/DeletePrescriptionServlet"})
public class DeletePrescriptionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String prescriptionId = request.getParameter("id");
        try {
            Connection con = DBConnection.getConnection();
            String sql = "DELETE FROM PRESCRIPTIONS WHERE PRESCRIPTION_ID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(prescriptionId));
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("prescriptionManagement.jsp?msg=Prescription Deleted");
            } else {
                response.sendRedirect("prescriptionManagement.jsp?error=Deletion Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("prescriptionManagement.jsp?error=Exception Occurred");
        }
    }
}
