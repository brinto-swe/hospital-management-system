<%-- 
    Document   : doctorLogin
    Created on : May 26, 2025, 6:11:24 AM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Doctor Login</title>
        <!-- Tailwind CSS & DaisyUI -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>
    <body class="bg-gray-100">
        <div class="min-h-screen flex items-center justify-center">
            <div class="card bg-white shadow-lg p-6 rounded-md w-full max-w-md">
                <h2 class="text-2xl font-bold mb-4 text-center">Doctor Login</h2>
                <form action="DoctorLoginServlet" method="post" class="space-y-4">
                    <div>
                        <label for="doctorId" class="block text-sm font-medium">Doctor ID:</label>
                        <input type="text" id="doctorId" name="doctorId" required class="input input-bordered w-full">
                    </div>
                    <div>
                        <label for="doctorPassword" class="block text-sm font-medium">Password:</label>
                        <input type="password" id="doctorPassword" name="doctorPassword" required class="input input-bordered w-full">
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary w-full">Login</button>
                    </div>
                </form>
                <div class="mt-4 text-center">
                    <a href="signIn.jsp" class="text-blue-600 hover:underline">Back to Sign In Options</a>
                </div>
            </div>
        </div>
    </body>
</html>
