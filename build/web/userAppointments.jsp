<%-- 
    Document   : userAppointments
    Created on : May 27, 2025, 1:40:00 AM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList, com.hospital.servlets.Appointment" %>
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
            <h1 class="text-3xl font-bold">Take Appointment</h1>
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
                        <a href="userAppointments.jsp" class="nav__link ">
                            <i class="fa-solid fa-flask fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">My Appointments</span>
                        </a>
                        <a href="userAppointment.jsp" class="nav__link active">
                            <i class="fa-solid fa-gauge-high fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Take Appointment</span>
                        </a>
                        <a href="userPrescription.jsp" class="nav__link ">
                            <i class="fa-solid fa-flask fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">View Prescriptions</span>
                        </a>
                        <a href="invoice.jsp" class="nav__link ">
                            <i class="fa-solid fa-notes-medical fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Invoice</span>
                        </a>
                    </div>
                </div>
            </nav>
        </div>
        <div class="main-content p-6" id="main-content">
            <h1 class="text-2xl font-bold mb-4">My Appointments</h1>

            <!-- Display error message if any -->
            <%
                String error = (String) request.getAttribute("error");
                if (error != null && !error.isEmpty()) {
            %>
            <p class="text-red-600"><%= error%></p>
            <%
                }
            %>

            <table class="table w-full bg-white shadow-md rounded">
                <thead class="bg-blue-600 text-white">
                    <tr>
                        <th>Appointment ID</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Doctor ID</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<Appointment> appointmentList = (ArrayList<Appointment>) request.getAttribute("appointmentList");
                        if (appointmentList != null && appointmentList.size() > 0) {
                            for (Appointment app : appointmentList) {
                    %>
                    <tr class="border-b">
                        <td><%= app.getAppointmentId()%></td>
                        <td><%= app.getAppointmentDate()%></td>
                        <td><%= app.getAppointmentTime()%></td>
                        <td><%= app.getDoctorId()%></td>
                        <td><%= app.getStatus()%></td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="5" class="text-center">No appointments found.</td>
                    </tr>
                    <%            }
                    %>
                </tbody>
            </table>
        </div>
        <script src="js/script.js"></script>

        <footer style="clear:both; text-align:center;">
            <p>© 2025 MediLab Hospital. All rights reserved.</p>
        </footer>
    </body>
</html>
