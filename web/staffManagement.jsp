<%-- 
    Document   : staffManagement
    Created on : May 22, 2025, 4:29:34 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Staff Management - Admin Panel</title>
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
    <h1 style="display:inline-block; color:#fff; padding-left:20px;">Admin Panel - Staff Management</h1>
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
    <h2>Register New Staff</h2>
    <form action="StaffServlet" method="post">
      <div>
         <label for="staffName">Name:</label>
         <input type="text" id="staffName" name="staffName" required>
      </div>
      <div>
         <label for="position">Position:</label>
         <input type="text" id="position" name="position" required>
      </div>
      <div>
         <label for="department">Department:</label>
         <input type="text" id="department" name="department" required>
      </div>
      <div>
         <label for="contact">Contact:</label>
         <input type="text" id="contact" name="contact" required>
      </div>
      <div>
         <button type="submit">Register Staff</button>
      </div>
    </form>
    <h2>Existing Staff</h2>
    <table>
       <thead>
         <tr>
           <th>Staff ID</th>
           <th>Name</th>
           <th>Position</th>
           <th>Department</th>
           <th>Contact</th>
           <th>Actions</th>
         </tr>
       </thead>
       <tbody>
         <!-- Example row; replace with dynamic content -->
         <tr>
           <td>1</td>
           <td>John Doe</td>
           <td>Nurse</td>
           <td>Emergency</td>
           <td>123-456-7890</td>
           <td>
             <a href="UpdateStaff.jsp?staffId=1">Update</a> |
             <a href="DeleteStaffServlet?staffId=1">Delete</a>
           </td>
         </tr>
       </tbody>
    </table>
 </div>
 <footer style="clear:both; text-align:center; padding: 10px;">
    <p>© 2025 MediLab Hospital. All rights reserved.</p>
 </footer>
</body>
</html>

