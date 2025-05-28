<%-- 
    Document   : assignPrescription
    Created on : May 26, 2025, 11:53:31 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Assign Prescription</title>
        <!-- Tailwind CSS & DaisyUI -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <script type="text/javascript">
            function addTreatment(){
                var select = document.getElementById("treatmentSelect");
                var selectedValue = select.options[select.selectedIndex].value;
                var treatmentField = document.getElementById("treatmentList");
                // Append value with comma separation if field already has data.
                if (treatmentField.value === "") {
                    treatmentField.value = selectedValue;
                } else {
                    treatmentField.value += ", " + selectedValue;
                }
            }
    
            function addMedicine(){
                var select = document.getElementById("medicineSelect");
                var selectedValue = select.options[select.selectedIndex].value;
                var medicineField = document.getElementById("medicineList");
                if (medicineField.value === "") {
                    medicineField.value = selectedValue;
                } else {
                    medicineField.value += ", " + selectedValue;
                }
            }
        </script>
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
                        <a href="assignLabTest.jsp" class="nav__link">
                            <i class="fa-solid fa-flask fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Assign Lab Test</span>
                        </a>
                        <a href="doctorsLabReports.jsp" class="nav__link ">
                            <i class="fa-solid fa-flask fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">View Lab Results</span>
                        </a>
                        <a href="assignPrescription.jsp" class="nav__link active">
                            <i class="fa-solid fa-file-medical fa-lg nav__icon" style="color: #ffffff;"></i>
                            <span class="nav__text">Prescription Management</span>
                        </a>
                    </div>
                </div>
            </nav>
        </div>
        <div class="main-content p-6" id="main-content">
            <h1 class="text-2xl font-bold mb-4">Assign Prescription</h1>
            <form action="PrescriptionServlet" method="post" class="space-y-4">

                <!-- Basic Information -->
                <div>
                    <label for="userId" class="block text-sm font-medium">User ID:</label>
                    <input type="text" id="userId" name="userId" required class="input input-bordered w-full">
                </div>
                <div>
                    <label for="appointmentId" class="block text-sm font-medium">Appointment ID:</label>
                    <input type="number" id="appointmentId" name="appointmentId" required class="input input-bordered w-full">
                </div>

                <!-- Treatment Section -->
                <div>
                    <label class="block text-sm font-medium">Select Treatment:</label>
                    <div class="flex space-x-2">
                        <select id="treatmentSelect" class="select select-bordered">
                            <%
                                // Retrieve treatments from TREATMENT table
                                Connection con = null;
                                PreparedStatement ps = null;
                                ResultSet rs = null;
                                try {
                                    con = DBConnection.getConnection();
                                    String sql = "SELECT TREATMENT_ID, TREATMENT_NAME FROM TREATMENT";
                                    ps = con.prepareStatement(sql);
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                                        String tid = rs.getString("TREATMENT_ID");
                                        String tname = rs.getString("TREATMENT_NAME");
                            %>
                            <option value="<%= tid%>"><%= tname%> (ID: <%= tid%>)</option>
                            <%
                                    }
                                } catch (Exception e) {
                                    out.println("<option>Error loading treatments</option>");
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
                        </select>
                        <button type="button" class="btn btn-secondary" onclick="addTreatment()">Add Treatment</button>
                    </div>
                    <div class="mt-2">
                        <input type="text" id="treatmentList" name="treatmentIds" readonly placeholder="Selected Treatment IDs will appear here" class="input input-bordered w-full">
                    </div>
                </div>

                <!-- Medicine Section -->
                <div>
                    <label class="block text-sm font-medium">Select Medicine:</label>
                    <div class="flex space-x-2">
                        <select id="medicineSelect" class="select select-bordered">
                            <%
                                // Retrieve medicines from MEDICINE table
                                Connection con2 = null;
                                PreparedStatement ps2 = null;
                                ResultSet rs2 = null;
                                try {
                                    con2 = DBConnection.getConnection();
                                    String sql2 = "SELECT MEDICINE_ID, MEDICINE_NAME FROM MEDICINE";
                                    ps2 = con2.prepareStatement(sql2);
                                    rs2 = ps2.executeQuery();
                                    while (rs2.next()) {
                                        String mid = rs2.getString("MEDICINE_ID");
                                        String mname = rs2.getString("MEDICINE_NAME");
                            %>
                            <option value="<%= mid%>"><%= mname%> (ID: <%= mid%>)</option>
                            <%
                                    }
                                } catch (Exception e) {
                                    out.println("<option>Error loading medicines</option>");
                                } finally {
                                    if (rs2 != null) {
                                        try {
                                            rs2.close();
                                        } catch (Exception ex) {
                                        }
                                    }
                                    if (ps2 != null) {
                                        try {
                                            ps2.close();
                                        } catch (Exception ex) {
                                        }
                                    }
                                    if (con2 != null) {
                                        try {
                                            con2.close();
                                        } catch (Exception ex) {
                                        }
                                    }
                                }
                            %>
                        </select>
                        <button type="button" class="btn btn-secondary" onclick="addMedicine()">Add Medicine</button>
                    </div>
                    <div class="mt-2">
                        <input type="text" id="medicineList" name="medicineIds" readonly placeholder="Selected Medicine IDs will appear here" class="input input-bordered w-full">
                    </div>
                </div>

                <!-- Remaining Fields -->
                <div>
                    <label for="instructions" class="block text-sm font-medium">Special Instructions:</label>
                    <textarea id="instructions" name="instructions" class="textarea textarea-bordered w-full" placeholder="Enter instructions if any"></textarea>
                </div>
                <div>
                    <label for="issueDate" class="block text-sm font-medium">Issued Date:</label>
                    <input type="date" id="issueDate" name="issueDate" required class="input input-bordered w-full">
                </div>
                <div>
                    <button type="submit" class="btn btn-primary w-full">Assign Prescription</button>
                </div>
            </form>
        </div>
        <script src="js/script.js"></script>

        <footer style="clear:both; text-align:center;">
            <p>© 2025 MediLab Hospital. All rights reserved.</p>
        </footer>
    </body>
</html>
