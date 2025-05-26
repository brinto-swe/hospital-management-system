package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "AssignLabTestServlet", urlPatterns = {"/AssignLabTestServlet"})
public class AssignLabTestServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        
        // Retrieve fields from the form
        String userId = request.getParameter("userId");
        String appointmentIdStr = request.getParameter("appointmentId");
        int appointmentId = Integer.parseInt(appointmentIdStr);
        String ageStr = request.getParameter("age");
        int age = Integer.parseInt(ageStr);
        String testId = request.getParameter("testId");
        String doctorInstruction = request.getParameter("doctorInstruction");
        String scheduleDate = request.getParameter("scheduleDate");
        String doctorName = request.getParameter("doctorName");
        
        // Look up the user's name from USERS table
        String userName = "";
        // Look up the test name from TEST_NAME table
        String testName = "";
        
        Connection con = null;
        PreparedStatement psUser = null, psTest = null, psInsert = null;
        ResultSet rsUser = null, rsTest = null;
        
        try {
            con = DBConnection.getConnection();
            
            // Get user name
            String sqlUser = "SELECT NAME FROM USERS WHERE USER_ID = ?";
            psUser = con.prepareStatement(sqlUser);
            psUser.setString(1, userId);
            rsUser = psUser.executeQuery();
            if(rsUser.next()){
                userName = rsUser.getString("NAME");
            }
            
            // Get test name
            String sqlTest = "SELECT TEST_NAME FROM TEST_NAME WHERE TEST_ID = ?";
            psTest = con.prepareStatement(sqlTest);
            psTest.setString(1, testId);
            rsTest = psTest.executeQuery();
            if(rsTest.next()){
                testName = rsTest.getString("TEST_NAME");
            }
            
            // Insert record into LAB_REPORTS table; status is set as "pending"
            String sqlInsert = "INSERT INTO LAB_REPORTS (USER_ID, APPOINTMENT_ID, NAME, AGE, TEST_ID, TEST_NAME, DOCTOR_INSTRUCTION, SCHEDULE_DATE, STATUS, DOCTOR_NAME) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'pending', ?)";
            psInsert = con.prepareStatement(sqlInsert);
            psInsert.setString(1, userId);
            psInsert.setInt(2, appointmentId);
            psInsert.setString(3, userName);
            psInsert.setInt(4, age);
            psInsert.setString(5, testId);
            psInsert.setString(6, testName);
            psInsert.setString(7, doctorInstruction);
            psInsert.setString(8, scheduleDate);
            psInsert.setString(9, doctorName);
            
            int result = psInsert.executeUpdate();
            if(result > 0){
                response.sendRedirect("doctorAppointment.jsp?msg=Lab+Test+Assigned");
            } else {
                response.sendRedirect("assignLabTest.jsp?error=Assignment+Failed");
            }
            
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("assignLabTest.jsp?error=" + e.getMessage());
        } finally {
            try { if(rsUser != null) rsUser.close(); } catch(Exception ex){}
            try { if(psUser != null) psUser.close(); } catch(Exception ex){}
            try { if(rsTest != null) rsTest.close(); } catch(Exception ex){}
            try { if(psTest != null) psTest.close(); } catch(Exception ex){}
            try { if(psInsert != null) psInsert.close(); } catch(Exception ex){}
            try { if(con != null) con.close(); } catch(Exception ex){}
        }
    }
}
