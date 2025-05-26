<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*, com.hospital.util.DBConnection" %>
<%
    // Retrieve the department ID from the request parameter
    String deptId = request.getParameter("id");
    String deptName = "";
    try {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT DEPT_NAME FROM DEPARTMENTS WHERE DEPT_ID = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, deptId);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            deptName = rs.getString("DEPT_NAME");
        }
        rs.close();
        ps.close();
        con.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Department</title>
    <!-- Tailwind CSS & DaisyUI -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-gray-100">

<div class="min-h-screen flex items-center justify-center">
    <div class="card w-full max-w-md shadow-lg bg-white p-6 rounded-lg">
        <h2 class="text-2xl font-bold mb-4 text-center">Update Department</h2>
        <form action="UpdateDepartmentServlet" method="post" class="space-y-4">
            <!-- Hidden field to pass the department ID -->
            <input type="hidden" name="deptId" value="<%= deptId %>">
            
            <div>
                <label for="deptName" class="block text-sm font-bold text-gray-700 mb-1">Department Name</label>
                <input type="text" id="deptName" name="deptName" value="<%= deptName %>" required class="input input-bordered w-full">
            </div>
            
            <div>
                <button type="submit" class="btn btn-primary w-full">Update Department</button>
            </div>
        </form>
        
        <div class="mt-4 text-center">
            <a href="departmentManagement.jsp" class="text-blue-600 hover:underline">Back to Department Management</a>
        </div>
    </div>
</div>

</body>
</html>
