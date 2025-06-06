<%-- 
    Document   : pharmacyManagement
    Created on : May 22, 2025, 5:07:18 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Pharmacy Management - Admin Panel</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <style>
    .sidebar { width: 200px; float:left; background: #333; min-height: 100vh; padding: 20px; }
    .sidebar a { display:block; color: #fff; padding: 10px; text-decoration:none; }
    .sidebar a:hover { background: #575757; }
    .content { margin-left:220px; padding:20px; }
    form div { margin-bottom: 10px; }
    table { width:100%; margin-top:20px; }
  </style>
</head>
<body>
  <header>
    <div class="logo">
      <img src="images/logo.png" alt="MediLab Hospital" style="height:40px;">
    </div>
    <h1 style="display:inline; color:white; padding-left:20px;">Admin Panel - Pharmacy Management</h1>
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
    <h2>Pharmacy Management</h2>
    <h3>Add New Medicine</h3>
    <form action="PharmacyServlet" method="post">
      <div>
        <label for="medicineName">Medicine Name:</label>
        <input type="text" id="medicineName" name="medicineName" required>
      </div>
      <div>
        <label for="batch">Batch Number:</label>
        <input type="text" id="batch" name="batch" required>
      </div>
      <div>
        <label for="expiryDate">Expiry Date:</label>
        <input type="date" id="expiryDate" name="expiryDate" required>
      </div>
      <div>
        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" required>
      </div>
      <div>
        <label for="price">Price:</label>
        <input type="number" step="0.01" id="price" name="price" required>
      </div>
      <div>
        <button type="submit">Add Medicine</button>
      </div>
    </form>
    <h3>Current Medicines</h3>
    <table>
      <thead>
        <tr>
          <th>Medicine ID</th>
          <th>Name</th>
          <th>Batch</th>
          <th>Expiry Date</th>
          <th>Quantity</th>
          <th>Price</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>401</td>
          <td>Aspirin</td>
          <td>B123</td>
          <td>2025-11-30</td>
          <td>100</td>
          <td>5.00</td>
          <td>
            <a href="updateMedicine.jsp?id=401">Update</a> |
            <a href="DeleteMedicineServlet?id=401">Delete</a>
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

