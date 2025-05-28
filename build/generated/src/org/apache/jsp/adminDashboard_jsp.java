package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class adminDashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <title>Admin Dashboard - MediLab Hospital</title>\n");
      out.write("        <!-- Tailwind CSS & DaisyUI -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/daisyui@5\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css\">\n");
      out.write("        <style>\n");
      out.write("            .sidebar { width: 200px; float: left; background: #333; min-height: 100vh; padding: 20px; }\n");
      out.write("            .sidebar a { display: block; color: #fff; padding: 10px; text-decoration: none; }\n");
      out.write("            .sidebar a:hover { background: #575757; }\n");
      out.write("            .content { margin-left: 220px; padding: 20px; }\n");
      out.write("            .metrics { display: flex; justify-content: space-around; margin-bottom: 20px; }\n");
      out.write("            .metric { background: #005a8d; color: #fff; padding: 15px; border-radius: 4px; width: 22%; text-align: center; }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <header class=\"flex none\">\n");
      out.write("            <div class=\"\">\n");
      out.write("                <img src=\"images/logo.png\" alt=\"MediLab Hospital\" style=\"height:40px;\">\n");
      out.write("            </div>\n");
      out.write("            <h1 class=\"text-3xl font-bold\">Admin Appointment Management</h1>\n");
      out.write("            <a href=\"logout.jsp\">\n");
      out.write("                <i class=\"fa-solid fa-right-from-bracket\"></i>\n");
      out.write("                <span>Logout</span>\n");
      out.write("            </a>\n");
      out.write("        </header>\n");
      out.write("        <div class=\"l-navbar\" id=\"navbar\">\n");
      out.write("            <nav class=\"nav\">\n");
      out.write("                <div>\n");
      out.write("\n");
      out.write("                    <div class=\"nav__toggle\" id=\"nav-toggle\">\n");
      out.write("                        <i class=\"fas fa-angle-double-right\"></i>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"nav__list\">\n");
      out.write("                        <a href=\"adminDashboard.jsp\" class=\"nav__link active\">\n");
      out.write("                            <i class=\"fa-solid fa-gauge-high fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">Dashboard</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"staffManagement.jsp\" class=\"nav__link\">\n");
      out.write("                            <i class=\"fa-solid fa-user-group fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">Staff Management</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"labManagement.jsp\" class=\"nav__link \">\n");
      out.write("                            <i class=\"fa-solid fa-flask fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">Lab Management</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"wardManagement.jsp\" class=\"nav__link \">\n");
      out.write("                            <i class=\"fa-solid fa-house-medical-circle-check fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">Ward Management</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"treatmentManagement.jsp\" class=\"nav__link \">\n");
      out.write("                            <i class=\"fa-solid fa-notes-medical fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">Treatment Management</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"pharmacyManagement.jsp\" class=\"nav__link \">\n");
      out.write("                            <i class=\"fa-solid fa-house-medical-flag fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">Pharmacy Management</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"patientManagement.jsp\" class=\"nav__link \">\n");
      out.write("                            <i class=\"fa-solid fa-bed fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">Patient Management</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"pharmacyInvoice.jsp\" class=\"nav__link \">\n");
      out.write("                            <i class=\"fa-solid fa-receipt fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">Pharmacy Invoice</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"pharmacySupplier.jsp\" class=\"nav__link \">\n");
      out.write("                            <i class=\"fa-solid fa-boxes-packing fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">Pharmacy Supplier</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"departmentManagement.jsp\" class=\"nav__link \">\n");
      out.write("                            <i class=\"fa-solid fa-building-user fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">Department Management</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"prescriptionManagement.jsp\" class=\"nav__link \">\n");
      out.write("                            <i class=\"fa-solid fa-file-medical fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">Prescription Management</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"adminAppointmentManagement.jsp\" class=\"nav__link \">\n");
      out.write("                            <i class=\"fa-solid fa-person-circle-question fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">Appointment Management</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"doctorsManagement.jsp\" class=\"nav__link \">\n");
      out.write("                            <i class=\"fa-solid fa-user-doctor fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">Doctor Management</span>\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </nav>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"main-content p-6\" id=\"main-content\">\n");
      out.write("            <div class=\"content\">\n");
      out.write("                <h2>Dashboard</h2>\n");
      out.write("                <div class=\"metrics\">\n");
      out.write("                    <div class=\"metric\">\n");
      out.write("                        <h3>Total Patients</h3>\n");
      out.write("                        <p>41,234</p>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"metric\">\n");
      out.write("                        <h3>Total Doctors</h3>\n");
      out.write("                        <p>1,234</p>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"metric\">\n");
      out.write("                        <h3>Total Wards</h3>\n");
      out.write("                        <p>234</p>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"metric\">\n");
      out.write("                        <h3>Total Labs</h3>\n");
      out.write("                        <p>56</p>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <h3>Patient Trends (Last 7 Days)</h3>\n");
      out.write("                <!-- Placeholder for a dynamic chart -->\n");
      out.write("                <img src=\"images/chart_placeholder.png\" alt=\"Patient Trends\" style=\"width:100%; max-width:600px;\">\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <script src=\"js/script.js\"></script>\n");
      out.write("\n");
      out.write("        <footer style=\"clear:both; text-align:center;\">\n");
      out.write("            <p>© 2025 MediLab Hospital. All rights reserved.</p>\n");
      out.write("        </footer>\n");
      out.write("    </body>\n");
      out.write("</html>");
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
