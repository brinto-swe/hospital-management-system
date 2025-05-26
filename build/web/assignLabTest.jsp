<%-- 
    Document   : assignLabTest
    Created on : May 26, 2025, 11:26:56 AM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Assign Lab Test</title>
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
            <h1 class="text-3xl font-bold">Assign Lab Test</h1>
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
                        <a href="assignLabTest.jsp" class="nav__link active">
                            <i class="fa-solid fa-flask fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Assign Lab Test</span>
                        </a>
                        <a href="doctorsLabReports.jsp" class="nav__link ">
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
            <form action="AssignLabTestServlet" method="post" class="space-y-4">
                <div class="">
                    <label for="userId" class="block text-sm font-medium">User ID:</label>
                    <input type="text" id="userId" name="userId" required class="input input-bordered w-full">
                </div>
                <div>
                    <label for="appointmentId" class="block text-sm font-medium">Appointment ID:</label>
                    <input type="text" id="appointmentId" name="appointmentId" required class="input input-bordered w-full">
                </div>
                <div>
                    <label for="age" class="block text-sm font-medium">Age:</label>
                    <input type="number" id="age" name="age" required class="input input-bordered w-full">
                </div>
                <%
                    // Populate test names from TEST_NAME table
                    Connection con = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    try {
                        con = DBConnection.getConnection();
                        String sql = "SELECT TEST_ID, TEST_NAME FROM TEST_NAME";
                        ps = con.prepareStatement(sql);
                        rs = ps.executeQuery();
                %>
                <div>
                    <label for="testId" class="block text-sm font-medium">Test Name:</label>
                    <select id="testId" name="testId" required class="select select-bordered w-full">
                        <%
                            while (rs.next()) {
                                String tid = rs.getString("TEST_ID");
                                String tname = rs.getString("TEST_NAME");
                        %>
                        <option value="<%= tid%>"><%= tname%> (ID: <%= tid%>)</option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <%
                    } catch (Exception e) {
                        out.println("Error: " + e.getMessage());
                    } finally {
                        if (rs != null) {
                            rs.close();
                        }
                        if (ps != null) {
                            ps.close();
                        }
                        if (con != null) {
                            con.close();
                        }
                    }
                %>
                <div>
                    <label for="doctorInstruction" class="block text-sm font-medium">Doctor Instruction:</label>
                    <textarea id="doctorInstruction" name="doctorInstruction" class="textarea textarea-bordered w-full" placeholder="Enter instructions (optional)"></textarea>
                </div>
                <div>
                    <label for="scheduleDate" class="block text-sm font-medium">Schedule Date:</label>
                    <input type="date" id="scheduleDate" name="scheduleDate" required class="input input-bordered w-full">
                </div>
                <%
                    // Retrieve doctor's name from Session (assume it is set at login)
                    String doctorName = (String) session.getAttribute("doctorName");
                    if (doctorName == null) {
                        doctorName = "Unknown Doctor";
                    }
                %>
                <input type="hidden" name="doctorName" value="<%= doctorName%>">

                <div>
                    <button type="submit" class="btn btn-main w-full">Assign Lab Test</button>
                </div>
            </form>
        </div>
        <script src="js/script.js"></script>

        <footer style="clear:both; text-align:center;">
            <p>© 2025 MediLab Hospital. All rights reserved.</p>
        </footer>
    </body>
</html>
