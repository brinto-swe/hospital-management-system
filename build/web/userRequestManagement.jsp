<%-- 
    Document   : userRequestManagement
    Created on : May 24, 2025, 12:11:50 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>User Request Management</title>
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
                        <a href="adminDashboard.jsp" class="nav__link ">
                            <i class="fa-solid fa-gauge-high fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Dashboard</span>
                        </a>
                        <a href="userRequestManagement.jsp" class="nav__link active">
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
            <h2 class="text-2xl font-bold mb-4">Pending Users</h2>

            <div class="overflow-x-auto">
                <table class="table w-full border-collapse">
                    <thead class="bg-blue-600 text-white">
                        <tr>
                            <th class="py-2 px-4">User ID</th>
                            <th class="py-2 px-4">Name</th>
                            <th class="py-2 px-4">Email</th>
                            <th class="py-2 px-4">Status</th>
                            <th class="py-2 px-4">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Connection con = null;
                            PreparedStatement ps = null;
                            ResultSet rs = null;
                            try {
                                con = DBConnection.getConnection();
                                String sql = "SELECT USER_ID, NAME, EMAIL, STATUS FROM USERS WHERE STATUS = 'pending'";
                                ps = con.prepareStatement(sql);
                                rs = ps.executeQuery();
                                boolean hasRecord = false;
                                while (rs.next()) {
                                    hasRecord = true;
                                    String userId = rs.getString("USER_ID");
                                    String name = rs.getString("NAME");
                                    String email = rs.getString("EMAIL");
                        %>
                        <tr class="border-b">
                            <td class="py-2 px-4"><%= userId%></td>
                            <td class="py-2 px-4"><%= name%></td>
                            <td class="py-2 px-4"><%= email%></td>
                            <td class="py-2 px-4"><%= rs.getString("STATUS")%></td>
                            <td class="py-2 px-4">
                                <!-- When admin clicks Approve, call the servlet -->
                                <form action="ApproveUserServlet" method="post" class="inline">
                                    <input type="hidden" name="userId" value="<%= userId%>">
                                    <button type="submit" class="btn btn-primary">Approve</button>
                                </form>
                            </td>
                        </tr>
                        <%
                                }
                                if (!hasRecord) {
                                    out.println("<tr><td colspan='5' class='text-center'>No pending signup requests.</td></tr>");
                                }
                            } catch (Exception e) {
                                out.println("<tr><td colspan='5' class='text-red-500'>Error: " + e.getMessage() + "</td></tr>");
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

        <script src="js/script.js"></script>
    </body>
</html>

