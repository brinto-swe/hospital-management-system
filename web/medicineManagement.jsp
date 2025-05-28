<%-- 
    Document   : pharmacyManagement
    Created on : May 22, 2025, 5:07:18 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Medicine Management</title>
        <!-- Tailwind CSS & DaisyUI -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>
    <body class="bg-gray-100">
        <header class="flex none">
            <div class="">
                <img src="images/logo.png" alt="MediLab Hospital" style="height:40px;">
            </div>
            <h1 class="text-3xl font-bold">Medicine Management</h1>
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
                        <a href="adminLabManagement.jsp" class="nav__link ">
                            <i class="fa-solid fa-flask fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Lab Management</span>
                        </a>
                        <a href="wardManagement.jsp" class="nav__link ">
                            <i class="fa-solid fa-house-medical-circle-check fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Ward Management</span>
                        </a>
                        <a href="adminLabReports.jsp" class="nav__link ">
                            <i class="fa-solid fa-notes-medical fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Lab Report Management</span>
                        </a>
                        <a href="medicineManagement.jsp" class="nav__link active">
                            <i class="fa-solid fa-house-medical-flag fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Medicine Management</span>
                        </a>
                        <a href="pharmacyInvoice.jsp" class="nav__link ">
                            <i class="fa-solid fa-receipt fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Pharmacy Invoice</span>
                        </a>
                        <a href="pharmacySupplier.jsp" class="nav__link  ">
                            <i class="fa-solid fa-boxes-packing fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Pharmacy Supplier</span>
                        </a>
                        <a href="departmentManagement.jsp" class="nav__link">
                            <i class="fa-solid fa-building-user fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Department Management</span>
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

            <!-- Form: Add New Medicine -->
            <div class="card bg-white shadow-lg p-6 rounded-md mb-8">
                <h2 class="text-xl font-semibold mb-4">Add New Medicine</h2>
                <form action="MedicineServlet" method="post" class="space-y-4">
                    <div>
                        <label for="medicineId" class="block text-sm font-medium">Medicine ID (Assigned by Admin):</label>
                        <input type="text" id="medicineId" name="medicineId" required class="input input-bordered w-full">
                    </div>
                    <div>
                        <label for="medicineName" class="block text-sm font-medium">Medicine Name:</label>
                        <input type="text" id="medicineName" name="medicineName" required class="input input-bordered w-full">
                    </div>
                    <div>
                        <label for="batch" class="block text-sm font-medium">Batch:</label>
                        <input type="text" id="batch" name="batch" required class="input input-bordered w-full">
                    </div>
                    <div>
                        <label for="expiryDate" class="block text-sm font-medium">Expiry Date:</label>
                        <input type="date" id="expiryDate" name="expiryDate" required class="input input-bordered w-full">
                    </div>
                    <div>
                        <label for="quantity" class="block text-sm font-medium">Quantity:</label>
                        <input type="number" id="quantity" name="quantity" required class="input input-bordered w-full">
                    </div>
                    <div>
                        <label for="price" class="block text-sm font-medium">Price:</label>
                        <input type="number" step="0.01" id="price" name="price" required class="input input-bordered w-full">
                    </div>
                    <div>
                        <button type="submit" class="btn btn-main w-full">Add Medicine</button>
                    </div>
                </form>
            </div>

            <!-- Medicine List Table -->
            <div class="card bg-white shadow-lg p-6 rounded-md">
                <h2 class="text-xl font-semibold mb-4">Existing Medicines</h2>
                <div class="overflow-x-auto">
                    <table class="table w-full">
                        <thead class="bg-blue-600 text-white">
                            <tr>
                                <th>Medicine ID</th>
                                <th>Name</th>
                                <th>Batch</th>
                                <th>Expiry Date</th>
                                <th>Quantity</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Connection con = null;
                                PreparedStatement ps = null;
                                ResultSet rs = null;
                                try {
                                    con = DBConnection.getConnection();
                                    String sql = "SELECT * FROM MEDICINE";
                                    ps = con.prepareStatement(sql);
                                    rs = ps.executeQuery();
                                    boolean found = false;
                                    while (rs.next()) {
                                        found = true;
                            %>
                            <tr class="border-b">
                                <td><%= rs.getString("MEDICINE_ID")%></td>
                                <td><%= rs.getString("MEDICINE_NAME")%></td>
                                <td><%= rs.getString("BATCH")%></td>
                                <td><%= rs.getString("EXPIRY_DATE")%></td>
                                <td><%= rs.getInt("QUANTITY")%></td>
                                <td>$<%= rs.getBigDecimal("PRICE")%></td>
                            </tr>
                            <%
                                    }
                                    if (!found) {
                                        out.println("<tr><td colspan='6' class='text-center'>No medicines found.</td></tr>");
                                    }
                                } catch (Exception ex) {
                                    out.println("<tr><td colspan='6' class='text-red-600'>Error: " + ex.getMessage() + "</td></tr>");
                                } finally {
                                    if (rs != null) {
                                        try {
                                            rs.close();
                                        } catch (Exception e) {
                                        }
                                    }
                                    if (ps != null) {
                                        try {
                                            ps.close();
                                        } catch (Exception e) {
                                        }
                                    }
                                    if (con != null) {
                                        try {
                                            con.close();
                                        } catch (Exception e) {
                                        }
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
        <script src="js/script.js"></script>

        <footer style="clear:both; text-align:center;">
            <p>© 2025 MediLab Hospital. All rights reserved.</p>
        </footer>
    </body>
</html>
