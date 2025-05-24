<%-- 
    Document   : updateAppointment
    Created on : May 23, 2025, 5:26:51 PM
    Author     : mozad
--%>

<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String appointmentId = request.getParameter("id");
    String patientId = "", doctor = "", appointmentDate = "", appointmentTime = "";
    try {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT PATIENT_ID, DOCTOR, APPOINTMENT_DATE, APPOINTMENT_TIME FROM APPOINTMENTS WHERE APPOINTMENT_ID = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(appointmentId));
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            patientId = rs.getString("PATIENT_ID");
            doctor = rs.getString("DOCTOR");
            appointmentDate = rs.getString("APPOINTMENT_DATE");
            appointmentTime = rs.getString("APPOINTMENT_TIME");
        }
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Appointment</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <h2>Update Appointment Details</h2>
    <form action="UpdateAppointmentServlet" method="post">
        <input type="hidden" name="appointmentId" value="<%= appointmentId %>">
        <label>Patient ID:</label>
        <input type="text" name="patientId" value="<%= patientId %>" required><br/>
        <label>Doctor:</label>
        <input type="text" name="doctor" value="<%= doctor %>" required><br/>
        <label>Date:</label>
        <input type="date" name="appointmentDate" value="<%= appointmentDate %>" required><br/>
        <label>Time:</label>
        <input type="time" name="appointmentTime" value="<%= appointmentTime %>" required><br/>
        <button type="submit">Update Appointment</button>
    </form>
</body>
</html>
