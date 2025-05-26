<%-- 
    Document   : viewReport
    Created on : May 23, 2025, 5:25:18 PM
    Author     : mozad
--%>

<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String reportId = request.getParameter("reportId");
    String patientId = "", testType = "", resultText = "";
    String reportDate = "";
    try {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT PATIENT_ID, TEST_TYPE, RESULT, REPORT_DATE FROM LAB_REPORTS WHERE REPORT_ID = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(reportId));
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            patientId = rs.getString("PATIENT_ID");
            testType = rs.getString("TEST_TYPE");
            resultText = rs.getString("RESULT");
            reportDate = rs.getString("REPORT_DATE");
        }
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Lab Report</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <h2>Lab Report Details</h2>
    <p><strong>Report ID:</strong> <%= reportId %></p>
    <p><strong>Patient ID:</strong> <%= patientId %></p>
    <p><strong>Test Type:</strong> <%= testType %></p>
    <p><strong>Result:</strong> <%= resultText %></p>
    <p><strong>Date:</strong> <%= reportDate %></p>
    <a href="labManagement.jsp" class="btn">Back to Lab Management</a>
</body>
</html>

