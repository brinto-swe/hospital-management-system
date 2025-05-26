<%-- 
    Document   : signup
    Created on : May 22, 2025, 4:13:33 PM
    Author     : mozad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User Sign Up - MediLab Hospital</title>
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
                    <li><a href="about.jsp">About Us</a></li>
                    <li class="active"><a href="signup.jsp">Sign Up</a></li>
                    <li><a href="signIn.jsp">Sign In</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
            </nav>
        </header>

        <section id="signup">
            <div class="hero bg-base-200 min-h-screen">
                <div class="hero-content flex-col lg:flex-row-reverse">
                    <div class="text-center lg:text-left">
                        <h1 class="text-5xl font-bold">User Registration</h1>
                        <p class="py-6">
                            After registration, your account will be reviewed by an administrator before you can book an appointment.
                        </p>
                    </div>
                    <div class="card bg-base-100 w-full max-w-sm shrink-0 shadow-2xl">
                        <div class="card-body">
                            <form class="fieldset" action="SignUpServlet" method="post">
                                <label for="name" class="label">Full Name:</label>
                                <input type="text" id="name" class="input" placeholder="Full Name" name="name" required><br/>

                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" class="input" placeholder="Email" required><br/>

                                <label for="password">Password:</label>
                                <input type="password" id="password" name="password" class="input" placeholder="Password" required><br/>

                                <label for="phone">Phone:</label>
                                <input type="text" id="phone" name="phone" class="input" placeholder="Phone" required><br/>

                                <button type="submit" class="btn btn-main mt-4">Register</button>
                            </form>
                        </div>
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

