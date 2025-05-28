package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class signIn_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <title>Sign In</title>\n");
      out.write("        <!-- Tailwind CSS & DaisyUI -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/daisyui@5\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css\">\n");
      out.write("    </head>\n");
      out.write("    <body class=\"bg-gray-100\">\n");
      out.write("        <header>\n");
      out.write("            <div class=\"logo\">\n");
      out.write("                <img src=\"images/logo.png\" alt=\"MediLab Hospital\" style=\"height:40px;\">\n");
      out.write("            </div>\n");
      out.write("            <nav class=\"homepage-nav\">\n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"index.jsp\">Home</a></li>\n");
      out.write("                    <li><a href=\"about.jsp\">About Us</a></li>\n");
      out.write("                    <li><a href=\"signup.jsp\">Sign Up</a></li>\n");
      out.write("                    <li class=\"active\"><a href=\"signIn.jsp\">Sign In</a></li>\n");
      out.write("                    <li><a href=\"contact.jsp\">Contact</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </nav>\n");
      out.write("        </header>\n");
      out.write("        <section class=\"container mt-12 mx-auto place-items-center p-12 w-4xl\">\n");
      out.write("            <div class=\"bg-white flex flex-col gap-20 shadow-lg p-12 rounded mb-6 justify-center items-center\">\n");
      out.write("                <h1 class=\"text-6xl font-bold mb-8\">Sign In</h1>\n");
      out.write("                <div class=\"flex flex-wrap space-x-4 gap-12 justify-center\">\n");
      out.write("                    <a href=\"userLogin.jsp\" class=\"btn text-center text-2xl p-12 btn-primary\">Login as User</a>\n");
      out.write("                    <a href=\"adminLogin.jsp\" class=\"btn text-center text-2xl p-12 btn-secondary\">Login as Admin</a>\n");
      out.write("                    <a href=\"doctorLogin.jsp\" class=\"btn text-center text-2xl p-12 btn-success\">Login as Doctor</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("        \n");
      out.write("        <!--Footer Section-->\n");
      out.write("        <footer class=\"site-footer\">\n");
      out.write("            <div class=\"footer-container\">\n");
      out.write("                <!-- Logo & Title -->\n");
      out.write("                <div class=\"footer-section footer-logo\">\n");
      out.write("                    <img src=\"images/logo.png\" alt=\"Hospital Logo\" class=\"footer-logo-img\">\n");
      out.write("                    <p class=\"footer-title\">MediLab Hospital</p>\n");
      out.write("                </div>\n");
      out.write("                <!-- Quick Links -->\n");
      out.write("                <div class=\"footer-section footer-links\">\n");
      out.write("                    <h3 class=\"footer-heading\">Quick Links</h3>\n");
      out.write("                    <ul class=\"footer-list\">\n");
      out.write("                        <li><a href=\"index.jsp\">Home</a></li>\n");
      out.write("                        <li><a href=\"services.jsp\">Services</a></li>\n");
      out.write("                        <li><a href=\"about.jsp\">About Us</a></li>\n");
      out.write("                        <li><a href=\"contact.jsp\">Contact Us</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("                <!-- Hours -->\n");
      out.write("                <div class=\"footer-section footer-hours\">\n");
      out.write("                    <h3 class=\"footer-heading\">Hours</h3>\n");
      out.write("                    <ul class=\"footer-list\">\n");
      out.write("                        <li>Monday - Friday: 9:00 - 18:00</li>\n");
      out.write("                        <li>Saturday: 10:00 - 16:00</li>\n");
      out.write("                        <li>Sunday: Closed</li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("                <!-- Contact -->\n");
      out.write("                <div class=\"footer-section footer-contact\">\n");
      out.write("                    <h3 class=\"footer-heading\">Contact</h3>\n");
      out.write("                    <ul class=\"footer-list\">\n");
      out.write("                        <li><i class=\"fas fa-phone\"></i> 000-000-000</li>\n");
      out.write("                        <li><i class=\"fas fa-envelope\"></i> info@hospital.com</li>\n");
      out.write("                        <li><i class=\"fas fa-map-marker-alt\"></i> Your Address Here</li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"footer-bottom\">\n");
      out.write("                © 2025 Hospital Management System. All Rights Reserved.\n");
      out.write("            </div>\n");
      out.write("        </footer>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
