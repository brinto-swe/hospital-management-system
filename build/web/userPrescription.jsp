<%-- 
    Document   : userPrescription
    Created on : May 27, 2025, 12:44:21 AM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>View Your Prescription</title>
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
                        <a href="assignLabTest.jsp" class="nav__link ">
                            <i class="fa-solid fa-flask fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">My Appointments</span>
                        </a>
                        <a href="userAppointment.jsp" class="nav__link ">
                            <i class="fa-solid fa-gauge-high fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Take Appointment</span>
                        </a>
                        <a href="doctorsLabReports.jsp" class="nav__link active">
                            <i class="fa-solid fa-flask fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">View Prescriptions</span>
                        </a>
                        <a href="treatmentManagement.jsp" class="nav__link ">
                            <i class="fa-solid fa-notes-medical fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Treatment Management</span>
                        </a>
                    </div>
                </div>
            </nav>
        </div>
        <div class="main-content p-6" id="main-content">
            <h1 class="text-2xl font-bold mb-4">View Your Prescription</h1>
            <form action="ShowPrescriptionServlet" method="get" class="space-y-4 w-3xl">
                <div>
                    <label for="appointmentId" class="block text-sm font-medium">Appointment ID:</label>
                    <input type="text" id="appointmentId" name="appointmentId" required class="input input-bordered w-full">
                </div>
                <div>
                    <button type="submit" class="btn btn-primary">View Prescription</button>
                </div>
            </form>
            <div>
                <p style="color:red;"><%= request.getAttribute("error") != null ? request.getAttribute("error") : ""%></p>
            </div>
        </div>
        <script src="js/script.js"></script>

        <footer style="clear:both; text-align:center;">
            <p>© 2025 MediLab Hospital. All rights reserved.</p>
        </footer> 
    </body>
</html>
