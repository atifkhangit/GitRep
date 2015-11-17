
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<% 
     Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ora11","tiger");
   String regid = request.getParameter("regid");

    String sql1="delete from ora11.reguser where regid ="+"'" + regid + "'";
  
    PreparedStatement st1 = con.prepareStatement(sql1); 
    st1.execute();
    con.commit();
    st1.close();
    con.close();

 response.sendRedirect("AdminManager.jsp?category=4");  
 
 
%>
