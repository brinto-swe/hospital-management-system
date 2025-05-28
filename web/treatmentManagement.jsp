<%-- 
    Document   : treatmentManagement
    Created on : May 22, 2025, 5:06:46 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Treatment Management</title>
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
            <h1 class="text-3xl font-bold">Treatment Management</h1>
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
                        <a href="adminDashboard.jsp" class="nav__link ">
                            <i class="fa-solid fa-gauge-high fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Dashboard</span>
                        </a>
                        <a href="userRequestManagement.jsp" class="nav__link ">
                            <i class="fa-solid fa-person-circle-question fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">User Request Management</span>
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
                        <a href="treatmentManagement.jsp" class="nav__link active">
                            <i class="fa-solid fa-notes-medical fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Treatment Management</span>
                        </a>
                        <a href="medicineManagement.jsp" class="nav__link ">
                            <i class="fa-solid fa-house-medical-flag fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Pharmacy Management</span>
                        </a>
                        <a href="departmentManagement.jsp" class="nav__link ">
                            <i class="fa-solid fa-building-user fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Department Management</span>
                        </a>
                        <a href="adminAppointmentManagement.jsp" class="nav__link ">
                            <i class="fa-solid fa-address-book fa-lg nav__icon" style="color: #ffffff;"></i>
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

            <!-- Form: Add New Treatment -->
            <div class="card bg-white shadow-lg p-6 rounded-md mb-8">
                <h2 class="text-xl font-semibold mb-4">Add New Treatment</h2>
                <form action="TreatmentServlet" method="post" class="space-y-4 w-lg">
                    <div>
                        <label for="treatmentId" class="block text-sm font-medium">Treatment ID (Assigned by Admin):</label>
                        <input type="text" id="treatmentId" name="treatmentId" required class="input input-bordered w-full">
                    </div>
                    <div>
                        <label for="treatmentName" class="block text-sm font-medium">Treatment Name:</label>
                        <input type="text" id="treatmentName" name="treatmentName" required class="input input-bordered w-full">
                    </div>
                    <div>
                        <label for="price" class="block text-sm font-medium">Price:</label>
                        <input type="number" step="0.01" id="price" name="price" required class="input input-bordered w-full">
                    </div>
                    <div>
                        <button type="submit" class="btn btn-main w-lg">Add Treatment</button>
                    </div>
                </form>
            </div>

            <!-- Treatment List Table -->
            <div class="card bg-white shadow-lg p-6 rounded-md">
                <h2 class="text-xl font-semibold mb-4">Existing Treatments</h2>
                <div class="overflow-x-auto">
                    <table class="table w-full">
                        <thead class="bg-blue-600 text-white">
                            <tr>
                                <th>Treatment ID</th>
                                <th>Treatment Name</th>
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
                                    String sql = "SELECT * FROM TREATMENT";
                                    ps = con.prepareStatement(sql);
                                    rs = ps.executeQuery();
                                    boolean found = false;
                                    while (rs.next()) {
                                        found = true;
                            %>
                            <tr class="border-b">
                                <td><%= rs.getString("TREATMENT_ID")%></td>
                                <td><%= rs.getString("TREATMENT_NAME")%></td>
                                <td>$<%= rs.getBigDecimal("PRICE")%></td>
                            </tr>
                            <%
                                    }
                                    if (!found) {
                                        out.println("<tr><td colspan='3' class='text-center'>No treatments found.</td></tr>");
                                    }
                                } catch (Exception ex) {
                                    out.println("<tr><td colspan='3' class='text-red-600'>Error: " + ex.getMessage() + "</td></tr>");
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
