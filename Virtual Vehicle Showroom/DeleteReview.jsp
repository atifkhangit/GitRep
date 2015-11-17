
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<% 
     Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ora11","tiger");
   String revId = request.getParameter("revId");
    String sql="delete from review where rev_id = ?";
    
    PreparedStatement st = con.prepareStatement(sql); 
    st.setString(1, revId);
    st.execute();
    
    
    con.commit();
    st.close();
    con.close();
 response.sendRedirect("VendorManageReview.jsp");  
 
 
%>
