<%-- 
    Document   : userRequestManagement
    Created on : May 24, 2025, 12:11:50 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>User Request Management</title>
  <!-- Tailwind CSS (and DaisyUI optionally) for styling -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
</head>
<body class="bg-gray-100">
  <header class="bg-blue-600 text-white p-4">
    <h1 class="text-xl font-bold text-center">Approve User Signup Requests</h1>
  </header>
  
  <div class="container mx-auto p-6">
    <h2 class="text-2xl font-bold mb-4">Pending Users</h2>
    
    <div class="overflow-x-auto">
    <table class="table w-full border-collapse">
      <thead class="bg-blue-600 text-white">
        <tr>
          <th class="py-2 px-4">User ID</th>
          <th class="py-2 px-4">Name</th>
          <th class="py-2 px-4">Email</th>
          <th class="py-2 px-4">Status</th>
          <th class="py-2 px-4">Action</th>
        </tr>
      </thead>
      <tbody>
      <%
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT USER_ID, NAME, EMAIL, STATUS FROM USERS WHERE STATUS = 'pending'";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            boolean hasRecord = false;
            while(rs.next()){
                hasRecord = true;
                String userId = rs.getString("USER_ID");
                String name = rs.getString("NAME");
                String email = rs.getString("EMAIL");
      %>
        <tr class="border-b">
          <td class="py-2 px-4"><%= userId %></td>
          <td class="py-2 px-4"><%= name %></td>
          <td class="py-2 px-4"><%= email %></td>
          <td class="py-2 px-4"><%= rs.getString("STATUS") %></td>
          <td class="py-2 px-4">
            <!-- When admin clicks Approve, call the servlet -->
            <form action="ApproveUserServlet" method="post" class="inline">
              <input type="hidden" name="userId" value="<%= userId %>">
              <button type="submit" class="btn btn-primary">Approve</button>
            </form>
          </td>
        </tr>
      <%
            }
            if(!hasRecord){
                out.println("<tr><td colspan='5' class='text-center'>No pending signup requests.</td></tr>");
            }
        } catch(Exception e) {
            out.println("<tr><td colspan='5' class='text-red-500'>Error: " + e.getMessage() + "</td></tr>");
        } finally {
            if(rs != null) try { rs.close(); } catch(Exception ex){}
            if(ps != null) try { ps.close(); } catch(Exception ex){}
            if(con != null) try { con.close(); } catch(Exception ex){}
        }
      %>
      </tbody>
    </table>
    </div>
  </div>
</body>
</html>

