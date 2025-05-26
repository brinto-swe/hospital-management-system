<%-- 
    Document   : doctorAppointment
    Created on : May 26, 2025, 6:13:09 AM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<%
    // Ensure doctor is logged in.

    if (session == null || session.getAttribute("doctorId") == null) {
        response.sendRedirect("doctorLogin.jsp?error=Please+login+first");
        return;
    }
    String doctorId = (String) session.getAttribute("doctorId");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>My Appointments</title>
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
            <h1 class="text-3xl font-bold">My Appointments</h1>
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
                        <a href="doctorAppointment.jsp" class="nav__link active">
                            <i class="fa-solid fa-gauge-high fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">My Appointments</span>
                        </a>
                        <a href="assignLabTest.jsp" class="nav__link ">
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
            <div class="overflow-x-auto">
                <table class="table w-full">
                    <thead class="bg-blue-600 text-white">
                        <tr>
                            <th class="py-2 px-4">Appointment ID</th>
                            <th class="py-2 px-4">User ID</th>
                            <th class="py-2 px-4">Date</th>
                            <th class="py-2 px-4">Time</th>
                            <th class="py-2 px-4">Status</th>
                            <th class="py-2 px-4">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Connection conApp = null;
                            PreparedStatement psApp = null;
                            ResultSet rsApp = null;
                            try {
                                conApp = DBConnection.getConnection();
                                String sql = "SELECT APPOINTMENT_ID, USER_ID, APPOINTMENT_DATE, APPOINTMENT_TIME, STATUS FROM APPOINTMENTS WHERE DOCTOR_ID = ?";
                                psApp = conApp.prepareStatement(sql);
                                psApp.setString(1, doctorId);
                                rsApp = psApp.executeQuery();
                                boolean hasAppointment = false;
                                while (rsApp.next()) {
                                    hasAppointment = true;
                        %>
                        <tr class="border-b">
                            <td class="py-2 px-4"><%= rsApp.getInt("APPOINTMENT_ID")%></td>
                            <td class="py-2 px-4"><%= rsApp.getString("USER_ID")%></td>
                            <td class="py-2 px-4"><%= rsApp.getDate("APPOINTMENT_DATE")%></td>
                            <td class="py-2 px-4"><%= rsApp.getTime("APPOINTMENT_TIME")%></td>
                            <td class="py-2 px-4"><%= rsApp.getString("STATUS")%></td>
                            <td class="py-2 px-4">
                                <%
                                    String status = rsApp.getString("STATUS");
                                    int appointmentId = rsApp.getInt("APPOINTMENT_ID");
                                    if ("pending".equalsIgnoreCase(status)) {
                                %>
                                <form action="UpdateAppointmentStatusServlet" method="post" class="inline">
                                    <input type="hidden" name="appointmentId" value="<%= appointmentId%>">
                                    <button type="submit" class="btn btn-sm btn-success">Done</button>
                                </form>
                                <% } else {%>
                                <span class="text-green-600 font-bold">Done</span>
                                <% }%>
                            </td>
                        </tr>
                        <%
                                }
                                if (!hasAppointment) {
                                    out.println("<tr><td colspan='6' class='text-center'>No appointments found.</td></tr>");
                                }
                            } catch (Exception e) {
                                out.println("<tr><td colspan='6' class='text-red-500'>" + e.getMessage() + "</td></tr>");
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

        <footer style="clear:both; text-align:center;">
            <p>© 2025 MediLab Hospital. All rights reserved.</p>
        </footer>
    </body>
</html>
