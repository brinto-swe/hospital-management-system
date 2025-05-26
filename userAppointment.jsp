<%-- 
    Document   : userAppointment
    Created on : May 22, 2025, 4:14:05 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>User Appointment</title>
        <!-- Tailwind CSS & DaisyUI -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <style>
            .card{
                width: 600px;
            }
        </style>
    </head>
    <body class="bg-gray-100">
        <header>
            <div class="logo">
                <img src="images/logo.png" alt="MediLab Hospital" style="height:40px;">
            </div>
            <nav class="homepage-nav">
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="about.jsp">About Us</a></li>
                    <li><a href="signup.jsp">Sign Up</a></li>
                    <li class="active"><a href="userAppoinment.jsp">Appoinment</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
            </nav>
        </header>

        <div class="container mx-auto place-items-center p-6">
            <!-- Step 1: Select Date, Time, and Department -->
            <div class="card bg-white shadow-lg p-6 rounded mb-6 items-center">
                <h2 class="text-2xl font-bold mb-4">Step 1: Select Details</h2>
                <form method="post" action="userAppointment.jsp">
                    <div class="mb-4">
                        <label for="apptDate" class="block text-gray-700">Appointment Date:</label>
                        <input type="date" id="apptDate" name="apptDate" required class="input input-bordered w-lg" value="<%= request.getParameter("apptDate") != null ? request.getParameter("apptDate") : ""%>">
                    </div>
                    <div class="mb-4">
                        <label for="apptTime" class="block text-gray-700">Appointment Time:</label>
                        <input type="time" id="apptTime" name="apptTime" required class="input input-bordered w-lg" value="<%= request.getParameter("apptTime") != null ? request.getParameter("apptTime") : ""%>">
                    </div>
                    <div class="mb-4">
                        <label for="deptId" class="block text-gray-700">Department:</label>
                        <select id="deptId" name="deptId" required class="select select-bordered w-lg">
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
                            <option value="<%= depId%>" <%= (request.getParameter("deptId") != null && request.getParameter("deptId").equals(depId)) ? "selected" : ""%>><%= depName%> (<%= depId%>)</option>
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
                        <button type="submit" name="btn" value="getDoctors" class="btn btn-main w-lg">Get Available Doctors</button>
                    </div>
                </form>
            </div>

            <!-- Step 2: Display Available Doctors and Book Appointment -->
            <%
                String btn = request.getParameter("btn");
                String apptDate = request.getParameter("apptDate");
                String apptTime = request.getParameter("apptTime");
                String selectedDeptId = request.getParameter("deptId");
                java.util.List<String[]> availableDoctors = new java.util.ArrayList<String[]>();

                if ("getDoctors".equals(btn) && apptDate != null && apptTime != null && selectedDeptId != null) {
                    Connection con = null;
                    PreparedStatement psDoctor = null;
                    ResultSet rsDoctor = null;
                    try {
                        con = DBConnection.getConnection();
                        // Select doctors in department with appointment time between their active hours.
                        String sqlDoctor = "SELECT * FROM DOCTORS WHERE DEPT_ID = ? AND START_TIME <= ? AND END_TIME >= ?";
                        psDoctor = con.prepareStatement(sqlDoctor);
                        psDoctor.setString(1, selectedDeptId);
                        psDoctor.setString(2, apptTime);
                        psDoctor.setString(3, apptTime);
                        rsDoctor = psDoctor.executeQuery();
                        while (rsDoctor.next()) {
                            String doctorId = rsDoctor.getString("DOCTOR_ID");
                            String doctorName = rsDoctor.getString("DOCTOR_NAME");
                            // Check capacity: maximum 10 appointments per doctor per day.
                            String cntSql = "SELECT COUNT(*) AS cnt FROM APPOINTMENTS WHERE DOCTOR_ID = ? AND APPOINTMENT_DATE = ?";
                            PreparedStatement psCnt = con.prepareStatement(cntSql);
                            psCnt.setString(1, doctorId);
                            psCnt.setString(2, apptDate);
                            ResultSet rsCnt = psCnt.executeQuery();
                            int count = 0;
                            if (rsCnt.next()) {
                                count = rsCnt.getInt("cnt");
                            }
                            rsCnt.close();
                            psCnt.close();
                            if (count < 10) {
                                availableDoctors.add(new String[]{doctorId, doctorName});
                            }
                        }
                    } catch (Exception e) {
                        out.println("<p class='text-red-500'>Error: " + e.getMessage() + "</p>");
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
                        if (con != null) {
                            try {
                                con.close();
                            } catch (Exception ex) {
                            }
                        }
                    }
                }

                if (availableDoctors.size() > 0) {
            %>
            <div class="card bg-white shadow-lg p-6 rounded items-center">
                <h2 class="text-2xl font-bold mb-4">Step 2: Select Doctor & Confirm Appointment</h2>
                <form action="BookAppointmentServlet" method="post" class="space-y-4">
                    <input type="hidden" name="apptDate" value="<%= apptDate%>">
                    <input type="hidden" name="apptTime" value="<%= apptTime%>">
                    <input type="hidden" name="deptId" value="<%= selectedDeptId%>">
                    <div class="mb-4">
                        <label for="doctorId" class="block text-gray-700">Available Doctors:</label>
                        <select id="doctorId" name="doctorId" required class="select select-bordered w-lg">
                            <%
                                for (String[] doc : availableDoctors) {
                            %>
                            <option value="<%= doc[0]%>"><%= doc[1]%> (<%= doc[0]%>)</option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="mb-4">
                        <button type="submit" class="btn btn-main w-lg">Book Appointment</button>
                    </div>
                </form>
            </div>
            <%
                } else if ("getDoctors".equals(btn)) {
                    out.println("<p class='text-red-500 text-center'>No available doctor for the selected criteria or the slots are full.</p>");
                }
            %>

        </div>

        <footer class="bg-gray-800 text-white text-center py-4 mt-6">
            <p>© 2025 MediLab Hospital. All rights reserved.</p>
        </footer>
    </body>
</html>
