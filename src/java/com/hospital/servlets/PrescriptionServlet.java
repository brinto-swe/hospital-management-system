package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "PrescriptionServlet", urlPatterns = {"/PrescriptionServlet"})
public class PrescriptionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String patientName = request.getParameter("patientName");
        String treatmentName = request.getParameter("treatmentName");
        String price = request.getParameter("price");
        String note = request.getParameter("prescriptionNote");

        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO PRESCRIPTIONS (PATIENT_NAME, TREATMENT_NAME, PRICE, NOTE, ISSUED_DATE) VALUES (?, ?, ?, ?, CURRENT_DATE)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, patientName);
            ps.setString(2, treatmentName);
            ps.setDouble(3, Double.parseDouble(price));
            ps.setString(4, note);
            
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("prescriptionManagement.jsp?msg=Prescription Added");
            } else {
                response.sendRedirect("prescriptionManagement.jsp?error=Insertion Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("prescriptionManagement.jsp?error=Exception Occurred");
        }
    }
}
