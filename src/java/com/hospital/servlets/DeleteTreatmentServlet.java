package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "DeleteTreatmentServlet", urlPatterns = {"/DeleteTreatmentServlet"})
public class DeleteTreatmentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String treatmentId = request.getParameter("id");
        try {
            Connection con = DBConnection.getConnection();
            String sql = "DELETE FROM TREATMENTS WHERE TREATMENT_ID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(treatmentId));
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("treatmentManagement.jsp?msg=Treatment Deleted");
            } else {
                response.sendRedirect("treatmentManagement.jsp?error=Deletion Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("treatmentManagement.jsp?error=Exception Occurred");
        }
    }
}
