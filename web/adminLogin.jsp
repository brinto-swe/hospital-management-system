<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Login</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
</head>
<body class="bg-gray-100">
  <div class="min-h-screen flex items-center justify-center">
    <div class="card bg-white shadow-lg p-6 rounded-md w-full max-w-md">
      <h2 class="text-2xl font-bold mb-4 text-center">Admin Login</h2>
      <form action="AdminLoginServlet" method="post" class="space-y-4">
        <div>
          <label for="adminId" class="block text-sm font-medium">Admin ID:</label>
          <input type="text" id="adminId" name="adminId" required class="input input-bordered w-full">
        </div>
        <div>
          <label for="password" class="block text-sm font-medium">Password:</label>
          <input type="password" id="password" name="password" required class="input input-bordered w-full">
        </div>
        <button type="submit" class="btn btn-primary w-full">Login as Admin</button>
      </form>
    </div>
  </div>
</body>
</html>
