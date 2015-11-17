
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<% 
     Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ora11","tiger");
   String user = request.getParameter("usern");
  String admin = request.getParameter("admin");
    
    
    String sql2= "select admin_id from ora11.administrator where username=?";
    String sql3 = "delete from ora11.vendor_temp where username in "
            + "(select username from ora11.vendor)";
    
    PreparedStatement st2 = con.prepareStatement(sql2); 
    st2.setString(1, admin);
    ResultSet rs = st2.executeQuery();
    while(rs.next())
    {
    String adminId =rs.getString(1);
    String sql1="insert into ora11.vendor (vendor_id,first_name,last_name,phone,email_id,street,city,state,zipcode,country,"
+"username,password,creation_date,manages,managed_by) " +
"select seq_vendor.NEXTVAL,first_name,last_name,phone,email_id,street,city,state,zipcode,country,"
+ "username,password,creation_date,manages,? from ora11.vendor_temp "
            + "where username = ?";
  
    PreparedStatement st1 = con.prepareStatement(sql1);
    st1.setString(1,adminId);
    st1.setString(2,user);
    }
 response.sendRedirect("AdminManager.jsp?Category=3");
         

%>
