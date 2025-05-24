package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class signupSuccess_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"UTF-8\">\n");
      out.write("  <title>Registration Successful</title>\n");
      out.write("  <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">\n");
      out.write("  <style>\n");
      out.write("    /* Optional inline styling if needed */\n");
      out.write("    #success {\n");
      out.write("      max-width: 600px;\n");
      out.write("      margin: 100px auto;\n");
      out.write("      padding: 20px;\n");
      out.write("      text-align: center;\n");
      out.write("      background-color: #f4f4f4;\n");
      out.write("      border: 1px solid #ccc;\n");
      out.write("      border-radius: 4px;\n");
      out.write("    }\n");
      out.write("    #success h1 {\n");
      out.write("      color: #005a8d;\n");
      out.write("    }\n");
      out.write("    #success p {\n");
      out.write("      font-size: 16px;\n");
      out.write("      margin: 20px 0;\n");
      out.write("    }\n");
      out.write("    #success a.btn {\n");
      out.write("      text-decoration: none;\n");
      out.write("      color: #fff;\n");
      out.write("      background-color: #005a8d;\n");
      out.write("      padding: 10px 20px;\n");
      out.write("      border-radius: 4px;\n");
      out.write("    }\n");
      out.write("  </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("  <section id=\"success\">\n");
      out.write("    <h1>Registration Submitted</h1>\n");
      out.write("    <p>Your registration has been submitted for administrator approval. You will be notified once your account is enabled.</p>\n");
      out.write("    <a class=\"btn\" href=\"index.jsp\">Return to Home</a>\n");
      out.write("  </section>\n");
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
