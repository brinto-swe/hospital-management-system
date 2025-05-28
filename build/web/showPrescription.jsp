<%-- 
    Document   : showPrescription
    Created on : May 27, 2025, 12:46:47 AM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Prescription Report</title>
  <!-- Tailwind CSS & DaisyUI -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <style>
    .prescription-id {
      position: absolute;
      top: 20px;
      right: 20px;
      font-weight: bold;
    }
  </style>
</head>
<body class="bg-gray-100 relative">
  <div class="prescription-id">
    Prescription ID: <%= request.getAttribute("prescriptionId") %>
  </div>
  <div class="container mx-auto p-6 bg-white shadow-lg rounded-md">
    <h1 class="text-3xl font-bold mb-4">Prescription Report</h1>
    <p class="mb-2"><strong>User Name:</strong> <%= request.getAttribute("userName") %></p>
    <p class="mb-2"><strong>Issued Date:</strong> <%= request.getAttribute("issueDate") %></p>
    <h2 class="text-xl font-bold mt-4">Treatments:</h2>
    <p><%= request.getAttribute("treatmentNames") %></p>
    <h2 class="text-xl font-bold mt-4">Medicines:</h2>
    <p><%= request.getAttribute("medicineNames") %></p>
    <h2 class="text-xl font-bold mt-4">Special Instructions:</h2>
    <p><%= request.getAttribute("instructions") %></p>
  </div>
  <div class="container mx-auto p-6">
    <a href="userPrescription.jsp" class="btn btn-secondary">Back</a>
  </div>
</body>
</html>
