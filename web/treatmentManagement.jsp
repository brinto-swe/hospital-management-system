<%-- 
    Document   : treatmentManagement
    Created on : May 22, 2025, 5:06:46 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Treatment Management - Admin Panel</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <style>
    .sidebar { width: 200px; float: left; background: #333; min-height: 100vh; padding: 20px; }
    .sidebar a { display: block; color: #fff; padding: 10px; text-decoration: none; }
    .sidebar a:hover { background: #575757; }
    .content { margin-left: 220px; padding: 20px; }
    form div { margin-bottom: 10px; }
    table { width: 100%; margin-top: 20px; }
  </style>
</head>
<body>
  <header>
    <div class="logo">
      <img src="images/logo.png" alt="MediLab Hospital" style="height:40px;">
    </div>
    <h1 style="display:inline; color:white; padding-left:20px;">Admin Panel - Treatment Management</h1>
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
    <h2>Treatment Management</h2>
    <h3>Assign Treatment</h3>
    <form action="TreatmentServlet" method="post">
      <div>
        <label for="patientId">Patient ID:</label>
        <input type="text" id="patientId" name="patientId" required>
      </div>
      <div>
        <label for="nurse">Assign Nurse:</label>
        <input type="text" id="nurse" name="nurse" required>
      </div>
      <div>
        <label for="notes">Treatment Notes:</label>
        <textarea id="notes" name="notes" required></textarea>
      </div>
      <div>
        <label for="fees">Treatment Fees:</label>
        <input type="number" id="fees" name="fees" required>
      </div>
      <div>
        <button type="submit">Submit Treatment</button>
      </div>
    </form>
    <h3>Existing Treatments</h3>
    <table>
      <thead>
        <tr>
          <th>Treatment ID</th>
          <th>Patient ID</th>
          <th>Nurse</th>
          <th>Notes</th>
          <th>Fees</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>301</td>
          <td>1003</td>
          <td>Nurse A</td>
          <td>Regular checkup required</td>
          <td>500</td>
          <td>
            <a href="updateTreatment.jsp?id=301">Update</a> |
            <a href="DeleteTreatmentServlet?id=301">Delete</a>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  <footer style="clear:both; text-align:center;">
    <p>© 2025 MediLab Hospital. All rights reserved.</p>
  </footer>
</body>
</html>

