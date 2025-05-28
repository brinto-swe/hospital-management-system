package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import com.hospital.util.DBConnection;

public final class userAppointment_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>User Appointment</title>\n");
      out.write("        <!-- Tailwind CSS & DaisyUI -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/daisyui@5\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css\">\n");
      out.write("        <style>\n");
      out.write("            .card{\n");
      out.write("                width: 600px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
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
      out.write("                    <li class=\"active\"><a href=\"userAppoinment.jsp\">Appoinment</a></li>\n");
      out.write("                    <li><a href=\"contact.jsp\">Contact</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </nav>\n");
      out.write("        </header>\n");
      out.write("\n");
      out.write("        <div class=\"container mx-auto place-items-center p-6\">\n");
      out.write("            <!-- Step 1: Select Date, Time, and Department -->\n");
      out.write("            <div class=\"card bg-white shadow-lg p-6 rounded mb-6 items-center\">\n");
      out.write("                <h2 class=\"text-2xl font-bold mb-4\">Step 1: Select Details</h2>\n");
      out.write("                <form method=\"post\" action=\"userAppointment.jsp\">\n");
      out.write("                    <div class=\"mb-4\">\n");
      out.write("                        <label for=\"apptDate\" class=\"block text-gray-700\">Appointment Date:</label>\n");
      out.write("                        <input type=\"date\" id=\"apptDate\" name=\"apptDate\" required class=\"input input-bordered w-lg\" value=\"");
      out.print( request.getParameter("apptDate") != null ? request.getParameter("apptDate") : "");
      out.write("\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"mb-4\">\n");
      out.write("                        <label for=\"apptTime\" class=\"block text-gray-700\">Appointment Time:</label>\n");
      out.write("                        <input type=\"time\" id=\"apptTime\" name=\"apptTime\" required class=\"input input-bordered w-lg\" value=\"");
      out.print( request.getParameter("apptTime") != null ? request.getParameter("apptTime") : "");
      out.write("\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"mb-4\">\n");
      out.write("                        <label for=\"deptId\" class=\"block text-gray-700\">Department:</label>\n");
      out.write("                        <select id=\"deptId\" name=\"deptId\" required class=\"select select-bordered w-lg\">\n");
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
      out.write(' ');
      out.print( (request.getParameter("deptId") != null && request.getParameter("deptId").equals(depId)) ? "selected" : "");
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
      out.write("                    </div>\n");
      out.write("                    <div class=\"mb-4\">\n");
      out.write("                        <button type=\"submit\" name=\"btn\" value=\"getDoctors\" class=\"btn btn-main w-lg\">Get Available Doctors</button>\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!-- Step 2: Display Available Doctors and Book Appointment -->\n");
      out.write("            ");

                String btn = request.getParameter("btn");
                String apptDate = request.getParameter("apptDate");
                String apptTime = request.getParameter("apptTime");
                String selectedDeptId = request.getParameter("deptId");
                java.util.List<String[]> availableDoctors = new java.util.ArrayList<String[]>();

                if ("getDoctors".equals(btn) && apptDate != null && apptTime != null && selectedDeptId != null) {
                    Connection con = null;
                    PreparedStatement psDoctor = null;
                    ResultSet rsDoctor = null;
                    try {
                        con = DBConnection.getConnection();
                        // Select doctors in department with appointment time between their active hours.
                        String sqlDoctor = "SELECT * FROM DOCTORS WHERE DEPT_ID = ? AND START_TIME <= ? AND END_TIME >= ?";
                        psDoctor = con.prepareStatement(sqlDoctor);
                        psDoctor.setString(1, selectedDeptId);
                        psDoctor.setString(2, apptTime);
                        psDoctor.setString(3, apptTime);
                        rsDoctor = psDoctor.executeQuery();
                        while (rsDoctor.next()) {
                            String doctorId = rsDoctor.getString("DOCTOR_ID");
                            String doctorName = rsDoctor.getString("DOCTOR_NAME");
                            // Check capacity: maximum 10 appointments per doctor per day.
                            String cntSql = "SELECT COUNT(*) AS cnt FROM APPOINTMENTS WHERE DOCTOR_ID = ? AND APPOINTMENT_DATE = ?";
                            PreparedStatement psCnt = con.prepareStatement(cntSql);
                            psCnt.setString(1, doctorId);
                            psCnt.setString(2, apptDate);
                            ResultSet rsCnt = psCnt.executeQuery();
                            int count = 0;
                            if (rsCnt.next()) {
                                count = rsCnt.getInt("cnt");
                            }
                            rsCnt.close();
                            psCnt.close();
                            if (count < 10) {
                                availableDoctors.add(new String[]{doctorId, doctorName});
                            }
                        }
                    } catch (Exception e) {
                        out.println("<p class='text-red-500'>Error: " + e.getMessage() + "</p>");
                    } finally {
                        if (rsDoctor != null) {
                            try {
                                rsDoctor.close();
                            } catch (Exception ex) {
                            }
                        }
                        if (psDoctor != null) {
                            try {
                                psDoctor.close();
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
                }

                if (availableDoctors.size() > 0) {
            
      out.write("\n");
      out.write("            <div class=\"card bg-white shadow-lg p-6 rounded items-center\">\n");
      out.write("                <h2 class=\"text-2xl font-bold mb-4\">Step 2: Select Doctor & Confirm Appointment</h2>\n");
      out.write("                <form action=\"BookAppointmentServlet\" method=\"post\" class=\"space-y-4\">\n");
      out.write("                    <input type=\"hidden\" name=\"apptDate\" value=\"");
      out.print( apptDate);
      out.write("\">\n");
      out.write("                    <input type=\"hidden\" name=\"apptTime\" value=\"");
      out.print( apptTime);
      out.write("\">\n");
      out.write("                    <input type=\"hidden\" name=\"deptId\" value=\"");
      out.print( selectedDeptId);
      out.write("\">\n");
      out.write("                    <div class=\"mb-4\">\n");
      out.write("                        <label for=\"doctorId\" class=\"block text-gray-700\">Available Doctors:</label>\n");
      out.write("                        <select id=\"doctorId\" name=\"doctorId\" required class=\"select select-bordered w-lg\">\n");
      out.write("                            ");

                                for (String[] doc : availableDoctors) {
                            
      out.write("\n");
      out.write("                            <option value=\"");
      out.print( doc[0]);
      out.write('"');
      out.write('>');
      out.print( doc[1]);
      out.write(' ');
      out.write('(');
      out.print( doc[0]);
      out.write(")</option>\n");
      out.write("                            ");

                                }
                            
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"mb-4\">\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-main w-lg\">Book Appointment</button>\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            ");

                } else if ("getDoctors".equals(btn)) {
                    out.println("<p class='text-red-500 text-center'>No available doctor for the selected criteria or the slots are full.</p>");
                }
            
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <footer class=\"bg-gray-800 text-white text-center py-4 mt-6\">\n");
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
