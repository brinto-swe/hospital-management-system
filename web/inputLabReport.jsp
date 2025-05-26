<%-- 
    Document   : inputLabReport
    Created on : May 26, 2025, 11:28:13 AM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Input Lab Report</title>
        <!-- Tailwind CSS & DaisyUI -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>
    <body class="bg-gray-100">
        <%
            String reportIdStr = request.getParameter("reportId");
            if (reportIdStr == null || reportIdStr.trim().isEmpty()) {
                out.println("<p class='text-red-500 text-center p-4'>No Report ID provided.</p>");
                return;
            }
            int reportId = Integer.parseInt(reportIdStr);

            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            // Variables to hold report details
            String userId = "", name = "", testName = "", doctorInstruction = "", results = "", scheduleDate = "", status = "", doctorName = "";
            int appointmentId = 0, age = 0;

            try {
                con = DBConnection.getConnection();
                String sql = "SELECT * FROM LAB_REPORTS WHERE REPORT_ID = ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, reportId);
                rs = ps.executeQuery();
                if (rs.next()) {
                    userId = rs.getString("USER_ID");
                    appointmentId = rs.getInt("APPOINTMENT_ID");
                    name = rs.getString("NAME");
                    age = rs.getInt("AGE");
                    testName = rs.getString("TEST_NAME");
                    doctorInstruction = rs.getString("DOCTOR_INSTRUCTION");
                    results = rs.getString("RESULTS");
                    scheduleDate = rs.getString("SCHEDULE_DATE");
                    status = rs.getString("STATUS");
                    doctorName = rs.getString("DOCTOR_NAME");
                } else {
                    out.println("<p class='text-red-500 text-center p-4'>Report not found.</p>");
                    return;
                }
            } catch (Exception e) {
                out.println("<p class='text-red-500 text-center p-4'>Error: " + e.getMessage() + "</p>");
                return;
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
        <div class="container mx-auto p-6">
            <div class="max-w-lg mx-auto bg-white shadow-xl rounded-lg p-6">
                <h2 class="text-2xl font-bold mb-4 text-center">Input/Edit Lab Report</h2>
                <form action="UpdateLabReportServlet" method="post" class="space-y-4">
                    <input type="hidden" name="reportId" value="<%= reportId%>">
                    <div>
                        <label class="block text-sm font-medium">Appointment ID:</label>
                        <input type="text" value="<%= appointmentId%>" readonly class="input input-bordered w-full">
                    </div>
                    <div>
                        <label class="block text-sm font-medium">User ID:</label>
                        <input type="text" value="<%= userId%>" readonly class="input input-bordered w-full">
                    </div>
                    <div>
                        <label class="block text-sm font-medium">User Name:</label>
                        <input type="text" value="<%= name%>" readonly class="input input-bordered w-full">
                    </div>
                    <div>
                        <label class="block text-sm font-medium">Age:</label>
                        <input type="text" value="<%= age%>" readonly class="input input-bordered w-full">
                    </div>
                    <div>
                        <label class="block text-sm font-medium">Test Name:</label>
                        <input type="text" value="<%= testName%>" readonly class="input input-bordered w-full">
                    </div>
                    <div>
                        <label class="block text-sm font-medium">Scheduled Date:</label>
                        <input type="text" value="<%= scheduleDate%>" readonly class="input input-bordered w-full">
                    </div>
                    <div>
                        <label class="block text-sm font-medium">Doctor Name:</label>
                        <input type="text" value="<%= doctorName%>" readonly class="input input-bordered w-full">
                    </div>
                    <div>
                        <label for="results" class="block text-sm font-medium">Test Results:</label>
                        <textarea id="results" name="results" class="textarea textarea-bordered w-full" placeholder="Enter test results" required><%= (results == null ? "" : results)%></textarea>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary w-full">Completed</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
