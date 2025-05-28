<%-- 
    Document   : staffManagement
    Created on : May 22, 2025, 4:29:34 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Staff Management</title>
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
            <h1 class="text-3xl font-bold">Approve User Signup Requests</h1>
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
                        <a href="userRequestManagement.jsp" class="nav__link ">
                            <i class="fa-solid fa-person-circle-question fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">User Request Management</span>
                        </a>
                        <a href="staffManagement.jsp" class="nav__link active">
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

            <!-- Section: Register New Staff -->
            <div class="card bg-white shadow-lg p-6 rounded-md mb-8">
                <h2 class="text-xl font-semibold mb-4">Register New Staff</h2>
                <form action="RegisterStaffServlet" method="post" class="space-y-4">
                    <div>
                        <label for="name" class="block text-sm font-medium">Name:</label>
                        <input type="text" id="name" name="name" required class="input input-bordered w-full">
                    </div>
                    <div>
                        <label for="position" class="block text-sm font-medium">Position:</label>
                        <input type="text" id="position" name="position" required class="input input-bordered w-full">
                    </div>
                    <div>
                        <label for="department_id" class="block text-sm font-medium">Department:</label>
                        <select id="department_id" name="department_id" required class="select select-bordered w-full">
                            <%
                                // Fetch departments from the DEPARTMENTS table.
                                Connection conDep = null;
                                PreparedStatement psDep = null;
                                ResultSet rsDep = null;
                                try {
                                    conDep = DBConnection.getConnection();
                                    psDep = conDep.prepareStatement("SELECT DEPT_ID, DEPT_NAME FROM DEPARTMENTS");
                                    rsDep = psDep.executeQuery();
                                    while (rsDep.next()) {
                                        int deptId = rsDep.getInt("DEPT_ID");
                                        String deptName = rsDep.getString("DEPT_NAME");
                            %>
                            <option value="<%= deptId%>"><%= deptName%> (ID: <%= deptId%>)</option>
                            <%
                                    }
                                } catch (Exception e) {
                                    out.println("<option>Error loading departments</option>");
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
                    </div>
                    <div>
                        <label for="contact" class="block text-sm font-medium">Contact:</label>
                        <input type="text" id="contact" name="contact" required class="input input-bordered w-full">
                    </div>
                    <div>
                        <button type="submit" class="btn btn-main w-full">Register Staff</button>
                    </div>
                </form>
            </div>

            <!-- Section: Existing Staff -->
            <div>
                <h2 class="text-xl font-semibold mb-4">Existing Staff</h2>
                <div class="overflow-x-auto">
                    <table class="table w-full">
                        <thead class="bg-blue-600 text-white">
                            <tr>
                                <th class="py-2 px-4">Staff ID</th>
                                <th class="py-2 px-4">Name</th>
                                <th class="py-2 px-4">Position</th>
                                <th class="py-2 px-4">Department</th>
                                <th class="py-2 px-4">Contact</th>
                                <th class="py-2 px-4">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Connection conStaff = null;
                                PreparedStatement psStaff = null;
                                ResultSet rsStaff = null;
                                try {
                                    conStaff = DBConnection.getConnection();
                                    // Join the Staff table with Departments to get department names.
                                    String sqlStaff = "SELECT s.staff_id, s.name, s.position, s.contact, d.DEPT_NAME, s.department_id "
                                            + "FROM STAFF s JOIN DEPARTMENTS d ON s.department_id = d.DEPT_ID";
                                    psStaff = conStaff.prepareStatement(sqlStaff);
                                    rsStaff = psStaff.executeQuery();
                                    boolean hasStaff = false;
                                    while (rsStaff.next()) {
                                        hasStaff = true;
                            %>
                            <tr class="border-b">
                                <td class="py-2 px-4"><%= rsStaff.getInt("staff_id")%></td>
                                <td class="py-2 px-4"><%= rsStaff.getString("name")%></td>
                                <td class="py-2 px-4"><%= rsStaff.getString("position")%></td>
                                <td class="py-2 px-4"><%= rsStaff.getString("DEPT_NAME")%> (ID: <%= rsStaff.getInt("department_id")%>)</td>
                                <td class="py-2 px-4"><%= rsStaff.getString("contact")%></td>
                                <td class="py-2 px-4">
                                    <a href="updateStaff.jsp?staffId=<%= rsStaff.getInt("staff_id")%>" class="btn btn-sm">
                                        <i class="fa-solid fa-pencil fa-xl" style="color: #b698fb;"></i>
                                    </a>
                                    <a href="DeleteStaffServlet?staffId=<%= rsStaff.getInt("staff_id")%>" class="btn btn-sm">
                                        <i class="fa-solid fa-trash-can fa-xl" style="color: #ff0000;"></i>
                                    </a>
                                </td>
                            </tr>
                            <%
                                    }
                                    if (!hasStaff) {
                                        out.println("<tr><td colspan='6' class='text-center'>No staff found.</td></tr>");
                                    }
                                } catch (Exception e) {
                                    out.println("<tr><td colspan='6' class='text-red-500'>Error: " + e.getMessage() + "</td></tr>");
                                } finally {
                                    if (rsStaff != null) {
                                        try {
                                            rsStaff.close();
                                        } catch (Exception ex) {
                                        }
                                    }
                                    if (psStaff != null) {
                                        try {
                                            psStaff.close();
                                        } catch (Exception ex) {
                                        }
                                    }
                                    if (conStaff != null) {
                                        try {
                                            conStaff.close();
                                        } catch (Exception ex) {
                                        }
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

        <footer class="bg-gray-800 text-white text-center py-4 mt-6">
            <p>© 2025 MediLab Hospital. All rights reserved.</p>
        </footer>
        <script src="js/script.js"></script>
    </body>
</html>
