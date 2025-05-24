<%-- 
    Document   : updateStaff
    Created on : May 23, 2025, 5:23:27 PM
    Author     : mozad
--%>

<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String staffId = request.getParameter("id");
    String name = "", position = "", department = "", contact = "";
    try {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT NAME, POSITION, DEPARTMENT, CONTACT FROM STAFF WHERE STAFF_ID = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(staffId));
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            name = rs.getString("NAME");
            position = rs.getString("POSITION");
            department = rs.getString("DEPARTMENT");
            contact = rs.getString("CONTACT");
        }
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Staff</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <h2>Update Staff Details</h2>
    <form action="UpdateStaffServlet" method="post">
        <input type="hidden" name="staffId" value="<%= staffId %>">
        <label>Name:</label>
        <input type="text" name="name" value="<%= name %>" required><br/>
        <label>Position:</label>
        <input type="text" name="position" value="<%= position %>" required><br/>
        <label>Department:</label>
        <input type="text" name="department" value="<%= department %>" required><br/>
        <label>Contact:</label>
        <input type="text" name="contact" value="<%= contact %>" required><br/>
        <button type="submit">Update Staff</button>
    </form>
</body>
</html>

