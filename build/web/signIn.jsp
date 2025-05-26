<%-- 
    Document   : signIn
    Created on : May 24, 2025, 12:13:05 PM
    Author     : mozad
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Sign In</title>
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
        <section class="container mt-12 mx-auto place-items-center p-12 w-4xl">
            <div class="bg-white flex flex-col gap-20 shadow-lg p-12 rounded mb-6 justify-center items-center">
                <h1 class="text-6xl font-bold mb-8">Sign In</h1>
                <div class="flex flex-wrap space-x-4 gap-12 justify-center">
                    <a href="userLogin.jsp" class="btn text-center text-2xl p-12 btn-primary">Login as User</a>
                    <a href="adminLogin.jsp" class="btn text-center text-2xl p-12 btn-secondary">Login as Admin</a>
                    <a href="doctorLogin.jsp" class="btn text-center text-2xl p-12 btn-success">Login as Doctor</a>
                </div>
            </div>
        </section>
        
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
