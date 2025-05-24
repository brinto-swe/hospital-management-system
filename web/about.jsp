<%-- 
    Document   : about
    Created on : May 22, 2025, 4:13:11 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>About Us - MediLab Hospital</title>
        <!-- Tailwind CSS & DaisyUI -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>
    <body>
        <header>
            <div class="logo">
                <img src="images/logo.png" alt="MediLab Hospital" style="height:40px;">
            </div>
            <nav class="homepage-nav">
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li  class="active"><a href="about.jsp">About Us</a></li>
                    <li><a href="signup.jsp">Sign Up</a></li>
                    <li><a href="signIn.jsp">Sign In</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
            </nav>
        </header>

        <section id="about">
            <h1>About MediLab Hospital</h1>
            <p>
                We help people get appointments online with a focus on quality healthcare,
                state-of-the-art laboratory facilities, and expert doctors.
            </p>
            <a href="contact.jsp" class="btn">Contact Us</a>
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

