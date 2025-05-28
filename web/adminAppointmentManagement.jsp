<%-- 
    Document   : adminAppointmentManagement
    Created on : May 22, 2025, 6:16:19 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Admin Appointment Management</title>
        <!-- Tailwind CSS & DaisyUI -->
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
            <h1 class="text-3xl font-bold">Admin Appointment Management</h1>
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
                        <a href="treatmentManagement.jsp" class="nav__link ">
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
                        <a href="adminAppointmentManagement.jsp" class="nav__link active">
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
            <div class="mb-6 space-y-4">
                <div>
                    <a href="adminAppointmentManagement.jsp" class="btn btn-main">See All Appointments</a>
                </div>
                <div>
                    <form method="get" action="adminAppointmentManagement.jsp" class="flex items-center space-x-4">
                        <label for="dateFilter" class="text-gray-700">By Date:</label>
                        <input type="date" id="dateFilter" name="filterDate" class="input input-bordered">
                        <button type="submit" class="btn btn-secondary">Filter</button>
                    </form>
                </div>
                <div>
                    <form method="get" action="adminAppointmentManagement.jsp" class="flex items-center space-x-4">
                        <label for="doctorFilter" class="text-gray-700">By Doctor ID:</label>
                        <input type="text" id="doctorFilter" name="filterDoctor" placeholder="Doctor ID" class="input input-bordered">
                        <button type="submit" class="btn btn-secondary">Filter</button>
                    </form>
                </div>
                <div>
                    <form method="get" action="adminAppointmentManagement.jsp" class="flex items-center space-x-4">
                        <label for="deptFilter" class="text-gray-700">By Department:</label>
                        <select id="deptFilter" name="filterDept" class="select select-bordered">
                            <option value="">--Select Department--</option>
                            <%
                                Connection conDep = null;
                                PreparedStatement psDep = null;
                                ResultSet rsDep = null;
                                try {
                                    conDep = DBConnection.getConnection();
                                    psDep = conDep.prepareStatement("SELECT DEPT_ID, DEPT_NAME FROM DEPARTMENTS");
                                    rsDep = psDep.executeQuery();
                                    while (rsDep.next()) {
                                        String depId = rsDep.getString("DEPT_ID");
                                        String depName = rsDep.getString("DEPT_NAME");
                            %>
                            <option value="<%= depId%>"><%= depName%> (<%= depId%>)</option>
                            <%
                                    }
                                } catch (Exception e) {
                                    out.println("<option>Error Loading Departments</option>");
                                } finally {
                                    if (rsDep != null) {
                                        try {
                                            rsDep.close();
                                        } catch (Exception ex) {
                                        }
                                    }
                                    if (psDep != null) {
                                        try {
                                            psDep.close();
                                        } catch (Exception ex) {
                                        }
                                    }
                                    if (conDep != null) {
                                        try {
                                            conDep.close();
                                        } catch (Exception ex) {
                                        }
                                    }
                                }
                            %>
                        </select>
                        <button type="submit" class="btn btn-secondary">Filter</button>
                    </form>
                </div>
            </div>

            <!-- Appointments Table -->
            <div class="overflow-x-auto">
                <table class="table w-full">
                    <thead class="bg-blue-600 text-white">
                        <tr>
                            <th>Appointment ID</th>
                            <th>Doctor ID</th>
                            <th>Doctor Name</th>
                            <th>Department</th>
                            <th>Appointment Date</th>
                            <th>Appointment Time</th>
                            <th>Status</th>
                            <!-- Add additional action buttons as needed -->
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String filterDate = request.getParameter("filterDate");
                            String filterDoctor = request.getParameter("filterDoctor");
                            String filterDept = request.getParameter("filterDept");

                            Connection conApp = null;
                            PreparedStatement psApp = null;
                            ResultSet rsApp = null;
                            String query = "SELECT a.APPOINTMENT_ID, a.DOCTOR_ID, d.DOCTOR_NAME, d.DEPT_ID, dept.DEPT_NAME, a.APPOINTMENT_DATE, a.APPOINTMENT_TIME, a.STATUS "
                                    + "FROM APPOINTMENTS a "
                                    + "JOIN DOCTORS d ON a.DOCTOR_ID = d.DOCTOR_ID "
                                    + "JOIN DEPARTMENTS dept ON d.DEPT_ID = dept.DEPT_ID ";

                            String whereClause = "";
                            if (filterDate != null && !filterDate.trim().isEmpty()) {
                                whereClause += " a.APPOINTMENT_DATE = ? ";
                            }
                            if (filterDoctor != null && !filterDoctor.trim().isEmpty()) {
                                if (!whereClause.isEmpty()) {
                                    whereClause += " AND ";
                                }
                                whereClause += " a.DOCTOR_ID = ? ";
                            }
                            if (filterDept != null && !filterDept.trim().isEmpty()) {
                                if (!whereClause.isEmpty()) {
                                    whereClause += " AND ";
                                }
                                whereClause += " d.DEPT_ID = ? ";
                            }
                            if (!whereClause.isEmpty()) {
                                query += " WHERE " + whereClause;
                            }

                            try {
                                conApp = DBConnection.getConnection();
                                psApp = conApp.prepareStatement(query);
                                int paramIndex = 1;
                                if (filterDate != null && !filterDate.trim().isEmpty()) {
                                    psApp.setString(paramIndex++, filterDate);
                                }
                                if (filterDoctor != null && !filterDoctor.trim().isEmpty()) {
                                    psApp.setString(paramIndex++, filterDoctor);
                                }
                                if (filterDept != null && !filterDept.trim().isEmpty()) {
                                    psApp.setString(paramIndex++, filterDept);
                                }
                                rsApp = psApp.executeQuery();
                                boolean hasApp = false;
                                while (rsApp.next()) {
                                    hasApp = true;
                        %>
                        <tr class="border-b">
                            <td class="py-2 px-4"><%= rsApp.getInt("APPOINTMENT_ID")%></td>
                            <td class="py-2 px-4"><%= rsApp.getString("DOCTOR_ID")%></td>
                            <td class="py-2 px-4"><%= rsApp.getString("DOCTOR_NAME")%></td>
                            <td class="py-2 px-4"><%= rsApp.getString("DEPT_NAME")%> (<%= rsApp.getString("DEPT_ID")%>)</td>
                            <td class="py-2 px-4"><%= rsApp.getDate("APPOINTMENT_DATE")%></td>
                            <td class="py-2 px-4"><%= rsApp.getTime("APPOINTMENT_TIME")%></td>
                            <td class="py-2 px-4"><%= rsApp.getString("STATUS")%></td>
                        </tr>
                        <%
                                }
                                if (!hasApp) {
                                    out.println("<tr><td colspan='7' class='text-center'>No appointments found.</td></tr>");
                                }
                            } catch (Exception e) {
                                out.println("<tr><td colspan='7' class='text-red-500 py-2 px-4'>Error: " + e.getMessage() + "</td></tr>");
                            } finally {
                                if (rsApp != null) {
                                    try {
                                        rsApp.close();
                                    } catch (Exception ex) {
                                    }
                                }
                                if (psApp != null) {
                                    try {
                                        psApp.close();
                                    } catch (Exception ex) {
                                    }
                                }
                                if (conApp != null) {
                                    try {
                                        conApp.close();
                                    } catch (Exception ex) {
                                    }
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <script src="js/script.js"></script>
    </body>
</html>