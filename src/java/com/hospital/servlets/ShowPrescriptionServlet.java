package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.*;
import java.util.Map;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "ShowPrescriptionServlet", urlPatterns = {"/ShowPrescriptionServlet"})
public class ShowPrescriptionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
         
        // Get the appointment ID from request
        String appointmentIdStr = request.getParameter("appointmentId");
        if (appointmentIdStr == null || appointmentIdStr.trim().isEmpty()) {
            request.setAttribute("error", "Appointment ID is required.");
            request.getRequestDispatcher("userPrescription.jsp").forward(request, response);
            return;
        }
        int appointmentId = Integer.parseInt(appointmentIdStr);
        
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            con = DBConnection.getConnection();
            // Get prescription details for the given appointment id.
            String sql = "SELECT * FROM PRESCRIPTION WHERE APPOINTMENT_ID = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, appointmentId);
            rs = ps.executeQuery();
            if (rs.next()) {
                // Retrieve fields from PRESCRIPTION record.
                int prescriptionId = rs.getInt("PRESCRIPTION_ID");
                String userId = rs.getString("USER_ID");
                String treatmentIds = rs.getString("TREATMENT_NAMES"); // comma-separated IDs
                String medicineIds = rs.getString("MEDICINES");         // comma-separated IDs
                String instructions = rs.getString("INSTRUCTIONS");
                String issueDate = rs.getString("ISSUE_DATE");
                
                request.setAttribute("prescriptionId", prescriptionId);
                request.setAttribute("userId", userId);
                request.setAttribute("treatmentIds", treatmentIds);
                request.setAttribute("medicineIds", medicineIds);
                request.setAttribute("instructions", instructions);
                request.setAttribute("issueDate", issueDate);
                
                // Lookup user name from USERS table
                String userName = "";
                PreparedStatement psUser = con.prepareStatement("SELECT NAME FROM USERS WHERE USER_ID = ?");
                psUser.setString(1, userId);
                ResultSet rsUser = psUser.executeQuery();
                if (rsUser.next()) {
                    userName = rsUser.getString("NAME");
                }
                rsUser.close();
                psUser.close();
                request.setAttribute("userName", userName);
                
                // Build a mapping for treatments (id -> name)
                Map<String, String> treatmentMap = new HashMap<String, String>();
                Statement st = con.createStatement();
                ResultSet rsTreat = st.executeQuery("SELECT TREATMENT_ID, TREATMENT_NAME FROM TREATMENT");
                while (rsTreat.next()) {
                    treatmentMap.put(rsTreat.getString("TREATMENT_ID").trim(), rsTreat.getString("TREATMENT_NAME"));
                }
                rsTreat.close();
                st.close();
                
                // Convert stored treatment IDs to their names.
                String treatmentNames = "";
                if (treatmentIds != null && !treatmentIds.trim().isEmpty()) {
                    String[] tidArray = treatmentIds.split(",");
                    StringBuilder sb = new StringBuilder();
                    for (String tid : tidArray) {
                        tid = tid.trim();
                        String tname = treatmentMap.get(tid);
                        if (tname != null) {
                            sb.append(tname).append(", ");
                        }
                    }
                    if (sb.length() > 2) {
                        treatmentNames = sb.substring(0, sb.length() - 2);
                    }
                }
                request.setAttribute("treatmentNames", treatmentNames);
                
                // Build a mapping for medicines (id -> name)
                Map<String, String> medicineMap = new HashMap<String, String>();
                Statement st2 = con.createStatement();
                ResultSet rsMed = st2.executeQuery("SELECT MEDICINE_ID, MEDICINE_NAME FROM MEDICINE");
                while (rsMed.next()) {
                    medicineMap.put(rsMed.getString("MEDICINE_ID").trim(), rsMed.getString("MEDICINE_NAME"));
                }
                rsMed.close();
                st2.close();
                
                // Convert stored medicine IDs to their names.
                String medicineNames = "";
                if (medicineIds != null && !medicineIds.trim().isEmpty()) {
                    String[] midArray = medicineIds.split(",");
                    StringBuilder sb2 = new StringBuilder();
                    for (String mid : midArray) {
                        mid = mid.trim();
                        String mname = medicineMap.get(mid);
                        if (mname != null) {
                            sb2.append(mname).append(", ");
                        }
                    }
                    if (sb2.length() > 2) {
                        medicineNames = sb2.substring(0, sb2.length() - 2);
                    }
                }
                request.setAttribute("medicineNames", medicineNames);
                
                // Forward the assembled prescription details to the report JSP.
                request.getRequestDispatcher("showPrescription.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "No prescription found for appointment ID: " + appointmentId);
                request.getRequestDispatcher("userPrescription.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("userPrescription.jsp").forward(request, response);
        } finally {
            if (rs != null)
                try { rs.close(); } catch(Exception ex) {}
            if (ps != null)
                try { ps.close(); } catch(Exception ex) {}
            if (con != null)
                try { con.close(); } catch(Exception ex) {}
        }
    }
}
