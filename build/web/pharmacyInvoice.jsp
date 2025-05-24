<%-- 
    Document   : pharmacyInvoice
    Created on : May 22, 2025, 5:08:35 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Pharmacy Invoice - Admin Panel</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <style>
    .sidebar { width: 200px; float: left; background: #333; min-height: 100vh; padding: 20px; }
    .sidebar a { display: block; color: #fff; padding: 10px; text-decoration: none; }
    .sidebar a:hover { background: #575757; }
    .content { margin-left: 220px; padding: 20px; }
    form div { margin-bottom: 10px; }
    table { width: 100%; margin-top:20px; }
  </style>
</head>
<body>
  <header>
    <div class="logo">
      <img src="images/logo.png" alt="MediLab Hospital" style="height:40px;">
    </div>
    <h1 style="display:inline; color:white; padding-left:20px;">Admin Panel - Pharmacy Invoice</h1>
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
    <h2>Create Invoice</h2>
    <form action="InvoiceServlet" method="post">
      <div>
        <label for="patientId">Patient ID:</label>
        <input type="text" id="patientId" name="patientId" required>
      </div>
      <div>
        <label for="drug">Drug Name:</label>
        <input type="text" id="drug" name="drug" required>
      </div>
      <div>
        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" required>
      </div>
      <div>
        <label for="unitPrice">Unit Price:</label>
        <input type="number" step="0.01" id="unitPrice" name="unitPrice" required>
      </div>
      <div>
        <button type="submit">Generate Invoice</button>
      </div>
    </form>
    <h3>Invoice Preview</h3>
    <table>
      <thead>
        <tr>
          <th>Item</th>
          <th>Quantity</th>
          <th>Unit Price</th>
          <th>Total Price</th>
        </tr>
      </thead>
      <tbody>
        <!-- Invoice items added dynamically -->
      </tbody>
    </table>
  </div>
  <footer style="clear:both; text-align:center;">
    <p>© 2025 MediLab Hospital. All rights reserved.</p>
  </footer>
</body>
</html>

