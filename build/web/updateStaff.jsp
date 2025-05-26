<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Update Staff Member</title>
  <!-- Tailwind CSS & DaisyUI -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="min-h-screen flex items-center justify-center bg-gray-100">
<%
    // Retrieve the "staffId" from the query string.
    String staffIdParam = request.getParameter("staffId");
    if(staffIdParam == null || staffIdParam.trim().isEmpty()) {
        out.println("<p class='text-red-500 text-center p-4'>Error: No staff ID provided.</p>");
        return;
    }
    
    int staffId = 0;
    try {
        staffId = Integer.parseInt(staffIdParam);
    } catch(NumberFormatException e) {
        out.println("<p class='text-red-500 text-center p-4'>Error: Invalid staff ID format.</p>");
        return;
    }
    
    // Initialize variables to load the staff information.
    String name = "";
    String position = "";
    String contact = "";
    String departmentId = "";
    
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    try {
        con = DBConnection.getConnection();
        String sql = "SELECT name, position, department_id, contact FROM STAFF WHERE staff_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, staffId);
        rs = ps.executeQuery();
        if(rs.next()){
            name = rs.getString("name");
            position = rs.getString("position");
            departmentId = rs.getString("department_id");
            contact = rs.getString("contact");
        } else {
            out.println("<p class='text-red-500 text-center p-4'>Error: Staff record not found.</p>");
            return;
        }
    } catch(Exception e) {
        out.println("<p class='text-red-500 text-center p-4'>Database Error: " + e.getMessage() + "</p>");
        return;
    } finally {
        if(rs != null) { try { rs.close(); } catch(Exception ex) {} }
        if(ps != null) { try { ps.close(); } catch(Exception ex) {} }
        if(con != null) { try { con.close(); } catch(Exception ex) {} }
    }
%>

<div class="container mx-auto p-6">
  <div class="max-w-md mx-auto bg-white shadow-xl rounded-lg p-6">
    <h2 class="text-2xl font-bold mb-4 text-center">Update Staff Member</h2>
    <!-- The form posts to UpdateStaffServlet -->
    <form action="UpdateStaffServlet" method="post" class="space-y-4">
      <!-- Hidden field for staffId -->
      <input type="hidden" name="staffId" value="<%= staffId %>">
      
      <div>
         <label class="block text-sm font-medium">Name:</label>
         <input type="text" name="name" value="<%= name %>" required class="input input-bordered w-full">
      </div>
      
      <div>
         <label class="block text-sm font-medium">Position:</label>
         <input type="text" name="position" value="<%= position %>" required class="input input-bordered w-full">
      </div>
      
      <div>
         <label class="block text-sm font-medium">Department:</label>
         <select name="department_id" class="select select-bordered w-full" required>
         <%
            // Load department options from DEPARTMENTS table.
            Connection conDep = null;
            PreparedStatement psDep = null;
            ResultSet rsDep = null;
            try {
                conDep = DBConnection.getConnection();
                String sqlDep = "SELECT DEPT_ID, DEPT_NAME FROM DEPARTMENTS";
                psDep = conDep.prepareStatement(sqlDep);
                rsDep = psDep.executeQuery();
                while(rsDep.next()){
                    String depId = rsDep.getString("DEPT_ID");
                    String depName = rsDep.getString("DEPT_NAME");
         %>
            <option value="<%= depId %>" <%= (depId.equals(departmentId)) ? "selected" : "" %>>
                <%= depName %> (ID: <%= depId %>)
            </option>
         <%
                }
            } catch(Exception e) {
                out.println("<option>Error Loading Departments</option>");
            } finally {
                if(rsDep != null) { try { rsDep.close(); } catch(Exception ex) {} }
                if(psDep != null) { try { psDep.close(); } catch(Exception ex) {} }
                if(conDep != null) { try { conDep.close(); } catch(Exception ex) {} }
            }
         %>
         </select>
      </div>
      
      <div>
         <label class="block text-sm font-medium">Contact:</label>
         <input type="text" name="contact" value="<%= contact %>" required class="input input-bordered w-full">
      </div>
      
      <div>
         <button type="submit" class="btn btn-primary w-full">Update Staff</button>
      </div>
    </form>
  </div>
</div>
</body>
</html>
