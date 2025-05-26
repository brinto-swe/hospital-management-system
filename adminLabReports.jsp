<%-- 
    Document   : adminLabReports
    Created on : May 26, 2025, 11:27:48 AM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Admin Lab Reports Management</title>
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
            <h1 class="text-3xl font-bold">Lab Reports Managements</h1>
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
                        <a href="labManagement.jsp" class="nav__link active">
                            <i class="fa-solid fa-flask fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Lab Management</span>
                        </a>
                        <a href="wardManagement.jsp" class="nav__link ">
                            <i class="fa-solid fa-house-medical-circle-check fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Ward Management</span>
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
                        <a href="departmentManagement.jsp" class="nav__link">
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
            <!-- Filter Form -->
            <div class="mb-6">
                <form action="adminLabReports.jsp" method="get" class="flex items-center space-x-4">
                    <label for="filterDate" class="text-gray-700">Filter by Schedule Date:</label>
                    <input type="date" id="filterDate" name="filterDate" class="input input-bordered">
                    <button type="submit" class="btn btn-secondary">Filter</button>
                </form>
            </div>
            <div class="overflow-x-auto">
                <table class="table w-full">
                    <thead class="bg-blue-600 text-white">
                        <tr>
                            <th>Report ID</th>
                            <th>User ID</th>
                            <th>Name</th>
                            <th>Appointment ID</th>
                            <th>Age</th>
                            <th>Test Name</th>
                            <th>Schedule Date</th>
                            <th>Doctor Instruction</th>
                            <th>Results</th>
                            <th>Status</th>
                            <th>Doctor Name</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String filterDate = request.getParameter("filterDate");
                            Connection con = null;
                            PreparedStatement ps = null;
                            ResultSet rs = null;
                            String sql = "SELECT * FROM LAB_REPORTS";
                            if (filterDate != null && !filterDate.trim().isEmpty()) {
                                sql += " WHERE SCHEDULE_DATE = ?";
                            }
                            try {
                                con = DBConnection.getConnection();
                                ps = con.prepareStatement(sql);
                                if (filterDate != null && !filterDate.trim().isEmpty()) {
                                    ps.setString(1, filterDate);
                                }
                                rs = ps.executeQuery();
                                boolean found = false;
                                while (rs.next()) {
                                    found = true;
                        %>
                        <tr class="border-b">
                            <td><%= rs.getInt("REPORT_ID")%></td>
                            <td><%= rs.getString("USER_ID")%></td>
                            <td><%= rs.getString("NAME")%></td>
                            <td><%= rs.getInt("APPOINTMENT_ID")%></td>
                            <td><%= rs.getInt("AGE")%></td>
                            <td><%= rs.getString("TEST_NAME")%></td>
                            <td><%= rs.getString("SCHEDULE_DATE")%></td>
                            <td><%= rs.getString("DOCTOR_INSTRUCTION")%></td>
                            <td><%= rs.getString("RESULTS") == null ? "" : rs.getString("RESULTS")%></td>
                            <td><%= rs.getString("STATUS")%></td>
                            <td><%= rs.getString("DOCTOR_NAME")%></td>
                            <td>
                                <% if ("pending".equalsIgnoreCase(rs.getString("STATUS"))) {%>
                                <a href="inputLabReport.jsp?reportId=<%= rs.getInt("REPORT_ID")%>" class="btn btn-sm btn-primary">Input Report</a>
                                <% } else {%>
                                <a href="inputLabReport.jsp?reportId=<%= rs.getInt("REPORT_ID")%>" class="btn btn-sm btn-secondary">Edit Report</a>
                                <% }%>
                            </td>
                        </tr>
                        <%
                                }
                                if (!found) {
                                    out.println("<tr><td colspan='12' class='text-center'>No lab reports found.</td></tr>");
                                }
                            } catch (Exception e) {
                                out.println("<tr><td colspan='12' class='text-red-500'>" + e.getMessage() + "</td></tr>");
                            } finally {
                                if (rs != null) {
                                    try {
                                        rs.close();
                                    } catch (Exception ex) {
                                    }
                                }
                                if (ps != null) {
                                    try {
                                        ps.close();
                                    } catch (Exception ex) {
                                    }
                                }
                                if (con != null) {
                                    try {
                                        con.close();
                                    } catch (Exception ex) {
                                    }
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <script src="js/script.js"></script>

            <footer style="clear:both; text-align:center;">
                <p>© 2025 MediLab Hospital. All rights reserved.</p>
            </footer>
        </div>
    </body>
</html>
