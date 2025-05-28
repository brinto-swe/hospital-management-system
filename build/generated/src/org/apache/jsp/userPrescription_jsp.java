package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class userPrescription_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <title>View Your Prescription</title>\n");
      out.write("        <!-- Tailwind CSS & DaisyUI -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/daisyui@5\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css\">\n");
      out.write("    </head>\n");
      out.write("    <body class=\"bg-gray-100\">\n");
      out.write("        <header class=\"flex none\">\n");
      out.write("            <div class=\"\">\n");
      out.write("                <img src=\"images/logo.png\" alt=\"MediLab Hospital\" style=\"height:40px;\">\n");
      out.write("            </div>\n");
      out.write("            <h1 class=\"text-3xl font-bold\">Take Appointment</h1>\n");
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
      out.write("                    <div class=\"nav__list\">                        \n");
      out.write("                        <a href=\"assignLabTest.jsp\" class=\"nav__link \">\n");
      out.write("                            <i class=\"fa-solid fa-flask fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">My Appointments</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"userAppointment.jsp\" class=\"nav__link \">\n");
      out.write("                            <i class=\"fa-solid fa-gauge-high fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">Take Appointment</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"doctorsLabReports.jsp\" class=\"nav__link active\">\n");
      out.write("                            <i class=\"fa-solid fa-flask fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">View Prescriptions</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"treatmentManagement.jsp\" class=\"nav__link \">\n");
      out.write("                            <i class=\"fa-solid fa-notes-medical fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">Treatment Management</span>\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </nav>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"main-content p-6\" id=\"main-content\">\n");
      out.write("            <h1 class=\"text-2xl font-bold mb-4\">View Your Prescription</h1>\n");
      out.write("            <form action=\"ShowPrescriptionServlet\" method=\"get\" class=\"space-y-4 w-3xl\">\n");
      out.write("                <div>\n");
      out.write("                    <label for=\"appointmentId\" class=\"block text-sm font-medium\">Appointment ID:</label>\n");
      out.write("                    <input type=\"text\" id=\"appointmentId\" name=\"appointmentId\" required class=\"input input-bordered w-full\">\n");
      out.write("                </div>\n");
      out.write("                <div>\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-primary\">View Prescription</button>\n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("            <div>\n");
      out.write("                <p style=\"color:red;\">");
      out.print( request.getAttribute("error") != null ? request.getAttribute("error") : "");
      out.write("</p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <script src=\"js/script.js\"></script>\n");
      out.write("\n");
      out.write("        <footer style=\"clear:both; text-align:center;\">\n");
      out.write("            <p>© 2025 MediLab Hospital. All rights reserved.</p>\n");
      out.write("        </footer> \n");
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
