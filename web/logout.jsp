<%@ page language="java" %>
<%
    session.invalidate();
    response.sendRedirect("adminLogin.jsp?msg=Logged out successfully");
%>
