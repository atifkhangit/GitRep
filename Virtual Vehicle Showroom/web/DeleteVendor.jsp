
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<% 
     Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ora11","tiger");
   String vendor = request.getParameter("vendorId");

    String sql1="delete from vendor where vendor_id = '" + vendor + "'";
  
    PreparedStatement st1 = con.prepareStatement(sql1); 
    st1.execute();
    con.commit();
    st1.close();

 response.sendRedirect("AdminManager.jsp?Category=2");  
 
 
%>