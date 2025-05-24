package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import com.hospital.util.DBConnection;

public final class userRequestManagement_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<head>\n");
      out.write("  <meta charset=\"UTF-8\">\n");
      out.write("  <title>User Request Management</title>\n");
      out.write("  <!-- Tailwind CSS (and DaisyUI optionally) for styling -->\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css\">\n");
      out.write("</head>\n");
      out.write("<body class=\"bg-gray-100\">\n");
      out.write("  <header class=\"bg-blue-600 text-white p-4\">\n");
      out.write("    <h1 class=\"text-xl font-bold text-center\">Approve User Signup Requests</h1>\n");
      out.write("  </header>\n");
      out.write("  \n");
      out.write("  <div class=\"container mx-auto p-6\">\n");
      out.write("    <h2 class=\"text-2xl font-bold mb-4\">Pending Users</h2>\n");
      out.write("    \n");
      out.write("    <div class=\"overflow-x-auto\">\n");
      out.write("    <table class=\"table w-full border-collapse\">\n");
      out.write("      <thead class=\"bg-blue-600 text-white\">\n");
      out.write("        <tr>\n");
      out.write("          <th class=\"py-2 px-4\">User ID</th>\n");
      out.write("          <th class=\"py-2 px-4\">Name</th>\n");
      out.write("          <th class=\"py-2 px-4\">Email</th>\n");
      out.write("          <th class=\"py-2 px-4\">Status</th>\n");
      out.write("          <th class=\"py-2 px-4\">Action</th>\n");
      out.write("        </tr>\n");
      out.write("      </thead>\n");
      out.write("      <tbody>\n");
      out.write("      ");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT USER_ID, NAME, EMAIL, STATUS FROM USERS WHERE STATUS = 'pending'";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            boolean hasRecord = false;
            while(rs.next()){
                hasRecord = true;
                String userId = rs.getString("USER_ID");
                String name = rs.getString("NAME");
                String email = rs.getString("EMAIL");
      
      out.write("\n");
      out.write("        <tr class=\"border-b\">\n");
      out.write("          <td class=\"py-2 px-4\">");
      out.print( userId );
      out.write("</td>\n");
      out.write("          <td class=\"py-2 px-4\">");
      out.print( name );
      out.write("</td>\n");
      out.write("          <td class=\"py-2 px-4\">");
      out.print( email );
      out.write("</td>\n");
      out.write("          <td class=\"py-2 px-4\">");
      out.print( rs.getString("STATUS") );
      out.write("</td>\n");
      out.write("          <td class=\"py-2 px-4\">\n");
      out.write("            <!-- When admin clicks Approve, call the servlet -->\n");
      out.write("            <form action=\"ApproveUserServlet\" method=\"post\" class=\"inline\">\n");
      out.write("              <input type=\"hidden\" name=\"userId\" value=\"");
      out.print( userId );
      out.write("\">\n");
      out.write("              <button type=\"submit\" class=\"btn btn-primary\">Approve</button>\n");
      out.write("            </form>\n");
      out.write("          </td>\n");
      out.write("        </tr>\n");
      out.write("      ");

            }
            if(!hasRecord){
                out.println("<tr><td colspan='5' class='text-center'>No pending signup requests.</td></tr>");
            }
        } catch(Exception e) {
            out.println("<tr><td colspan='5' class='text-red-500'>Error: " + e.getMessage() + "</td></tr>");
        } finally {
            if(rs != null) try { rs.close(); } catch(Exception ex){}
            if(ps != null) try { ps.close(); } catch(Exception ex){}
            if(con != null) try { con.close(); } catch(Exception ex){}
        }
      
      out.write("\n");
      out.write("      </tbody>\n");
      out.write("    </table>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
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
