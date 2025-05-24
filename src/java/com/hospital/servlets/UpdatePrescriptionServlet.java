package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "UpdatePrescriptionServlet", urlPatterns = {"/UpdatePrescriptionServlet"})
public class UpdatePrescriptionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        String prescriptionId = request.getParameter("prescriptionId");
        String patientName = request.getParameter("patientName");
        String treatmentName = request.getParameter("treatmentName");
        String price = request.getParameter("price");
        String note = request.getParameter("note");

        try {
            Connection con = DBConnection.getConnection();
            String sql = "UPDATE PRESCRIPTIONS SET PATIENT_NAME = ?, TREATMENT_NAME = ?, PRICE = ?, NOTE = ? WHERE PRESCRIPTION_ID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, patientName);
            ps.setString(2, treatmentName);
            ps.setDouble(3, Double.parseDouble(price));
            ps.setString(4, note);
            ps.setInt(5, Integer.parseInt(prescriptionId));
            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("prescriptionManagement.jsp?msg=Prescription Updated");
            } else {
                response.sendRedirect("updatePrescription.jsp?error=Update Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("updatePrescription.jsp?error=Exception Occurred");
        }
    }
}
