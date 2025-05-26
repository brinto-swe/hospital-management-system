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
        <!-- Tailwind CSS & DaisyUI & Font Awesome-->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>
    <body>
        <header class="flex none">
            <div class="">
                <img src="images/logo.png" alt="MediLab Hospital" style="height:40px;">
            </div>
            <h1 class="text-3xl font-bold">Department Management</h1>
            <a href="logout.jsp">
                <i class="fa-solid fa-right-from-bracket"></i>
                <span>Logout</span>
            </a>
        </header>
        <div class="l-navbar" id="navbar">
            <nav class="nav">
                <div>

                    <div class="nav__toggle" id="nav-toggle">
                        <i class="fas fa-angle-double-right"></i>
                    </div>

                    <div class="nav__list">
                        <a href="adminDashboard.jsp" class="nav__link">
                            <i class="fa-solid fa-gauge-high fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Dashboard</span>
                        </a>
                        <a href="staffManagement.jsp" class="nav__link">
                            <i class="fa-solid fa-user-group fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Staff Management</span>
                        </a>
                        <a href="labManagement.jsp" class="nav__link ">
                            <i class="fa-solid fa-flask fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Lab Management</span>
                        </a>
                        <a href="wardManagement.jsp" class="nav__link ">
                            <i class="fa-solid fa-house-medical-circle-check fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Ward Management</span>
                        </a>
                        <a href="treatmentManagement.jsp" class="nav__link ">
                            <i class="fa-solid fa-notes-medical fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Treatment Management</span>
                        </a>
                        <a href="pharmacyManagement.jsp" class="nav__link ">
                            <i class="fa-solid fa-house-medical-flag fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Pharmacy Management</span>
                        </a>
                        <a href="patientManagement.jsp" class="nav__link ">
                            <i class="fa-solid fa-bed fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Patient Management</span>
                        </a>
                        <a href="pharmacyInvoice.jsp" class="nav__link ">
                            <i class="fa-solid fa-receipt fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Pharmacy Invoice</span>
                        </a>
                        <a href="pharmacySupplier.jsp" class="nav__link ">
                            <i class="fa-solid fa-boxes-packing fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Pharmacy Supplier</span>
                        </a>
                        <a href="departmentManagement.jsp" class="nav__link active">
                            <i class="fa-solid fa-building-user fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Department Management</span>
                        </a>
                        <a href="prescriptionManagement.jsp" class="nav__link ">
                            <i class="fa-solid fa-file-medical fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Prescription Management</span>
                        </a>
                        <a href="adminAppointmentManagement.jsp" class="nav__link ">
                            <i class="fa-solid fa-person-circle-question fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Appointment Management</span>
                        </a>
                        <a href="doctorsManagement.jsp" class="nav__link ">
                            <i class="fa-solid fa-user-doctor fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Doctor Management</span>
                        </a>
                    </div>
                </div>
            </nav>
        </div>
        <div class="main-content p-6" id="main-content">
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
        <script src="js/script.js"></script>

        <footer style="clear:both; text-align:center;">
            <p>© 2025 MediLab Hospital. All rights reserved.</p>
        </footer>
    </body>
</html>

