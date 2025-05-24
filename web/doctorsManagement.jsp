<%-- 
    Document   : doctorsManagement
    Created on : May 23, 2025, 11:28:35 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Doctor Management - Admin Panel</title>
        <!-- Tailwind CSS & DaisyUI -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    </head>
    <body class="bg-gray-100">
        <!-- Header -->
        <header class="bg-blue-600 text-white p-4 flex items-center justify-between">
            <div class="flex items-center">
                <img src="images/logo.png" alt="MediLab Hospital" class="h-10 mr-3">
                <h1 class="text-lg font-bold">Admin Panel - Doctor Management</h1>
            </div>
        </header>

        <div class="flex">
            <!-- Sidebar -->
            <nav class="w-64 bg-gray-800 text-white min-h-screen p-5">
                <ul>
                    <li><a href="adminDashboard.jsp" class="block py-2 px-4 hover:bg-gray-700 rounded">Dashboard</a></li>
                    <li><a href="staffManagement.jsp" class="block py-2 px-4 hover:bg-gray-700 rounded">Staff Management</a></li>
                    <li><a href="labManagement.jsp" class="block py-2 px-4 hover:bg-gray-700 rounded">Lab Management</a></li>
                    <li><a href="wardManagement.jsp" class="block py-2 px-4 hover:bg-gray-700 rounded">Ward Management</a></li>
                    <li><a href="treatmentManagement.jsp" class="block py-2 px-4 hover:bg-gray-700 rounded">Treatment Management</a></li>
                    <li><a href="pharmacyManagement.jsp" class="block py-2 px-4 hover:bg-gray-700 rounded">Pharmacy Management</a></li>
                    <li><a href="patientManagement.jsp" class="block py-2 px-4 hover:bg-gray-700 rounded">Patient Management</a></li>
                    <li><a href="departmentManagement.jsp" class="block py-2 px-4 hover:bg-gray-700 rounded">Department Management</a></li>
                    <li><a href="doctorsManagement.jsp" class="block py-2 px-4 hover:bg-gray-700 rounded">Doctor Management</a></li>
                </ul>
            </nav>

            <!-- Main Content -->
            <div class="flex-1 p-8">
                <h2 class="text-2xl font-bold mb-4">Doctor Management</h2>

                <!-- Add New Doctor Form -->
                <div class="card bg-white shadow-lg p-6 rounded-md mb-8">
                    <h3 class="text-xl font-semibold mb-4">Add New Doctor</h3>
                    <form action="DoctorServlet" method="post">
                        <div class="mb-4">
                            <label for="doctorId" class="block text-sm font-medium mb-1">Doctor ID:</label>
                            <input type="text" id="doctorId" name="doctorId" required class="input input-bordered w-full">
                        </div>
                        <div class="mb-4">
                            <label for="doctorName" class="block text-sm font-medium mb-1">Doctor Name:</label>
                            <input type="text" id="doctorName" name="doctorName" required class="input input-bordered w-full">
                        </div>
                        <div class="mb-4">
                            <label for="deptId" class="block text-sm font-medium mb-1">Department:</label>
                            <select id="deptId" name="deptId" required class="select select-bordered w-full">
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
                        </div>
                        <div class="mb-4">
                            <label for="contact" class="block text-sm font-medium mb-1">Contact:</label>
                            <input type="text" id="contact" name="contact" required class="input input-bordered w-full">
                        </div>
                        <div class="mb-4">
                            <label class="block text-sm font-medium mb-1">Working Hours:</label>
                            <div class="flex space-x-4">
                                <div>
                                    <label for="startTime" class="block text-xs">Start Time:</label>
                                    <input type="time" id="startTime" name="startTime" required class="input input-bordered">
                                </div>
                                <div>
                                    <label for="endTime" class="block text-xs">End Time:</label>
                                    <input type="time" id="endTime" name="endTime" required class="input input-bordered">
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Add Doctor</button>
                    </form>
                </div>

                <!-- Real-time Table View -->
                <div class="overflow-x-auto">
                    <table class="table w-full">
                        <thead class="bg-blue-600 text-white">
                            <tr>
                                <th>Doctor ID</th>
                                <th>Doctor Name</th>
                                <th>Department ID</th>
                                <th>Department Name</th>
                                <th>Contact</th>
                                <th>Start Time</th>
                                <th>End Time</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                boolean hasData = false;
                                Connection conDoc = null;
                                PreparedStatement psDoctor = null;
                                ResultSet rsDoctor = null;
                                try {
                                    conDoc = DBConnection.getConnection();
                                    String sqlDoctor = "SELECT d.DOCTOR_ID, d.DOCTOR_NAME, d.DEPT_ID, dept.DEPT_NAME, d.CONTACT, d.START_TIME, d.END_TIME "
                                            + "FROM DOCTORS d JOIN DEPARTMENTS dept ON d.DEPT_ID = dept.DEPT_ID";
                                    psDoctor = conDoc.prepareStatement(sqlDoctor);
                                    rsDoctor = psDoctor.executeQuery();
                                    while (rsDoctor.next()) {
                                        hasData = true;
                                        String doctorId = rsDoctor.getString("DOCTOR_ID");
                                        String doctorName = rsDoctor.getString("DOCTOR_NAME");
                                        String deptId = rsDoctor.getString("DEPT_ID");
                                        String deptName = rsDoctor.getString("DEPT_NAME");
                                        String contact = rsDoctor.getString("CONTACT");
                                        String startTime = rsDoctor.getString("START_TIME");
                                        String endTime = rsDoctor.getString("END_TIME");
                            %>
                            <tr class="border-b">
                                <td class="py-2 px-4"><%= doctorId%></td>
                                <td class="py-2 px-4"><%= doctorName%></td>
                                <td class="py-2 px-4"><%= deptId%></td>
                                <td class="py-2 px-4"><%= deptName%></td>
                                <td class="py-2 px-4"><%= contact%></td>
                                <td class="py-2 px-4"><%= startTime%></td>
                                <td class="py-2 px-4"><%= endTime%></td>
                                <td class="py-2 px-4">
                                    <a href="updateDoctor.jsp?id=<%= doctorId%>" class="btn btn-sm btn-primary">Update</a>
                                    <a href="DeleteDoctorServlet?id=<%= doctorId%>" class="btn btn-sm btn-error">Delete</a>
                                </td>
                            </tr>
                            <%
                                    }
                                    if (!hasData) {
                                        out.println("<tr><td colspan='8' class='text-center'>No doctors found.</td></tr>");
                                    }
                                } catch (Exception e) {
                                    out.println("<tr><td colspan='8' class='text-red-500 py-2 px-4'>Error: " + e.getMessage() + "</td></tr>");
                                } finally {
                                    if (rsDoctor != null) {
                                        try {
                                            rsDoctor.close();
                                        } catch (Exception ex) {
                                        }
                                    }
                                    if (psDoctor != null) {
                                        try {
                                            psDoctor.close();
                                        } catch (Exception ex) {
                                        }
                                    }
                                    if (conDoc != null) {
                                        try {
                                            conDoc.close();
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
    </body>
</html>


