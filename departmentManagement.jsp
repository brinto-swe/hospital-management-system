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
        <title>Department Management</title>
        <!-- Tailwind CSS & DaisyUI & Font Awesome-->
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
                        <a href="adminLabReports.jsp" class="nav__link active">
                            <i class="fa-solid fa-notes-medical fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Lab Report Management</span>
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


        <script src="js/script.js"></script>

        <footer style="clear:both; text-align:center;">
            <p>© 2025 MediLab Hospital. All rights reserved.</p>
        </footer>
    </body>

</html>

