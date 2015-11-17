
<%@ page session="true" %>
 <% session.removeAttribute("username"); 
session.removeAttribute("password");
session.invalidate();
response.sendRedirect("index.html");
  %> 

