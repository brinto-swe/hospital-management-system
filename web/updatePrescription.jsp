<%-- 
    Document   : updatePrescription
    Created on : May 23, 2025, 5:27:12 PM
    Author     : mozad
--%>

<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String prescriptionId = request.getParameter("id");
    String patientName = "", treatmentName = "", price = "", note = "";
    try {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT PATIENT_NAME, TREATMENT_NAME, PRICE, NOTE FROM PRESCRIPTIONS WHERE PRESCRIPTION_ID = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(prescriptionId));
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            patientName = rs.getString("PATIENT_NAME");
            treatmentName = rs.getString("TREATMENT_NAME");
            price = rs.getString("PRICE");
            note = rs.getString("NOTE");
        }
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Prescription</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <h2>Update Prescription Details</h2>
    <form action="UpdatePrescriptionServlet" method="post">
        <input type="hidden" name="prescriptionId" value="<%= prescriptionId %>">
        <label>Patient Name:</label>
        <input type="text" name="patientName" value="<%= patientName %>" required><br/>
        <label>Treatment Name:</label>
        <input type="text" name="treatmentName" value="<%= treatmentName %>" required><br/>
        <label>Price:</label>
        <input type="number" name="price" step="0.01" value="<%= price %>" required><br/>
        <label>Note:</label>
        <textarea name="note" required><%= note %></textarea><br/>
        <button type="submit">Update Prescription</button>
    </form>
</body>
</html>