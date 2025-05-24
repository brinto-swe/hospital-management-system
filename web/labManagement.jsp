<%-- 
    Document   : labManagement
    Created on : May 22, 2025, 5:05:47 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Lab Management - Admin Panel</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <style>
    .sidebar { width: 200px; float: left; background: #333; min-height: 100vh; padding: 20px; }
    .sidebar a { display: block; color: #fff; padding: 10px; text-decoration: none; }
    .sidebar a:hover { background: #575757; }
    .content { margin-left: 220px; padding: 20px; }
  </style>
</head>
<body>
  <header>
    <div class="logo">
      <img src="images/logo.png" alt="MediLab Hospital" style="height:40px;">
    </div>
    <h1 style="display:inline; color:white; padding-left:20px;">Admin Panel - Lab Management</h1>
  </header>
  <div class="sidebar">
    <a href="adminDashboard.jsp">Dashboard</a>
    <a href="staffManagement.jsp">Staff Management</a>
    <a href="labManagement.jsp">Lab Management</a>
    <a href="wardManagement.jsp">Ward Management</a>
    <a href="treatmentManagement.jsp">Treatment Management</a>
    <a href="pharmacyManagement.jsp">Pharmacy Management</a>
    <a href="patientManagement.jsp">Patient Management</a>
    <a href="pharmacyInvoice.jsp">Pharmacy Invoice</a>
    <a href="pharmacySupplier.jsp">Pharmacy Supplier</a>
    <a href="prescriptionManagement.jsp">Prescription Management</a>
    <a href="adminAppointmentManagement.jsp">Appointment Management</a>
    <a href="departmentManagement.jsp">Department Management</a>
  </div>
  <div class="content">
    <h2>Lab Management</h2>
    <h3>Assign Lab Test</h3>
    <form action="LabServlet" method="post">
      <div>
        <label for="patientId">Patient ID:</label>
        <input type="text" id="patientId" name="patientId" required>
      </div>
      <div>
        <label for="testType">Test Type:</label>
        <input type="text" id="testType" name="testType" required>
      </div>
      <div>
        <label for="schedule">Schedule Date:</label>
        <input type="date" id="schedule" name="schedule" required>
      </div>
      <div>
        <button type="submit">Assign Lab Test</button>
      </div>
    </form>
    <h3>View Lab Reports</h3>
    <table>
      <thead>
        <tr>
          <th>Report ID</th>
          <th>Patient ID</th>
          <th>Test Type</th>
          <th>Date</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>101</td>
          <td>1001</td>
          <td>Blood Test</td>
          <td>2025-05-20</td>
          <td>Completed</td>
          <td><a href="viewReport.jsp?reportId=101">View</a></td>
        </tr>
        <!-- More rows populated dynamically -->
      </tbody>
    </table>
  </div>
  <footer style="clear:both; text-align:center;">
    <p>© 2025 MediLab Hospital. All rights reserved.</p>
  </footer>
</body>
</html>

