<%-- 
    Document   : index
    Created on : May 22, 2025, 4:05:01 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>MediLab Hospital - Home</title>
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
                    <li class="active"><a href="index.jsp">Home</a></li>
                    <li><a href="about.jsp">About Us</a></li>
                    <li><a href="signup.jsp">Sign Up</a></li>
                    <li><a href="signIn.jsp">Sign In</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
            </nav>
        </header>
        <div
            class="hero min-h-screen"
            style="background-image: url(images/hospitalBanner.jpg);"
            >
            <div class="hero-overlay"></div>
            <div class="hero-content text-neutral-content text-center">
                <div class="max-w-md">
                    <h1 class="mb-5 text-5xl font-bold">Welcome to MediLab Hospital</h1>
                    <p class="mb-5">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima sit in consectetur, dolore repellat
                        eveniet iure sint nisi similique iusto quo eum, recusandae quod neque nostrum a rerum voluptatum
                        quia totam autem ea porro assumenda adipisci. Nulla harum asperiores illo, quas pariatur
                        necessitatibus eligendi rem provident corrupti odio explicabo ipsam?
                    </p>
                    <button class="btn btn-primary"><a href="signup.jsp">Get Started</a></button>
                </div>
            </div>
        </div>
        <!-- Services Section -->
        <section class="services">
            <h2 class="text-4xl font-bold">Our Services</h2>
            <div class="service-card">
                <div class="card bg-base-100 w-96 shadow-sm">
                    <figure class="px-10 pt-10">
                        <img
                            src="images/online-consultation.png"
                            alt="Doctor"
                            class="rounded-xl" />
                    </figure>
                    <div class="card-body items-center text-center">
                        <h2 class="card-title">Online Consultation</h2>
                        <p>A card component has a figure, a body part, and inside body there are title and actions parts</p>
                    </div>
                </div>
                <div class="card bg-base-100 w-96 shadow-sm">
                    <figure class="px-10 pt-10">
                        <img
                            src="images/online-consultation.png"
                            alt="Doctor"
                            class="rounded-xl" />
                    </figure>
                    <div class="card-body items-center text-center">
                        <h2 class="card-title">Online Consultation</h2>
                        <p>A card component has a figure, a body part, and inside body there are title and actions parts</p>
                    </div>
                </div>
                <div class="card bg-base-100 w-96 shadow-sm">
                    <figure class="px-10 pt-10">
                        <img
                            src="images/online-consultation.png"
                            alt="Doctor"
                            class="rounded-xl" />
                    </figure>
                    <div class="card-body items-center text-center">
                        <h2 class="card-title">Online Consultation</h2>
                        <p>A card component has a figure, a body part, and inside body there are title and actions parts</p>
                    </div>
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

