package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import com.hospital.servlets.Appointment;

public final class userAppointments_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <title>My Appointments</title>\n");
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
      out.write("                        <a href=\"userAppointments.jsp\" class=\"nav__link \">\n");
      out.write("                            <i class=\"fa-solid fa-flask fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">My Appointments</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"userAppointment.jsp\" class=\"nav__link active\">\n");
      out.write("                            <i class=\"fa-solid fa-gauge-high fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">Take Appointment</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"userPrescription.jsp\" class=\"nav__link \">\n");
      out.write("                            <i class=\"fa-solid fa-flask fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">View Prescriptions</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"invoice.jsp\" class=\"nav__link \">\n");
      out.write("                            <i class=\"fa-solid fa-notes-medical fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">Invoice</span>\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </nav>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"main-content p-6\" id=\"main-content\">\n");
      out.write("            <h1 class=\"text-2xl font-bold mb-4\">My Appointments</h1>\n");
      out.write("\n");
      out.write("            <!-- Display error message if any -->\n");
      out.write("            ");

                String error = (String) request.getAttribute("error");
                if (error != null && !error.isEmpty()) {
            
      out.write("\n");
      out.write("            <p class=\"text-red-600\">");
      out.print( error);
      out.write("</p>\n");
      out.write("            ");

                }
            
      out.write("\n");
      out.write("\n");
      out.write("            <table class=\"table w-full bg-white shadow-md rounded\">\n");
      out.write("                <thead class=\"bg-blue-600 text-white\">\n");
      out.write("                    <tr>\n");
      out.write("                        <th>Appointment ID</th>\n");
      out.write("                        <th>Date</th>\n");
      out.write("                        <th>Time</th>\n");
      out.write("                        <th>Doctor ID</th>\n");
      out.write("                        <th>Status</th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody>\n");
      out.write("                    ");

                        ArrayList<Appointment> appointmentList = (ArrayList<Appointment>) request.getAttribute("appointmentList");
                        if (appointmentList != null && appointmentList.size() > 0) {
                            for (Appointment app : appointmentList) {
                    
      out.write("\n");
      out.write("                    <tr class=\"border-b\">\n");
      out.write("                        <td>");
      out.print( app.getAppointmentId());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( app.getAppointmentDate());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( app.getAppointmentTime());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( app.getDoctorId());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( app.getStatus());
      out.write("</td>\n");
      out.write("                    </tr>\n");
      out.write("                    ");

                        }
                    } else {
                    
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td colspan=\"5\" class=\"text-center\">No appointments found.</td>\n");
      out.write("                    </tr>\n");
      out.write("                    ");
            }
                    
      out.write("\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("        <script src=\"js/script.js\"></script>\n");
      out.write("\n");
      out.write("        <footer style=\"clear:both; text-align:center;\">\n");
      out.write("            <p>© 2025 MediLab Hospital. All rights reserved.</p>\n");
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
