<%-- 
    Document   : updateMedicine
    Created on : May 23, 2025, 5:26:23 PM
    Author     : mozad
--%>

<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String medicineId = request.getParameter("id");
    String medicineName = "", batch = "", expiryDate = "";
    String quantity = "", price = "";
    try {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT MEDICINE_NAME, BATCH, EXPIRY_DATE, QUANTITY, PRICE FROM MEDICINES WHERE MEDICINE_ID = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(medicineId));
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            medicineName = rs.getString("MEDICINE_NAME");
            batch = rs.getString("BATCH");
            expiryDate = rs.getString("EXPIRY_DATE");
            quantity = rs.getString("QUANTITY");
            price = rs.getString("PRICE");
        }
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Medicine</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <h2>Update Medicine Information</h2>
    <form action="UpdateMedicineServlet" method="post">
        <input type="hidden" name="medicineId" value="<%= medicineId %>">
        <label>Medicine Name:</label>
        <input type="text" name="medicineName" value="<%= medicineName %>" required><br/>
        <label>Batch:</label>
        <input type="text" name="batch" value="<%= batch %>" required><br/>
        <label>Expiry Date:</label>
        <input type="date" name="expiryDate" value="<%= expiryDate %>" required><br/>
        <label>Quantity:</label>
        <input type="number" name="quantity" value="<%= quantity %>" required><br/>
        <label>Price:</label>
        <input type="number" name="price" step="0.01" value="<%= price %>" required><br/>
        <button type="submit">Update Medicine</button>
    </form>
</body>
</html>
