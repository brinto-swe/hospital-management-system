package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import com.hospital.util.DBConnection;

public final class doctorsLabReports_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Doctor Lab Reports</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css\">\n");
      out.write("    </head>\n");
      out.write("    <body class=\"bg-gray-100\">\n");
      out.write("        <div class=\"container mx-auto p-6\">\n");
      out.write("            <h1 class=\"text-2xl font-bold mb-4\">Lab Reports Filter</h1>\n");
      out.write("            <!-- Filter form -->\n");
      out.write("            <form method=\"get\" action=\"DoctorLabReportsServlet\" class=\"mb-6\">\n");
      out.write("                <div class=\"grid grid-cols-1 md:grid-cols-2 gap-4\">\n");
      out.write("                    <div>\n");
      out.write("                        <label class=\"block text-sm font-medium\" for=\"appointmentId\">Appointment ID:</label>\n");
      out.write("                        <input type=\"text\" name=\"appointmentId\" id=\"appointmentId\" placeholder=\"Enter Appointment ID\"\n");
      out.write("                               class=\"input input-bordered w-full\"\n");
      out.write("                               value=\"");
      out.print( request.getParameter("appointmentId") != null ? request.getParameter("appointmentId") : "");
      out.write("\">\n");
      out.write("                    </div>\n");
      out.write("                    <div>\n");
      out.write("                        <label class=\"block text-sm font-medium\" for=\"filterDate\">Schedule Date:</label>\n");
      out.write("                        <input type=\"date\" name=\"filterDate\" id=\"filterDate\" class=\"input input-bordered w-full\"\n");
      out.write("                               value=\"");
      out.print( request.getParameter("filterDate") != null ? request.getParameter("filterDate") : "");
      out.write("\">\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"mt-4\">\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-primary\">Filter Reports</button>\n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("\n");
      out.write("            <!-- Results Table -->\n");
      out.write("            <div class=\"overflow-x-auto\">\n");
      out.write("                <table class=\"table w-full\">\n");
      out.write("                    <thead class=\"bg-blue-600 text-white\">\n");
      out.write("                        <tr>\n");
      out.write("                            <th>Report ID</th>\n");
      out.write("                            <th>Appointment ID</th>\n");
      out.write("                            <th>User Name</th>\n");
      out.write("                            <th>Age</th>\n");
      out.write("                            <th>Schedule Date</th>\n");
      out.write("                            <th>Status</th>\n");
      out.write("                            <th>Action</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        ");

                            String appointmentIdFilter = request.getParameter("appointmentId");
                            String filterDate = request.getParameter("filterDate");
                            Connection con = null;
                            PreparedStatement ps = null;
                            ResultSet rs = null;
                            try {
                                con = DBConnection.getConnection();
                                String sql = "SELECT REPORT_ID, APPOINTMENT_ID, NAME, AGE, SCHEDULE_DATE, STATUS FROM LAB_REPORTS WHERE 1=1";
                                if (appointmentIdFilter != null && !appointmentIdFilter.trim().isEmpty()) {
                                    sql += " AND APPOINTMENT_ID = ?";
                                }
                                if (filterDate != null && !filterDate.trim().isEmpty()) {
                                    sql += " AND SCHEDULE_DATE = ?";
                                }
                                ps = con.prepareStatement(sql);
                                int paramIndex = 1;
                                if (appointmentIdFilter != null && !appointmentIdFilter.trim().isEmpty()) {
                                    ps.setInt(paramIndex++, Integer.parseInt(appointmentIdFilter));
                                }
                                if (filterDate != null && !filterDate.trim().isEmpty()) {
                                    ps.setString(paramIndex++, filterDate);
                                }

                                rs = ps.executeQuery();
                                boolean found = false;
                                while (rs.next()) {
                                    found = true;
                        
      out.write("\n");
      out.write("                        <tr class=\"border-b\">\n");
      out.write("                            <td>");
      out.print( rs.getInt("REPORT_ID"));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getInt("APPOINTMENT_ID"));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getString("NAME"));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getInt("AGE"));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getString("SCHEDULE_DATE"));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getString("STATUS"));
      out.write("</td>\n");
      out.write("                            <td>\n");
      out.write("                                <a href=\"ViewLabReportServlet?reportId=");
      out.print( rs.getInt("REPORT_ID"));
      out.write("\" class=\"btn btn-sm btn-primary\">View Report</a>\n");
      out.write("\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");

                                } // end while
                                if (!found) {
                                    out.println("<tr><td colspan='7' class='text-center'>No lab reports found for the given filters.</td></tr>");
                                }
                            } catch (Exception ex) {
                                out.println("<tr><td colspan='7' class='text-center text-red-600'>Error: " + ex.getMessage() + "</td></tr>");
                            } finally {
                                if (rs != null) {
                                    try {
                                        rs.close();
                                    } catch (Exception e) {
                                    }
                                }
                                if (ps != null) {
                                    try {
                                        ps.close();
                                    } catch (Exception e) {
                                    }
                                }
                                if (con != null) {
                                    try {
                                        con.close();
                                    } catch (Exception e) {
                                    }
                                }
                            }
                        
      out.write("\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
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
