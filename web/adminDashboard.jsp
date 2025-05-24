<%-- 
    Document   : adminDashboard
    Created on : May 22, 2025, 4:28:57 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Admin Dashboard - MediLab Hospital</title>
   <link rel="stylesheet" type="text/css" href="css/style.css">
   <style>
     .sidebar { width: 200px; float: left; background: #333; min-height: 100vh; padding: 20px; }
     .sidebar a { display: block; color: #fff; padding: 10px; text-decoration: none; }
     .sidebar a:hover { background: #575757; }
     .content { margin-left: 220px; padding: 20px; }
     .metrics { display: flex; justify-content: space-around; margin-bottom: 20px; }
     .metric { background: #005a8d; color: #fff; padding: 15px; border-radius: 4px; width: 22%; text-align: center; }
   </style>
</head>
<body>
 <header>
    <div class="logo">
      <img src="images/logo.png" alt="MediLab Hospital" style="height:40px;">
    </div>
    <h1 style="display:inline-block; color:#fff; padding-left:20px;">Admin Panel</h1>
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
    <a href="logout.jsp">Logout</a>
 </div>
 <div class="content">
   <h2>Dashboard</h2>
   <div class="metrics">
     <div class="metric">
       <h3>Total Patients</h3>
       <p>41,234</p>
     </div>
     <div class="metric">
       <h3>Total Doctors</h3>
       <p>1,234</p>
     </div>
     <div class="metric">
       <h3>Total Wards</h3>
       <p>234</p>
     </div>
     <div class="metric">
       <h3>Total Labs</h3>
       <p>56</p>
     </div>
   </div>
   <h3>Patient Trends (Last 7 Days)</h3>
   <!-- Placeholder for a dynamic chart -->
   <img src="images/chart_placeholder.png" alt="Patient Trends" style="width:100%; max-width:600px;">
 </div>
 <footer style="clear:both; text-align:center;">
    <p>© 2025 MediLab Hospital. All rights reserved.</p>
 </footer>
</body>
</html>