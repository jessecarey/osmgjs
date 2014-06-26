<%
session.setAttribute("type", request.getParameter("type"));
response.sendRedirect("chart.jsp");
%>