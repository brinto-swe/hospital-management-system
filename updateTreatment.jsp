<%-- 
    Document   : updateTreatment
    Created on : May 23, 2025, 5:25:50 PM
    Author     : mozad
--%>

<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String treatmentId = request.getParameter("id");
    String nurse = "", notes = "";
    String fees = "";
    try {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT NURSE, NOTES, FEES FROM TREATMENTS WHERE TREATMENT_ID = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(treatmentId));
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            nurse = rs.getString("NURSE");
            notes = rs.getString("NOTES");
            fees = rs.getString("FEES");
        }
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Treatment</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <h2>Update Treatment Details</h2>
    <form action="UpdateTreatmentServlet" method="post">
        <input type="hidden" name="treatmentId" value="<%= treatmentId %>">
        <label>Nurse Assigned:</label>
        <input type="text" name="nurse" value="<%= nurse %>" required><br/>
        <label>Treatment Notes:</label>
        <textarea name="notes" required><%= notes %></textarea><br/>
        <label>Fees:</label>
        <input type="number" name="fees" step="0.01" value="<%= fees %>" required><br/>
        <button type="submit">Update Treatment</button>
    </form>
</body>
</html>

