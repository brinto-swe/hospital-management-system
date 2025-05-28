package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import com.hospital.util.DBConnection;

public final class adminAppointmentManagement_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Admin Appointment Management</title>\n");
      out.write("        <!-- Tailwind CSS & DaisyUI -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/daisyui@5\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css\">\n");
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
      out.write("                        <a href=\"userRequestManagement.jsp\" class=\"nav__link \">\n");
      out.write("                            <i class=\"fa-solid fa-person-circle-question fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">User Request Management</span>\n");
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
      out.write("                            <i class=\"fa-solid fa-address-book fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
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
      out.write("\n");
      out.write("        <div class=\"main-content p-6\" id=\"main-content\">\n");
      out.write("            <div class=\"mb-6 space-y-4\">\n");
      out.write("                <div>\n");
      out.write("                    <a href=\"adminAppointmentManagement.jsp\" class=\"btn btn-primary\">See All Appointments</a>\n");
      out.write("                </div>\n");
      out.write("                <div>\n");
      out.write("                    <form method=\"get\" action=\"adminAppointmentManagement.jsp\" class=\"flex items-center space-x-4\">\n");
      out.write("                        <label for=\"dateFilter\" class=\"text-gray-700\">By Date:</label>\n");
      out.write("                        <input type=\"date\" id=\"dateFilter\" name=\"filterDate\" class=\"input input-bordered\">\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-secondary\">Filter</button>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("                <div>\n");
      out.write("                    <form method=\"get\" action=\"adminAppointmentManagement.jsp\" class=\"flex items-center space-x-4\">\n");
      out.write("                        <label for=\"doctorFilter\" class=\"text-gray-700\">By Doctor ID:</label>\n");
      out.write("                        <input type=\"text\" id=\"doctorFilter\" name=\"filterDoctor\" placeholder=\"Doctor ID\" class=\"input input-bordered\">\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-secondary\">Filter</button>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("                <div>\n");
      out.write("                    <form method=\"get\" action=\"adminAppointmentManagement.jsp\" class=\"flex items-center space-x-4\">\n");
      out.write("                        <label for=\"deptFilter\" class=\"text-gray-700\">By Department:</label>\n");
      out.write("                        <select id=\"deptFilter\" name=\"filterDept\" class=\"select select-bordered\">\n");
      out.write("                            <option value=\"\">--Select Department--</option>\n");
      out.write("                            ");

                                Connection conDep = null;
                                PreparedStatement psDep = null;
                                ResultSet rsDep = null;
                                try {
                                    conDep = DBConnection.getConnection();
                                    psDep = conDep.prepareStatement("SELECT DEPT_ID, DEPT_NAME FROM DEPARTMENTS");
                                    rsDep = psDep.executeQuery();
                                    while (rsDep.next()) {
                                        String depId = rsDep.getString("DEPT_ID");
                                        String depName = rsDep.getString("DEPT_NAME");
                            
      out.write("\n");
      out.write("                            <option value=\"");
      out.print( depId);
      out.write('"');
      out.write('>');
      out.print( depName);
      out.write(' ');
      out.write('(');
      out.print( depId);
      out.write(")</option>\n");
      out.write("                            ");

                                    }
                                } catch (Exception e) {
                                    out.println("<option>Error Loading Departments</option>");
                                } finally {
                                    if (rsDep != null) {
                                        try {
                                            rsDep.close();
                                        } catch (Exception ex) {
                                        }
                                    }
                                    if (psDep != null) {
                                        try {
                                            psDep.close();
                                        } catch (Exception ex) {
                                        }
                                    }
                                    if (conDep != null) {
                                        try {
                                            conDep.close();
                                        } catch (Exception ex) {
                                        }
                                    }
                                }
                            
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-secondary\">Filter</button>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!-- Appointments Table -->\n");
      out.write("            <div class=\"overflow-x-auto\">\n");
      out.write("                <table class=\"table w-full\">\n");
      out.write("                    <thead class=\"bg-blue-600 text-white\">\n");
      out.write("                        <tr>\n");
      out.write("                            <th>Appointment ID</th>\n");
      out.write("                            <th>Doctor ID</th>\n");
      out.write("                            <th>Doctor Name</th>\n");
      out.write("                            <th>Department</th>\n");
      out.write("                            <th>Appointment Date</th>\n");
      out.write("                            <th>Appointment Time</th>\n");
      out.write("                            <th>Status</th>\n");
      out.write("                            <!-- Add additional action buttons as needed -->\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        ");

                            String filterDate = request.getParameter("filterDate");
                            String filterDoctor = request.getParameter("filterDoctor");
                            String filterDept = request.getParameter("filterDept");

                            Connection conApp = null;
                            PreparedStatement psApp = null;
                            ResultSet rsApp = null;
                            String query = "SELECT a.APPOINTMENT_ID, a.DOCTOR_ID, d.DOCTOR_NAME, d.DEPT_ID, dept.DEPT_NAME, a.APPOINTMENT_DATE, a.APPOINTMENT_TIME, a.STATUS "
                                    + "FROM APPOINTMENTS a "
                                    + "JOIN DOCTORS d ON a.DOCTOR_ID = d.DOCTOR_ID "
                                    + "JOIN DEPARTMENTS dept ON d.DEPT_ID = dept.DEPT_ID ";

                            String whereClause = "";
                            if (filterDate != null && !filterDate.trim().isEmpty()) {
                                whereClause += " a.APPOINTMENT_DATE = ? ";
                            }
                            if (filterDoctor != null && !filterDoctor.trim().isEmpty()) {
                                if (!whereClause.isEmpty()) {
                                    whereClause += " AND ";
                                }
                                whereClause += " a.DOCTOR_ID = ? ";
                            }
                            if (filterDept != null && !filterDept.trim().isEmpty()) {
                                if (!whereClause.isEmpty()) {
                                    whereClause += " AND ";
                                }
                                whereClause += " d.DEPT_ID = ? ";
                            }
                            if (!whereClause.isEmpty()) {
                                query += " WHERE " + whereClause;
                            }

                            try {
                                conApp = DBConnection.getConnection();
                                psApp = conApp.prepareStatement(query);
                                int paramIndex = 1;
                                if (filterDate != null && !filterDate.trim().isEmpty()) {
                                    psApp.setString(paramIndex++, filterDate);
                                }
                                if (filterDoctor != null && !filterDoctor.trim().isEmpty()) {
                                    psApp.setString(paramIndex++, filterDoctor);
                                }
                                if (filterDept != null && !filterDept.trim().isEmpty()) {
                                    psApp.setString(paramIndex++, filterDept);
                                }
                                rsApp = psApp.executeQuery();
                                boolean hasApp = false;
                                while (rsApp.next()) {
                                    hasApp = true;
                        
      out.write("\n");
      out.write("                        <tr class=\"border-b\">\n");
      out.write("                            <td class=\"py-2 px-4\">");
      out.print( rsApp.getInt("APPOINTMENT_ID"));
      out.write("</td>\n");
      out.write("                            <td class=\"py-2 px-4\">");
      out.print( rsApp.getString("DOCTOR_ID"));
      out.write("</td>\n");
      out.write("                            <td class=\"py-2 px-4\">");
      out.print( rsApp.getString("DOCTOR_NAME"));
      out.write("</td>\n");
      out.write("                            <td class=\"py-2 px-4\">");
      out.print( rsApp.getString("DEPT_NAME"));
      out.write(' ');
      out.write('(');
      out.print( rsApp.getString("DEPT_ID"));
      out.write(")</td>\n");
      out.write("                            <td class=\"py-2 px-4\">");
      out.print( rsApp.getDate("APPOINTMENT_DATE"));
      out.write("</td>\n");
      out.write("                            <td class=\"py-2 px-4\">");
      out.print( rsApp.getTime("APPOINTMENT_TIME"));
      out.write("</td>\n");
      out.write("                            <td class=\"py-2 px-4\">");
      out.print( rsApp.getString("STATUS"));
      out.write("</td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");

                                }
                                if (!hasApp) {
                                    out.println("<tr><td colspan='7' class='text-center'>No appointments found.</td></tr>");
                                }
                            } catch (Exception e) {
                                out.println("<tr><td colspan='7' class='text-red-500 py-2 px-4'>Error: " + e.getMessage() + "</td></tr>");
                            } finally {
                                if (rsApp != null) {
                                    try {
                                        rsApp.close();
                                    } catch (Exception ex) {
                                    }
                                }
                                if (psApp != null) {
                                    try {
                                        psApp.close();
                                    } catch (Exception ex) {
                                    }
                                }
                                if (conApp != null) {
                                    try {
                                        conApp.close();
                                    } catch (Exception ex) {
                                    }
                                }
                            }
                        
      out.write("\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <script src=\"js/script.js\"></script>\n");
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
