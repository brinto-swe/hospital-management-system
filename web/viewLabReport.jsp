<%-- 
    Document   : viewLabReport
    Created on : May 26, 2025, 12:47:42 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>View Lab Report</title>
  <!-- Tailwind CSS & DaisyUI -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-gray-100">
  <div class="container mx-auto p-6">
    <h1 class="text-2xl font-bold mb-4">Lab Report Details</h1>
    <%
      String reportIdStr = request.getParameter("reportId");
      if(reportIdStr == null || reportIdStr.trim().isEmpty()){
          out.println("<p class='text-red-500'>No Report ID provided.</p>");
          return;
      }
      int reportId = Integer.parseInt(reportIdStr);
      
      Connection con = null;
      PreparedStatement ps = null;
      ResultSet rs = null;
      
      try {
          con = DBConnection.getConnection();
          String sql = "SELECT * FROM LAB_REPORTS WHERE REPORT_ID = ?";
          ps = con.prepareStatement(sql);
          ps.setInt(1, reportId);
          rs = ps.executeQuery();
          if(rs.next()){
    %>
    <div class="bg-white p-6 rounded-lg shadow-lg">
      <p><strong>Report ID:</strong> <%= rs.getInt("REPORT_ID") %></p>
      <p><strong>User ID:</strong> <%= rs.getString("USER_ID") %></p>
      <p><strong>Appointment ID:</strong> <%= rs.getInt("APPOINTMENT_ID") %></p>
      <p><strong>User Name:</strong> <%= rs.getString("NAME") %></p>
      <p><strong>Age:</strong> <%= rs.getInt("AGE") %></p>
      <p><strong>Test ID:</strong> <%= rs.getString("TEST_ID") %></p>
      <p><strong>Test Name:</strong> <%= rs.getString("TEST_NAME") %></p>
      <p><strong>Doctor Instruction:</strong> <%= rs.getString("DOCTOR_INSTRUCTION") %></p>
      <p><strong>Results:</strong> <%= (rs.getString("RESULTS") != null ? rs.getString("RESULTS") : "Not Entered") %></p>
      <p><strong>Schedule Date:</strong> <%= rs.getString("SCHEDULE_DATE") %></p>
      <p><strong>Status:</strong> <%= rs.getString("STATUS") %></p>
      <p><strong>Doctor Name:</strong> <%= rs.getString("DOCTOR_NAME") %></p>
    </div>
    <%
          } else {
              out.println("<p class='text-red-500'>No report found for the given Report ID.</p>");
          }
      } catch(Exception e) {
          out.println("<p class='text-red-500'>Error: " + e.getMessage() + "</p>");
      } finally {
          if(rs != null) try { rs.close(); } catch(Exception ex){}
          if(ps != null) try { ps.close(); } catch(Exception ex){}
          if(con != null) try { con.close(); } catch(Exception ex){}
      }
    %>
    <div class="mt-4">
      <a href="doctorLabReports.jsp" class="btn btn-secondary">Back to Reports</a>
    </div>
  </div>
</body>
</html>
