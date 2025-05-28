package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class showPrescription_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("  <title>Prescription Report</title>\n");
      out.write("  <!-- Tailwind CSS & DaisyUI -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/daisyui@5\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css\">\n");
      out.write("  <style>\n");
      out.write("    .prescription-id {\n");
      out.write("      position: absolute;\n");
      out.write("      top: 20px;\n");
      out.write("      right: 20px;\n");
      out.write("      font-weight: bold;\n");
      out.write("    }\n");
      out.write("  </style>\n");
      out.write("</head>\n");
      out.write("<body class=\"bg-gray-100 relative\">\n");
      out.write("  <div class=\"prescription-id\">\n");
      out.write("    Prescription ID: ");
      out.print( request.getAttribute("prescriptionId") );
      out.write("\n");
      out.write("  </div>\n");
      out.write("  <div class=\"container mx-auto p-6 bg-white shadow-lg rounded-md\">\n");
      out.write("    <h1 class=\"text-3xl font-bold mb-4\">Prescription Report</h1>\n");
      out.write("    <p class=\"mb-2\"><strong>User Name:</strong> ");
      out.print( request.getAttribute("userName") );
      out.write("</p>\n");
      out.write("    <p class=\"mb-2\"><strong>Issued Date:</strong> ");
      out.print( request.getAttribute("issueDate") );
      out.write("</p>\n");
      out.write("    <h2 class=\"text-xl font-bold mt-4\">Treatments:</h2>\n");
      out.write("    <p>");
      out.print( request.getAttribute("treatmentNames") );
      out.write("</p>\n");
      out.write("    <h2 class=\"text-xl font-bold mt-4\">Medicines:</h2>\n");
      out.write("    <p>");
      out.print( request.getAttribute("medicineNames") );
      out.write("</p>\n");
      out.write("    <h2 class=\"text-xl font-bold mt-4\">Special Instructions:</h2>\n");
      out.write("    <p>");
      out.print( request.getAttribute("instructions") );
      out.write("</p>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"container mx-auto p-6\">\n");
      out.write("    <a href=\"userPrescription.jsp\" class=\"btn btn-secondary\">Back</a>\n");
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
