package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import com.hospital.util.DBConnection;

public final class inputLabReport_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Input Lab Report</title>\n");
      out.write("        <!-- Tailwind CSS & DaisyUI -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/daisyui@5\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css\">\n");
      out.write("    </head>\n");
      out.write("    <body class=\"bg-gray-100\">\n");
      out.write("        ");

            String reportIdStr = request.getParameter("reportId");
            if (reportIdStr == null || reportIdStr.trim().isEmpty()) {
                out.println("<p class='text-red-500 text-center p-4'>No Report ID provided.</p>");
                return;
            }
            int reportId = Integer.parseInt(reportIdStr);

            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            // Variables to hold report details
            String userId = "", name = "", testName = "", doctorInstruction = "", results = "", scheduleDate = "", status = "", doctorName = "";
            int appointmentId = 0, age = 0;

            try {
                con = DBConnection.getConnection();
                String sql = "SELECT * FROM LAB_REPORTS WHERE REPORT_ID = ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, reportId);
                rs = ps.executeQuery();
                if (rs.next()) {
                    userId = rs.getString("USER_ID");
                    appointmentId = rs.getInt("APPOINTMENT_ID");
                    name = rs.getString("NAME");
                    age = rs.getInt("AGE");
                    testName = rs.getString("TEST_NAME");
                    doctorInstruction = rs.getString("DOCTOR_INSTRUCTION");
                    results = rs.getString("RESULTS");
                    scheduleDate = rs.getString("SCHEDULE_DATE");
                    status = rs.getString("STATUS");
                    doctorName = rs.getString("DOCTOR_NAME");
                } else {
                    out.println("<p class='text-red-500 text-center p-4'>Report not found.</p>");
                    return;
                }
            } catch (Exception e) {
                out.println("<p class='text-red-500 text-center p-4'>Error: " + e.getMessage() + "</p>");
                return;
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
      out.write("        <div class=\"container mx-auto p-6\">\n");
      out.write("            <div class=\"max-w-lg mx-auto bg-white shadow-xl rounded-lg p-6\">\n");
      out.write("                <h2 class=\"text-2xl font-bold mb-4 text-center\">Input/Edit Lab Report</h2>\n");
      out.write("                <form action=\"UpdateLabReportServlet\" method=\"post\" class=\"space-y-4\">\n");
      out.write("                    <input type=\"hidden\" name=\"reportId\" value=\"");
      out.print( reportId);
      out.write("\">\n");
      out.write("                    <div>\n");
      out.write("                        <label class=\"block text-sm font-medium\">Appointment ID:</label>\n");
      out.write("                        <input type=\"text\" value=\"");
      out.print( appointmentId);
      out.write("\" readonly class=\"input input-bordered w-full\">\n");
      out.write("                    </div>\n");
      out.write("                    <div>\n");
      out.write("                        <label class=\"block text-sm font-medium\">User ID:</label>\n");
      out.write("                        <input type=\"text\" value=\"");
      out.print( userId);
      out.write("\" readonly class=\"input input-bordered w-full\">\n");
      out.write("                    </div>\n");
      out.write("                    <div>\n");
      out.write("                        <label class=\"block text-sm font-medium\">User Name:</label>\n");
      out.write("                        <input type=\"text\" value=\"");
      out.print( name);
      out.write("\" readonly class=\"input input-bordered w-full\">\n");
      out.write("                    </div>\n");
      out.write("                    <div>\n");
      out.write("                        <label class=\"block text-sm font-medium\">Age:</label>\n");
      out.write("                        <input type=\"text\" value=\"");
      out.print( age);
      out.write("\" readonly class=\"input input-bordered w-full\">\n");
      out.write("                    </div>\n");
      out.write("                    <div>\n");
      out.write("                        <label class=\"block text-sm font-medium\">Test Name:</label>\n");
      out.write("                        <input type=\"text\" value=\"");
      out.print( testName);
      out.write("\" readonly class=\"input input-bordered w-full\">\n");
      out.write("                    </div>\n");
      out.write("                    <div>\n");
      out.write("                        <label class=\"block text-sm font-medium\">Scheduled Date:</label>\n");
      out.write("                        <input type=\"text\" value=\"");
      out.print( scheduleDate);
      out.write("\" readonly class=\"input input-bordered w-full\">\n");
      out.write("                    </div>\n");
      out.write("                    <div>\n");
      out.write("                        <label class=\"block text-sm font-medium\">Doctor Name:</label>\n");
      out.write("                        <input type=\"text\" value=\"");
      out.print( doctorName);
      out.write("\" readonly class=\"input input-bordered w-full\">\n");
      out.write("                    </div>\n");
      out.write("                    <div>\n");
      out.write("                        <label for=\"results\" class=\"block text-sm font-medium\">Test Results:</label>\n");
      out.write("                        <textarea id=\"results\" name=\"results\" class=\"textarea textarea-bordered w-full\" placeholder=\"Enter test results\" required>");
      out.print( (results == null ? "" : results));
      out.write("</textarea>\n");
      out.write("                    </div>\n");
      out.write("                    <div>\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-primary w-full\">Completed</button>\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
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
