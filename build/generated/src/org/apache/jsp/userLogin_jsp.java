package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class userLogin_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<head>\n");
      out.write("  <meta charset=\"UTF-8\">\n");
      out.write("  <title>User Login</title>\n");
      out.write("  <!-- Tailwind CSS & DaisyUI -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/daisyui@5\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css\">\n");
      out.write("</head>\n");
      out.write("<body class=\"bg-gray-100\">\n");
      out.write("  <div class=\"min-h-screen flex items-center justify-center\">\n");
      out.write("    <div class=\"card bg-white shadow-lg p-6 rounded-md w-full max-w-md\">\n");
      out.write("      <h2 class=\"text-2xl font-bold mb-4 text-center\">User Login</h2>\n");
      out.write("      <form action=\"UserLoginServlet\" method=\"post\" class=\"space-y-4\">\n");
      out.write("        <div>\n");
      out.write("          <label for=\"userId\" class=\"block text-sm font-medium\">User ID:</label>\n");
      out.write("          <input type=\"text\" id=\"userId\" name=\"userId\" required class=\"input input-bordered w-full\">\n");
      out.write("        </div>\n");
      out.write("        <div>\n");
      out.write("          <label for=\"password\" class=\"block text-sm font-medium\">Password:</label>\n");
      out.write("          <input type=\"password\" id=\"password\" name=\"password\" required class=\"input input-bordered w-full\">\n");
      out.write("        </div>\n");
      out.write("        <button type=\"submit\" class=\"btn btn-primary w-full\">Login</button>\n");
      out.write("      </form>\n");
      out.write("      <div class=\"mt-4 text-center\">\n");
      out.write("        <a href=\"signup.jsp\" class=\"text-blue-600 hover:underline\">Don't have an account? Sign Up</a>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</body>\n");
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
