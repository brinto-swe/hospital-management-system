<%-- 
    Document   : prescriptionManagement
    Created on : May 22, 2025, 6:15:47 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Prescription Management - Admin Panel</title>
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
    <h1 style="display:inline; color:white; padding-left:20px;">Admin Panel - Prescription Management</h1>
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
    <h2>Prescription Management</h2>
    <h3>Add New Prescription</h3>
    <form action="PrescriptionServlet" method="post">
      <div>
        <label for="patientName">Patient Name:</label>
        <input type="text" id="patientName" name="patientName" required>
      </div>
      <div>
        <label for="treatmentName">Treatment Name:</label>
        <input type="text" id="treatmentName" name="treatmentName" required>
      </div>
      <div>
        <label for="price">Price:</label>
        <input type="number" step="0.01" id="price" name="price" required>
      </div>
      <div>
        <label for="prescriptionNote">Prescription Note:</label>
        <textarea id="prescriptionNote" name="prescriptionNote" required></textarea>
      </div>
      <div>
        <button type="submit">Add Prescription</button>
      </div>
    </form>
    <h3>Existing Prescriptions</h3>
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>Patient Name</th>
          <th>Treatment Name</th>
          <th>Price</th>
          <th>Note</th>
          <th>Issued Date</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <!-- Example row; replace with dynamic content -->
        <tr>
          <td>701</td>
          <td>Jane Doe</td>
          <td>Covid Treatment</td>
          <td>2000.00</td>
          <td>Please take medication for 7 days.</td>
          <td>2025-05-21</td>
          <td>
            <a href="updatePrescription.jsp?id=701">Update</a> |
            <a href="DeletePrescriptionServlet?id=701">Delete</a>
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

