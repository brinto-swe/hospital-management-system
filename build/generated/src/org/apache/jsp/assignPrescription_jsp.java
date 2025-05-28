package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import com.hospital.util.DBConnection;

public final class assignPrescription_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Assign Prescription</title>\n");
      out.write("        <!-- Tailwind CSS & DaisyUI -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/daisyui@5\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css\">\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            function addTreatment(){\n");
      out.write("                var select = document.getElementById(\"treatmentSelect\");\n");
      out.write("                var selectedValue = select.options[select.selectedIndex].value;\n");
      out.write("                var treatmentField = document.getElementById(\"treatmentList\");\n");
      out.write("                // Append value with comma separation if field already has data.\n");
      out.write("                if (treatmentField.value === \"\") {\n");
      out.write("                    treatmentField.value = selectedValue;\n");
      out.write("                } else {\n");
      out.write("                    treatmentField.value += \", \" + selectedValue;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("    \n");
      out.write("            function addMedicine(){\n");
      out.write("                var select = document.getElementById(\"medicineSelect\");\n");
      out.write("                var selectedValue = select.options[select.selectedIndex].value;\n");
      out.write("                var medicineField = document.getElementById(\"medicineList\");\n");
      out.write("                if (medicineField.value === \"\") {\n");
      out.write("                    medicineField.value = selectedValue;\n");
      out.write("                } else {\n");
      out.write("                    medicineField.value += \", \" + selectedValue;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body class=\"bg-gray-100\">\n");
      out.write("        <header class=\"flex none\">\n");
      out.write("            <div class=\"\">\n");
      out.write("                <img src=\"images/logo.png\" alt=\"MediLab Hospital\" style=\"height:40px;\">\n");
      out.write("            </div>\n");
      out.write("            <h1 class=\"text-3xl font-bold\">Assign Lab Test</h1>\n");
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
      out.write("                        <a href=\"doctorAppointment.jsp\" class=\"nav__link \">\n");
      out.write("                            <i class=\"fa-solid fa-gauge-high fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">My Appointments</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"assignLabTest.jsp\" class=\"nav__link\">\n");
      out.write("                            <i class=\"fa-solid fa-flask fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">Assign Lab Test</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"doctorsLabReports.jsp\" class=\"nav__link \">\n");
      out.write("                            <i class=\"fa-solid fa-flask fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">View Lab Results</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"assignPrescription.jsp\" class=\"nav__link active\">\n");
      out.write("                            <i class=\"fa-solid fa-file-medical fa-lg nav__icon\" style=\"color: #ffffff;\"></i>\n");
      out.write("                            <span class=\"nav__text\">Prescription Management</span>\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </nav>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"main-content p-6\" id=\"main-content\">\n");
      out.write("            <h1 class=\"text-2xl font-bold mb-4\">Assign Prescription</h1>\n");
      out.write("            <form action=\"PrescriptionServlet\" method=\"post\" class=\"space-y-4\">\n");
      out.write("\n");
      out.write("                <!-- Basic Information -->\n");
      out.write("                <div>\n");
      out.write("                    <label for=\"userId\" class=\"block text-sm font-medium\">User ID:</label>\n");
      out.write("                    <input type=\"text\" id=\"userId\" name=\"userId\" required class=\"input input-bordered w-full\">\n");
      out.write("                </div>\n");
      out.write("                <div>\n");
      out.write("                    <label for=\"appointmentId\" class=\"block text-sm font-medium\">Appointment ID:</label>\n");
      out.write("                    <input type=\"number\" id=\"appointmentId\" name=\"appointmentId\" required class=\"input input-bordered w-full\">\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <!-- Treatment Section -->\n");
      out.write("                <div>\n");
      out.write("                    <label class=\"block text-sm font-medium\">Select Treatment:</label>\n");
      out.write("                    <div class=\"flex space-x-2\">\n");
      out.write("                        <select id=\"treatmentSelect\" class=\"select select-bordered\">\n");
      out.write("                            ");

                                // Retrieve treatments from TREATMENT table
                                Connection con = null;
                                PreparedStatement ps = null;
                                ResultSet rs = null;
                                try {
                                    con = DBConnection.getConnection();
                                    String sql = "SELECT TREATMENT_ID, TREATMENT_NAME FROM TREATMENT";
                                    ps = con.prepareStatement(sql);
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                                        String tid = rs.getString("TREATMENT_ID");
                                        String tname = rs.getString("TREATMENT_NAME");
                            
      out.write("\n");
      out.write("                            <option value=\"");
      out.print( tid);
      out.write('"');
      out.write('>');
      out.print( tname);
      out.write(" (ID: ");
      out.print( tid);
      out.write(")</option>\n");
      out.write("                            ");

                                    }
                                } catch (Exception e) {
                                    out.println("<option>Error loading treatments</option>");
                                } finally {
                                    if (rs != null) {
                                        try {
                                            rs.close();
                                        } catch (Exception ex) {
                                        }
                                    }
                                    if (ps != null) {
                                        try {
                                            ps.close();
                                        } catch (Exception ex) {
                                        }
                                    }
                                    if (con != null) {
                                        try {
                                            con.close();
                                        } catch (Exception ex) {
                                        }
                                    }
                                }
                            
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                        <button type=\"button\" class=\"btn btn-secondary\" onclick=\"addTreatment()\">Add Treatment</button>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"mt-2\">\n");
      out.write("                        <input type=\"text\" id=\"treatmentList\" name=\"treatmentIds\" readonly placeholder=\"Selected Treatment IDs will appear here\" class=\"input input-bordered w-full\">\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <!-- Medicine Section -->\n");
      out.write("                <div>\n");
      out.write("                    <label class=\"block text-sm font-medium\">Select Medicine:</label>\n");
      out.write("                    <div class=\"flex space-x-2\">\n");
      out.write("                        <select id=\"medicineSelect\" class=\"select select-bordered\">\n");
      out.write("                            ");

                                // Retrieve medicines from MEDICINE table
                                Connection con2 = null;
                                PreparedStatement ps2 = null;
                                ResultSet rs2 = null;
                                try {
                                    con2 = DBConnection.getConnection();
                                    String sql2 = "SELECT MEDICINE_ID, MEDICINE_NAME FROM MEDICINE";
                                    ps2 = con2.prepareStatement(sql2);
                                    rs2 = ps2.executeQuery();
                                    while (rs2.next()) {
                                        String mid = rs2.getString("MEDICINE_ID");
                                        String mname = rs2.getString("MEDICINE_NAME");
                            
      out.write("\n");
      out.write("                            <option value=\"");
      out.print( mid);
      out.write('"');
      out.write('>');
      out.print( mname);
      out.write(" (ID: ");
      out.print( mid);
      out.write(")</option>\n");
      out.write("                            ");

                                    }
                                } catch (Exception e) {
                                    out.println("<option>Error loading medicines</option>");
                                } finally {
                                    if (rs2 != null) {
                                        try {
                                            rs2.close();
                                        } catch (Exception ex) {
                                        }
                                    }
                                    if (ps2 != null) {
                                        try {
                                            ps2.close();
                                        } catch (Exception ex) {
                                        }
                                    }
                                    if (con2 != null) {
                                        try {
                                            con2.close();
                                        } catch (Exception ex) {
                                        }
                                    }
                                }
                            
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                        <button type=\"button\" class=\"btn btn-secondary\" onclick=\"addMedicine()\">Add Medicine</button>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"mt-2\">\n");
      out.write("                        <input type=\"text\" id=\"medicineList\" name=\"medicineIds\" readonly placeholder=\"Selected Medicine IDs will appear here\" class=\"input input-bordered w-full\">\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <!-- Remaining Fields -->\n");
      out.write("                <div>\n");
      out.write("                    <label for=\"instructions\" class=\"block text-sm font-medium\">Special Instructions:</label>\n");
      out.write("                    <textarea id=\"instructions\" name=\"instructions\" class=\"textarea textarea-bordered w-full\" placeholder=\"Enter instructions if any\"></textarea>\n");
      out.write("                </div>\n");
      out.write("                <div>\n");
      out.write("                    <label for=\"issueDate\" class=\"block text-sm font-medium\">Issued Date:</label>\n");
      out.write("                    <input type=\"date\" id=\"issueDate\" name=\"issueDate\" required class=\"input input-bordered w-full\">\n");
      out.write("                </div>\n");
      out.write("                <div>\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-primary w-full\">Assign Prescription</button>\n");
      out.write("                </div>\n");
      out.write("            </form>\n");
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
