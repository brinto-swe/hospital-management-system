package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "DeleteMedicineServlet", urlPatterns = {"/DeleteMedicineServlet"})
public class DeleteMedicineServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String medicineId = request.getParameter("id");
        try {
            Connection con = DBConnection.getConnection();
            String sql = "DELETE FROM MEDICINES WHERE MEDICINE_ID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(medicineId));
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("pharmacyManagement.jsp?msg=Medicine Deleted");
            } else {
                response.sendRedirect("pharmacyManagement.jsp?error=Deletion Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("pharmacyManagement.jsp?error=Exception Occurred");
        }
    }
}
