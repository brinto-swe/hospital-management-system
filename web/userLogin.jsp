<%-- 
    Document   : userLogin
    Created on : May 24, 2025, 12:13:56 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>User Login</title>
        <!-- Tailwind CSS & DaisyUI -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>
    <body class="bg-gray-100">
        <header>
            <div class="logo">
                <img src="images/logo.png" alt="MediLab Hospital" style="height:40px;">
            </div>
            <nav class="homepage-nav">
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="about.jsp">About Us</a></li>
                    <li><a href="signup.jsp">Sign Up</a></li>
                    <li><a href="signIn.jsp">Sign In</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
            </nav>
        </header>
        <div class="min-h-150 flex items-center justify-center">
            <div class="card bg-white shadow-lg p-6 rounded-md w-full max-w-md">
                <h2 class="text-2xl font-bold mb-4 text-center">User Login</h2>
                <form action="UserLoginServlet" method="post" class="space-y-4">
                    <div>
                        <label for="userId" class="block text-sm font-medium">User ID:</label>
                        <input type="text" id="userId" name="userId" required class="input input-bordered w-full">
                    </div>
                    <div>
                        <label for="password" class="block text-sm font-medium">Password:</label>
                        <input type="password" id="password" name="password" required class="input input-bordered w-full">
                    </div>
                    <button type="submit" class="btn btn-main w-full">Login</button>
                </form>
                <div class="mt-4 text-center">
                    <a href="signup.jsp" class="text-blue-600 hover:underline">Don't have an account? Sign Up</a>
                </div>
            </div>
        </div>
    </body>
</html>
