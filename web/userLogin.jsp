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
                    <li class="active"><a href="signIn.jsp">Sign In</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
            </nav>
        </header>
        <div class="min-h-150 flex items-center justify-center">
            <div class="card bg-white shadow-lg p-12 rounded-md w-full max-w-md">
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
        <!--Footer Section-->
        <footer class="site-footer">
            <div class="footer-container">
                <!-- Logo & Title -->
                <div class="footer-section footer-logo">
                    <img src="images/logo.png" alt="Hospital Logo" class="footer-logo-img">
                    <p class="footer-title">MediLab Hospital</p>
                </div>
                <!-- Quick Links -->
                <div class="footer-section footer-links">
                    <h3 class="footer-heading">Quick Links</h3>
                    <ul class="footer-list">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="services.jsp">Services</a></li>
                        <li><a href="about.jsp">About Us</a></li>
                        <li><a href="contact.jsp">Contact Us</a></li>
                    </ul>
                </div>
                <!-- Hours -->
                <div class="footer-section footer-hours">
                    <h3 class="footer-heading">Hours</h3>
                    <ul class="footer-list">
                        <li>Monday - Friday: 9:00 - 18:00</li>
                        <li>Saturday: 10:00 - 16:00</li>
                        <li>Sunday: Closed</li>
                    </ul>
                </div>
                <!-- Contact -->
                <div class="footer-section footer-contact">
                    <h3 class="footer-heading">Contact</h3>
                    <ul class="footer-list">
                        <li><i class="fas fa-phone"></i> 000-000-000</li>
                        <li><i class="fas fa-envelope"></i> info@hospital.com</li>
                        <li><i class="fas fa-map-marker-alt"></i> Your Address Here</li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                © 2025 Hospital Management System. All Rights Reserved.
            </div>
        </footer>
    </body>
</html>
