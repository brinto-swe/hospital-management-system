<%-- 
    Document   : doctorsLabReports
    Created on : May 26, 2025, 12:47:07 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Doctor Lab Reports</title>
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
            <h1 class="text-3xl font-bold">View Lab Results</h1>
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
                        <a href="doctorAppointment.jsp" class="nav__link ">
                            <i class="fa-solid fa-gauge-high fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">My Appointments</span>
                        </a>
                        <a href="assignLabTest.jsp" class="nav__link ">
                            <i class="fa-solid fa-flask fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Assign Lab Test</span>
                        </a>
                        <a href="doctorsLabReports.jsp" class="nav__link active">
                            <i class="fa-solid fa-flask fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">View Lab Results</span>
                        </a>
                        <a href="treatmentManagement.jsp" class="nav__link ">
                            <i class="fa-solid fa-notes-medical fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Treatment Management</span>
                        </a>
                        <a href="pharmacyManagement.jsp" class="nav__link ">
                            <i class="fa-solid fa-house-medical-flag fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Pharmacy Management</span>
                        </a>
                        <a href="prescriptionManagement.jsp" class="nav__link ">
                            <i class="fa-solid fa-file-medical fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Prescription Management</span>
                        </a>
                    </div>
                </div>
            </nav>
        </div>
        <div class="main-content p-6" id="main-content">
            <h1 class="text-2xl font-bold mb-4">Lab Reports Filter</h1>
            <!-- Filter form -->
            <form method="get" action="DoctorLabReportsServlet" class="mb-6">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="block text-sm font-medium" for="appointmentId">Appointment ID:</label>
                        <input type="text" name="appointmentId" id="appointmentId" placeholder="Enter Appointment ID"
                               class="input input-bordered w-full"
                               value="<%= request.getParameter("appointmentId") != null ? request.getParameter("appointmentId") : ""%>">
                    </div>
                    <div>
                        <label class="block text-sm font-medium" for="filterDate">Schedule Date:</label>
                        <input type="date" name="filterDate" id="filterDate" class="input input-bordered w-full"
                               value="<%= request.getParameter("filterDate") != null ? request.getParameter("filterDate") : ""%>">
                    </div>
                </div>
                <div class="mt-4">
                    <button type="submit" class="btn btn-main">Filter Reports</button>
                </div>
            </form>

            <!-- Results Table -->
            <div class="overflow-x-auto">
                <table class="table w-full">
                    <thead class="bg-blue-600 text-white">
                        <tr>
                            <th>Report ID</th>
                            <th>Appointment ID</th>
                            <th>User Name</th>
                            <th>Age</th>
                            <th>Schedule Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String appointmentIdFilter = request.getParameter("appointmentId");
                            String filterDate = request.getParameter("filterDate");
                            Connection con = null;
                            PreparedStatement ps = null;
                            ResultSet rs = null;
                            try {
                                con = DBConnection.getConnection();
                                String sql = "SELECT REPORT_ID, APPOINTMENT_ID, NAME, AGE, SCHEDULE_DATE, STATUS FROM LAB_REPORTS WHERE 1=1";
                                if (appointmentIdFilter != null && !appointmentIdFilter.trim().isEmpty()) {
                                    sql += " AND APPOINTMENT_ID = ?";
                                }
                                if (filterDate != null && !filterDate.trim().isEmpty()) {
                                    sql += " AND SCHEDULE_DATE = ?";
                                }
                                ps = con.prepareStatement(sql);
                                int paramIndex = 1;
                                if (appointmentIdFilter != null && !appointmentIdFilter.trim().isEmpty()) {
                                    ps.setInt(paramIndex++, Integer.parseInt(appointmentIdFilter));
                                }
                                if (filterDate != null && !filterDate.trim().isEmpty()) {
                                    ps.setString(paramIndex++, filterDate);
                                }

                                rs = ps.executeQuery();
                                boolean found = false;
                                while (rs.next()) {
                                    found = true;
                        %>
                        <tr class="border-b">
                            <td><%= rs.getInt("REPORT_ID")%></td>
                            <td><%= rs.getInt("APPOINTMENT_ID")%></td>
                            <td><%= rs.getString("NAME")%></td>
                            <td><%= rs.getInt("AGE")%></td>
                            <td><%= rs.getString("SCHEDULE_DATE")%></td>
                            <td><%= rs.getString("STATUS")%></td>
                            <td>
                                <a href="ViewLabReportServlet?reportId=<%= rs.getInt("REPORT_ID")%>" class="btn btn-sm btn-main">View Report</a>

                            </td>
                        </tr>
                        <%
                                } // end while
                                if (!found) {
                                    out.println("<tr><td colspan='7' class='text-center'>No lab reports found for the given filters.</td></tr>");
                                }
                            } catch (Exception ex) {
                                out.println("<tr><td colspan='7' class='text-center text-red-600'>Error: " + ex.getMessage() + "</td></tr>");
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
        <script src="js/script.js"></script>

        <footer style="clear:both; text-align:center;">
            <p>© 2025 MediLab Hospital. All rights reserved.</p>
        </footer>
    </body>
</html>
