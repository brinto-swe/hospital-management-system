<%-- 
    Document   : departmentManagement
    Created on : May 22, 2025, 6:16:53 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Department Management - Admin Panel</title>
        <!-- Tailwind CSS & DaisyUI -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>
    <body class="bg-gray-100">
        <header class="bg-blue-600 text-white p-4 flex items-center justify-between">
            <div class="flex items-center">
                <img src="images/logo.png" alt="MediLab Hospital" class="h-10 mr-3">
                <h1 class="text-lg font-bold">Admin Panel - Department Management</h1>
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

            <div class="flex-1 p-8">
                <h2 class="text-2xl font-bold mb-4">Department Management</h2>

                <div class="card bg-white shadow-lg p-6 rounded-md">
                    <h3 class="text-lg font-semibold mb-2">Add New Department</h3>
                    <form action="DepartmentServlet" method="post">
                        <div class="mb-6">
                            <label for="deptId" class="block text-sm font-medium">Department ID:</label>
                            <input type="text" id="deptId" name="deptId" required class="input input-primary mt-2 w-50px">
                        </div>
                        <div class="mb-3">
                            <label for="deptName" class="block text-sm font-medium">Department Name:</label>
                            <input type="text" id="deptName" name="deptName" required class="input input-primary mt-2 w-50px">
                        </div>
                        <button type="submit" class="btn btn-primary">Add Department</button>
                    </form>
                </div>

                <h3 class="text-xl font-semibold mt-6">Existing Departments</h3>

                <div class="overflow-x-auto">
                    <table class="table w-full mt-4">
                        <thead class="bg-blue-600 text-white">
                            <tr>
                                <th class="text-white py-3 px-4">Department ID</th>
                                <th class="text-white py-3 px-4">Name</th>
                                <th class="text-white py-3 px-4">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Connection con = null;
                                PreparedStatement ps = null;
                                ResultSet rs = null;
                                try {
                                    con = DBConnection.getConnection();
                                    String sql = "SELECT DEPT_ID, DEPT_NAME FROM DEPARTMENTS";
                                    ps = con.prepareStatement(sql);
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                                        String deptId = rs.getString("DEPT_ID");
                                        String deptName = rs.getString("DEPT_NAME");
                            %>
                            <tr class="border-b">
                                <td class="py-2 px-4"><%= deptId%></td>
                                <td class="py-2 px-4"><%= deptName%></td>
                                <td class="py-2 px-4">
                                    <a href="updateDepartment.jsp?id=<%= deptId%>" class="btn btn-sm ">
                                        <i class="fa-solid fa-pencil fa-xl" style="color: #b698fb;"></i>
                                    </a>
                                    <a href="DeleteDepartmentServlet?id=<%= deptId%>" class="btn btn-sm">
                                        <i class="fa-solid fa-trash-can fa-xl" style="color: #ff0000;"></i>
                                    </a>
                                </td>
                            </tr>
                            <%
                                    }
                                } catch (Exception e) {
                                    out.println("<tr><td colspan='3' class='text-red-500 py-2 px-4'>Error: " + e.getMessage() + "</td></tr>");
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
            </div>
        </div>

        <footer class="bg-gray-800 text-white text-center py-4 mt-6">
            <p>© 2025 MediLab Hospital. All rights reserved.</p>
        </footer>

    </body>
</html>

